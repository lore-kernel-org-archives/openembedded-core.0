Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3E1C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 05:22:06 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web09.3155.1641360125356182031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 21:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e58djSZf;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id v14so49439557uau.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 21:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jX9JXLgAxHBcIgShqm2Qs5SJgtrMfF0halR5ReXQsNA=;
        b=e58djSZfTCQXotrxDOtjTrbVAVgTpQYbxZX8RJ5q4a0RTpDiexGH3kLCZMKUyLrO4+
         n8DOeTySyx4zhJ6jbagjXvQa24wkrG/UTXGVsrQaztaknpDKvW8LNU8+xO6QN7cV2+aQ
         creCsKTSaDLYN2mgJrStXDCbsOdImPQ9JqPKZWGBxKkC6XGByQIzhZ6q2ky/fhkSvO2U
         Im1aZeKTJ3Jmrggfmk163yqhPZEdjjQ8fOYfdi6rZbA9PaNMcxXeEKpjiucjjav84DJa
         grxAC9+JjPJLdUt+k4AaUOROCuPdJ1P5Z5UygnSva4RbQ5Abl/rEizfPRn/BtcCShy2K
         Hnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jX9JXLgAxHBcIgShqm2Qs5SJgtrMfF0halR5ReXQsNA=;
        b=ZLdM9EiiRh/tUSZEcbC2YNlqMd8+PBewfsTU2jxmdy6+yaDNO1gMxfK66bVOblhBV/
         kwOwKT8cZz/MxZkAk+BeRBgPzuqT7EHIJmSIDvOSGlzWCyZUXD7UfT0cnrywU5S4N5gg
         oAkFDekZMckCPXSCLysluLPRTm2kr31pUDrNvp2axikBMq4EpJ6v2kv6avZ51grRXkKO
         2h6gSnz5NbkaLpT+IsyHda1bmq8jlVOKPrdEp96WvS/xUPRJn6v7tZ38RapTlXVRDXui
         skGvpG07u/+6e3i50VrqEPge+avxX8lmHjbYA0yvzpS36gj4ldDjViu68rEpOyND/GdA
         U2xg==
X-Gm-Message-State: AOAM532KR2f8R+Q3cf1l+dBx3NDIugMXcJ05GNcTpRaKAAv9XxaY13Oc
	ZzhjaYxBw6aeoHiqrTdRTd8Of+PY9FS7mH4xgMo=
X-Google-Smtp-Source: 
 ABdhPJw1L0N6XLotWwScM0MF2injtaz1UkNK3tYjejbiBDebOLDllNlTcaWXos+EDazM6fR1o5dJPCgzZyIR+1riLv4=
X-Received: by 2002:a67:d51e:: with SMTP id l30mr16222197vsj.1.1641360124480;
 Tue, 04 Jan 2022 21:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20211229091347.42742-1-pgowda.cve@gmail.com>
 <157279ea591a9196346145e75d2beaa256713828.camel@intel.com>
 <CAMKF1sqN3kmkQ8JB2gskJhO=HVhXq9rCRD_Qh8A6YUTyOKYDqQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqN3kmkQ8JB2gskJhO=HVhXq9rCRD_Qh8A6YUTyOKYDqQ@mail.gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Wed, 5 Jan 2022 10:52:01 +0530
Message-ID: 
 <CALY4984GH-dsRPTCn1JB1U5sSWUswFmLmdYsdoYS8VRqDrS_GA@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] gcc: Fix CVE-2021-42574
To: Khem Raj <raj.khem@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>,
 "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 05:22:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160177

Hi Khem Raj,

> Key is When git send-email asks for UTF-8 encoding for the patch then do =
not enter =E2=80=9Cy=E2=80=9D but just press
> Enter

Thanks for informing about the method to post UTF-8 format patches.

Posted the patch as per your suggestion at :-
https://lists.openembedded.org/g/openembedded-core/message/160175

Thanks,
Pgowda

