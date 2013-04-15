Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1URjf5-0004mS-Gk
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 15:42:49 +0200
Received: by mail-ob0-f172.google.com with SMTP id eh20so4133476obb.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 06:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=izcDTiLcUI8/xKEIcpmFqif8iwArJKUW5Cf6A0QKW6I=;
	b=MPyNcIYaTbuiczYd78ckB9CDHv4nOiOqUDnpHtPqwitQ/uSDqVCoNp/QQyn0T1tvKl
	0mNYmc3GHz1yhCf5f62SVo0rHKbffA6slUHXBi/j8K7f5MbMUbO75Xa8qFQPeIEUsZyv
	/eIhTGYKwiWhbkhPWV+XzXXk8owkZlguW98TQ5BofJg072YXB8oLLd13k+PO3vpbxSx9
	op1GkKf5JU2nfZUy78Okhn+XLiAOFn4Mwm7Pebmo1CXmZADXLofdzaOhYMSk+tmsTmRN
	59slhQb+yOyUwMixnzMCg/k74nT+3eHmfzFcJ+paj2NQ0O7vLqUagZaR+wSQl0USq3kA
	pxfA==
MIME-Version: 1.0
X-Received: by 10.60.29.37 with SMTP id g5mr7364409oeh.140.1366032246132; Mon,
	15 Apr 2013 06:24:06 -0700 (PDT)
Received: by 10.76.167.164 with HTTP; Mon, 15 Apr 2013 06:24:05 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16224BAC@IRSMSX102.ger.corp.intel.com>
References: <1365518803-11025-1-git-send-email-alexandru.damian@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16224803@IRSMSX102.ger.corp.intel.com>
	<CAJ2CSBtt4kwjaOk3q87-UaO7SKJh+ePWrQsPoErckVUgzcA-hQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16224BAC@IRSMSX102.ger.corp.intel.com>
Date: Mon, 15 Apr 2013 14:24:05 +0100
Message-ID: <CAJ2CSBvJssCsQ3Cs+jJv612YHZhzZd6f2GwWgexA_6576O=nVw@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQlbaGwoK1gXGV1aEjTMFn+bWgT85/SuskZzXeSPh82+1ltU19aiRuiC38gR8UBjvU2Fk4LU
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"tom.zanussi@linux.intel.com" <tom.zanussi@linux.intel.com>
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
X-List-Received-Date: Mon, 15 Apr 2013 13:42:55 -0000
Content-Type: multipart/alternative; boundary=e89a8fb1f818c883cf04da662a10

--e89a8fb1f818c883cf04da662a10
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Please see comments below,

Cheers,
Alex


On Mon, Apr 15, 2013 at 1:49 PM, Iorga, Cristian
<cristian.iorga@intel.com>wrote:

> Hi Alex,
>
> See my comments below.
>
> Regards,
> Cristian
>
> From: Damian, Alexandru [mailto:alexandru.damian@intel.com]
> Sent: Monday, April 15, 2013 3:31 PM
> To: Iorga, Cristian
> Cc: richard.purdie@linuxfoundation.org; tom.zanussi@linux.intel.com;
> Burton, Ross; paul.eggleton@linux.intel.com;
> openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] qemu: use default qemu CPU definition
>
> Hi Cristian,
>
> Please do post comments on patch on the mailing list.
>
> Regarding the message itself, quoted below, I am addressing your specific
> concerns.
> - There is no performance impact between "qemu64" and "host" CPU options.
> The only thing changing is the level of private instructions that the
> kernel will attempt - which should be clearly restricted to "qemu64" and
> not "host" since we build Yocto for the "qemu" machine.
>                Agree.
> - I agree that there is an underlying problem in the kernel, but that is
> not our primary concern, see no 1. It might be our concern if we'd build
> for a specific BSP which showed the problem, but as it stands, it's KVM
> folk's concern. Funny enough, they know about the problem (I tracked on
> their mailing list), but they don't have a fix since it runs as it's
> designed right now - that is, the faulty behavior is a result of how it
> should work with the current design.
>                I don=E2=80=99t know the problems exactly in this case, bu=
t:
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


The root cause is this: on specific CPU hosts, the kernel is trying to
execute a "read model specific register" instruction. This is not handled
by the qemu, and it's executed directly by host in KVM emulation mode. This
triggers a GP0 fault, as designed, since it's not executed in ring 0 - it's
executed in ring 3 since KVM is executing in userspace. So the guest now
executes a GP0 handler which stops the guest machine.

The fix is actually preventing execution of the RDMSR/WRMSR instructions in
KVM mode since the guest kernel know knows it's under emulation.

This is what I mean that the system actually works as designed.


