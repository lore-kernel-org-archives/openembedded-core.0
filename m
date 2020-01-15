Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 684487E797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 18:06:51 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id t129so4965019vkg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9EmgQahePdkZktLT+t+X6GS40xchrp4iNmNlJ6y2BiY=;
	b=lBfBJwaGc0nW+v2r5HKf8C5aGzkKudneLxrw6uJPJhsyrlUPUhUdbN6HTzgFIupKeM
	KTC9dy3Fni/yzG9srNv6dht/sdUNFbpcT6pcVBlDoO8GmunXDqoiFshlX/MyJp/K3Iw/
	7Na8ZpVZMFEpZanCdkAWWm7sSEIk6th/BhlKxHBwiyCSGr8zacEvVnvdwLbzbsasf6dD
	tRBMKjyLFFl06jLp8Kb76jFMXBNHYzVXOLbqMrOf3fBe03Ip8aF7r/03XvSN5BbHl4lB
	jBRVDRkTPUVYgROkBheIpqCbrr7CCTiArn7SyUZB+dGZHDzMqzlYank3yDFMwYe8l92u
	dd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9EmgQahePdkZktLT+t+X6GS40xchrp4iNmNlJ6y2BiY=;
	b=ZhKk54HzY9JWAHvbIKnwPwNsmFQ/OVwcsBseO4uuXy/3sJMk00DdcAovORS8o8H2aZ
	iBm1dn56JPt1qL9aP605uf2n+eLqogdEy1A5AcQOmX+hC+Wlp2BGkQD16e/Hzvpq/2Vc
	5jY3JY//jbMGQtfKIOLm+R5yqSVZQ29huQ7Ga94672NDSBQtOacjOcB2+mPoFdGlyXut
	Lv+8/V5vbIRjAw+07YLzq+G+P50V0w6Dzrc2zEOpu3GSkUDLH2bTVnSddDIimpxFANLI
	U1aOCQoBqAicxCEskb4nb2AnN2PowoQd1DrdCma60SID6IinXdUsCCeXj48wTnxA40Z/
	VNjQ==
X-Gm-Message-State: APjAAAXxlb1TODR1EYJppdpXC2pZi8fO5lfcodYL09UHlBeYrKhxAH5G
	N0LDfRQ84qhmwjw0RO8/9XLihWa4iT9LEw8seGfP0g==
X-Google-Smtp-Source: APXvYqx6CwlHi4ezpELYBH8IjJgqr+gZSxJswAtpqcfgr1bytiuwoea19kFb1Nk9Z9IizxJn6F647kpHEO/h8QI1qMQ=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr14542836vkq.49.1579111611943; 
	Wed, 15 Jan 2020 10:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20200115175916.108694-1-Oleg.Polyakov@windriver.com>
In-Reply-To: <20200115175916.108694-1-Oleg.Polyakov@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jan 2020 19:06:40 +0100
Message-ID: <CANNYZj_TQgFtnR1ACbZAu43m=e5b2VyVOEqwTy0swDBbQUMETQ@mail.gmail.com>
To: Oleg Polyakov <Oleg.Polyakov@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: update from 8.1.1518 to 8.2.0
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
X-List-Received-Date: Wed, 15 Jan 2020 18:06:51 -0000
Content-Type: multipart/alternative; boundary="000000000000b0cf46059c31924e"

--000000000000b0cf46059c31924e
Content-Type: text/plain; charset="UTF-8"

Thanks, we are almost there :) Please set the version in the filename to
8.2 (not 8.2.0) so that 'devtool latest-version vim' prints a matching
result, and 'devtool check-upgrade-status vim' prints nothing.

Alex

On Wed, 15 Jan 2020 at 18:59, Oleg Polyakov <Oleg.Polyakov@windriver.com>
wrote:

> vim-tiny: update from 8.1.1518 to 8.2.0
> The date in the license was updated to 2020 and
> a trailing space was removed from one line.
>
> Signed-off-by: Oleg Polyakov <Oleg.Polyakov@windriver.com>
> ---
>  .../vim/{vim-tiny_8.1.1518.bb => vim-tiny_8.2.0.bb}           | 0
>  meta/recipes-support/vim/vim.inc                              | 4 ++--
>  meta/recipes-support/vim/{vim_8.1.1518.bb => vim_8.2.0.bb}    | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/vim/{vim-tiny_8.1.1518.bb =>
> vim-tiny_8.2.0.bb} (100%)
>  rename meta/recipes-support/vim/{vim_8.1.1518.bb => vim_8.2.0.bb} (100%)
>
> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1518.bb
> b/meta/recipes-support/vim/vim-tiny_8.2.0.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim-tiny_8.1.1518.bb
> rename to meta/recipes-support/vim/vim-tiny_8.2.0.bb
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> index 5a1bea6985..e0673a7810 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -5,14 +5,14 @@ DEPENDS = "ncurses gettext-native"
>  # vimdiff doesn't like busybox diff
>  RSUGGESTS_${PN} = "diffutils"
>  LICENSE = "vim"
> -LIC_FILES_CHKSUM =
> "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
> +LIC_FILES_CHKSUM =
> "file://runtime/doc/uganda.txt;endline=287;md5=a19edd7ec70d573a005d9e509375a99a"
>
>  SRC_URI = "git://github.com/vim/vim.git \
>             file://disable_acl_header_check.patch \
>             file://vim-add-knob-whether-elf.h-are-checked.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>  "
> -SRCREV = "202d982b36d87cf91d992bd7e30d3223bdc72cd9"
> +SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
>
>  # Do not consider .z in x.y.z, as that is updated with every commit
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
> diff --git a/meta/recipes-support/vim/vim_8.1.1518.bb
> b/meta/recipes-support/vim/vim_8.2.0.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim_8.1.1518.bb
> rename to meta/recipes-support/vim/vim_8.2.0.bb
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b0cf46059c31924e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, we are almost there :) Please set the version=
 in the filename to 8.2 (not 8.2.0) so that &#39;devtool latest-version vim=
