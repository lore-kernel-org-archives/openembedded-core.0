Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.4759.1630575807474079689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 02:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=HQf6T/pV;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso955253wmc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Sep 2021 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PX7CX8kloPEVxtPZWkuIvhJ8gpojKhDDGfzRG781ZZk=;
        b=HQf6T/pVJmHtWPIiOMLH9ToTEEa4PEIaJWQ30GPzv8g9hN01YsSwu2JuktTVJWya15
         jIVCLd6e2Ep8L1h3NaR2GDlu15eL3wrl89L81v3ZjqLJnfLhndZZ8OgVRAIw73m0eoQg
         oYrJ5NemXk+iZT8ahy+50EH8ZeRemnqk+Q8Gr95lX2/00vgUSHJOUVBlSswvKgHmMwO8
         Ns03Mk+T0I2oQ4UQSlIAdbRLDcZZCDpZgSIcwEy0Q7lhCs3+t1ZJWEG9TwCVTdopGv20
         M2xVzDYhkgBKS33JdJXWdvNPbHS1aSFDill4umuvE6NfefxY/CB3QTENtO6copOuhER3
         KHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PX7CX8kloPEVxtPZWkuIvhJ8gpojKhDDGfzRG781ZZk=;
        b=ofwG2j/iVAuLS9sJ+FoYywRHi2vOSiDHvDBfKaaVPmw6Kij44cFUf0CYfYEodya95O
         jkOBHaskd8FIAWoYYjbgWSlhzEGJgl3VCJpPfhkTLfmXJwIiz1bOEmTDF/RdBLLfMcTN
         Qd9/GIuAEDbCb+Ge4PByT3PGimoKPSka5FfidYfadWHQjNzsmPf3J70VBStky++DDc93
         c8Eu0DR+3ex/ISukjT+KFn8d7JsXzv2g4tmhWGVAIC2sV3qtIRy+yONc1RCZrAb1uH6M
         xN3Uy06US9bh4WZssb87O9Cw7yWUPcK0O+yScb/lGlk9TPlgprgLb87s6WKTNF85meOg
         KiQg==
X-Gm-Message-State: AOAM530aYURRPaWCdsSRaj8bGVqvfteow6vRCF4Cigrszf+4TqhwzbJa
	kCjaIh6HNbeb8MRmT+SBMEH2cilBr3kO4Rzetd01BA==
X-Google-Smtp-Source: ABdhPJzygzGj/hLMHhTbSzAtMmzCZaEAkOgpCuW0y8+MbvJPDJKG6D+CcpQXuzPEhTj/ZA8vbZYfxIBVJawhfy3nQx8=
X-Received: by 2002:a05:600c:3795:: with SMTP id o21mr2223587wmr.130.1630575805651;
 Thu, 02 Sep 2021 02:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210901200958.814612-1-ross.burton@arm.com> <8426c4a6503d79ddad5eb7535820f2361362fb1e.camel@linuxfoundation.org>
In-Reply-To: <8426c4a6503d79ddad5eb7535820f2361362fb1e.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 2 Sep 2021 10:43:14 +0100
Message-ID: <CAAnfSTt8W8Bny-7i9xkKhrr-0gPzo+ZR9=j7UC+L9VLhJoeypQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] common-licenses: add missing SPDX licences
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

You're right, the script isn't filtering out deprecated licenses. V2 posted.

Ross

