Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9AA74F9A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 02:33:32 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id v135-v6so12589653lfa.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 19:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2Kh6faE1R3hHyxtm1XVenqc5U/RAmD5LX2Ywe4h6C0Q=;
	b=PeuniW4u4ePVJ85/JvTP0NnsAsoXQ8sj12AYryezJk2Mp2PO1ihDASITTISzM3SDtT
	RQ63dWhAduE4b5ln7U/gaC9c/SsxIZvxuyhytd02/nK9U46274QFw5lNY6zFAxif7QBf
	UiAUV0o+7wZo1GyzFPgLeMjkLG+aVFbInkB2R8oSdMUG8ssl8564HwSOJyajQqNKqTDq
	pB3QNuYC+xfQ3QC0aYLStyUct7mhU36wVhfAi3+w2EfivYaQlbfuDvVbvvA7Gu9IVAmJ
	l04d86yIbbvjwcSq/trImBC9zhAzMPfdYx/0Qs59NmGV7FSml/8iz36oSqHFkjdSJzez
	xQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2Kh6faE1R3hHyxtm1XVenqc5U/RAmD5LX2Ywe4h6C0Q=;
	b=SzZWiSU5dxolUB7ygFOdY4M1md222eBEjSm5x2FpgxCU/02BSazKIpQ7KBEARMWciL
	dLZb6gurpzhS9ioZBx8QtGMLecekeBAu2fojUMnw7wBfQVxOSBK8JijijpvWYH9DZbG0
	/JWZYG3z7OM2Cc1g2YSsOg0avGf44xRut0LJgS1RWUC88j1pthYwUVmGPFOyEoGjMMzw
	IjOYEpXMHjbe7UOSFV3ikHCtRVcLX6ijIYtQlq2uTcioi1/JhlKhd3BarwihVmlEHrXG
	szNz+avM2KXViB9pfiOOo7kb+KgDkZboY60+KZXXMuci3nOoxcISxJyL7WKal+r8LD5w
	CFVA==
X-Gm-Message-State: ALKqPwfFt96ZCzEFU+LrXzQOROAs/84Kl1rI6jVbtA8JcfEc+QrUpvbo
	5I2xn7/itsHfqTZzHjBwoHNdeLUDtwbH4U6fjwY=
X-Google-Smtp-Source: ADUXVKLH0LwROn/7psXrhIoRfCZhcmQWpR4woSJkArGNX1w09nCgfxHJw93Vf0HT9yZoG/KiJh9rU3R0g0lJA0cw7k4=
X-Received: by 2002:a19:7316:: with SMTP id o22-v6mr4979391lfc.6.1527820412897;
	Thu, 31 May 2018 19:33:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Thu, 31 May 2018 19:33:32
	-0700 (PDT)
In-Reply-To: <1527808243-20215-1-git-send-email-armccurdy@gmail.com>
References: <1527808243-20215-1-git-send-email-armccurdy@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 31 May 2018 22:33:32 -0400
Message-ID: <CAHUNapTnTwLQ9poPWHCp9PEEjaLZUKikxPE_H7on5uL5xB5OFQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	meta-intel <meta-intel@yoctoproject.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-i586-nlp.inc: drop tuning file for Intel Quark/X1000 CPU
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
X-List-Received-Date: Fri, 01 Jun 2018 02:33:32 -0000
Content-Type: multipart/alternative; boundary="000000000000fdcf34056d8b68fd"

--000000000000fdcf34056d8b68fd
Content-Type: text/plain; charset="UTF-8"

Someone (maybe me??) needs to create a meta-intel-community in which to
capture these sorts of things. Just because Intel, officially, doesn't
support it, doesn't mean all the existing Galileos (and I think there's
another devboard that uses the Quark?) out there should lose support.

