Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id C0F6A61163
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 14:42:50 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id i78so1859875vke.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 06:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ne8yTi/60MYKZmQ3F1wR/WSA34gpG0f8jzTyOTA80ww=;
	b=nSMAYXJ+GZxXE5mWWIPNRnQJ7ylSbXdfrop9bHrWGeydD2S2Vw6vYATe2NB3izn95+
	23Ukj2WcCUgvuKHJElaAr7dvnwKawXHRosk2MvHI9ZQ8oDENyBi4/+pFh22NaYCvx5B8
	KXWwwLJmbmR7kqeKseVP9C6sT2FShZV5w19E3fIL0OsfUoNg1B1bGtoI7cBORiNsi2eY
	Bd1YQEuhdwQe+vlnmZW8pKAEKEk2tKIJ2oz7+NAPkcm9BlJZHQB2Y1os/kThVdM8Mygr
	juSCch7lOqo7vIo7MiM0E/bV9A6vKVGVKNuIpdKvtPxRlvxK+vhCUlv78i8AQUlGm7xL
	CLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ne8yTi/60MYKZmQ3F1wR/WSA34gpG0f8jzTyOTA80ww=;
	b=ofGEqNXdWqoT04I9utuxRf1tiLUzXhVfS5BWjYDxdkgMh38+q7H0CChuycCUIO5a6c
	rSQ8HRhLWA5EyC1M1WxwO9YuxuCaxosz4Qtm0QlC5STZ/Y7YkDTbZjT0cQhMnGWjEgQN
	Fv95s1tZjxBnIx+Oh8shebBsJfHcB6OkY2KKKX5xD8ZyxsdzNaefNaqH50suJeqSV7zN
	snewc3BP4Lfzq444TloJoZiIlwghkQl7C4wyJqIdlAB/3rrlz7Rz5VFxaGrCoKRyEji1
	HjamdrHNzOZuGuWd+anhGXW6L0EG5kekwsa+r9RRA5mjLIOEoGY1LKQOiz4Uzg+pW6wD
	3wKA==
X-Gm-Message-State: APjAAAVDIAehRTomYKB0NLhMghcsFmheslTXXmGhbbaGscc5Pml7dS4H
	FVMByI1NythBpp8s1OQpYdI/bPhk7NtlLXUoLwxz7I0n
X-Google-Smtp-Source: APXvYqywKfSIr0xQNlqw/kvzRiTPyCpSMRf8I4UepKyiDzGWyIISd0nUQSxBJWBF12oPN/0ZzNPsEXGIeIk5VwRl1F8=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr21062704vkc.1.1582468971565; 
	Sun, 23 Feb 2020 06:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20200223143600.2282-1-bunk@stusta.de>
In-Reply-To: <20200223143600.2282-1-bunk@stusta.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Feb 2020 15:42:36 +0100
Message-ID: <CANNYZj_-YGgjz8eF8fAyv=7r+ng58o_mvm7NhZhV+KkQP=YsPA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: Inherit upstream-version-is-even
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
X-List-Received-Date: Sun, 23 Feb 2020 14:42:51 -0000
Content-Type: multipart/alternative; boundary="000000000000eb16dc059f3f4431"

--000000000000eb16dc059f3f4431
Content-Type: text/plain; charset="UTF-8"

Is there a link to this policy, or some other document stating the rule?

I am seeing that Ubuntu 19.10 ships 1.9:
https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=apt

Alex

On Sun, 23 Feb 2020 at 15:36, Adrian Bunk <bunk@stusta.de> wrote:

> Even versions are shipped in Ubuntu LTS and Debian releases.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-devtools/apt/apt.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/apt/apt.inc
> b/meta/recipes-devtools/apt/apt.inc
> index 50c4d8484a..13f5969f86 100644
> --- a/meta/recipes-devtools/apt/apt.inc
> +++ b/meta/recipes-devtools/apt/apt.inc
> @@ -26,7 +26,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  # so we check the latest upstream from a directory that does get updated
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
>
> -inherit autotools gettext useradd
> +inherit autotools gettext useradd upstream-version-is-even
>
>  EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000eb16dc059f3f4431
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is there a link to this policy, or some other documen=
t stating the rule?</div><div><br></div><div>I am seeing that Ubuntu 19.10 =
ships 1.9:</div><div><a href=3D"https://packages.ubuntu.com/search?suite=3D=
all&amp;searchon=3Dnames&amp;keywords=3Dapt">https://packages.ubuntu.com/se=
arch?suite=3Dall&amp;searchon=3Dnames&amp;keywords=3Dapt</a></div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, 23 Feb 2020 at 15:36, Adrian Bunk &lt;<a h=
ref=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Even versions are shipped in Ub=
untu LTS and Debian releases.<br>
<br>
Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"=
_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/apt/apt.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/=
apt.inc<br>
index 50c4d8484a..13f5969f86 100644<br>
--- a/meta/recipes-devtools/apt/apt.inc<br>
+++ b/meta/recipes-devtools/apt/apt.inc<br>
@@ -26,7 +26,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPL;md5=3Db234e=
e4d69f5fce4486a80fdaf4a4263&quot;<br>
=C2=A0# so we check the latest upstream from a directory that does get upda=
ted<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/a/apt/&quot;<br>
<br>
-inherit autotools gettext useradd<br>
+inherit autotools gettext useradd upstream-version-is-even<br>
<br>
=C2=A0EXTRA_AUTORECONF =3D &quot;--exclude=3Dautopoint,autoheader&quot;<br>
<br>
-- <br>
2.17.1<br>
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

--000000000000eb16dc059f3f4431--
