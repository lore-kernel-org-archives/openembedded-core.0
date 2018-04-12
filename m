Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB18745D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 01:36:08 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id j8-v6so4214493ota.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 18:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/+AVZYrL814gg2WC8UjaR2lZ7AjW/nM3fxnbE00X3o8=;
	b=ReK6Jf9muNaJ5tx11hctYNJ1N0oY/rtboCazLH74ZphZQX+pIeF7LE+MI3b9gCbEjW
	fVMaI/0wt5ODTp66iQKGHzcVB951XSH9HvZ2gXj5GyxCwqDR0dBOsfLhVC4M+P+b1Z4s
	PRN0syEww9QPyZuAe98jIlQqfVJPHknGJedZZakoEfRZh8IyHLnbTGtHxC1E4Z3v2ysi
	DFhPEQkyEcsp8M627ZubGpJnTOUN6sxaV4HC5DIDSBRpbR+LCMobnUOZUCo00s098wTH
	6ZFTFs0kyBNoDxhkVNOSOG0nfc2VAQP+PdZkNAhFMDwBEY03lhHAtJy2Dyn83dkoepfx
	ISiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/+AVZYrL814gg2WC8UjaR2lZ7AjW/nM3fxnbE00X3o8=;
	b=D3Dir/tO7lshEgpC3KXWdcu/CaIzCtY5OLj9qYaXLpE14Hq3g9EpMMJGauaTW6JG9r
	Fz3+y36cSbYfeER+K2lz5LaKygN5gEUh+91TvBcZHUl0OXsz+zEiZ5ZQkZ43tin73qzw
	myBXcFK4Ee3aVFFazku44k19OOtVdkyAMJTijd6E+Bobx3CwT3qz9P2WlO8ak2VwCBeA
	4UyBGhBqAv14C3MnvUZXRwYQ7saW7sNM7gzzQm+a1dhz7JL0i1vJPAPH5YNgMjyTYTIW
	RgWvlL85KUSEmXJzduXFJs8FX1pqxuE8/qkKDMlrwQ7BI2N70loo6/KoAnINCYYrtv+r
	AXMQ==
X-Gm-Message-State: ALQs6tA7qlr9o382+VwNV9lt2TOzU7Xv1VpE5WFTeC8cFYBb8LQZMPF2
	x5NLdG1rf1CYBdX98/3PoSio8Aw9p+VZpqXIdliVcbto
X-Google-Smtp-Source: AIpwx4+jPL/gTe06TtFdLYxlEBhFD9YXBCfrOshhm7LzG47IrBV3seHfNIOsGUhrt67Np8SsRXfno4S83wqMcNNSMDc=
X-Received: by 2002:a9d:5a06:: with SMTP id v6-v6mr4990000oth.71.1523496969133;
	Wed, 11 Apr 2018 18:36:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.118.129 with HTTP; Wed, 11 Apr 2018 18:35:48 -0700 (PDT)
In-Reply-To: <1523258914-12621-1-git-send-email-hongzhi.song@windriver.com>
References: <1523258914-12621-1-git-send-email-hongzhi.song@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 11 Apr 2018 18:35:48 -0700
Message-ID: <CABcZAN==MwWu8GeuhRJC9vbQsk+7G7eHnuG7prp1wFRDY9JqRg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev-extraconf: Add systemd-mount to mount.sh
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
X-List-Received-Date: Thu, 12 Apr 2018 01:36:08 -0000
Content-Type: multipart/alternative; boundary="000000000000a963e205699cc747"

--000000000000a963e205699cc747
Content-Type: text/plain; charset="UTF-8"

Why are you adding a new mount.sh at meta/recipes-core/udev/mount.sh rather
than updating the existing one
at meta/recipes-core/udev/udev-extraconf/mount.sh?

On Mon, Apr 9, 2018 at 12:28 AM, Hongzhi.Song <hongzhi.song@windriver.com>
wrote:

