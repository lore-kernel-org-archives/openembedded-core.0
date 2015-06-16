Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id DA65373FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:01:24 +0000 (UTC)
Received: by igbos3 with SMTP id os3so37855860igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 01:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=v0YiGae7p0KCem4+OjlAs+eYX3nHc+Xqjo7tmkDVpKw=;
	b=Iv/j5YnaIHh51GjyBl0Nw7AknXjMgFpkVKsLDy5TE0C0VQwtYHx5UvQxlvR1h8BZZC
	vl9yDuuFPONsGM6ZdFX4mkzgkluzFudqV26ubmSURuUHZZmfl9K6XFLAF4WU8CepazKI
	T2j7rc9ax2PZ4KUWV5fOBRrA7trSTj2zyGC3IR6vEC4CruF7GkvozgVdRh3dldMyLIFM
	aeDZmmiF/Wl3AtSqhfVn0OpDE/csIgBhlt9s4tH1532xYVMr5aFTyBskAyzy39s14ijD
	SYz7/mclaVh7iVjk2rd+5rJqMWEDWzfnHxNgIsywEMyckat6PVs+WHoEsfVPIVcOKC0k
	qGyA==
X-Gm-Message-State: ALoCoQlIAtmruA1/F+IFunSUj+0axH80f+GhxNVedwkT5IphD/LnxJFUTbJ824GgLdOFP4KBLfyo
MIME-Version: 1.0
X-Received: by 10.42.200.8 with SMTP id eu8mr1480716icb.65.1434441685177; Tue,
	16 Jun 2015 01:01:25 -0700 (PDT)
Received: by 10.79.67.133 with HTTP; Tue, 16 Jun 2015 01:01:25 -0700 (PDT)
In-Reply-To: <557FCB46.7050006@collabora.co.uk>
References: <1433825286-925-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAD3vsf7_24-urKVJjC-L9zsBrpvnD1i1Ag6DqJ8Kb-ip4c+wtA@mail.gmail.com>
	<557FCB46.7050006@collabora.co.uk>
Date: Tue, 16 Jun 2015 13:31:25 +0530
Message-ID: <CAD3vsf7sCSFGOyCH7g8o8nqaARVpyZBXgpH0cgYieC9=MvpJGA@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][fido] runqemu: add support to boot arm64 qemu target from NFS
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
X-List-Received-Date: Tue, 16 Jun 2015 08:01:26 -0000
Content-Type: multipart/alternative; boundary=90e6ba6148d218b26305189dfb57

--90e6ba6148d218b26305189dfb57
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 16, 2015 at 12:37 PM, Joshua Lock <joshua.lock@collabora.co.uk>
wrote:

> On 15/06/15 17:56, Jagadeesh Krishnanjanappa wrote:
>
>> Ping.
>>
>
>
> Is this change intended for fido or master? Usually fixes like this would
> go into master first and then be backported to the stable branch.
>
> The runqemu scripts of fido and master branch are almost at the same
level, the patch should apply to both of them without any warnings. The
intended change is for fido (and future versions) as it already has support
for booting aarch64 qemu target.

Regards,
Jagadeesh


