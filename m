Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD933606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 10:31:40 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b9so7238911iot.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nQAYmJ9axARuAWkCBH/2gXi/bmoIMmS++Iek/D8gzCg=;
	b=XdhUpgIBMKBItu4/HH/ebOW4mell+wGZRgLsIdB1Iodj6u3vdOBMa5MeaweOCzIZQa
	4WbbDifGWpPNiGZ7MBIHHlGJJYUSJNENVTsfG+o3KhOkrPgLpXXZ5PMj08hfyK0OkWsI
	osvgWvLMaMun5Ro67LUCwvpqqQZrjiH7e+5rJOe1ZlVx0mkPMEFH37idQ1h6DZD/11g4
	QUZQ53K/nJLuLnplTy3uZ6GtgEBnQdPdXQdLKmiqV8126cmAvgvR4JWMDyuk1P3wyRno
	PnbV1oFxqmgs/dYfVf9DhAUKcCwlT4z63XIzwSc5yRwoAyydkPL0s9FfQAkTPoOaD1wq
	NB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nQAYmJ9axARuAWkCBH/2gXi/bmoIMmS++Iek/D8gzCg=;
	b=ScHBTFmoUyRLmutzWnczoYJK7cg8NDEoFI6t6O/mYjjR5S68CYchuJn7RRxPYNCYr/
	OrcS0ALbdBOjHOwbt0mlXpfGnbLX7TzsRSlAl9btPUhHhfTz8vvVfCF6CR1bAXR0XrT1
	KTqZ+htnnQ6rArVxbV0n+75qZ3AT9UthlyymZXcHbjfOEEsL300faH8bVZAtjHMo+TSS
	eaoHNu7lY2myHeDoldhta+Tsw5CkgIucj9MM9qsYq7jcs6YmEoxjWY+Uco6Lg4XjfT9J
	2MUm4ZRPxWb+gTcOCbfe45vm5vEA1NoSv6NYrGe9FrbIicFWp5eaccjp/5PhCh0S9Rwj
	wbAQ==
X-Gm-Message-State: APjAAAVVVpNSlLP0KldXc72tCXK15WDU0ChtZck5mmvXuW0BNf3627hy
	Sd7HgO3gCxOsfE1k3SOHZVzi/3EXmN2VRiscxOs/BBpb
X-Google-Smtp-Source: APXvYqzXIr0TH7sqUohAY4wF+s9q0cCyOLOIF4j21GLxRkntiJNkFmNEr4o2fka0l26f+VrtmjH/YiPUDw9ZWRZIWpY=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr42378216ion.20.1554114701717; 
	Mon, 01 Apr 2019 03:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190331010109.8941-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190331010109.8941-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 10:31:30 +0000
Message-ID: <CAJTo0LYRH-ME6XTfsZXCkkth5xGG5AtyT4=_Cf0GWRY7O6qUMw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontconfig: update to 2.13.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 10:31:40 -0000
Content-Type: text/plain; charset="UTF-8"

Please remember to explain what you're doing.

On Sun, 31 Mar 2019 at 02:01, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
>                      file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
> -                    file://src/fccache.c;beginline=1367;endline=1382;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
> +                    file://src/fccache.c;beginline=1671;endline=1686;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"

Why?

> -DEPENDS = "expat freetype zlib gperf-native"
> +DEPENDS = "expat freetype zlib gperf-native util-linux"

What is this for?

> -           file://0001-src-fcxml.c-avoid-double-free-of-filename.patch \
> -           file://0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch \

As one of these was a backport and the other submitted I guess these
were merged in this release, but please say so.

> -FILES_${PN} =+ "${datadir}/xml/*"
> +FILES_${PN} =+ "${datadir}/xml/* ${datadir}/gettext/*"

These files are for development purposes so should be in PN-dev.

> -inherit autotools pkgconfig relative_symlinks
> +inherit autotools pkgconfig relative_symlinks gettext

What is this inherit for?  The point of the inherit is so that a
recipe can disable NLS (set USE_NLS='no') so does this work, or is
there actually a hard requirement on gettext-native (in which case
don't use the class).

Ross

