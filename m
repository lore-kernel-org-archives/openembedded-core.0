Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id A21CB719AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 00:43:05 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id s5so1129931wra.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YfrBhFggH7FKMAdnHuzO9BV5JiTdHKBfw7Eo6nG2bIQ=;
	b=oNSh9i7kHuiJMOMg8vguVtKiRCKTfn85KPCCSAflBe9mcRZqrF34E+CjzyFIHMogEk
	z/ZOLeJPpMENwzRaxq84Unjyd4H0ftEl+7ppS2cHJNLe9Co5/SH8Qv3aq+IvVTxl9q+y
	VQHszvqTSg8ov5MHZtXt8z05AshZGSWiFxIn+g6/OaL4TrA0XIm1H9IUuLXWTc57SA/K
	bDd5+zNVjMjRYi+GqeEMCdMOK2FCE5nNHo+C3r1A/9IYBmz0t7GwC+2Oxb9rEGrpxMoZ
	soLdqtSF5hTwQlrSJuaVFHKmKjZMP2x/ix9OHHQn5jrUNtShhi0DtvAhOPVu2FBJDQrw
	KCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YfrBhFggH7FKMAdnHuzO9BV5JiTdHKBfw7Eo6nG2bIQ=;
	b=glimLKBwPUvp+ER+jEUZSAVztl6oXNWrzuPg2p9VUhY77oxYrPm8b/iUK2x85pD6hv
	9m6zgoIuFdv07IeFoRmi6LIwaKIPl54xZ20HKXwp6bjymDm6d9OG5qV8isCUG5wGNwWa
	sVpEVeoHCG0QPhujdP9EPbJn7BjiG4+1wiYJJIUv8XE1IT22E5bQafGwV4/ip0Yrp3WK
	9tzFvTMWZp53HAQyt5XED7VRVa0uNf8Va0JUvVSjzZgE0VV9vYD6vg2SmEUt++G02VTe
	6OhxoEoravbRT5WgJu+RhkVFVt9zN/0aW6w1aq3k3muiy/Yfe0qBeAjJJ5p7rfO8U0KI
	6D5Q==
X-Gm-Message-State: AKwxytfvKAtfwfg35AcsTHLTPieyrc1HT4r54V4g7JSd93DohJGsoQZ9
	3Kvn72WIfeAznDGlUuE5V7n/W9pIzexeJ8gCdAo=
X-Google-Smtp-Source: AH8x227REdKMVglMbLOn7xPrEv9lgpLxxj4a8d8ePpWfu5ziVQJo+ZICbuzgqsKaVRbkNuaAiM3O7O6FAlIj3N7FhY4=
X-Received: by 10.223.177.158 with SMTP id q30mr3977184wra.206.1516754585166; 
	Tue, 23 Jan 2018 16:43:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 23 Jan 2018 16:43:04 -0800 (PST)
In-Reply-To: <CAJTo0LbZPBO35euq168ehRu6DDvnP5HAr1WQyvoftVK9A8eRRw@mail.gmail.com>
References: <CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
	<20180122105205.434-1-Martin.Jansa@gmail.com>
	<CAJTo0LZ09e3Z6k82FLJsER26j5eVnF9uug65JGheA=e6DKuM-w@mail.gmail.com>
	<CAJTo0La0ew7AZt5pCM5Qgyud=cUFgHsya_6h=63rp3bqsHiMnw@mail.gmail.com>
	<CA+chaQeBaSJ+RfoLoaC7ajnFo1UPA_0XhXVinCODf0o1movBPA@mail.gmail.com>
	<CAJTo0LbZPBO35euq168ehRu6DDvnP5HAr1WQyvoftVK9A8eRRw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Jan 2018 01:43:04 +0100
Message-ID: <CA+chaQeMChXg4c0BH1q58WNU2BEjMvVTjZn_TA8hBna7fzMV4A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 24 Jan 2018 00:43:06 -0000
Content-Type: multipart/alternative; boundary="f403045ec41e42a82905637af29f"

