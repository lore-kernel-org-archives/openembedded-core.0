Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3074971ADE;
	Sun, 12 Mar 2017 23:02:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u132so7351458wmg.1;
	Sun, 12 Mar 2017 16:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uBfGe4ckiQBloZ0dVszagQvRaGn2VVcuwZrPYDFBMwU=;
	b=WWtI349uSVTUdefRIU3cCzSjy5EBNNI1FWPoH9ebtcXJ+E0iOFxf9o0pDUoeWve5eo
	fsrN8EKlo7NzktLE0ArLS6i4V/VHx4Xz4SVkj26sMgNFva8PmBRxQYDxmlTJ1rXQuoUu
	1aKJsA+1hnIIsiOXrTh0D7O1XyyKn+ayBbIrfF41PCAtEaDeai/rldyUCedyIuzuX48T
	v21175vC4wALt/dZj58uYGhhD8MV8hOB43OgI/+nm8TszZj5rz/JpLhwLP/FP9GhvAlv
	YqKI7OtoCzSB+vV+pwl053HrdRucjLa55ge260aJcUKNH6ipoHAG9HuXzndKuBfgVS1i
	6T7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uBfGe4ckiQBloZ0dVszagQvRaGn2VVcuwZrPYDFBMwU=;
	b=JpJl5QgAGSs+vsPuQDWqQ2zjz5vE2JBK3ewhaixQHNWxmQ/iX288dU0+L1kajfCEAY
	DI2vkL/Ty20lwWwzz9nTNdT0rVGGaSAus3RFfSrZLXHMypcg+RWILyzazLzpzUvEtx6y
	AoTREeeLKl2AqZmQGxPe8LJHtBXfxOotykKmn1O+jBMWiTwafZ3MZCfR4opMEJ3aIcuA
	SSdz2oFcB01k6xphApQBqQH5xT7+CeWQwOs6cInCD20HqtcN3bYZNTu1/SENGFm9koGr
	z/1PzF2k600CQwQOLywD3/PjYH4ZuNeRAUoLJ+qdjZV6krRHAmQUsKqGB6HJQ+EdQygU
	VicA==
X-Gm-Message-State: AFeK/H3iubcK/XM2CzQV6ZUUxWOWnyJLCo0ZvvCrLV7nBWxebtwY2VxrNd2w6BXE1kwDekGwCun4UACKJGxQ7w==
X-Received: by 10.28.1.68 with SMTP id 65mr7516666wmb.63.1489359740645; Sun,
	12 Mar 2017 16:02:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Sun, 12 Mar 2017 16:02:20 -0700 (PDT)
In-Reply-To: <CAAQYJAssHqXNbqmC4o0fZCBfLz6bwx+cKCV3DGQCndsZqsPRRQ@mail.gmail.com>
References: <20170311180253.GA3984@jama>
	<CAPuovEJn-rrTfNZ9k0fkpbHuuGy0yauk_8QWrAy0c4EHMxAX4Q@mail.gmail.com>
	<CAAQYJAssHqXNbqmC4o0fZCBfLz6bwx+cKCV3DGQCndsZqsPRRQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 13 Mar 2017 00:02:20 +0100
