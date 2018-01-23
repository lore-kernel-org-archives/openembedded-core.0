Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71FDA7878B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 22:29:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b21so4908324wme.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=98dwSLfM8iChQj2IxKLOINQkgCLtxfRsOaBCbOI6NB4=;
	b=dmNqQMQGKMpLinubNH1YidXZHf5MOu/QzPGF9rYl8x+5AuG1NJ9xvFFBl4APvfpfVU
	W2u4DeJnDKDMU/11LfAs6sPsJOYaQP/GD0Mx90S5C62D8PutpVZx3jcDdE1GqhRjnyNT
	VhIVFE1JO8GAW/qDg0YYNNPxrMYTHAKyNNhc7tdCkchZ/nrqK2UF3o6pSVhoWrvEtoQO
	vqma+oVyFZ5onf10aCbhaPyJ7JMFSTag3olHXdfaQTf0cErpRLLbfdtTLGk1Y4Bbuwqn
	oBfzx18ZdKhIUDyqypTTW4EjFMDPO4sTfUqwFfTQ1nVBoO7oBgPKyvjExOcVOzkAVUSm
	XePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=98dwSLfM8iChQj2IxKLOINQkgCLtxfRsOaBCbOI6NB4=;
	b=DjHKWiPmFl5PaBLshb2PW+Ucil2WqHIXG6Q8tALXolMas3FKzYAvr3rqN8xPBapi4+
	Cn5zM21lfojusU8oeawv9FHJeU8r5u83z+4ACqsg/CJviu4tI+LPl0negUFdTFF4RTCC
	iPmDc1KHcDLi3pbM1YvGxX3+AKh7q2qu101l6jfQrxIvmR/QQDE3DIrEfjMtRmXpwlmd
	srzizCtAgWadGNeOPjeLTrwmwbvS5H1/c/Rn8f/eFHFeV6k5+HNxN6iwy1d2x7G50eYl
	JQ7X2RjwVSPaBeJdJ+fkO5StgGk0tYGO9fqfItCRN7Mvh6gUed7aRyxuysr0wMKNjaLj
	Uc7g==
X-Gm-Message-State: AKwxytfXFf9kZbkGjeN/MhX2uWn++Jj/W94OES3UFWS05r+Ml7fWXKis
	C7di2kfW/APf7/gtq74rbYWJL6PNyQyri+y/yJc=
X-Google-Smtp-Source: AH8x226IJq/9lJ8gNx5IC1q0pKB2QRkvz8IORYaKhw075LuA3T/fU27zvfj33/BNmUu105/jHxfhylMoeaalrOdjSRs=
X-Received: by 10.28.13.18 with SMTP id 18mr2827537wmn.112.1516746550109; Tue,
	23 Jan 2018 14:29:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 23 Jan 2018 14:29:09 -0800 (PST)
In-Reply-To: <CAJTo0La0ew7AZt5pCM5Qgyud=cUFgHsya_6h=63rp3bqsHiMnw@mail.gmail.com>
References: <CA+chaQfVFtq0jLTjr5K1stUyA=BgbSk_cCZ3vi7RJa77FxzJ8g@mail.gmail.com>
	<20180122105205.434-1-Martin.Jansa@gmail.com>
	<CAJTo0LZ09e3Z6k82FLJsER26j5eVnF9uug65JGheA=e6DKuM-w@mail.gmail.com>
	<CAJTo0La0ew7AZt5pCM5Qgyud=cUFgHsya_6h=63rp3bqsHiMnw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 Jan 2018 23:29:09 +0100
Message-ID: <CA+chaQeBaSJ+RfoLoaC7ajnFo1UPA_0XhXVinCODf0o1movBPA@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 Jan 2018 22:29:10 -0000
Content-Type: multipart/alternative; boundary="001a11443614556adc0563791311"

--001a11443614556adc0563791311
Content-Type: text/plain; charset="UTF-8"

The
--without-included-libunistring=
change there

-PACKAGECONFIG[libunistring] = "--without-included-
libunistring,--with-included-libunistring,libunistring"
+PACKAGECONFIG[libunistring] = "--without-included-
libunistring=${STAGING_LIBDIR}/..,--with-included-libunistring,libunistring"

looks really strange and indeed it fails:

| configure: error: invalid package name: included-libunistring=/OE/
BUILD/work/qemux86-oe-linux/gettext/0.19.8.1-r0/recipe-sysroot/usr/lib/..

