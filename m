Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6F79C78685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 00:58:32 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id b77so12095209itd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 16:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dkns2kW8k5B7rJElcTa3LKHR12kicmY8ygCYQXmmwl4=;
	b=q4T8RQHbzSGIu3kdqByscLHCHbcE6jQcQFd9Dgw043bIVc041c23XvOtmmVn2WQz8R
	/GVp44O95S+oGtdLWORO889/Mo/yf9mMeTGCxKpTDi5PbrivQJoh7p3sAE6oPUTaaD1k
	NcnOgihaO7AoQvykAiIO+66SodVzc1nZCbfMYKJpPpnzOZxE9lLrWg7T3LUXN0arzarL
	NwZg0AHMk8QNVnfii2V3jgUD0zorvfQauhrl03Fg9VXLJxBXMR5f46ir71G+TF5Pp7FP
	IwLGi59eXrYn+Ht5yo/4wfVrMwk/nHypTNieKNMPz/pDkgi8ucIhXB9+TUu3HxNxzYl3
	fz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dkns2kW8k5B7rJElcTa3LKHR12kicmY8ygCYQXmmwl4=;
	b=oANKoOHtcXoQ+m0pIGfUeXV5A+u0X8vucHI8hnJhLGzk0MDVbfgOKEdQGyaBKZfwWh
	oyZNDiL1aINx0k+RM0l5X1oCnflIzmC5dq7Ta+jVVwq7maWPE8y7hCUkKI68U1URBHiS
	vEl3Do1X4hjERE5HL/X12LF5HTuqhH1c+v+A4Vy+f6gcVoCuyAsb4Y8odfdLpNJdsfF8
	mvEGXzS0PBvWm6c5PPnMPAuv00M+Wtwxd3UBkWoFxE6waFR0ME8xnEynuczPgxo9th9F
	1jnMnCXP6bmqaNSY1ehhN6+IgqSQEXDwlyAAuqr+dD56mJTJcaDCfgjd5tnp+3RBl+vf
	Y5Zw==
X-Gm-Message-State: AKwxytelhV5awS28CBxCLI4G/zp0q50ZPD9kY0kQDz2eCQGIM7kQHGQz
	rtDHJQVdjBNAWwoL8mzYxjIfYjgfB62XrgLIbwIx+Q==
X-Google-Smtp-Source: AH8x227/AmcLk2cczQ3/bfhcdKs8O7oap+LtH4FirscLuqCW9RzKCSHVakhuB6L8/AYM3hzrRVXuWyWSvQuZcIkFPAM=
X-Received: by 10.36.215.69 with SMTP id y66mr1272428itg.10.1516669113500;
	Mon, 22 Jan 2018 16:58:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 22 Jan 2018 16:58:13 -0800 (PST)
In-Reply-To: <CAJTo0LZ09e3Z6k82FLJsER26j5eVnF9uug65JGheA=e6DKuM-w@mail.gmail.com>
References: <CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
	<20180122105205.434-1-Martin.Jansa@gmail.com>
	<CAJTo0LZ09e3Z6k82FLJsER26j5eVnF9uug65JGheA=e6DKuM-w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jan 2018 00:58:13 +0000
Message-ID: <CAJTo0La0ew7AZt5pCM5Qgyud=cUFgHsya_6h=63rp3bqsHiMnw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: fix PACKAGECONFIGs
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
X-List-Received-Date: Tue, 23 Jan 2018 00:58:32 -0000
Content-Type: multipart/alternative; boundary="94eb2c0afc44c0a1920563670b5b"

--94eb2c0afc44c0a1920563670b5b
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

I've a patch at the top of poky-contrib:ross/mut which hopefully fixes
this.  It's a bit more invasive than I'd like but this is gettext and I'm
still at least partially sane, so that's a win as far as I'm concerned.

I've a build running now but touching gettext causes a rebuild of the world
so I'm going to bed whist it runs.  Would you be able to test it in your
environment too?

Cheers,
Ross

On 22 January 2018 at 19:46, Burton, Ross <ross.burton@intel.com> wrote:

