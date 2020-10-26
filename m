Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.10623.1603706743144693597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 03:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JzhBPVr0;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id n6so11662323wrm.13
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cn+7lJGksUkLKF1tSP01Y6grrBOTmag8LnZnLj0h2uU=;
        b=JzhBPVr0LZF50xLsfwUuouI+3WuQAMmwRFI+MzqEBXRS8fbn1F43qa11OFAm6dTk3j
         yHpRZgl63C/o0PcQ+OSIklJIPM5oIp7fPWOxI+51UDdi8tPEhlk7SwrXBZhN1EtN+QpX
         Wf/SYTqaeOyj5yL/56pUCoR+i3E8alal/Jby8wkIJ4IeHOsTPMOlc3X3HCE4/UWovQsa
         I2iOZJRTuTQ2+q7vP3eB/oJC+4qabAIB56996X8BEXvdN52xmzoU0LoxadXjfOfITacb
         RST/pQ3VW8xjsThJON2fyH2tRahDq8D6pMBB9GSEOzL3w67CbtgMArwgRLbyq7GSvLdD
         BLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cn+7lJGksUkLKF1tSP01Y6grrBOTmag8LnZnLj0h2uU=;
        b=XFaotysoL6iKdm1J+NgTArhzTnhplKO1L/0YwGIoJu0aj7vdPlewn1K0bjBGF5B+sx
         wey62pADAvrTzsQAMCsHRlMF+LmZtoMRAlfZftTrBLQhjFBOqixrzCiBjlFHV7MrUy64
         +M08Dn5gY778nZJ7+vis4BqfSKd8uzXl66P54z4+gyqKK+Yt8A3uPAYDFpx9NOcQkbVD
         GFMeAXnGByzWzL9Z3oVcAmQPLmSFSoJlEdLKuupy4VcX2ruGPWwM6lwmr8pFbRylvuVw
         brmhr50+oTuEzu6KrOiRWsmSDpZqvvfcSfY/Mp1xi8eFRGMkwrDHoBq1Zby90Lt35U2T
         LCTA==
X-Gm-Message-State: AOAM530xzL9OEGvzHpQ0+OzJeu875QHNxPknxl2UK63calKzOQi+tSYF
	gzJYf/5dXWk/gSfqEHWxLfQgSCKCerz8jrwz
X-Google-Smtp-Source: ABdhPJwifIKffrOgAKkywy/HXpNHSCzXcZQEkkTJvelxc5JVjmWo5kJS2Ennb0/5+3xg9d+jCG3PQw==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr16722871wrv.414.1603706741748;
        Mon, 26 Oct 2020 03:05:41 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id e20sm19954820wme.35.2020.10.26.03.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 03:05:41 -0700 (PDT)
Message-ID: <e3d96f5fa79794e55b56978fa34bb336501e0158.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3] Add new recipe for squashfs-tools-ng
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: peter.kjellerstedt@axis.com
Date: Mon, 26 Oct 2020 10:05:40 +0000
In-Reply-To: <6c5a1b204f52dc52c149b1056276c1acca5eae4d.camel@linuxfoundation.org>
References: <20201022092000.2917248-1-luca.boccassi@gmail.com>
	 <20201022113036.2938947-1-luca.boccassi@gmail.com>
	 <6c5a1b204f52dc52c149b1056276c1acca5eae4d.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-10-24 at 13:58 +0100, Richard Purdie wrote:
> On Thu, 2020-10-22 at 12:30 +0100, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > The main difference with squashfs-tools is the availability
> > of a shared library and a programmatic interface, rather
> > than just command-line tools.
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> > v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used), changed
> >     recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
> > 
> >  .../squashfs-tools-ng_1.0.2.bb                | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
> > 
> > diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
> > new file mode 100644
> > index 0000000000..293b31cd92
> > --- /dev/null
> > +++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
> > @@ -0,0 +1,34 @@
> > +SUMMARY = "New set of tools for working with SquashFS images"
> > +SECTION = "base"
> > +LICENSE = "GPL-3.0+ & LGPL-3.0+ & MIT & BSD-2-Clause & Zlib"
> > +LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
> > +                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
> > +                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
> > +                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
> > +                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
> > +                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
> > +                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
> > +                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
> > +                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
> > +
> > +SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
> > +SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > +
> > +PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
> > +PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,zlib"
> > +PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
> > +PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
> > +PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
> > +PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
> 
> Testing on the autobuilder showed up:
> 
> ERROR: Nothing PROVIDES 'zstd' (but /home/pokybuild/yocto-worker/check-layer/build/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb DEPENDS on or otherwise requires it)
> 
> (zstd isn't in OE-Core)
> 
> Cheers,
> 
> Richard

Removed zstd from default config in v4.

-- 
Kind regards,
Luca Boccassi

