Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.2484.1630532137670632641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 14:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fsr58wF6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id g135so742605wme.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 14:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=vji7rdFyeYY+gxqkxCQ5+uicp2UWnlXN/Ink0KskLY4=;
        b=fsr58wF6vD7hsxVXUe21UsZxOub0kOErpaInqqhzYW28VWZj6WrJbyCbUn1DHDLOFV
         5xyT4eaAQ68zLHsYmL6uWxZxYRfxhH3+sOu4nKE/4tJBbPPDsOetwcimzBBdKWSasCf+
         GJU/MXUOeadaxczWEzqa7x/js7vhIH1iUyXIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vji7rdFyeYY+gxqkxCQ5+uicp2UWnlXN/Ink0KskLY4=;
        b=Z5g5pao1yg5pqFy0do2HT8mkDhELbZeHjQfqcC1popRAYwANpVZmqSADTD6stjX3yG
         F4xvB2dzGbX4mG30rA6dCqcH5XOJQbTsgqI0wr9YEnv5yk37Gw+TTwM8BLVYfwtVFtPy
         jryTNC4JjK19bO7Nz8I/S9E4b91M+GZ1lBja5qmB8ctVnrLJch5mwvmS41hxzXx+XqXP
         H+dGS5oqiVxrrUlql7id2sbCVf3QcfIc3efTvx74SlmaAAQRnBup7INExFN5QSj/6Mlt
         j3mupC5C1YIogfyer+I5h2tOJqjcySW1pbQtmGsijW1wmD4NMjk5Z1TR9OJZHGovGk5p
         XM5w==
X-Gm-Message-State: AOAM533sd+LNtGH1jvD9TWspGgenH5Ac37OUgjoCeWmwc0sQzwC/XKcb
	Dui5+OxDJqHQpZNRe9vuPJ/q0g==
X-Google-Smtp-Source: ABdhPJxTALigsPDURbSyrJNPzQxbpFS1FV39bdMwwYtp8r1vSeq1prfEiu1tWPN+9XVAXcm3n774vA==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr1410059wmh.117.1630532136024;
        Wed, 01 Sep 2021 14:35:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5a99:997:84da:190e? ([2001:8b0:aba:5f3c:5a99:997:84da:190e])
        by smtp.gmail.com with ESMTPSA id t5sm567175wra.95.2021.09.01.14.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 14:35:35 -0700 (PDT)