&#39; prints a matching result, and &#39;devtool check-upgrade-status vim&#=
39; prints nothing.</div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 15 Jan 2=
020 at 18:59, Oleg Polyakov &lt;<a href=3D"mailto:Oleg.Polyakov@windriver.c=
om">Oleg.Polyakov@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">vim-tiny: update from 8.1.1518 to 8.2.0<br=
>
The date in the license was updated to 2020 and<br>
a trailing space was removed from one line.<br>
<br>
Signed-off-by: Oleg Polyakov &lt;<a href=3D"mailto:Oleg.Polyakov@windriver.=
com" target=3D"_blank">Oleg.Polyakov@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../vim/{<a href=3D"http://vim-tiny_8.1.1518.bb" rel=3D"noreferrer" t=
arget=3D"_blank">vim-tiny_8.1.1518.bb</a> =3D&gt; <a href=3D"http://vim-tin=
y_8.2.0.bb" rel=3D"noreferrer" target=3D"_blank">vim-tiny_8.2.0.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +=
+--<br>
=C2=A0meta/recipes-support/vim/{<a href=3D"http://vim_8.1.1518.bb" rel=3D"n=
oreferrer" target=3D"_blank">vim_8.1.1518.bb</a> =3D&gt; <a href=3D"http://=
vim_8.2.0.bb" rel=3D"noreferrer" target=3D"_blank">vim_8.2.0.bb</a>}=C2=A0 =
=C2=A0 | 0<br>
=C2=A03 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/vim/{<a href=3D"http://vim-tiny_8.1.1518.=
bb" rel=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1518.bb</a> =3D&gt; <=
a href=3D"http://vim-tiny_8.2.0.bb" rel=3D"noreferrer" target=3D"_blank">vi=
m-tiny_8.2.0.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-support/vim/{<a href=3D"http://vim_8.1.1518.bb" r=
el=3D"noreferrer" target=3D"_blank">vim_8.1.1518.bb</a> =3D&gt; <a href=3D"=
http://vim_8.2.0.bb" rel=3D"noreferrer" target=3D"_blank">vim_8.2.0.bb</a>}=
 (100%)<br>
<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1518.b=
b" rel=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1518.bb</a> b/meta/rec=
ipes-support/vim/<a href=3D"http://vim-tiny_8.2.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">vim-tiny_8.2.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1518.bb=
" rel=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1518.bb</a><br>
rename to meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny_8.2.0.bb</a><br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index 5a1bea6985..e0673a7810 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -5,14 +5,14 @@ DEPENDS =3D &quot;ncurses gettext-native&quot;<br>
=C2=A0# vimdiff doesn&#39;t like busybox diff<br>
=C2=A0RSUGGESTS_${PN} =3D &quot;diffutils&quot;<br>
=C2=A0LICENSE =3D &quot;vim&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://runtime/doc/uganda.txt;endline=3D287;md5=
=3Df1f82b42360005c70b8c19b0ef493f72&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://runtime/doc/uganda.txt;endline=3D287;md5=
=3Da19edd7ec70d573a005d9e509375a99a&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/vim.git" rel=
=3D"noreferrer" target=3D"_blank">github.com/vim/vim.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_acl_header_check.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vim-add-knob-whether-elf.h=
-are-checked.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-Makefile-improve-=
reproducibility.patch \<br>
=C2=A0&quot;<br>
-SRCREV =3D &quot;202d982b36d87cf91d992bd7e30d3223bdc72cd9&quot;<br>
+SRCREV =3D &quot;98056533b96b6b5d8849641de93185dd7bcadc44&quot;<br>
<br>
=C2=A0# Do not consider .z in x.y.z, as that is updated with every commit<b=
r>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+\.\d+)\.0&quot=
;<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim_8.1.1518.bb" re=
l=3D"noreferrer" target=3D"_blank">vim_8.1.1518.bb</a> b/meta/recipes-suppo=
rt/vim/<a href=3D"http://vim_8.2.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>vim_8.2.0.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-support/vim/<a href=3D"http://vim_8.1.1518.bb" rel=
=3D"noreferrer" target=3D"_blank">vim_8.1.1518.bb</a><br>
rename to meta/recipes-support/vim/<a href=3D"http://vim_8.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">vim_8.2.0.bb</a><br>
-- <br>
2.23.0<br>
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

--000000000000b0cf46059c31924e--