> This is causing QA errors:
>
> ERROR: gettext-0.19.8.1-r0 do_package_qa: QA Issue: gettext:
> /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-
> split/gettext/usr/lib/gettext/hostname contains probably-redundant RPATH
> /usr/lib/../lib
> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-
> split/gettext/usr/lib/gettext/urlget contains probably-redundant RPATH
> /usr/lib/../lib
> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-
> split/gettext/usr/lib/gettext/cldr-plurals contains probably-redundant
> RPATH /usr/lib/../lib
> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-
> split/gettext/usr/bin/recode-sr-latin contains probably-redundant RPATH
> /usr/lib/../lib [useless-rpaths]
>
> Ross
>
> On 22 January 2018 at 10:52, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> * add --with-*-prefix variables to prevent configure trying to search in
>> host paths
>> * fixes:
>>   ERROR: This autoconf log indicates errors, it looked at host include
>> and/or library paths while determining system capabilities.
>>   gettext/0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning:
>> include location /usr/include/glib-2.0 is unsafe for cross-compilation
>> [-Wpoison-system-directories]
>>
>> * not sure if it's worth adding other prefixes for curses related
>> PACKAGECONFIG
>>   PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${ST
>> AGING_LIBDIR}/..,--disable-curses,ncurses,"
>>
>>   --with-libncurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
>> DIR/lib
>>   --without-libncurses-prefix     don't search for PACKLIBS in includedir
>> and libdir
>>   --with-libxcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
>> DIR/lib
>>   --without-libxcurses-prefix     don't search for PACKLIBS in includedir
>> and libdir
>>   --with-libcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
>> DIR/lib
>>   --without-libcurses-prefix     don't search for PACKLIBS in includedir
>> and libdir
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> index 97083c0da2..8a8a34cca8 100644
>> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> @@ -43,10 +43,10 @@ PACKAGECONFIG ??= "croco glib libxml libunistring"
>>  PACKAGECONFIG_class-native = ""
>>  PACKAGECONFIG_class-nativesdk = ""
>>
>> -PACKAGECONFIG[croco] = "--without-included-libcroco,-
>> -with-included-libcroco,libcroco"
>> -PACKAGECONFIG[glib] = "--without-included-glib,--wit
>> h-included-glib,glib-2.0"
>> -PACKAGECONFIG[libxml] = "--without-included-libxml,--w
>> ith-included-libxml,libxml2"
>> -PACKAGECONFIG[libunistring] = "--without-included-libunistri
>> ng,--with-included-libunistring,libunistring"
>> +PACKAGECONFIG[croco] = "--with-libcroco-0.6-prefix=${STAGING_LIBDIR}/..
>> --without-included-libcroco,--with-included-libcroco,libcroco"
>> +PACKAGECONFIG[glib] = "--with-libglib-2.0-prefix=${STAGING_LIBDIR}/..
>> --without-included-glib,--with-included-glib,glib-2.0"
>> +PACKAGECONFIG[libxml] = "--with-libxml2-prefix=${STAGING_LIBDIR}/..
>> --without-included-libxml,--with-included-libxml,libxml2"
>> +PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_LIBDIR}/..
>> --without-included-libunistring,--with-included-libunistring
>> ,libunistring"
>>  PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${ST
>> AGING_LIBDIR}/..,--disable-curses,ncurses,"
>>
>>  acpaths = '-I ${S}/gettext-runtime/m4 \
>> --
>> 2.15.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--94eb2c0afc44c0a1920563670b5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin,<div><br></div><div>I&#39;ve a patch at the top =
of poky-contrib:ross/mut which hopefully fixes this.=C2=A0 It&#39;s a bit m=
ore invasive than I&#39;d like but this is gettext and I&#39;m still at lea=
st partially sane, so that&#39;s a win as far as I&#39;m concerned.<div><br=
></div><div>I&#39;ve a build running now but touching gettext causes a rebu=
ild of the world so I&#39;m going to bed whist it runs.=C2=A0 Would you be =
able to test it in your environment too?</div><div><br></div><div>Cheers,</=
div><div>Ross</div></div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 22 January 2018 at 19:46, Burton, Ross <span dir=3D"ltr">&=
lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">This is causing QA errors:<div><br></div><div><div>ERROR: gettext-=
0.19.8.1-r0 do_package_qa: QA Issue: gettext: /work/corei7-64-poky-linux/<w=
br>gettext/0.19.8.1-r0/packages-<wbr>split/gettext/usr/lib/gettext/<wbr>hos=
tname contains probably-redundant RPATH /usr/lib/../lib</div><div>gettext: =
/work/corei7-64-poky-linux/<wbr>gettext/0.19.8.1-r0/packages-<wbr>split/get=
text/usr/lib/gettext/<wbr>urlget contains probably-redundant RPATH /usr/lib=
/../lib</div><div>gettext: /work/corei7-64-poky-linux/<wbr>gettext/0.19.8.1=
-r0/packages-<wbr>split/gettext/usr/lib/gettext/<wbr>cldr-plurals contains =
probably-redundant RPATH /usr/lib/../lib</div><div>gettext: /work/corei7-64=
-poky-linux/<wbr>gettext/0.19.8.1-r0/packages-<wbr>split/gettext/usr/bin/re=
code-<wbr>sr-latin contains probably-redundant RPATH /usr/lib/../lib [usele=
ss-rpaths]</div></div><span class=3D"HOEnZb"><font color=3D"#888888"><div><=
br></div><div>Ross</div></font></span></div><div class=3D"HOEnZb"><div clas=
s=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 Ja=
nuary 2018 at 10:52, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:m=
artin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">* add --with-*-prefix variable=
s to prevent configure trying to search in host paths<br>
* fixes:<br>
=C2=A0 ERROR: This autoconf log indicates errors, it looked at host include=
 and/or library paths while determining system capabilities.<br>
