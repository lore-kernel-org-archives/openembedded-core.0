Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5024.1793996442744771243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 12:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wOmOw1MX;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so670113e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793996441; x=1794601241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nA1i1ccCr5F9ZktS3u8MSpfN4HBNDTGZRW8gSQZXxDQ=;
        b=wOmOw1MXlvP0Dn3VzVqAEqnztOQt4oea9x3cEj5ZkvvvJuw23lvjmWuuoBhwkBoagr
         W4/PQRCoXM9hYbNvtzEZ45g94lkiHe8DOQxOhhrvmbXrtnck7S43EWqMyKrYXlZNapNM
         +LKUIhHABMWHeSbdxz8c6aiAwo0N4FaFhwk2fxAPLo8TG2nK3A0kq9Bwpq0QFjDVtNI2
         Erg3VB/4kHmhglxWLldKf3v37hxjah61mQJU2y8n7RQAaJUAuNPtf16374mH0XjPF383
         CcJsvCeDOG26ugaScnGcukB3x/kAL7h7TUQbBJ0S9bQ6xu6T5w7ipR/qA/oBG78iyTVR
         5A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996441; x=1794601241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nA1i1ccCr5F9ZktS3u8MSpfN4HBNDTGZRW8gSQZXxDQ=;
        b=tEgNaJj8EMlsnJ8Q1EBxFMkFBDTrGyxWnqtlf7NXXDRT3PLzFZu9w587kLJABcTKt8
         bqKlap3nR8u80OIXasSM1IU2Qykqi+Spd7BKt14/BACcOingwew9lROzlOL7LcprglGr
         eHMK9YYRrlwvd6r3GH3+dxyOuin+11BXqWvF6gwqixJC2xhoqDqvloRte5ThTXX8ghVl
         ybueUhhl3UwO9eStSm6HS9DvXlIsXYXLdD+BYHBKQ4vQQxIvfXsW73QWZOK3pjGMBJWa
         Nas3P0CBfBTb1D0SbMt4f+ec1cCxzZ+UGh6Ab41vul/YRn0AG55l7f0JbY4gCVb2lb2L
         /gKw==
X-Forwarded-Encrypted: i=1; AL+hErEnP5ucBp6RJMlfVi390K/U2N/Fu99huMKQAltcLrhec6qb3F/LbaagJ82GRPVMbkR7+juhPUb2CHK27netyw4xxg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8apx31dywkkzFGFHNTg4H5x1m5CF25IV04ZbLH7fF88KHNBQbe
	oYWyuAUOwtbvtELvBjawnZ2hnTKwG7uwyhajrp21WxdaPEeg7g3uC/3R
X-Gm-Gg: AYBFou2vq8gxf2cJLWWzj0z3ZKVTm72UpDG7HlvfoUoFjtd9pC7pFvs2so9Vf8BjmYV
	ddsW909K66ixajAn/YvR+nQX83toS8VvAs8hnjtNqw1OekLoqBclwlSCsm+rhaqjtTQk3KJGRCu
	si3jdT6wRkdWfAR0KVjzAv7JpbB0tladiExLFF+YY4z9Kh6z5Spkh1e//tmrOuz43wXUFTZL//Q
	jB1UUKuxD7bEEsXJ8ippiAvBv32XHlEqoC1ozXtBjmFDxN6hILJcjFCpEqamwgdUVSnNIIsSVe/
	jLE0+GPnQhDP68uKcBVM9xi1iW3VS6Py5hz0aly6iePqs/gs4Z7FrS0BazzZH9LZED3yBhQjvt5
	F7kzDuZgFdjvo+f1dJHTfRbN1tPQZQib6KdXLUZE04QgrCT0O4s8W4gbJbd1fWceYhyHkUxZlZQ
	DBVrSd8tcQ68E6+rttWP+hOtnEvecuGgCk8IrvW2Z2zZcOnYfmK5YKo5mNmk2+P+W2uVSWiKYkG
	hQxrsHbhjr7WNdlIwZAU+jcwBQzKFLvj1RC+mjzWSthxpGdZDRD2H+10FJ6pd9i+hF2qofG7F7Z
	sLg4Usn51k1TrjznReq7+RM2+TstMSVMByC+TMaH7h5CDrEG0ZHaWDVh/RkAwuwZjDtQrK/3soN
	WO90/pVryZJiRT+0PhTXylbc46kZIx5VK44FOXHWssxIRCkzFm3l9myOeqIrhAvm/ZCddBRzAEI
	rAdYjZz80OV8sdWStunYQDcsm0xLyl9/pyjjPA1J4sk9Z+lQ==
X-Received: by 2002:a05:6122:338d:b0:5ea:d10f:2394 with SMTP id 71dfb90a1353d-5ecc43cceaemr2072667e0c.10.1793996441406;
        Fri, 06 Nov 2026 12:20:41 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc628e36csm2151033e0c.1.2026.11.06.12.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:20:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][RFC PATCH 0/8] enhance kernel -devsrc output options
Date: Fri,  6 Nov 2026 15:20:38 -0500
Message-ID: <20261106202038.4192004-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <22b23081715a48206765902938899bb7f9af3be0.camel@linuxfoundation.org>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com> <22b23081715a48206765902938899bb7f9af3be0.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 20:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249714
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

On Fri, 2026-11-06 at 14:08 -0500, Richard Purdie wrote:
> On Fri, 2026-11-06 at 12:32 -0500, bruce.ashfield@gmail.com wrote:
> >   7-8: two general oe-core fixes, for issues I noticed in the debug
> >        rootfs while working on this support. They aren't kernel
> >        specific and don't depend on the rest of the series:
> >        postinsts of debug only packages being registered against the
> >        image, and IMAGE_INSTALL_DEBUGFS packages with broken
> >        dependencies being silently skipped.
>
> Do you have an example of something which has a postinst which this
> pulls in? I'm wondering why debug src packages have postinsts :/

They don't :) Nothing in the -devsrc part of the series has a postinst,
and neither do the complementary -dbg packages.

I hit it while prototyping the versioned package, which originally used
a postinst for the /usr/src symlink (dropped, the link is now a plain
file owned by kernel-devsrc). I then reproduced it with a test recipe
using pkg_postinst_ontarget. I could dig up that reproducer and send
it along. I should have mentioned that in the series send.

The general case is that IMAGE_INSTALL_DEBUGFS takes any package. If
one that is only in the debug rootfs has a postinst that defers to
first boot, it gets registered in the intercepts the image shares, and
do_rootfs fails trying to save a postinst for a package that isn't in
the image. In oe-core, gnutls-fips and openssl-ossl-module-fips are the
obvious candidates, though I haven't built either into a debug rootfs.

So it's not needed by this series anymore. I'm happy to split 7-8 out
and send them separately, or chuck it in the bin if it isn't necessary.
I'll run it locally, since I don't throw much away!

Bruce

>
> Cheers,
>
> Richard
