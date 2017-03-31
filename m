Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A874777DD6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:58:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x75so423855wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C2ovvevk8ASJmfIhyjsFvlc6fc1cDIhVZzOMccECZKE=;
	b=LaqkV254g0XJJW6f42DOxX9hPEFTxM8vd4/7yPgg1suShXrl+eANDmao+DGQOprj8P
	i7/yK6CgkJaAu4AKMvtcEKbbjJtDyaAcWzsbAQEp4rc//Ws1d+UtRPZgbtV+XM2gPd4/
	PgFleGDozn78lj6ky8no7XANYUPC4VXHti/Tf2L4TxZrsV/KjM7sIheC5fWU5Oqh/5lX
	5bnmrbZOAswuoCPAeirm+qDsAWYRpxROLR68a3R3wiJAc/wjwuYYxbsL08L5WhhANGjY
	F+H4t4GLmtzU3UunXdAPwv83dYDFPR06ND7AQWgmZN0fd72Rf1qOmYvAtInwPMTEaNL7
	Gm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C2ovvevk8ASJmfIhyjsFvlc6fc1cDIhVZzOMccECZKE=;
	b=rjB+9adUk1AXbNUtGXFIEFuUvI19RphZ7q0epurmmi8FTTe6B2xca3jRYvEOmn19qU
	ufDyDN4qIfhvAac/cbdEBgaixikpvMtLGggbITquyhfdWBaoBHbYFjUdV8frhuSNrQfa
	M2dosqeV89q8m5m6c1j4diFgSIJzEoB15xW1U85HVFO2Fa54io+Y5gCkWlq8N1PUlqe5
	YXv+VXjVdSXnKJvjJoTevCpBnrDCXMWuujg7BiEvBSA1eP5vKw6KJ+nM7zYFbDP9f1Zz
	DVfihDNe8Ol4VpsSCP9EltjtM1GOXHqy2GUc7lbEpQeVgTK/3mj1UXvGsQ9jlgQTwexB
	fxBg==
X-Gm-Message-State: AFeK/H1UYIhHSFlNU162eVGRw1d76fKxzrSLa+r/5ZOcDXf+t7/BeqniGEOG1YpIw0eb5DnGK5kBdAEPCWKy0A==
X-Received: by 10.28.69.68 with SMTP id s65mr3610819wma.13.1490975901364; Fri,
	31 Mar 2017 08:58:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Fri, 31 Mar 2017 08:57:50 -0700 (PDT)
In-Reply-To: <20170331150810.GA3897@jama>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
	<CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
	<20170331150810.GA3897@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Mar 2017 08:57:50 -0700
Message-ID: <CAMKF1soVTYoZKuNumi+qOw8sgSQqpcXkLW2skhM9v_warvRgkw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Fri, 31 Mar 2017 15:58:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:
>> On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > I'm not sure if this is the root cause, but last qemux86 build shows:
>> >
>> >
>> > | configure: error: --enable-gallium-llvm selected but llvm-config is not
>> > found
>> > | ERROR: Function failed: do_configure (log file is located at
>> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.0.1-r0/temp/log.do_configure.11359)
>> >
>>
>> can you point where is llvm-config installed in sysroot ? its possible
>> its not in native sysroot location ${STAGING_BINDIR_NATIVE}
>
> OE qemux86@ ~/build/oe-core $ find tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot* -name llvm\*
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config3.3
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm-c
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm/Config/llvm-config.h
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/lib/llvm3.3
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot-providers/llvm-common
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot-providers/llvm3.3
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3.complete
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common.complete
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common.6be6a4ae98ee0dff7c2a4c4df17f026a
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3.388adaa288ab3b1d35e01a43b6542368
> tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3
>

so it seems it should point to <recipe-sysroot>/usr/bin/crossscripts
can you try changing -with-llvm-prefix to point to this dir ?

>>
>> >
>> > I've noticed some llvm changes for meta-clang, do we need similar changes
>> > for meta-oe version of llvm?
>> >
>> >
>> > On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >>
>> >>
>> >> On 3/11/17 1:30 PM, Khem Raj wrote:
>> >> > The following changes since commit
>> >> > a47e64d985a610535449730806651f5bfd75d9ec:
>> >> >
>> >> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
>> >> >
>> >> > are available in the git repository at:
>> >> >
>> >> >   git://git.openembedded.org/openembedded-core-contrib kraj/pu
>> >> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu
>> >> >
>> >> > Khem Raj (1):
>> >> >   mesa: Contain configure search for llvm
>> >> >
>> >>
>> >> I added another fix for mesa-gl to remove one of obsolete packageconfigs
>> >> and its on the same pull branch now.
>> >>
>> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

