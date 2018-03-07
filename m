Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 92A487896E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 08:38:24 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id w19so15456847ite.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 00:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/q8g5awY+/1z3cp1mqAYW7BB/zO1iMR50npGWSjdUTI=;
	b=gbqGBTGJXN4ZeiTXQL4Zpx9xxThAfxkvZ4cLcreve8M9wffYe7cUnezlFGMJnml5as
	MknrpjWDBWzH/1iEuVjU8Hw4RI8xtYRAsumXtbyruWf4VlV0dxl8MTEw4dgDVU3RMAeR
	SHJKleZCMU4nSFo/F5P+BfUN55XYF6nFseAkVAkU8BhzHmGBMT/52UKkV33+UFrLSbCS
	Ylr22z6T/aSIXl37GaK+XIxPrZszm69/2rHWVBzoUwlTtsnJY5BU34u7BXcdAh0GuX99
	4bH/p3x//+HfP6d68puH0F226sokHmLDqKmyFwrZAOWhsliOXA48ENFoADeHntrOxg8E
	4+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/q8g5awY+/1z3cp1mqAYW7BB/zO1iMR50npGWSjdUTI=;
	b=KJo/c8/YrO2HVHXoIXeZHLJa21zmJGzH73hK02yNsUjeFbz6LTflZ1hAaYwuMhMm6N
	neXRt4bqHyqZwp5m2NHotI6pFGk25d6TqyD1zi99qa2b+JgSWr/FaNeuCapBcaXx1YdW
	x61q2EnSzRPils4OEzg2sGR34IfZLmnPg9gJDtssHK2SvFBj9MU0nnOjGl/Kfdah/v8X
	Ot9+RpJ8/cpqOsmitKkhdyBoyweerV9afQDdzJOtbmqrujxK8gICgAhS+4LkqLTQRob4
	kvC/a75KJnmBir7Zgmac9Lp9JuY2ZZuraoHFz+wRHqn4N08B4OEiM1U8ufftl2Wnsf8T
	sTvw==
X-Gm-Message-State: AElRT7E7GvxokHjy8hpw1yB0XpbbPLFdJkRz7Bii0/yt7yojZJxvyA5B
	f9GEjShAsjRlOoifP9Jzd2GzsbMLMqdB4yMhxzGVnzID
X-Google-Smtp-Source: AG47ELvM2+YIVtwTzJujG7RDWCpB9k0IJwM7F/YZkNa9Me9be2i4p3LWzAwYoLT7cQngrMYjW8h47omqtCYqBqWD+mc=
X-Received: by 10.36.34.11 with SMTP id o11mr8005486ito.60.1520411906359; Wed,
	07 Mar 2018 00:38:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 7 Mar 2018 00:38:06 -0800 (PST)
In-Reply-To: <f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Mar 2018 08:38:06 +0000
Message-ID: <CAJTo0Lahsa_Bnzuw2yXQypkfk+qSVxmuPP1YAJUKw5euzocL4w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Wed, 07 Mar 2018 08:38:25 -0000
Content-Type: multipart/alternative; boundary="001a113f77ba975de90566ce7b54"

--001a113f77ba975de90566ce7b54
Content-Type: text/plain; charset="UTF-8"

On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
> index ae9e7691367d..1ccbf6283e43 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
> @@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.14.24"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine ?= "fccf7693fe5dd00d7b6d391b7405b5d58eb959f2"
> -SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
> +SRCREV_machine ?= "09828ddd8d8c91b2d68afdcd8eb99a48e0253582"
> +SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
>

ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0
do_fetch: Fetcher failure: Unable to find revision
09828ddd8d8c91b2d68afdcd8eb99a48e0253582 in branch
v4.14/standard/tiny/common-pc even from upstream
ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0
do_fetch: Fetcher failure for URL: 'git://
git.yoctoproject.org/linux-yocto.git;branch=v4.14/standard/tiny/common-pc;name=machine'.
Unable to fetch URL from any source.
ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09828ddd8d-r0
do_fetch: Function failed: base_do_fetch

Ross

--001a113f77ba975de90566ce7b54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 March 2018 at 18:11, Bruce Ashfield <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruc=
e.ashfield@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex">diff --git a/meta/recipes-ker=
nel/linux/<a href=3D"http://linux-yocto-tiny_4.14.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">li<wbr>nux-yocto-tiny_4.14.bb</a> b/meta/recipes-kernel/lin=
ux/<a href=3D"http://linux-yocto-tiny_4.14.bb" rel=3D"noreferrer" target=3D=
"_blank">li<wbr>nux-yocto-tiny_4.14.bb</a><br>
index ae9e7691367d..1ccbf6283e43 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.14.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.14.bb</a><br>
@@ -9,8 +9,8 @@ LINUX_VERSION ?=3D &quot;4.14.24&quot;<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-SRCREV_machine ?=3D &quot;<wbr>fccf7693fe5dd00d7b6d391b7405b5<wbr>d58eb959=
f2&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>426c8aa4862f95e84ec163b942b927<wbr>26d3ef978f&=
quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>09828ddd8d8c91b2d68afdcd8eb99a<wbr>48e02535=
82&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>54b3e9b768651ca15bf65ae1c72dfe<wbr>6d957285f0&=
quot;<br></blockquote><div><br>ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+5=
4b3e9b768_09828ddd8d-r0 do_fetch: Fetcher failure: Unable to find revision =
09828ddd8d8c91b2d68afdcd8eb99a48e0253582 in branch v4.14/standard/tiny/comm=
on-pc even from upstream<br>ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3=
e9b768_09828ddd8d-r0 do_fetch: Fetcher failure for URL: &#39;git://<a href=
=3D"http://git.yoctoproject.org/linux-yocto.git;branch=3Dv4.14/standard/tin=
y/common-pc;name=3Dmachine">git.yoctoproject.org/linux-yocto.git;branch=3Dv=
4.14/standard/tiny/common-pc;name=3Dmachine</a>&#39;. Unable to fetch URL f=
rom any source.<br>ERROR: linux-yocto-tiny-4.14.24+gitAUTOINC+54b3e9b768_09=
828ddd8d-r0 do_fetch: Function failed: base_do_fetch=C2=A0<br></div><div><b=
r></div><div>Ross</div></div></div></div>

--001a113f77ba975de90566ce7b54--