Message-ID: <CAAQYJAuuTcqHD9bjS6f_Ysh-o4JPH7Gx=5_3L8sLDfURXZrXzA@mail.gmail.com>
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
X-List-Received-Date: Sun, 12 Mar 2017 23:02:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 12, 2017 at 12:34 AM, Andrea Adami <andrea.adami@gmail.com> wro=
te:
> On Sun, Mar 12, 2017 at 12:29 AM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>> On Sat, Mar 11, 2017 at 1:02 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>> This time the results are very inconsistent across different MACHINEs
>>> because they were using significantly different metadata.
>>>
>>> qemuarm is oldest 3 from 4 failures were causes by pending meta-oe
>>> changes which I've removed from master-next before qemux86* builds were
>>> restarted (after they failed badly few times).
>>
>>
>> You can add aufs-util to this list
>>
>> | make: cc: Command not found
>>
>> Regards,
>> Mark
>>
>>>
>>> qemux86-64 is latest and contains HOSTTOOLS changes from
>>> oe-core/master-next that's why there is so many failures.
>>>
>>> From the failures I see following tools which we need to either add
>>> to HOSTTOOLS or provide with added -native dependency:
>>> cc      - tcsh                - http://errors.yoctoproject.org/Errors/D=
etails/135201/
>>> cc      - u-boot-mkimage      - http://errors.yoctoproject.org/Errors/D=
etails/135203/
>>> cc      - toybox              - http://errors.yoctoproject.org/Errors/D=
etails/135210/
>>> cc      - yasm                - http://errors.yoctoproject.org/Errors/D=
etails/135214/
>>> cpp     - mkelfimage          - http://errors.yoctoproject.org/Errors/D=
etails/135211/
>>> clear   - lprng               - http://errors.yoctoproject.org/Errors/D=
etails/135207/
>>> gcc-ar  - ovmf                - http://errors.yoctoproject.org/Errors/D=
etails/135202/
>>> join    - netcf               - http://errors.yoctoproject.org/Errors/D=
etails/135208/
>>> join    - fontforge           - http://errors.yoctoproject.org/Errors/D=
etails/135209/
>>> mknod   - initramfs-live-boot - http://errors.yoctoproject.org/Errors/D=
etails/135213/
>>> nl      - dash                - http://errors.yoctoproject.org/Errors/D=
etails/135215/
>>> nl      - klibc               - http://errors.yoctoproject.org/Errors/D=
etails/135198/
>
> Martin,
>
> I'll send a patch adding explicit dependency on coreutils-native (nl).
> Thanks for your tests
>
> Cheers
> Andrea
>
>
>>> openssl - openflow            - http://errors.yoctoproject.org/Errors/D=
etails/135216/
>>> readelf - firefox             - http://errors.yoctoproject.org/Errors/D=
etails/135212/
>>> size    - iptraf              - http://errors.yoctoproject.org/Errors/D=
etails/135204/
>>> yes     - libnet-ssleay-perl  - http://errors.yoctoproject.org/Errors/D=
etails/135197/
>>> zcat    - scsirastools        - http://errors.yoctoproject.org/Errors/D=
etails/135205/
>>>
>>> Some of these were already merged in newer HOSTTOOLS patch currently
>>> in oe-core/master:
>>> mknod cpp readelf split gcc-ar gpg sftp
>>> and u-boot-mkimage should be fixed in master as well
>>>


I have to report failures with do_menuconfig because any of the
terminals (xterm, gnome-terminal, ...) is listed in HOSTTOOLS.
Setting OE_TERMINAL is pointless.

ERROR: linux-handheld-4.10-r0 do_menuconfig: No valid terminal found,
unable to open devshell.

Andrea

