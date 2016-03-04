Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id A86A665CC3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 22:09:29 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id c3so68025800vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 14:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=b34YH6E7r4TgcpKmT3sI94JX7Z6LZJi0iMeA5+89R7U=;
	b=mkCVYCW0usaTRhHp13f7CR8Ye/H+VthT/zS4FPYv3UStnXn7GQK3nPRJfv6dKKdlSM
	BHDd+OzMOMrYzWEL7sOdNWpf3Ji9/U2i/GTtfdy6axnULl+Cd8u8Q0R80pB6K2LTYz6T
	RaBUiMb3/dtFQrbsuF1TLy86+OykforXrkG7SOg1R9xK/gRSpFWQiX46Zg/HZKx3M55P
	f+fAvfQfUYyuAQDuZz9WgxT1cO0maxwhgTPs0FZr4q+aNYMRXEdd3BUFGIQxDiz6o1l0
	x0XRlUhnGO8HvRIDhNXlP5xG+TL76uc00gVNrd++F7smKWZbMaLxAG8TmIYPxcIVJ8sq
	45ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=b34YH6E7r4TgcpKmT3sI94JX7Z6LZJi0iMeA5+89R7U=;
	b=JiLT/O6ZA0e3fSK9TJZcMp5GOnZmQo2SGFPRrEQkZ9bIG/VmjKAaakr4hR6E9L75Qm
	TNZtTMyO5DK1tU4u6T72lGRdfNFY51MAPYKNHNNMnBz4t/jwP4ZxU2VbpPkJqfuVqguI
	7xvqPKYzUklwaLkVbnn8/BXXGYy9MZ0+DNEU6Fdkv5wfMJsYdfONSOXgqOmT2dvP748B
	7YsVrYkTxjD4RsIdnZ3I4yCGb7/X3W/GBBbyV+jmprBPQHwd2kMtAys/do/3YeZcLdzn
	zqCGkdzx14XskIGpdAYtJCc3F2rrnq88jQlUVplaSljKn5wECYqXdefoRAkLA6dS4uHI
	BRXw==
X-Gm-Message-State: AD7BkJKJzr2GS7ecNahf00sq7QDd57mpxQ9Ho7HYWVh+gfK7G040uGflJXO9a/arrwCe4Q2/r/y2baLA0HWNVw==
MIME-Version: 1.0
X-Received: by 10.31.60.134 with SMTP id j128mr8321742vka.43.1457129369813;
	Fri, 04 Mar 2016 14:09:29 -0800 (PST)
Received: by 10.103.84.219 with HTTP; Fri, 4 Mar 2016 14:09:29 -0800 (PST)
Received: by 10.103.84.219 with HTTP; Fri, 4 Mar 2016 14:09:29 -0800 (PST)
In-Reply-To: <CABcZANmn149p+4tas5nxwuLoXa2AwbHgJutk41EO8u2Y0nLi9w@mail.gmail.com>
References: <1443533265.5162.35.camel@linuxfoundation.org>
	<919610E7-93B7-41EF-ADC7-8C6A179C9950@gmail.com>
	<CABcZANmn149p+4tas5nxwuLoXa2AwbHgJutk41EO8u2Y0nLi9w@mail.gmail.com>
Date: Fri, 4 Mar 2016 16:09:29 -0600
Message-ID: <CACS+7ZSZeZ4gtzFSfnDaecGEOPXc7e4fWbqbGLRxdbtkCFByRg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linuxloader/image-prelink/image-mklibs: Fix non-standard path prelinking
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
X-List-Received-Date: Fri, 04 Mar 2016 22:09:30 -0000
Content-Type: multipart/alternative; boundary=001a1139c6447aca40052d405e8b

--001a1139c6447aca40052d405e8b
Content-Type: text/plain; charset=UTF-8

On 4 Mar 2016 11:23 a.m., "Christopher Larson" <clarson@kergoth.com> wrote:
>
>
>
> On Tue, Sep 29, 2015 at 10:09 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> > On Sep 29, 2015, at 6:27 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
>> >
>> > Prelinking on x86-64 wasn't working out the box as it uses /lib and
>> > not /lib64 for libs. Prelink was refusing to link as the dynamic loader
>> > didn't match its idea of the right path. Passing in the
--dyanmic-linker
>> > option avoids this.
>> >
>> > We can share code from image-mklibs so abstract that into a new class,
>> > linuxloader.bbclass.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > diff --git a/meta/classes/image-mklibs.bbclass
b/meta/classes/image-mklibs.bbclass
>> > index c455a8e..45a66fb 100644
>> > --- a/meta/classes/image-mklibs.bbclass
>> > +++ b/meta/classes/image-mklibs.bbclass
>> > @@ -2,6 +2,8 @@ do_rootfs[depends] +=
"mklibs-native:do_populate_sysroot"
>> >
>> > IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
>> >
>> > +inherit linuxloader
>> > +
>> > mklibs_optimize_image_doit() {
>> >       rm -rf ${WORKDIR}/mklibs
>> >       mkdir -p ${WORKDIR}/mklibs/dest
>> > @@ -15,26 +17,8 @@ mklibs_optimize_image_doit() {
>> >               | sed "s+^\./++" \
>> >               > ${WORKDIR}/mklibs/executables.list
>> >
>> > -     case ${TARGET_ARCH} in
>> > -             powerpc | mips | mipsel | microblaze )
>> > -                     dynamic_loader="${base_libdir}/ld.so.1"
>> > -                     ;;
>> > -             powerpc64)
>> > -                     dynamic_loader="${base_libdir}/ld64.so.1"
>> > -                     ;;
>> > -             x86_64)
>> > -
 dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
>> > -                     ;;
>> > -             i586 )
>> > -                     dynamic_loader="${base_libdir}/ld-linux.so.2"
>> > -                     ;;
>> > -             arm )
>> > -                     dynamic_loader="${base_libdir}/ld-linux.so.3"
>> > -                     ;;
>> > -             * )
>> > -                     dynamic_loader="/unknown_dynamic_linker"
>> > -                     ;;
>> > -     esac
>> > +     # Set $dynamic_loader
>> > +        linuxloader
>> >
>> >       mklibs -v \
>> >               --ldlib ${dynamic_loader} \
>> > diff --git a/meta/classes/image-prelink.bbclass
b/meta/classes/image-prelink.bbclass
>> > index d4bb3ae..4bb090d 100644
>> > --- a/meta/classes/image-prelink.bbclass
>> > +++ b/meta/classes/image-prelink.bbclass
>> > @@ -2,6 +2,8 @@ do_rootfs[depends] +=
"prelink-native:do_populate_sysroot"
>> >
>> > IMAGE_PREPROCESS_COMMAND += "prelink_image; "
>> >
>> > +inherit linuxloader
>> > +
>> > prelink_image () {
>> > #     export PSEUDO_DEBUG=4
>> > #     /bin/env | /bin/grep PSEUDO
>> > @@ -20,8 +22,11 @@ prelink_image () {
>> >               dummy_prelink_conf=false;
>> >       fi
>> >
>> > +     # Set $dynamic_loader
>> > +     linuxloader
>> > +
>> >       # prelink!
>> > -     ${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root
${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
>> > +     ${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root
${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker
$dynamic_loader
>> >
>> >       # Remove the prelink.conf if we had to add it.
>> >       if [ "$dummy_prelink_conf" = "true" ]; then
>> > diff --git a/meta/classes/linuxloader.bbclass
b/meta/classes/linuxloader.bbclass
>> > new file mode 100644
>> > index 0000000..578df14
>> > --- /dev/null
>> > +++ b/meta/classes/linuxloader.bbclass
>> > @@ -0,0 +1,23 @@
>> > +
>> > +linuxloader () {
>> > +     case ${TARGET_ARCH} in
>> > +             powerpc | mips | mipsel | microblaze )
>> > +                     dynamic_loader="${base_libdir}/ld.so.1"
>> > +                     ;;
>> > +             powerpc64)
>> > +                     dynamic_loader="${base_libdir}/ld64.so.1"
>> > +                     ;;
>> > +             x86_64)
>> > +
 dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
>> > +                     ;;
>> > +             i586 )
>> > +                     dynamic_loader="${base_libdir}/ld-linux.so.2"
>> > +                     ;;
>> > +             arm )
>> > +                     dynamic_loader="${base_libdir}/ld-linux.so.3"
>> > +                     ;;
>> > +             * )
>> > +                     dynamic_loader="/unknown_dynamic_linker"
>> > +                     ;;
>> > +     esac
>> > +}
>> >
>> >
>>
>> For readability it would have been nice if it was returning the value
from function so it could be used
>>
>> myloader = call this function
>
>
> Agreed, I was just thinking this could be used for UNINATIVE_LOADER in
uninative.bbclass.
>
> --
>

This would also be handy for the go stuff I'm writing at $work.

--001a1139c6447aca40052d405e8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 4 Mar 2016 11:23 a.m., &quot;Christopher Larson&quot; &lt;<a href=3D"mai=
lto:clarson@kergoth.com">clarson@kergoth.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Sep 29, 2015 at 10:09 AM Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Sep 29, 2015, at 6:27 AM, Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org=
</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Prelinking on x86-64 wasn&#39;t working out the box as it use=
s /lib and<br>
&gt;&gt; &gt; not /lib64 for libs. Prelink was refusing to link as the dyna=
mic loader<br>
&gt;&gt; &gt; didn&#39;t match its idea of the right path. Passing in the -=
-dyanmic-linker<br>
&gt;&gt; &gt; option avoids this.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We can share code from image-mklibs so abstract that into a n=
ew class,<br>
&gt;&gt; &gt; linuxloader.bbclass.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes=
/image-mklibs.bbclass<br>
&gt;&gt; &gt; index c455a8e..45a66fb 100644<br>
&gt;&gt; &gt; --- a/meta/classes/image-mklibs.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes/image-mklibs.bbclass<br>
&gt;&gt; &gt; @@ -2,6 +2,8 @@ do_rootfs[depends] +=3D &quot;mklibs-native:d=
o_populate_sysroot&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; IMAGE_PREPROCESS_COMMAND +=3D &quot;mklibs_optimize_image; &q=
uot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +inherit linuxloader<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; mklibs_optimize_image_doit() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${WORKDIR}/mklibs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/mklibs/dest<br>
&gt;&gt; &gt; @@ -15,26 +17,8 @@ mklibs_optimize_image_doit() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| sed &=
quot;s+^\./++&quot; \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ${=
WORKDIR}/mklibs/executables.list<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0case ${TARGET_ARCH} in<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc | mi=
ps | mipsel | microblaze )<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld.so.1&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc64)<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld64.so.1&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux-x86-64.so.2=
&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i586 )<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.2&quot;<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm )<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.3&quot;<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* )<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;/unknown_dynamic_linker&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0esac<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Set $dynamic_loader<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxloader<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mklibs -v \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--ldlib=
 ${dynamic_loader} \<br>
&gt;&gt; &gt; diff --git a/meta/classes/image-prelink.bbclass b/meta/classe=
s/image-prelink.bbclass<br>
&gt;&gt; &gt; index d4bb3ae..4bb090d 100644<br>
&gt;&gt; &gt; --- a/meta/classes/image-prelink.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes/image-prelink.bbclass<br>
&gt;&gt; &gt; @@ -2,6 +2,8 @@ do_rootfs[depends] +=3D &quot;prelink-native:=
do_populate_sysroot&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; IMAGE_PREPROCESS_COMMAND +=3D &quot;prelink_image; &quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +inherit linuxloader<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; prelink_image () {<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0 =C2=A0export PSEUDO_DEBUG=3D4<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0 =C2=A0/bin/env | /bin/grep PSEUDO<br>
&gt;&gt; &gt; @@ -20,8 +22,11 @@ prelink_image () {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_p=
relink_conf=3Dfalse;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Set $dynamic_loader<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0linuxloader<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# prelink!<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0${STAGING_DIR_NATIVE}${sbindir_native}/p=
relink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0${STAGING_DIR_NATIVE}${sbindir_native}/p=
relink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynam=
ic-linker $dynamic_loader<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove the prelink.conf if we had=
 to add it.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$dummy_prelink_conf&quot=
; =3D &quot;true&quot; ]; then<br>
&gt;&gt; &gt; diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/=
linuxloader.bbclass<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000..578df14<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/classes/linuxloader.bbclass<br>
&gt;&gt; &gt; @@ -0,0 +1,23 @@<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +linuxloader () {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case ${TARGET_ARCH} in<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc | mi=
ps | mipsel | microblaze )<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld.so.1&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc64)<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld64.so.1&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux-x86-64.so.2=
&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i586 )<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.2&quot;<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm )<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.3&quot;<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* )<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dynamic_loader=3D&quot;/unknown_dynamic_linker&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0esac<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; For readability it would have been nice if it was returning the va=
lue from function so it could be used<br>
&gt;&gt;<br>
&gt;&gt; myloader =3D call this function<br>
&gt;<br>
&gt;<br>
&gt; Agreed, I was just thinking this could be used for UNINATIVE_LOADER in=
 uninative.bbclass.<br>
&gt;<br>
&gt; --<br>
&gt;</p>
<p dir=3D"ltr">This would also be handy for the go stuff I&#39;m writing at=
 $work. </p>

--001a1139c6447aca40052d405e8b--
