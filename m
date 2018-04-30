Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 82FD66011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:35:24 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id 94-v6so6747682wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wT0lak+TOGqTeUe2NyJNxhNia6/YyDGOantNDZL9AwM=;
	b=QspB/6XCMHHYr+0k2OTScl1owQooUfzyM7YazNYBv2t807tvGIgyIjetZWZn+2Lb9M
	/97UuT4gj4RL3JYS5xb+x4OGsCDNchg2OL8XvDt6kWK2atotietNFQzQYOOcUB5yIzUY
	X3XsV0j8oO3/nGCmTi5Cx4oIv9hZmxzdYRu10U0AK0BxYJCJXgQeaaufl2ZkyIgebPkP
	jkv1wd59uCPXNlUxyMu5IB5OI32vbfAjyGPlNpohbvYcPbZ5IHbyC2lxTQ1BzCyzaZyh
	0lqB3aFbpJfDqvaUq2GTxQFsl7trs7OPdGAwH+UMizgBw0u6xv+hAvn+AFGljPkGzgc2
	de5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wT0lak+TOGqTeUe2NyJNxhNia6/YyDGOantNDZL9AwM=;
	b=sYlj7Gy27FBy395q1zDIVhrv1LEZxwQ378aNkhP8skwOscSCuwd5VYoaUrOlBwIoMW
	0ZfCiN2fYLR2IX4Gax3H8WPOMKhqe5BafqTaDUNX6LSIjyjZY8zNEyAkXnpUZc/QoKkv
	lWWbuENtTv3t6czE1dZYk7/C+p5QrRzB5apPlAJhBDz/cWw68SCNVvWN3QzP0V+oeUV6
	CrfBJJ8chK0SdLxgMRfnVQUPwvfAgsZCGf+jov2hq/zcUJ5xHMLqKToSyi5h7JJ/Z31S
	DGaBNPmeZdL8P/isUMFHeUKc3Wa8sOoexLWRG0fV8OFPVJ3jP8X5eABNGqY8ONGxbGXW
	vBrA==
X-Gm-Message-State: ALQs6tBNwEKrpUsr5UuV0DbsYZXffIV1N0OALkzOGZfA8jXuWZcM+JMU
	jJt/G0PnjDlRL1s4PRkieKH5tv+2C8o8ba5wEew=
X-Google-Smtp-Source: AB8JxZq/kMFoiY8HOMl3ninBxzJI08VzatuCSvVEZchdSDJt1yInSMQO41VjQ1r5rmAgp0ZhJQJKy5vtHRZivnsNMk8=
X-Received: by 2002:adf:e4c8:: with SMTP id
	v8-v6mr8025972wrm.133.1525095324851; 
	Mon, 30 Apr 2018 06:35:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Mon, 30 Apr 2018 06:35:24 -0700 (PDT)
In-Reply-To: <65f84677b46cae1369973753fa7a9bc732248a4c.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
	<65f84677b46cae1369973753fa7a9bc732248a4c.1525029885.git.raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Apr 2018 15:35:24 +0200
Message-ID: <CA+chaQfD_1=ah5efH99s=hMjALHh-WMk1w=eRvbiujh5S=VgEQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/24] ruby: Upgrade to 1.5.1
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
X-List-Received-Date: Mon, 30 Apr 2018 13:35:24 -0000
Content-Type: multipart/alternative; boundary="0000000000001620d4056b10eda2"

--0000000000001620d4056b10eda2
Content-Type: text/plain; charset="UTF-8"

There is typo in commit summary, it's 2.5.1 not 1.5.1

On Sun, Apr 29, 2018 at 9:35 PM, Khem Raj <raj.khem@gmail.com> wrote:

