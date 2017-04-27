Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7A72D6FF69;
	Thu, 27 Apr 2017 10:27:40 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id i137so4419047wmf.0;
	Thu, 27 Apr 2017 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=GA11O5L3AwAhvhW495k/J04VjyoJ3oh3yJRVGquaEB8=;
	b=LJdixKP+rhTQ/qfBy0H+Xr/rN13dI9dfD5BIiE1bRO99Vh0xD2KVcropyfcM8LzbI2
	CA+gijm0gc1x3KZm7CudeYv/zVqfZuEirHu7/EEVjQip2XosckuBnFgRCD8yz/Xl17yR
	IXU74GfHwfXt6xRN6BWJCiiRoNZ/Nzq/MhXd7quRYCynuQm1xHSpR372owERJ+asHGFr
	uljuqcK2vef2fgjNHCw22IXPZvyLFRU8P3tzcvbD7ci49vOZHAwaFUixbR41ov2xbCM6
	hcD4ceymVb4ky1od9HpuRr2bgBMH8MqDx+QXE13RdcZleokRG7DvqWw5PfhZ+Yr3hAQ9
	HYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=GA11O5L3AwAhvhW495k/J04VjyoJ3oh3yJRVGquaEB8=;
	b=pbN4NIkQN0c0VNLWcL4OSV5faBdKa4UZnuvVAL/yjrmcKggZE1eTKYaG+Qt+6n+Eou
	MZ9Jrn+wFQIkYYYIN+Z+UmCLIsai4OH8S93e8J8IcK+EN+z7hIp7P4K9SNuD18fQ4A09
	aLjIfczqseQ8xZger++WGK/69HXdz4lroFJUvpJslyWGeP/AOn4lttwLMWgw5UNRVN9g
	XEGnOaPsJHqHn/f5uVKL7JcrpZs3c8VVAPLhRKmOuH6aqp/mfVc1zA1soicBy+DtvKv6
	or7vmNvaUyfQsXmleRVCCRis5/Bk8V7c77sv1wONyO8KeVtacNSBBZ17ZF/w5TfuQKAQ
	cIBQ==
X-Gm-Message-State: AN3rC/5ZDXJhPcN+RPbBqn68lqPvG+LB0GjHv/5/0V84KDxR+kiIiocz
	IN9x5Q+iOgCsEoNHM/dHODzZs+ANGUxo
X-Received: by 10.80.136.74 with SMTP id c10mr4057327edc.168.1493288860983;
	Thu, 27 Apr 2017 03:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 27 Apr 2017 03:27:40 -0700 (PDT)
In-Reply-To: <20170427090921.GA3721@jama>
References: <20170427090921.GA3721@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Apr 2017 12:27:40 +0200
Message-ID: <CA+chaQc9YF0j2+Scdj3KQ9_wG0xatnLyNC=XdfqCtQw4Ts_0Xg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-04-26
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
X-List-Received-Date: Thu, 27 Apr 2017 10:27:41 -0000
Content-Type: multipart/alternative; boundary=f403045c212a1b262b054e2368e8

--f403045c212a1b262b054e2368e8
Content-Type: text/plain; charset=UTF-8

One of the builds was showing tiptop failure:
http://errors.yoctoproject.org/Errors/Details/141293/

I wonder if there is still some undeterministic behavior related to flex.

It shouldn't be able to use host's flex due to HOSTTOOLS filtering.
It doesn't have the dependency on flex-native, but clearly it's calling
flex and bison in do_compile. (it has transitive dependency
with "binutils-cross-x86_64.do_prepare_recipe_sysroot" ->
"flex-native.do_populate_sysroot").


