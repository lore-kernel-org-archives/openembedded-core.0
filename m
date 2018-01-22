Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2250E60721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 10:59:42 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id f89so9016917ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 02:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2VOGbxsXytZr6S9yxf83byNx9g86EQU2R3tLFWA1Yqc=;
	b=TvTo11gvm8HvgZT3cpoL9fQLTQ06mSDjg1nqVYNBkQy8degl6fAgAPdtARy4eDh35p
	s51lPtF010pZxtUL5iAlBxkdhj7ErWRU0CBBQDZFF2JGvqeCNg1EK1VbOKavyIPIDwGJ
	8CDupSQ+tLU22R0jLED6GHweSXK5cPlXPzanqE9rhsoGEmbh5gG8TZYXY1uM+SHSxN0v
	4F3dAIGW5njVER42nL+h3fYaxymaPCrYc2g5CdvuDTZ4g4QZ+QOXJCILTXsPZKZC2u9X
	yyhOZHLLWD4PLboAX78YBX0zbM9KWn9sGfmAjkoZIoDKTNwaAR71nMXzFg9Y/38yRCln
	UnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2VOGbxsXytZr6S9yxf83byNx9g86EQU2R3tLFWA1Yqc=;
	b=SBNAY7kAI1sp53/JXskbCQYchOGBhwRyVaw4dUpEgo2KYgHSjLpCDYRvho9wVTnrGf
	kFQYGnRAZIFFlzGRloq0JhF3plv9cF3yC0kd+ro+j2rMHY8y71MnuYiAYkQptsqYtRiw
	iaYhRq1+MK64PerBQ6vvyQyyWwEQW1H5FWp/6dd/smosN+Clm5Wl6ovNEJkr2ro0BT1g
	SSCnpBpSuTZdbrCoxAqcAFZv34stoxtrhV/TWsKjQbcEeltUvc0GsBUy3BlHErAfXc7p
	aUznwbxOi+bmCn8R+hoWCJlxeTiRidPkwctVYu1H/B3HWV+BGnuLs2IvjehbokYr3SfE
	XkFQ==
X-Gm-Message-State: AKwxytflub+5N1f7A6lM+61MMZ6peMppPcUPvZrIbwaqhjpFd5JE5jVB
	S5AnXKSr7M851hbmX6KeqH9Rk4TOpeTt1MpcUAr+zA==
X-Google-Smtp-Source: AH8x227VF1pwnVir7DAzbfNtbk318Ha0CKYx3N3fBTtwhd5FesqdtRK5dk82fOKZibEJ7DTIFsILLpBzZqVyBXczhQQ=
X-Received: by 10.107.133.75 with SMTP id h72mr7462407iod.227.1516618784271;
	Mon, 22 Jan 2018 02:59:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 22 Jan 2018 02:59:23 -0800 (PST)
In-Reply-To: <CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
	<20180108160021.4715-9-ross.burton@intel.com>
	<CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jan 2018 10:59:23 +0000
Message-ID: <CAJTo0Lai2B6ERKH1471OQGcvUKyK5huaUgJvacnXmnqgTZ3bZQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] gettext: rationalise optional dependencies
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
X-List-Received-Date: Mon, 22 Jan 2018 10:59:43 -0000
Content-Type: multipart/alternative; boundary="001a113ec5e4e585cc05635b53db"

--001a113ec5e4e585cc05635b53db
Content-Type: text/plain; charset="UTF-8"

Eek, thanks.

Ross

On 21 January 2018 at 15:30, Martin Jansa <martin.jansa@gmail.com> wrote:

> --without-included-glib seems to cause configure to find glib from the
> host:
>
> ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
>
> gettext/0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning: include
> location "/usr/include/glib-2.0" is unsafe for cross-compilation
> [-Wpoison-system-directories]
>
> I'm testing it with added --with-libglib-2.0-prefix to see if it fixes the
> issue. I've added the same to other added PACKAGECONFIGs:
> -PACKAGECONFIG[croco] = "--without-included-libcroco,-
> -with-included-libcroco,libcroco"
> -PACKAGECONFIG[glib] = "--without-included-glib,--
> with-included-glib,glib-2.0"
> -PACKAGECONFIG[libxml] = "--without-included-libxml,--
> with-included-libxml,libxml2"
> -PACKAGECONFIG[libunistring] = "--without-included-
> libunistring,--with-included-libunistring,libunistring"
> +PACKAGECONFIG[croco] = "--with-libcroco-0.6-prefix=${STAGING_LIBDIR}/..
> --without-included-libcroco,--with-included-libcroco,libcroco"
> +PACKAGECONFIG[glib] = "--with-libglib-2.0-prefix=${STAGING_LIBDIR}/..
> --without-included-glib,--with-included-glib,glib-2.0"
> +PACKAGECONFIG[libxml] = "--with-libxml2-prefix=${STAGING_LIBDIR}/..
> --without-included-libxml,--with-included-libxml,libxml2"
> +PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_LIBDIR}/..
> --without-included-libunistring,--with-included-libunistring,libunistring"
>
> Not sure if it's worth adding other prefixes for curses related
> PACKAGECONFIG
> PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${
> STAGING_LIBDIR}/..,--disable-curses,ncurses,"
>
>   --with-libncurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
> DIR/lib
>   --without-libncurses-prefix     don't search for PACKLIBS in includedir
> and libdir
>   --with-libxcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
> DIR/lib
>   --without-libxcurses-prefix     don't search for PACKLIBS in includedir
> and libdir
>   --with-libcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
> DIR/lib
>   --without-libcurses-prefix     don't search for PACKLIBS in includedir
> and libdir
>
>
>
> On Mon, Jan 8, 2018 at 5:00 PM, Ross Burton <ross.burton@intel.com> wrote:
>
>> gettext has optional dependencies on libxml2, glib, libcroco and
>> libunistring.
>> If they're not available then gettext will use internal copies, but it
>> can also
>> use system libraries.
>>
>> For gettext-native continue to use the internal copies to get this
>> building
>> sooner rather than later, but for target use the system shared libraries.
>>
>> Also gettext 0.19.7 onwards swapped expat for libxm2, so remove the build
>> dependency on expat.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> index 46ea68ff5b5..25ff601a6be 100644
>> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> @@ -8,7 +8,7 @@ SECTION = "libs"
>>  LICENSE = "GPLv3+ & LGPL-2.1+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
>> -DEPENDS = "gettext-native virtual/libiconv expat"
>> +DEPENDS = "gettext-native virtual/libiconv"
>>  DEPENDS_class-native = "gettext-minimal-native"
>>  PROVIDES = "virtual/libintl virtual/gettext"
>>  PROVIDES_class-native = "virtual/gettext-native"
>> @@ -33,18 +33,22 @@ EXTRA_OECONF += "--without-lispdir \
>>                   --disable-native-java \
>>                   --disable-openmp \
>>                   --disable-acl \
>> -                 --with-included-glib \
>>                   --without-emacs \
>>                   --without-cvs \
>>                   --without-git \
>> -                 --with-included-libxml \
>> -                 --with-included-libcroco \
>> -                 --with-included-libunistring \
>>                  "
>>  EXTRA_OECONF_append_class-target = " \
>>                   --with-bisonlocaledir=${datadir}/locale \
>>  "
>>
>> +PACKAGECONFIG ??= "croco glib libxml libunistring"
>> +PACKAGECONFIG_class-native = ""
>> +
>> +PACKAGECONFIG[croco] = "--without-included-libcroco,-
>> -with-included-libcroco,libcroco"
>> +PACKAGECONFIG[glib] = "--without-included-glib,--wit
>> h-included-glib,glib-2.0"
>> +PACKAGECONFIG[libxml] = "--without-included-libxml,--w
>> ith-included-libxml,libxml2"
>> +PACKAGECONFIG[libunistring] = "--without-included-libunistri
>> ng,--with-included-libunistring,libunistring"
>> +
>>  acpaths = '-I ${S}/gettext-runtime/m4 \
>>             -I ${S}/gettext-tools/m4'
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a113ec5e4e585cc05635b53db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Eek, thanks.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 January 2018 at 15:30=
, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr">--without-included-glib seems to=
 cause configure to find glib from the host:<div><br></div><div>ERROR: This=
 autoconf log indicates errors, it looked at host include and/or library pa=