> I still recommend merging this patch since it fixes the problem with the
> right fix.
>
> -        That=E2=80=99s a fix, but is it the right one, given my previous
> observations?
>

Yes, it is.

>
> Also, may I remind you that this a regression?
> This issue was not present with the same kernel, on the same distro and i=
t
> is not present on qemux86 VMs.
>
> Cheers,
> Alex
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
> Another thing is the described issue seems to be specific to some kernels
> on the host.
>
> For example, I checked with LaurP and AlexG and thes issue is:
>
> - reproducible on Ubuntu 12.10 with kernel 3.5.0.27 and Fedora Core 18
> with kernel 3.8.5.
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
> On Mon, Apr 15, 2013 at 9:58 AM, Iorga, Cristian <cristian.iorga@intel.co=
m
> <mailto:cristian.iorga@intel.com>> wrote:
> Hi Alex,
>
> See my comments regarding this patch at:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3908
>
> Regards,
> Cristian
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org<mailto:
> openembedded-core-bounces@lists.openembedded.org> [mailto:
> openembedded-core-bounces@lists.openembedded.org<mailto:
> openembedded-core-bounces@lists.openembedded.org>] On Behalf Of Alex
> DAMIAN
> Sent: Tuesday, April 09, 2013 5:47 PM
> To: richard.purdie@linuxfoundation.org<mailto:
> richard.purdie@linuxfoundation.org>; tom.zanussi@linux.intel.com<mailto:
> tom.zanussi@linux.intel.com>; Burton, Ross; paul.eggleton@linux.intel.com
> <mailto:paul.eggleton@linux.intel.com>;
> openembedded-core@lists.openembedded.org<mailto:
> openembedded-core@lists.openembedded.org>
> Cc: Damian, Alexandru
> Subject: [OE-core] [PATCH] qemu: use default qemu CPU definition
>
> From: Alexandru DAMIAN <alexandru.damian@intel.com<mailto:
> alexandru.damian@intel.com>>
>
> This fixes guest crashes when trying to use restricted instructions based
> on CPU description. Using default qemu CPU descriptions restrict faults o=
n
> using restricted model-specific registers.
>
> [YOCTO #3908]
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com<mailto:
> alexandru.damian@intel.com>>
> ---
>  scripts/runqemu          |    2 +-
>  scripts/runqemu-internal |    6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu index 8ed1226..43d7600
> 100755
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
btrfs"
> ]; then
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
> Openembedded-core@lists.openembedded.org<mailto:
> Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--e89a8fb1f818c883cf04da662a10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please see comments below,<div><br></div><div>Cheers,</div=
><div>Alex</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quot=
e">On Mon, Apr 15, 2013 at 1:49 PM, Iorga, Cristian <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">cristian.iorga=
@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Alex,<br>
<br>
See my comments below.<br>
<br>
Regards,<br>
Cristian<br>
<br>
From: Damian, Alexandru [mailto:<a href=3D"mailto:alexandru.damian@intel.co=
m">alexandru.damian@intel.com</a>]<br>
Sent: Monday, April 15, 2013 3:31 PM<br>
To: Iorga, Cristian<br>
Cc: <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>; <a href=3D"mailto:tom.zanussi@linux.intel.com">tom.z=
anussi@linux.intel.com</a>; Burton, Ross; <a href=3D"mailto:paul.eggleton@l=
inux.intel.com">paul.eggleton@linux.intel.com</a>; <a href=3D"mailto:openem=
bedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.or=
g</a><br>

Subject: Re: [OE-core] [PATCH] qemu: use default qemu CPU definition<br>
<div class=3D"im"><br>
Hi Cristian,<br>
<br>
Please do post comments on patch on the mailing list.<br>
<br>
Regarding the message itself, quoted below, I am addressing your specific c=
oncerns.<br>
- There is no performance impact between &quot;qemu64&quot; and &quot;host&=
quot; CPU options. The only thing changing is the level of private instruct=
ions that the kernel will attempt - which should be clearly restricted to &=
quot;qemu64&quot; and not &quot;host&quot; since we build Yocto for the &qu=
ot;qemu&quot; machine.<br>

</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Agree.<br>
<div class=3D"im">- I agree that there is an underlying problem in the kern=
el, but that is not our primary concern, see no 1. It might be our concern =
if we&#39;d build for a specific BSP which showed the problem, but as it st=
ands, it&#39;s KVM folk&#39;s concern. Funny enough, they know about the pr=
oblem (I tracked on their mailing list), but they don&#39;t have a fix sinc=
e it runs as it&#39;s designed right now - that is, the faulty behavior is =
a result of how it should work with the current design.<br>

</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I don=E2=80=99=
t know the problems exactly in this case, but:<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0I suggested that the differences between how t=
his issue is reproducible or not of different host kernels is strange, and =
I fail to see the logical connection between your patch and the aforementio=
ned behaviors. Can you please provide an explanation?<br>

<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0It is also strange that this issue is reproduc=
ible only on qemux86-64 and not on qemux86 (qemux86 also exports CPU of the=
 VM as host CPU), which suggests a different root cause.<br></blockquote><d=
iv><br></div><div>
<br></div><div style>The root cause is this: on specific CPU hosts, the ker=
nel is trying to execute a &quot;read model specific register&quot; instruc=
tion. This is not handled by the qemu, and it&#39;s executed directly by ho=
st in KVM emulation mode. This triggers a GP0 fault, as designed, since it&=
#39;s not executed in ring 0 - it&#39;s executed in ring 3 since KVM is exe=
cuting in userspace. So the guest now executes a GP0 handler which stops th=
e guest machine.</div>
<div style><br></div><div style>The fix is actually preventing execution of=
 the RDMSR/WRMSR instructions in KVM mode since the guest kernel know knows=
 it&#39;s under emulation. =C2=A0=C2=A0</div><div>=C2=A0</div><div style>Th=
is is what I mean that the system actually works as designed.</div>
<div style><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
I still recommend merging this patch since it fixes the problem with the ri=
ght fix.<br>
<br>
</div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0That=E2=80=99s a fix, but is it the righ=
t one, given my previous observations?<br></blockquote><div><br></div><div =
style>Yes, it is.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
Also, may I remind you that this a regression?<br>
This issue was not present with the same kernel, on the same distro and it =
is not present on qemux86 VMs.<br>
<div class=3D"im"><br>
Cheers,<br>
Alex<br>
<br>
Original message:<br>
<br>
Hi Alex,<br>
<br>
I might be wrong, and I need more time to investigate, but I don&#39;t agre=
e with the fix you proposed for this issue.<br>
<br>
<br>
<br>
What you propose is just a step back from how qemu should optimally work, m=
eaning exporting &quot;-cpu host&quot;.<br>
<br>
<br>
<br>
That&#39;s one thing.<br>
<br>
<br>
<br>
Another thing is the described issue seems to be specific to some kernels o=
n the host.<br>
<br>
For example, I checked with LaurP and AlexG and thes issue is:<br>
<br>
- reproducible on Ubuntu 12.10 with kernel 3.5.0.27 and Fedora Core 18 with=
 kernel 3.8.5.<br>
<br>
- not reproducible with Ubuntu 12.04 with kernel 3.2.x (need to check the e=
xact details with LaurP).<br>
<br>
<br>
<br>
This issue needs more investigation.<br>
<br>
<br>
<br>
Regards,<br>
<br>
Cristian<br>
<br>
</div><div class=3D"im">On Mon, Apr 15, 2013 at 9:58 AM, Iorga, Cristian &l=
t;<a href=3D"mailto:cristian.iorga@intel.com">cristian.iorga@intel.com</a>&=
lt;mailto:<a href=3D"mailto:cristian.iorga@intel.com">cristian.iorga@intel.=
com</a>&gt;&gt; wrote:<br>

Hi Alex,<br>
<br>
See my comments regarding this patch at:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3908" target=
=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3908</a><br=
>
<br>
Regards,<br>
Cristian<br>
<br>
-----Original Message-----<br>
</div><div class=3D"im">From: <a href=3D"mailto:openembedded-core-bounces@l=
ists.openembedded.org">openembedded-core-bounces@lists.openembedded.org</a>=
&lt;mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@lists.openembedded.org</a>&gt; [mailto:<a hre=
f=3D"mailto:openembedded-core-bounces@lists.openembedded.org">openembedded-=
core-bounces@lists.openembedded.org</a>&lt;mailto:<a href=3D"mailto:openemb=
edded-core-bounces@lists.openembedded.org">openembedded-core-bounces@lists.=
openembedded.org</a>&gt;] On Behalf Of Alex DAMIAN<br>

Sent: Tuesday, April 09, 2013 5:47 PM<br>
</div><div class=3D"im">To: <a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org">richard.purdie@linuxfoundation.org</a>&lt;mailto:<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t;; <a href=3D"mailto:tom.zanussi@linux.intel.com">tom.zanussi@linux.intel.=
com</a>&lt;mailto:<a href=3D"mailto:tom.zanussi@linux.intel.com">tom.zanuss=
i@linux.intel.com</a>&gt;; Burton, Ross; <a href=3D"mailto:paul.eggleton@li=
nux.intel.com">paul.eggleton@linux.intel.com</a>&lt;mailto:<a href=3D"mailt=
o:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;; <a =
href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-core@=
lists.openembedded.org</a>&lt;mailto:<a href=3D"mailto:openembedded-core@li=
sts.openembedded.org">openembedded-core@lists.openembedded.org</a>&gt;<br>

Cc: Damian, Alexandru<br>
Subject: [OE-core] [PATCH] qemu: use default qemu CPU definition<br>
<br>
</div>From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.c=
om">alexandru.damian@intel.com</a>&lt;mailto:<a href=3D"mailto:alexandru.da=
mian@intel.com">alexandru.damian@intel.com</a>&gt;&gt;<br>
<div class=3D"im"><br>
This fixes guest crashes when trying to use restricted instructions based o=
n CPU description. Using default qemu CPU descriptions restrict faults on u=
sing restricted model-specific registers.<br>
<br>
[YOCTO #3908]<br>
<br>
</div>Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damia=
n@intel.com">alexandru.damian@intel.com</a>&lt;mailto:<a href=3D"mailto:ale=
xandru.damian@intel.com">alexandru.damian@intel.com</a>&gt;&gt;<br>
<div><div class=3D"h5">---<br>
=C2=A0scripts/runqemu =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-=
<br>
=C2=A0scripts/runqemu-internal | =C2=A0 =C2=A06 ++++--<br>
=C2=A02 files changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu index 8ed1226..43d7600 10075=
5<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -261,7 +261,7 @@ if [ &quot;x$KVM_ENABLED&quot; =3D &quot;xyes&quot; ]; =
then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ -w /dev/kvm -a -r /dev/kvm ]; then<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0SCRIPT_QEMU_OPT=3D&quot;$SCRIPT_QEMU_OPT -enab=
le-kvm -cpu host&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0SCRIPT_QEMU_OPT=3D&quot;$SCRIPT_QEMU_OPT -enab=
le-kvm &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KVM_ACTIVE=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;You have no rights on /dev/kvm=
.&quot;<br>
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal index e819=
1d1..a7813e5 100755<br>
--- a/scripts/runqemu-internal<br>
+++ b/scripts/runqemu-internal<br>
@@ -323,10 +323,11 @@ fi<br>
<br>
=C2=A0if [ &quot;$MACHINE&quot; =3D &quot;qemux86&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0QEMU=3Dqemu-system-i386<br>
+ =C2=A0 =C2=A0QEMU_CPU_OPTIONS=3D&quot;-cpu qemu32&quot;<br>
=C2=A0 =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D&quot;$QEMU_UI_OPTIONS -vga vmware&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$FSTYPE&quot; =3D &quot;ext2&quot; -o &quot;=
$FSTYPE&quot; =3D &quot;ext3&quot; -o &quot;$FSTYPE&quot; =3D &quot;btrfs&q=
uot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D&quot;vga=3D0 uvesafb.mode_=
option=3D640x480-32 root=3D$DROOT rw mem=3D$QEMU_MEMORY $KERNEL_NETWORK_CMD=
&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD $ROOTFS_=
OPTIONS $QEMU_UI_OPTIONS&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD $ROOTFS_=
OPTIONS $QEMU_CPU_OPTIONS $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$FSTYPE&quot; =3D &quot;nfs&quot; ]; then<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$NFS_SERVER&quot; =3D &quot;19=
2.168.7.1&quot; -a ! -d &quot;$NFS_DIR&quot; ]; then @@ -347,10 +348,11 @@ =
fi<br>
<br>
=C2=A0if [ &quot;$MACHINE&quot; =3D &quot;qemux86-64&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0QEMU=3Dqemu-system-x86_64<br>
+ =C2=A0 =C2=A0QEMU_CPU_OPTIONS=3D&quot;-cpu qemu64&quot;<br>
=C2=A0 =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D&quot;$QEMU_UI_OPTIONS -vga vmware&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$FSTYPE&quot; =3D &quot;ext3&quot; -o &quot;=
$FSTYPE&quot; =3D &quot;btrfs&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D&quot;vga=3D0 root=3D$DROOT=
 rw mem=3D$QEMU_MEMORY $KERNEL_NETWORK_CMD&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD $ROOTFS_=
OPTIONS $QEMU_UI_OPTIONS&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD $ROOTFS_=
OPTIONS $QEMU_CPU_OPTIONS $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$FSTYPE&quot; =3D &quot;nfs&quot; ]; then<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;x$ROOTFS&quot; =3D &quot;x&quo=
t; ]; then<br>
--<br>
1.7.10.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
</div></div><a href=3D"mailto:Openembedded-core@lists.openembedded.org">Ope=
nembedded-core@lists.openembedded.org</a>&lt;mailto:<a href=3D"mailto:Opene=
mbedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.o=
rg</a>&gt;<br>

<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br>
</blockquote></div><br></div></div>

--e89a8fb1f818c883cf04da662a10--
