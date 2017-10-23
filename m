Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id DC379606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 11:41:36 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id i38so19745603iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hleWWxiJ5AxdOiCrm3Dz2AZKlU9KqND8d+/akpVi/aQ=;
	b=nqL+fxy5FAWU+lRkIv3I/noeC5DfkXYj6BcmFPFyBfjbOi7oCMQ+lKl9xsNKR6VYj1
	+djE8iIMMg4wKJmjf6ogSTBUkIIIDNLjEqSHI9mKHxrByc+ybw0cAs4y3TYocySUtPzJ
	kJsJPumBSFZw637L79+k3v1IkD33qaHDsNxuZVKfUjUo+X3IZDa0hRITzQsKSPOIXBo2
	r9vFG4+uSxTR4Dlf9SVveeCCT80Bc0169bOP9bsxubQKfdwVpckPt7sdi9XRsi7+16A9
	Ge6vrE2aktOA9UThmUmEnSb0fK2QsrWWds9eae7JcICu/ocidjDLUQ0jJTE3Qhph9rq/
	N61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hleWWxiJ5AxdOiCrm3Dz2AZKlU9KqND8d+/akpVi/aQ=;
	b=KRKZdFpQNMM50VRcgdblopvSuB1A8VEdRQM2VtKivuwEiHI4P7ccoC5V8/e2YrOn/7
	BwlrTS7ATAcTSXag0UXqfcW2CZoI84NFgn0E76keKAMyEkN9i6wFHm3xXhKgmdqLAeCa
	RlFvz3xbqxfxtRFynvzzstIFycbauICupItC3JWAstKZSM8B8260pNLRt5EhSXLSIMX+
	UrDl5R3Bo7zg3hLmKmEtz+731j40qgw3SvDxrAiW1O6wh8Md0uhumrN9ifM7ByMmfA6R
	enh/irFyRVy4ldP+A5tMKqWl40kEYSnQrL6Q+/C72Vk/Y2k4UjQEbM/6CsEzCgUl0d24
	3CmQ==
X-Gm-Message-State: AMCzsaWNpxdCy1LQwhAp/e9d1LHwjaPYpsVHrDakm74XKSU2Dntbv32d
	zgeN8rZQUZviyjVU3e48lxCrs2KWE7olRq+aclmW9g==
X-Google-Smtp-Source: ABhQp+Tr/YNzzc9pFLzPbIRkXWH/BNOtJAHv4Ra8wIZaXmfIFt8ixtK7tJ+vREsmOelRe0Hdw5DN/zICC/f0ROcgMvk=
X-Received: by 10.107.36.80 with SMTP id k77mr16962943iok.176.1508758898009;
	Mon, 23 Oct 2017 04:41:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 23 Oct 2017 04:41:17 -0700 (PDT)
In-Reply-To: <4f1aa881f21424b71dd9fda2c47240c14166c471.1508748511.git.Qi.Chen@windriver.com>
References: <cover.1508748511.git.Qi.Chen@windriver.com>
	<4f1aa881f21424b71dd9fda2c47240c14166c471.1508748511.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Oct 2017 12:41:17 +0100
Message-ID: <CAJTo0LZZ34aPOfko6usC9VY558FK+T3RSVbevfH0UKtAz8vJYw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: fix strange behaviour on qemumips64
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
X-List-Received-Date: Mon, 23 Oct 2017 11:41:37 -0000
Content-Type: multipart/alternative; boundary="001a1141909e2b022d055c354e1b"

--001a1141909e2b022d055c354e1b
Content-Type: text/plain; charset="UTF-8"

Can we trust the mips64 compiler at all?  Is there a specific optimisation
that systemd is turning on that is causing this breakage?  Have you
reported this to the gcc bugzilla?

Ross

On 23 October 2017 at 11:44, Chen Qi <Qi.Chen@windriver.com> wrote:

> On qemumips64, `systemctl status <unit>' would have the output of
> `systemctl show <unit>'. This is incorrect.
>
> However, it's not the code logic that cause such problem. It's the
> compilation flags.
>
> Looking back the history, we had problem with systemd on qemumips64
> which is also related to compilation flags. We solved that by using
> tweaking FULL_OPTIMIZATION for mips64 to have "-fno-tree-switch-conversion
> -fno-tree-tail-merge".
>
> Now systemd has been upgraded to 234, and we don't have the above problem
> any more. However, a new problem appears, and that is the output of
> `systemctl
> status <unit>'.
>
> Hence, we set '-O0' flag for mips64 when building systemd to avoid
> potential
> strange problems.
>
> [YOCTO #12266]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_234.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_234.bb
> b/meta/recipes-core/systemd/systemd_234.bb
> index 36fd3f8..b294604 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -158,8 +158,8 @@ CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG',
> 'valgrind', ' -DVALGRIND=1', ''
>  # disable problematic GCC 5.2 optimizations [YOCTO #8291]
>  FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
>
> -# Avoid login failure on qemumips64 when pam is enabled
> -FULL_OPTIMIZATION_append_mips64 = " -fno-tree-switch-conversion
> -fno-tree-tail-merge"
> +# Disable optimization on qemumips64 to avoid strange behaviour
> +FULL_OPTIMIZATION_append_mips64 = " -O0"
>
>  COMPILER_NM ?= "${HOST_PREFIX}gcc-nm"
>  COMPILER_AR ?= "${HOST_PREFIX}gcc-ar"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141909e2b022d055c354e1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can we trust the mips64 compiler at all?=C2=A0 Is there a =
specific optimisation that systemd is turning on that is causing this break=
age?=C2=A0 Have you reported this to the gcc bugzilla?<div><br></div><div>R=
oss</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 23 October 2017 at 11:44, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On qemumips64, `systemctl statu=
s &lt;unit&gt;&#39; would have the output of<br>
`systemctl show &lt;unit&gt;&#39;. This is incorrect.<br>
<br>
However, it&#39;s not the code logic that cause such problem. It&#39;s the<=
br>
compilation flags.<br>
<br>
Looking back the history, we had problem with systemd on qemumips64<br>
which is also related to compilation flags. We solved that by using<br>
tweaking FULL_OPTIMIZATION for mips64 to have &quot;-fno-tree-switch-conver=
sion<br>
-fno-tree-tail-merge&quot;.<br>
<br>
Now systemd has been upgraded to 234, and we don&#39;t have the above probl=
em<br>
any more. However, a new problem appears, and that is the output of `system=
ctl<br>
status &lt;unit&gt;&#39;.<br>
<br>
Hence, we set &#39;-O0&#39; flag for mips64 when building systemd to avoid =
potential<br>
strange problems.<br>
<br>
[YOCTO #12266]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_=
234.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd_234.bb</a> | 4 ++=
--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
</span>diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_234=
.bb" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a> b/meta/re=
cipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"noreferrer" tar=
get=3D"_blank">sy<wbr>stemd_234.bb</a><br>
index 36fd3f8..b294604 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
@@ -158,8 +158,8 @@ CFLAGS .=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAG=
ECONFIG&#39;, &#39;valgrind&#39;, &#39; -DVALGRIND=3D1&#39;, &#39;&#39;<br>
=C2=A0# disable problematic GCC 5.2 optimizations [YOCTO #8291]<br>
=C2=A0FULL_OPTIMIZATION_append_arm =3D &quot; -fno-schedule-insns -fno-sche=
dule-insns2&quot;<br>
<br>
-# Avoid login failure on qemumips64 when pam is enabled<br>
-FULL_OPTIMIZATION_append_<wbr>mips64 =3D &quot; -fno-tree-switch-conversio=
n -fno-tree-tail-merge&quot;<br>
+# Disable optimization on qemumips64 to avoid strange behaviour<br>
+FULL_OPTIMIZATION_append_<wbr>mips64 =3D &quot; -O0&quot;<br>
<br>
=C2=A0COMPILER_NM ?=3D &quot;${HOST_PREFIX}gcc-nm&quot;<br>
=C2=A0COMPILER_AR ?=3D &quot;${HOST_PREFIX}gcc-ar&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1141909e2b022d055c354e1b--