On Thu, May 31, 2018 at 7:10 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> The Quark machine was EOL'ed at the end of 2017 and all support for
> it has now been removed from meta-intel. Drop the associated tuning
> file from oe-core.
>
>   http://git.yoctoproject.org/cgit.cgi/meta-intel/commit/?id=
> 5dbc69e339588834317b632119717996584b0d6c
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/machine/include/tune-i586-nlp.inc | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 meta/conf/machine/include/tune-i586-nlp.inc
>
> diff --git a/meta/conf/machine/include/tune-i586-nlp.inc
> b/meta/conf/machine/include/tune-i586-nlp.inc
> deleted file mode 100644
> index 88e5903..0000000
> --- a/meta/conf/machine/include/tune-i586-nlp.inc
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# Settings for the GCC(1) cpu-type "quark":
> -#
> -#
> -#
> -DEFAULTTUNE ?= "i586-nlp-32"
> -
> -# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
> -require conf/machine/include/x86/arch-x86.inc
> -
> -# x86 with no lock prefix
> -TUNEVALID[i586-nlp] = "IA32 with Lock Prefix omitted"
> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'i586-nlp', '
> -march=i586 -Wa,-momit-lock-prefix=yes', '', d)}"
> -
> -# Quark tune feature
> -AVAILTUNES = "i586-nlp-32"
> -TUNE_FEATURES_tune-i586-nlp-32 = "${TUNE_FEATURES_tune-x86} i586-nlp"
> -BASE_LIB_tune-i586-nlp-32 = "lib"
> -TUNE_PKGARCH_tune-i586-nlp-32 = "i586-nlp-32"
> -PACKAGE_EXTRA_ARCHS_tune-i586-nlp-32 = "i586-nlp-32"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000fdcf34056d8b68fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">Someone (maybe me??) needs to cr=
eate a meta-intel-community in which to capture these sorts of things. Just=
 because Intel, officially, doesn&#39;t support it, doesn&#39;t mean all th=
e existing Galileos (and I think there&#39;s another devboard that uses the=
 Quark?) out there should lose support.</span><br></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Thu, May 31, 2018 at 7:10 PM, And=
re McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" tar=
get=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">The Quark machine was EOL&#39;ed at the end of 2017 and all=
 support for<br>
it has now been removed from meta-intel. Drop the associated tuning<br>
file from oe-core.<br>
<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/meta-intel/commit/?i=
d=3D5dbc69e339588834317b632119717996584b0d6c" rel=3D"noreferrer" target=3D"=
_blank">http://git.yoctoproject.org/<wbr>cgit.cgi/meta-intel/commit/?<wbr>i=
d=3D<wbr>5dbc69e339588834317b6321197179<wbr>96584b0d6c</a><br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">arm=
ccurdy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/<wbr>tune-i586-nlp.inc | 19 ---------------=
----<br>
=C2=A01 file changed, 19 deletions(-)<br>
=C2=A0delete mode 100644 meta/conf/machine/include/<wbr>tune-i586-nlp.inc<b=
r>
<br>
diff --git a/meta/conf/machine/include/<wbr>tune-i586-nlp.inc b/meta/conf/m=
achine/include/<wbr>tune-i586-nlp.inc<br>
deleted file mode 100644<br>
index 88e5903..0000000<br>
--- a/meta/conf/machine/include/<wbr>tune-i586-nlp.inc<br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-# Settings for the GCC(1) cpu-type &quot;quark&quot;:<br>
-#<br>
-#<br>
-#<br>
-DEFAULTTUNE ?=3D &quot;i586-nlp-32&quot;<br>
-<br>
-# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS<br>
-require conf/machine/include/x86/arch-<wbr>x86.inc<br>
-<br>
-# x86 with no lock prefix<br>
-TUNEVALID[i586-nlp] =3D &quot;IA32 with Lock Prefix omitted&quot;<br>
-TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_<wbr>FEATURES&#39;, =
&#39;i586-nlp&#39;, &#39; -march=3Di586 -Wa,-momit-lock-prefix=3Dyes&#39;, =
&#39;&#39;, d)}&quot;<br>
-<br>
-# Quark tune feature<br>
-AVAILTUNES =3D &quot;i586-nlp-32&quot;<br>
-TUNE_FEATURES_tune-i586-nlp-<wbr>32 =3D &quot;${TUNE_FEATURES_tune-x86} i5=
86-nlp&quot;<br>
-BASE_LIB_tune-i586-nlp-32 =3D &quot;lib&quot;<br>
-TUNE_PKGARCH_tune-i586-nlp-32 =3D &quot;i586-nlp-32&quot;<br>
-PACKAGE_EXTRA_ARCHS_tune-<wbr>i586-nlp-32 =3D &quot;i586-nlp-32&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
1.9.1<br>
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

--000000000000fdcf34056d8b68fd--
