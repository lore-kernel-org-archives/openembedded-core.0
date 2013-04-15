Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1URjXg-00046p-Ty
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 15:34:07 +0200
Received: by mail-la0-f43.google.com with SMTP id eg20so3512004lab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=ZTUO9phVjfQo2jEVqAfVkZlzvc+p70U9AE6hE9otwtg=;
	b=PpE0J5/e16z+wTc8OSMPfCliiGQCCogJ4MzdngMHCS7gHd+97rQc6hab9JVd18vQ49
	WUW5Q0sHoYo5jlEIx6DoGVJ82BV9+mV/BbtjJJ+i5aP/a0M/aTlJ5pS4VmocL0ebJ+S7
	jHG3QUu+iVGat27fZpScSUSCnNMiZ+29n3qkFsEVPF62eKiDiWcJNWvbMp/MrtX7Q4iF
	aYoAdrGfqDDenDnrr9v2Y3W4lxL3cPH8uNVf5Vwq04lIQ3NLBtC6WaNcuRYP6DP41iKU
	pU1Ox0cKqUufVEnSGg1KQVHFpqYecWlnS9NwHPquPgiJqIwTdB/HpSoIG0CAwsfzdvTK
	f97w==
MIME-Version: 1.0
X-Received: by 10.152.6.229 with SMTP id e5mr10534746laa.6.1366031787951; Mon,
	15 Apr 2013 06:16:27 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Mon, 15 Apr 2013 06:16:27 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16224BAC@IRSMSX102.ger.corp.intel.com>
References: <1365518803-11025-1-git-send-email-alexandru.damian@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16224803@IRSMSX102.ger.corp.intel.com>
	<CAJ2CSBtt4kwjaOk3q87-UaO7SKJh+ePWrQsPoErckVUgzcA-hQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16224BAC@IRSMSX102.ger.corp.intel.com>
Date: Mon, 15 Apr 2013 09:16:27 -0400
Message-ID: <CADkTA4Owe9DPN3Lcao_y2VvzcKPDWuS=T2ZTVpDcK0gnZ=XO1g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>, "Damian,
	Alexandru" <alexandru.damian@intel.com>,
	"tom.zanussi@linux.intel.com" <tom.zanussi@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: use default qemu CPU definition
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
X-List-Received-Date: Mon, 15 Apr 2013 13:34:27 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 8:49 AM, Iorga, Cristian
<cristian.iorga@intel.com> wrote:
> Hi Alex,
>
>
>
> See my comments below.
>

The coloured email are hard to quote reply .. so along with not burying com=
ments
in bugzilla, plan text quoted replies is a good idea as well.

>
>
> Regards,
>
> Cristian
>
>
>
> From: Damian, Alexandru [mailto:alexandru.damian@intel.com]
> Sent: Monday, April 15, 2013 3:31 PM
> To: Iorga, Cristian
> Cc: richard.purdie@linuxfoundation.org; tom.zanussi@linux.intel.com; Burt=
on,
> Ross; paul.eggleton@linux.intel.com;
> openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] qemu: use default qemu CPU definition
>
>
>
> Hi Cristian,
>
>
>
> Please do post comments on patch on the mailing list.
>
>
>
> Regarding the message itself, quoted below, I am addressing your specific
> concerns.
>
> - There is no performance impact between "qemu64" and "host" CPU options.
> The only thing changing is the level of private instructions that the ker=
nel
> will attempt - which should be clearly restricted to "qemu64" and not "ho=
st"
> since we build Yocto for the "qemu" machine.
>
>                Agree.
>
> - I agree that there is an underlying problem in the kernel, but that is =
not
> our primary concern, see no 1. It might be our concern if we'd build for =
a
> specific BSP which showed the problem, but as it stands, it's KVM folk's
> concern. Funny enough, they know about the problem (I tracked on their
> mailing list), but they don't have a fix since it runs as it's designed
> right now - that is, the faulty behavior is a result of how it should wor=
k
> with the current design.
>
>                I don=92t know the problems exactly in this case, but:
>
> -        I suggested that the differences between how this issue is
> reproducible or not of different host kernels is strange, and I fail to s=
ee
> the logical connection between your patch and the aforementioned behavior=
s.
> Can you please provide an explanation?
>
> -        It is also strange that this issue is reproducible only on
> qemux86-64 and not on qemux86 (qemux86 also exports CPU of the VM as host
> CPU), which suggests a different root cause.
>
>
>
> I still recommend merging this patch since it fixes the problem with the
> right fix.
>
> -        That=92s a fix, but is it the right one, given my previous
> observations?
>
>
>
> Also, may I remind you that this a regression?
>
> This issue was not present with the same kernel, on the same distro and i=
t
> is not present on qemux86 VMs.

