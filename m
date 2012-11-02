Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1TUHZx-0000GA-2i
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Nov 2012 14:46:33 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 02 Nov 2012 06:31:47 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so11316402obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2012 06:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=/a6N3LLKVJDqF7lSLoHA9xjMK2nViaKj7WMZ2L/666g=;
	b=IFGLypiMSppGS5Z2Qc/PuBACrNpM/X1insFZ9VoYRmp/4nKXhqf4oQdOJ+Q2aoJYOh
	NxN81Du3dQUqXbtOW4c90ti1W+4GXv0p7He6pszpYrdzOpzK7OFiNl0GcgFrXCd+j8s/
	MK5Hg0NfXyLjgYNCMaTOYjJTdX44o1UHd7f5d1qFWlS1+cdoiPzXxGY5PXDKnmIynLFS
	mlwIujVtZpGt655GcUUzat8Xuh4p/5HVn9kgEajfp7x5KOrKYrFhjFz2Yeja+RJdx2oR
	5f9ajHYjhLuou8KoAoyWzqC0CBp22ClzgTrHquRnot3IsUwoFp4RKtHZfdPo3NLWnO+W
	zMiQ==
Received: by 10.50.212.72 with SMTP id ni8mr1710195igc.5.1351863106728;
	Fri, 02 Nov 2012 06:31:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.212.72 with SMTP id ni8mr1710178igc.5.1351863106567; Fri,
	02 Nov 2012 06:31:46 -0700 (PDT)
Received: by 10.64.49.164 with HTTP; Fri, 2 Nov 2012 06:31:46 -0700 (PDT)
In-Reply-To: <CAJ2CSBsLk0HC8Lx0ptTzBPY1EVKan5o+wb9AbHcGy4vORcu6JA@mail.gmail.com>
References: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
	<1351798319.6502.19.camel@ted>
	<CAJ2CSBsLk0HC8Lx0ptTzBPY1EVKan5o+wb9AbHcGy4vORcu6JA@mail.gmail.com>
Date: Fri, 2 Nov 2012 15:31:46 +0200
Message-ID: <CAJ2CSBvFvXXk93A8or4M6vmGo==h0F+VOR8-FVAFP9jYs8FS1w@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQmn8cExXlXg4bUnlJMCSWhcvm9VSR1RLX9+FvB5VymUkhbXz1+uD8840n7X5JzCYaW0fbnDrJJR3Y0sqL0zhPTzVGo9BjPMu51tdGj6TaGPlKxUQ1MX7ILFxGssL9zlG17bOLu5CEEmAQr2Mq2XlBZqyo3YyxN87kVFTXXuVQPe/q+lxe/xRlSFvd+sxEKl14H/oXSV
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initrdscripts: fix udevd path
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
X-List-Received-Date: Fri, 02 Nov 2012 13:46:33 -0000
Content-Type: multipart/alternative; boundary=14dae9341055407f4504cd832816

--14dae9341055407f4504cd832816
Content-Type: text/plain; charset=ISO-8859-1