On Thu, Apr 27, 2017 at 11:09 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='14'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||ldflags
>      ||compile-host-path     ||
> |-
> ||2017-04-26    ||0     ||0     ||0     ||N/A   ||N/A   ||N/A   ||N/A
>  ||N/A   ||N/A   ||0     ||0             ||0             ||0
>  ||0             ||0             ||0             ||0             ||0
>      ||0             ||0             ||0             ||0             ||0
>          ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2017-04-26 ==
>
> INFO: jenkins-job.sh-1.8.20 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> report.20170426_225925.log
>
> === common () ===
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (0) ===
> {| class=wikitable
> |-
> || qemuarm      || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemuarm.20170426_081705.log/ ||
> |-
> || qemux86      || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86.20170426_081704.log/ ||
> |-
> || qemux86_64   || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86-64.20170426_102853.log/ ||
> |}
>
> === PNBLACKLISTs (433) ===
>
> === QA issues (0) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||compile-host-path
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||ldflags
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||textrel
> |-
> ||0     ||unknown-configure-option
> |-
> ||0     ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> signatures.20170426_102413.log/
>
> No issues detected
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 0        issue: textrel
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
>
> count: 0        issue: version-going-backwards
>
>
> count: 0        issue: host-user-contaminated
>
>
> count: 0        issue: installed-vs-shipped
>
>
> count: 0        issue: unknown-configure-option
>
>
> count: 0        issue: symlink-to-sysroot
>
>
> count: 0        issue: invalid-pkgconfig
>
>
> count: 0        issue: pkgname
>
>
> count: 0        issue: ldflags
>
>
> count: 0        issue: compile-host-path
>
>
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> 21d9631 toaster: move release lookup from morty to pyro
> not included in master yet:
> c4b1613 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> e584be7 build-appliance-image: Update to master head revision
> not included in master yet:
> 67114ad qemux86: Add identical qemux86copy variant for tests
> 63e9e9d sstate-sysroot-cruft.sh: Extend the whitelist
> fe744e8 recipes: Replace "cp -a" with "cp -R --no-dereference
> --preserve=mode,links"
> 1b4ca51 buildhistory.bbclass: metadata-revs show repo parent
> 0b100a7 metadata-revs: provide more information
> ef84c55 report-error: Allow to upload reports automatically
> a43df23 Revert "mesa: Contain configure search for llvm"
> d559619 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the
> beginning and separated with dash
> fe46c11 kernel-yocto/kern-tools: fix do_validate_branches clean stage
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> ba89d451 hostapd: 2.5 -> 2.6
> not included in master yet:
> bf67dbb dnsmasq: disable the service by default
> 1a68c94 wireguard: add WireGuard kernel module and tools
> 9076683 strongswan: Split plugins
> ba15077 opensaf: Upgrade to 5.2.0
> 3e445c1 openhpi: add new recipe
> 804160a freeradius: add new recipe
> 26bf7da libnet-ldap-perl: add new recipe
> ff92147 libdata-hexdump-perl: add new recipe
> 7c4d004 libnet-telnet-perl: add new recipe
> aa737b6 libauthen-radius-perl: add new recipe
> 1c747f9 openipmi: add new recipe
> 6ba3579 ipmitool: add new recipe
> 02b4e96 kodi: Make it build again and upgrade to 17.1
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 5f837b4 qttools: add ptest
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> 4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit:
> c325204 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit:
> d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
> not included in master yet:
>