> This patch fixs the problem that block devices unable to be formatted when
> systemd and udev-extraconf recipes added into rootfs.
>
> If we add systemd and udev-extraconf recipes into rootfs:
>     VIRTUAL-RUNTIME_init_manager = "systemd"
>     DISTRO_FEATURES_append = " systemd"
>     DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
>     KERNEL_FEATURES_append = " cfg/systemd.scc"
>     IMAGE_INSTALL_append = " udev-extraconf"
>     IMAGE_FSTYPES += "tar.bz2 ext4"
>     IMAGE_INSTALL_append = " e2fsprogs-mke2fs"
> then systemd-udevd.service will invoke udev rules to automount block
> devices
> any probed under itself private namespace, this behavior results in host
> space
> can't format those devices. And host space can't find where the device is
> used.
> Such as:
>     root@qemux86:~# mkfs.ext4 /dev/sda1
>     mke2fs 1.43.8 (1-Jan-2018)
>     /dev/sda1 contains a ext4 file system
>             last mounted on Tue Apr  3 06:22:41 2018
>     Proceed anyway? (y,N) y
>     /dev/sda1 is apparently in use by the system; will not make a
> filesystem here!
>
> Command systemd-mount recommended by systemd maintainer instead of command
> mount
> will fix the problem brought with private namespace. Systemd-mount request
> the
> mount operation to be executed by PID 1, and hence host space can access
> the block
> devices.
>
> [YOCTO #12644]
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta/recipes-core/udev/mount.sh | 141 ++++++++++++++++++++++++++++++
> ++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 meta/recipes-core/udev/mount.sh
>
> diff --git a/meta/recipes-core/udev/mount.sh b/meta/recipes-core/udev/
> mount.sh
> new file mode 100644
> index 0000000..2fa2925
> --- /dev/null
> +++ b/meta/recipes-core/udev/mount.sh
> @@ -0,0 +1,141 @@
> +#!/bin/sh
> +#
> +# Called from udev
> +#
> +# Attempt to mount any added block devices and umount any removed devices
> +
> +
> +BASE_INIT="`readlink "/sbin/init"`"
> +INIT_SYSTEMD="/lib/systemd/systemd"
> +
> +if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
> +       # systemd as init uses systemd-mount to mount block devices
> +        MOUNT="/usr/bin/systemd-mount"
> +        UMOUNT="/usr/bin/systemd-umount"
> +
> +        if [ -x $MOUNT ] && [ -x $UMOUNT ];
> +        then
> +                logger "Using systemd-mount to finish mount"
> +        else
> +                logger "Linux init is using systemd, so please install
> systemd-mount to finish mount"
> +               exit 1
> +        fi
> +else
> +        MOUNT="/bin/mount"
> +        UMOUNT="/bin/umount"
> +fi
> +
> +PMOUNT="/usr/bin/pmount"
> +
> +for line in `grep -h -v ^# /etc/udev/mount.blacklist
> /etc/udev/mount.blacklist.d/*`
> +do
> +       if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
> +       then
> +               logger "udev/mount.sh" "[$DEVNAME] is blacklisted,
> ignoring"
> +               exit 0
> +       fi
> +done
> +
> +automount_systemd() {
> +        name="`basename "$DEVNAME"`"
> +
> +        ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
> +
> +        MOUNT="$MOUNT -o silent"
> +
> +        # If filesystemtype is vfat, change the ownership group to
> 'disk', and
> +        # grant it with  w/r/x permissions.
> +        case $ID_FS_TYPE in
> +        vfat|fat)
> +                MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print
> $3}' /etc/group`"
> +                ;;
> +        # TODO
> +        *)
> +                ;;
> +        esac
> +
> +        if ! $MOUNT --no-block -t auto $DEVNAME "/run/media/$name"
> +        then
> +                #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME
> \"/run/media/$name\" failed!"
> +                rm_dir "/run/media/$name"
> +        else
> +                logger "mount.sh/automount" "Auto-mount of
> [/run/media/$name] successful"
> +                touch "/tmp/.automount-$name"
> +        fi
> +}
> +
> +automount() {
> +       name="`basename "$DEVNAME"`"
> +
> +       ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
> +       # Silent util-linux's version of mounting auto
> +       if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
> +       then
> +               MOUNT="$MOUNT -o silent"
> +       fi
> +
> +       # If filesystem type is vfat, change the ownership group to
> 'disk', and
> +       # grant it with  w/r/x permissions.
> +       case $ID_FS_TYPE in
> +       vfat|fat)
> +               MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print
> $3}' /etc/group`"
> +               ;;
> +       # TODO
> +       *)
> +               ;;
> +       esac
> +
> +       if ! $MOUNT -t auto $DEVNAME "/run/media/$name"
> +       then
> +               #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME
> \"/run/media/$name\" failed!"
> +               rm_dir "/run/media/$name"
> +       else
> +               logger "mount.sh/automount" "Auto-mount of
> [/run/media/$name] successful"
> +               touch "/tmp/.automount-$name"
> +       fi
> +}
> +
> +rm_dir() {
> +       # We do not want to rm -r populated directories
> +       if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
> +       then
> +               ! test -z "$1" && rm -r "$1"
> +       else
> +               logger "mount.sh/automount" "Not removing non-empty
> directory [$1]"
> +       fi
> +}
> +
> +# No ID_FS_TYPE for cdrom device, yet it should be mounted
> +name="`basename "$DEVNAME"`"
> +[ -e /sys/block/$name/device/media ] && media_type=`cat
> /sys/block/$name/device/media`
> +
> +if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o
> "$media_type" = "cdrom" ]; then
> +       if [ -x "$PMOUNT" ]; then
> +               $PMOUNT $DEVNAME 2> /dev/null
> +       elif [ -x $MOUNT ]; then
> +               $MOUNT $DEVNAME 2> /dev/null
> +       fi
> +
> +       # If the device isn't mounted at this point, it isn't
> +       # configured in fstab (note the root filesystem can show up as
> +       # /dev/root in /proc/mounts, so check the device number too)
> +        if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
> +                if [ "`basename $MOUNT`" = "systemd-mount" ];then
> +                        grep -q "^$DEVNAME " /proc/mounts ||
> automount_systemd
> +                else
> +                        grep -q "^$DEVNAME " /proc/mounts || automount
> +                fi
> +        fi
> +fi
> +
> +
> +if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT"
> ] && [ -n "$DEVNAME" ]; then
> +       for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
> +       do
> +               $UMOUNT $mnt
> +       done
> +
> +       # Remove empty directories from auto-mounter
> +       name="`basename "$DEVNAME"`"
> +       test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
> +fi
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000a963e205699cc747
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why are you adding a new mount.sh at=C2=A0<span style=3D"f=
ont-size:12.800000190734863px">meta/recipes-core/udev/mount.</span><wbr sty=
le=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.800000190=
734863px">sh=C2=A0</span>rather than updating the existing one at=C2=A0meta=
/recipes-core/udev/udev-extraconf/mount.sh?</div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Mon, Apr 9, 2018 at 12:28 AM, Hongzhi.So=
ng <span dir=3D"ltr">&lt;<a href=3D"mailto:hongzhi.song@windriver.com" targ=
et=3D"_blank">hongzhi.song@windriver.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">This patch fixs the problem that block devices unable=
 to be formatted when<br>