I've been seeing this same thing with recent qemu / KVM combinations. In pl=
aces
that we used to be able to pass the -cpu flag to qemu to allow the
passthrough of
host capabilities, it now fails and traps the guest, which as you've seen o=
n the
KVM list and mentioned above, is how it is supposed to work at the moment.

So I'd also be ok with this fix, until the upstream implementation changes =
and
it may then be allowed again.

Cheers,

Bruce



>
>
>
> Cheers,
>
> Alex
>
>
>
> Original message:
>
> Hi Alex,
>
> I might be wrong, and I need more time to investigate, but I don't agree
> with the fix you proposed for this issue.
>
>
>
> What you propose is just a step back from how qemu should optimally work,
> meaning exporting "-cpu host".
>
>
>
> That's one thing.
>
>
>
> Another thing is the described issue seems to be specific to some kernels=
 on
> the host.
>
> For example, I checked with LaurP and AlexG and thes issue is:
>
> - reproducible on Ubuntu 12.10 with kernel 3.5.0.27 and Fedora Core 18 wi=
th
> kernel 3.8.5.
>
> - not reproducible with Ubuntu 12.04 with kernel 3.2.x (need to check the
> exact details with LaurP).
>
>
>
> This issue needs more investigation.
>
>
>
> Regards,
>
> Cristian
>
>
>
> On Mon, Apr 15, 2013 at 9:58 AM, Iorga, Cristian <cristian.iorga@intel.co=
m>
> wrote:
>
> Hi Alex,
>
> See my comments regarding this patch at:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3908
>
> Regards,
> Cristian
>
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Al=
ex
> DAMIAN
> Sent: Tuesday, April 09, 2013 5:47 PM
> To: richard.purdie@linuxfoundation.org; tom.zanussi@linux.intel.com; Burt=
on,
> Ross; paul.eggleton@linux.intel.com;
> openembedded-core@lists.openembedded.org
> Cc: Damian, Alexandru
> Subject: [OE-core] [PATCH] qemu: use default qemu CPU definition
>
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This fixes guest crashes when trying to use restricted instructions based=
 on
> CPU description. Using default qemu CPU descriptions restrict faults on
> using restricted model-specific registers.
>
> [YOCTO #3908]
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  scripts/runqemu          |    2 +-
>  scripts/runqemu-internal |    6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu index 8ed1226..43d7600 100=
755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -261,7 +261,7 @@ if [ "x$KVM_ENABLED" =3D "xyes" ]; then
>          exit 1;
>      fi
>      if [ -w /dev/kvm -a -r /dev/kvm ]; then
> -        SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
> +        SCRIPT_QEMU_OPT=3D"$SCRIPT_QEMU_OPT -enable-kvm "
>          KVM_ACTIVE=3D"yes"
>      else
>          echo "You have no rights on /dev/kvm."
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal index
> e8191d1..a7813e5 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -323,10 +323,11 @@ fi
>
>  if [ "$MACHINE" =3D "qemux86" ]; then
>      QEMU=3Dqemu-system-i386
> +    QEMU_CPU_OPTIONS=3D"-cpu qemu32"
>      QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
>      if [ "$FSTYPE" =3D "ext2" -o "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "=
btrfs" ];
> then
>          KERNCMDLINE=3D"vga=3D0 uvesafb.mode_option=3D640x480-32 root=3D$=
DROOT rw
> mem=3D$QEMU_MEMORY $KERNEL_NETWORK_CMD"
> -        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTION=
S"
> +        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_CPU_OPTIO=
NS
> $QEMU_UI_OPTIONS"
>      fi
>      if [ "$FSTYPE" =3D "nfs" ]; then
>          if [ "$NFS_SERVER" =3D "192.168.7.1" -a ! -d "$NFS_DIR" ]; then =
@@
> -347,10 +348,11 @@ fi
>
>  if [ "$MACHINE" =3D "qemux86-64" ]; then
>      QEMU=3Dqemu-system-x86_64
> +    QEMU_CPU_OPTIONS=3D"-cpu qemu64"
>      QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -vga vmware"
>      if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" ]; then
>          KERNCMDLINE=3D"vga=3D0 root=3D$DROOT rw mem=3D$QEMU_MEMORY
> $KERNEL_NETWORK_CMD"
> -        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTION=
S"
> +        QEMUOPTIONS=3D"$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_CPU_OPTIO=
NS
> $QEMU_UI_OPTIONS"
>      fi
>      if [ "$FSTYPE" =3D "nfs" ]; then
>          if [ "x$ROOTFS" =3D "x" ]; then
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


