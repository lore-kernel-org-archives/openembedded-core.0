Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QE4Hz-0005U4-Fz
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Apr 2011 20:44:11 +0200
Received: by ewy5 with SMTP id 5so514684ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2011 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=sobhOzcMAF8nEGAe1o9blwP6rYe28CMZManTIUzt588=;
	b=VtWMMu5puuLaFCOLvJp6/pNqXzwNMX3EikCB8aBO6Dt2mwNFNDpQDWKrc9kKMrOcsR
	5uFPgHX0AcGMXwPDQeCu7dBDHzGovg4zRnxUFb2oqYCvGo3TDx0ZEdFLEZU4/YKRuQWe
	V97VWumLtd/4Y3WTRQAD0AsY1utcg54B+iyoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=v2oNmsk/O/aU2fYgTUZxM05ay6egpeWiKQAHOdlOxBfIffvII6/C54PRwk1svU2eOe
	/9ybopXFy3XeLwfYrCT1uKNJ7v0FKHftuzavyTIx+bvvWtu610HJXwZwYdDIauE3VfFh
	9wVPrqS2Ev3l52B3/jjmNQKNNEkECjQBxsmco=
Received: by 10.14.135.71 with SMTP id t47mr1104267eei.220.1303670503130; Sun,
	24 Apr 2011 11:41:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Sun, 24 Apr 2011 11:41:13 -0700 (PDT)
In-Reply-To: <1303606867.29588.196.camel@elmorro>
References: <1303273629-1631-1-git-send-email-raj.khem@gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94515DC58B@orsmsx504.amr.corp.intel.com>
	<4DAF0E5C.10106@linux.intel.com>
	<430B907C-AA81-410E-A9C7-EC5B15E58FAA@dominion.thruhere.net>
	<BANLkTint2tspjGTh7H1VdRxJEhUF47_7Ew@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE9451634E1F@orsmsx504.amr.corp.intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE9451635064@orsmsx504.amr.corp.intel.com>
	<1303606867.29588.196.camel@elmorro>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Apr 2011 11:41:13 -0700
Message-ID: <BANLkTi=mMUzVhNTjApuwArUkatPe73C10w@mail.gmail.com>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Add recipes for 4.6.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Apr 2011 18:44:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 23, 2011 at 6:01 PM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> On Wed, 2011-04-20 at 17:18 -0700, Kamble, Nitin A wrote:
>> Met 1st build failure with gcc4.6.6. I think it is not a gcc issue, but =
the recipe code issue; And Tom/Darren can take care of it.
>>
>
> Hi,
>
> The patchset applied fine for me, but I'm getting do_patch errors when bu=
ilding:
>
> *** Manual patch resolution mode ***
> Dropping to a shell, so patch rejects can be fixed manually.
> Run "quilt refresh" when patch is corrected, press CTRL+D to exit.
>
> Applying patch gcc-uclibc-locale-ctype_touplow_t.patch
> patching file libstdc++-v3/config/locale/generic/c_locale.h
> Hunk #1 FAILED at 41.
> 1 out of 1 hunk FAILED -- saving rejects to file libstdc++-v3/config/loca=
le/generic/c_locale.h.rej
> patching file libstdc++-v3/config/os/gnu-linux/ctype_base.h
> Hunk #2 FAILED at 47.
> 1 out of 2 hunks FAILED -- saving rejects to file libstdc++-v3/config/os/=
gnu-linux/ctype_base.h.rej
> patching file libstdc++-v3/config/locale/generic/c_locale.cc
> Applied patch gcc-uclibc-locale-ctype_touplow_t.patch (forced; needs refr=
esh)
> trz@elmorro:/usr/local/src/yocto/test/build/tmp/work/x86_64-poky-linux/gc=
c-cross-intermediate-4.6.0-r0/gcc-4.6.0$
>
> I actually fixed a couple of these up, but they keep coming...
>
> So is there anything special I need to do to get this building cleanly?
> I'm using master, and added the following to my local.conf:
>
> GCCVERSION =3D "4.6.0"
> SDKGCCVERSION =3D "4.6.0"
>
> and did bitbake linux-yocto.
>
>
> Once I have it working and can fix compile errors, I can send a patch to
> fix it up if necessary, but note that this particular gcc warning
> (unused-but-set-variable) is on its way to being disabled in the
> upstream kernel. =C2=A0See the lkml thread, "Re: annoying new gcc 4.6.0
> warnings.":