systemd and udev-extraconf recipes added into rootfs.<br>
<br>
If we add systemd and udev-extraconf recipes into rootfs:<br>
=C2=A0 =C2=A0 VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;<br>
=C2=A0 =C2=A0 DISTRO_FEATURES_append =3D &quot; systemd&quot;<br>
=C2=A0 =C2=A0 DISTRO_FEATURES_BACKFILL_<wbr>CONSIDERED +=3D &quot;sysvinit&=
quot;<br>
=C2=A0 =C2=A0 KERNEL_FEATURES_append =3D &quot; cfg/systemd.scc&quot;<br>
=C2=A0 =C2=A0 IMAGE_INSTALL_append =3D &quot; udev-extraconf&quot;<br>
=C2=A0 =C2=A0 IMAGE_FSTYPES +=3D &quot;tar.bz2 ext4&quot;<br>
=C2=A0 =C2=A0 IMAGE_INSTALL_append =3D &quot; e2fsprogs-mke2fs&quot;<br>
then systemd-udevd.service will invoke udev rules to automount block device=
s<br>
any probed under itself private namespace, this behavior results in host sp=
ace<br>
can&#39;t format those devices. And host space can&#39;t find where the dev=
ice is used.<br>
Such as:<br>
=C2=A0 =C2=A0 root@qemux86:~# mkfs.ext4 /dev/sda1<br>
=C2=A0 =C2=A0 mke2fs 1.43.8 (1-Jan-2018)<br>
=C2=A0 =C2=A0 /dev/sda1 contains a ext4 file system<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last mounted on Tue Apr=C2=A0 3 0=
6:22:41 2018<br>
=C2=A0 =C2=A0 Proceed anyway? (y,N) y<br>
=C2=A0 =C2=A0 /dev/sda1 is apparently in use by the system; will not make a=
 filesystem here!<br>
