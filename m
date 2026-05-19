Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B66CD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:12:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16024.1779174729190650352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fJyC5JXL;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so25754865e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779174727; x=1779779527; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UmVKd7miBs62iT8HP3kSLtziVcnvG1tm2F7L8nUK3I=;
        b=fJyC5JXLo2nn/41kiFgPnOn3saF/v885vFYfSpvCuGS3VFdw4VB3L4KgxbvNPT/Urq
         1CQ2RNJhp6+h7tQ6Ieux5vOItXSsnSXYBTh/VfhcTlAQWCJbafgzvOyOxZ4iL+70hMU5
         NnVm01Uf6ZLVORsrXc0IqzLBV0T023BBAHW7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174727; x=1779779527;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UmVKd7miBs62iT8HP3kSLtziVcnvG1tm2F7L8nUK3I=;
        b=eZTPVJLw7YGBsuEqGDrEp7+pF/+gy83vObjOuwPGfLdNmkwBNgiFOlHO/dOPcKSsxZ
         zR+WQtNQ5SMIcd7x1F/CBIrKJXnN6laSgS+7+Jl61IF946q74Y023IJjqjYem0NCRTQO
         yZ4sFlKLE/KyjLBCO4bQ++PeaNvI/XYHB0DyrjmVUe1+m18HQHBrA321p93S4GI06v28
         /ObMnwBy+LIpngmZZ1nTIXKc8N3bu+qUcRLhSYbnzt9ipVAZ2hs3Faq2ccfzWX068ouz
         hysrot9CKVG5mGkjodJHWXntuecHvrFbOulAUoKW5a9BiYEnEbwGDUF/MkHYXW2XlkZX
         PPYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MNq4OeIfkg6NkpBXmG4S+AASJ+RcIp1hiip0EZcZd20BdS0+q889WBfCsaRHOVcKX2rK1V/xL8PakZjoq1HLTKw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzpohqE38iHwd99xnYUMghKJw4Mr7Grm7cW2q/8HifMbx0YtyLw
	pCx/fJG+Fk+3AVE8CU/h8qe+6Nx+UH7TBNupeOjGpFAHgFh5yP64I5ZGqNPuOPKBcdY=
X-Gm-Gg: Acq92OHoIek/yyhhiBRf5z27UFn4gzYTJ8ziWQFFm1BVcmecbZEYKLLWMtCCNCQiBV7
	RWOLp7MAp2pONP9lgRRdnTzGjMXfJ/4V90+o1N6MuRTPJVpgxOImmyDh/8tM0dsYIrWet8FhPpA
	DBvijOI7oAGBIrToCrD3AQQ5hdQ4a/Vkm0Je6gT2Mc4PIE7SVn4jVhbTPudaiytzzGBv+TTwmJC
	qNJ0784YO1NDkhv9XMIC4ld6lWxajcNMDpteW/JlG4Xad7QFnSVwOe+gBZ4cSD1zcp20WJhHwz4
	RtRCOsqlrd28665hhi7mzEoi77o3p5HPl/lL67fIM44LZ/SQB8kOx/nYHhidNqykrucR8HcBPig
	aGBdcjc3QnvxGTR4U2IIuc7TY9yr7Q6BlVmvb+FUXDimiGVTCMpwF9D+DqYn+ctNcmOkWgCjYdO
	rgbcgs+V+Db3fEUbUJDDLoo2nFduhZFOovEpatT6hmuBmnWeKmQRQlcWGmX25VcKxtpdbQzjhat
	31gbvVhWYZxhRY=
X-Received: by 2002:a05:600c:49a7:b0:48f:e230:8caa with SMTP id 5b1f17b1804b1-48fe6898854mr172590715e9.30.1779174727398;
        Tue, 19 May 2026 00:12:07 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm42722780f8f.14.2026.05.19.00.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:12:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 09:12:07 +0200
Message-Id: <DIMGSY8AJN3W.3BHLPWMK3CW5H@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Aditya.GS@bmwtechworks.in>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] PATCH gawk: ptest: disable randtest due to
 nondeterministic behavior
X-Mailer: aerc 0.20.0
References: <PN0P287MB12212AB74C67E209174CD01BF9002@PN0P287MB1221.INDP287.PROD.OUTLOOK.COM> <PN0P287MB12216100F6BD06F97EE239DDF9002@PN0P287MB1221.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN0P287MB12216100F6BD06F97EE239DDF9002@PN0P287MB1221.INDP287.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237274

On Tue May 19, 2026 at 7:40 AM CEST, Aditya GS via lists.openembedded.org w=
rote:
> Hi, Sorry, I forgot to mention the bug reference in my earlier mail.
> This patch is for Bug 16254. This is v2 of the patch that disables the
> randtest in the gawk ptest suite. This version includes the detailed
> debugging analysis showing that the intermittent randtest failures are
> caused by sensitivity in the statistical threshold used in the
> autocorrelation check. Small variations in sigma, floating-point
> behavior, entropy availability, or timing conditions (particularly on
> QEMU / autobuilder) can cause abs(corr[tau]/sigma) to exceed the
> threshold even when the randomness is valid. This aligns with the
> AB-INT failures reported in the autobuilder.
>
> Thanks,
> Aditya GS

Hello,

Thanks for the patch, it looks interesting but:
* Can you follow instruction at [0] to setup git-send-email to send
  properly formatted patches (yours is an attachment whereas the
  supported format is "inline") ?
* Use "[YOCTO #xxx]" to reference the bug you are trying to fix
* Fix you upstream discussion reference (either add the link or remove
  the reference)

[0]: https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.htm=
l#sending-the-patches-via-email

Thanks!

>
> ________________________________
> From: Aditya GS
> Sent: Tuesday, May 19, 2026 11:06 AM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: PATCH gawk: ptest: disable randtest due to nondeterministic beha=
vior
>
> Hi, This is a patch for disabling randtest in the gawk ptest suite. This =
version includes the debugging analysis.
>
> Thanks,
> Aditya GS


--=20
Yoann Congal
Smile ECS


