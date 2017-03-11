Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 073D97796B;
	Sat, 11 Mar 2017 23:34:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u132so4446041wmg.1;
	Sat, 11 Mar 2017 15:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4/lajtZ1QzdSdg1Kgzxx92oHAGQFWuS7Is2ZBgXcOmw=;
	b=JWPuqDuJe+6eZZFPk9Hd5/IkLpQe+wsIeC0m5oh1qPAFLyl4Yj4gtGLOGY4D3eve5T
	aO2ttOdJy5XImG9o8744HJtEpyfTdvg9uq6ZSjQApmjpFvOc7RXiCrd5ydtReF198Dej
	Exx92NMMIiMVQMWA6Uv6yMo3FCoynCK/48PZfiMB8D8JQ/vb0cwQtAbkO80mlKNxUUo1
	xg45hTRnWy6ZuC5cmRhwJATBi4NR9ranI7HYpQQM5o1ijxTXnhPx8mX4rW6JgXXg+dzG
	Q3TCs+cMev5IWZI6R4AzVDbxY+FI0YFY8fTDdNiedZaXxjVkLahtuEu+siN+451DDweg
	bl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4/lajtZ1QzdSdg1Kgzxx92oHAGQFWuS7Is2ZBgXcOmw=;
	b=f9cWDyqZ5hkayE/+OC+g/IX1oICAnrw+he/eK/jqE0prUIUbjDyfRFZtjHXqHKTlw0
	UJvNAq3H1Z8ezFpq1uBbd+c0spRkkStRod6tWZiX1uP7kHy5UpFNGuS9mDVvHFUBziXj
	BfEir1qNkA5cUw4EMkuu1RnPPcyT/vjQZPQmVHIEX+CjNzE6/5Wa2eDch+FDcVFgfjZQ
	oFFJNRDDiKUhrEeRydkp+zmPORJtsO+OmTVeMjHEVTVxGHUBEN0cxyz+s05dZnM28A6O
	25Qgf+xndlmbF07InHuPUwsKZktQ3jm8UbF3kZbCWYkSjVru+2xeq53NQoZKjzCQkzIZ
	L//g==
X-Gm-Message-State: AFeK/H3CEfok/1ebng4uipCg12LiAGqkgp7XWPOIprKBrbLHyDSopUTB5G/+V7zgVLlno5vycfn8iDghiHf8Nw==
X-Received: by 10.28.55.68 with SMTP id e65mr4704622wma.62.1489275268454; Sat,
	11 Mar 2017 15:34:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Sat, 11 Mar 2017 15:34:27 -0800 (PST)
In-Reply-To: <CAPuovEJn-rrTfNZ9k0fkpbHuuGy0yauk_8QWrAy0c4EHMxAX4Q@mail.gmail.com>
References: <20170311180253.GA3984@jama>
	<CAPuovEJn-rrTfNZ9k0fkpbHuuGy0yauk_8QWrAy0c4EHMxAX4Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sun, 12 Mar 2017 00:34:27 +0100
Message-ID: <CAAQYJAssHqXNbqmC4o0fZCBfLz6bwx+cKCV3DGQCndsZqsPRRQ@mail.gmail.com>
To: mark.asselstine@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-03-11
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
X-List-Received-Date: Sat, 11 Mar 2017 23:34:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 12, 2017 at 12:29 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Sat, Mar 11, 2017 at 1:02 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> This time the results are very inconsistent across different MACHINEs
>> because they were using significantly different metadata.
>>
>> qemuarm is oldest 3 from 4 failures were causes by pending meta-oe
>> changes which I've removed from master-next before qemux86* builds were
>> restarted (after they failed badly few times).
>
>
> You can add aufs-util to this list
>
> | make: cc: Command not found
>
> Regards,
> Mark
>
>>
>> qemux86-64 is latest and contains HOSTTOOLS changes from
>> oe-core/master-next that's why there is so many failures.
>>
>> From the failures I see following tools which we need to either add
>> to HOSTTOOLS or provide with added -native dependency:
>> cc      - tcsh                - http://errors.yoctoproject.org/Errors/De=
tails/135201/
>> cc      - u-boot-mkimage      - http://errors.yoctoproject.org/Errors/De=
tails/135203/
>> cc      - toybox              - http://errors.yoctoproject.org/Errors/De=
tails/135210/
>> cc      - yasm                - http://errors.yoctoproject.org/Errors/De=
tails/135214/
>> cpp     - mkelfimage          - http://errors.yoctoproject.org/Errors/De=
tails/135211/
>> clear   - lprng               - http://errors.yoctoproject.org/Errors/De=
tails/135207/
>> gcc-ar  - ovmf                - http://errors.yoctoproject.org/Errors/De=
tails/135202/
>> join    - netcf               - http://errors.yoctoproject.org/Errors/De=
tails/135208/
>> join    - fontforge           - http://errors.yoctoproject.org/Errors/De=
tails/135209/
>> mknod   - initramfs-live-boot - http://errors.yoctoproject.org/Errors/De=
tails/135213/
>> nl      - dash                - http://errors.yoctoproject.org/Errors/De=
tails/135215/
>> nl      - klibc               - http://errors.yoctoproject.org/Errors/De=
tails/135198/

Martin,

I'll send a patch adding explicit dependency on coreutils-native (nl).
Thanks for your tests

Cheers
Andrea