ths while determining system capabilities.</div><div><br><div>gettext/0.19.=
8.1-r0/build/<wbr>gettext-tools/config.log:cc1: warning: include location &=
quot;/usr/include/glib-2.0&quot; is unsafe for cross-compilation [-Wpoison-=
system-directories]<br></div></div><div><br></div><div>I&#39;m testing it w=
ith added --with-libglib-2.0-prefix to see if it fixes the issue. I&#39;ve =
added the same to other added PACKAGECONFIGs:</div><div><div>-PACKAGECONFIG=
[croco] =3D &quot;--without-included-libcroco,-<wbr>-with-included-libcroco=
,<wbr>libcroco&quot;</div><div>-PACKAGECONFIG[glib] =3D &quot;--without-inc=
luded-glib,--<wbr>with-included-glib,glib-2.0&quot;</div><div>-PACKAGECONFI=
G[libxml] =3D &quot;--without-included-libxml,--<wbr>with-included-libxml,l=
ibxml2&quot;</div><div>-PACKAGECONFIG[libunistring] =3D &quot;--without-inc=
luded-<wbr>libunistring,--with-included-<wbr>libunistring,libunistring&quot=
;</div><div>+PACKAGECONFIG[croco] =3D &quot;--with-libcroco-0.6-prefix=3D${=
<wbr>STAGING_LIBDIR}/.. --without-included-libcroco,--<wbr>with-included-li=
bcroco,<wbr>libcroco&quot;</div><div>+PACKAGECONFIG[glib] =3D &quot;--with-=
libglib-2.0-prefix=3D${<wbr>STAGING_LIBDIR}/.. --without-included-glib,--<w=
br>with-included-glib,glib-2.0&quot;</div><div>+PACKAGECONFIG[libxml] =3D &=
quot;--with-libxml2-prefix=3D${<wbr>STAGING_LIBDIR}/.. --without-included-l=
ibxml,--<wbr>with-included-libxml,libxml2&quot;</div><div>+PACKAGECONFIG[li=
bunistring] =3D &quot;--with-libunistring-prefix=3D${<wbr>STAGING_LIBDIR}/.=
. --without-included-<wbr>libunistring,--with-included-<wbr>libunistring,li=
bunistring&quot;</div></div><div><br></div><div>Not sure if it&#39;s worth =
adding other prefixes for curses related PACKAGECONFIG</div><div>PACKAGECON=
FIG[msgcat-curses] =3D &quot;--with-libncurses-prefix=3D${<wbr>STAGING_LIBD=
IR}/..,--disable-<wbr>curses,ncurses,&quot;<br></div><div><br></div><div><d=
iv>=C2=A0 --with-libncurses-prefix[=3DDIR]<wbr>=C2=A0 search for PACKLIBS i=
n DIR/include and DIR/lib</div><div>=C2=A0 --without-libncurses-prefix=C2=
=A0 =C2=A0 =C2=A0don&#39;t search for PACKLIBS in includedir and libdir</di=
v><div>=C2=A0 --with-libxcurses-prefix[=3DDIR]<wbr>=C2=A0 search for PACKLI=
BS in DIR/include and DIR/lib</div><div>=C2=A0 --without-libxcurses-prefix=
=C2=A0 =C2=A0 =C2=A0don&#39;t search for PACKLIBS in includedir and libdir<=
/div><div>=C2=A0 --with-libcurses-prefix[=3DDIR]=C2=A0 search for PACKLIBS =
in DIR/include and DIR/lib</div><div>=C2=A0 --without-libcurses-prefix=C2=
=A0 =C2=A0 =C2=A0don&#39;t search for PACKLIBS in includedir and libdir</di=
v></div><div><br></div><div><br></div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote"><div><div class=3D"h5">On Mon, Jan 8, 2018 at 5:=
00 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@inte=
l.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br></d=
iv></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">gettext has =
optional dependencies on libxml2, glib, libcroco and libunistring.<br>
If they&#39;re not available then gettext will use internal copies, but it =
can also<br>
use system libraries.<br>
<br>
For gettext-native continue to use the internal copies to get this building=
<br>
sooner rather than later, but for target use the system shared libraries.<b=
r>
<br>
Also gettext 0.19.7 onwards swapped expat for libxm2, so remove the build<b=
r>
dependency on expat.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">get<wbr>text_0.19.8.1.bb</a> | 14 +++++++=
++-----<br>
=C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a> b/meta=
/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
index 46ea68ff5b5..25ff601a6be 100644<br>
--- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
+++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
@@ -8,7 +8,7 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv3+ &amp; LGPL-2.1+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb6<wbr>73463a=
b874e80d47fae504&quot;<br>
<br>
-DEPENDS =3D &quot;gettext-native virtual/libiconv expat&quot;<br>
+DEPENDS =3D &quot;gettext-native virtual/libiconv&quot;<br>
=C2=A0DEPENDS_class-native =3D &quot;gettext-minimal-native&quot;<br>
=C2=A0PROVIDES =3D &quot;virtual/libintl virtual/gettext&quot;<br>
=C2=A0PROVIDES_class-native =3D &quot;virtual/gettext-native&quot;<br>
@@ -33,18 +33,22 @@ EXTRA_OECONF +=3D &quot;--without-lispdir \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-na=
tive-java \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-op=
enmp \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-ac=
l \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-inclu=
ded-glib \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-em=
acs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-cv=
s \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-gi=
t \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-inclu=
ded-libxml \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-inclu=
ded-libcroco \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-inclu=
ded-libunistring \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0EXTRA_OECONF_append_class-tar<wbr>get =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-bison=
localedir=3D${datadi<wbr>r}/locale \<br>
=C2=A0&quot;<br>
<br>
+PACKAGECONFIG ??=3D &quot;croco glib libxml libunistring&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG[croco] =3D &quot;--without-included-libcroco,-<wbr>-with-inc=
luded-libcroco,libcro<wbr>co&quot;<br>
+PACKAGECONFIG[glib] =3D &quot;--without-included-glib,--wit<wbr>h-included=
-glib,glib-2.0&quot;<br>
+PACKAGECONFIG[libxml] =3D &quot;--without-included-libxml,--w<wbr>ith-incl=
uded-libxml,libxml2&quot;<br>
+PACKAGECONFIG[libunistring] =3D &quot;--without-included-libunistri<wbr>ng=
,--with-included-libunistrin<wbr>g,libunistring&quot;<br>
+<br>
=C2=A0acpaths =3D &#39;-I ${S}/gettext-runtime/m4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I ${S}/gettext-tools/m4&#39;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m=
_7825961928473023843HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>

--001a113ec5e4e585cc05635b53db--
