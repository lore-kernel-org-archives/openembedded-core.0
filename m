Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730EBFCC062
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:54:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2159.1772823264867891707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o/hw14D7;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso87913815e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 10:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772823263; x=1773428063; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp8LAGhEn+rlDrAhIbdkt18w6XoZzx3ID0Dn/rvpVVI=;
        b=o/hw14D76AESK+2tmz0cgzzWLVg9A2gXl+F4bmRD4Rr4vndeh7QAPcUY8pykveuOAK
         S/LK32jE43dC9y2WksYJmbG60h07znoJm9A20s3izh/9PVF7JbwDvkKo1NPj04VgnuTs
         on8ervosQcEgHxdHuI40o6Jw92jNHdWkvODUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823263; x=1773428063;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fp8LAGhEn+rlDrAhIbdkt18w6XoZzx3ID0Dn/rvpVVI=;
        b=dJ/bJSRBZJ/ST/EZ0eI8B+YDT5AEzYpujImZMfnPWb0k+zsPD+WEjRAwG0kf+4Jfpx
         05qW4d33nAZLdfaoiKXRQxl5YwJvXgP+A3ecq0OZFoGvEKYUIViveeZk/TMhJqN4nqot
         KZuIm7nNuqmHYd67IkqtQ8MsGr7W/DamBAJwcy1EYJwyAEMBdc3p5twgTaWOSl9BHTU5
         mB4aNmQrjBOAB8wzV3Zacv7FcHq/nW/gR885AkPynBqm51Nus5UA7EXEbRyyB6QEZ/fn
         8hHBc2JWucO2u7EyFkC0dBrqem+5GoQKGZ5p23DQ7OconSyyw19rBFcGkYMGaXV01Gri
         OJUA==
X-Forwarded-Encrypted: i=1; AJvYcCVNQtXHjm53ny19AChvxplXncPyfEd98XRcmcEnfV2W6U0DEIgizuhljyiMPazdrCTWEpNYezJHFIHrGGrXgwxDPw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/KC/JseWCyZfEG6sf6aWbkTVHUWtJiU5Y3ylyVPtQrWmXdXsO
	XylY4Ex9w5/zRv/W3NzBHe/aBslCQUsa1xjIhvqM8nQoasc9oSG0COuOLSRPVR6U6jj9iSKmY9M
	xGr+c
X-Gm-Gg: ATEYQzxTzGSFcnUolCXSg3YjNn6VO3PDeWockegsBg60SYg7ESrCUqhdQf6R82g5SrE
	ZyK50Huu0M8hbWEYurNp8Ytc2nYW2u2+RpS6NfJ04iHzSvoYlnnO1hZJjM50TQek1BcUTMQjuZM
	ZmDRa/EFaLpL21pqyW4OLPBBszIMBvuxCvfsal27BAuzUpZhLjEhlR8Zd6o/PNALG4aT/G86Atl
	uvw0mtV8blaU3CqL4aNapCZyy3AJGtTEJPnbUxetzql1EqBEUXIV58ccTkvxNIMyrnUqU2JynnA
	ZktCuXg8zwp9OyL5SRQ2n97EeUbtSIVFR6EeXg9N2bEEz0cycoBb9AzdvsxC7ZoaEiwoEgiQafu
	dck/DZOu04FsqVG9TTDMSA1hqSlfkFmJkssglwhyO0OjpViIPxZsRAK8CDaMkiQYiQmxp0iBRcB
	B6x954GQ320pzFduUOIqDB6Z8=
X-Received: by 2002:a05:600c:698d:b0:483:acd9:bd18 with SMTP id 5b1f17b1804b1-48526917263mr60085305e9.1.1772823263225;
        Fri, 06 Mar 2026 10:54:23 -0800 (PST)
Received: from localhost ([212.133.41.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485256b1eacsm47490925e9.0.2026.03.06.10.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:54:22 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 19:54:21 +0100
Message-Id: <DGVXEB8FU6ZN.1GNB1IWJQKGEL@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v1] libarchive: adapt ptest support
 from master to scarthgap
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <pratik.farkase@ericsson.com>
To: <pratik.farkase@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260220083912.8864-1-pratik.farkase@est.tech>
In-Reply-To: <20260220083912.8864-1-pratik.farkase@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 18:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232587

On Fri Feb 20, 2026 at 9:39 AM CET, Pratik Farkase via lists.openembedded.o=
rg wrote:
> Backport ptest implementation from master branch to enable comprehensive
> testing of libarchive functionality in the scarthgap release.
>
> Changes include:
> - Inherit ptest class and add ptest support infrastructure
> - Add run-ptest script to execute all 5 test suites:
>   * libarchive_test (698 tests)
>   * bsdtar_test (74 tests)
>   * bsdcpio_test (49 tests)
>   * bsdcat_test (18 tests)
>   * bsdunzip_test (24 tests)
> - Install test binaries, test data files, and reference files
> - Add bash and locale-base-en-us to RDEPENDS for ptest execution
> - Enable nettle in PACKAGECONFIG for ZIP encryption/decryption support
>
> The nettle addition is critical for test compatibility - without it,
> the test_P_encryption test fails with "Decryption is unsupported due
> to lack of crypto library". With nettle enabled, all 840+ tests pass
> successfully.
>
> Testing on qemux86-64:
> - All test suites: PASS
>
> This backport ensures the scarthgap branch has the same comprehensive
> test coverage as master, improving quality assurance and catching
> regressions early.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

Hello,

I'm sorry but we decided that standalone tests like this one are not
acceptable for stable inclusion.

For more detail, see "Clarification on ptest/selftest backports for stable =
branches"
https://lore.kernel.org/openembedded-core/DGVX4XQ6VLWT.1HOMXA78ZXLBG@smile.=
fr/T/#u

Regards,
--=20
Yoann Congal
Smile ECS


