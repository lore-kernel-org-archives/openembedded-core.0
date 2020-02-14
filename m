Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 466C660C1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:46:46 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id y184so2818304vkc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 09:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RZzPw3GGR3qqP4vl62R6njh6Sp9ox7gVJ7U3cl+CFlk=;
	b=AiCm7DNjeqEsCyc5z/mZNJr/JkAMgUHQSe6rMJmBMRhL2RI1ZMbCShn/nDXXKSlBTf
	paCjZLgaoxiNZYxqx30whpOp3cL/mp8XEvIHAGcdvGCJ0sXafGhvEbRNBz8wAF3uHanJ
	MH0HR2udrNynBrrFrmaqYl4VMugBtcfe8PZvHWBTC38Vi4JVkPJSLI993dKnifJMoXQe
	hMb039IUk2R9q/vTZZQf1OQEKVLcbqiZPkMWRnBUDqc6tg6wrzIw5VBspTH76N2tVivM
	8Jh0B9Jn02CJcwnfDnGo1WPu+00sS1uGyu07GEtvHdPsZIg1mBUfDBp634VHv+pI5Jk+
	/5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RZzPw3GGR3qqP4vl62R6njh6Sp9ox7gVJ7U3cl+CFlk=;
	b=N44kwHjlCp/SDFQ6vqv/jsqqSXTn0ltRaDD90JoGkPll4kzJoNnJ6J0qFfSIj2+RAL
	QE1BoAuKqWHMIUWn1RBaGlC4l91vpEaOwcnT7/jN9C3F/tByBuMKsSJ+ZgbOIB7ith0l
	AjKAhT0/7Kc3YUOMecMKaPOQbSD1nY21zmTL8aP/mu+/YsrpMgtjtqAbsdHNV4mcmMDe
	RYmotG07tUGBtmZaaPVSPCexP8ISmXz5lGRAE99Ch3RPxKUcQacPOqQj7azEadNfkOj1
	l/VLSrRFPHuadN8yq/Y/9VY38yqDmLL3Hh6Z33es+u5fLCocirEYi/2Epj7o/KyDle2p
	LhZg==
X-Gm-Message-State: APjAAAXc2g7K26lwR4ipqII6zLWut+RTURyxk+3s5vFaISqtJRpArPZM
	k5EAL5bCQ/v6l3TJs0jfy20PQQW5f6lRjnUVH/DEOfMO
X-Google-Smtp-Source: APXvYqym5o8Sm6rdqDuZ60aRVXM06HNmiHyje84cPrYpC+ViP/cJzS/xf6RuvxfwDtlYJwAN8ZUsuSc+8DciQvjrf6E=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr2246502vkq.49.1581702406967; 
	Fri, 14 Feb 2020 09:46:46 -0800 (PST)
MIME-Version: 1.0
References: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723869-21232-4-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1581723869-21232-4-git-send-email-wangmy@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Feb 2020 18:46:35 +0100
Message-ID: <CANNYZj_xy7G5ejCfOXYwJpE_=AvwWjnEvOjfdkKADx6troHbrg@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pycairo: upgrade 1.18.2 -> 1.19.0
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
X-List-Received-Date: Fri, 14 Feb 2020 17:46:46 -0000
Content-Type: multipart/alternative; boundary="0000000000001b93bc059e8cca99"

--0000000000001b93bc059e8cca99
Content-Type: text/plain; charset="UTF-8"

Thanks Wang, the recipe upgrade work is very appreciated, particularly
because it doesn't fit very well into commercial product development and
its typical incentives.

Do you want to be the official maintainer for any of the oe-core recipes?
In the sense that you would be listed for them in
meta/conf/distro/include/maintainers.inc

The benefits are - you can place the 'official' bit into your CV; you will
also get monthly upgrade patches by email from AUH, so you don't have to
create them yourself.

Alex


