Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id F120A748D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 19:56:17 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id o12-v6so7751710wrm.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 12:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=feyS+8Zyy7RNgXTol4s1QPA64k5uDEPIWpVQqmkqJQQ=;
	b=AsN1SUIPr99t92SCr7AwBc+0GC23bWiWvQTYaO7MbiHPR92NxhVGiVOY5KJLWzyFu/
	Tr0IOYU/8y+xjqkfGmLbRZKI1CCRCmSACtaYYOfg+bMk2CbHIYmPG5c6AIjJOMog9h1N
	9OSQsfqD+WvA2jvLXSShhxJ6b/QyeyozSqxuxSCrrihtFPC2do0Y4x71ofZ2b+uzLX5c
	TOOSvNlFGWIk0Vfj9TkXvy8h0txFhTQG0SgwL9F+t6EXTayrkEx1L4uEUjN28YUuKSJ7
	7sT3HbJQPMCkIKCwpJfCPE1H30IuA8aKh49xqTltYvCO4tZt3DPYXYWZOncTb94MuCgE
	Ocfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=feyS+8Zyy7RNgXTol4s1QPA64k5uDEPIWpVQqmkqJQQ=;
	b=JD5if4w1pmwLkl0qnUozX0qZO+Xz/Ec5RWpjmlz84rLBQ2OlSyveZn6KOsiniRnTcA
	rMKdCisZxi+mjTyXvp4wp0gxw8TE3MWaY0edO37ljR7XDDiGWdYquX44sZwR+dr3SgMc
	Brro7Y1/rn8sxXQatl9hpmQYDSUikBoyYfHawzwQO6WnHwsgwKppRbJ55Zbvy5AzsZr9
	6YAGabAGLeoH3+4L2LdqLNhVEZl9h8N7hFsj/ADYLQWv88VYPk08QK5aZ2CdQeTFPMYc
	o3nByICzIBpCnQhIPSZgWvi+xtNmacGcKMcMCQA2z9aupTKFFVTRUxTeTOGM6YAZ3jR3
	HLZQ==
X-Gm-Message-State: APt69E25PAgAvWzC2ZEISsyVdkBhoMym2w8udO2AjE4rj+RkOni1WfkA
	bjwPSH/KGgHh4t5HPL30yvz7kXQ8EERcJkXa6fzchQ==
X-Google-Smtp-Source: AAOMgpcNSYeaFRnBbSvXx5ncsan569fPfCi0ugoa/C9Crhwne/DWV5LN8XJ31SYZdquT5IVmgCA6h/idC+vEogTAUiw=
X-Received: by 2002:adf:f546:: with SMTP id
	j6-v6mr2504101wrp.241.1529697378716; 
	Fri, 22 Jun 2018 12:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180622192316.235356-1-joe.slater@windriver.com>
In-Reply-To: <20180622192316.235356-1-joe.slater@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Jun 2018 21:56:07 +0200
Message-ID: <CA+chaQdiOW9FqcaBnk95MNba=w_LSH0LP3nNATyK5c4nwf6WkQ@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mdadm: fix format-overflow
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
X-List-Received-Date: Fri, 22 Jun 2018 19:56:18 -0000
Content-Type: multipart/alternative; boundary="000000000000df513e056f406c5f"

--000000000000df513e056f406c5f
Content-Type: text/plain; charset="UTF-8"

See https://patchwork.openembedded.org/patch/151888/

On Fri, Jun 22, 2018 at 9:24 PM Joe Slater <joe.slater@windriver.com> wrote:

> nb[] is not quite big enough.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../0002-mdadm-Specify-enough-length-when-write-to-buffer.patch     | 6
> +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
> b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
> index cbce053..6bbe8f4 100644
> ---
> a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
> +++
> b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
> @@ -24,6 +24,10 @@ Change the length to 47.
>
>  Signed-off-by: Xiao Ni <xni@redhat.com>
>  Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
> +
> +nb[] actually needs to be at least 12, but we will make it 16.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>  ---
>  Upstream-Status: Backport
>   Detail.c | 2 +-
> @@ -53,7 +57,7 @@ index 938cfd9..f5b4507 100644
>                 mdp_disk_t *dp;
>                 char *dv;
>  -              char nb[5];
> -+              char nb[11];
> ++              char nb[16];
>                 int wonly, failfast;
>                 if (d>=0) dp = &sb->disks[d];
>                 else dp = &sb->this_disk;
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000df513e056f406c5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See=C2=A0<a href=3D"https://patchwork.openembedded.org/pat=
ch/151888/">https://patchwork.openembedded.org/patch/151888/</a></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jun 22, 2018 at 9:24 PM =
Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com">joe.slater@windr=
iver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">nb[] is not=
 quite big enough.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" t=
arget=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0002-mdadm-Specify-enough-length-when-write-to-buffer.patch=C2=A0=
 =C2=A0 =C2=A0| 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-le=
ngth-when-write-to-buffer.patch b/meta/recipes-extended/mdadm/files/0002-md=
adm-Specify-enough-length-when-write-to-buffer.patch<br>
index cbce053..6bbe8f4 100644<br>
--- a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-wh=
en-write-to-buffer.patch<br>
+++ b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-wh=
en-write-to-buffer.patch<br>
@@ -24,6 +24,10 @@ Change the length to 47.<br>
<br>
=C2=A0Signed-off-by: Xiao Ni &lt;<a href=3D"mailto:xni@redhat.com" target=
=3D"_blank">xni@redhat.com</a>&gt;<br>
=C2=A0Signed-off-by: Jes Sorensen &lt;<a href=3D"mailto:Jes.Sorensen@gmail.=
com" target=3D"_blank">Jes.Sorensen@gmail.com</a>&gt;<br>
+<br>
+nb[] actually needs to be at least 12, but we will make it 16.<br>
+<br>
+Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0Upstream-Status: Backport<br>
=C2=A0 Detail.c | 2 +-<br>
@@ -53,7 +57,7 @@ index 938cfd9..f5b4507 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mdp_disk_t *dp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dv;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char nb[5];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char nb[11];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char nb[16];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int wonly, failfast=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d&gt;=3D0) dp =
=3D &amp;sb-&gt;disks[d];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else dp =3D &amp;sb=
-&gt;this_disk;<br>
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

--000000000000df513e056f406c5f--
