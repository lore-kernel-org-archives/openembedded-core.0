Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.9153.1603366251728268150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 04:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MTTd5qE4;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id a72so1650709wme.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=e5HttgUm6V8nmjUuMLgbf0Tsy8Jmqpw4QcZvrTrrL7Q=;
        b=MTTd5qE49vdg32rx51PTEk4ZMQv0h/PlTcEqhINY0N3Y54Y7Tn4BFjEW3GVYwWCpnE
         Q56tnSMKlDTLPT0NYrSJUdSKqhD3wAMe/vmNcoBo+o0TkUzg721ElNRbCRGk9ul8V/PE
         3awJ9boZnt+cXHheE58xgPvR+TVU68s0Hlz+MHCqt32v2Bptp1/R2BJKVlg15f6lUNWV
         Om09bJeBgW8+5poF5p7lWhppvw1PywxpWQEtGk3agxYfJT0CLtqTc3acMrzuAuDgrwY4
         P7uMGerq9a6DNt9O7XlNGUOugfNtg7NuT8Bfq0UxZgUVUgdVgT5hahYNxzImZTMvq89j
         Bczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e5HttgUm6V8nmjUuMLgbf0Tsy8Jmqpw4QcZvrTrrL7Q=;
        b=Gtbn3KYPSYxKh52sS2l9LlepatjkDoyHUGpGXXCA9Qz8kllQfjKNXgrn6IC0hVlrtO
         cFaHfulMtmrKQy/4Y7HZCiQlOz46odlS4nMTtkg4aDHrNJ6i+CqwjLg96dMjvom+Yuxe
         Ur2UcY3IHRL7PANTw8GY8sAemi/Hl0mSFklQcoF1FLVTKXnazN2ZdFD5dh9H4oII/p+T
         pYsT22+tR8RtTIiPXYSXpCtN/kz681f7PUxpdvm44ThB9E23ekoIcohlRWUeWgO5Jh7r
         a7qt2Auubk4Uo+sZBHUDftYhiN+FvAftOe6J/R7SW9KlgDYKbR94GsCEM+BUvD8NPxcc
         GtEg==
X-Gm-Message-State: AOAM533w5BiTgAfv6BiBJnH3pkne3lCpK+EudBMUgK3uu1/BWQRglYMl
	/zXuzEDXBDUMqzUt674r5mA=
X-Google-Smtp-Source: ABdhPJziD4q1ACJJ99HiIt35rScpHOMJvL7+uC5yyiF2TVP+gUBWYJ8mpPaba0XsXNXqVlafzd4Sow==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr2069447wmr.179.1603366250357;
        Thu, 22 Oct 2020 04:30:50 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id u195sm3473180wmu.18.2020.10.22.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 04:30:49 -0700 (PDT)
Message-ID: <31f2a559ad7dd651bc351f6a2c198dcc3219eff4.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2] Add new recipe for squashfs-tools-ng
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "kweihmann@outlook.com" <kweihmann@outlook.com>
Date: Thu, 22 Oct 2020 12:30:49 +0100
In-Reply-To: <c746e94871f743bf81c38fdf18c9360d@XBOX03.axis.com>
References: <20201021155857.2841570-1-luca.boccassi@gmail.com>
	 <20201022092000.2917248-1-luca.boccassi@gmail.com>
	 <c746e94871f743bf81c38fdf18c9360d@XBOX03.axis.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-22 at 11:10 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Luca Bocassi
> > Sent: den 22 oktober 2020 11:20
> > To: openembedded-core@lists.openembedded.org
> > Cc: kweihmann@outlook.com
> > Subject: [OE-core] [PATCH v2] Add new recipe for squashfs-tools-ng
> > 
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > The main difference with squashfs-tools is the availability
> > of a shared library and a programmatic interface, rather
> > than just command-line tools.
> > 
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> > 
> >  .../squashfs-tools-ng_git.bb                  | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-
> > tools-ng_git.bb
> > 
> > diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> > new file mode 100644
> > index 0000000000..6479017ddb
> > --- /dev/null
> > +++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_git.bb
> > @@ -0,0 +1,37 @@
> > +SUMMARY = "New set of tools for working with SquashFS images"
> > +SECTION = "base"
> > +LICENSE = "GPLv3+ & LGPL-3.0+ & MIT & BSD-2-Clause & Zlib"
> 
> Change "GPLv3+" to "GPL-3.0+" for consistency.

Done.

> You have GPL-2.0 listed below too so it should probably be added 
> above as well.

The COPYING.md file specifies that it is mentioned only because some of
the dependencies use it and can be linked against. As far as I can see
no code included in this repository uses that license. So I've removed
it from the checksum list.

> > +LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
> > +                    file://licenses/GPLv2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > +                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
> > +                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
> > +                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
> > +                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
> > +                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
> > +                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
> > +                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
> > +                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
> > +
> > +PV = "1.0.2"
> 
> Move the version to the file name.

Done.

> > +SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
> > +SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https \
> > +"
> 
> I'd remove that backslash and keep it as one line.

Done.

> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > +
> > +PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
> 
> Change to:
> 
> PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"

Done.

-- 
Kind regards,
Luca Boccassi