Message-ID: <8426c4a6503d79ddad5eb7535820f2361362fb1e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] common-licenses: add missing SPDX licences
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Sep 2021 22:35:32 +0100
In-Reply-To: <20210901200958.814612-1-ross.burton@arm.com>
References: <20210901200958.814612-1-ross.burton@arm.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-01 at 21:09 +0100, Ross Burton wrote:
> As part of the work to converge our license support with SPDX, ensure
> that we have all of the licenses that SPDX supports.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/files/common-licenses/0BSD               |   5 +
>  meta/files/common-licenses/ADSL               |   1 +
>  meta/files/common-licenses/AFL-1.1            |  27 +
>  meta/files/common-licenses/AGPL-1.0           |  86 +++
>  meta/files/common-licenses/AGPL-1.0-only      |  86 +++
>  meta/files/common-licenses/AGPL-1.0-or-later  |  86 +++
>  meta/files/common-licenses/AGPL-3.0           | 235 ++++++++
>  meta/files/common-licenses/AMDPLPA            |  20 +
>  meta/files/common-licenses/AML                |   9 +
>  meta/files/common-licenses/AMPAS              |  13 +
>  meta/files/common-licenses/ANTLR-PD-fallback  |   7 +
>  meta/files/common-licenses/APAFML             |   3 +
>  meta/files/common-licenses/Abstyles           |  11 +
>  meta/files/common-licenses/Adobe-2006         |  12 +
>  meta/files/common-licenses/Adobe-Glyph        |  10 +
>  meta/files/common-licenses/Afmparse           |  10 +
>  meta/files/common-licenses/Aladdin            |  62 ++
>  meta/files/common-licenses/Artistic-1.0-Perl  |  51 ++
>  meta/files/common-licenses/Artistic-1.0-cl8   |  51 ++
>  .../common-licenses/BSD-2-Clause-FreeBSD      |  13 +
>  .../files/common-licenses/BSD-2-Clause-NetBSD |  11 +
>  meta/files/common-licenses/BSD-2-Clause-Views |  11 +
>  .../common-licenses/BSD-3-Clause-Attribution  |  11 +
>  meta/files/common-licenses/BSD-3-Clause-LBNL  |  12 +
>  .../common-licenses/BSD-3-Clause-Modification |  35 ++
>  .../BSD-3-Clause-No-Military-License          |  16 +
>  .../BSD-3-Clause-No-Nuclear-License           |  14 +
>  .../BSD-3-Clause-No-Nuclear-License-2014      |  16 +
>  .../BSD-3-Clause-No-Nuclear-Warranty          |  14 +
>  .../common-licenses/BSD-3-Clause-Open-MPI     |  34 ++
>  .../common-licenses/BSD-4-Clause-Shortened    |  13 +
>  meta/files/common-licenses/BSD-4-Clause-UC    |  15 +
>  meta/files/common-licenses/BSD-Protection     |  53 ++
>  meta/files/common-licenses/BSD-Source-Code    |  10 +
>  meta/files/common-licenses/BUSL-1.1           |  72 +++
>  meta/files/common-licenses/Bahyph             |  11 +
>  meta/files/common-licenses/Barr               |   1 +
>  meta/files/common-licenses/Beerware           |   1 +
>  meta/files/common-licenses/BitTorrent-1.0     | 330 +++++++++++
>  meta/files/common-licenses/BitTorrent-1.1     | 137 +++++
>  meta/files/common-licenses/BlueOak-1.0.0      |  55 ++
>  meta/files/common-licenses/Borceux            |  19 +
>  meta/files/common-licenses/C-UDA-1.0          |  47 ++
>  meta/files/common-licenses/CAL-1.0            | 354 +++++++++++
>  .../CAL-1.0-Combined-Work-Exception           | 354 +++++++++++
>  meta/files/common-licenses/CC-BY-2.5-AU       | 112 ++++
>  meta/files/common-licenses/CC-BY-3.0-AT       | 111 ++++
>  meta/files/common-licenses/CC-BY-3.0-DE       | 109 ++++
>  meta/files/common-licenses/CC-BY-3.0-NL       |  97 +++
>  meta/files/common-licenses/CC-BY-3.0-US       |  83 +++
>  meta/files/common-licenses/CC-BY-4.0          | 156 +++++
>  meta/files/common-licenses/CC-BY-NC-3.0-DE    | 110 ++++
>  meta/files/common-licenses/CC-BY-NC-4.0       | 158 +++++
>  meta/files/common-licenses/CC-BY-NC-ND-3.0-DE | 101 ++++
>  .../files/common-licenses/CC-BY-NC-ND-3.0-IGO |  99 ++++
>  meta/files/common-licenses/CC-BY-NC-ND-4.0    | 155 +++++
>  meta/files/common-licenses/CC-BY-NC-SA-2.0-FR |  93 +++
>  meta/files/common-licenses/CC-BY-NC-SA-2.0-UK | 149 +++++
>  meta/files/common-licenses/CC-BY-NC-SA-3.0-DE | 126 ++++
>  .../files/common-licenses/CC-BY-NC-SA-3.0-IGO | 105 ++++
>  meta/files/common-licenses/CC-BY-NC-SA-4.0    | 170 ++++++
>  meta/files/common-licenses/CC-BY-ND-3.0-DE    | 101 ++++
>  meta/files/common-licenses/CC-BY-ND-4.0       | 154 +++++
>  meta/files/common-licenses/CC-BY-SA-2.0-UK    | 147 +++++
>  meta/files/common-licenses/CC-BY-SA-2.1-JP    |  83 +++
>  meta/files/common-licenses/CC-BY-SA-3.0-AT    | 139 +++++
>  meta/files/common-licenses/CC-BY-SA-3.0-DE    | 136 +++++
>  meta/files/common-licenses/CC-PDDC            |   8 +
>  meta/files/common-licenses/CDDL-1.1           | 123 ++++
>  meta/files/common-licenses/CDL-1.0            |  53 ++
>  .../files/common-licenses/CDLA-Permissive-1.0 |  85 +++
>  .../files/common-licenses/CDLA-Permissive-2.0 |  35 ++
>  meta/files/common-licenses/CDLA-Sharing-1.0   |  89 +++
>  meta/files/common-licenses/CECILL-1.1         | 229 +++++++
>  meta/files/common-licenses/CECILL-2.1         | 518 ++++++++++++++++
>  meta/files/common-licenses/CERN-OHL-1.1       |  47 ++
>  meta/files/common-licenses/CERN-OHL-1.2       |  49 ++
>  meta/files/common-licenses/CERN-OHL-P-2.0     | 199 +++++++
>  meta/files/common-licenses/CERN-OHL-S-2.0     | 289 +++++++++
>  meta/files/common-licenses/CERN-OHL-W-2.0     | 310 ++++++++++
>  meta/files/common-licenses/CNRI-Jython        |  12 +
>  meta/files/common-licenses/CNRI-Python        |  25 +
>  .../CNRI-Python-GPL-Compatible                |  23 +
>  meta/files/common-licenses/CPOL-1.02          |  98 +++
>  meta/files/common-licenses/Caldera            |  25 +
>  meta/files/common-licenses/Condor-1.1         |  40 ++
>  meta/files/common-licenses/Crossword          |   5 +
>  meta/files/common-licenses/CrystalStacker     |   7 +
>  meta/files/common-licenses/Cube               |  17 +
>  meta/files/common-licenses/D-FSL-1.0          | 147 +++++
>  meta/files/common-licenses/DOC                |  15 +
>  meta/files/common-licenses/DRL-1.0            |  12 +
>  meta/files/common-licenses/DSDP               |  18 +
>  meta/files/common-licenses/Dotseqn            |   5 +
>  meta/files/common-licenses/EPICS              |  32 +
>  meta/files/common-licenses/EUPL-1.2           | 190 ++++++
>  meta/files/common-licenses/Eurosym            |  18 +
>  meta/files/common-licenses/FSFAP              |   1 +
>  meta/files/common-licenses/FSFUL              |   3 +
>  meta/files/common-licenses/FSFULLR            |   3 +
>  meta/files/common-licenses/FTL                |  79 +++
>  meta/files/common-licenses/FreeBSD-DOC        |  23 +
>  meta/files/common-licenses/FreeImage          | 117 ++++
>  meta/files/common-licenses/GD                 |  24 +
>  .../common-licenses/GFDL-1.1-invariants-only  | 119 ++++
>  .../GFDL-1.1-invariants-or-later              | 119 ++++
>  .../GFDL-1.1-no-invariants-only               | 119 ++++
>  .../GFDL-1.1-no-invariants-or-later           | 119 ++++
>  meta/files/common-licenses/GFDL-1.1-only      | 119 ++++
>  meta/files/common-licenses/GFDL-1.1-or-later  | 119 ++++
>  .../common-licenses/GFDL-1.2-invariants-only  | 130 ++++
>  .../GFDL-1.2-invariants-or-later              | 130 ++++
>  .../GFDL-1.2-no-invariants-only               | 130 ++++
>  .../GFDL-1.2-no-invariants-or-later           | 130 ++++
>  meta/files/common-licenses/GFDL-1.2-only      | 130 ++++
>  meta/files/common-licenses/GFDL-1.2-or-later  | 130 ++++
>  .../common-licenses/GFDL-1.3-invariants-only  | 149 +++++
>  .../GFDL-1.3-invariants-or-later              | 149 +++++
>  .../GFDL-1.3-no-invariants-only               | 149 +++++
>  .../GFDL-1.3-no-invariants-or-later           | 149 +++++
>  meta/files/common-licenses/GFDL-1.3-only      | 149 +++++
>  meta/files/common-licenses/GFDL-1.3-or-later  | 149 +++++
>  meta/files/common-licenses/GL2PS              |  13 +
>  meta/files/common-licenses/GLWTPL             |  25 +
>  meta/files/common-licenses/GPL-1.0            | 100 ++++
>  meta/files/common-licenses/GPL-1.0+           | 104 ++++
>  meta/files/common-licenses/GPL-2.0            | 117 ++++
>  meta/files/common-licenses/GPL-2.0+           | 122 ++++
>  .../GPL-2.0-with-bison-exception              |   6 +
>  meta/files/common-licenses/GPL-3.0            | 232 ++++++++
>  meta/files/common-licenses/GPL-3.0+           | 254 ++++++++
>  meta/files/common-licenses/Giftware           |   9 +

I'm a little concerned that we're adding GPL-1.0 and friends here when we
already have GPL-1.0-only which I thought was the preferred form now for SPDX?

I think this list may need a little more filtering, or maybe isn't using the
latest SPDX version?

Cheers,

Richard