Just a heads-up, actually I've submitted the wrong file in the first place
:(


Alex


On Fri, Nov 2, 2012 at 3:07 PM, Damian, Alexandru <
alexandru.damian@intel.com> wrote:

> I submitted a new patch in a separate mail, with proper description.
>
> Alex
>
>
>
> On Thu, Nov 1, 2012 at 9:31 PM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Thu, 2012-11-01 at 16:32 +0200, Alex DAMIAN wrote:
>> > From: Ross Burton <ross.burton@intel.com>
>> >
>> > udevd moved location and isn't in $PATH anymore, so use an absolute
>> path to
>> > start it.
>> >
>> > The control socket path moved too, so mkdir the directory it's in.
>>
>> This patch looks to do a little more than that...
>>
>> Cheers,
>>
>> Richard
>>
>> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>> > ---
>> >  meta/recipes-core/initrdscripts/files/init-live.sh |   50
>> +++++++++++++++++---
>> >  .../initrdscripts/initramfs-framework/udev         |    6 +--
>> >  .../initrdscripts/initramfs-framework_1.0.bb       |    2 +
>> >  .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
>> >  4 files changed, 50 insertions(+), 10 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh
>> b/meta/recipes-core/initrdscripts/files/init-live.sh
>> > index 5682fd1..fdea892 100644
>> > --- a/meta/recipes-core/initrdscripts/files/init-live.sh
>> > +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
>> > @@ -19,7 +19,8 @@ early_setup() {
>> >      modprobe isofs 2> /dev/null
>> >
>> >      mkdir -p /run
>> > -    udevd --daemon
>> > +    mkdir -p /var/run
>> > +    /lib/udev/udevd --daemon
>> >      udevadm trigger --action=add
>> >  }
>> >
>> > @@ -68,13 +69,49 @@ fatal() {
>> >
>> >  early_setup
>> >
>> > +# wait for the udevd to settle
>> > +echo "Waiting for udev to settle..."
>> > +sleep 3
>> > +
>> >  [ -z "$CONSOLE" ] && CONSOLE="/dev/console"
>> >
>> >  read_args
>> >
>> > -echo "Waiting for removable media..."
>> > -while true
>> > +# boot partiton menu, if one or more bootable partitions exist
>> > +BOOTMENU=`ls /media/sd*/sbin/init 2>/dev/null | wc -l`
>> > +if [ $BOOTMENU -gt 0 ]; then
>> > +     choice=0
>> > +     while [ $choice -le 0 ]; do
>> > +             echo "1). boot live ramfs image"
>> > +             count=2
>> > +             for i in `ls /media/sd*/sbin/init 2>/dev/null | cut -d
>> "/" -f 3`; do
>> > +                     echo $count"). boot /dev/"$i
>> > +                     choicecmd[$count]=$i
>> > +                     count=$(( count + 1))
>> > +             done
>> > +             echo
>> > +             echo -n "Your choice: "
>> > +             read choice
>> > +     done
>> > +
>> > +     if [ $choice -gt 1 ]; then
>> > +             #ROOT_MOUNT=/media/${choicecmd[${choice}]}
>> > +             ROOT_MOUNT=none #testing
>> > +             echo "Booting local root ... $ROOT_MOUNT"
>> > +             if [ -d $ROOT_MOUNT ]; then
>> > +                     boot_live_root
>> > +             else
>> > +                     fatal "Rootfs partition not mounted"
>> > +             fi
>> > +     fi
>> > +fi
>> > +
>> > +echo -n "Waiting for removable media... "
>> > +CNT=0
>> > +while [ $CNT -le 3 ];
>> >  do
>> > +  echo -n "$CNT "
>> > +  CNT=$(( $CNT + 1 ))
>> >    for i in `ls /media 2>/dev/null`; do
>> >        if [ -f /media/$i/$ROOT_IMAGE ] ; then
>> >               found="yes"
>> > @@ -82,7 +119,7 @@ do
>> >         elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then
>> >               found="yes"
>> >               ISOLINUX="isolinux"
>> > -             break
>> > +             break
>> >        fi
>> >    done
>> >    if [ "$found" = "yes" ]; then
>> > @@ -90,13 +127,14 @@ do
>> >    fi
>> >    sleep 1
>> >  done
>> > +if [ "$found" != "yes" ]; then
>> > +     fatal "...could not mount removable media, drop to shell"
>> > +fi
>> >
>> >  case $label in
>> >      boot)
>> >       mkdir $ROOT_MOUNT
>> >       mknod /dev/loop0 b 7 0 2>/dev/null
>> > -
>> > -
>> >       if [ "$UNIONFS" = "yes" ]; then
>> >           mkdir /rootfs-tmp
>> >
>> > diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev
>> b/meta/recipes-core/initrdscripts/initramfs-framework/udev
>> > index 9ea8aa3..15a1d5b 100644
>> > --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
>> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
>> > @@ -3,8 +3,8 @@
>> >  # Licensed on MIT
>> >
>> >  udev_enabled() {
>> > -     if [ ! -e /sbin/udevd ]; then
>> > -             debug "/sbin/udev doesn't exist"
>> > +     if [ ! -e /lib/udev/udevd ]; then
>> > +             debug "/lib/udev/udev doesn't exist"
>> >               return 1
>> >       fi
>> >
>> > @@ -14,7 +14,7 @@ udev_enabled() {
>> >  udev_run() {
>> >       mkdir -p /run
>> >
>> > -     udevd --daemon > /dev/null
>> > +     /lib/udev/udevd --daemon > /dev/null
>> >       udevadm trigger --action=add
>> >       udevadm settle
>> >
>> > diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bbb/meta/recipes-core/initrdscripts/
>> initramfs-framework_1.0.bb
>> > index 58e41d4..45d6592 100644
>> > --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>> > @@ -3,6 +3,8 @@ LICENSE = "MIT"
>> >  LIC_FILES_CHKSUM =
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> >  RDEPENDS = "busybox"
>> >
>> > +PR = "r1"
>> > +
>> >  inherit allarch
>> >
>> >  SRC_URI = "file://init \
>> > diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bbb/meta/recipes-core/initrdscripts/
>> initramfs-live-boot_1.0.bb
>> > index 137a401..55a8600 100644
>> > --- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
>> > +++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
>> > @@ -5,7 +5,7 @@ RDEPENDS = "udev"
>> >  DEPENDS = "virtual/kernel"
>> >  SRC_URI = "file://init-live.sh"
>> >
>> > -PR = "r10"
>> > +PR = "r11"
>> >
>> >  do_compile() {
>> >       #if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config;
>> then
>>
>>
>>
>

--14dae9341055407f4504cd832816
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Just a heads-up, actually I&#39;ve submitted the wrong file in the first pl=
ace :(<div><br></div><div><br></div><div>Alex</div><div class=3D"gmail_extr=
a"><br><br><div class=3D"gmail_quote">On Fri, Nov 2, 2012 at 3:07 PM, Damia=
n, Alexandru <span dir=3D"ltr">&lt;<a href=3D"mailto:alexandru.damian@intel=
.com" target=3D"_blank">alexandru.damian@intel.com</a>&gt;</span> wrote:<br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I submitted a new patch in a separate mail, =
with proper description.<br><br>Alex<div class=3D"HOEnZb"><div class=3D"h5"=
><br>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, Nov 1=
, 2012 at 9:31 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Thu, 2012-11-01 at 16:32 +0200, Alex DAMI=
AN wrote:<br>
&gt; From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
<div>&gt;<br>
&gt; udevd moved location and isn&#39;t in $PATH anymore, so use an absolut=
e path to<br>
&gt; start it.<br>
&gt;<br>
&gt; The control socket path moved too, so mkdir the directory it&#39;s in.=
<br>
<br>
</div>This patch looks to do a little more than that...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div><br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
</div>&gt; =A0meta/recipes-core/initrdscripts/files/init-live.sh | =A0 50 +=
++++++++++++++++---<br>
&gt; =A0.../initrdscripts/initramfs-framework/udev =A0 =A0 =A0 =A0 | =A0 =
=A06 +--<br>
&gt; =A0.../initrdscripts/<a href=3D"http://initramfs-framework_1.0.bb" tar=
get=3D"_blank">initramfs-framework_1.0.bb</a> =A0 =A0 =A0 | =A0 =A02 +<br>
&gt; =A0.../initrdscripts/<a href=3D"http://initramfs-live-boot_1.0.bb" tar=
get=3D"_blank">initramfs-live-boot_1.0.bb</a> =A0 =A0 =A0 | =A0 =A02 +-<br>
&gt; =A04 files changed, 50 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta=
/recipes-core/initrdscripts/files/init-live.sh<br>
&gt; index 5682fd1..fdea892 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/files/init-live.sh<br>
&gt; +++ b/meta/recipes-core/initrdscripts/files/init-live.sh<br>
&gt; @@ -19,7 +19,8 @@ early_setup() {<br>
<div>&gt; =A0 =A0 =A0modprobe isofs 2&gt; /dev/null<br>
&gt;<br>
&gt; =A0 =A0 =A0mkdir -p /run<br>
&gt; - =A0 =A0udevd --daemon<br>
</div>&gt; + =A0 =A0mkdir -p /var/run<br>
<div>&gt; + =A0 =A0/lib/udev/udevd --daemon<br>
&gt; =A0 =A0 =A0udevadm trigger --action=3Dadd<br>
&gt; =A0}<br>
&gt;<br>
</div>&gt; @@ -68,13 +69,49 @@ fatal() {<br>
&gt;<br>
&gt; =A0early_setup<br>
&gt;<br>
&gt; +# wait for the udevd to settle<br>
&gt; +echo &quot;Waiting for udev to settle...&quot;<br>
&gt; +sleep 3<br>
&gt; +<br>
&gt; =A0[ -z &quot;$CONSOLE&quot; ] &amp;&amp; CONSOLE=3D&quot;/dev/console=
&quot;<br>
&gt;<br>
&gt; =A0read_args<br>
&gt;<br>
&gt; -echo &quot;Waiting for removable media...&quot;<br>
&gt; -while true<br>
&gt; +# boot partiton menu, if one or more bootable partitions exist<br>
&gt; +BOOTMENU=3D`ls /media/sd*/sbin/init 2&gt;/dev/null | wc -l`<br>
&gt; +if [ $BOOTMENU -gt 0 ]; then<br>
&gt; + =A0 =A0 choice=3D0<br>
&gt; + =A0 =A0 while [ $choice -le 0 ]; do<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;1). boot live ramfs image&quot;<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 count=3D2<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 for i in `ls /media/sd*/sbin/init 2&gt;/dev/=
null | cut -d &quot;/&quot; -f 3`; do<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo $count&quot;). boot /de=
v/&quot;$i<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 choicecmd[$count]=3D$i<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count=3D$(( count + 1))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 done<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo -n &quot;Your choice: &quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 read choice<br>
&gt; + =A0 =A0 done<br>
&gt; +<br>
&gt; + =A0 =A0 if [ $choice -gt 1 ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 #ROOT_MOUNT=3D/media/${choicecmd[${choice}]}=
<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 ROOT_MOUNT=3Dnone #testing<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;Booting local root ... $ROOT_MOUN=
T&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 if [ -d $ROOT_MOUNT ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 boot_live_root<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 else<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fatal &quot;Rootfs partition=
 not mounted&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; + =A0 =A0 fi<br>
&gt; +fi<br>
&gt; +<br>
&gt; +echo -n &quot;Waiting for removable media... &quot;<br>
&gt; +CNT=3D0<br>
&gt; +while [ $CNT -le 3 ];<br>
&gt; =A0do<br>
&gt; + =A0echo -n &quot;$CNT &quot;<br>
&gt; + =A0CNT=3D$(( $CNT + 1 ))<br>
&gt; =A0 =A0for i in `ls /media 2&gt;/dev/null`; do<br>
&gt; =A0 =A0 =A0 =A0if [ -f /media/$i/$ROOT_IMAGE ] ; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 found=3D&quot;yes&quot;<br>
&gt; @@ -82,7 +119,7 @@ do<br>
&gt; =A0 =A0 =A0 =A0 elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 found=3D&quot;yes&quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 ISOLINUX=3D&quot;isolinux&quot;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 break<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 break<br>
&gt; =A0 =A0 =A0 =A0fi<br>
&gt; =A0 =A0done<br>
&gt; =A0 =A0if [ &quot;$found&quot; =3D &quot;yes&quot; ]; then<br>
&gt; @@ -90,13 +127,14 @@ do<br>
&gt; =A0 =A0fi<br>
&gt; =A0 =A0sleep 1<br>
&gt; =A0done<br>
&gt; +if [ &quot;$found&quot; !=3D &quot;yes&quot; ]; then<br>
&gt; + =A0 =A0 fatal &quot;...could not mount removable media, drop to shel=
l&quot;<br>
&gt; +fi<br>
&gt;<br>
&gt; =A0case $label in<br>
&gt; =A0 =A0 =A0boot)<br>
&gt; =A0 =A0 =A0 mkdir $ROOT_MOUNT<br>
&gt; =A0 =A0 =A0 mknod /dev/loop0 b 7 0 2&gt;/dev/null<br>
&gt; -<br>
&gt; -<br>
&gt; =A0 =A0 =A0 if [ &quot;$UNIONFS&quot; =3D &quot;yes&quot; ]; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 mkdir /rootfs-tmp<br>
<div><div>&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev =
b/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; index 9ea8aa3..15a1d5b 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; @@ -3,8 +3,8 @@<br>
&gt; =A0# Licensed on MIT<br>
&gt;<br>
&gt; =A0udev_enabled() {<br>
&gt; - =A0 =A0 if [ ! -e /sbin/udevd ]; then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 debug &quot;/sbin/udev doesn&#39;t exist&quo=
t;<br>
&gt; + =A0 =A0 if [ ! -e /lib/udev/udevd ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 debug &quot;/lib/udev/udev doesn&#39;t exist=
&quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1<br>
&gt; =A0 =A0 =A0 fi<br>
&gt;<br>
&gt; @@ -14,7 +14,7 @@ udev_enabled() {<br>
&gt; =A0udev_run() {<br>
&gt; =A0 =A0 =A0 mkdir -p /run<br>
&gt;<br>
&gt; - =A0 =A0 udevd --daemon &gt; /dev/null<br>
&gt; + =A0 =A0 /lib/udev/udevd --daemon &gt; /dev/null<br>
&gt; =A0 =A0 =A0 udevadm trigger --action=3Dadd<br>
&gt; =A0 =A0 =A0 udevadm settle<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/<a href=3D"http://initram=
fs-framework_1.0.bb" target=3D"_blank">initramfs-framework_1.0.bb</a> b/met=
a/recipes-core/initrdscripts/<a href=3D"http://initramfs-framework_1.0.bb" =
target=3D"_blank">initramfs-framework_1.0.bb</a><br>


&gt; index 58e41d4..45d6592 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/<a href=3D"http://initramfs-fram=
ework_1.0.bb" target=3D"_blank">initramfs-framework_1.0.bb</a><br>
&gt; +++ b/meta/recipes-core/initrdscripts/<a href=3D"http://initramfs-fram=
ework_1.0.bb" target=3D"_blank">initramfs-framework_1.0.bb</a><br>
&gt; @@ -3,6 +3,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt; =A0LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=
=3D3da9cfbcb788c80a0384361b4de20420&quot;<br>
&gt; =A0RDEPENDS =3D &quot;busybox&quot;<br>
&gt;<br>
&gt; +PR =3D &quot;r1&quot;<br>
&gt; +<br>
&gt; =A0inherit allarch<br>
&gt;<br>
&gt; =A0SRC_URI =3D &quot;file://init \<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/<a href=3D"http://initram=
fs-live-boot_1.0.bb" target=3D"_blank">initramfs-live-boot_1.0.bb</a> b/met=
a/recipes-core/initrdscripts/<a href=3D"http://initramfs-live-boot_1.0.bb" =
target=3D"_blank">initramfs-live-boot_1.0.bb</a><br>


&gt; index 137a401..55a8600 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/<a href=3D"http://initramfs-live=
-boot_1.0.bb" target=3D"_blank">initramfs-live-boot_1.0.bb</a><br>
&gt; +++ b/meta/recipes-core/initrdscripts/<a href=3D"http://initramfs-live=
-boot_1.0.bb" target=3D"_blank">initramfs-live-boot_1.0.bb</a><br>
&gt; @@ -5,7 +5,7 @@ RDEPENDS =3D &quot;udev&quot;<br>
&gt; =A0DEPENDS =3D &quot;virtual/kernel&quot;<br>
&gt; =A0SRC_URI =3D &quot;file://init-live.sh&quot;<br>
&gt;<br>
&gt; -PR =3D &quot;r10&quot;<br>
&gt; +PR =3D &quot;r11&quot;<br>
&gt;<br>
&gt; =A0do_compile() {<br>
&gt; =A0 =A0 =A0 #if grep -q &quot;CONFIG_UNION_FS=3Dy&quot; ${STAGING_KERN=
EL_DIR}/.config; then<br>
<br>
<br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--14dae9341055407f4504cd832816--
