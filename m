Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5A4613A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 21:17:16 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id a33so765732uad.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 13:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vDSdVtw7BIh04r6gJ2AnXg6QrDV6W3Vnh1hlwUeWYvE=;
	b=unLau/dEAzfmbFPe4SeV/8ydAATmZQN6bxcrQeQ6A8kSHfz+t6msAzSa6v3y8l51Se
	voF0X+eQAykT6oGXrIi3PYpWShw6ioMY7yJ4mjq/q7XQbAVipzv2jq10gYkLVXrVU3wg
	EcGeGiLEMqwklI3h9nv5NCWiadwONCAX5LflqSJRtfKsR4oMPqsW2ldRFdo4i7CLeeyc
	KHp1rORQNyltyl9Q93YH73WJa2A3Inj+rkAAdWfdDjOV4XTCn+bWJEknO8ll630E91w9
	uUulrYe/bGxuyZ3NEaUPh+1XXVe5JSCV7z2Du4n581rlHiFcp5oZZq9dLtPagCPYYl5z
	a11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vDSdVtw7BIh04r6gJ2AnXg6QrDV6W3Vnh1hlwUeWYvE=;
	b=BEn8n1GY4YcsO7dkZg/IQBusm7XlIAqzwz1xhEhPSqUzL6TqHmNA6XrctdR/ssYBxq
	mEnCwe9KfBN92PF1psZKTJp45DcuRHqdHclZpFMazytFUE0i0rPS2DaKWbegQJgTaNzT
	oGeKKPQwjeVKSqJ3ihu5H7+5h7PlOOHjRa/6scotP3AnNt9Ro7G/EjOaGFU9T5QJyWPu
	wTNiofDSR/PU5yWMG82iBFRfne5C9ue9tr+dCDBc7AsTHtR+Xyw0tlUcomOSIB0C9CKh
	ZjplE0KFbnZgiFMZ9uVRBaCL+ctuhGlRMyZuGtBWMxpmRFjHdQSpmUIvvgeUrqmroJMd
	wrMg==
X-Gm-Message-State: APjAAAX5N/Uxxh+2XZetjgTn9QCIbYCtOd7p0x8KdkTE9NRFn6+kD+eN
	wTz0LA8PTgXw/AEqURs4r3tSo5vWPrMFhS5zZbwjXcxw
X-Google-Smtp-Source: APXvYqzy5dctBrBKYDY6iyXEGRrzsLz9gqxgVl66xI4/+AriydZzQlBh9XMTWjJ1v8HqXPmBeXDe3+XEGKhH88hfXuQ=
X-Received: by 2002:ab0:658d:: with SMTP id v13mr13182218uam.71.1582147037992; 
	Wed, 19 Feb 2020 13:17:17 -0800 (PST)
MIME-Version: 1.0
References: <1582146491-20965-1-git-send-email-pjtexier@koncepto.io>
In-Reply-To: <1582146491-20965-1-git-send-email-pjtexier@koncepto.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2020 22:17:06 +0100
Message-ID: <CANNYZj-8CG1HDuXbjmS4AVFe-LChc-MGKTTQXsjkc8H=SpYB5g@mail.gmail.com>
To: Pierre-Jean Texier <pjtexier@koncepto.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libubootenv: bump to revision ba952d0
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
X-List-Received-Date: Wed, 19 Feb 2020 21:17:17 -0000
Content-Type: multipart/alternative; boundary="0000000000002e9f2b059ef450c6"

--0000000000002e9f2b059ef450c6
Content-Type: text/plain; charset="UTF-8"

If PV doesn't change, package managers will not be able to update this
properly. You need to set it to something like 0.2+git${SRCPV}

Alex

On Wed, 19 Feb 2020 at 22:08, Pierre-Jean Texier via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> This includes following changes:
>
> ba952d0 BUG: variable lists not released in close()
> 690f868 Variables are not removed when loading from file
> 9e3586a Make sure there's no file descriptor leakage in case of error
> 03647c4 Check config file defines a non-zero Sector size
> 3b2d4f1 Check environment size from fw_env.config
>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> index f5b6059..ac49b68 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =
> "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b36
>  SECTION = "libs"
>
>  SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> -SRCREV = "879c0731fa0725785b9fa4499bbf6aacd04ee4c2"
> +SRCREV = "ba952d05ec9ab16029816a06d956bac7fb4e9832"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002e9f2b059ef450c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If PV doesn&#39;t change, package managers will not b=
e able to update this properly. You need to set it to something like 0.2+gi=
t${SRCPV}</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 19 Feb 2020 at 22:=
08, Pierre-Jean Texier via Openembedded-core &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
his includes following changes:<br>
<br>
ba952d0 BUG: variable lists not released in close()<br>
690f868 Variables are not removed when loading from file<br>
9e3586a Make sure there&#39;s no file descriptor leakage in case of error<b=
r>
03647c4 Check config file defines a non-zero Sector size<br>
3b2d4f1 Check environment size from fw_env.config<br>
<br>
Signed-off-by: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncepto.i=
o" target=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" rel=3D"=
noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> b/meta/recipes-=
bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libubootenv_0.2.bb</a><br>
index f5b6059..ac49b68 100644<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" rel=3D"=
noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" rel=3D"=
noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D &quot;file://Licenses/lgpl-2.1.txt;m=
d5=3D4fbd65380cdd255951079008b36<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/sbabic/libuboote=
nv;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/sbabic=
/libubootenv;protocol=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;879c0731fa0725785b9fa4499bbf6aacd04ee4c2&quot;<br>
+SRCREV =3D &quot;ba952d05ec9ab16029816a06d956bac7fb4e9832&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
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

--0000000000002e9f2b059ef450c6--
