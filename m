Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id E81F26FFAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:47:30 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id vt7so81950640obb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 04:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2JYkHU+IPWR+4tRPp4ffdEmu2O4Nr1kqgdwEZY/VAfo=;
	b=HM1tTv+1vXdiPl7xxDoDcrJdfQ1DjU9Z4UMtNV1VXy7HpcXdblxRwyiG4j8zdPhNie
	RuMMdkDgNyLkVAOOO3qIpYnRXbr3jRbGkuG4zyybrba33q7VYTNxnXreGd8RMoQLlzpQ
	NhKOW+cZTcUjL3Tmkvtt+m5MZ+smDHd1C/cmTG1+V0oA7tPI4DFGX78tyqdsW/N2cdxJ
	/9EBck5SqBtee/wrBuIuvhP9fdoRGbRAr5HK0LCg2M/AVZTKy4KI2lEf/vnN6q0rp8cK
	Cfe5t3amw9jffLzhNCReZltHG2qbiG11Z0+L3eKSgkuEIue1FbpV6r6Z41r1jYG7p91C
	mdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2JYkHU+IPWR+4tRPp4ffdEmu2O4Nr1kqgdwEZY/VAfo=;
	b=FD+SmLFbWfAQrJvPAKn/RnxvqUFJrYFG0mIidj/HKQkrnweVAnhDkZGWKOKn0OgcF0
	aY7Lh0EuzZshoVG0uqx+YM9LL1AzVvYgOGTS6Gl1oBtqpz+Nz59GVqWx16xJ/eKqFxN/
	+cOanRXb0gQexBaxZeunQwLvpzWKhUukXfWF/M7D4s6kx1gvsPpRlq56RXEb1hAIBhmZ
	nLyq7VarClyEOXu3ba5nC7s8+df6U8C2Bsl1stbqy8iAPtMwPYz8sv/qRU2T0xHodd16
	W48k/RAlfYsCgtwAVRZliZuUQHVtrsWPmftPA124BGlAOflpKXbwwaw8P37H1Xt3d338
	ZZEw==
X-Gm-Message-State: ALoCoQmjbHpEuD4sH6TZDDLG1MESyeq1iyD/AyGvsY5a36rY8aiDIKVvUlHOWdCfvSBQNuCRuXqdpubDKkvuC7d8iQeFykyL/d4SB4XNHoFik5oVEp8Ag2o=
X-Received: by 10.182.200.162 with SMTP id jt2mr3124350obc.55.1452775650752;
	Thu, 14 Jan 2016 04:47:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.51.67 with HTTP; Thu, 14 Jan 2016 04:47:01 -0800 (PST)
In-Reply-To: <CAD3vsf4W4vEZYa=Ge_yF3SNBSppALXVYuu5U-7wqHx5cPRaPDw@mail.gmail.com>
References: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAD3vsf4W4vEZYa=Ge_yF3SNBSppALXVYuu5U-7wqHx5cPRaPDw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 14 Jan 2016 14:47:01 +0200
Message-ID: <CAHiDW_EzmRMSPpxJ46kVC0qi9=hYUPK68M4k0ZfD2NbXycc6EA@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cantarell-fonts: Add recipe
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
X-List-Received-Date: Thu, 14 Jan 2016 12:47:31 -0000
Content-Type: multipart/alternative; boundary=001a11c239309a129705294ab0f1

--001a11c239309a129705294ab0f1
Content-Type: text/plain; charset=UTF-8

On 13 January 2016 at 19:36, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Ping.
>
> Without cantarell fonts, the pango test case  test-layout.test fails.
> Previous result of pango ptest is at
>
> https://wiki.yoctoproject.org/wiki/Ptest_5e3e2e0cbb0a49986f4653e64c4c8d2b5461645e
>
>
Normally I'm all for more test coverage but I'll point out that this is a
18M source repo for a single test... Sure, the download and target sizes
are a fraction of that but they still count.

Jussi