>> openssl - openflow            - http://errors.yoctoproject.org/Errors/De=
tails/135216/
>> readelf - firefox             - http://errors.yoctoproject.org/Errors/De=
tails/135212/
>> size    - iptraf              - http://errors.yoctoproject.org/Errors/De=
tails/135204/
>> yes     - libnet-ssleay-perl  - http://errors.yoctoproject.org/Errors/De=
tails/135197/
>> zcat    - scsirastools        - http://errors.yoctoproject.org/Errors/De=
tails/135205/
>>
>> Some of these were already merged in newer HOSTTOOLS patch currently
>> in oe-core/master:
>> mknod cpp readelf split gcc-ar gpg sftp
>> and u-boot-mkimage should be fixed in master as well
>>
>> I'll merge most meta-oe changes and retrigger new round of testing,
>> next time the failures should be a bit more consistent again.
>>
>> =3D=3D Number of issues - stats =3D=3D
>> {| class=3D'wikitable'
>> !|Date               !!colspan=3D'3'|Failed tasks                     !!=
colspan=3D'6'|Failed depencencies                    !!|Signatures         =
   !!colspan=3D'12'|QA !!Comment
>> |-
>> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemuar=
m||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||l=
ibdir        ||textrel       ||build-deps    ||file-rdeps    ||version-goin=
g-backwards       ||host-user-contaminated        ||installed-vs-shipped  |=
|unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig =
    ||pkgname       ||
>> |-
>> ||2017-03-11    ||4     ||1     ||20    ||N/A   ||N/A   ||N/A   ||N/A   =
||N/A   ||N/A   ||0     ||0             ||0             ||0             ||0=
             ||3             ||0             ||1             ||0           =
  ||0             ||0             ||0             ||0             ||
>> |}
>>
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> =3D=3D Failed tasks 2017-03-11 =3D=3D
>>
>> INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-=
linux.org/buildlogs/oe/world/pyro/log.report.20170311_062851.log
>>
>> =3D=3D=3D common () =3D=3D=3D
>>
>> =3D=3D=3D common-x86 (1) =3D=3D=3D
>>     * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxgue=
stdrivers_5.1.14.bb:do_install
>>
>> =3D=3D=3D qemuarm (4) =3D=3D=3D
>>     * meta-openembedded/meta-oe/recipes-connectivity/libtorrent/libtorre=
nt_0.13.6.bb:do_compile
>>     * meta-openembedded/meta-oe/recipes-devtools/rapidjson/rapidjson_1.1=
.0.bb:do_compile
>>     * meta-openembedded/meta-oe/recipes-support/gpm/gpm_1.99.7.bb:do_ins=
tall
>>     * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compil=
e
>>
>> =3D=3D=3D qemux86 (0) =3D=3D=3D
>>
>> =3D=3D=3D qemux86_64 (19) =3D=3D=3D
>>     * meta-browser/recipes-mozilla/firefox/firefox_45.6.0esr.bb:do_compi=
le
>>     * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.bb:do_compil=
e
>>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.=
4.bb:do_compile
>>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-stat=
ic-utils_2.0.4.bb:do_compile
>>     * meta-openembedded/meta-networking/recipes-protocols/openflow/openf=
low_git.bb:do_compile
>>     * meta-openembedded/meta-networking/recipes-support/netcf/netcf_git.=
bb:do_configure
>>     * meta-openembedded/meta-oe/recipes-core/toybox/toybox_0.7.2.bb:do_c=
onfigure
>>     * meta-openembedded/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb:=
do_compile
>>     * meta-openembedded/meta-oe/recipes-extended/dash/dash_0.5.8.bb:do_c=
ompile
>>     * meta-openembedded/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do=
_configure
>>     * meta-openembedded/meta-oe/recipes-extended/scsirastools/scsirastoo=
ls_1.6.4.bb:do_compile
>>     * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb:do=
_compile
>>     * meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_201=
61012.bb:do_configure
>>     * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl=
_1.65.bb:do_configure
>>     * openembedded-core/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.b=
b:do_compile
>>     * openembedded-core/meta/recipes-core/initrdscripts/initramfs-live-b=
oot_1.0.bb:do_install
>>     * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile
>>     * openembedded-core/meta/recipes-devtools/mkelfimage/mkelfimage_git.=
bb:do_compile
>>     * openembedded-core/meta/recipes-devtools/yasm/yasm_1.3.0.bb:do_comp=
ile
>>
>> =3D=3D=3D Number of failed tasks (25) =3D=3D=3D
>> {| class=3Dwikitable
>> |-
>> || qemuarm      || 4     || http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/pyro/log.world.qemuarm.20170307_025324.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/33300/
>> |-
>> || qemux86      || 1     || http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/pyro/log.world.qemux86.20170309_121824.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/33551/
>> |-
>> || qemux86_64   || 20    || http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/pyro/log.world.qemux86-64.20170311_042112.log/ || http://errors.yoctopro=
ject.org/Errors/Build/33631/
>> |}
>>
>> =3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D
>>
>> =3D=3D=3D QA issues (4) =3D=3D=3D
>> {| class=3Dwikitable
>> !| Count                ||Issue
>> |-
>> ||0     ||already-stripped
>> |-
>> ||0     ||build-deps
>> |-
>> ||0     ||installed-vs-shipped
>> |-
>> ||0     ||invalid-pkgconfig
>> |-
>> ||0     ||libdir
>> |-
>> ||0     ||pkgname
>> |-
>> ||0     ||symlink-to-sysroot
>> |-
>> ||0     ||textrel
>> |-
>> ||0     ||unknown-configure-option
>> |-
>> ||0     ||version-going-backwards
>> |-
>> ||1     ||host-user-contaminated
>> |-
>> ||3     ||file-rdeps
>> |}
>>
>>
>>
>> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>>
>> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.si=
gnatures.20170307_235322.log/
>>
>> No issues detected
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