> License Update: https://github.com/ruby/ruby/commit/
> 322d0d93adfe42fc89c574f67bcb9acb9b82f251#diff-
> c53151ffd180a17416e8f09b1ca4bfc3
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/ruby/ruby.inc                   | 11 +++++------
>  .../ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb}             |  4 ++--
>  2 files changed, 7 insertions(+), 8 deletions(-)
>  rename meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb} (90%)
>
> diff --git a/meta/recipes-devtools/ruby/ruby.inc
> b/meta/recipes-devtools/ruby/ruby.inc
> index fd3911ba75..a366e93f66 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -7,12 +7,11 @@ It is simple, straight-forward, and extensible. \
>  HOMEPAGE = "http://www.ruby-lang.org/"
>  SECTION = "devel/ruby"
>  LICENSE = "Ruby | BSD | GPLv2"
> -LIC_FILES_CHKSUM = "\
> -    file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
> -    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
> -    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
> -    file://LEGAL;md5=8f871f3f03732c018a5fa9b185958231 \
> -"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
> +                    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5 \
> +                    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://LEGAL;md5=23a79bb4c1a40f6cc9bcb6f4e7c39799 \
> +                    "
>
>  DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline"
>  DEPENDS_class-native = "openssl-native libyaml-native"
> diff --git a/meta/recipes-devtools/ruby/ruby_2.5.0.bb
> b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
> similarity index 90%
> rename from meta/recipes-devtools/ruby/ruby_2.5.0.bb
> rename to meta/recipes-devtools/ruby/ruby_2.5.1.bb
> index 1ac7f2aa5a..91048284c1 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.5.0.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
> @@ -5,8 +5,8 @@ SRC_URI += " \
>             file://ruby-CVE-2017-9228.patch \
>             "
>
> -SRC_URI[md5sum] = "f4711f856fe14de222b9da3d3b8efa89"
> -SRC_URI[sha256sum] = "46e6f3630f1888eb653b15fa811d77
> b5b1df6fd7a3af436b343cfe4f4503f2ab"
> +SRC_URI[md5sum] = "23867bc8c16c55e43b14dfe0614bcfa8"
> +SRC_URI[sha256sum] = "dac81822325b79c3ba9532b048c212
> 3357d3310b2b40024202f360251d9829b1"
>
>  # it's unknown to configure script, but then passed to extconf.rb
>  # maybe it's not really needed as we're hardcoding the result with
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001620d4056b10eda2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is typo in commit summary, it&#39;s 2.5.1 not 1.5.1<=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Apr =
29, 2018 at 9:35 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">License Update: <a href=3D"https://github.=
com/ruby/ruby/commit/322d0d93adfe42fc89c574f67bcb9acb9b82f251#diff-c53151ff=
d180a17416e8f09b1ca4bfc3" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/ruby/ruby/<wbr>commit/<wbr>322d0d93adfe42fc89c574f67bcb9a<wbr>cb9b82=
f251#diff-<wbr>c53151ffd180a17416e8f09b1ca4bf<wbr>c3</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/ruby/<wbr>ruby.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------<br>
=C2=A0.../ruby/{<a href=3D"http://ruby_2.5.0.bb" rel=3D"noreferrer" target=
=3D"_blank">ruby_2.5.0.bb</a> =3D&gt; <a href=3D"http://ruby_2.5.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ruby_2.5.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A02 files changed, 7 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/ruby/{<a href=3D"http://ruby_2.5.0.bb" r=
el=3D"noreferrer" target=3D"_blank">ru<wbr>by_2.5.0.bb</a> =3D&gt; <a href=
=3D"http://ruby_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">ruby_2.5.1.b=
b</a>} (90%)<br>
<br>
diff --git a/meta/recipes-devtools/ruby/<wbr>ruby.inc b/meta/recipes-devtoo=
ls/ruby/<wbr>ruby.inc<br>
index fd3911ba75..a366e93f66 100644<br>
--- a/meta/recipes-devtools/ruby/<wbr>ruby.inc<br>
+++ b/meta/recipes-devtools/ruby/<wbr>ruby.inc<br>
@@ -7,12 +7,11 @@ It is simple, straight-forward, and extensible. \<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.ruby-lang.org/" rel=3D"noref=
errer" target=3D"_blank">http://www.ruby-lang.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/ruby&quot;<br>
=C2=A0LICENSE =3D &quot;Ruby | BSD | GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;\<br>
-=C2=A0 =C2=A0 file://COPYING;md5=3D<wbr>340948e1882e579731841bf49cdc22<wbr=
>c1 \<br>
-=C2=A0 =C2=A0 file://BSDL;md5=3D<wbr>19aaf65c88a40b508d17ae4be539c4<wbr>b5=
\<br>
-=C2=A0 =C2=A0 file://GPL;md5=3D<wbr>b234ee4d69f5fce4486a80fdaf4a42<wbr>63\=
<br>
-=C2=A0 =C2=A0 file://LEGAL;md5=3D<wbr>8f871f3f03732c018a5fa9b1859582<wbr>3=
1 \<br>
-&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>340948e1882e579731841=
bf49cdc22<wbr>c1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://BSDL;md5=3D<wbr>19aaf65c88a40b508d17ae4be539c4<wbr>b5 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://GPL;md5=3D<wbr>b234ee4d69f5fce4486a80fdaf4a42<wbr>63 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LEGAL;md5=3D<wbr>23a79bb4c1a40f6cc9bcb6f4e7c397<wbr>99 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;<br>
<br>
=C2=A0DEPENDS =3D &quot;ruby-native zlib openssl tcl libyaml gdbm readline&=
quot;<br>
=C2=A0DEPENDS_class-native =3D &quot;openssl-native libyaml-native&quot;<br=
>
diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">r<wbr>uby_2.5.0.bb</a> b/meta/recipes-de=
vtools/ruby/<a href=3D"http://ruby_2.5.1.bb" rel=3D"noreferrer" target=3D"_=
blank">r<wbr>uby_2.5.1.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rub<wbr>y_2.5.0.bb</a><br>
rename to meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rub<wbr>y_2.5.1.bb</a><br>
index 1ac7f2aa5a..91048284c1 100644<br>
--- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.0.bb" rel=3D"no=
referrer" target=3D"_blank">r<wbr>uby_2.5.0.bb</a><br>
+++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.1.bb" rel=3D"no=
referrer" target=3D"_blank">r<wbr>uby_2.5.1.bb</a><br>
@@ -5,8 +5,8 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ruby-CVE-2017-9228.<wbr>pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>f4711f856fe14de222b9da3d3b8efa<wbr>89&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>46e6f3630f1888eb653b15fa811d77<wbr>b5b1d=
f6fd7a3af436b343cfe4f4503<wbr>f2ab&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>23867bc8c16c55e43b14dfe0614bcf<wbr>a8&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>dac81822325b79c3ba9532b048c212<wbr>3357d=
3310b2b40024202f360251d98<wbr>29b1&quot;<br>
<br>
=C2=A0# it&#39;s unknown to configure script, but then passed to extconf.rb=
<br>
=C2=A0# maybe it&#39;s not really needed as we&#39;re hardcoding the result=
 with<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.0<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--0000000000001620d4056b10eda2--