> Regards,
> Jagadeesh
>
> On Sat, Jan 9, 2016 at 8:02 PM, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
>
>> 1. The Cantarell font typeface is designed as a
>>    contemporary Humanist sans serif, and was developed for
>>    on-screen reading; in particular, reading web pages on an
>>    HTC Dream mobile phone.
>>
>> 2. Pango test case (test-layout.test) requires cantarell-font
>>    typeface. This test case uses 'Cantarell 11' font type
>>
>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> ---
>>  .../cantarell-fonts/cantarell-fonts_git.bb         | 25
>> ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 meta/recipes-graphics/cantarell-fonts/
>> cantarell-fonts_git.bb
>>
>> diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
>> b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
>> new file mode 100644
>> index 0000000..f55fef1
>> --- /dev/null
>> +++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "Cantarell, a Humanist sans-serif font family"
>> +
>> +DESCRIPTION = "The Cantarell font typeface is designed as a \
>> +               contemporary Humanist sans serif, and was developed for \
>> +               on-screen reading; in particular, reading web pages on an
>> \
>> +               HTC Dream mobile phone."
>> +
>> +HOMEPAGE = "https://git.gnome.org/browse/cantarell-fonts/"
>> +SECTION = "fonts"
>> +LICENSE = "OFL-1.1"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
>> +
>> +PV = "0.0.18.1+git${SRCPV}"
>> +PR = "r0"
>> +
>> +SRCREV = "3e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4"
>> +SRC_URI = "git://
>> git.gnome.org/cantarell-fonts;protocol=git;branch=master"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools allarch fontcache
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[fontforge] =
>> "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
>> +FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
>> --
>> 1.9.1
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11c239309a129705294ab0f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 January 2016 at 19:36, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjan=
appa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr">Ping.<div><br></div><div>Without cantarell fonts, the pango t=
est case=C2=A0<span style=3D"font-size:17.6000003814697px">=C2=A0</span><sp=
an style=3D"font-size:12.8000001907349px">test-layout.test fails.</span></d=
iv><div>Previous result of pango ptest is at</div><div><a href=3D"https://w=
iki.yoctoproject.org/wiki/Ptest_5e3e2e0cbb0a49986f4653e64c4c8d2b5461645e" t=
arget=3D"_blank">https://wiki.yoctoproject.org/wiki/Ptest_5e3e2e0cbb0a49986=
f4653e64c4c8d2b5461645e</a><br></div><div><br></div></div></blockquote><div=
><br></div><div>Normally I&#39;m all for more test coverage but I&#39;ll po=
int out that this is a 18M source repo for a single test... Sure, the downl=
oad and target sizes are a fraction of that but they still count.=C2=A0</di=
v><div><br></div><div>Jussi</div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div></div><div>Regards,</div><div>Ja=
gadeesh</div><div><div class=3D"h5"><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Sat, Jan 9, 2016 at 8:02 PM, Jagadeesh Krishnanjanapp=
a <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" targ=
et=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-l=
eft:1ex">1. The Cantarell font typeface is designed as a<br>
=C2=A0 =C2=A0contemporary Humanist sans serif, and was developed for<br>
=C2=A0 =C2=A0on-screen reading; in particular, reading web pages on an<br>
=C2=A0 =C2=A0HTC Dream mobile phone.<br>
<br>
2. Pango test case (test-layout.test) requires cantarell-font<br>
=C2=A0 =C2=A0typeface. This test case uses &#39;Cantarell 11&#39; font type=
<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../cantarell-fonts/<a href=3D"http://cantarell-fonts_git.bb" rel=3D"=
noreferrer" target=3D"_blank">cantarell-fonts_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 25 ++++++++++++++++++++++<br>
=C2=A01 file changed, 25 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/cantarell-fonts/<a href=3D"h=
ttp://cantarell-fonts_git.bb" rel=3D"noreferrer" target=3D"_blank">cantarel=
l-fonts_git.bb</a><br>
<br>
diff --git a/meta/recipes-graphics/cantarell-fonts/<a href=3D"http://cantar=
ell-fonts_git.bb" rel=3D"noreferrer" target=3D"_blank">cantarell-fonts_git.=
bb</a> b/meta/recipes-graphics/cantarell-fonts/<a href=3D"http://cantarell-=
fonts_git.bb" rel=3D"noreferrer" target=3D"_blank">cantarell-fonts_git.bb</=
a><br>
new file mode 100644<br>
index 0000000..f55fef1<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/cantarell-fonts/<a href=3D"http://cantarell-fon=
ts_git.bb" rel=3D"noreferrer" target=3D"_blank">cantarell-fonts_git.bb</a><=
br>
@@ -0,0 +1,25 @@<br>
+SUMMARY =3D &quot;Cantarell, a Humanist sans-serif font family&quot;<br>
+<br>
+DESCRIPTION =3D &quot;The Cantarell font typeface is designed as a \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0contemporary Humani=
st sans serif, and was developed for \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on-screen reading; =
in particular, reading web pages on an \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HTC Dream mobile ph=
one.&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"https://git.gnome.org/browse/cantarell-fonts=
/" rel=3D"noreferrer" target=3D"_blank">https://git.gnome.org/browse/cantar=
ell-fonts/</a>&quot;<br>
+SECTION =3D &quot;fonts&quot;<br>
+LICENSE =3D &quot;OFL-1.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Ddf91e3ffcab8cfb972a66bf112=
55188d&quot;<br>
+<br>
+PV =3D &quot;0.0.18.1+git${SRCPV}&quot;<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRCREV =3D &quot;3e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.gnome.org/cantarell-fonts;pr=
otocol=3Dgit;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.gnom=
e.org/cantarell-fonts;protocol=3Dgit;branch=3Dmaster</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools allarch fontcache<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[fontforge] =3D &quot;--enable-source-rebuild=3Dyes,--enable-=
source-rebuild=3Dno,fontforge-native&quot;<br>
+FILES_${PN} =3D &quot;${datadir}/fonts ${datadir}/fontconfig&quot;<br>
<span><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div></div></div></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div></div>

--001a11c239309a129705294ab0f1--