On Wed, 1 Sept 2021 at 22:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-09-01 at 21:09 +0100, Ross Burton wrote:
> > As part of the work to converge our license support with SPDX, ensure
> > that we have all of the licenses that SPDX supports.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/files/common-licenses/0BSD               |   5 +
> >  meta/files/common-licenses/ADSL               |   1 +
> >  meta/files/common-licenses/AFL-1.1            |  27 +
> >  meta/files/common-licenses/AGPL-1.0           |  86 +++
> >  meta/files/common-licenses/AGPL-1.0-only      |  86 +++
> >  meta/files/common-licenses/AGPL-1.0-or-later  |  86 +++
> >  meta/files/common-licenses/AGPL-3.0           | 235 ++++++++
> >  meta/files/common-licenses/AMDPLPA            |  20 +
> >  meta/files/common-licenses/AML                |   9 +
> >  meta/files/common-licenses/AMPAS              |  13 +
> >  meta/files/common-licenses/ANTLR-PD-fallback  |   7 +
> >  meta/files/common-licenses/APAFML             |   3 +
> >  meta/files/common-licenses/Abstyles           |  11 +
> >  meta/files/common-licenses/Adobe-2006         |  12 +
> >  meta/files/common-licenses/Adobe-Glyph        |  10 +
> >  meta/files/common-licenses/Afmparse           |  10 +
> >  meta/files/common-licenses/Aladdin            |  62 ++
> >  meta/files/common-licenses/Artistic-1.0-Perl  |  51 ++
> >  meta/files/common-licenses/Artistic-1.0-cl8   |  51 ++
> >  .../common-licenses/BSD-2-Clause-FreeBSD      |  13 +
> >  .../files/common-licenses/BSD-2-Clause-NetBSD |  11 +
> >  meta/files/common-licenses/BSD-2-Clause-Views |  11 +
> >  .../common-licenses/BSD-3-Clause-Attribution  |  11 +
> >  meta/files/common-licenses/BSD-3-Clause-LBNL  |  12 +
> >  .../common-licenses/BSD-3-Clause-Modification |  35 ++
> >  .../BSD-3-Clause-No-Military-License          |  16 +
> >  .../BSD-3-Clause-No-Nuclear-License           |  14 +
> >  .../BSD-3-Clause-No-Nuclear-License-2014      |  16 +
> >  .../BSD-3-Clause-No-Nuclear-Warranty          |  14 +
> >  .../common-licenses/BSD-3-Clause-Open-MPI     |  34 ++
> >  .../common-licenses/BSD-4-Clause-Shortened    |  13 +
> >  meta/files/common-licenses/BSD-4-Clause-UC    |  15 +
> >  meta/files/common-licenses/BSD-Protection     |  53 ++
> >  meta/files/common-licenses/BSD-Source-Code    |  10 +
> >  meta/files/common-licenses/BUSL-1.1           |  72 +++
> >  meta/files/common-licenses/Bahyph             |  11 +
> >  meta/files/common-licenses/Barr               |   1 +
> >  meta/files/common-licenses/Beerware           |   1 +
> >  meta/files/common-licenses/BitTorrent-1.0     | 330 +++++++++++
> >  meta/files/common-licenses/BitTorrent-1.1     | 137 +++++
> >  meta/files/common-licenses/BlueOak-1.0.0      |  55 ++
> >  meta/files/common-licenses/Borceux            |  19 +
> >  meta/files/common-licenses/C-UDA-1.0          |  47 ++
> >  meta/files/common-licenses/CAL-1.0            | 354 +++++++++++
> >  .../CAL-1.0-Combined-Work-Exception           | 354 +++++++++++
> >  meta/files/common-licenses/CC-BY-2.5-AU       | 112 ++++
> >  meta/files/common-licenses/CC-BY-3.0-AT       | 111 ++++
> >  meta/files/common-licenses/CC-BY-3.0-DE       | 109 ++++
> >  meta/files/common-licenses/CC-BY-3.0-NL       |  97 +++
> >  meta/files/common-licenses/CC-BY-3.0-US       |  83 +++
> >  meta/files/common-licenses/CC-BY-4.0          | 156 +++++
> >  meta/files/common-licenses/CC-BY-NC-3.0-DE    | 110 ++++
> >  meta/files/common-licenses/CC-BY-NC-4.0       | 158 +++++
> >  meta/files/common-licenses/CC-BY-NC-ND-3.0-DE | 101 ++++
> >  .../files/common-licenses/CC-BY-NC-ND-3.0-IGO |  99 ++++
> >  meta/files/common-licenses/CC-BY-NC-ND-4.0    | 155 +++++
> >  meta/files/common-licenses/CC-BY-NC-SA-2.0-FR |  93 +++
> >  meta/files/common-licenses/CC-BY-NC-SA-2.0-UK | 149 +++++
> >  meta/files/common-licenses/CC-BY-NC-SA-3.0-DE | 126 ++++
> >  .../files/common-licenses/CC-BY-NC-SA-3.0-IGO | 105 ++++
> >  meta/files/common-licenses/CC-BY-NC-SA-4.0    | 170 ++++++
> >  meta/files/common-licenses/CC-BY-ND-3.0-DE    | 101 ++++
> >  meta/files/common-licenses/CC-BY-ND-4.0       | 154 +++++
> >  meta/files/common-licenses/CC-BY-SA-2.0-UK    | 147 +++++
> >  meta/files/common-licenses/CC-BY-SA-2.1-JP    |  83 +++
> >  meta/files/common-licenses/CC-BY-SA-3.0-AT    | 139 +++++
> >  meta/files/common-licenses/CC-BY-SA-3.0-DE    | 136 +++++
> >  meta/files/common-licenses/CC-PDDC            |   8 +
> >  meta/files/common-licenses/CDDL-1.1           | 123 ++++
> >  meta/files/common-licenses/CDL-1.0            |  53 ++
> >  .../files/common-licenses/CDLA-Permissive-1.0 |  85 +++
> >  .../files/common-licenses/CDLA-Permissive-2.0 |  35 ++
> >  meta/files/common-licenses/CDLA-Sharing-1.0   |  89 +++
> >  meta/files/common-licenses/CECILL-1.1         | 229 +++++++
> >  meta/files/common-licenses/CECILL-2.1         | 518 ++++++++++++++++
> >  meta/files/common-licenses/CERN-OHL-1.1       |  47 ++
> >  meta/files/common-licenses/CERN-OHL-1.2       |  49 ++
> >  meta/files/common-licenses/CERN-OHL-P-2.0     | 199 +++++++
> >  meta/files/common-licenses/CERN-OHL-S-2.0     | 289 +++++++++
> >  meta/files/common-licenses/CERN-OHL-W-2.0     | 310 ++++++++++
> >  meta/files/common-licenses/CNRI-Jython        |  12 +
> >  meta/files/common-licenses/CNRI-Python        |  25 +
> >  .../CNRI-Python-GPL-Compatible                |  23 +
> >  meta/files/common-licenses/CPOL-1.02          |  98 +++
> >  meta/files/common-licenses/Caldera            |  25 +
> >  meta/files/common-licenses/Condor-1.1         |  40 ++
> >  meta/files/common-licenses/Crossword          |   5 +
> >  meta/files/common-licenses/CrystalStacker     |   7 +
> >  meta/files/common-licenses/Cube               |  17 +
> >  meta/files/common-licenses/D-FSL-1.0          | 147 +++++
> >  meta/files/common-licenses/DOC                |  15 +
> >  meta/files/common-licenses/DRL-1.0            |  12 +
> >  meta/files/common-licenses/DSDP               |  18 +
> >  meta/files/common-licenses/Dotseqn            |   5 +
> >  meta/files/common-licenses/EPICS              |  32 +
> >  meta/files/common-licenses/EUPL-1.2           | 190 ++++++
> >  meta/files/common-licenses/Eurosym            |  18 +
> >  meta/files/common-licenses/FSFAP              |   1 +
> >  meta/files/common-licenses/FSFUL              |   3 +
> >  meta/files/common-licenses/FSFULLR            |   3 +
> >  meta/files/common-licenses/FTL                |  79 +++
> >  meta/files/common-licenses/FreeBSD-DOC        |  23 +
> >  meta/files/common-licenses/FreeImage          | 117 ++++
> >  meta/files/common-licenses/GD                 |  24 +
> >  .../common-licenses/GFDL-1.1-invariants-only  | 119 ++++
> >  .../GFDL-1.1-invariants-or-later              | 119 ++++
> >  .../GFDL-1.1-no-invariants-only               | 119 ++++
> >  .../GFDL-1.1-no-invariants-or-later           | 119 ++++
> >  meta/files/common-licenses/GFDL-1.1-only      | 119 ++++
> >  meta/files/common-licenses/GFDL-1.1-or-later  | 119 ++++
> >  .../common-licenses/GFDL-1.2-invariants-only  | 130 ++++
> >  .../GFDL-1.2-invariants-or-later              | 130 ++++
> >  .../GFDL-1.2-no-invariants-only               | 130 ++++
> >  .../GFDL-1.2-no-invariants-or-later           | 130 ++++
> >  meta/files/common-licenses/GFDL-1.2-only      | 130 ++++
> >  meta/files/common-licenses/GFDL-1.2-or-later  | 130 ++++
> >  .../common-licenses/GFDL-1.3-invariants-only  | 149 +++++
> >  .../GFDL-1.3-invariants-or-later              | 149 +++++
> >  .../GFDL-1.3-no-invariants-only               | 149 +++++
> >  .../GFDL-1.3-no-invariants-or-later           | 149 +++++
> >  meta/files/common-licenses/GFDL-1.3-only      | 149 +++++
> >  meta/files/common-licenses/GFDL-1.3-or-later  | 149 +++++
> >  meta/files/common-licenses/GL2PS              |  13 +
> >  meta/files/common-licenses/GLWTPL             |  25 +
> >  meta/files/common-licenses/GPL-1.0            | 100 ++++
> >  meta/files/common-licenses/GPL-1.0+           | 104 ++++
> >  meta/files/common-licenses/GPL-2.0            | 117 ++++
> >  meta/files/common-licenses/GPL-2.0+           | 122 ++++
> >  .../GPL-2.0-with-bison-exception              |   6 +
> >  meta/files/common-licenses/GPL-3.0            | 232 ++++++++
> >  meta/files/common-licenses/GPL-3.0+           | 254 ++++++++
> >  meta/files/common-licenses/Giftware           |   9 +
>
> I'm a little concerned that we're adding GPL-1.0 and friends here when we
> already have GPL-1.0-only which I thought was the preferred form now for SPDX?
>
> I think this list may need a little more filtering, or maybe isn't using the
> latest SPDX version?
>
> Cheers,
>
> Richard
>
