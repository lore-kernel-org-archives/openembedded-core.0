Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96929C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 12:42:59 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.40951.1674477769308999231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 04:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HiMruR/J;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id f34so17939839lfv.10
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 04:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpz91JuUuSpYt4+RH1SatD+hnIm4h8Fz+x6WyYG8WQw=;
        b=HiMruR/JJ7dBS/XXfqTCsmc05c19KUEkZrC7Q4aJqHxQqgGKpnEgPocFfisk58Bxk+
         wzSHF2tdNAR2jtpDHdaEAKGxb/evQvDuJajLmYp5/+xTbdzEK3MHuo+UelCR1jEgI5ux
         SUXfOjf5hT9irRzYWJGdo/BBZSkvFkjUTtD2RELModFub86jqu7479sCJZaUjOapRJPT
         hDZUBtyPP7ZdLxbRBRz37BLzKVlpv90ZxBXKPuCa9Bq+C4NlRV4oWWy/LmCHnCZDxKTC
         OePSRWbbAGWDJwJEqT4sJeLip/XS3EHq8eSurL/16QZg+DEosA1eGzaWvxE84WpvgvYz
         6s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rpz91JuUuSpYt4+RH1SatD+hnIm4h8Fz+x6WyYG8WQw=;
        b=4lhMOJmFW5hQJ6jO/FG2qlBHBnspj/l3PrO+PnqRwpF23vtjRCYUcdDN6osWO1o+Uj
         WzJ9OWeeKutstRN+uRbXAoasereBsWQYsQseMLKThvII4fGA5yp6DTjXqJVJzoQwe0go
         6ntgghdLzyw4B9ho4P+cyjbHjborm6ZIwXNWF3nz74cXpoxNoZcst1khrrcVtB90ndfA
         tgZJX1q7wEdnglaZuT1sjivjTILPQjrxA+6YwUdhR/jKng+UA2k1cTPvTgaPHxPRzolh
         XGgr3roDKvORwaaZCNIEtkj0ohTAFxC0nWLaXOGsfbWEICNY0ThfVls2q1cAbWb9e6Yu
         6ARA==
X-Gm-Message-State: AFqh2koH5LcZs3H42F0rAnau8RtPk6h/a12yKb2RCZ2ij3/gaqec1832
	SmtVZvwMnwePgHP9fhLlBcMXjoC5REMYWerciMI=
X-Google-Smtp-Source: AMrXdXtQYAqB2RftpZ2rh3fqh3yZjRBtMhTSYOsuhZXQSKe4mfEqLfkvWjpHpyx4xf8DbU/bhAfNTvt/yToO6Q5hlM4=
X-Received: by 2002:ac2:488c:0:b0:4b5:4502:1323 with SMTP id
 x12-20020ac2488c000000b004b545021323mr1441100lfc.345.1674477767278; Mon, 23
 Jan 2023 04:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20230122120427.D9CF696035B@nuc.router0800d9.com> <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
In-Reply-To: <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Jan 2023 13:42:35 +0100
Message-ID: <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 22 Jan 2023 02:00:01 AM HST
To: Ross Burton <ross.burton@arm.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 12:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176302

On Mon, 23 Jan 2023 at 13:40, Ross Burton <ross.burton@arm.com> wrote:
> > CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-3550 *
> > CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2022-3551 *
>
> These are fixed in xserver-org 21.1.6, I=E2=80=99ve mailed to get the CPE=
 updated.

This is quite often the case, perhaps those weekly reports could
include a pointer on how to do that?

Alex

