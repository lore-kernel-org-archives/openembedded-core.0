Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD8071DC7;
	Mon,  3 Apr 2017 12:57:01 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id w43so168013529wrb.0;
	Mon, 03 Apr 2017 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sMpuWHD1K0BWYqEhI6A3BrQ8F6XXWQTdQzWh6OM/K8I=;
	b=S1aG3QxYcs8QEuEKQ1EpwAhdPzqZEzM4z8xlpzBfEpGdguLthhvX6cyO3GhAYBSg7p
	hNSzSbVkRQsVX/iYjB18GF5aZicyA/7hNiMxibhLQHCo9e4udmGUo42npwqZsRlIo0bc
	T6cXX4IIaGsrRR5RxI7iFKBvJe4a5N9a3Bi/J8TSrcLJkpAcJ8f4Z1jESkJeJqYIzQdp
	SmIU6BK0QI7gTnYUI70JMcr2RIsQ7dGKUsOiv+AnOn4HF2VoqMTah+wOLXozcuVuD2Gb
	i0Dv8rcwQjovuClvWR2eOmRCurLfPynWav/xBdXHlnKNJUfTvYSx5PEXIIXtiX+XodCx
	Kgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sMpuWHD1K0BWYqEhI6A3BrQ8F6XXWQTdQzWh6OM/K8I=;
	b=KuuqL4kZsOSBFINKecXapk053PW/fWDjkX15UOAJyOtAX3B26teoqGarSPrC/NZj52
	ztKrrc5CIvQSNlCb8aJQQPwTlwyHG9wbA/BcNfQkLppZoaxXZ+e0kxDs/NNBmwPDwG0/
	ju/Sci2iQJAN4GIIFwKfzEGAvPhJkjZPZvUGMHzi9uBZUZ+MzLDv2aVJdZ9SgWW8w9Cl
	0vGr7MJVtA3tLI/8A+GpyC/vxV9Q2kRmrmOxfRpWzOF2DmTOW4KeZzeoKnKq94WwiLlr
	ThBah7d+453rrbrj17mDQZfCcHJ/W9AhtD4s7xKeWE2905VXjGerPhV0z3USJkqE6v5O
	Ytog==
X-Gm-Message-State: AFeK/H1YcwOnsMjgUgN+0skX2tMQ+ijqC/VR6B+uN+gFbNoNJNodaQ+xrTbpT1wGJIoeCGHjhYjVRAFxoQhB3g==
X-Received: by 10.223.176.250 with SMTP id j55mr14990694wra.11.1491224221828; 
	Mon, 03 Apr 2017 05:57:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Mon, 3 Apr 2017 05:57:01 -0700 (PDT)
