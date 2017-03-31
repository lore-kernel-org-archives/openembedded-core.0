Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9210877E1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 22:27:43 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id k6so110295832wre.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fjLkw/s1uY8cUCPO+BmeRo48TUKZ/uO1djYaCUUyXT0=;
	b=ttL1N1KCkLV7j1QlsaBWMMjS5NpocuFjZEnk/99Nx6IAGbsERD2GMA1eO5Yxed0NyX
	ZLMqB39gFrN/gbl7XRIul9m0xOOOs4hxHC+Lz+2cIeSqFNXaCnFmi5Cj5DZGgpV7Gt6G
	eu7Yb4TtV62c9+08L3gV5CF2O+wPpaWDiEu4ArBj8cE2LY62VBFgncAhA3AyFO1JT+lo
	c0ynGAx8P9/a9PDJzV7C6pYnzKBYPK4ZiGR/et2Ih/hInR1Zs5bgObTd8YAMYnbST7YV
	DagQ2hp0p5Kz8XJxjxra0pRHd4o6N53TKdvwe6rvF9HLk+XVKF5sLMJ3e7r/XBAx3DQo
	4ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fjLkw/s1uY8cUCPO+BmeRo48TUKZ/uO1djYaCUUyXT0=;
	b=p2ecqcLd3JTPFzu6Ck5DB6qyi6iujn8QERJAxgVDsDEtdSdEJmjOxQqBNTzj6Rnpdu
	7dgJ8+CfwrUBEKSHvIR6HQMRlfFHMKhfz/t/QcuQtjgM3q/Hr/HFDEHW0Gusx8Y1HSIv
	dH/Sf65Jb8zitHfkjxfTQLtLhHQd/HAs6FzvJROQZSCKaZo4QScrXLCQlku3BtOPGc9o
	aRPfSTbu0J5/vBBfWbZ5Iie0lGzcUhpCgrko92yXrIvQE8STXT3rE8ap2AG6lAd59CVk
	jjuLIeVSJ2uSRXZJcjOw1oYZj5om8qgv/9/P5QDTKE3GrNUIf4N59ja8ols+ZakRBdB5
	W1dg==
X-Gm-Message-State: AFeK/H0NtxhEjfdU5shRtdwOr8MRhpGHtFH/69J+BaVitXVQTP+iAUEOOBE0kA8Jlbc0RPuFj6z7sZKfTiL5CQ==
X-Received: by 10.223.164.201 with SMTP id h9mr4483774wrb.175.1490999264283;
	Fri, 31 Mar 2017 15:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <1490995693-19005-1-git-send-email-juro.bystricky@intel.com>
In-Reply-To: <1490995693-19005-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Mar 2017 22:27:33 +0000
Message-ID: <CAMKF1sp=tgkByXMiELBa+K1=mQ5=ggr-7TwkTdK9m7ieGeeEPg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Cc: richard.purdie@intel.com
Subject: Re: [PATCH] ncurses_6.0: Improve reproducibility
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
X-List-Received-Date: Fri, 31 Mar 2017 22:27:43 -0000
Content-Type: multipart/alternative; boundary=f403045f151882104b054c0e5148

--f403045f151882104b054c0e5148
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 31, 2017 at 2:29 PM Juro Bystricky <juro.bystricky@intel.com>
wrote:

> Build static libraries without the binutils "ar" -U option.
> This option deliberately breaks deterministic mode.


While this patch is ok it would be better if we configured binutils with
enable-deterministic-archives option please file a ticket for it

