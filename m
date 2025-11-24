Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAA9CFD31C
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 06:38:36 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10499.1763966314675544490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 22:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XtGMg7/n;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8804650ca32so36241616d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 22:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763966313; x=1764571113; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GkEOV0ldJM76mZgf0jkK+nlSdPGsb94/J3R/DDjOMVc=;
        b=XtGMg7/n491EzafI1YglqNDuyY3Uqsnm15J5/wQhBDlPiw4Ampu74D116yc5JhRfIZ
         SDPC4I7NW0T5l2TJEQrI7uJ+FzYIiQhU1ADuovc8i2LlZWWpP6fL74rANajdTzGyQwAd
         2MtT8S47HICyv94rHFHTerENk2y8KbzJlPr7HNdCiSOrqeQr1mYlwKMO1CFXPp1TSJkW
         NxWbleAn3ZPGTtlv4cD3NeBynd5sjYx6Pr2/uyhLhoYOar5dz3ElWdQa/dS5bfo92/M6
         QOoxrlqEk0NH84GS0KA1SzrbDncCEgLcGyrMILECMYJtoyyXbqVpL31NU0Vtgo0ktM4k
         odVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763966313; x=1764571113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkEOV0ldJM76mZgf0jkK+nlSdPGsb94/J3R/DDjOMVc=;
        b=XzP7FQnuj4wUTL6bPtxCgWru/JCmaVf8G0s0lDYtOQGjUDu1o2DHeN6lfLo8VzCNTY
         JvlGFgiDxiudXs7Z1L/tRBrqvNkSHlFGv3iZ5iYXLK7EhP5HtiD/A/ZueVv8yrhFUEnS
         +HiO7w2iwqmgXVC8AznsAoZ7qPNdMByZ/bNumiocUlXisqbwX/M7hWUwnGEXGiYmJv4G
         uczKIHntHnie5f/4M3ghNmDvtErHOxIzSNMIIXhRFsfttxM5QxRzPpOULoyXleGmyoWK
         W7no6JBDPWZaWYZ461y93tI7yPkt/A2cr8nSP7YF04EJgJleBlqa2rwHZefc40czezJS
         SuIA==
X-Gm-Message-State: AOJu0YxFSBJLuI95lTDzPW0rl5sSnmPD8A2EE/yhXwVL0Org/qpimqRx
	UPsn6L9rT69xwH1E4vRiG+BxO9hCwXAZPclvmH71C8RnFyzzr4MrBTM7B2GOAJ2UWr5d2hqyk4g
	lUV4w0kvK/ExG4upr0S6qNWOyjg4nWhw=
X-Gm-Gg: ASbGncsqDpeIkTGlxxtoJ9YBNlP3qTrEFry/ycF0Ef5LJw5L+ISbI2XjQM3zgZDFnxB
	1OgQOeMaw9kyJCoeIcKZyU+9NxnH2ebz2mOdwkgUg6SeTMvLJFQCQNYNj52ZVSq6Swsm2ztyLD+
	MMVieuC9BTuwkCBFh35Pu4RORVpSRU0073stMTt0sKDArok9XrJXzGAn6WZuBHw3VXUMdbILBf3
	Vmw3By1rdS4/zc1/f/QUtzD247mEo/hTOEHKoqJVjLarXy+mvI6W/mmrFrhp/qjcZFNFyzOqJpC
	vULMzPmzAvoigjpDK2PJqDODZcjNgw==
X-Google-Smtp-Source: AGHT+IGQdMhwi4C8ZL7okLCEsQdmUliHYqFGIIEthWKTSLQYP+7kz+jPAapAIWyZbvOI8pOqLj21KPCVs6P/s3kNxAs=
X-Received: by 2002:a05:6214:2481:b0:880:5357:f5ba with SMTP id
 6a1803df08f44-8847c4995fcmr160568776d6.18.1763966313574; Sun, 23 Nov 2025
 22:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20251122160554.283274-1-vpuar@qti.qualcomm.com>
 <CANNYZj-4W4Ujymomy-fqTgaAR8ZZ2uS_b7NwMHiAyff+UxvvEw@mail.gmail.com> <686098.1763961685702080770@lists.openembedded.org>
In-Reply-To: <686098.1763961685702080770@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Nov 2025 07:38:22 +0100
X-Gm-Features: AWmQ_bkZRbEvB39Nlldj6ccmE18O0AqIDp3iSfapdGXc2-mXL-fvMNTRpSHipRc
Message-ID: <CANNYZj_ZBzvmadA9hgJe-KcGKYk14EfopqmnGF-+ksVYFOTWLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] udev-extraconf: Split automount and autonet
 into seperate packages
To: vpuar@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 06:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226737

On Mon, 24 Nov 2025 at 06:21, Vivek Puar via lists.openembedded.org
<vpuar=qti.qualcomm.com@lists.openembedded.org> wrote:
> If one needs only storage devices to be auto-mounted and does not require
> network hotplug handling, splitting allows selecting just the automount package
> without having to care about other rules. This also avoids installing unnecessary
> scripts and rules.

This leaves the last question: what are the actual savings achieved?
How much disk space is saved? Does this avoid pulling in other
dependencies? The patch doesn't adjust runtime dependencies (e.g.
util-linux items), so the savings must be very minimal. Is it only
about avoiding files which are not needed?

There's a trade-off between not having unnecessary files and increased
complexity of packaging, which carries a maintenance burden. This
patch is probably okay, as it's for a self-contained, rarely changed
recipe that only installs local files, it just needs to be justified a
bit better.

Alex