I looked at the errors in kernel's do_compile_perf task

| bench/sched-pipe.c: In function 'bench_sched_pipe':
| bench/sched-pipe.c:58:6: error: variable 'ret' set but not used
[-Werror=3Dunused-but-set-variable]
| cc1: all warnings being treated as errors
|
| make: *** [bench/sched-pipe.o] Error 1

Looking at sourcecode of tools/perf/bench/sched-pipe.c there is a
dummy local variable ret which is never used
and seemingly is used to workaround another warning where return
values of read()
and write() were being ignored. I think warning is legitimate here

>
> https://lkml.org/lkml/2011/4/21/325
>
> Tom
>
>> Thanks,
>> Nitin
>>
>>
>> | PERF_VERSION =3D 2.6.37.5.308.g69cfbd^M
>> | make: Leaving directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/wo=
rk/qemux86_64-poky-linux/linux-yocto-2.6.37+git1+727fc4769aa920fc5bb3eb9a81=
bf92d0e6340903_1+69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3-r16/linux/tools/p=
erf'^M
>> | make: Entering directory `/build_disk/poky_build/build_gcc_4.6.0/tmp/w=
ork/qemux86_64-poky-linux/linux-yocto-2.6.37+git1+727fc4769aa920fc5bb3eb9a8=
1bf92d0e6340903_1+69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3-r16/linux/tools/=
perf'^M
>> | Makefile:512: No libdw.h found or old libdw.h found or elfutils is old=
er than 0.138, disables dwarf support. Please install new elfutils-devel/li=
bdw-dev^M
>> | Makefile:568: newt not found, disables TUI support. Please install new=
t-devel or libnewt-dev^M
>> | =C2=A0 =C2=A0 GEN common-cmds.h^M
>> | =C2=A0 =C2=A0 * new build flags or prefix^M
>> | =C2=A0 =C2=A0 CC perf.o^M
>> | =C2=A0 =C2=A0 CC builtin-annotate.o^M
>> | =C2=A0 =C2=A0 CC builtin-bench.o^M
>> | =C2=A0 =C2=A0 CC bench/sched-messaging.o^M
>> | =C2=A0 =C2=A0 CC bench/sched-pipe.o^M
>> | bench/sched-pipe.c: In function 'bench_sched_pipe':^M
>> | bench/sched-pipe.c:58:6: error: variable 'ret' set but not used [-Werr=
or=3Dunused-but-set-variable]^M
>> | cc1: all warnings being treated as errors^M
>> | ^M
>> | make: *** [bench/sched-pipe.o] Error 1^M
>> | ERROR: Function 'do_compile_perf' failed (see /build_disk/poky_build/b=
uild_gcc_4.6.0/tmp/work/qemux86_64-poky-linux/linux-yocto-2.6.37+git1+727fc=
4769aa920fc5bb3eb9a81bf92d0e6340903_1+69cfbdf9f1ff461a75e5b77d6d7ba35e97db4=
cc3-r16/temp/log.do_compile_perf.24035 for further information)^M
>> | make:^M
>> NOTE: package linux-yocto-2.6.37+git1+727fc4769aa920fc5bb3eb9a81bf92d0e6=
340903_1+69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3-r16: task do_compile_perf=
: Failed
>>
>>
>> > -----Original Message-----
>> > From: openembedded-core-bounces@lists.openembedded.org
>> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> > Kamble, Nitin A
>> > Sent: Wednesday, April 20, 2011 2:58 PM
>> > To: Patches and discussions about the oe-core layer
>> > Subject: Re: [OE-core] [PATCH] gcc: Add recipes for 4.6.0
>> >
>> > Khem,
>> > =C2=A0 Good news. All the gcc recipes built without any errors for arm=
, ppc,
>> > mips, x86, x86-64. Now I am trying to build the poky-image-sato-sdk
>> > image for each architecture. Will keep you posted.
>> >
>> > Thanks & Regards,
>> > Nitin
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>