In-Reply-To: <20170403123443.GB3311@jama>
References: <20170403121749.GA3311@jama> <20170403123443.GB3311@jama>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 3 Apr 2017 14:57:01 +0200
Message-ID: <CAAQYJAuF69iHdrkdwLqy1CwzDrDERQqNVuyY2=25w80SbLqXug@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-04-01
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
X-List-Received-Date: Mon, 03 Apr 2017 12:57:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2017 at 2:34 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Mon, Apr 03, 2017 at 02:17:49PM +0200, Martin Jansa wrote:
>> qemux86 shows more failures, I've dropped few master-next changes
>> after this build.
>
> I've noticed that the report doesn't cover all currently triggered QA
> issues at least these 2 were missing in the report:
>
> count: 27       issue: ldflags
> flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linu=
x-gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libf=
lite_cmu_us_kal16.so.1.3' [ldflags]
> flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linu=
x-gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libfl=
ite_cmu_us_kal.so.1.3' [ldflags]
> flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-lin=
ux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cm=
u_us_kal16.so.1.3' [ldflags]
> flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-lin=
ux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu=
_us_kal.so.1.3' [ldflags]
> flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/f=
lite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us=
_kal16.so.1.3' [ldflags]
> flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/f=
lite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_=
kal.so.1.3' [ldflags]
> logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linu=
x-gnueabi/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldf=
lags]
> logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-lin=
ux/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
> logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/l=
ogfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
> No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/flite-=
alsa/1.3-r1/packages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflags]
> No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/pngche=
ck/2.3.0-r0/packages-split/pngcheck/usr/bin/pngcheck' [ldflags]
> No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/uml-ut=
ilities/20040406-r1/packages-split/uml-utilities/usr/bin/uml_switch' [ldfla=
gs]
> No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/flite-alsa/1.=
3-r1/packages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflags]
> No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/pngcheck/2.3.=
0-r0/packages-split/pngcheck/usr/bin/png-fix-IDAT-windowsize' [ldflags]
> No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/uml-utilities=
/20040406-r1/packages-split/uml-utilities/usr/bin/uml_net' [ldflags]
> No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-r1=
/packages-split/libflite-alsa/usr/lib/libflite.so.1.3' [ldflags]
> No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/pngcheck/2.3.0-r0=
/packages-split/pngcheck/usr/bin/pngsplit' [ldflags]
> No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/uml-utilities/200=
40406-r1/packages-split/uml-utilities/usr/bin/uml_mkcow' [ldflags]
> pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/wor=
k/armv5te-oe-linux-gnueabi/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-sp=
lit/pycd/usr/bin/pyc' [ldflags]
> pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/wor=
k/core2-64-oe-linux/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-split/pyc=
d/usr/bin/pyc' [ldflags]
> pycd-0.1+gitrAUTOINC+63b1dff1bc: No GNU_HASH in the elf binary: '/tmp/wor=
k/i586-oe-linux/pycd/1_0.1+gitrAUTOINC+63b1dff1bc-r0/packages-split/pycd/us=
r/bin/pyc' [ldflags]
> qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH in =
the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/qtchooser/39+git4717841=
185d34bbe450e3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtcho=
oser' [ldflags]
> qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH in =
the elf binary: '/tmp/work/core2-64-oe-linux/qtchooser/39+git4717841185d34b=
be450e3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtchooser' [=
ldflags]
> qtchooser-39+git4717841185d34bbe450e3b24445f2d35e3325a6a: No GNU_HASH in =
the elf binary: '/tmp/work/i586-oe-linux/qtchooser/39+git4717841185d34bbe45=
0e3b24445f2d35e3325a6a-r0/packages-split/qtchooser/usr/bin/qtchooser' [ldfl=
ags]
> suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf bin=
ary: '/tmp/work/armv5te-oe-linux-gnueabi/suspend-blocker/0.1.22+gitrAUTOINC=
+9aa645305f-r0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [ldf=
lags]
> suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf bin=
ary: '/tmp/work/core2-64-oe-linux/suspend-blocker/0.1.22+gitrAUTOINC+9aa645=
305f-r0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [ldflags]
> suspend-blocker-0.1.22+gitrAUTOINC+9aa645305f: No GNU_HASH in the elf bin=
ary: '/tmp/work/i586-oe-linux/suspend-blocker/0.1.22+gitrAUTOINC+9aa645305f=
-r0/packages-split/suspend-blocker/usr/bin/suspend-blocker' [ldflags]
>
>
> count: 3        issue: compile-host-path
>          Please check the log '/tmp/work/armv5te-oe-linux-gnueabi/xdotool=
/1.20100416.2809-r1/temp/log.do_compile' for more information. [compile-hos=
t-path]
>          Please check the log '/tmp/work/core2-64-oe-linux/xdotool/1.2010=
0416.2809-r1/temp/log.do_compile' for more information. [compile-host-path]
>          Please check the log '/tmp/work/i586-oe-linux/xdotool/1.20100416=
.2809-r1/temp/log.do_compile' for more information. [compile-host-path]
>
> I'll check them now.
>
>> =3D=3D Number of issues - stats =3D=3D
>> {| class=3D'wikitable'
>> !|Date                     !!colspan=3D'3'|Failed tasks                 =
    !!colspan=3D'6'|Failed depencencies                    !!|Signatures   =
         !!colspan=3D'12'|QA !!Comment
>> |-
>> ||            ||qemuarm       ||qemux86       ||qemux86_64    ||qemuarm|=
|max||min     ||qemux86||max||min     ||all   ||already-stripped      ||lib=
dir        ||textrel       ||build-deps    ||file-rdeps    ||version-going-=
backwards       ||host-user-contaminated        ||installed-vs-shipped  ||u=
nknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig   =
  ||pkgname       ||
>> |-
>> ||2017-04-01  ||2     ||7     ||2     ||N/A   ||N/A   ||N/A   ||N/A   ||=
N/A   ||N/A   ||0     ||0             ||0             ||3             ||0  =
           ||0             ||6             ||2             ||1             =
||0             ||0             ||0             ||0             ||
>> |}
>>
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> =3D=3D Failed tasks 2017-04-01 =3D=3D
>>
>> INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-=
linux.org/buildlogs/oe/world/pyro/log.report.20170403_021525.log
>>
>> =3D=3D=3D common (2) =3D=3D=3D
>>     * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.0=
.bb:do_compile
>>     * meta-openembedded/meta-oe/recipes-support/links/links_2.7.bb:do_co=
nfigure
>>
>> =3D=3D=3D common-x86 (0) =3D=3D=3D
>>
>> =3D=3D=3D qemuarm (0) =3D=3D=3D
>>
>> =3D=3D=3D qemux86 (5) =3D=3D=3D
>>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.=
4.bb:do_compile


This one is an old issue/race happening with many cores
http://lists.openembedded.org/pipermail/openembedded-core/2016-September/12=
6777.html