<br>
Command systemd-mount recommended by systemd maintainer instead of command =
mount<br>
will fix the problem brought with private namespace. Systemd-mount request =
the<br>
mount operation to be executed by PID 1, and hence host space can access th=
e block<br>
devices.<br>
<br>
[YOCTO #12644]<br>
<br>
Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.co=
m">hongzhi.song@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/udev/mount.<wbr>sh | 141 ++++++++++++++++++++++++++=
++++<wbr>++++++++++<br>
=C2=A01 file changed, 141 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/udev/mount.<wbr>sh<br>
<br>
diff --git a/meta/recipes-core/udev/<wbr>mount.sh b/meta/recipes-core/udev/=
<wbr>mount.sh<br>
new file mode 100644<br>
index 0000000..2fa2925<br>
--- /dev/null<br>
+++ b/meta/recipes-core/udev/<wbr>mount.sh<br>
@@ -0,0 +1,141 @@<br>
+#!/bin/sh<br>
+#<br>
+# Called from udev<br>
+#<br>
+# Attempt to mount any added block devices and umount any removed devices<=
br>
+<br>
+<br>
+BASE_INIT=3D&quot;`readlink &quot;/sbin/init&quot;`&quot;<br>
+INIT_SYSTEMD=3D&quot;/lib/systemd/<wbr>systemd&quot;<br>
+<br>
+if [ &quot;x$BASE_INIT&quot; =3D &quot;x$INIT_SYSTEMD&quot; ];then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# systemd as init uses systemd-mount to mount b=
lock devices<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MOUNT=3D&quot;/usr/bin/systemd-mount&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 UMOUNT=3D&quot;/usr/bin/systemd-<wbr>umount&qu=
ot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x $MOUNT ] &amp;&amp; [ -x $UMOUNT ];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger &quot;Using=
 systemd-mount to finish mount&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger &quot;Linux=
 init is using systemd, so please install systemd-mount to finish mount&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MOUNT=3D&quot;/bin/mount&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 UMOUNT=3D&quot;/bin/umount&quot;<br>