--f403045ec41e42a82905637af29f
Content-Type: text/plain; charset="UTF-8"

Thanks, this version built for me on that system where it was failing
before (I haven't tried to rebuild world, just gettext).

On Wed, Jan 24, 2018 at 12:09 AM, Burton, Ross <ross.burton@intel.com>
wrote:

> Yeah, I managed to typo.  Latest ross/mut has a new version.
>
> Ross
>
> On 23 January 2018 at 22:29, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> The
>> --without-included-libunistring=
>> change there
>>
>> -PACKAGECONFIG[libunistring] = "--without-included-libunistri
>> ng,--with-included-libunistring,libunistring"
>> +PACKAGECONFIG[libunistring] = "--without-included-libunistri
>> ng=${STAGING_LIBDIR}/..,--with-included-libunistring,libunistring"
>>
>> looks really strange and indeed it fails:
>>
>> | configure: error: invalid package name: included-libunistring=/OE/BUIL
>> D/work/qemux86-oe-linux/gettext/0.19.8.1-r0/recipe-sysroot/usr/lib/..
>>
>> After removing this part and keeping only the added .patch I got the same
>> error as before:
>> ERROR: gettext-0.19.8.1-r0 do_configure: This autoconf log indicates
>> errors, it looked at host include and/or library paths while determining
>> system capabilities.
>> Rerun configure task after fixing this.
>>
>> 0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning: include
>> location "/usr/include/glib-2.0" is unsafe for cross-compilation
>> [-Wpoison-system-directories]
>>
>>
>>
>> On Tue, Jan 23, 2018 at 1:58 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> Hi Martin,
>>>
>>> I've a patch at the top of poky-contrib:ross/mut which hopefully fixes
>>> this.  It's a bit more invasive than I'd like but this is gettext and I'm
>>> still at least partially sane, so that's a win as far as I'm concerned.
>>>
>>> I've a build running now but touching gettext causes a rebuild of the
>>> world so I'm going to bed whist it runs.  Would you be able to test it in
>>> your environment too?
>>>
>>> Cheers,
>>> Ross
>>>
>>> On 22 January 2018 at 19:46, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>>> This is causing QA errors:
>>>>
>>>> ERROR: gettext-0.19.8.1-r0 do_package_qa: QA Issue: gettext:
>>>> /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-spli
>>>> t/gettext/usr/lib/gettext/hostname contains probably-redundant RPATH
>>>> /usr/lib/../lib
>>>> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-spli
>>>> t/gettext/usr/lib/gettext/urlget contains probably-redundant RPATH
>>>> /usr/lib/../lib
>>>> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-spli
>>>> t/gettext/usr/lib/gettext/cldr-plurals contains probably-redundant
>>>> RPATH /usr/lib/../lib
>>>> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-spli
>>>> t/gettext/usr/bin/recode-sr-latin contains probably-redundant RPATH
>>>> /usr/lib/../lib [useless-rpaths]
>>>>
>>>> Ross
>>>>
>>>> On 22 January 2018 at 10:52, Martin Jansa <martin.jansa@gmail.com>
>>>> wrote:
>>>>
>>>>> * add --with-*-prefix variables to prevent configure trying to search
>>>>> in host paths
>>>>> * fixes:
>>>>>   ERROR: This autoconf log indicates errors, it looked at host include
>>>>> and/or library paths while determining system capabilities.
>>>>>   gettext/0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning:
>>>>> include location /usr/include/glib-2.0 is unsafe for cross-compilation
>>>>> [-Wpoison-system-directories]
>>>>>
>>>>> * not sure if it's worth adding other prefixes for curses related
>>>>> PACKAGECONFIG
>>>>>   PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${ST
>>>>> AGING_LIBDIR}/..,--disable-curses,ncurses,"
>>>>>
>>>>>   --with-libncurses-prefix[=DIR]  search for PACKLIBS in DIR/include
>>>>> and DIR/lib
>>>>>   --without-libncurses-prefix     don't search for PACKLIBS in
>>>>> includedir and libdir
>>>>>   --with-libxcurses-prefix[=DIR]  search for PACKLIBS in DIR/include
>>>>> and DIR/lib
>>>>>   --without-libxcurses-prefix     don't search for PACKLIBS in
>>>>> includedir and libdir
>>>>>   --with-libcurses-prefix[=DIR]  search for PACKLIBS in DIR/include
>>>>> and DIR/lib
>>>>>   --without-libcurses-prefix     don't search for PACKLIBS in
>>>>> includedir and libdir
>>>>>
>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>> ---
>>>>>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 8 ++++----
>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>>>>> b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>>>>> index 97083c0da2..8a8a34cca8 100644
>>>>> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>>>>> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>>>>> @@ -43,10 +43,10 @@ PACKAGECONFIG ??= "croco glib libxml libunistring"
>>>>>  PACKAGECONFIG_class-native = ""
>>>>>  PACKAGECONFIG_class-nativesdk = ""
>>>>>
>>>>> -PACKAGECONFIG[croco] = "--without-included-libcroco,-
>>>>> -with-included-libcroco,libcroco"
>>>>> -PACKAGECONFIG[glib] = "--without-included-glib,--wit
>>>>> h-included-glib,glib-2.0"
>>>>> -PACKAGECONFIG[libxml] = "--without-included-libxml,--w
>>>>> ith-included-libxml,libxml2"
>>>>> -PACKAGECONFIG[libunistring] = "--without-included-libunistri
>>>>> ng,--with-included-libunistring,libunistring"
>>>>> +PACKAGECONFIG[croco] = "--with-libcroco-0.6-prefix=${STAGING_LIBDIR}/..
>>>>> --without-included-libcroco,--with-included-libcroco,libcroco"
>>>>> +PACKAGECONFIG[glib] = "--with-libglib-2.0-prefix=${STAGING_LIBDIR}/..
>>>>> --without-included-glib,--with-included-glib,glib-2.0"
>>>>> +PACKAGECONFIG[libxml] = "--with-libxml2-prefix=${STAGING_LIBDIR}/..
>>>>> --without-included-libxml,--with-included-libxml,libxml2"
>>>>> +PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_LIBDIR}/..
>>>>> --without-included-libunistring,--with-included-libunistring
>>>>> ,libunistring"
>>>>>  PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${ST
>>>>> AGING_LIBDIR}/..,--disable-curses,ncurses,"
>>>>>
>>>>>  acpaths = '-I ${S}/gettext-runtime/m4 \
>>>>> --
>>>>> 2.15.1
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>>
>>>>
>>>
>>
>