as they say, "It''s not quite predictable"

Cheers
Andrea




>>     * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do=
_compile
>>     * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsola=
ta_20100526.bb:do_compile
>>     * meta-openembedded/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.=
bb:do_compile
>>     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.b=
b:do_compile
>>
>> =3D=3D=3D qemux86_64 (0) =3D=3D=3D
>>
>> =3D=3D=3D Number of failed tasks (11) =3D=3D=3D
>> {| class=3Dwikitable
>> |-
>> || qemuarm    || 2     || http://logs.nslu2-linux.org/buildlogs/oe/world=
/pyro/log.world.qemuarm.20170401_212659.log/ || http://errors.yoctoproject.=
org/Errors/Build/35350/
>> |-
>> || qemux86    || 7     || http://logs.nslu2-linux.org/buildlogs/oe/world=
/pyro/log.world.qemux86.20170331_214900.log/ || http://errors.yoctoproject.=
org/Errors/Build/35348/
>> |-
>> || qemux86_64         || 2     || http://logs.nslu2-linux.org/buildlogs/=
oe/world/pyro/log.world.qemux86-64.20170401_230709.log/ || http://errors.yo=
ctoproject.org/Errors/Build/35352/
>> |}
>>
>> =3D=3D=3D PNBLACKLISTs (441) =3D=3D=3D
>>
>> =3D=3D=3D QA issues (12) =3D=3D=3D
>> {| class=3Dwikitable
>> !| Count              ||Issue
>> |-
>> ||0   ||already-stripped
>> |-
>> ||0   ||build-deps
>> |-
>> ||0   ||file-rdeps
>> |-
>> ||0   ||invalid-pkgconfig
>> |-
>> ||0   ||libdir
>> |-
>> ||0   ||pkgname
>> |-
>> ||0   ||symlink-to-sysroot
>> |-
>> ||0   ||unknown-configure-option
>> |-
>> ||1   ||installed-vs-shipped
>> |-
>> ||2   ||host-user-contaminated
>> |-
>> ||3   ||textrel
>> |-
>> ||6   ||version-going-backwards
>> |}
>>
>>
>>
>> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>>
>> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.si=
gnatures.20170402_201737.log/
>>
>> No issues detected
>>
>> QA issues by type:
>> count: 0      issue: already-stripped
>>
>>
>> count: 0      issue: libdir
>>
>>
>> count: 3      issue: textrel
>> chromium-52.0.2743.76: ELF binary '/tmp/work/i586-oe-linux/chromium/52.0=
.2743.76-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocation=
s in .text [textrel]
>> chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chro=
mium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chrom=
ium/chrome' has relocations in .text [textrel]
>> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.14=
8' has relocations in .text [textrel]
>>
>>
>> count: 0      issue: build-deps
>>
>>
>> count: 0      issue: file-rdeps
>>
>>
>> count: 6      issue: version-going-backwards
>> minicoredumper-1.0.2: Package version for package minicoredumper-dbg wen=
t backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+248=
019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
>> minicoredumper-1.0.2: Package version for package minicoredumper-dev wen=
t backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+248=
019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
>> minicoredumper-1.0.2: Package version for package minicoredumper-doc wen=
t backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+248=
019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
>> minicoredumper-1.0.2: Package version for package minicoredumper-locale =
went backwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+=
248019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
>> minicoredumper-1.0.2: Package version for package minicoredumper-staticd=
ev went backwards which would break package feeds from (0:2.0.0-r0+gitAUTOI=
NC+248019446c.0 to 0:1.0.2-r0.20) [version-going-backwards]
>> minicoredumper-1.0.2: Package version for package minicoredumper went ba=
ckwards which would break package feeds from (0:2.0.0-r0+gitAUTOINC+2480194=
46c.0 to 0:1.0.2-r0.20) [version-going-backwards]
>>
>>
>> count: 2      issue: host-user-contaminated
>> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-lij-it/usr/lib=
/locale/lij_IT/LC_NUMERIC is owned by uid 3004, which is the same as the us=
er running bitbake. This may be due to host contamination [host-user-contam=
inated]
>> glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-niu-nu/usr/lib=
/locale/niu_NU/LC_PAPER is owned by uid 3004, which is the same as the user=
 running bitbake. This may be due to host contamination [host-user-contamin=
ated]
>>
>>
>> count: 1      issue: installed-vs-shipped
>> minicoredumper: 1 installed and not shipped files. [installed-vs-shipped=
]
>>
>>
>> count: 0      issue: unknown-configure-option
>>
>>
>> count: 0      issue: symlink-to-sysroot
>>
>>
>> count: 0      issue: invalid-pkgconfig
>>
>>
>> count: 0      issue: pkgname
>
>
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