--f403045c212a1b262b054e2368e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One of the builds was showing tiptop failure:<div><a href=
=3D"http://errors.yoctoproject.org/Errors/Details/141293/">http://errors.yo=
ctoproject.org/Errors/Details/141293/</a><br></div><div><br></div><div>I wo=
nder if there is still some undeterministic behavior related to flex.</div>=
<div><br></div><div>It shouldn&#39;t be able to use host&#39;s flex due to =
HOSTTOOLS filtering.</div><div>It doesn&#39;t have the dependency on flex-n=
ative, but clearly it&#39;s calling flex and bison in do_compile. (it has t=
ransitive dependency with=C2=A0&quot;binutils-cross-x86_64.do_prepare_recip=
e_sysroot&quot; -&gt; &quot;flex-native.do_populate_sysroot&quot;).</div><d=
iv><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Thu, Apr 27, 2017 at 11:09 AM, Martin Jansa <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=3D=3D Number o=
f issues - stats =3D=3D<br>
{| class=3D&#39;wikitable&#39;<br>
!|Date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#=
39;3&#39;|Failed tasks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;6&#39;|Failed depencencies=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!|Signature=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!colspan=3D&#39;14&#39;|QA !!Co=
mment<br>
|-<br>
||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||qemuarm=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||qemux86=C2=A0 =C2=A0 =C2=A0 =C2=A0||qemux86_64=C2=A0 =C2=A0 =
||qemuarm||max||min=C2=A0 =C2=A0 =C2=A0||qemux86||max||min=C2=A0 =C2=A0 =C2=
=A0||all=C2=A0 =C2=A0||already-stripped=C2=A0 =C2=A0 =C2=A0 ||libdir=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ||textrel=C2=A0 =C2=A0 =C2=A0 =C2=A0||build-deps=C2=A0=
 =C2=A0 ||file-rdeps=C2=A0 =C2=A0 ||version-going-backwards=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||host-user-contaminated=C2=A0 =C2=A0 =C2=A0 =C2=A0 ||installe=
d-vs-shipped=C2=A0 ||unknown-configure-option=C2=A0 =C2=A0 =C2=A0 ||symlink=
-to-sysroot=C2=A0 =C2=A0 ||invalid-pkgconfig=C2=A0 =C2=A0 =C2=A0||pkgname=
=C2=A0 =C2=A0 =C2=A0 =C2=A0||ldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0||compile-ho=
st-path=C2=A0 =C2=A0 =C2=A0||<br>
|-<br>
||2017-04-26=C2=A0 =C2=A0 ||0=C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0||0=
=C2=A0 =C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0|=
|N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||<br>
|}<br>
<br>
<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=3D"no=
referrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bitbake_W=
orld_Status</a><br>
<br>
=3D=3D Failed tasks 2017-04-26 =3D=3D<br>
<br>
INFO: jenkins-job.sh-1.8.20 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170426_225925.log" r=
el=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildl=
ogs/oe/world/pyro/log.<wbr>report.20170426_225925.log</a><br>
<br>
=3D=3D=3D common () =3D=3D=3D<br>
<br>
=3D=3D=3D common-x86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemuarm (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemux86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D Number of failed tasks (0) =3D=3D=3D<br>
{| class=3Dwikitable<br>
|-<br>
|| qemuarm=C2=A0 =C2=A0 =C2=A0 || 0=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170426_08=
1705.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org=
/<wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemuarm.20170426_081705.<wbr>l=
og/</a> ||<br>
|-<br>
|| qemux86=C2=A0 =C2=A0 =C2=A0 || 0=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170426_08=
1704.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org=
/<wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemux86.20170426_081704.<wbr>l=
og/</a> ||<br>
|-<br>
|| qemux86_64=C2=A0 =C2=A0|| 0=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170426_1028=
53.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<=
wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemux86-64.20170426_<wbr>102853.=
log/</a> ||<br>
|}<br>
<br>
=3D=3D=3D PNBLACKLISTs (433) =3D=3D=3D<br>
<br>
=3D=3D=3D QA issues (0) =3D=3D=3D<br>
{| class=3Dwikitable<br>
!| Count=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||Issue<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||already-stripped<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||build-deps<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||compile-host-path<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||file-rdeps<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||host-user-contaminated<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||installed-vs-shipped<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||invalid-pkgconfig<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||ldflags<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||libdir<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||pkgname<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||symlink-to-sysroot<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||textrel<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||unknown-configure-option<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||version-going-backwards<br>
|}<br>
<br>
<br>
<br>
=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D<br>
<br>
Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.signatures.20170426_102413.log/" rel=3D"noreferrer" target=3D"_blank"=
>http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/pyro/log.<wbr>signatur=
es.20170426_102413.<wbr>log/</a><br>
<br>
No issues detected<br>
<br>
QA issues by type:<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: already-stripped<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: libdir<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: textrel<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: build-deps<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: file-rdeps<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: version-going-backwards<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: host-user-contaminated<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: installed-vs-shipped<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: unknown-configure-option<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: symlink-to-sysroot<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: invalid-pkgconfig<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: pkgname<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: ldflags<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: compile-host-path<br>
<br>
<br>
<br>
=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D<br>
latest upstream commit:<br>
21d9631 toaster: move release lookup from morty to pyro<br>
not included in master yet:<br>
c4b1613 world-image: add extra target<br>
<br>
=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D<br>
latest upstream commit:<br>
e584be7 build-appliance-image: Update to master head revision<br>
not included in master yet:<br>
67114ad qemux86: Add identical qemux86copy variant for tests<br>
63e9e9d sstate-sysroot-cruft.sh: Extend the whitelist<br>
fe744e8 recipes: Replace &quot;cp -a&quot; with &quot;cp -R --no-dereferenc=
e --preserve=3Dmode,links&quot;<br>
1b4ca51 buildhistory.bbclass: metadata-revs show repo parent<br>
0b100a7 metadata-revs: provide more information<br>
ef84c55 report-error: Allow to upload reports automatically<br>
a43df23 Revert &quot;mesa: Contain configure search for llvm&quot;<br>
d559619 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash<br>
fe46c11 kernel-yocto/kern-tools: fix do_validate_branches clean stage<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D<br>
latest upstream commit:<br>
ba89d451 hostapd: 2.5 -&gt; 2.6<br>
not included in master yet:<br>
bf67dbb dnsmasq: disable the service by default<br>
1a68c94 wireguard: add WireGuard kernel module and tools<br>
9076683 strongswan: Split plugins<br>
ba15077 opensaf: Upgrade to 5.2.0<br>
3e445c1 openhpi: add new recipe<br>
804160a freeradius: add new recipe<br>
26bf7da libnet-ldap-perl: add new recipe<br>
ff92147 libdata-hexdump-perl: add new recipe<br>
7c4d004 libnet-telnet-perl: add new recipe<br>
aa737b6 libauthen-radius-perl: add new recipe<br>
1c747f9 openipmi: add new recipe<br>
6ba3579 ipmitool: add new recipe<br>
02b4e96 kodi: Make it build again and upgrade to 17.1<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D<br>
latest upstream commit:<br>
5f837b4 qttools: add ptest<br>
not included in master yet:<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D<br=
>
latest upstream commit:<br>
4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress<br>
not included in master yet:<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D<br>
latest upstream commit:<br>
c325204 packagegroup-luneos-extended: drop qtscenegraph-adaptation<br>
not included in master yet:<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D=
<br>
latest upstream commit:<br>
d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency=
<br>
not included in master yet:<br>
</blockquote></div><br></div>

--f403045c212a1b262b054e2368e8--
