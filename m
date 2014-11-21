Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id E09C765C91;
	Fri, 21 Nov 2014 17:24:27 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id hz20so4667459lab.34
	for <multiple recipients>; Fri, 21 Nov 2014 09:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1gQxeMfCcNXFQ763VGDyRxj4vanxEOtaziB06ShMWZE=;
	b=SaXZYyK6TS0jDcjevQgUbhcAR3o5NmVvvIKsEmDnmggsLXwxRwUQFCWi9JD8n0jq8u
	KFjf5ISERUq4/s9u8QY+5c77e+vORQtW+tDc8PEq/UA0JItZP9kkkG1nbVqrBvN0jIek
	oBs/5C5YMKbEE5psyGn89eUR6/nDBbdI1lQFoW3TYD6spckg/s/iHT1UwphCrkxUktSe
	kUjsCKuJdOq2/s0hl3lBK66S/7LaOeKZJPvN/ZXUYZP+oIzekSp3HvlihYAkGeUGRnz4
	SBD8D+3APQIwIQ8gtU0M1MolMhJhxWHl4NiYd3AWGPpSuPtBumre9CBHsxohe26IACM/
	MnCg==
MIME-Version: 1.0
X-Received: by 10.112.132.2 with SMTP id oq2mr6504582lbb.11.1416590666923;
	Fri, 21 Nov 2014 09:24:26 -0800 (PST)
Received: by 10.112.189.38 with HTTP; Fri, 21 Nov 2014 09:24:26 -0800 (PST)
In-Reply-To: <20141119140143.GB3315@jama>
References: <20141119140143.GB3315@jama>
Date: Fri, 21 Nov 2014 18:24:26 +0100
Message-ID: <CAAQYJAtMvgZXe4SAuvet3-rtt5oXoXWMt3CnuzJ2dQy+HTLQHQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2014-11-19
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
X-List-Received-Date: Fri, 21 Nov 2014 17:24:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 19, 2014 at 3:01 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2014-11-19 ==
>
> === common (12) ===
>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb, do_compile
>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb, do_compile

Hi Martin,

thanks for the huge build-tests!

About klibc, I'm under the impression your git pull was done just
before the klibc fix went in meta-initramfs.
This is supposedly fixed now.

Yes, klibc is especially fragile with regard to the toolchain changes
in oe-core ;)

Cheers
Andrea


>     * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/php/php_5.4.33.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/acpica/acpitests_20140828.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb, do_unpack
>     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb, do_compile
>     * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb, do_configure
>     * meta-smartphone/meta-shr/recipes-shr/3rdparty/iliwi_git.bb, do_compile
>     * meta-smartphone/meta-shr/recipes-shr/3rdparty/sensmon_git.bb, do_compile
>     * meta-smartphone/meta-shr/recipes-shr/3rdparty/valacompass_git.bb, do_compile
>
> === common-x86 (0) ===
>
> === qemuarm (2) ===
>     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_fetch
>     * meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/android-audiosystem_bzr.bb, do_compile
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks ===
> {| class=wikitable
> |-
> ||qemuarm       ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141110_065307.log/||http://errors.yoctoproject.org:80/Errors/Search/1/3219/
> |-
> ||qemux86       ||12    ||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141110_221551.log/||http://errors.yoctoproject.org:80/Errors/Search/1/3220/
> |-
> ||qemux86_64    ||13    ||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141111_143018.log/||http://errors.yoctoproject.org:80/Errors/Search/1/3241/
> |}
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

