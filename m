Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8FC74583
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 19:14:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w137-v6so3171305wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i8xJvX8MkVU2Vx5loFlVqlvE+5BqQkJwVO4U6mUF+Zk=;
	b=cnJLkE/kVAtAGFtc0i8oARntUQT3h6rv03P9DeNGceGrPGYjrhFTIisXMVY5W66LuE
	g7keyuvMJmav+7KMIcnzLKZf9FGRbc8cgCPb7Iq2oHWZCDW0eMuinsPI4FeYg2zUwEHL
	1xbB1QTDAE6F04hxUJasZ8+t+++bvH/gJIB4LYrDqH/6l14eWRee+0buW4kQkYCBX2f7
	y2iMkevVE1TDSgond6IrRwQaCqKTPOhN+jXfnbXRkujgon+OQj42Pgc6X8wAn49qN6vv
	akgKN/NnDNe3wF8h0aFH9fDRkiyaLfrPn+391HmMZPmDEzLy7imIU364noCMzbXHQcE6
	+mEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i8xJvX8MkVU2Vx5loFlVqlvE+5BqQkJwVO4U6mUF+Zk=;
	b=oaigp9+lXTJQvV9cwn6h1iSvQ/+fcoojTnTSUedPsrfbsfqVz4enL9gMfmXH9VbvS8
	sY4HWBVeYdlqWMxPnv0tVg/bx8r8WAYPVZK3zq+BIbQ6XOyhR4bln8xpb4cMR4qBKlvy
	5lX5uvlrfmLZGqZFB5k/SveLKdHZpB8JLP2JlBfA7ZiKUTwzcUCDksCFb4dwP38dKY/0
	wvyjjAZJ03TbAM6vXIV2WjcUEgqDQKkmntlrZ1Od1Dxsy2V3ZpvFwZ5fuCwp4xeNuuO2
	rwLLW2vs2C5JpQdIKCjH5fxE3FmWce7wLX4YZMSGcseLpYnJ/HH2Kdmm9ZGIsuD8sHWR
	Q5WA==
X-Gm-Message-State: APt69E3/CqbKYK1mlInhzE/EBhQuQWpE8PrlpcjbxhWdfoYGQpBJCX+c
	/j+6FZp9+l0HZrxuwOPj2LLBGo8HBvWThZWtMPo=
X-Google-Smtp-Source: AAOMgpf+YmubzYgRvF8QvpffEh+hGRaWqFYL/gtI0GFY1qywyps8azMPlCOxxDrLdec0HeLBoiQVNVEpKtKkwR0jbN8=
X-Received: by 2002:a1c:8c55:: with SMTP id
	o82-v6mr2481774wmd.60.1530040500236; 
	Tue, 26 Jun 2018 12:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
	<1530014936-10858-2-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1530014936-10858-2-git-send-email-alex.kiernan@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Jun 2018 21:14:48 +0200
Message-ID: <CA+chaQc7jQSfxtzBDHCN5X_N3SFWqwFjRBV-5KGKFa6A4xuujQ@mail.gmail.com>
To: alex.kiernan@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: Set SOURCE_DATE_EPOCH to kernel git timestamp if not set
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
X-List-Received-Date: Tue, 26 Jun 2018 19:15:00 -0000
Content-Type: multipart/alternative; boundary="00000000000082370c056f905073"

--00000000000082370c056f905073
Content-Type: text/plain; charset="UTF-8"

Thanks, this seems to be fixing the issue I've reported long time ago:
http://lists.openembedded.org/pipermail/openembedded-commits/2018-March/220579.html



On Tue, Jun 26, 2018 at 2:10 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:

> If SOURCE_DATE_EPOCH is unset (in addition to the existing "0" behaviour)
> parse out the top most commit timestamp from the kernel tree to use as the
> timestamp.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 972ac52..3213b93 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -288,7 +288,7 @@ kernel_do_compile() {
>         if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
>                 # kernel sources do not use do_unpack, so
> SOURCE_DATE_EPOCH may not
>                 # be set....
> -               if [ "$SOURCE_DATE_EPOCH" = "0" ]; then
> +               if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}"
> = "0" ]; then
>                         olddir=`pwd`
>                         cd ${S}
>                         SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000082370c056f905073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, this seems to be fixing the issue I&#39;ve reporte=
d long time ago:<div><a href=3D"http://lists.openembedded.org/pipermail/ope=
nembedded-commits/2018-March/220579.html">http://lists.openembedded.org/pip=
ermail/openembedded-commits/2018-March/220579.html</a><br></div><div><br></=
div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On=
 Tue, Jun 26, 2018 at 2:10 PM Alex Kiernan &lt;<a href=3D"mailto:alex.kiern=
an@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">If SOURCE_DATE_EPOCH is unset (in addition to the existing=
 &quot;0&quot; behaviour)<br>
parse out the top most commit timestamp from the kernel tree to use as the<=
br>
timestamp.<br>
<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
<br>
=C2=A0meta/classes/kernel.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 972ac52..3213b93 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -288,7 +288,7 @@ kernel_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${BUILD_REPRODUCIBLE_BINARIES}&quot;=
 =3D &quot;1&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # kernel sources do=
 not use do_unpack, so SOURCE_DATE_EPOCH may not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # be set....<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$SOURCE_=
DATE_EPOCH&quot; =3D &quot;0&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${SOURCE=
_DATE_EPOCH}&quot; =3D &quot;&quot; -o &quot;${SOURCE_DATE_EPOCH}&quot; =3D=
 &quot;0&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 olddir=3D`pwd`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cd ${S}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 SOURCE_DATE_EPOCH=3D`git log=C2=A0 -1 --pretty=3D%ct`<br>
-- <br>
2.7.4<br>
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

--00000000000082370c056f905073--
