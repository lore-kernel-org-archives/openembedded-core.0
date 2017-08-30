Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9884978250
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 10:54:36 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id p2so5891387ite.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JgbqdtK4pkPiybtqRCd4okUmhAZoCkTgPseJCGPKspI=;
	b=GU7MmhsbVOuplPp25eHWgvt2OWBHyMvR5cr7PnDXCtcA/dTixgfqS7QcVuwMCG6v8r
	kHIytgeNsPGgCsSnWIDXoWWalQfXjV4GgSk4wO9KvavzIE6wH5o8zHXbOIF3aAK7Q9kj
	NGVmKxhPzwaVWAMg9wpRHQsIXv06G+MEGpYclNWbeu3uWMQc0AWlX5opuc+zzDFwCkUk
	TEwL7SfRZG5oB0ICNMzraUHN8Ell7DmVsI+bW5bBxP7an3R2EjKCtLPqtzSNEBJn26Tk
	6xGXPMY+IE8/RDtzKSy6KRvP8vyAYVTj4q+YyjqMgVOnS/wwK2PUs5pB5EueVgIeabXU
	wU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JgbqdtK4pkPiybtqRCd4okUmhAZoCkTgPseJCGPKspI=;
	b=jHEk0J24tHEVUchpT3isaXvyG1coenNqQ4a2pNj85qszTRve8YJ677DR8NwO8WOBF4
	obVw9lxs0NByWfIb+wWwXq6fCnR4b/cTIM9bU4Afm0/MvSTWyzjayIPdgQmprBF7v/4X
	6KRy1QdSYhE01MhW/lHur4g6p/h6T1sQqRkgqINVoQBQ9kAOV53rXKTF8CJ0jk+/zvvX
	4MzfbQ4yUVl3CnG8GrEmyoTqB/wg8slsh0I7jof70O8dO5lmiC5E6mrOI1zBDhCYRckI
	scdj4R0ZVwkk8cKwXwgUKk50dba9o99QmuLDzMucHdS+2K7lt60mUO9iNRhRrL3s5xCJ
	7Gaw==
X-Gm-Message-State: AHYfb5jbUps7fgCZ7+SZOrGpzjSjliZaHHV3T4y7VZDFpMIJGUFe7Dx2
	2mkc1xg2GwhvmKcXg5GVUPUKtMf8o2mo
X-Received: by 10.36.224.197 with SMTP id c188mr1235196ith.18.1504090477678;
	Wed, 30 Aug 2017 03:54:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Wed, 30 Aug 2017 03:54:17 -0700 (PDT)
In-Reply-To: <1503990043-5633-1-git-send-email-hongxu.jia@windriver.com>
References: <1503990043-5633-1-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Aug 2017 11:54:17 +0100
Message-ID: <CAJTo0LYjm79455K_W2rcxAOFCDG8XcSbeAQAu-wyBwG1gNdjNQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: 2.1.23 -> 2.2.0
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
X-List-Received-Date: Wed, 30 Aug 2017 10:54:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c19e0f4a1e7b60557f65ad6"

--94eb2c19e0f4a1e7b60557f65ad6
Content-Type: text/plain; charset="UTF-8"

2.4 has reached feature freeze, is there anything security related in this
release that we should backport?

Ross

On 29 August 2017 at 08:00, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-support/gnupg/{gnupg_2.1.23.bb => gnupg_2.2.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/gnupg/{gnupg_2.1.23.bb => gnupg_2.2.0.bb}
> (91%)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.1.23.bb
> b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> similarity index 91%
> rename from meta/recipes-support/gnupg/gnupg_2.1.23.bb
> rename to meta/recipes-support/gnupg/gnupg_2.2.0.bb
> index 8cbe5e1..0176ddd 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.1.23.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
> @@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://0004-autogen.sh-fix-find-version-for-beta-checking.patch
> \
>            "
>
> -SRC_URI[md5sum] = "86c2304ead54b74a422e76c3f1bc7a91"
> -SRC_URI[sha256sum] = "a94476391595e9351f219188767a9d
> 6ea128e83be5ed3226a7890f49aa2d0d77"
> +SRC_URI[md5sum] = "789f16949fae2d003d387f49e9da4b74"
> +SRC_URI[sha256sum] = "d4514a0be0f7a1ff263193330019eb
> 4b53c82f0f5e230af3c14df371271a45e6"
>
>  EXTRA_OECONF = "--disable-ldap \
>                 --disable-ccid-driver \
> --
> 2.8.1
>
>

--94eb2c19e0f4a1e7b60557f65ad6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2.4 has reached feature freeze, is there anything security=
 related in this release that we should backport?<div><br></div><div>Ross</=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 29 A=
ugust 2017 at 08:00, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:hon=
gxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><a href=3D"https://lists.gnu=
pg.org/pipermail/gnupg-announce/2017q3/000413.html" rel=3D"noreferrer" targ=
et=3D"_blank">https://lists.gnupg.org/<wbr>pipermail/gnupg-announce/<wbr>20=
17q3/000413.html</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.1.23.bb" rel=3D=
"noreferrer" target=3D"_blank">gn<wbr>upg_2.1.23.bb</a> =3D&gt; <a href=3D"=
http://gnupg_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.2.0.bb<=
/a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.1.23.bb"=
 rel=3D"noreferrer" target=3D"_blank">gn<wbr>upg_2.1.23.bb</a> =3D&gt; <a h=
ref=3D"http://gnupg_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.=
2.0.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.1.23.bb" =
rel=3D"noreferrer" target=3D"_blank">g<wbr>nupg_2.1.23.bb</a> b/meta/recipe=
s-support/gnupg/<a href=3D"http://gnupg_2.2.0.bb" rel=3D"noreferrer" target=
=3D"_blank">g<wbr>nupg_2.2.0.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.1.23.bb" r=
el=3D"noreferrer" target=3D"_blank">gnu<wbr>pg_2.1.23.bb</a><br>
rename to meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gnu<wbr>pg_2.2.0.bb</a><br>
index 8cbe5e1..0176ddd 100644<br>
--- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.1.23.bb" rel=3D"=
noreferrer" target=3D"_blank">g<wbr>nupg_2.1.23.bb</a><br>
+++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">g<wbr>nupg_2.2.0.bb</a><br>
@@ -16,8 +16,8 @@ SRC_URI =3D &quot;${GNUPG_MIRROR}/${BPN}/${BPN}<wbr>-${PV=
}.tar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-autogen.sh-fix-<wbr>f=
ind-version-for-beta-<wbr>checking.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>86c2304ead54b74a422e76c3f1bc7a<wbr>91&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>a94476391595e9351f219188767a9d<wbr>6ea12=
8e83be5ed3226a7890f49aa2d<wbr>0d77&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>789f16949fae2d003d387f49e9da4b<wbr>74&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>d4514a0be0f7a1ff263193330019eb<wbr>4b53c=
82f0f5e230af3c14df371271a<wbr>45e6&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-ldap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-ccid-driv=
er \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c19e0f4a1e7b60557f65ad6--