>>> I'll merge most meta-oe changes and retrigger new round of testing,
>>> next time the failures should be a bit more consistent again.
>>>
>>> =3D=3D Number of issues - stats =3D=3D
>>> {| class=3D'wikitable'
>>> !|Date               !!colspan=3D'3'|Failed tasks                     !=
!colspan=3D'6'|Failed depencencies                    !!|Signatures        =
    !!colspan=3D'12'|QA !!Comment
>>> |-
>>> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemua=
rm||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||=
libdir        ||textrel       ||build-deps    ||file-rdeps    ||version-goi=
ng-backwards       ||host-user-contaminated        ||installed-vs-shipped  =
||unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig=
     ||pkgname       ||
>>> |-
>>> ||2017-03-11    ||4     ||1     ||20    ||N/A   ||N/A   ||N/A   ||N/A  =
 ||N/A   ||N/A   ||0     ||0             ||0             ||0             ||=
0             ||3             ||0             ||1             ||0          =
   ||0             ||0             ||0             ||0             ||
>>> |}
>>>
>>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>>
>>> =3D=3D Failed tasks 2017-03-11 =3D=3D
>>>
>>> INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2=
-linux.org/buildlogs/oe/world/pyro/log.report.20170311_062851.log
>>>
>>> =3D=3D=3D common () =3D=3D=3D
>>>
>>> =3D=3D=3D common-x86 (1) =3D=3D=3D
>>>     * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxgu=
estdrivers_5.1.14.bb:do_install
>>>
>>> =3D=3D=3D qemuarm (4) =3D=3D=3D
>>>     * meta-openembedded/meta-oe/recipes-connectivity/libtorrent/libtorr=
ent_0.13.6.bb:do_compile
>>>     * meta-openembedded/meta-oe/recipes-devtools/rapidjson/rapidjson_1.=
1.0.bb:do_compile
>>>     * meta-openembedded/meta-oe/recipes-support/gpm/gpm_1.99.7.bb:do_in=
stall
>>>     * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compi=
le
>>>
>>> =3D=3D=3D qemux86 (0) =3D=3D=3D
>>>
>>> =3D=3D=3D qemux86_64 (19) =3D=3D=3D
>>>     * meta-browser/recipes-mozilla/firefox/firefox_45.6.0esr.bb:do_comp=
ile
>>>     * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.bb:do_compi=
le
>>>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0=
.4.bb:do_compile
>>>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-sta=
tic-utils_2.0.4.bb:do_compile
>>>     * meta-openembedded/meta-networking/recipes-protocols/openflow/open=
flow_git.bb:do_compile
>>>     * meta-openembedded/meta-networking/recipes-support/netcf/netcf_git=
.bb:do_configure
>>>     * meta-openembedded/meta-oe/recipes-core/toybox/toybox_0.7.2.bb:do_=
configure
>>>     * meta-openembedded/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb=
:do_compile
>>>     * meta-openembedded/meta-oe/recipes-extended/dash/dash_0.5.8.bb:do_=
compile
>>>     * meta-openembedded/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:d=
o_configure
>>>     * meta-openembedded/meta-oe/recipes-extended/scsirastools/scsirasto=
ols_1.6.4.bb:do_compile
>>>     * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb:d=
o_compile
>>>     * meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_20=
161012.bb:do_configure
>>>     * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-per=
l_1.65.bb:do_configure
>>>     * openembedded-core/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.=
bb:do_compile
>>>     * openembedded-core/meta/recipes-core/initrdscripts/initramfs-live-=
boot_1.0.bb:do_install
>>>     * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile
>>>     * openembedded-core/meta/recipes-devtools/mkelfimage/mkelfimage_git=
.bb:do_compile
>>>     * openembedded-core/meta/recipes-devtools/yasm/yasm_1.3.0.bb:do_com=
pile
>>>
>>> =3D=3D=3D Number of failed tasks (25) =3D=3D=3D
>>> {| class=3Dwikitable
>>> |-
>>> || qemuarm      || 4     || http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.world.qemuarm.20170307_025324.log/ || http://errors.yoctoproje=
ct.org/Errors/Build/33300/
>>> |-
>>> || qemux86      || 1     || http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.world.qemux86.20170309_121824.log/ || http://errors.yoctoproje=
ct.org/Errors/Build/33551/
>>> |-
>>> || qemux86_64   || 20    || http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.world.qemux86-64.20170311_042112.log/ || http://errors.yoctopr=
oject.org/Errors/Build/33631/
>>> |}
>>>
>>> =3D=3D=3D PNBLACKLISTs (351) =3D=3D=3D
>>>
>>> =3D=3D=3D QA issues (4) =3D=3D=3D
>>> {| class=3Dwikitable
>>> !| Count                ||Issue
>>> |-
>>> ||0     ||already-stripped
>>> |-
>>> ||0     ||build-deps
>>> |-
>>> ||0     ||installed-vs-shipped
>>> |-
>>> ||0     ||invalid-pkgconfig
>>> |-
>>> ||0     ||libdir
>>> |-
>>> ||0     ||pkgname
>>> |-
>>> ||0     ||symlink-to-sysroot
>>> |-
>>> ||0     ||textrel
>>> |-
>>> ||0     ||unknown-configure-option
>>> |-
>>> ||0     ||version-going-backwards
>>> |-
>>> ||1     ||host-user-contaminated
>>> |-
>>> ||3     ||file-rdeps
>>> |}
>>>
>>>
>>>
>>> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>>>
>>> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.s=
ignatures.20170307_235322.log/
>>>
>>> No issues detected
>>>
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