After removing this part and keeping only the added .patch I got the same
error as before:
ERROR: gettext-0.19.8.1-r0 do_configure: This autoconf log indicates
errors, it looked at host include and/or library paths while determining
system capabilities.
Rerun configure task after fixing this.

0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning: include location
"/usr/include/glib-2.0" is unsafe for cross-compilation
[-Wpoison-system-directories]



On Tue, Jan 23, 2018 at 1:58 AM, Burton, Ross <ross.burton@intel.com> wrote:

> Hi Martin,
>
> I've a patch at the top of poky-contrib:ross/mut which hopefully fixes
> this.  It's a bit more invasive than I'd like but this is gettext and I'm
> still at least partially sane, so that's a win as far as I'm concerned.
>
> I've a build running now but touching gettext causes a rebuild of the
> world so I'm going to bed whist it runs.  Would you be able to test it in
> your environment too?
>
> Cheers,
> Ross
>
> On 22 January 2018 at 19:46, Burton, Ross <ross.burton@intel.com> wrote:
>
>> This is causing QA errors:
>>
>> ERROR: gettext-0.19.8.1-r0 do_package_qa: QA Issue: gettext:
>> /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-spli
>> t/gettext/usr/lib/gettext/hostname contains probably-redundant RPATH
>> /usr/lib/../lib
>> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-spli
>> t/gettext/usr/lib/gettext/urlget contains probably-redundant RPATH
>> /usr/lib/../lib
>> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-spli
>> t/gettext/usr/lib/gettext/cldr-plurals contains probably-redundant RPATH
>> /usr/lib/../lib
>> gettext: /work/corei7-64-poky-linux/gettext/0.19.8.1-r0/packages-spli
>> t/gettext/usr/bin/recode-sr-latin contains probably-redundant RPATH
>> /usr/lib/../lib [useless-rpaths]
>>
>> Ross
>>
>> On 22 January 2018 at 10:52, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> * add --with-*-prefix variables to prevent configure trying to search in
>>> host paths
>>> * fixes:
>>>   ERROR: This autoconf log indicates errors, it looked at host include
>>> and/or library paths while determining system capabilities.
>>>   gettext/0.19.8.1-r0/build/gettext-tools/config.log:cc1: warning:
>>> include location /usr/include/glib-2.0 is unsafe for cross-compilation
>>> [-Wpoison-system-directories]
>>>
>>> * not sure if it's worth adding other prefixes for curses related
>>> PACKAGECONFIG
>>>   PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${ST
>>> AGING_LIBDIR}/..,--disable-curses,ncurses,"
>>>
>>>   --with-libncurses-prefix[=DIR]  search for PACKLIBS in DIR/include
>>> and DIR/lib
>>>   --without-libncurses-prefix     don't search for PACKLIBS in
>>> includedir and libdir
>>>   --with-libxcurses-prefix[=DIR]  search for PACKLIBS in DIR/include
>>> and DIR/lib
>>>   --without-libxcurses-prefix     don't search for PACKLIBS in
>>> includedir and libdir
>>>   --with-libcurses-prefix[=DIR]  search for PACKLIBS in DIR/include and
>>> DIR/lib
>>>   --without-libcurses-prefix     don't search for PACKLIBS in includedir
>>> and libdir
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>>> b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>>> index 97083c0da2..8a8a34cca8 100644
>>> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>>> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>>> @@ -43,10 +43,10 @@ PACKAGECONFIG ??= "croco glib libxml libunistring"
>>>  PACKAGECONFIG_class-native = ""
>>>  PACKAGECONFIG_class-nativesdk = ""
>>>
>>> -PACKAGECONFIG[croco] = "--without-included-libcroco,-
>>> -with-included-libcroco,libcroco"
>>> -PACKAGECONFIG[glib] = "--without-included-glib,--wit
>>> h-included-glib,glib-2.0"
>>> -PACKAGECONFIG[libxml] = "--without-included-libxml,--w
>>> ith-included-libxml,libxml2"
>>> -PACKAGECONFIG[libunistring] = "--without-included-libunistri
>>> ng,--with-included-libunistring,libunistring"
>>> +PACKAGECONFIG[croco] = "--with-libcroco-0.6-prefix=${STAGING_LIBDIR}/..
>>> --without-included-libcroco,--with-included-libcroco,libcroco"
>>> +PACKAGECONFIG[glib] = "--with-libglib-2.0-prefix=${STAGING_LIBDIR}/..
>>> --without-included-glib,--with-included-glib,glib-2.0"
>>> +PACKAGECONFIG[libxml] = "--with-libxml2-prefix=${STAGING_LIBDIR}/..
>>> --without-included-libxml,--with-included-libxml,libxml2"
>>> +PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_LIBDIR}/..
>>> --without-included-libunistring,--with-included-libunistring
>>> ,libunistring"
>>>  PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${ST
>>> AGING_LIBDIR}/..,--disable-curses,ncurses,"
>>>
>>>  acpaths = '-I ${S}/gettext-runtime/m4 \
>>> --
>>> 2.15.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>

