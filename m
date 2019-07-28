Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF2537EC4B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 02:15:48 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k18so55095188ljc.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 19:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AJvGaZsDTyR8SWbKWrNj0HdM4cSBZljQ54bwePNDU/4=;
	b=qtfT0DwDFC7SGsCRlMdFIQxbivovD/sZ9ftOAZalI5ps2JQ498Sc5QtMsDHxZgvU5Y
	Zty15Q4heLp0KXMIAngQ+rMOyt9k9O2Bk1p9sSPAM8WpSwQNx+SJZcv2hHXMPl5orshW
	UBcOJtKvgv8LDeEcKYZrvf7ZXXsuVnYSnfSt3JLLl7yq9nn9lHzRxm4pSqX3jjCMOSg2
	RpeAi/Fy+aFvfQcoUVb3eCgqL5E37gMjO6tPrbVluqqn9z++SunFWq6ShaGSLXeHXRO/
	Yjq5/1Op5umaMTbNZZqr31eS5X1/XVg6JgeFxjRV7BX59DTi72seF0LTGbHXOLXAKLxF
	gn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AJvGaZsDTyR8SWbKWrNj0HdM4cSBZljQ54bwePNDU/4=;
	b=ez1bMxmsaO8O/xG8eY8zekLBb1PA2a8eflcrUosZYidNGiomrzNU0qJzjTZQ4CALu2
	X7ufnvv4jCem60DBD0mrCvmIo54GnVtq0+bQIN7gLL/X/0SVy8GFxOC1oNIrIsur3ftM
	i5YXKnxdR8PHdeE2VwayNyHSs+8OrukgmZD1c1BTJ0NtTGvEc1qLxi8Ee3XZkMDGbphn
	JKzePLA0Z1LO7I8wKBTp1K5NQJHZUR7iQIN6lhje1pUDrt+x6tDbFirFGb02aICgWjZ+
	t3bJO/8UJxbAOUnKk5PRJwz7go7XPrP4ukICAREdqU2TPTXhRf4VCJ3fq9o8FwhK6Ru1
	BICA==
X-Gm-Message-State: APjAAAXpQ3MRcsMyTJqKl1sayk0DIxAXZnm+SPM4oOVhdOnK7Ew6nsE5
	DsaAvsKZvaWWaWt4EoeA7n2fCOfh6TamcfG0V9ZJUH1S
X-Google-Smtp-Source: APXvYqyTvKwyx9iSnOYNCey+4IMrCyh/cLxgVXZ7k7TJxI9zzH03RGfnqfV3K/bFPIlLzR3jyvFBd6lWxFByyYoYv6Q=
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr52509585ljh.79.1564280148990; 
	Sat, 27 Jul 2019 19:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190727103634.9536-1-tworaz@tworaz.net>
In-Reply-To: <20190727103634.9536-1-tworaz@tworaz.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 27 Jul 2019 22:15:41 -0400
Message-ID: <CADkTA4M7-cH7s2P+dEmeCW+Kp95OZJ8XvV26DDn-NJZmK4ThHQ@mail.gmail.com>
To: Piotr Tworek <tworaz@tworaz.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-dev: bump to v5.3-rc
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
X-List-Received-Date: Sun, 28 Jul 2019 02:15:49 -0000
Content-Type: multipart/alternative; boundary="0000000000009c1dd7058eb45a27"

--0000000000009c1dd7058eb45a27
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch, but please don't send these.

The version bumping of this kernel is something that I need to do.  I'm not
done integration testing with -dev, so the version can't be bumped. In
fact, I'm about to take it back to 5.2 temporarily while I work through
some other issues.

Cheers,

Bruce

On Sat, Jul 27, 2019 at 6:36 AM Piotr Tworek <tworaz@tworaz.net> wrote:

> Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 8c83620d39..96117ccf3f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -30,7 +30,7 @@ SRC_URI = "git://
> git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=$%7BKBRANCH%7D;name>
>  SRCREV_machine ?=
> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> "linux-yocto-dev", "${AUTOREV}",
> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>  SRCREV_meta ?=
> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> "linux-yocto-dev", "${AUTOREV}",
> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>
> -LINUX_VERSION ?= "5.2-rc+"
> +LINUX_VERSION ?= "5.3-rc+"
>  LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009c1dd7058eb45a27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v class=3D"gmail_default">Thanks for the patch, but please don&#39;t send t=
hese.</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_defau=
lt">The version bumping of this kernel is something that I need to do.=C2=
=A0 I&#39;m not done integration testing with -dev, so the version can&#39;=
t be bumped. In fact, I&#39;m about to take it back to 5.2 temporarily whil=
e I work through some other issues.</div><div class=3D"gmail_default"><br><=
/div><div class=3D"gmail_default">Cheers,</div><div class=3D"gmail_default"=
><br></div><div class=3D"gmail_default">Bruce</div></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 27, 20=
19 at 6:36 AM Piotr Tworek &lt;<a href=3D"mailto:tworaz@tworaz.net">tworaz@=
tworaz.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Piotr Tworek &lt;<a href=3D"mailto:tworaz@tworaz.=
net" target=3D"_blank">tworaz@tworaz.net</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto-dev.bb</a><br>
index 8c83620d39..96117ccf3f 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
@@ -30,7 +30,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoprojec=
t.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;name" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRAN=
CH};name</a><br>
=C2=A0SRCREV_machine ?=3D &#39;${@oe.utils.conditional(&quot;PREFERRED_PROV=
IDER_virtual/kernel&quot;, &quot;linux-yocto-dev&quot;, &quot;${AUTOREV}&qu=
ot;, &quot;29594404d7fe73cd80eaa4ee8c43dcc53970c60e&quot;, d)}&#39;<br>
=C2=A0SRCREV_meta ?=3D &#39;${@oe.utils.conditional(&quot;PREFERRED_PROVIDE=
R_virtual/kernel&quot;, &quot;linux-yocto-dev&quot;, &quot;${AUTOREV}&quot;=
, &quot;29594404d7fe73cd80eaa4ee8c43dcc53970c60e&quot;, d)}&#39;<br>
<br>
-LINUX_VERSION ?=3D &quot;5.2-rc+&quot;<br>
+LINUX_VERSION ?=3D &quot;5.3-rc+&quot;<br>
=C2=A0LINUX_VERSION_EXTENSION ?=3D &quot;-yoctodev-${LINUX_KERNEL_TYPE}&quo=
t;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
-- <br>
2.21.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000009c1dd7058eb45a27--