>  Regards,
>> Jagadeesh
>>
>> On Tue, Jun 9, 2015 at 10:18 AM, Jagadeesh Krishnanjanappa
>> <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>> wrote:
>>
>>     The other changes include,
>>     runqemu - fix MACHINE type being detected as qemuarm when qemuarm64
>>     kernel
>>                image name is given.
>>
>>     runqemu-internal - Added console=ttyAMA0,115200 as one of the boot
>>     parameters
>>                         for qemuarm, in order to print bootlog messages
>>     on the
>>                         console.
>>
>>                       - Use "-nographic" option only if "serial" option
>>     is not
>>                         specified. Otherwise we get below error when
>>                         'runqemu <kernel_image> <rootfs_image> serial'
>>     is executed,
>>
>>     (snip)
>>     QEMU 2.2.0 monitor - type 'help' for more information
>>     (qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by
>>     multiple character devices
>>     -- CUT --
>>
>>     qemuarm64 NFS booting has been tested successfully on Ubuntu 14.04
>> host.
>>
>>     Signed-off-by: Jagadeesh Krishnanjanappa
>>     <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
>>
>>     ---
>>       scripts/runqemu          |  4 ++--
>>       scripts/runqemu-internal | 20 +++++++++++++++-----
>>       2 files changed, 17 insertions(+), 7 deletions(-)
>>
>>     diff --git a/scripts/runqemu b/scripts/runqemu
>>     index 84ece4d..09c507d 100755
>>     --- a/scripts/runqemu
>>     +++ b/scripts/runqemu
>>     @@ -232,13 +232,13 @@ fi
>>
>>       if [ -z "$MACHINE" ]; then
>>           if [ "x$FSTYPE" = "xvmdk" ]; then
>>     -        MACHINE=`basename $VM | sed -n
>>
>> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>     +        MACHINE=`basename $VM | sed -n
>>
>> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>               if [ -z "$MACHINE" ]; then
>>                   error "Unable to set MACHINE from vmdk filename [$VM]"
>>               fi
>>               echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
>>           else
>>     -        MACHINE=`basename $KERNEL | sed -n
>>
>> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>     +        MACHINE=`basename $KERNEL | sed -n
>>
>> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>               if [ -z "$MACHINE" ]; then
>>                   error "Unable to set MACHINE from kernel filename
>>     [$KERNEL]"
>>               fi
>>     diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>>     index 2db5566..e346c64 100755
>>     --- a/scripts/runqemu-internal
>>     +++ b/scripts/runqemu-internal
>>     @@ -275,9 +275,6 @@ else
>>
>>               KERNCMDLINE="mem=$QEMU_MEMORY"
>>               QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
>>     -        if [ $MACHINE = 'qemuarm64' ]; then
>>     -            QEMU_UI_OPTIONS="-nographic"
>>     -        fi
>>
>>               NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
>>               export NFS_INSTANCE
>>     @@ -368,7 +365,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" =
>>     "qemuarmv6" -o "$MACHINE" = "qemuarm
>>                   cleanup
>>                   return 1
>>               fi
>>     -        KERNCMDLINE="root=/dev/nfs
>>     nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD
>>     mem=$QEMU_MEMORY"
>>     +        KERNCMDLINE="root=/dev/nfs
>>     nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,115200
>>     $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
>>               QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE}
>>     --no-reboot $QEMU_UI_OPTIONS"
>>           fi
>>           if [ "$MACHINE" = "qemuarmv6" ]; then
>>     @@ -383,12 +380,25 @@ if [ "$MACHINE" = "qemuarm64" ]; then
>>           QEMU=qemu-system-aarch64
>>
>>           export QEMU_AUDIO_DRV="none"
>>     -    QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
>>     +    if [ "x$SERIALSTDIO" = "x" ] ; then
>>     +        QEMU_UI_OPTIONS="-nographic"
>>     +    else
>>     +        QEMU_UI_OPTIONS=""
>>     +    fi
>>           if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
>>               KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400
>>     mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
>>               # qemu-system-aarch64 only support '-machine virt -cpu
>>     cortex-a57' for now
>>               QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu
>>     cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
>>           fi
>>     +    if [ "$FSTYPE" = "nfs" ]; then
>>     +        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
>>     +            echo "Error: NFS mount point $ROOTFS doesn't exist"
>>     +            cleanup
>>     +            return 1
>>     +        fi
>>     +        KERNCMDLINE="root=/dev/nfs
>>     nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,38400
>>     mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
>>     +        QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu
>>     cortex-a57 $QEMU_UI_OPTIONS"
>>     +    fi
>>       fi
>>
>>
>>     --
>>     1.8.2.3
>>
>>
>>
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--90e6ba6148d218b26305189dfb57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 16, 2015 at 12:37 PM, Joshua Lock <span dir=3D"ltr">&lt;<a =
href=3D"mailto:joshua.lock@collabora.co.uk" target=3D"_blank">joshua.lock@c=
ollabora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 1=
5/06/15 17:56, Jagadeesh Krishnanjanappa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Ping.<br>
</blockquote>
<br>
<br>
Is this change intended for fido or master? Usually fixes like this would g=
o into master first and then be backported to the stable branch.<br><br></b=
lockquote><div>The runqemu scripts of fido and master branch are almost at =
the same level, the patch should apply to both of them without any warnings=
. The intended change is for fido (and future versions) as it already has s=
upport for booting aarch64 qemu target.</div><div><br></div><div>Regards,</=
div><div>Jagadeesh</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
Regards,<br>
Jagadeesh<br>
<br>
On Tue, Jun 9, 2015 at 10:18 AM, Jagadeesh Krishnanjanappa<br></span><span =
class=3D"">
&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrish=
nanjanappa@mvista.com</a> &lt;mailto:<a href=3D"mailto:jkrishnanjanappa@mvi=
sta.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;&gt; wrote:<b=
r>
<br>
=C2=A0 =C2=A0 The other changes include,<br>
=C2=A0 =C2=A0 runqemu - fix MACHINE type being detected as qemuarm when qem=
uarm64<br>
=C2=A0 =C2=A0 kernel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image name is given.=
<br>
<br>
=C2=A0 =C2=A0 runqemu-internal - Added console=3DttyAMA0,115200 as one of t=
he boot<br>
=C2=A0 =C2=A0 parameters<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for qemuarm, in order to print bootlog messages<br>
=C2=A0 =C2=A0 on the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 console.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - Use &quot;-nographic&quot; option only if &quot;serial&quot; option<b=
r>
=C2=A0 =C2=A0 is not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 specified. Otherwise we get below error when<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;runqemu &lt;kernel_image&gt; &lt;rootfs_image&gt; serial&#3=
9;<br>
=C2=A0 =C2=A0 is executed,<br>
<br>
=C2=A0 =C2=A0 (snip)<br>
=C2=A0 =C2=A0 QEMU 2.2.0 monitor - type &#39;help&#39; for more information=
<br>
=C2=A0 =C2=A0 (qemu) qemu-system-aarch64: -serial stdio: cannot use stdio b=
y<br>
=C2=A0 =C2=A0 multiple character devices<br>
=C2=A0 =C2=A0 -- CUT --<br>
<br>
=C2=A0 =C2=A0 qemuarm64 NFS booting has been tested successfully on Ubuntu =
14.04 host.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Jagadeesh Krishnanjanappa<br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"=
_blank">jkrishnanjanappa@mvista.com</a> &lt;mailto:<a href=3D"mailto:jkrish=
nanjanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt=
;&gt;<div><div class=3D"h5"><br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ++--<br>
=C2=A0 =C2=A0 =C2=A0 scripts/runqemu-internal | 20 +++++++++++++++-----<br>
=C2=A0 =C2=A0 =C2=A0 2 files changed, 17 insertions(+), 7 deletions(-)<br>
<br>
=C2=A0 =C2=A0 diff --git a/scripts/runqemu b/scripts/runqemu<br>
=C2=A0 =C2=A0 index 84ece4d..09c507d 100755<br>
=C2=A0 =C2=A0 --- a/scripts/runqemu<br>
=C2=A0 =C2=A0 +++ b/scripts/runqemu<br>
=C2=A0 =C2=A0 @@ -232,13 +232,13 @@ fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;x$FSTYPE&quot; =3D &quot;xvmd=
k&quot; ]; then<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $VM | sed -n=
<br>
=C2=A0 =C2=A0 &#39;s/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips=
\|qemuppc\|qemush4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $VM | sed -n=
<br>
=C2=A0 =C2=A0 &#39;s/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips6=
4\|qemumips\|qemuppc\|qemush4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$MACHINE&quo=
t; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error &quot;=
Unable to set MACHINE from vmdk filename [$VM]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Set MACHINE to =
[$MACHINE] based on vmdk [$VM]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $KERNEL | se=
d -n<br>
=C2=A0 =C2=A0 &#39;s/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips=
\|qemuppc\|qemush4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $KERNEL | se=
d -n<br>
=C2=A0 =C2=A0 &#39;s/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips6=
4\|qemumips\|qemuppc\|qemush4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$MACHINE&quo=
t; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error &quot;=
Unable to set MACHINE from kernel filename<br>
=C2=A0 =C2=A0 [$KERNEL]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 diff --git a/scripts/runqemu-internal b/scripts/runqemu-inter=
nal<br>
=C2=A0 =C2=A0 index 2db5566..e346c64 100755<br>
=C2=A0 =C2=A0 --- a/scripts/runqemu-internal<br>
=C2=A0 =C2=A0 +++ b/scripts/runqemu-internal<br>
=C2=A0 =C2=A0 @@ -275,9 +275,6 @@ else<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;mem=3D=
$QEMU_MEMORY&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D&quot;-s=
how-cursor -usb -usbdevice wacom-tablet&quot;<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $MACHINE =3D &#39;qemuarm64=
&#39; ]; then<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D=
&quot;-nographic&quot;<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NFS_INSTANCE=3D`echo $TAP =
| sed &#39;s/tap//&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export NFS_INSTANCE<br>
=C2=A0 =C2=A0 @@ -368,7 +365,7 @@ if [ &quot;$MACHINE&quot; =3D &quot;qemua=
rm&quot; -o &quot;$MACHINE&quot; =3D<br>
=C2=A0 =C2=A0 &quot;qemuarmv6&quot; -o &quot;$MACHINE&quot; =3D &quot;qemua=
rm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cleanup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=3D/dev/=
nfs<br>
=C2=A0 =C2=A0 nfsroot=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_=
CMD<br>
=C2=A0 =C2=A0 mem=3D$QEMU_MEMORY&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=3D/dev/=
nfs<br>
=C2=A0 =C2=A0 nfsroot=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=3DttyAMA=
0,115200<br>
=C2=A0 =C2=A0 $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUOPTIONS=3D&quot;$QEMU_=
NETWORK_CMD -M ${MACHINE_SUBTYPE}<br>
=C2=A0 =C2=A0 --no-reboot $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$MACHINE&quot; =3D &quot;qemu=
armv6&quot; ]; then<br>
=C2=A0 =C2=A0 @@ -383,12 +380,25 @@ if [ &quot;$MACHINE&quot; =3D &quot;qem=
uarm64&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU=3Dqemu-system-aarch64<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export QEMU_AUDIO_DRV=3D&quot;none&quot;=
<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D&quot;$QEMU_UI_OPTIONS&quot;=
<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 if [ &quot;x$SERIALSTDIO&quot; =3D &quot;x&quo=
t; ] ; then<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D&quot;-nograph=
ic&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D&quot;&quot;<b=
r>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${FSTYPE:0:3}&quot; =3D &quot=
;ext&quot; -o &quot;$FSTYPE&quot; =3D &quot;btrfs&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=
=3D/dev/vda rw console=3DttyAMA0,38400<br>
=C2=A0 =C2=A0 mem=3D$QEMU_MEMORY highres=3Doff $KERNEL_NETWORK_CMD&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # qemu-system-aarch64 only=
 support &#39;-machine virt -cpu<br>
=C2=A0 =C2=A0 cortex-a57&#39; for now<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUOPTIONS=3D&quot;$QEMU_=
NETWORK_CMD -machine virt -cpu<br>
=C2=A0 =C2=A0 cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 if [ &quot;$FSTYPE&quot; =3D &quot;nfs&quot; ]=
; then<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$NFS_SERVER&quot; =3D=
 &quot;192.168.7.1&quot; -a ! -d &quot;$NFS_DIR&quot; ]; then<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Error: =
NFS mount point $ROOTFS doesn&#39;t exist&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cleanup<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D&quot;root=3D/dev/=
nfs<br>
=C2=A0 =C2=A0 nfsroot=3D$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=3DttyAMA=
0,38400<br>
=C2=A0 =C2=A0 mem=3D$QEMU_MEMORY highres=3Doff $KERNEL_NETWORK_CMD&quot;<br=
>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUOPTIONS=3D&quot;$QEMU_NETWOR=
K_CMD -machine virt -cpu<br>
=C2=A0 =C2=A0 cortex-a57 $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 1.8.2.3<br>
<br>
<br>
<br>
<br>
</div></div></blockquote><span class=3D"HOEnZb"><font color=3D"#888888">
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--90e6ba6148d218b26305189dfb57--
