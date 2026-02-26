Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71AEFD9E1E
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 22:55:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83088.1772146519142967823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 14:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fE4LW+AJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-480706554beso17068005e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 14:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772146517; x=1772751317; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCPVgyX8UcXa1xu9yvnu3yjSENA6xvF4CqN3ZZh1T0M=;
        b=fE4LW+AJqpiuVDwosijrgNqsYd6BnGcRF7QofeYAzP8u0egQRlWFHnp30ZGzIhlFhe
         nOnDpp4Q0SbVmMOEi7o2ZTp9qCmwOtx6kynWTCVNSDMAk98qVdw0APLBW3hWob/T118L
         2zgpGN/ULmbN0DGe2WTtoGjORb1zWHESUZg4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772146517; x=1772751317;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCPVgyX8UcXa1xu9yvnu3yjSENA6xvF4CqN3ZZh1T0M=;
        b=p43l8MehdQPES2rgGkcvoV7MrKCjw3xrdri3ZuQD/Qcf9icDH7NrBGZQOuQ0fa1uqu
         xHeIi4Av4sZv7o+DCstPEAOv5Fnjrv41mqTwnkVv5wwjEaegUhnOO57eQVnw8Rso/fkP
         OBMDtyIZQjZFTC+K4Hce1msVo9m+XhoUtS/sPbiq9U9I/qM5NzEBgQv1Nz+KLtSA/LGG
         Yoyko4WlnIgEdXxs0gQn8t52BRiaVLPfi5JlgfIPgDtwSoz1Rra3umps6EgEuNa8s9Od
         JLpiZ77A3SAOs5fm/XshMODm+3Y4WUB/XqYVCqFAUjzyhCbk7g5dbLzWKSSrLdD3X2N5
         nydQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPF6KYBaj51QtcduF3pGr5EwuKFrTiT61eC03+sPsSy4L/Sy1H/ZqSfZCYmW1721y+ZYWM3QJyLq2VrUkeCO1ERQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLmLUY6Zex/z2UH3I3wsD73bNHbha3OFPScZoYEaDCW2VLQGnG
	LU7BqEMeyAyBQZLHhUoj14MD8S9AaY585yS8gQpFh5GZt+OytW8aup1n4priJuuAHHg=
X-Gm-Gg: ATEYQzwHwhJNbq+ZXILtTsf+vV3cdF4jc07JPiNtRAguXVE0tLJdMZ3FuVm4Fu+Sw5t
	Qt6e+tv6cclKtQymfkm/JTDGfoipS92t33nVPzjYlvNRDIMO4cgiAOsoSKukbO5cT7j1p+a14ye
	3+liR6tviYpr9ETjKqHWI1JBLKWatTPbN1sVjB7KAuLP40QMlj5y8afO3EuCDLBdwua0vvTReNr
	lExe8tPdq0NXpLIPkQGhByUv8xc2fSM0MEJ5qbq1ckYIDnTMx6pJV9rCuQr8pmnmKwS/khqK8As
	QyR2Vpvq47avmeQV74oOT2PFn//C+hYKXBQ8qqgYRh0Fx6LPTF580Zmhu+jlvltpPeTkGOoinS5
	bEyBGzqDDFbvVrheVgVtGQTxmpICmeCi7W1pF6/SzoMc3Ly6w9XQcvOQ9nCuykkEm4DAJaRbr+T
	wBtNRjJMYyVl7jDm6znpG5QJspon6XG6QMKBjKZXzfbHx/z4eWXuppIzi0+z9LR+RXrbwO+u/DQ
	fKOPse8xz48PZVl
X-Received: by 2002:a05:600c:8711:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-483c9b970a5mr8300375e9.7.1772146517493;
        Thu, 26 Feb 2026 14:55:17 -0800 (PST)
Received: from localhost (2a01cb001331aa002c0b752a8b25831e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2c0b:752a:8b25:831e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765c67sm2456313f8f.32.2026.02.26.14.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 14:55:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 23:55:16 +0100
Message-Id: <DGP9IEX5L6UC.66539CSR4KNP@smile.fr>
Subject: Re: [OE-core] Net-snmp upgrade to 5.9.5
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <feroz.afshan@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <CA+ZN1cdtUfAf9b36tpvye9JxgsUSgm28c5C-4WZ3VzTMXMJzcA@mail.gmail.com>
In-Reply-To: <CA+ZN1cdtUfAf9b36tpvye9JxgsUSgm28c5C-4WZ3VzTMXMJzcA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 22:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232066

Hello,

On Tue Feb 24, 2026 at 3:50 PM CET, FA via lists.openembedded.org wrote:
> I would like to know if there is a plan to upgrade net-snmp to 5.9.5.

FYI, net-snmp is in meta-openembedded/meta-networking, the correct
mailing list to use is openembedded-devel@lists.openembedded.org.

> I see that we backporting all the vulnerabilities and important fixes to
> 5.9.4 in LTS branch (scarthgap).
>
> As per NVD, it recommends upgrading  to 5.9.5/5.10.pre2 to address
> CVE-2025-68615.
>
> https://nvd.nist.gov/vuln/detail/CVE-2025-68615
>
> Since vulnerable tools report, net-snmp 5.9.4 is vulnerable to
> CVE-2025-68615, despite the fix is backported to 5.9.4, raises a false
> alarm among users.
>
> I think it's better we upgrade LTS branch NetSNMP to version 5.9.5.
>
> Regards,
> Feroz Ahmed

Regards,
--=20
Yoann Congal
Smile ECS