--f403045ec41e42a82905637af29f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, this version built for me on that system where it =
was failing before (I haven&#39;t tried to rebuild world, just gettext).</d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jan 24=
, 2018 at 12:09 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ro=
ss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Yeah, I managed =
to typo.=C2=A0 Latest ross/mut has a new version.<span class=3D"HOEnZb"><fo=
nt color=3D"#888888"><div><br></div><div>Ross</div></font></span></div><div=
 class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 23 January 2018 at 22:29, Martin Jansa <span dir=3D"l=
tr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.=
jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr"><div>The=C2=A0</div><div>--without-included-libunistrin<wbr>g=
=3D</div><div>change there</div><div><div><br></div><div>-PACKAGECONFIG[lib=
unistring] =3D &quot;--without-included-libunistri<wbr>ng,--with-included-l=
ibunistrin<wbr>g,libunistring&quot;</div><div>+PACKAGECONFIG[libunistring] =
=3D &quot;--without-included-libunistri<wbr>ng=3D${STAGING_LIBDIR}/..,--wit=
h<wbr>-included-libunistring,libunis<wbr>tring&quot;</div></div><div><br></=
div><div>looks really strange and indeed it fails:<br></div><div><br></div>=
<div>| configure: error: invalid package name: included-libunistring=3D/OE/=
BUIL<wbr>D/work/qemux86-oe-linux/gettex<wbr>t/0.19.8.1-r0/recipe-sysroot/u<=
wbr>sr/lib/..</div><div><br></div><div>After removing this part and keeping=
 only the added .patch I got the same error as before:</div><div><div>ERROR=
: gettext-0.19.8.1-r0 do_configure: This autoconf log indicates errors, it =
looked at host include and/or library paths while determining system capabi=
lities.</div><div>Rerun configure task after fixing this.</div></div><span>=
<div><br></div><div><div>0.19.8.1-r0/build/gettext-tool<wbr>s/config.log:cc=
1: warning: include location &quot;/usr/include/glib-2.0&quot; is unsafe fo=
r cross-compilation [-Wpoison-system-directories]</div></div><div><br></div=
><div><br></div></span></div><div class=3D"m_1016999681615440584HOEnZb"><di=
v class=3D"m_1016999681615440584h5"><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Tue, Jan 23, 2018 at 1:58 AM, Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr">Hi Martin,<div><br></div><div>I&#39;ve a patch at the top =
of poky-contrib:ross/mut which hopefully fixes this.=C2=A0 It&#39;s a bit m=
ore invasive than I&#39;d like but this is gettext and I&#39;m still at lea=
st partially sane, so that&#39;s a win as far as I&#39;m concerned.<div><br=
></div><div>I&#39;ve a build running now but touching gettext causes a rebu=
ild of the world so I&#39;m going to bed whist it runs.=C2=A0 Would you be =
able to test it in your environment too?</div><div><br></div><div>Cheers,</=
div><div>Ross</div></div></div><div class=3D"m_1016999681615440584m_8308011=
28156425176HOEnZb"><div class=3D"m_1016999681615440584m_830801128156425176h=
5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 January =
2018 at 19:46, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.bu=
rton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">This is causing QA er=
rors:<div><br></div><div><div>ERROR: gettext-0.19.8.1-r0 do_package_qa: QA =
Issue: gettext: /work/corei7-64-poky-linux/get<wbr>text/0.19.8.1-r0/package=
s-spli<wbr>t/gettext/usr/lib/gettext/host<wbr>name contains probably-redund=
ant RPATH /usr/lib/../lib</div><div>gettext: /work/corei7-64-poky-linux/get=
<wbr>text/0.19.8.1-r0/packages-spli<wbr>t/gettext/usr/lib/gettext/urlg<wbr>=
et contains probably-redundant RPATH /usr/lib/../lib</div><div>gettext: /wo=
rk/corei7-64-poky-linux/get<wbr>text/0.19.8.1-r0/packages-spli<wbr>t/gettex=
t/usr/lib/gettext/cldr<wbr>-plurals contains probably-redundant RPATH /usr/=
lib/../lib</div><div>gettext: /work/corei7-64-poky-linux/get<wbr>text/0.19.=
8.1-r0/packages-spli<wbr>t/gettext/usr/bin/recode-sr-la<wbr>tin contains pr=
obably-redundant RPATH /usr/lib/../lib [useless-rpaths]</div></div><span cl=
ass=3D"m_1016999681615440584m_830801128156425176m_5579754552523759691HOEnZb=
"><font color=3D"#888888"><div><br></div><div>Ross</div></font></span></div=
><div class=3D"m_1016999681615440584m_830801128156425176m_55797545525237596=
91HOEnZb"><div class=3D"m_1016999681615440584m_830801128156425176m_55797545=
52523759691h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 22 January 2018 at 10:52, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">* add --with-*-prefix va=
riables to prevent configure trying to search in host paths<br>
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
<span class=3D"m_1016999681615440584m_830801128156425176m_55797545525237596=
91m_2205246036956529460HOEnZb"><font color=3D"#888888">--<br>
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
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--f403045ec41e42a82905637af29f--