On Fri, 14 Feb 2020 at 17:12, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> -License-Update: "PDX-License-Identifier: LGPL-2.1-only OR MPL-1.1"
> is added
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...{python3-pycairo_1.18.2.bb => python3-pycairo_1.19.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pycairo_1.18.2.bb =>
> python3-pycairo_1.19.0.bb} (77%)
>
> diff --git a/meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
> b/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
> similarity index 77%
> rename from meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
> rename to meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
> index 3aedf3d142..8f60834c17 100644
> --- a/meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
> +++ b/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://cairographics.org/pycairo"
>  BUGTRACKER = "http://bugs.freedesktop.org"
>  SECTION = "python-devel"
>  LICENSE = "LGPLv2.1 & MPLv1.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f3713ca2c28d9312ad718520b6dc3eee \
>
>  file://COPYING-LGPL-2.1;md5=fad9b3332be894bab9bc501572864b29 \
>
>  file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
>
> @@ -13,8 +13,8 @@ DEPENDS = "cairo python3"
>  SRC_URI = "
> https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz
> "
>  UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
>
> -SRC_URI[md5sum] = "be2ba51f234270dec340f28f1695a95e"
> -SRC_URI[sha256sum] =
> "dcb853fd020729516e8828ad364084e752327d4cff8505d20b13504b32b16531"
> +SRC_URI[md5sum] = "38b84416021640b01250c8f8ec4c52d4"
> +SRC_URI[sha256sum] =
> "4f5ba9374a46c98729dd3727d993f5e17ed0286fd6738ed464fe4efa0612d19c"
>
>  S = "${WORKDIR}/pycairo-${PV}"
>
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001b93bc059e8cca99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Wang, the recipe upgrade work is very apprecia=
ted, particularly because it doesn&#39;t fit very well into commercial prod=
uct development and its typical incentives.</div><div><br></div><div>Do you=
 want to be the official maintainer for any of the oe-core recipes? In the =
sense that you would be listed for them in meta/conf/distro/include/maintai=
ners.inc</div><div><br></div><div>The benefits are - you can place the &#39=
;official&#39; bit into your CV; you will also get monthly upgrade patches =
by email from AUH, so you don&#39;t have to create them yourself.=C2=A0<br>=
</div><div><br></div><div>Alex<br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 14 Feb 2020 =
at 17:12, Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangmy@c=
n.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">-License-Update: &quot;PDX-License-Identifier: LGPL-2.1-only O=
R MPL-1.1&quot;<br>
is added<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" tar=
get=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://python3-pycairo_1.18.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-pycairo_1.18.2.bb</a> =3D&gt; <a href=3D"http://py=
thon3-pycairo_1.19.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycai=
ro_1.19.0.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-pycair=
o_1.18.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.18.2.bb=
</a> =3D&gt; <a href=3D"http://python3-pycairo_1.19.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-pycairo_1.19.0.bb</a>} (77%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pycairo=
_1.18.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.18.2.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.19.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.19.0.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_=
1.18.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.18.2.bb</=
a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.=
19.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.19.0.bb</a>=
<br>
index 3aedf3d142..8f60834c17 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.18.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.18.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.19.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.19.0.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://cairographics.org/pyca=
iro" rel=3D"noreferrer" target=3D"_blank">http://cairographics.org/pycairo<=
/a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"http://bugs.freedesktop.org" rel=3D"n=
oreferrer" target=3D"_blank">http://bugs.freedesktop.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;python-devel&quot;<br>
=C2=A0LICENSE =3D &quot;LGPLv2.1 &amp; MPLv1.1&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df2e071ab72978431b294a0d696=
327421 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df3713ca2c28d9312ad718520b6=
dc3eee \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING-LGPL-2.1;md5=3Dfad9b3332be894bab9bc501572864b29 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING-MPL-1.1;md5=3Dbfe1f75d606912a4111c90743d6c7325&quot;<br>
<br>
@@ -13,8 +13,8 @@ DEPENDS =3D &quot;cairo python3&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/pygobject/pycairo/rel=
eases/download/v$%7BPV%7D/pycairo-$%7BPV%7D.tar.gz" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/pygobject/pycairo/releases/download/v${PV}=
/pycairo-${PV}.tar.gz</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/pygobject/=
pycairo/releases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
pygobject/pycairo/releases/</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;be2ba51f234270dec340f28f1695a95e&quot;<br>
-SRC_URI[sha256sum] =3D &quot;dcb853fd020729516e8828ad364084e752327d4cff850=
5d20b13504b32b16531&quot;<br>
+SRC_URI[md5sum] =3D &quot;38b84416021640b01250c8f8ec4c52d4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4f5ba9374a46c98729dd3727d993f5e17ed0286fd6738=
ed464fe4efa0612d19c&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/pycairo-${PV}&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000001b93bc059e8cca99--
