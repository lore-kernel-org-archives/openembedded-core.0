Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA766E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 16:32:54 +0000 (UTC)
Received: by igvg19 with SMTP id g19so78186121igv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 08:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mhoqxRnwkwBF7n1G6mg47sfdeQfvQERYuoSX4J3Apxw=;
	b=QeU43qpODP2dworG4qMOlnfpXmGV5Q+ZKz8zL7PcryuDYWjuNmFNv3NkDJdzRRDDOn
	cOWkNwhYT+DSNS4F472HdL/x5PY6B5TxX/Dh3qdQpwfHnfu55scf89yuB3ibmI+1wBzw
	Iql68JNu8A+HjAJUfvWzYoVfTLZXq4agS6fRfyKmjCQ8p968vqpVIhjXQH/iovt4dz8U
	QpgPvXLTARWhJhR5pkvdP3mJEdb4v1FEqQJ7dZxVoNfF4CEIT2WDnmOjM91bGF4PIevp
	oXXw81aRe73vaprD4eYLNALtinjtHpN+dGbJSSDf10RMwTD/8Jbtucd4v2LKuMDIc236
	2yMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mhoqxRnwkwBF7n1G6mg47sfdeQfvQERYuoSX4J3Apxw=;
	b=Rj2bWjzkETMMlc4FZ7EIaJ00TCybdfi3KYQyIwnbUTzptoAWCOHf2poVmgB8cSQlYM
	7x0GwjYl99Zbe2Duu2+BsDFkeNXiQ/1deJfWcDSr8J4eGdi8C8jHPs6T3LKZPKmKe9rE
	RZG8XEBhXIDHlBUkOjuMmylP5gtuUrLTPX18ymA763qiROZjREYtp5sJPBUQz0xRSpdQ
	zlm+gudWAVwXIEwYCKsBnLbCm8qZw8CJisy3yLpOPAWgwU984p4J13JgGvDTSaFia+Kc
	eCo+CPCASAoIaUpGdN5RFW2fwT/SJoiYE7xrpSI/bpkij9Uc7q707TyYzlItOpcvJd/O
	MeHg==
X-Received: by 10.50.13.72 with SMTP id f8mr17545471igc.38.1447691575026; Mon,
	16 Nov 2015 08:32:55 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Mon, 16 Nov 2015 08:32:35 -0800 (PST)
In-Reply-To: <3669ff8a3e7cd747cb345814b7d9c24019ea9e73.1446453113.git.hongxu.jia@windriver.com>
References: <cover.1446453113.git.hongxu.jia@windriver.com>
	<3669ff8a3e7cd747cb345814b7d9c24019ea9e73.1446453113.git.hongxu.jia@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 16 Nov 2015 09:32:35 -0700
X-Google-Sender-Auth: ifRrjmZOzOrxC2bAUvxVjOXmFy8
Message-ID: <CABcZANmU7w-__Xp6cMb1PFcxRdsjoX-ZEQkwBe1uxYhu-LnbTA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] logrotate: do not move binary logrotate to /usr/bin
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
X-List-Received-Date: Mon, 16 Nov 2015 16:32:56 -0000
Content-Type: multipart/alternative; boundary=089e013c65de12eda30524aaf61e

--089e013c65de12eda30524aaf61e
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 2, 2015 at 1:33 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> In oe-core commit a46d3646a3e1781be4423b508ea63996b3cfca8a
> ...
> Author: Fahad Usman <fahad_usman@mentor.com>
> Date:   Tue Aug 26 13:16:48 2014 +0500
>
>     logrotate: obey our flags
>
>     Needed to quiet GNU_HASH warnings, and some minor fixes.
> ...
> it explicitly move logrotate to /usr/bin without any reason,
> which is against the original Linux location /usr/sbin.
>
> So partly revert the above commit which let logrotate be
> kept in the original place /usr/sbin.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> index 7d0a159..5f1a601 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> @@ -53,7 +53,7 @@ do_compile_prepend() {
>  }
>
>  do_install(){
> -    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
> BINDIR=${bindir}
> +    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
>      mkdir -p ${D}${sysconfdir}/logrotate.d
>      mkdir -p ${D}${sysconfdir}/cron.daily
>      mkdir -p ${D}${localstatedir}/lib
>

This just makes it not obey our target paths again, using its hardcoded
destination. Why not pass BINDIR=${sbindir} instead?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c65de12eda30524aaf61e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 2, 2015 at 1:33 AM, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D=
"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":a4" c=
lass=3D"a3s" style=3D"overflow:hidden">In oe-core commit a46d3646a3e1781be4=
423b508ea63996b3cfca8a<br>
...<br>
Author: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor.com">fahad_usm=
an@mentor.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Aug 26 13:16:48 2014 +0500<br>
<br>
=C2=A0 =C2=A0 <span class=3D"il">logrotate</span>: obey our flags<br>
<br>
=C2=A0 =C2=A0 Needed to quiet GNU_HASH warnings, and some minor fixes.<br>
...<br>
it explicitly move <span class=3D"il">logrotate</span> to /usr/bin without =
any reason,<br>
which is against the original Linux location /usr/sbin.<br>
<br>
So partly revert the above commit which let <span class=3D"il">logrotate</s=
pan> be<br>
kept in the original place /usr/sbin.<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0meta/recipes-extended/<span class=3D"il">logrotate</=
span>/<a href=3D"http://logrotate_3.9.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">logrotate_3.9.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
</span>diff --git a/meta/recipes-extended/<span class=3D"il">logrotate</spa=
n>/<a href=3D"http://logrotate_3.9.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">logrotate_3.9.1.bb</a> b/meta/recipes-extended/<span class=3D"il">logrot=
ate</span>/<a href=3D"http://logrotate_3.9.1.bb" rel=3D"noreferrer" target=
=3D"_blank">logrotate_3.9.1.bb</a><br>
index 7d0a159..5f1a601 100644<br>
--- a/meta/recipes-extended/<span class=3D"il">logrotate</span>/<a href=3D"=
http://logrotate_3.9.1.bb" rel=3D"noreferrer" target=3D"_blank">logrotate_3=
.9.1.bb</a><br>
+++ b/meta/recipes-extended/<span class=3D"il">logrotate</span>/<a href=3D"=
http://logrotate_3.9.1.bb" rel=3D"noreferrer" target=3D"_blank">logrotate_3=
.9.1.bb</a><br>
@@ -53,7 +53,7 @@ do_compile_prepend() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install(){<br>
-=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} PREFIX=3D${D} MANDIR=3D${m=
andir} BINDIR=3D${bindir}<br>
+=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} PREFIX=3D${D} MANDIR=3D${m=
andir}<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${sysconfdir}/<span class=3D"il">logrotate=
</span>.d<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${sysconfdir}/cron.daily<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${localstatedir}/lib</div></blockquote></d=
iv><br>This just makes it not obey our target paths again, using its hardco=
ded destination. Why not pass BINDIR=3D${sbindir} instead?<br>-- <br><div c=
lass=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<b=
r>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Seni=
or Software Engineer, Mentor Graphics</div>
</div></div>

--089e013c65de12eda30524aaf61e--