>
> The option seems to be a relic from 2015, intended as a workaround
> for some unspecified build problems.
>
> [YOCTO#11247]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../ncurses/files/configure-reproducible.patch       | 20
> ++++++++++++++++++++
>  meta/recipes-core/ncurses/ncurses_6.0+20161126.bb    |  1 +
>  2 files changed, 21 insertions(+)
>  create mode 100644
> meta/recipes-core/ncurses/files/configure-reproducible.patch
>
> diff --git a/meta/recipes-core/ncurses/files/configure-reproducible.patch
> b/meta/recipes-core/ncurses/files/configure-reproducible.patch
> new file mode 100644
> index 0000000..54a8bdc
> --- /dev/null
> +++ b/meta/recipes-core/ncurses/files/configure-reproducible.patch
> @@ -0,0 +1,20 @@
> +"configure" enforces -U for ar flags, breaking deterministic builds.
> +The flag was added to fix some vaguely specified "recent POSIX binutil
> +build problems" in 2015.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +diff --git a/configure b/configure
> +index 7f31208..aa80911 100755
> +--- a/configure
> ++++ b/configure
> +@@ -4428,7 +4428,7 @@ if test "${cf_cv_ar_flags+set}" = set; then
> + else
> +
> +       cf_cv_ar_flags=unknown
> +-      for cf_ar_flags in -curvU -curv curv -crv crv -cqv cqv -rv rv
> ++      for cf_ar_flags in -curv curv -crv crv -cqv cqv -rv rv
> +       do
> +
> +               # check if $ARFLAGS already contains this choice
> diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> index e95741f..ace3108 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> @@ -3,6 +3,7 @@ require ncurses.inc
>  SRC_URI += "file://tic-hang.patch \
>              file://fix-cflags-mangle.patch \
>              file://config.cache \
> +            file://configure-reproducible.patch \
>  "
>  # commit id corresponds to the revision in package version
>  SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f151882104b054c0e5148
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Fri, Mar 31, 2017 at 2:29 PM Ju=
ro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">juro.bystricky=
@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Build st=
atic libraries without the binutils &quot;ar&quot; -U option.<br class=3D"g=
mail_msg">
This option deliberately breaks deterministic mode.</blockquote><div><br></=
div><div>While this patch is ok it would be better if we configured binutil=
s with enable-deterministic-archives option please file a ticket for it=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br class=3D"gmail_msg">
The option seems to be a relic from 2015, intended as a workaround<br class=
=3D"gmail_msg">
for some unspecified build problems.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
[YOCTO#11247]<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m" class=3D"gmail_msg" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<b=
r class=3D"gmail_msg">
---<br class=3D"gmail_msg">
=C2=A0.../ncurses/files/configure-reproducible.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 20 ++++++++++++++++++++<br class=3D"gmail_msg">
=C2=A0meta/recipes-core/ncurses/ncurses_6.0+<a href=3D"http://20161126.bb" =
rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">20161126.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 1 +<br class=3D"gmail_msg">
=C2=A02 files changed, 21 insertions(+)<br class=3D"gmail_msg">
=C2=A0create mode 100644 meta/recipes-core/ncurses/files/configure-reproduc=
ible.patch<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
diff --git a/meta/recipes-core/ncurses/files/configure-reproducible.patch b=
/meta/recipes-core/ncurses/files/configure-reproducible.patch<br class=3D"g=
mail_msg">
new file mode 100644<br class=3D"gmail_msg">
index 0000000..54a8bdc<br class=3D"gmail_msg">
--- /dev/null<br class=3D"gmail_msg">
+++ b/meta/recipes-core/ncurses/files/configure-reproducible.patch<br class=
=3D"gmail_msg">
@@ -0,0 +1,20 @@<br class=3D"gmail_msg">
+&quot;configure&quot; enforces -U for ar flags, breaking deterministic bui=
lds.<br class=3D"gmail_msg">
+The flag was added to fix some vaguely specified &quot;recent POSIX binuti=
l<br class=3D"gmail_msg">
+build problems&quot; in 2015.<br class=3D"gmail_msg">
+<br class=3D"gmail_msg">
+Upstream-Status: Pending<br class=3D"gmail_msg">
+Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om" class=3D"gmail_msg" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<=
br class=3D"gmail_msg">
+<br class=3D"gmail_msg">
+diff --git a/configure b/configure<br class=3D"gmail_msg">
+index 7f31208..aa80911 100755<br class=3D"gmail_msg">
+--- a/configure<br class=3D"gmail_msg">
++++ b/configure<br class=3D"gmail_msg">
+@@ -4428,7 +4428,7 @@ if test &quot;${cf_cv_ar_flags+set}&quot; =3D set; t=
hen<br class=3D"gmail_msg">
+ else<br class=3D"gmail_msg">
+<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cf_cv_ar_flags=3Dunknown<br class=3D"gmail_msg"=
>
+-=C2=A0 =C2=A0 =C2=A0 for cf_ar_flags in -curvU -curv curv -crv crv -cqv c=
qv -rv rv<br class=3D"gmail_msg">
++=C2=A0 =C2=A0 =C2=A0 for cf_ar_flags in -curv curv -crv crv -cqv cqv -rv =
rv<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br class=3D"gmail_msg">
+<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# check if $ARFLAGS=
 already contains this choice<br class=3D"gmail_msg">
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+<a href=3D"http://201611=
26.bb" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">20161126.bb=
</a> b/meta/recipes-core/ncurses/ncurses_6.0+<a href=3D"http://20161126.bb"=
 rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">20161126.bb</a><b=
r class=3D"gmail_msg">
index e95741f..ace3108 100644<br class=3D"gmail_msg">
--- a/meta/recipes-core/ncurses/ncurses_6.0+<a href=3D"http://20161126.bb" =
rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">20161126.bb</a><br=
 class=3D"gmail_msg">
+++ b/meta/recipes-core/ncurses/ncurses_6.0+<a href=3D"http://20161126.bb" =
rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">20161126.bb</a><br=
 class=3D"gmail_msg">
@@ -3,6 +3,7 @@ require ncurses.inc<br class=3D"gmail_msg">
=C2=A0SRC_URI +=3D &quot;file://tic-hang.patch \<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-cflags-mangle.pa=
tch \<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://config.cache \<br cl=
ass=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure-reproducible.pa=
tch \<br class=3D"gmail_msg">
=C2=A0&quot;<br class=3D"gmail_msg">
=C2=A0# commit id corresponds to the revision in package version<br class=
=3D"gmail_msg">
=C2=A0SRCREV =3D &quot;3db0bd19cb50e3d9b4f2cf15b7a102fe11302068&quot;<br cl=
ass=3D"gmail_msg">
--<br class=3D"gmail_msg">
2.7.4<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
_______________________________________________<br class=3D"gmail_msg">
Openembedded-core mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" class=3D"gmail_=
msg" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br clas=
s=3D"gmail_msg">
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">http://lists.ope=
nembedded.org/mailman/listinfo/openembedded-core</a><br class=3D"gmail_msg"=
>
</blockquote></div></div>

--f403045f151882104b054c0e5148--
