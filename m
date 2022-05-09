Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353D5C4321E
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 10:47:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.30067.1652093245541213050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fizt6XLe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id x18so18865153wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=drm9tvEBPweMMtVX7ZdEpvOhM6Avu8V8eY+ZEz6VkNA=;
        b=fizt6XLeBVi8qRv4P2+ufNuPdk0EsUU3yBo1BR1Deu+K0F7gnDahGn1CscjsLWzQhF
         Y3gySqvF4t/yJcAs1sEVF4z+cezL/SjnUywkMepwFn5QO5KPE1pPhiiagXu3hA8ynQv/
         nczzGpLNsgvl3/vhazjWPHx/CmImFNQvsTzD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=drm9tvEBPweMMtVX7ZdEpvOhM6Avu8V8eY+ZEz6VkNA=;
        b=m4BsuX8NBTD0yuN92MfQwT6ldQ5I7h4u588U7w+cfawhez5Tus0wFfoBG13y2wSWjX
         oA4dqkMbuq3zZ8R65GFafsxQWoSHDEDVCnNYRDaWinYLejVX6/RTkoY4g5MTVqV4Dwvt
         97hyqe6zHOG+tcRVX9STVs0Fjz/M2zFpXi7cyIehV4TPkcHzWS8P9k79kA1K7mlCl3bq
         3V3zV2EPM+SJRq6P1pQZ+dw2Jh0j796OHV+hMGU010ftAiBfWjQL7rpyhqLPTRLlRNxc
         8v8C272wsTecye3GSLV0ApCv90L/i2u1nK8anrPSuvwfhXTlGmvnbVx27IQs1DqGp1Gn
         uxMw==
X-Gm-Message-State: AOAM530er10FKeg5pBZSJpO8LQpgBZfaTWoyp/MBB9+lxuUT/BKksRHt
	Yk54ymu5xT3f5BkkTTfmjLGp1g==
X-Google-Smtp-Source: 
 ABdhPJwQj8V2rXnWevVhGlLjEIVsWG3Hs2g0iTaiVEQb3FTTtux03wqoAkcgu5zTAVgTZXDbR3OBQQ==
X-Received: by 2002:a5d:47a4:0:b0:20c:788b:92fa with SMTP id
 4-20020a5d47a4000000b0020c788b92famr13345535wrb.383.1652093243971;
        Mon, 09 May 2022 03:47:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9751:d995:8644:a17e?
 ([2001:8b0:aba:5f3c:9751:d995:8644:a17e])
        by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003942a244f3asm15135932wmb.19.2022.05.09.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 03:47:23 -0700 (PDT)
Message-ID: 
 <0468ba9d0f2183d504bdf4be728d50cef4e35761.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-firmware: replace mkdir by install
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, Konrad Weihmann
	 <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 09 May 2022 11:47:22 +0100
In-Reply-To: 
 <CANNYZj9hcGeyP+sE7wLFPR4TDzcrjsiCMEEBBxEQMOJjdVR0Gw@mail.gmail.com>
References: 
	<PR2PR09MB3100ABEE6886A2DD315983E7A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com>
	 <CANNYZj9hcGeyP+sE7wLFPR4TDzcrjsiCMEEBBxEQMOJjdVR0Gw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 10:47:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165395

On Mon, 2022-05-09 at 12:45 +0200, Alexander Kanavin wrote:
> On Mon, 9 May 2022 at 12:42, Konrad Weihmann <kweihmann@outlook.com> wrot=
e:
> > +Upstream-Status: Submitted
>=20
> Submitted [where] please. If it's to a mailing list, link to the
> message on some web archive.

Patch also doesn't apply against master as I think the version may have
been upgraded.

Cheers,

Richard

