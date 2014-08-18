Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id CF06760030;
	Mon, 18 Aug 2014 19:05:24 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id h3so8670826igd.3
	for <multiple recipients>; Mon, 18 Aug 2014 12:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+y8+f5sR5VAASPjpq893o+wfbTJNUOoadP5DLP1Tp7M=;
	b=iz3XdpX3LxByI3jg3oqEv8Fn9oAzEtuY14N9V3fFF8sqW4VvPSfqWLjsILS8waZwER
	muwgBuqY6wsegxtH7wL8KifLaj4M17JUmJDWytnIkbKp+0efir+XdKaWh8XmTS+DtdoN
	dZ+gIqwD5y3ZulwNKl8Su9BVzZaFaI8mycAGeLGi+Dhe67vQuXL8HFp/xNDwgC/rVCgy
	LCxkK1jsOZB8gyHrVYOvOrUGq65bqFKp6uqHrJCmD3mSLvzrya9VJF9y5676a8JXY9UH
	s+ODtlZfNWltK4VPjK6osShbNKcF2O/sHwBIqtJS1Or4kIchRNDmRj9GRwXxdarq5+3W
	0B9A==
X-Received: by 10.50.176.202 with SMTP id ck10mr1004705igc.2.1408388724353;
	Mon, 18 Aug 2014 12:05:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Mon, 18 Aug 2014 12:04:54 -0700 (PDT)
In-Reply-To: <20140818185009.GA7174@gmail.com>
References: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
	<20140818181424.GG12992@gmail.com>
	<CAMKF1srjVfmfAWZ0mx+AfE_nR4erYtAEYt2OVhEsU+q++XKVrg@mail.gmail.com>
	<20140818185009.GA7174@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Aug 2014 12:04:54 -0700
Message-ID: <CAMKF1spkQkfbZMkL2Gg41hF9bm=+HS8sU8LME3pV6yMzDLLs-Q@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, musl@lists.openwall.com,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Announcing meta-musl OE/Yocto layer supporting musl C library
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
X-List-Received-Date: Mon, 18 Aug 2014 19:05:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 18, 2014 at 11:50 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On Mon, Aug 18, 2014 at 11:26:26AM -0700, Khem Raj wrote:
>> On Mon, Aug 18, 2014 at 11:14 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> > On Sat, Aug 16, 2014 at 05:50:38PM -0700, Khem Raj wrote:
>> >> Hello All
>> >>
>> >> musl <http://www.musl-libc.org/> is a newer implementation licensed
>> >> under MIT licence
>> >> A layer to support musl to supply your system C library as an
>> >> alternative to uclibc and eglibc/glibc  is now available at
>> >>
>> >> https://github.com/kraj/meta-musl
>> >>
>> >> README describes way to get going with it.
>> >>
>> >> Few things to note
>> >>
>> >> * Supports gcc 4.9 in OE not 4.8
>> >> * Current musl recipe is 1.1.4 based
>> >> * You need latest master of OE-Core
>> >> (106305227003761c3fc562c21bb859a5256f2b36) or          newer and
>> >> bitbake
>> >> * Its only able to build core-image-minimal
>> >> * core-image-minimal boots on qemuarm, qemuppc, qemumips, qemux86, qemux86-64
>> >>
>> >> I will send a request to add it to layerindex soon and then you should
>> >> be able to find it using
>> >> layerindex.opernembedded.org as well
>> >>
>> >> If you try it out on your hardware and/or have feedback I am
>> >> interested. Fork it from github, file bugs
>> >> send patches ....
>> >>
>> >> Happy hacking
>> >>
>> >
>> > core-image-minimal works with my configuration on qemuarm. It also successfully
>> > builds what will soon be released as opkg-0.2.3 and the recipe for toybox-0.4.9
>> > which I've recently created.
>> >
>> > I tried building core-image-full-cmdline as I think that would be good next step
>> > from core-image-minimal. I'm seeing failures in:
>> >
>> >   meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb, do_compile
>> >   meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_compile
>> >   meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb, do_compile
>> >   meta/recipes-extended/iptables/iptables_1.4.21.bb, do_compile
>> >   meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_compile
>> >   meta/recipes-devtools/perl/perl_5.20.0.bb, do_compile
>> >   meta/recipes-extended/sysklogd/sysklogd_1.5.bb, do_compile
>> >   meta/recipes-extended/ethtool/ethtool_3.14.bb, do_compile
>> >   meta/recipes-extended/psmisc/psmisc_22.21.bb, do_compile
>> >   meta/recipes-extended/pax/pax_3.4.bb, do_compile
>> >   meta/recipes-extended/procps/procps_3.2.8.bb, do_compile
>> >   meta/recipes-extended/net-tools/net-tools_1.60-25.bb, do_compile
>> >   meta/recipes-extended/findutils/findutils_4.4.2.bb, do_compile
>> >   meta/recipes-extended/logrotate/logrotate_3.8.7.bb, do_compile
>> >   meta/recipes-extended/cronie/cronie_1.4.11.bb, do_compile
>> >   meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_compile
>> >   meta/recipes-extended/at/at_3.1.14.bb, do_compile
>> >   meta/recipes-extended/iputils/iputils_s20121221.bb, do_compile
>> >   meta/recipes-extended/gzip/gzip_1.6.bb, do_compile
>> >   meta/recipes-extended/sudo/sudo_1.8.10p3.bb, do_compile
>> >   meta/recipes-extended/mc/mc_4.8.12.bb, do_compile
>> >
>> > I can share detailed logs if anyone wants them. I'll have a look and see if I
>> > can find some low hanging fruit amongst these which are easy to fix.
>> >
>>
>>
>> Thanks cool. Can you open a ticket on github with this information ?
>
> Will do. Do you want just want one ticket or do you want to separate these into
> one ticket per failing recipe or similar?
>

That would be handy too. But I wanted was to keep this info in project
for folks to try it out.

> I've put the failing "log.do_compile" files into one directory which is 1.3MB
> uncompressed or just 41kB compressed. I've posted them to:
>   http://www.paulbarker.me.uk/musl-error-logs_2014-08-18/
>   http://www.paulbarker.me.uk/musl-error-logs_2014-08-18/musl-error-logs_2014-08-18.tar.xz
>
> Cheers,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk

