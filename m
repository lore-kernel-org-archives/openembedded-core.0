Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2F36AC00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 08:19:59 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id s5so1860064wra.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 00:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1d5lCzquTM9sx6syCmM4tK8sXH9wDme6166iqrpnupE=;
	b=EW7hemP8LRxwo24bNx5R6bynDFTBKz6/zBWVQVzmp+KI7S0ArhsXvO6+1IVP3Llzfg
	hizy3ywhylIUDG+4zUBkbYLuxNmp3IMQmFCgnK/QMUR7x0U315SKOVJMlxzHr3LfZef7
	5gtmIF0z6D8NhiQAo6bNNuBu86YXTUb7IbHUJZVs1DOah5BUhw9TasnUS+NDYulS1AyT
	m2jyCe9cl3wePOOac+HgNT9hxAYjkeeWFgfz6SjWUjckOtQW1Cnyg0apYyNeEG93NpOC
	6/ggm7q9A3iJes7lEdtc2Bhb890Aq3qEXt083bR5f1qwGFRbLWQ1/Bti/RBPY4iNVh/Y
	vvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1d5lCzquTM9sx6syCmM4tK8sXH9wDme6166iqrpnupE=;
	b=BXixudwM0ZXQmhiaygCJaSYCTqCN1IVKsotLrIGRvlr/mJM0KU0Ih/mXfjA9h6Cvox
	8aTj5O13hsfnb73941M5LQekmH0bJZh/Fl/r1eAz0iRUqcN29Ar2Z8+9ejb3hKpoFkRl
	YFC2G11MpXwRwaIe4ftMPcIw8AAeA6XKINJKzhbuuoVN/NWOrC+A+hD4W/IiS7butICd
	Lc/BcZ2joNy4QqsKOgyX6pSBNqCDJ2mGKZq4+mYZVmEyAHf4Dx8vt+LIU6NmqNd4t8Dq
	J2/weHvTXUvuXr3MZHrOv9ZTV2G7fc00MS3Sm6KD4BdpXoasx0sU8nXd1ag8tODs+xZ+
	z31Q==
X-Gm-Message-State: AKwxytesEgWmrCi4MZG1bODHhLef57uga6/ZZBLjuhUBH8ItlAcYgu90
	/uXhljRoV2EftRgxsb0vg5CENg9f6W8cSC0FFj4=
X-Google-Smtp-Source: AH8x226Y8oY3EgdaMFZ7p0xtmoUmeTUA5dScOppJdy1fOm9nCpvAw0p8QX5Fje4QGZcxFpJsQvNOHJY+NK7Ey/QF72o=
X-Received: by 10.223.177.158 with SMTP id q30mr4862519wra.206.1516782000242; 
	Wed, 24 Jan 2018 00:20:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 24 Jan 2018 00:19:59 -0800 (PST)
In-Reply-To: <02c21a1f-69e3-dc9e-5a6d-a83a5ad7325b@windriver.com>
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
	<CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
	<070341c4-d323-07ef-58e9-78b8e9c9908a@windriver.com>
	<02c21a1f-69e3-dc9e-5a6d-a83a5ad7325b@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Jan 2018 09:19:59 +0100
Message-ID: <CA+chaQfo=Rh4UPmYAEQhO3vpzoXWkTRQWEA099HvPkToYCUUTQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Wed, 24 Jan 2018 08:19:59 -0000
Content-Type: multipart/alternative; boundary="f403045ec41e5387d90563815439"

--f403045ec41e5387d90563815439
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK.

The fix from Alex works fine for me, we can close this.

On Wed, Jan 24, 2018 at 3:31 AM, Yi Zhao <yi.zhao@windriver.com> wrote:

>
>
> =E5=9C=A8 2018=E5=B9=B401=E6=9C=8824=E6=97=A5 10:26, Yi Zhao =E5=86=99=E9=
=81=93:
>
>
>
> =E5=9C=A8 2018=E5=B9=B401=E6=9C=8819=E6=97=A5 21:58, Martin Jansa =E5=86=
=99=E9=81=93:
>
> It fails here since this upgrade, maybe the 0001-Do-not-disable-gobjec
> t-introspection-when-cross-comp.patch is still useful and wasn't
> completely merged upstream?
>
> FAILED: json-glib/Json-1.0.typelib
> json-glib/1.4.2-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper
> json-glib/Json-1.0.gir --output json-glib/Json-1.0.typelib
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use
> --includedir
> error parsing file json-glib/Json-1.0.gir: Failed to parse included gir
> GObject-2.0
> If the above error message is about missing .so libraries, then setting u=
p
> GIR_EXTRA_LIBS_PATH in the recipe should help.
> (typically like this: GIR_EXTRA_LIBS_PATH=3D"${B}/something/.libs" )
> ninja: build stopped: subcommand failed.
> WARNING: exit code 1 from a shell command.
>
>
> Hi  Martin,
>
> I still can not reproduced it.  Could you tell me which layers include,
> the DISTRO set and the build machine OS ?
>
>
> Sorry. Please ignore this mail. I missed your previous mail.
>
> Yi
>
>
> Thanks,
> Yi
>
>
>
> On Thu, Jan 18, 2018 at 1:51 PM, <git@git.openembedded.org> wrote:
>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit 6b87ad5b08004554f08d2f68027908956f3795e1
>> Author: Yi Zhao <yi.zhao@windriver.com>
>> AuthorDate: Tue Jan 16 08:32:33 2018 +0800
>>
>>     json-glib: update to 1.4.2
>>
>>     Drop 0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
>>     since it has been fixed upstream.
>>
>>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  ...ble-gobject-introspection-when-cross-comp.patch | 32
>> ----------------------
>>  .../{json-glib_1.2.8.bb =3D> json-glib_1.4.2.bb}     |  7 ++---
>>  2 files changed, 2 insertions(+), 37 deletions(-)
>>
>> diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable
>> -gobject-introspection-when-cross-comp.patch
>> b/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable
>> -gobject-introspection-when-cross-comp.patch
>> deleted file mode 100644
>> index 849bb9d..0000000
>> --- a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable
>> -gobject-introspection-when-cross-comp.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From 293452c963188666dae99521294f09a0cf9582e2 Mon Sep 17 00:00:00 2001
>> -From: Alexander Kanavin <alex.kanavin@gmail.com>
>> -Date: Fri, 4 Aug 2017 16:01:11 +0300
>> -Subject: [PATCH] Do not disable gobject introspection when
>> cross-compiling.
>> -
>> -Introspection does work fine for instance in Open Embedded,
>> -one of the most prominent cross-compilation frameworks
>> -(through qemu emulating target hardware), so let the user
>> -decide if he wants the feature or not.
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ----
>> - meson.build | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/meson.build b/meson.build
>> -index 43cbfd9..8a32f26 100644
>> ---- a/meson.build
>> -+++ b/meson.build
>> -@@ -147,7 +147,7 @@ root_dir =3D include_directories('.')
>> -
>> - gnome =3D import('gnome')
>> - gir =3D find_program('g-ir-scanner', required: false)
>> --build_gir =3D gir.found() and not meson.is_cross_build() and not
>> get_option('disable_introspection')
>> -+build_gir =3D gir.found() and not get_option('disable_introspection')
>> -
>> - subdir('json-glib')
>> -
>> ---
>> -2.13.2
>> -
>> diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
>> b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
>> similarity index 84%
>> rename from meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
>> rename to meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
>> index 31912d1..fad0a2d 100644
>> --- a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
>> +++ b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
>> @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309
>> ac38fefcd64b04bb903e34"
>>
>>  DEPENDS =3D "glib-2.0"
>>
>> -SRC_URI_append =3D " \
>> -           file://0001-Do-not-disable-gobject-introspection-when-cross-=
comp.patch
>> \
>> -           "
>> -SRC_URI[archive.md5sum] =3D "ff31e7d0594df44318e12facda3d086e"
>> -SRC_URI[archive.sha256sum] =3D "fd55a9037d39e7a10f0db64309f5f
>> 0265fa32ec962bf85066087b83a2807f40a"
>> +SRC_URI[archive.md5sum] =3D "35107e23a7bbbc70f31c34f7b9adf1c3"
>> +SRC_URI[archive.sha256sum] =3D "2d7709a44749c7318599a6829322e
>> 081915bdc73f5be5045882ed120bb686dc8"
>>
>>  GNOMEBASEBUILDCLASS =3D "meson"
>>  inherit gnomebase lib_package gobject-introspection gtk-doc manpages
>> gettext
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>
>
>
>
>
>
>

--f403045ec41e5387d90563815439
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK.<div><br></div><div>The fix from Alex works fine for me=
, we can close this.</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, Jan 24, 2018 at 3:31 AM, Yi Zhao <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_7536493485629596754moz-cite-prefix">=E5=9C=A8 2018=E5=
=B9=B401=E6=9C=8824=E6=97=A5 10:26, Yi Zhao =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <p><br>
      </p>
      <br>
      <div class=3D"m_7536493485629596754moz-cite-prefix">=E5=9C=A8 2018=E5=
=B9=B401=E6=9C=8819=E6=97=A5 21:58, Martin Jansa =E5=86=99=E9=81=93:<br>
      </div>
      <blockquote type=3D"cite">
        <div dir=3D"ltr">
          <div>It fails here since this upgrade, maybe the=C2=A0<span style=
=3D"font-size:12.8px">0001-Do-not-disable-</span><span style=3D"font-size:1=
2.8px">gobjec<wbr>t-introspection-when-</span><span style=3D"font-size:12.8=
px">cross-<wbr>comp.patch
              is still useful and wasn&#39;t completely merged upstream?</s=
pan></div>
          <div><span style=3D"font-size:12.8px"><br>
            </span></div>
          <div>FAILED: json-glib/Json-1.0.typelib=C2=A0</div>
          <div>json-glib/1.4.2-r0/recipe-<wbr>sysroot/usr/bin/g-ir-compiler=
-<wbr>wrapper
            json-glib/Json-1.0.gir --output json-glib/Json-1.0.typelib</div=
>
          <div>Could not find GIR file &#39;GObject-2.0.gir&#39;; check
            XDG_DATA_DIRS or use --includedir</div>
          <div>error parsing file json-glib/Json-1.0.gir: Failed to
            parse included gir GObject-2.0</div>
          <div>If the above error message is about missing .so
            libraries, then setting up GIR_EXTRA_LIBS_PATH in the recipe
            should help.</div>
          <div>(typically like this:
            GIR_EXTRA_LIBS_PATH=3D&quot;${B}/<wbr>something/.libs&quot; )</=
div>
          <div>ninja: build stopped: subcommand failed.</div>
          <div>WARNING: exit code 1 from a shell command.</div>
        </div>
      </blockquote>
      <br>
      Hi=C2=A0 Martin,<br>
      <br>
      I still can not reproduced it.=C2=A0 Could you tell me which layers
      include, the DISTRO set and the build machine OS ?<br>
      <br>
    </blockquote>
    <br></span>
    Sorry. Please ignore this mail. I missed your previous mail.<span class=
=3D"HOEnZb"><font color=3D"#888888"><br>
    <br>
    Yi</font></span><div><div class=3D"h5"><br>
    <br>
    <blockquote type=3D"cite">
      Thanks,<br>
      Yi<br>
      <br>
      <br>
      <blockquote type=3D"cite">
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Thu, Jan 18, 2018 at 1:51 PM, <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_bla=
nk">git@git.openembedded.org</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">This is
              an automated email from the git hooks/post-receive script.<br=
>
              <br>
              rpurdie pushed a commit to branch master<br>
              in repository openembedded-core.<br>
              <br>
              commit 6b87ad5b08004554f08d2f68027908<wbr>956f3795e1<br>
              Author: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" =
target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
              AuthorDate: Tue Jan 16 08:32:33 2018 +0800<br>
              <br>
              =C2=A0 =C2=A0 json-glib: update to 1.4.2<br>
              <br>
              =C2=A0 =C2=A0 Drop 0001-Do-not-disable-gobject-in<wbr><a href=
=3D"http://trospection-when-cross-comp.pa">trospection-when-cross-comp.pa</=
a><wbr>tch<br>
              =C2=A0 =C2=A0 since it has been fixed upstream.<br>
              <br>
              =C2=A0 =C2=A0 Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi=
.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
              =C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@l=
inuxfoundatio<wbr>n.org</a>&gt;<br>
              ---<br>
              =C2=A0...ble-gobject-introspection-<wbr>when-cross-comp.patch=
 |
              32 ----------------------<br>
              =C2=A0.../{<a href=3D"http://json-glib_1.2.8.bb" rel=3D"noref=
errer" target=3D"_blank">json-glib_1.2.8.bb</a>
              =3D&gt; <a href=3D"http://json-glib_1.4.2.bb" rel=3D"noreferr=
er" target=3D"_blank">json-glib_1.4.2.bb</a>}=C2=A0
              =C2=A0 =C2=A0|=C2=A0 7 ++---<br>
              =C2=A02 files changed, 2 insertions(+), 37 deletions(-)<br>
              <br>
              diff --git a/meta/recipes-gnome/json-glib<wbr>/json-glib/0001=
-Do-not-disable<wbr>-gobject-introspection-when-<wbr>cross-comp.patch
              b/meta/recipes-gnome/json-glib<wbr>/json-glib/0001-Do-not-dis=
able<wbr>-gobject-introspection-when-<wbr>cross-comp.patch<br>
              deleted file mode 100644<br>
              index 849bb9d..0000000<br>
              --- a/meta/recipes-gnome/json-glib<wbr>/json-glib/0001-Do-not=
-disable<wbr>-gobject-introspection-when-<wbr>cross-comp.patch<br>
              +++ /dev/null<br>
              @@ -1,32 +0,0 @@<br>
              -From 293452c963188666dae99521294f09<wbr>a0cf9582e2 Mon
              Sep 17 00:00:00 2001<br>
              -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
              -Date: Fri, 4 Aug 2017 16:01:11 +0300<br>
              -Subject: [PATCH] Do not disable gobject introspection
              when cross-compiling.<br>
              -<br>
              -Introspection does work fine for instance in Open
              Embedded,<br>
              -one of the most prominent cross-compilation frameworks<br>
              -(through qemu emulating target hardware), so let the user<br=
>
              -decide if he wants the feature or not.<br>
              -<br>
              -Upstream-Status: Pending<br>
              -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
              ----<br>
              - meson.build | 2 +-<br>
              - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
              -<br>
              -diff --git a/meson.build b/meson.build<br>
              -index 43cbfd9..8a32f26 100644<br>
              ---- a/meson.build<br>
              -+++ b/meson.build<br>
              -@@ -147,7 +147,7 @@ root_dir =3D include_directories(&#39;.&=
#39;)<br>
              -<br>
              - gnome =3D import(&#39;gnome&#39;)<br>
              - gir =3D find_program(&#39;g-ir-scanner&#39;, required: fals=
e)<br>
              --build_gir =3D gir.found() and not meson.is_cross_build()
              and not get_option(&#39;disable_introspect<wbr>ion&#39;)<br>
              -+build_gir =3D gir.found() and not get_option(&#39;disable_i=
ntrospect<wbr>ion&#39;)<br>
              -<br>
              - subdir(&#39;json-glib&#39;)<br>
              -<br>
              ---<br>
              -2.13.2<br>
              -<br>
              diff --git a/meta/recipes-gnome/json-glib<wbr>/<a href=3D"htt=
p://json-glib_1.2.8.bb" rel=3D"noreferrer" target=3D"_blank">json-glib_1.2.=
8.bb</a>
              b/meta/recipes-gnome/json-glib<wbr>/<a href=3D"http://json-gl=
ib_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a><br=
>
              similarity index 84%<br>
              rename from meta/recipes-gnome/json-glib/<a href=3D"http://js=
on-glib_1.2.8.bb" rel=3D"noreferrer" target=3D"_blank">j<wbr>son-glib_1.2.8=
.bb</a><br>
              rename to meta/recipes-gnome/json-glib/<a href=3D"http://json=
-glib_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">j<wbr>son-glib_1.4.2.b=
b</a><br>
              index 31912d1..fad0a2d 100644<br>
              --- a/meta/recipes-gnome/json-glib<wbr>/<a href=3D"http://jso=
n-glib_1.2.8.bb" rel=3D"noreferrer" target=3D"_blank">json-glib_1.2.8.bb</a=
><br>
              +++ b/meta/recipes-gnome/json-glib<wbr>/<a href=3D"http://jso=
n-glib_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">json-glib_1.4.2.bb</a=
><br>
              @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =3D &quot;<a class=3D"m_7=
536493485629596754moz-txt-link-freetext">file://COPYING;md5=3D</a>7fbc33830=
9<wbr>ac38fefcd64b04bb903e34&quot;<br>
              <br>
              =C2=A0DEPENDS =3D &quot;glib-2.0&quot;<br>
              <br>
              -SRC_URI_append =3D &quot; \<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_75364=
93485629596754moz-txt-link-freetext">file://0001-Do-not-disable</a>-go<wbr>=
bject-introspection-when-cross<wbr>-comp.patch
              \<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
              -SRC_URI[archive.md5sum] =3D &quot;ff31e7d0594df44318e12facda=
3d0<wbr>86e&quot;<br>
              -SRC_URI[archive.sha256sum] =3D &quot;fd55a9037d39e7a10f0db64=
309f5f<wbr>0265fa32ec962bf85066087b83a280<wbr>7f40a&quot;<br>
              +SRC_URI[archive.md5sum] =3D &quot;35107e23a7bbbc70f31c34f7b9=
adf<wbr>1c3&quot;<br>
              +SRC_URI[archive.sha256sum] =3D &quot;2d7709a44749c7318599a68=
29322e<wbr>081915bdc73f5be5045882ed120bb6<wbr>86dc8&quot;<br>
              <br>
              =C2=A0GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
              =C2=A0inherit gnomebase lib_package gobject-introspection
              gtk-doc manpages gettext<br>
              <span class=3D"m_7536493485629596754HOEnZb"><font color=3D"#8=
88888"><br>
                  --<br>
                  To stop receiving notification emails like this one,
                  please contact<br>
                  the administrator of this repository.<br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-commits mailing list<br>
                  <a href=3D"mailto:Openembedded-commits@lists.openembedded=
.org" target=3D"_blank">Openembedded-commits@lists.ope<wbr>nembedded.org</a=
><br>
                  <a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-commits" rel=3D"noreferrer" target=3D"_blank">http://lists.op=
enembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>commits</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </blockquote>
      <br>
      <br>
      <fieldset class=3D"m_7536493485629596754mimeAttachmentHeader"></field=
set>
      <br>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--f403045ec41e5387d90563815439--
