Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88BA0796E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 15:54:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y139-v6so2944990wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H9ufMJP5Z7mHvqT5sVy+vr5RHwOgwrrYznJr8QY/JWQ=;
	b=BdEutHwjkPcgqdSPV2jb5d6yFpF+u6GrnaLZvIK4nlo7Hb5dElMDCc8XlwnPpWs6nP
	IKt2SdTLWiUnzoEHjxAifXcfG9XXhYIVqm67fE6rWXtl4CipCqzWqqXhAGWeBfuT8nhW
	vSLehZBtyHOhNNj05nPdIKcdzIbAblIsu0Ab/RAiJk7Zp8Lxb4PVIqk1zk/vADIShfnR
	lDPhEB2Wdh4mB7Vqwr0hh4iefaPKKEeQsmXDlYijVHbzioo7BxxRnZCTCAs5lEg+LySP
	x6MyGkU1X0QzUP9SqvIOYlTPNorhFYia77tF1gcejSgUduKCeJ74Ls1s66ucfMqmgUJr
	fwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H9ufMJP5Z7mHvqT5sVy+vr5RHwOgwrrYznJr8QY/JWQ=;
	b=Z80fjLRnznSG4H43DBpDozbxaQqGOvB/rVdWECy+RKbVINbPeRkQAHcuM5rmc8y45A
	BrxgBmtNzUjjy8QIwAil+tcKoBTs3Jo8WTEIvDltn5V3UMo4cbX4c7kQGL+mIqgkn1Q+
	qkc6TqRO9bddVmqMC8Td0o4f03bWaEf2kL59ko7acc6PU3M07pqQSIl/wE42poqjfYAI
	+zlPkmG9YnDsjb0yTkk9sDeSkE2Rdz7zRtavWHCUu3iz/PbKGTUPTD6fjVEtkvWdXq+/
	6RTzhmbkCSW018Zd2ACGfcXVB/eFn/Q+IxN8zjYNHZysX/zgDqyiIO8a70AaeLo52u+p
	B76g==
X-Gm-Message-State: APzg51DdNOfRcXGNWvOOoBnajcoOkTMsObuke9btvy5mMdHXzuGNSrLw
	Y0VbjRBwBsBsGaFcfyIY5ydKE3SFUU0ni55k6MA=
X-Google-Smtp-Source: ANB0VdZiAtZAFwIGXmr6FtZPjQDEDSTu5wf/G2aSh9EKduMZaBEgP1/Mj0lyTmzIKeypEHEa1a5SqDKVxYw8CVfNz6c=
X-Received: by 2002:a1c:1eca:: with SMTP id
	e193-v6mr1927690wme.99.1536767663001; 
	Wed, 12 Sep 2018 08:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180912120215.2371-1-sno@netbsd.org>
In-Reply-To: <20180912120215.2371-1-sno@netbsd.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Sep 2018 17:54:11 +0200
Message-ID: <CA+chaQeiPiEKH7adkDTbDL3hP3Vo=2edSHM=eOM4mvh3O0udZA@mail.gmail.com>
To: sno@netbsd.org
Cc: igork@miltenyibiotec.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] coreutils: add alternative target for nice
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
X-List-Received-Date: Wed, 12 Sep 2018 15:54:22 -0000
Content-Type: multipart/alternative; boundary="000000000000a7d40d0575ae9afc"

--000000000000a7d40d0575ae9afc
Content-Type: text/plain; charset="UTF-8"

Still worn't work IMHO because you forgot to add nice.1
to ALTERNATIVE_${PN}-doc.

Also the comment above bindir_progs:
# [ df mktemp base64 gets a special treatment and is not included in this
should probably be updated to include nice and remove nice from bindir_progs

On Wed, Sep 12, 2018 at 2:02 PM Jens Rehsack <sno@netbsd.org> wrote:

> Avoid coreutils conflicts with nice from other recipes, like
> busybox - even if that's not enabled by default.
> In situations, where coreutils is a dependency for -dev images
> and small busybox nice is available always, it avoids extra
> effort for coreutils for those users.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-core/coreutils/coreutils_8.30.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb
> b/meta/recipes-core/coreutils/coreutils_8.30.bb
> index 053891f6ea..5ebd36026e 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.30.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
> @@ -77,7 +77,7 @@ do_install_class-native() {
>  }
>
>  do_install_append() {
> -       for i in df mktemp base64; do mv ${D}${bindir}/$i
> ${D}${bindir}/$i.${BPN}; done
> +       for i in df mktemp nice base64; do mv ${D}${bindir}/$i
> ${D}${bindir}/$i.${BPN}; done
>
>         install -d ${D}${base_bindir}
>         [ "${base_bindir}" != "${bindir}" ] && for i in
> ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN};
> done
> @@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] = "${base_bindir}/df"
>  ALTERNATIVE_TARGET[df] = "${bindir}/df.${BPN}"
>  ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
>
> +ALTERNATIVE_LINK_NAME[nice] = "${base_bindir}/nice"
> +ALTERNATIVE_TARGET[nice] = "${bindir}/nice.${BPN}"
> +ALTERNATIVE_LINK_NAME[nice.1] = "${mandir}/man1/nice.1"
> +
>  ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
>  ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
>
> --
> 2.17.1
>
>

--000000000000a7d40d0575ae9afc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Still worn&#39;t work IM=
HO because you forgot to add nice.1 to=C2=A0ALTERNATIVE_${PN}-doc.</div><di=
v dir=3D"ltr"><br></div><div>Also the comment above bindir_progs:</div><div=
># [ df mktemp base64 gets a special treatment and is not included in this<=
br></div><div>should probably be updated to include nice and remove nice fr=
om bindir_progs</div></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr">On Wed, Sep 12, 2018 at 2:02 PM Jens Rehsack &lt;<a href=3D"mailto:sn=
o@netbsd.org">sno@netbsd.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Avoid coreutils conflicts with nice from other recipes, like<br>
busybox - even if that&#39;s not enabled by default.<br>
In situations, where coreutils is a dependency for -dev images<br>
and small busybox nice is available always, it avoids extra<br>
effort for coreutils for those users.<br>
<br>
Signed-off-by: Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.org" target=3D=
"_blank">sno@netbsd.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a> | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.b=
b" rel=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a> b/meta/recipe=
s-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">coreutils_8.30.bb</a><br>
index 053891f6ea..5ebd36026e 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a><br>
@@ -77,7 +77,7 @@ do_install_class-native() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in df mktemp base64; do mv ${D}${bindir}/=
$i ${D}${bindir}/$i.${BPN}; done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in df mktemp nice base64; do mv ${D}${bin=
dir}/$i ${D}${bindir}/$i.${BPN}; done<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${base_bindir}&quot; !=3D &quot;${bindi=
r}&quot; ] &amp;&amp; for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i=
 ${D}${base_bindir}/$i.${BPN}; done<br>
@@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] =3D &quot;${base_bindir}/df&=
quot;<br>
=C2=A0ALTERNATIVE_TARGET[df] =3D &quot;${bindir}/df.${BPN}&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[df.1] =3D &quot;${mandir}/man1/df.1&quot;<br>
<br>
+ALTERNATIVE_LINK_NAME[nice] =3D &quot;${base_bindir}/nice&quot;<br>
+ALTERNATIVE_TARGET[nice] =3D &quot;${bindir}/nice.${BPN}&quot;<br>
+ALTERNATIVE_LINK_NAME[nice.1] =3D &quot;${mandir}/man1/nice.1&quot;<br>
+<br>
=C2=A0ALTERNATIVE_LINK_NAME[lbracket] =3D &quot;${bindir}/[&quot;<br>
=C2=A0ALTERNATIVE_TARGET[lbracket] =3D &quot;${bindir}/lbracket.${BPN}&quot=
;<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000a7d40d0575ae9afc--
