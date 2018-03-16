Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id B156D78866
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 23:01:07 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id k22-v6so5906106pls.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 16:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E1pOiyUEKYsaUQg7/HoZVWhhtuBF7+PVWqdoD7jByD8=;
	b=vgvAuz3nnvQZ+mnGBLNZP87M41hcNvr/o7jeE2xklUcwt39O0Uu5p3V1UbsEHsYdtn
	ffn5zXO3vFD0ckaWL02cqXcrX/FczW9NvQDiayun+3HmwQeB9m66nwAFnvEqOpP4Qpsd
	wgABmEvxASC/RgeZOKN8TJ6GXtRytaRGC2llUvjVURpJmQ5AAIcmyDl4VhEWHo9Qd9xu
	vqMfjgNb1esbzeO4d8UmnJqDhyDiWOZzDByl/Gcu/9z/+/0c6qHKA6LHdJiynRDd5Y+j
	QyV8uYyqJ5vBcSZjW9koV17Fyjals9iGUfFlnHKj7RYs0Vxn7IiJR5EwAvDdBzhTOpSD
	yZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E1pOiyUEKYsaUQg7/HoZVWhhtuBF7+PVWqdoD7jByD8=;
	b=jivTsnKHF2yix+pAa+zyKV1Sds5U/QkScnaZYT0MvZmjSf7tl8F4/+wO8+Q3pXMZL0
	n4FkgG5WpS6j/e2d4GBfLufmWZ5bD7ZUPilZeYAQcFri9StwZzE+gRaFlqoFcKXoO6O4
	S9XRUYuf+5z+Y0/cziBNUn+9IIrndLGiYUQcb8skwe1KTYBLlf2nUXCgh1ma+BTZJgXY
	4InZfA+0nqNrmpj9uDvaeufb4wGKUyrR6PC2nPuQsJLZv5JcPzFgoZ49ANCokzBRUytP
	hdvRiMknLeclVHoWbVO6JkBuX7oLyDjfuXUM4f20nBTvBGZu2ZEHwG53mNyNWo96/dbd
	Vljw==
X-Gm-Message-State: AElRT7GyK8VyqwLZQr3Wc7K27CgtRJkSBFtQjv6XFdd1OS2dVr48XuVk
	XC52iI5Pg6bYzjgA9Cvp/RC3L1U7V3QLypyY+Vc=
X-Google-Smtp-Source: AG47ELv4yCkk1oUKHXmRDJJVSk5GA45gMbXL7z5umw4m6B8riOJPBd3Zc/99Ypqq/7OnkX0nPcOZusyK8DUUm8wFmuw=
X-Received: by 2002:a17:902:158b:: with SMTP id
	m11-v6mr3778134pla.300.1521241268435; 
	Fri, 16 Mar 2018 16:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <CY1PR02MB115262F14464BB959F555708A3D70@CY1PR02MB1152.namprd02.prod.outlook.com>
In-Reply-To: <CY1PR02MB115262F14464BB959F555708A3D70@CY1PR02MB1152.namprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Mar 2018 23:00:57 +0000
Message-ID: <CAMKF1sqpRjw=m59+W1cwPUOTQ0ovDq8HY00BS1-3_in72RHmQg@mail.gmail.com>
To: Cuero Bugot <cbugot@sierrawireless.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: add variables to the whitelist so that it does not re-triger recipe parsing
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
X-List-Received-Date: Fri, 16 Mar 2018 23:01:07 -0000
Content-Type: multipart/alternative; boundary="0000000000006c401505678f9529"

--0000000000006c401505678f9529
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 16, 2018 at 10:31 AM Cuero Bugot <cbugot@sierrawireless.com>
wrote:

> When uninative is activated (poky's default) internal datastore variables
> are modified (NATIVELSBSTRING and SSTATEPOSTUNPACKFUNCS) to enable uninative
> support. This is happening after parsing is done at the beginning of the
> build. On the next bitbake call the recipe would be parsed if the two
> variables above were not added to the parsing whitelist
> BB_HASHCONFIG_WHITELIST.
>
> The fix is to add these two variables to the recipe parsing whitelist
> BB_HASHCONFIG_WHITELIST, this is done at recipe parsing time, only when
> uninative.bbclass is used.


It seems you have a case where data is already parsed and then uninstive is
enabled after this the reparse is happening. Or is it always happening when
uninative is enabled

>
>
> Signed-off-by: Cuero Bugot <cbugot@sierrawireless.com>
> ---
>  meta/classes/uninative.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/uninative.bbclass
> b/meta/classes/uninative.bbclass
> index 8f34483..d1fdbc8 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -8,6 +8,9 @@ UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
>  #UNINATIVE_CHECKSUM[x86_64] = "dead"
>  UNINATIVE_DLDIR ?= "${DL_DIR}/uninative/"
>
> +# Enabling uninative will change the following variables so they need to
> go the parsing white list to prevent multiple recipe parsing
> +BB_HASHCONFIG_WHITELIST += "NATIVELSBSTRING SSTATEPOSTUNPACKFUNCS"
> +
>  addhandler uninative_event_fetchloader
>  uninative_event_fetchloader[eventmask] = "bb.event.BuildStarted"
>
> --
> 2.7.4
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006c401505678f9529
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Mar 16, 2018 =
at 10:31 AM Cuero Bugot &lt;<a href=3D"mailto:cbugot@sierrawireless.com">cb=
ugot@sierrawireless.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">When uninative is activated (poky&#39;s default) internal datastore var=
iables are modified (NATIVELSBSTRING and SSTATEPOSTUNPACKFUNCS) to enable u=
ninative<br>
support. This is happening after parsing is done at the beginning of the bu=
ild. On the next bitbake call the recipe would be parsed if the two<br>
variables above were not added to the parsing whitelist BB_HASHCONFIG_WHITE=
LIST.<br>
<br>
The fix is to add these two variables to the recipe parsing whitelist BB_HA=
SHCONFIG_WHITELIST, this is done at recipe parsing time, only when<br>
uninative.bbclass is used.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">It seems you have a case where data is already parsed and then un=
instive is enabled after this the reparse is happening. Or is it always hap=
pening when uninative is enabled=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<br>
<br>
Signed-off-by: Cuero Bugot &lt;<a href=3D"mailto:cbugot@sierrawireless.com"=
 target=3D"_blank">cbugot@sierrawireless.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/uninative.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclas=
s<br>
index 8f34483..d1fdbc8 100644<br>
--- a/meta/classes/uninative.bbclass<br>
+++ b/meta/classes/uninative.bbclass<br>
@@ -8,6 +8,9 @@ UNINATIVE_TARBALL ?=3D &quot;${BUILD_ARCH}-nativesdk-libc.t=
ar.bz2&quot;<br>
=C2=A0#UNINATIVE_CHECKSUM[x86_64] =3D &quot;dead&quot;<br>
=C2=A0UNINATIVE_DLDIR ?=3D &quot;${DL_DIR}/uninative/&quot;<br>
<br>
+# Enabling uninative will change the following variables so they need to g=
o the parsing white list to prevent multiple recipe parsing<br>
+BB_HASHCONFIG_WHITELIST +=3D &quot;NATIVELSBSTRING SSTATEPOSTUNPACKFUNCS&q=
uot;<br>
+<br>
=C2=A0addhandler uninative_event_fetchloader<br>
=C2=A0uninative_event_fetchloader[eventmask] =3D &quot;bb.event.BuildStarte=
d&quot;<br>
<br>
--<br>
2.7.4<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000006c401505678f9529--
