Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
X-Greylist: delayed 623 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 24 Jan 2016 13:27:45 UTC
Received: from mail3.static.mgsend.net (mail3.static.mgsend.net
	[104.130.122.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABC076C9F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:27:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1453642066; h=Content-Type: To: From: Subject: Message-ID:
	Date: References: In-Reply-To: MIME-Version: Sender;
	bh=kh8W/jii7Pdh9hqY1IzhY9PsgMQAstv+pZ4vczAr8EI=;
	b=GCchFQOcRR90Uw506sCEATOJwqkIyXfaXpvjEYee4t1Vt/dMqS5ztJ/fwdvExNABTs7ErZhV
	oyXyHeX6qO11gnN0WMNLoWLcqg0jBiUNFjErqdm3kLwvLLPIZyz6m0dThjcv7ew/73QSvweu
	+WFhngBS5x6O6D0xwOhMG1GOgB4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: Date:
	Message-ID: Subject: From: To: Content-Type;
	b=OQGvAezGULgjVQt29SwO+0yhMxVUr46pYRk1Y/x1DscaalV6SyiCA8Qual3ZdEsBYE+fNO
	Kuek0y7ryYIim/zfCkZs5v9Rg9QPwJbD4R5KmWt3F7SG6DV6tjEACTXvAh4BxCDS8PJSS5l1
	JKueUv92iojzQo0MlKzVrDuAYM1p8=
Sender: derek@asterius.io
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mxa.mailgun.org with ESMTP id 56a4cee2.7f0b590282b0-in2;
	Sun, 24 Jan 2016 13:17:22 -0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 1so128468787ion.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:17:22 -0800 (PST)
X-Gm-Message-State: AG10YOS+AZv5nmA/DkHHk4gBOUXzvAcPGpb4Z9JoViIysU8UyjHqGnw8So7a36TVUPsapSSHU8m6y5HS0KRrkA==
MIME-Version: 1.0
X-Received: by 10.107.6.209 with SMTP id f78mr12745017ioi.63.1453641441914;
	Sun, 24 Jan 2016 05:17:21 -0800 (PST)
Received: by 10.107.3.69 with HTTP; Sun, 24 Jan 2016 05:17:21 -0800 (PST)
In-Reply-To: <1453641184-1655-1-git-send-email-derek@asterius.io>
References: <1453641184-1655-1-git-send-email-derek@asterius.io>
Date: Sun, 24 Jan 2016 08:17:21 -0500
X-Gmail-Original-Message-ID: <CADNbA1qgy8+XeHg-5WzJPA8VJCfFsMzsX+vf6fgLBeQqpX5FPw@mail.gmail.com>
Message-ID: <CADNbA1qgy8+XeHg-5WzJPA8VJCfFsMzsX+vf6fgLBeQqpX5FPw@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: update to 9.10.3-P3
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
X-List-Received-Date: Sun, 24 Jan 2016 13:27:46 -0000
Content-Type: multipart/alternative; boundary=001a113f98a4c6b991052a1445cb

--001a113f98a4c6b991052a1445cb
Content-Type: text/plain; charset=UTF-8

Thanks Ross.  I was a little overzealous using my history without
validating the recipient.  Sorry for the ML noise.

-Derek

On Sun, Jan 24, 2016 at 8:13 AM, Derek Straka <derek@asterius.io> wrote:

> Addresses CVE-2015-8704 and CVE-2015-8705
>
> CVE-2015-8704
> Allows remote authenticated users to cause a denial of service via a
> malformed Address Prefix List record
>
> CVE-2015-8705:
> When debug loggin is enabled, allows remote attackers to cause a denial of
> service or have possibly unspecified impact via OPT data or ECS option
>
> [YOCTO 8966]
>
> References:
> https://kb.isc.org/article/AA-01346/0/BIND-9.10.3-P3-Release-Notes.html
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8704
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8705
> ---
>  .../bind/{bind_9.10.3-P2.bb => bind_9.10.3-P3.bb}                     |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/bind/{bind_9.10.3-P2.bb =>
> bind_9.10.3-P3.bb} (96%)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
> b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
> similarity index 96%
> rename from meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
> rename to meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
> index 875a0c8..da414c0 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
> @@ -23,8 +23,8 @@ SRC_URI = "
> ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>             "
>
> -SRC_URI[md5sum] = "672dd3c2796b12ac8440f55bcaecfa82"
> -SRC_URI[sha256sum] =
> "4a6c1911ac0d4b6be635b63de3429b6c168ea244043f12bbc8a4eb3368fd6ecd"
> +SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
> +SRC_URI[sha256sum] =
> "690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83"
>
>  ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES',
> 'ipv6', 'yes', 'no', d)}"
>  EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random
> --disable-threads \
> --
> 1.9.1
>
>

