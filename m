Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7097.1795734439007191987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 15:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ex+AG+wS;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e47347279so4597979f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795734437; x=1796339237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quaWzagFq0+Z/Z/6Lyx7Ee+Oitl/lypN9gfNxOGHRIo=;
        b=ex+AG+wSHZuD0ds1a74V1TIJHHGTjn4Cuy0Pnga4982DGsb7rkAe6+o/SEYuQRBxXy
         Hymgd+1ge98fQf1u+YITVe+rrxkRQNEnvFVxFOD+5sp2iRclPc/p2mZiy8Hw2dhhLdtV
         hLBaXfCrAvVBlazlPmCq8HWu7Bpun+Q3g92wygzRoYUxnl3p+/Al1yG+8PXhqC2ktcFO
         MorrxmifPFenHGTB41xEPxLu/zMZpPZjmd89P1j8XVWTWfFEHMN8vIhPY9Xbbvyheuxx
         9ODGzAnIg7LTYY+ECTUyvA+DoqfBXpW8+THeOB9QGzbsMYBiCkRRHFyzj3D7x/AFjbDf
         8s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734437; x=1796339237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quaWzagFq0+Z/Z/6Lyx7Ee+Oitl/lypN9gfNxOGHRIo=;
        b=sscsAUyrfwKwUs8U+sPLl3Xrjs+2ggdTcRqFmyFBfi0vpUzqvjG7FYaadp6R3lD5wH
         tMIoQCK/qIItyksO7f71qQUHJGk5VuExSOdyjZVkrxTvjVc44almEp/VJQDJJgzOxUqA
         p+3OrIL39MYV4depz2tmeq6jtZ3SNTmXxgCS0x/nOH3tqYuMldZddTE0COI7/zirC8X5
         80tiS81xfKl28A0K0jhbQ17cvYwbh093IarPWssOS00Hs84XPv/USUtMIar+nnRBDgXf
         oscQQvU5dd63Vqgm7g8Qz0WDpDvNjMdPK6JT5IWWoebIucIzyOQmWPUTLghBhI+r1Vdx
         Xzhw==
X-Forwarded-Encrypted: i=1; AL+hErEcEmPCHRlmlAY6/VszvDjCP1WP+9oc357kvSYfzFYNyrIjOH3hPYatD4i0CiPM2ujfkioWMdknXCWxo49co0CtAw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+9Da1C2vNAao1/3vy/yrCV6ZFOb+1E5sX1km6U1WWPKJFUVGxL
	sf0FQ6h6hjhtOx9Kwr4hGNrP/0nwtZthXhy5fMoCehSlI6DG662JMKx7
X-Gm-Gg: AZFdTZdU0rnPOCbLyf7qYycZGfrmhyyplpRMjaPNKvirefBDkBN2MMPDCOAjgxmXCXO
	6kI0kHtzEvQxI7ZTT1d6tFwOMSxt5dwAiXjAmjU0nkNc+1fm5sugmdtADqxy4/sCbsLMIJLCadR
	vVh4ZD5LvJau4UUVyrZNgQ0DUi0bUNN05WgD/VEEAteQuUTXPKSM7AR5ZTdr0nuGxK4FnJe2SS+
	QGBhn2fxQ1Ecp9QbdKH5IF44AislBfrYuYikGNmnhqfWLUGmMfgTbpY7OKneDwFKn7RR2F0eVjo
	Iic+aKt8nrnReNqdlDXoilTl+ckqVOOWL1JH72VuB2VnE/7DyjSwT26NmTn/qdV/ika1Hmc2wUL
	dP/T/8JlKcbZDHv5mCbXkmcUHQb52ytAOQ6xgh5RTkzeayCKkv2nTD1oj+7vkVkp7VjoUB0ey4t
	UKbKbKF2jXdMpadx8HqX3bAIZpuGwMGiJaB0DDIqcYAu17jQVNp5+AX8/iunzLKHPbfdnduFVxm
	IaZDnSgJczAYDYIuKXqr7wljb/vbj0tC/8XJ6x0u1TWnOCNbHbfGUmLFPFJ3tq7MMMTM0Q6NCmX
	dk7xRShjkrM=
X-Received: by 2002:a05:6000:4812:b0:4a6:bc53:247f with SMTP id ffacd0b85a97d-4abb7d45e6cmr39487357f8f.48.1795734437182;
        Thu, 26 Nov 2026 15:07:17 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm41951443f8f.30.2026.11.26.15.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:07:15 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: stefano.tondo.ext@siemens.com,
	openembedded-core@lists.openembedded.org,
	Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: Re: [PATCH v4 4/4] oeqa/selftest: spdx: Test crate identity, scope and output PURLs
Date: Fri, 27 Nov 2026 00:07:14 +0100
Message-ID: <20261126230714.2707237-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <DN56EKP8RI3N.UY4F4DI6PFGI@pbarker.dev>
References: <20261125183613.1335718-1-stondo@gmail.com> <20261125183613.1335718-5-stondo@gmail.com> <DN56EKP8RI3N.UY4F4DI6PFGI@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 23:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251333
Content-Type: text/plain; charset="utf-8"

On Thu Nov 26, 2026 at 1:27 PM GMT, Paul Barker wrote:
> I think this needs to be a simpler test recipe, preferably one with a
> fixed version to avoid it failing due to future upgrades. I know you've
> already replied to my previous email, but I'm not so sure that the
> dependencies of python3-bcrypt will always remain as this test case
> expects.
>
> Perhaps we should use an artificial test recipe here instead.

Hi Paul,

OK, I will change it. In v5 the tests use hello-rs from meta-selftest,
which the devtool tests also use. It has a fixed SRCREV and fetches
one crate, figlet-rs 0.1.5. The tests compare the SPDX with these
fixed values. The rpm-sequoia test goes away with the scope patch.

Best regards,
Stefano