--001a11443614556adc0563791311
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The=C2=A0</div><div>--without-included-<wbr>libunistr=
ing=3D</div><div>change there</div><div><div><br></div><div>-PACKAGECONFIG[=
libunistring] =3D &quot;--without-included-<wbr>libunistring,--with-include=
d-<wbr>libunistring,libunistring&quot;</div><div>+PACKAGECONFIG[libunistrin=
g] =3D &quot;--without-included-<wbr>libunistring=3D${STAGING_LIBDIR}<wbr>/=
..,--with-included-<wbr>libunistring,libunistring&quot;</div></div><div><br=
></div><div>looks really strange and indeed it fails:<br></div><div><br></d=
iv><div>| configure: error: invalid package name: included-libunistring=3D/=
OE/<wbr>BUILD/work/qemux86-oe-linux/<wbr>gettext/0.19.8.1-r0/recipe-<wbr>sy=
sroot/usr/lib/..</div><div><br></div><div>After removing this part and keep=
ing only the added .patch I got the same error as before:</div><div><div>ER=
ROR: gettext-0.19.8.1-r0 do_configure: This autoconf log indicates errors, =
it looked at host include and/or library paths while determining system cap=
abilities.</div><div>Rerun configure task after fixing this.</div></div><di=
v><br></div><div><div>0.19.8.1-r0/build/gettext-tools/config.log:cc1: warni=
ng: include location &quot;/usr/include/glib-2.0&quot; is unsafe for cross-=
compilation [-Wpoison-system-directories]</div></div><div><br></div><div><b=
r></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Tue, Jan 23, 2018 at 1:58 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Mar=
tin,<div><br></div><div>I&#39;ve a patch at the top of poky-contrib:ross/mu=
t which hopefully fixes this.=C2=A0 It&#39;s a bit more invasive than I&#39=
;d like but this is gettext and I&#39;m still at least partially sane, so t=
hat&#39;s a win as far as I&#39;m concerned.<div><br></div><div>I&#39;ve a =
build running now but touching gettext causes a rebuild of the world so I&#=
39;m going to bed whist it runs.=C2=A0 Would you be able to test it in your=
 environment too?</div><div><br></div><div>Cheers,</div><div>Ross</div></di=
v></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On 22 January 2018 at 19:46, Burton, Ross <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bla=
nk">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">This is causing QA errors:<div><br></div><div><div>=
ERROR: gettext-0.19.8.1-r0 do_package_qa: QA Issue: gettext: /work/corei7-6=
4-poky-linux/get<wbr>text/0.19.8.1-r0/packages-spli<wbr>t/gettext/usr/lib/g=
ettext/host<wbr>name contains probably-redundant RPATH /usr/lib/../lib</div=
><div>gettext: /work/corei7-64-poky-linux/get<wbr>text/0.19.8.1-r0/packages=
-spli<wbr>t/gettext/usr/lib/gettext/urlg<wbr>et contains probably-redundant=
 RPATH /usr/lib/../lib</div><div>gettext: /work/corei7-64-poky-linux/get<wb=
r>text/0.19.8.1-r0/packages-spli<wbr>t/gettext/usr/lib/gettext/cldr<wbr>-pl=
urals contains probably-redundant RPATH /usr/lib/../lib</div><div>gettext: =
/work/corei7-64-poky-linux/get<wbr>text/0.19.8.1-r0/packages-spli<wbr>t/get=
text/usr/bin/recode-sr-<wbr>latin contains probably-redundant RPATH /usr/li=
b/../lib [useless-rpaths]</div></div><span class=3D"m_5579754552523759691HO=
EnZb"><font color=3D"#888888"><div><br></div><div>Ross</div></font></span><=
/div><div class=3D"m_5579754552523759691HOEnZb"><div class=3D"m_55797545525=
23759691h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22=
 January 2018 at 10:52, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">* add --with-*-prefix varia=
bles to prevent configure trying to search in host paths<br>
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
<span class=3D"m_5579754552523759691m_2205246036956529460HOEnZb"><font colo=
r=3D"#888888">--<br>
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

--001a11443614556adc0563791311--
