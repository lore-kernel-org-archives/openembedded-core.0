Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TEDqs-0006w4-BM
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 08:33:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Sep 2012 23:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,446,1344236400"; d="scan'208";a="194704907"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 18 Sep 2012 23:20:32 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.34]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.75]) with mapi id
	14.01.0355.002; Wed, 19 Sep 2012 07:20:31 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] qemux86-64: Support for KVM, paravirt and
	virtio added
Thread-Index: AQHNlZ1JLB3n+wd/kk2avIFgMtR8GpeQ4VIAgABQv9A=
Date: Wed, 19 Sep 2012 06:20:30 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16197974@IRSMSX102.ger.corp.intel.com>
References: <1347973078-12399-1-git-send-email-cristian.iorga@intel.com>
	<50592E24.8070701@linux.intel.com>
In-Reply-To: <50592E24.8070701@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemux86-64: Support for KVM, paravirt and virtio added
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 06:33:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Actually, there are two patches.
One for qemux86 and one for qemux86-64.
The one for qemux86-64 is dependent of the qemux86 one.

Anyhow, if I will resend both of them with a cover letter.

Regards,
Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Wednesday, September 19, 2012 5:30 AM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] qemux86-64: Support for KVM, paravirt and vi=
rtio added

On 09/18/2012 05:57 AM, Cristian Iorga wrote:
>      KVM, paravirtualization and virtio drivers are now activated
>      in runqemu using the kvm option flag for qemux86-64.
>      Host CPU features are also exported to guest OS (Yocto Linux).
>      Usage example: runqemu qemux86-64 core-image-x11 kvm
>
>      Implements [YOCTO #2550].
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
>   scripts/runqemu-internal                     |    4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
>

This seems to be an incremental change over the last one, and I have lost t=
rack of which applies against which, can you please resend a versioned patc=
h (ie [PATCH v2] ) that is complete.

Thanks
	Sau!

> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb=20
> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 32ae02b..06dd677 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D=20
> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=3Dgit;nocheckou
>
>   LINUX_VERSION ?=3D "3.4.10"
>
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.3"
>   PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
>   KMETA =3D "meta"
> @@ -28,4 +28,5 @@ KERNEL_FEATURES_append =3D " features/netfilter"
>   KERNEL_FEATURES_append_qemux86=3D" cfg/sound"
>   KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound"
>   KERNEL_FEATURES_append_qemux86=3D" cfg/paravirt_kvm"
> +KERNEL_FEATURES_append_qemux86-64=3D" cfg/paravirt_kvm"
>   KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx3=
2", " cfg/x32", "" ,d)}"
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal index=20
> f2c8d83..6e20dd7 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -350,8 +350,8 @@ if [ "$MACHINE" =3D "qemux86-64" ]; then
>       QEMU=3Dqemu-system-x86_64
>       QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
>       if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" ]; then
> -        KERNCMDLINE=3D"vga=3D0 root=3D/dev/hda rw mem=3D$QEMU_MEMORY $KE=
RNEL_NETWORK_CMD"
> -        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -hda $ROOTFS $QEMU_UI_OPTIONS"
> +        KERNCMDLINE=3D"vga=3D0 root=3D$DROOT rw mem=3D$QEMU_MEMORY $KERN=
EL_NETWORK_CMD"
> +        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTION=
S"
>       fi
>       if [ "$FSTYPE" =3D "nfs" ]; then
>           if [ "x$ROOTFS" =3D "x" ]; then
>