+fi<br>
+<br>
+PMOUNT=3D&quot;/usr/bin/pmount&quot;<br>
+<br>
+for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.black=
list.d/*`<br>
+do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ` expr match &quot;$DEVNAME&quot; &quot;$l=
ine&quot; ` -gt 0 ];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger &quot;udev/m=
ount.sh&quot; &quot;[$DEVNAME] is blacklisted, ignoring&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+done<br>
+<br>
+automount_systemd() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name=3D&quot;`basename &quot;$DEVNAME&quot;`&q=
uot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ! test -d &quot;/run/media/$name&quot; &amp;&a=
mp; mkdir -p &quot;/run/media/$name&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MOUNT=3D&quot;$MOUNT -o silent&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If filesystemtype is vfat, change the owners=
hip group to &#39;disk&#39;, and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # grant it with=C2=A0 w/r/x permissions.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $ID_FS_TYPE in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vfat|fat)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MOUNT=3D&quot;$MOU=
NT -o umask=3D007,gid=3D`awk -F&#39;:&#39; &#39;/^disk/{print $3}&#39; /etc=
/group`&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! $MOUNT --no-block -t auto $DEVNAME &quot;=
/run/media/$name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #logger &quot;<a h=
ref=3D"http://mount.sh/automount" rel=3D"noreferrer" target=3D"_blank">moun=
t.sh/automount</a>&quot; &quot;$MOUNT -t auto $DEVNAME \&quot;/run/media/$n=
ame\&quot; failed!&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_dir &quot;/run/=
media/$name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger &quot;<a hr=
ef=3D"http://mount.sh/automount" rel=3D"noreferrer" target=3D"_blank">mount=
.sh/automount</a>&quot; &quot;Auto-mount of [/run/media/$name] successful&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch &quot;/tmp/.=
automount-$name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+automount() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0name=3D&quot;`basename &quot;$DEVNAME&quot;`&qu=
ot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0! test -d &quot;/run/media/$name&quot; &amp;&am=
p; mkdir -p &quot;/run/media/$name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Silent util-linux&#39;s version of mounting a=
uto<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;x`readlink $MOUNT`&quot; =3D &quot;x=
/bin/mount.util-linux&quot; ] ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MOUNT=3D&quot;$MOUN=
T -o silent&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# If filesystem type is vfat, change the owners=
hip group to &#39;disk&#39;, and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# grant it with=C2=A0 w/r/x permissions.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case $ID_FS_TYPE in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vfat|fat)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MOUNT=3D&quot;$MOUN=
T -o umask=3D007,gid=3D`awk -F&#39;:&#39; &#39;/^disk/{print $3}&#39; /etc/=
group`&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# TODO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ! $MOUNT -t auto $DEVNAME &quot;/run/media/$=
name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#logger &quot;<a hr=
ef=3D"http://mount.sh/automount" rel=3D"noreferrer" target=3D"_blank">mount=
.sh/automount</a>&quot; &quot;$MOUNT -t auto $DEVNAME \&quot;/run/media/$na=
me\&quot; failed!&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm_dir &quot;/run/m=
edia/$name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger &quot;<a hre=
f=3D"http://mount.sh/automount" rel=3D"noreferrer" target=3D"_blank">mount.=
sh/automount</a>&quot; &quot;Auto-mount of [/run/media/$name] successful&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch &quot;/tmp/.a=
utomount-$name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+rm_dir() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# We do not want to rm -r populated directories=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;`find &quot;$1&quot; | wc -l | tr=
 -d &quot; &quot;`&quot; -lt 2 -a -d &quot;$1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0! test -z &quot;$1&=
quot; &amp;&amp; rm -r &quot;$1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger &quot;<a hre=
f=3D"http://mount.sh/automount" rel=3D"noreferrer" target=3D"_blank">mount.=
sh/automount</a>&quot; &quot;Not removing non-empty directory [$1]&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+# No ID_FS_TYPE for cdrom device, yet it should be mounted<br>
+name=3D&quot;`basename &quot;$DEVNAME&quot;`&quot;<br>
+[ -e /sys/block/$name/device/media ] &amp;&amp; media_type=3D`cat /sys/blo=
ck/$name/device/media`<br>
+<br>
+if [ &quot;$ACTION&quot; =3D &quot;add&quot; ] &amp;&amp; [ -n &quot;$DEVN=
AME&quot; ] &amp;&amp; [ -n &quot;$ID_FS_TYPE&quot; -o &quot;$media_type&qu=
ot; =3D &quot;cdrom&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$PMOUNT&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$PMOUNT $DEVNAME 2&=
gt; /dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -x $MOUNT ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$MOUNT $DEVNAME 2&g=
t; /dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# If the device isn&#39;t mounted at this point=
, it isn&#39;t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# configured in fstab (note the root filesystem=
 can show up as<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# /dev/root in /proc/mounts, so check the devic=
e number too)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if expr $MAJOR &quot;*&quot; 256 + $MINOR !=3D=
 `stat -c %d /`; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;`basena=
me $MOUNT`&quot; =3D &quot;systemd-mount&quot; ];then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 grep -q &quot;^$DEVNAME &quot; /proc/mounts || automount_systemd=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 grep -q &quot;^$DEVNAME &quot; /proc/mounts || automount<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+fi<br>
+<br>
+<br>
+if [ &quot;$ACTION&quot; =3D &quot;remove&quot; ] || [ &quot;$ACTION&quot;=
 =3D &quot;change&quot; ] &amp;&amp; [ -x &quot;$UMOUNT&quot; ] &amp;&amp; =
[ -n &quot;$DEVNAME&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for mnt in `cat /proc/mounts | grep &quot;$DEVN=
AME&quot; | cut -f 2 -d &quot; &quot; `<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$UMOUNT $mnt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove empty directories from auto-mounter<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0name=3D&quot;`basename &quot;$DEVNAME&quot;`&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test -e &quot;/tmp/.automount-$name&quot; &amp;=
&amp; rm_dir &quot;/run/media/$name&quot;<br>
+fi<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engin=
eer, Mentor Graphics</div></div></div></div>
</div>

--000000000000a963e205699cc747--
