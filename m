Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id B148760664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 20:28:11 +0000 (UTC)
Received: from e6520eb (unknown [82.233.81.124]) (Authenticated sender: eukrea)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 68B679400BA;
	Wed, 18 Sep 2013 22:28:05 +0200 (CEST)
Date: Wed, 18 Sep 2013 22:28:03 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130918222803.39fdaaec@e6520eb>
In-Reply-To: <1379522926-22817-1-git-send-email-ross.burton@intel.com>
References: <1379522926-22817-1-git-send-email-ross.burton@intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemu: add option to disable X grabs
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
X-List-Received-Date: Wed, 18 Sep 2013 20:28:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Le Wed, 18 Sep 2013 17:48:45 +0100,
Ross Burton <ross.burton@intel.com> a =E9crit :
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 97e9b7b..1b861d7 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -17,6 +17,7 @@ SRC_URI =3D "\
>      file://powerpc_rom.bin \
>      file://no-strip.patch \
>      file://larger_default_ram_size.patch \
> +    file://disable-grabs.patch \
>      "
> =20
>  SRC_URI_append_class-nativesdk =3D "\

that seems to break the build here (while building meta-toolchain-qte) :
ERROR: Command Error: exit status: 1  Output:
Applying patch disable-grabs.patch
patching file ui/sdl.c
Hunk #3 FAILED at 912.
1 out of 3 hunks FAILED -- rejects in file ui/sdl.c
Patch disable-grabs.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored
in: /scratch/eb/eukrea2/master/setup-scripts/build/tmp-defaultsetup-eglibc-=
eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-qemu/1.5.0-r0/temp/log.do_=
patch.14821
ERROR: Task 2313
(virtual:nativesdk:/scratch/eb/eukrea2/master/setup-scripts/sources/openemb=
edded-core/meta/recipes-devtools/qemu/qemu_1.5.0.bb,
do_patch) failed with exit code '1'

Eric

