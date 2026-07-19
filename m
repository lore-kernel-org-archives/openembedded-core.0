Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EBFC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 22:21:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.481.1784499685112236808
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 15:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U3zov5SG;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954afac04bso20479415e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784499683; x=1785104483; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQfLOlnFAjB3lRhQ1k10j2AbLpI4NvlDjI7ALV9UR8c=;
        b=U3zov5SGX9/mC8ENimEza/OamnA7HPEJvIhXJKCZRRFmAPUA1oNAokfXKC0ud0qVS/
         c3qObCNMnDomYL2qUcDEer2FuZqWjDTO8a5N8sYEXvFQr22KmhPiOP0f16Mz3FPRmwgy
         COHsdnPJqwv49zDQsg3/WZFylYGIbEPU0kxQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499683; x=1785104483;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kQfLOlnFAjB3lRhQ1k10j2AbLpI4NvlDjI7ALV9UR8c=;
        b=EAGCboYFKqTj1fuEcvSYkHpXb9R63jcvAKweQU24hEyuOOKgJUc3X2vcJ+6GxzJ4RQ
         m+bXTWEDAw2y1tjmPQfsbrrfjkB+gs8msFR1nTKvb15t82dk5GD7yl8sPGY8PTXiUueg
         KmdtwHxBe3apJB7bL0/3ac6qInzRAhkPZDMv9oGbfngOEt3mdMvd/DCxshC5L05lY3z0
         4rLBsRvnFXq/iTeOss5dVCrpLdsrXQgAB8GL7v1J9DNP91I5pGaLDJ8HfY6cbP7C+3Ng
         E7H6ZY3HK9JPUshHzaT2Pb3UmFZiIEh0ASyhhi664HewTceKfZpI9TmLxxLo0UhvVU23
         pRWA==
X-Forwarded-Encrypted: i=1; AHgh+RprPh+TzVlqut+oCavOaoEl0IwqcdrvkQUlv3RXt9WDTjrcpkfly6FINSMbPFPL0C+ka+DEOnmO6miVShLY+WCvYw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOewTwOQiSaMDBlKdn0gKMa06c3/ruB+huqFQXn2K73jNLZNbZ
	qiYADrE/jEZ7unYTnVzMVMIjL8SaMgY1e3B/ADiDfAR1VCkFgXdTGvqPMOHlHzZRGNge4KfHltz
	wjQNtauJY1g==
X-Gm-Gg: AfdE7cnp4RJ5d+Hcpl1cWDQdwplW5rV0e8eaEZXt+dcTtiKZVl3kutRY+bagq4rY3fR
	/lByu4A36dRG9chQ0qkLdV5EEwDw+Jv7hrdh+oRvi1EYTkF8VoNUWFhjQi8RHB1viO51PRZUmTF
	CpqWhNsfrH1IENMtFRT2ebh0QNjDeK4ZVRfCj2l3TORyKPisRi6KDd1hn6z/yUZfxKoc5MaBdKk
	dfsH3cO4YOwFhvr+rhov6e55Au96eFAEMxgDaVhpcdinjdT1jCnu1XhtDW4DTJNWLPB1Z+BqzxN
	KelWNR+hxVnzAS/oGtOUwv0ku1U3bE4hKWaKKcsqnhpql3Z+TNuQ0c51qRu2rWOiVyad3snhSzA
	EVPspsaMpDEam5gjevyDs5ukhtfFbMoPja5fCrSHJs5ab+RBDu12r/T1H6qeTjK9dSHQmxmAYib
	IYtaEacmy72tL6ONibTVAmce19PoO84xPIbHcaLx8FyUnFXnzv1IBpUbLUzT7IOvxn1NA=
X-Received: by 2002:a05:600c:4584:b0:493:f5bf:4da4 with SMTP id 5b1f17b1804b1-4954a50e970mr126133365e9.28.1784499683359;
        Sun, 19 Jul 2026 15:21:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e02043sm224256315e9.1.2026.07.19.15.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 15:21:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 00:21:22 +0200
Message-Id: <DK2WCCX2M98E.292ZS2S1QFM96@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2] libpng: Fix CVE-2026-34757
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260714134636.2883793-2-sudumbha@cisco.com>
In-Reply-To: <20260714134636.2883793-2-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 22:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241308

On Tue Jul 14, 2026 at 3:46 PM CEST, Sudhir Dumbhare via lists.openembedded=
.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> These patches apply the upstream fixes [1][2], which address
> getter-to-setter aliasing issues in libpng chunk setters that could
> cause stale-pointer reads, as described in [3].
>
> [1] https://github.com/pnggroup/libpng/commit/398cbe3df03f4e11bb031e07f41=
6dfdde3684e8a
> [2] https://github.com/pnggroup/libpng/commit/55d20aaa322c9274491cda82c5c=
d4f99b48c6bcc
> [3] https://github.com/pnggroup/libpng/issues/836
>
> Reference:
> https://security-tracker.debian.org/tracker/CVE-2026-34757
> https://nvd.nist.gov/vuln/detail/CVE-2026-34757
>
> Test results on qemux86-64 using ptest-runner:
> START: ptest-runner
> 2026-06-04T11:29
> BEGIN: /usr/lib/libpng/ptest
> PASS: tests/pnggetset
> Testsuite summary
> # TOTAL: 33
> # PASS:  33
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 0
> # ERROR: 0
> DURATION: 80
> END: /usr/lib/libpng/ptest
> 2026-06-04T11:31
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
> Changes v1 -> v2:
> - Rebased on latest scarthgap (2bf388381ae3)
>
>  .../libpng/files/CVE-2026-34757_p1.patch      | 521 ++++++++++++++++++
>  .../libpng/files/CVE-2026-34757_p2.patch      | 484 ++++++++++++++++
>  .../libpng/libpng_1.6.42.bb                   |   4 +-
>  3 files changed, 1008 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p=
1.patch
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p=
2.patch

As fas as I can tell, this patch is also needed on wrynose.
I can't merge here until this is fixed on wrynose.

Can you send a patch to fix this and then, ping back here?

Thanks!
--=20
Yoann Congal
Smile ECS