--001a113f98a4c6b991052a1445cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Thanks Ross.=C2=A0 I was =
a little overzealous using my history without validating the recipient.=C2=
=A0 Sorry for the ML noise.</span><div style=3D"font-size:12.8px"><br></div=
><div style=3D"font-size:12.8px">-Derek=C2=A0</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Sun, Jan 24, 2016 at 8:13 AM, De=
rek Straka <span dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" targe=
t=3D"_blank">derek@asterius.io</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Addresses CVE-2015-8704 and CVE-2015-8705<br>
<br>
CVE-2015-8704<br>
Allows remote authenticated users to cause a denial of service via a malfor=
med Address Prefix List record<br>
<br>
CVE-2015-8705:<br>
When debug loggin is enabled, allows remote attackers to cause a denial of =
service or have possibly unspecified impact via OPT data or ECS option<br>
<br>
[YOCTO 8966]<br>
<br>
References:<br>
<a href=3D"https://kb.isc.org/article/AA-01346/0/BIND-9.10.3-P3-Release-Not=
es.html" rel=3D"noreferrer" target=3D"_blank">https://kb.isc.org/article/AA=
-01346/0/BIND-9.10.3-P3-Release-Notes.html</a><br>
<a href=3D"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2015-8704" =
rel=3D"noreferrer" target=3D"_blank">https://cve.mitre.org/cgi-bin/cvename.=
cgi?name=3DCVE-2015-8704</a><br>
<a href=3D"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2015-8705" =
rel=3D"noreferrer" target=3D"_blank">https://cve.mitre.org/cgi-bin/cvename.=
cgi?name=3DCVE-2015-8705</a><br>
---<br>
=C2=A0.../bind/{<a href=3D"http://bind_9.10.3-P2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">bind_9.10.3-P2.bb</a> =3D&gt; <a href=3D"http://bind_9.10.3-=
P3.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.10.3-P3.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++=
--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-connectivity/bind/{<a href=3D"http://bind_9.10.3-=
P2.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.10.3-P2.bb</a> =3D&gt; <=
a href=3D"http://bind_9.10.3-P3.bb" rel=3D"noreferrer" target=3D"_blank">bi=
nd_9.10.3-P3.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10.3-P=
2.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.10.3-P2.bb</a> b/meta/rec=
ipes-connectivity/bind/<a href=3D"http://bind_9.10.3-P3.bb" rel=3D"noreferr=
er" target=3D"_blank">bind_9.10.3-P3.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10.3-P2=
.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.10.3-P2.bb</a><br>
rename to meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10.3-P3.b=
b" rel=3D"noreferrer" target=3D"_blank">bind_9.10.3-P3.bb</a><br>
index 875a0c8..da414c0 100644<br>
--- a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10.3-P2.bb" r=
el=3D"noreferrer" target=3D"_blank">bind_9.10.3-P2.bb</a><br>
+++ b/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10.3-P3.bb" r=
el=3D"noreferrer" target=3D"_blank">bind_9.10.3-P3.bb</a><br>
@@ -23,8 +23,8 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.isc.org/isc/bind9/=
${PV}/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.i=
sc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-lib-dns-gen.c-fix-too=
-long-error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;672dd3c2796b12ac8440f55bcaecfa82&quot;<br>
-SRC_URI[sha256sum] =3D &quot;4a6c1911ac0d4b6be635b63de3429b6c168ea244043f1=
2bbc8a4eb3368fd6ecd&quot;<br>
+SRC_URI[md5sum] =3D &quot;bcf7e772b616f7259420a3edc5df350a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63=
f55c705ad85d1a4cb83&quot;<br>
<br>
=C2=A0ENABLE_IPV6 =3D &quot;--enable-ipv6=3D${@bb.utils.contains(&#39;DISTR=
O_FEATURES&#39;, &#39;ipv6&#39;, &#39;yes&#39;, &#39;no&#39;, d)}&quot;<br>
=C2=A0EXTRA_OECONF =3D &quot; ${ENABLE_IPV6} --with-randomdev=3D/dev/random=
 --disable-threads \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a113f98a4c6b991052a1445cb--