=C2=A0 gettext/0.19.8.1-r0/build/gett<wbr>ext-tools/config.log:cc1: warning=
: include location /usr/include/glib-2.0 is unsafe for cross-compilation [-=
Wpoison-system-directories]<br>
<br>
* not sure if it&#39;s worth adding other prefixes for curses related PACKA=
GECONFIG<br>
=C2=A0 PACKAGECONFIG[msgcat-curses] =3D &quot;--with-libncurses-prefix=3D${=
ST<wbr>AGING_LIBDIR}/..,--disable-cur<wbr>ses,ncurses,&quot;<br>
<br>
=C2=A0 --with-libncurses-prefix[=3DDIR]<wbr>=C2=A0 search for PACKLIBS in D=
IR/include and DIR/lib<br>
=C2=A0 --without-libncurses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for =
PACKLIBS in includedir and libdir<br>
=C2=A0 --with-libxcurses-prefix[=3DDIR]<wbr>=C2=A0 search for PACKLIBS in D=
IR/include and DIR/lib<br>
=C2=A0 --without-libxcurses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for =
PACKLIBS in includedir and libdir<br>
=C2=A0 --with-libcurses-prefix[=3DDIR]=C2=A0 search for PACKLIBS in DIR/inc=
lude and DIR/lib<br>
=C2=A0 --without-libcurses-prefix=C2=A0 =C2=A0 =C2=A0don&#39;t search for P=
ACKLIBS in includedir and libdir<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">get<wbr>text_0.19.8.1.bb</a> | 8 ++++----=
<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a> b/meta=
/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
index 97083c0da2..8a8a34cca8 100644<br>
--- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
+++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
@@ -43,10 +43,10 @@ PACKAGECONFIG ??=3D &quot;croco glib libxml libunistrin=
g&quot;<br>
=C2=A0PACKAGECONFIG_class-native =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
<br>
-PACKAGECONFIG[croco] =3D &quot;--without-included-libcroco,-<wbr>-with-inc=
luded-libcroco,libcro<wbr>co&quot;<br>
-PACKAGECONFIG[glib] =3D &quot;--without-included-glib,--wit<wbr>h-included=
-glib,glib-2.0&quot;<br>
-PACKAGECONFIG[libxml] =3D &quot;--without-included-libxml,--w<wbr>ith-incl=
uded-libxml,libxml2&quot;<br>
-PACKAGECONFIG[libunistring] =3D &quot;--without-included-libunistri<wbr>ng=
,--with-included-libunistrin<wbr>g,libunistring&quot;<br>
+PACKAGECONFIG[croco] =3D &quot;--with-libcroco-0.6-prefix=3D${<wbr>STAGING=
_LIBDIR}/.. --without-included-libcroco,--<wbr>with-included-libcroco,libcr=
oc<wbr>o&quot;<br>
+PACKAGECONFIG[glib] =3D &quot;--with-libglib-2.0-prefix=3D${S<wbr>TAGING_L=
IBDIR}/.. --without-included-glib,--with<wbr>-included-glib,glib-2.0&quot;<=
br>
+PACKAGECONFIG[libxml] =3D &quot;--with-libxml2-prefix=3D${STAGI<wbr>NG_LIB=
DIR}/.. --without-included-libxml,--wi<wbr>th-included-libxml,libxml2&quot;=
<br>
+PACKAGECONFIG[libunistring] =3D &quot;--with-libunistring-prefix=3D${<wbr>=
STAGING_LIBDIR}/.. --without-included-libunistrin<wbr>g,--with-included-lib=
unistring<wbr>,libunistring&quot;<br>
=C2=A0PACKAGECONFIG[msgcat-curses] =3D &quot;--with-libncurses-prefix=3D${S=
T<wbr>AGING_LIBDIR}/..,--disable-cur<wbr>ses,ncurses,&quot;<br>
<br>
=C2=A0acpaths =3D &#39;-I ${S}/gettext-runtime/m4 \<br>
<span class=3D"m_2205246036956529460HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c0afc44c0a1920563670b5b--
