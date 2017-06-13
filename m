Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCE0782E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 19:37:13 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id w1so185939557qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uh7sjWonpQr5Z0I0orfENOb6ozeMwCUSSHyeco56V4M=;
	b=AOV+4dWMHwy8WD0hqZCGVzegmkE5CSHd9wuuyh+dua2+LN6gIE/8jVOBZD96HW8VHJ
	Gmz07OxwM54R9B30miH73/KTTJvMbUX8t6WNJy3oZQ6bhkdKkTVTin2GOUXNweM0hW5q
	M/kPA6xalK7nV6KOw7PzOF9R+e8//tKglqZQK2K5VTGXRWyqINfuw59xWzJtuJ/ojRCg
	7RM7/MZ6lkHy9N6fHb+tmteCmrLaRBcVoP0CkYuy02HwyuyJ4qMUj3hXQzAngwlUQaOV
	tZrLy7vqBg/Tc4j+h3vT2PIsZJkh3SY0R4s6nQKYgZyH5UvT5ITA11TtU/OTZoTHug+v
	TN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uh7sjWonpQr5Z0I0orfENOb6ozeMwCUSSHyeco56V4M=;
	b=qh+NQHIIO189fBcisYqFN5lw65uuWNeRzyHQXHC4UoRaZ4wWoal7c3iS0d0R87PoD+
	uK78VH/Xzy1YwTQZQCnXOFkpXIrueGlTUnXm8oRP1fHMl9h0p1Fluy0hFf/vF+3/B7lU
	2MtpNc99WgrE4FTVK823RYEEn8X4pCCT6QFsdpwn+3vFUvkISXlx4XjNyiCk3TY7/K6h
	OTJeMf+JzGcoicf1hCdpsX3stiuveVRTB1wfPT5gFtUCF/FHhYwzTYULzfH+UEMK86Qk
	8fT+0LBIjwxzukcghfUFSQvrRImHToqdjrAvox8Iycqvf+QGJKC4vsJ6u5vdxPaJqvMw
	BH9w==
X-Gm-Message-State: AKS2vOyRm9gRV2Acu+fNotI87s4rPHbaoSZeYSF0koheGMC9FNgteytX
	0O/teEfqjHHb+D3UviedW9cJ3RcfAQ5r
X-Received: by 10.55.140.193 with SMTP id o184mr1867143qkd.127.1497382634137; 
	Tue, 13 Jun 2017 12:37:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 13 Jun 2017 12:36:53 -0700 (PDT)
In-Reply-To: <20170609074346.23974-1-ismo.puustinen@intel.com>
References: <20170609074346.23974-1-ismo.puustinen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jun 2017 20:36:53 +0100
Message-ID: <CAJTo0LaFN78k690wh=tLVDzQ54NFmcwitaKczFU=ZoCwsre+1Q@mail.gmail.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] python3: make readline and gdbm support conditional.
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
X-List-Received-Date: Tue, 13 Jun 2017 19:37:13 -0000
Content-Type: multipart/alternative; boundary="001a114f0ce8004c500551dc9011"

--001a114f0ce8004c500551dc9011
Content-Type: text/plain; charset="UTF-8"

On 9 June 2017 at 08:43, Ismo Puustinen <ismo.puustinen@intel.com> wrote:

> +# If readline is not there, don't create python3-readline package and
> +# also do not depend on it. Same goes for gdbm.
> +PACKAGES_remove = " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'readline', '',
> '${PN}-readline', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '${PN}-gdbm', d)} \
> +"
> +PROVIDES_remove = " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'readline', '',
> '${PN}-readline', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '${PN}-gdbm', d)} \
> +"
> +RDEPENDS_${PN}-modules_remove = " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'readline', '',
> '${PN}-readline', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '${PN}-gdbm', d)} \
> +"
>

Just looked at what happens to the packaging without these lines.

If gdbm isn't present then the gdbm package isn't generated at all, which
is as expected.  python3-readline just contains the rlcompleter package
which is basically an implementation detail and could arguably be deleted
in a do_install_append that checks the PACKAGECONFIG.

The provides/depends will be needed still though, unless we teach the
manifest generator that some packages depend on PACKAGECONFIG flags.

Ross

--001a114f0ce8004c500551dc9011
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2017 at 08:43, Ismo Puustinen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ismo.puustinen@intel.com" target=3D"_blank">ismo.puustinen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":30t" cla=
ss=3D"a3s aXjCH m15c8bd0877d3e66c">+# If readline is not there, don&#39;t c=
reate <span class=3D"il">python3</span>-readline package and<br>
+# also do not depend on it. Same goes for gdbm.<br>
+PACKAGES_remove =3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;read=
line&#39;, &#39;&#39;, &#39;${PN}-readline&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;gdbm=
&#39;, &#39;&#39;, &#39;${PN}-gdbm&#39;, d)} \<br>
+&quot;<br>
+PROVIDES_remove =3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;read=
line&#39;, &#39;&#39;, &#39;${PN}-readline&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;gdbm=
&#39;, &#39;&#39;, &#39;${PN}-gdbm&#39;, d)} \<br>
+&quot;<br>
+RDEPENDS_${PN}-modules_remove =3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;read=
line&#39;, &#39;&#39;, &#39;${PN}-readline&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;gdbm=
&#39;, &#39;&#39;, &#39;${PN}-gdbm&#39;, d)} \<br>
+&quot;</div></blockquote></div><br>Just looked at what happens to the pack=
aging without these lines.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">If gdbm isn&#39;t present then the gdbm package isn&#3=
9;t generated at all, which is as expected. =C2=A0python3-readline just con=
tains the rlcompleter package which is basically an implementation detail a=
nd could arguably be deleted in a do_install_append that checks the PACKAGE=
CONFIG.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">The provides/depends will be needed still though, unless we teach the man=
ifest generator that some packages depend on PACKAGECONFIG flags.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a114f0ce8004c500551dc9011--
