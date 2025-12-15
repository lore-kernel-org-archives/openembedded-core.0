Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF39AD5B867
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 18:35:29 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1791.1765823720052642020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 10:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QYlu/7nN;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88059c28da1so37462306d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765823719; x=1766428519; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/QqAXuarXXa3XSlAg4jroe187Vz5EplTAdZPN6sxOw=;
        b=QYlu/7nNVKf6wlaphtbCn6fFJZCrQENrfoiNEViq925wY1z68oM44sOAgvRed+kaLS
         qdTLrF/d+UBCcIHW3HQKg3G6Bx5McBWk1gWLPzsdg4dfPwzYugV/K32mDy+Au4WrLCJg
         +GV0nhDOr0JXph340nYrYQF0+a4IFClY1vLxxoRNf6t+Q0Ym2Dw8b5WB+LfEUb3oLNnV
         t19u76ppVucO8H97+QM87yAhp7U6W2ZrMNfxFKlzLAbhfFphqDNXZ2umkNitmiGRqMw7
         6S/TdkgivcrRVzjYpDk1D0X6vLWP4q5DtYtnterq3hSYRzKAdOz0iZdoCWQ8cc2KNyxJ
         c1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765823719; x=1766428519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/QqAXuarXXa3XSlAg4jroe187Vz5EplTAdZPN6sxOw=;
        b=sZNrPGNcqpIAdglerXcEPyBOrfoAyJW44222zMDxzPD0nRUQOglb1B3PDDn9A/nWAO
         i9N0wR1/kounUUv/dfu7F5Bn8AP3ePDUjoYcPrc5zb4FhJNk6mMEIykKAol11anTu44u
         pwBTzJKOP9/vr296+5RckmZA+EVwoxOOifKo39l7hkn+Q9RN4s1LmubhnK62LOx42aOQ
         joje59fbX3YZmUf1qAuimFxGkzAojxekgIhxOaD8UgX3FI3G+tlzEfnwX3BM3mk2U+qG
         N4HaJDEAiJ8NeBmjIZzXCmv0dYrnhSBAcsgNoN2j7FW5Zp38WPQP+jYjWOdFYBO7Zxuq
         QXRQ==
X-Gm-Message-State: AOJu0Yw1sp2vcd2u5jRdhpnuKEcc4uGApIefVkxI+uLtdCUe5Ox2e+1Z
	YheWbn2AFwr5TbyIT2huZd41kyFcFPKCP40oqbkXGCPINXr7owSgkbQvu0sKrDoEqKkwU3ub6ZY
	3mkLg34aWLkNgmUOXz6xT9tbtG5R7zqZYIw==
X-Gm-Gg: AY/fxX6KO3YzCQxNkDX19Uepmne39T+SOeKcvz7cl0EDPaATfUH+XDWywcrHiAKHYWL
	Zw+2rGsYR3yNBjjucfYgHxJxu8T4fjaZuMUW2MvKoVg/SnsZQfeOT9dHNZNWufRvWYkr/CdrxlP
	n/+02mLhCchVInsgA0mfFoYcUvW6UTrljn+jS3/P13dspqKFvGDwQvPqiSf/Ydn8bRGnRkk9FD9
	XyX2JvFYu9RrdLF3lFrEa8dLh9Mhg5DwoSBdOhNzw2DjcT+Z4BuvasgLXMzbFQY4HwNBA==
X-Google-Smtp-Source: AGHT+IE7luT1G2ilSUigxESwgJCDk0WjKESjCSEKCdXCDsf/nY/+dXyeylgeM11O7sVlPj1ZQNBwd62HnzVzw87eiMc=
X-Received: by 2002:a05:6214:2f08:b0:88a:316f:252f with SMTP id
 6a1803df08f44-88a316f2757mr66745426d6.53.1765823718974; Mon, 15 Dec 2025
 10:35:18 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9ANcZM04CXbyQefsteNTnfMFF58_N3-68i0cFkDmNexA@mail.gmail.com>
In-Reply-To: <CAK5yBb9ANcZM04CXbyQefsteNTnfMFF58_N3-68i0cFkDmNexA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Dec 2025 19:35:07 +0100
X-Gm-Features: AQt7F2qUo5sP_nWYegKega-1leSaafXt58vnwYujQAv3eV8rxbDyJrt4zLRiwec
Message-ID: <CANNYZj_83k6Ykuub-bSx=mw4VNDG+nMDuXMAPMWFPSR2CEqdOg@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 9 December 2025 (WW49)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 18:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227753

On Tue, 9 Dec 2025 at 16:55, Stephen Jolley via lists.openembedded.org
<sjolley.yp.pm=gmail.com@lists.openembedded.org> wrote:
> Further bitbake-setup changes under discussion for the new development cycle:
> defaulting to a common sstate directory and hashequiv server
> Allowing symlinking of local existing repos into the build instead of fetching

Patches for both have been posted to bitbake-devel list today. The
symlinking is fairly robust, and ready to be merged (from my POV), but
the sstate handling could use a bit of review/alternative perspective,
and is offered as RFC (it does work as it should though).

Alex

