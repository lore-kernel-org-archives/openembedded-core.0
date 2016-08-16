Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6189060722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:27:08 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id e63so29548071ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 03:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dzjQHzvizW9QEFPe7oKBwyo/vHrKu5SshlOf+2hMOQ8=;
	b=0sp6fPg8n6RaEyiI7SYeSDXeVlfQ0nzcqVVmOF5mIK+qqDDmjql0Uuy3dONhecJMTG
	JToWBK87gxSI1mcJJj5NUv8zcj99bd6T3M4DULYNc0CIBBxHUOdVthOpXo5EgBbDGzGX
	P8HdySSSFRMsUyWVm+jgQP5PVW8FQf0ajE1U7EnF4UWgOSC5pIg3qdnfIWoIHrWdUd4b
	lfDWqUNDnB8c1vsAfYCPLQDFjfBxC8RYRSpjPhVBMZweqrHn6d0oHyOHO0i3uXX8sgVS
	1KYV6ahWvzaV4xAz+UVM/FM5PY/EEGA1I31FflXa04OM3sIKGYTE/aqEHnAFG5jeEodl
	HHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dzjQHzvizW9QEFPe7oKBwyo/vHrKu5SshlOf+2hMOQ8=;
	b=UQ0uw3Z0grGATO1nFfVsS/7mSeKt58A/8Jec8kiYt9e56BmK/2Jf+p+OUn8fhK+xAd
	dyPQhjQfExXfB+n5EmEnJVTOhJvf4KsGCqEP7nYmDfOOq0Bzc5PM9bDVZxcENF4j0PdK
	S5tQ0OEXig7tH9J7rmAykXaZmdVplOWC57zJAXo+4ULiFc1MnFvu9nCo8LWSlsyqufvs
	PKnoM1G8io2FiMkk4bmrMbCQuuXK916REnL136UCpnjhK9C25bnb18n39nG0mwbCkIeD
	Osjh+JxSNvjoshZrLMJSb5ricBjIqQd5/+NHPl8es9SCQ1l6XCEnkNtSnJOMzPAzZCd3
	bmbA==
X-Gm-Message-State: AEkoousHpY+5vKDpiN9+m2uN2EP2/y4TbpymlaVGXzIPTywdo/+hZpI8EK0xxVU8TWP+4paYlY/fV0R13CSD8we/
X-Received: by 10.36.57.211 with SMTP id l202mr20595222ita.22.1471343228883;
	Tue, 16 Aug 2016 03:27:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 03:26:48 -0700 (PDT)
In-Reply-To: <1471310277-1300-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1471310277-1300-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 11:26:48 +0100
Message-ID: <CAJTo0LbCgGpLwVFSd9NCNDSxp6ZW0=i7EQKAYcnL5VBr-UzLqA@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: 9.10.3-P3 -> 9.11.0b2
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
X-List-Received-Date: Tue, 16 Aug 2016 10:27:08 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca80282c053a2dca9b

--001a114ab3ca80282c053a2dca9b
Content-Type: text/plain; charset=UTF-8

On 16 August 2016 at 02:17, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

>  LICENSE = "ISC & BSD"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0a95f52a0ab6c5f52dedc9a45e7abb
> 3f"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=26895b6b2e11695fb4756065b885d5
> d9"
>

Please say why this changes in the commit message.


> @@ -81,7 +76,6 @@ do_install_append() {
>         install -d "${D}${sysconfdir}/init.d"
>         install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>         install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
> -       sed -i -e '1s,#!.*python,#! /usr/bin/python3,'
> ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkd


Stating why this isn't required anymore would be helpful too.

Ross

--001a114ab3ca80282c053a2dca9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 August 2016 at 02:17, Wang Xin <span dir=3D"ltr">&lt=
;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangx=
in2015.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0LICENSE=
 =3D &quot;ISC &amp; BSD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D<wbr>0a95f52a0ab6c5f52de=
dc9a45e7abb<wbr>3f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D<wbr>26895b6b2e11695fb47=
56065b885d5<wbr>d9&quot;<br></blockquote><div><br></div><div>Please say why=
 this changes in the commit message.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">@@ -81,7 +76,6 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d &quot;${D}${sysconfdir}/init.d&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/conf/* &quot;${D}${sysconfd=
ir}/bind/&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 &quot;${S}/init.d&quot; &quot;${=
D}${sysconfdir}/init.d/<wbr>bind&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s,#!.*python,#! /usr/bin/python=
3,&#39; ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkd</blockq=
uote><div><br></div><div>Stating why this isn&#39;t required anymore would =
be helpful too.</div><div><br></div><div>Ross</div></div></div></div>

--001a114ab3ca80282c053a2dca9b--
