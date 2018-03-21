Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 773DB78962
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:25:13 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id d5so6001923iob.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YZ1HOIbdC18E1l0UhsSZpZ0OUaMGTsYh+Qkyp7/H+1Q=;
	b=vntzdZYauuXB9jYlIaaOS/CtgE2XDjHnPcWCOixOLKwATxeP1yezRAM6EP23I+VQcC
	RbuOK6jIHPlQmcvNfGp3PkYSQ0r5+G++pci1EtJMLzfzJ1EMk64B6u0aE33WrZb+y/g+
	A0S+/ZwfPgB02cvTLQ2VkujrPopE6IIkKI4qJb02pn4bUA0ZtrQYADPxqKVj12vaOx2O
	F9SN3Qf+XOCyzZGZvAgX7qGXMdJrhh19VWnB/hIBtamvKA+ba9HeI+5hgcOHfSzyZm0w
	gJfCNo39VnHHZvyMaGCvujGHq0L1Mka9UmkiyDrqb/AIIYoBPMsgaItOkw5mQSx1X6pW
	wO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YZ1HOIbdC18E1l0UhsSZpZ0OUaMGTsYh+Qkyp7/H+1Q=;
	b=BI00RCMiIQKIeMjI+aZEfqGWQgcK3lnpRPYQXZAY0mubU6UKIXv9k92PIBuMq/58v0
	/8mv5ljoUaxFRgtXBKfe4NDFdo5HLWPidaxDjJR1jA8GXvR3yk/xBXYAQwaPtqCK5ePP
	TGfsWdthoy5vm8eIpLPLRo8t1dHsqpsr/lciyo/ViZmjkQtQ32vVy9huuDE/RPtq42xs
	21Sr71Yrxhu1fiNka2A5x4txjjeAt6uPv0MBHnTcHZ4gQCP2pCIJoR2SUzK1SayVEVrU
	6IEHcttJA3VOBW8wngN8FxWpk1rlSl3A0DY2n3hOrwd49hjgc5gURV/IX82Wkxbbg+Zj
	duCg==
X-Gm-Message-State: AElRT7GGj/RqtjtZSgRy72zdwe9GnfbD3dQNJenjFtn8Chv4zPC9ShGP
	fKKTM57GPtNbnMiqc0NVJNWV8KpzoLUz4SiKqWvjDQ==
X-Google-Smtp-Source: AG47ELs4rMQ/q7xj1luy3TI643lA28LTgrfB0SZltOaXLF3CC8Ca40zmM5hP/gjDRVcF8HTqBzpw0TONQJ7cEAot/kk=
X-Received: by 10.107.161.200 with SMTP id k191mr18929670ioe.270.1521627915501;
	Wed, 21 Mar 2018 03:25:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 03:24:55 -0700 (PDT)
In-Reply-To: <1521603213-34824-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603213-34824-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 10:24:55 +0000
Message-ID: <CAJTo0LYKVpDM0aOTd3QwUC1OnkPusRdko4BrcvD4_Zd6x52Fcg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools: 38.5.2 -> 39.0.1
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
X-List-Received-Date: Wed, 21 Mar 2018 10:25:14 -0000
Content-Type: multipart/alternative; boundary="001a113e91986264b40567e99b34"

--001a113e91986264b40567e99b34
Content-Type: text/plain; charset="UTF-8"

The 39.0.0 upgrade has already been merged, and this will break
python3-setuptools.

On 21 March 2018 at 03:33, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> Upgrade python-setuptools from 38.5.2 to 39.0.1.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc                    |
> 4 ++--
>  .../{python-setuptools_38.5.2.bb => python-setuptools_39.0.1.bb}      | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-setuptools_38.5.2.bb =>
> python-setuptools_39.0.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index b5bd8cc..c5eb4a5 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT = "zip"
>
>  inherit pypi
>
> -SRC_URI[md5sum] = "b4c7f29c8079bdf2f0f355cdcd999e69"
> -SRC_URI[sha256sum] = "8246123e984cadf687163bdcd1bb58
> eb325e2891b066e1f0224728a41c8d9064"
> +SRC_URI[md5sum] = "75310b72ca0ab4e673bf7679f69d7a62"
> +SRC_URI[sha256sum] = "bec7badf0f60e7fc8153fac47836ed
> c41b74e5d541d7692e614e635720d6a7c7"
>
>  DEPENDS += "${PYTHON_PN}"
>  DEPENDS_class-native += "${PYTHON_PN}-native"
> diff --git a/meta/recipes-devtools/python/python-setuptools_38.5.2.bb
> b/meta/recipes-devtools/python/python-setuptools_39.0.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-setuptools_38.5.2.bb
> rename to meta/recipes-devtools/python/python-setuptools_39.0.1.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113e91986264b40567e99b34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The 39.0.0 upgrade has already been merged, and this will =
break python3-setuptools.</div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 21 March 2018 at 03:33, Huang Qiyu <span dir=3D"ltr">&lt;<=
a href=3D"mailto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fns=
t@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Up=
grade python-setuptools from 38.5.2 to 39.0.1.<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-setuptools.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0.../{<a href=3D"http://python-setuptools_38.5.2.bb" rel=3D"noreferrer=
" target=3D"_blank">python-setuptools_38.5.2.<wbr>bb</a> =3D&gt; <a href=3D=
"http://python-setuptools_39.0.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-setuptools_39.0.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python-setupto=
ols_38.5.2.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>python-setuptools_=
38.5.2.bb</a> =3D&gt; <a href=3D"http://python-setuptools_39.0.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python-setuptools_39.0.1.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/python-setuptools.inc b/meta=
/recipes-devtools/<wbr>python/python-setuptools.inc<br>
index b5bd8cc..c5eb4a5 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python-setuptools.inc<br>
+++ b/meta/recipes-devtools/<wbr>python/python-setuptools.inc<br>
@@ -9,8 +9,8 @@ PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
<br>
=C2=A0inherit pypi<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>b4c7f29c8079bdf2f0f355cdcd999e<wbr>69&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>8246123e984cadf687163bdcd1bb58<wbr>eb325=
e2891b066e1f0224728a41c8d<wbr>9064&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>75310b72ca0ab4e673bf7679f69d7a<wbr>62&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>bec7badf0f60e7fc8153fac47836ed<wbr>c41b7=
4e5d541d7692e614e635720d6<wbr>a7c7&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${PYTHON_PN}&quot;<br>
=C2=A0DEPENDS_class-native +=3D &quot;${PYTHON_PN}-native&quot;<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python-set=
uptools_38.5.2.bb" rel=3D"noreferrer" target=3D"_blank">python-setuptools_3=
8.5.<wbr>2.bb</a> b/meta/recipes-devtools/<wbr>python/<a href=3D"http://pyt=
hon-setuptools_39.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python-setup=
tools_39.0.<wbr>1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python-setuptool=
s_38.5.2.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython-setuptools_38=
.5.2.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python-setuptools_=
39.0.1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython-setuptools_39.0=
.1.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113e91986264b40567e99b34--
