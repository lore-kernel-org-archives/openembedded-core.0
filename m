Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0156B8AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:57:32 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id y126so1658881pfb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=k0Q2Htac1uXEKq0+pOYyCHvp8TLkyheaDuzKmFxt+gE=;
	b=QzpjR1TasmbKRIp3zKH/efHdw0ev4fdhIs3AtSeOFlM33b6ttZtVl+5fhJ8dnfKu0J
	UISf1E+bYzv9G1dghRoNQlLH4XiuWQl05uS3jQQ7ELqV4RbjjmtDwJL7vcj96U2kUdFZ
	MJ2NED0ZiTVcZgdqCQB4Y8MZ5piWaX1KQyI4JIbcUKfzPHNafYo+SLhthfGNXVMYyT7r
	XGh8f/kUU6Lm1c0Kcec2tObGKwVEVDvmVh2Iosn3ewRq2zusgwreajOwjDNqvnLZOMdp
	R0+OSuRuU28dADmcgtri7wC39Se04kEn7zBYYbAFGxX4Xw/zy6+ZZMp9Lf+1XBNj62zA
	g9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=k0Q2Htac1uXEKq0+pOYyCHvp8TLkyheaDuzKmFxt+gE=;
	b=HS0/x+S17ZrYzmnGuiTc8ZgsnsIIBuwsHyXlAwrRgyh2eJZXBkHP9JS3qvAEZO2C9f
	4+p63XIW5dTRXFQWTNsfoH1ZGVwa8TkTTOvYQXul9vwgPdsgv61ZbNVlMH7p7I4nFkbt
	QnDHSzWHc8sVZNWSILvbCv8W5AyeWZwFTUsB6pF0ZI40ZNzZ8FBMaVKHwMAz7A2gl66L
	ItlL6qTwDeiiFtboY3h2qFy8OZiSeIoVtufXe+qtQK/XhzlujrA1X7uktiF3Wfe8ExiI
	UTxFhqyTUbZfilzLY5O0wNnYRdyIFVSeKyNMk5LmtolnlTVALJHkiOKkxvrgCULdlqBH
	CAtw==
X-Gm-Message-State: AHQUAuZ/nyYRVMbBWeOqDjfRbw6EN5H9dxmDRcKSnVt0PHu+kCZvp6/x
	sHncLOdfct7VamNLDi91WQGv7qC0+uY=
X-Google-Smtp-Source: AHgI3IZgfb/LdUMS48BublG9iRPrLXN4fRoTsstlxFr/RR4Lm0fE9PUJ6zxBbJ9GuMLBlbuFCWzo9Q==
X-Received: by 2002:a63:e74b:: with SMTP id j11mr5127207pgk.397.1549382253348; 
	Tue, 05 Feb 2019 07:57:33 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:a556:75ec:241a:9733?
	([2601:202:4180:c33:a556:75ec:241a:9733])
	by smtp.gmail.com with ESMTPSA id
	x186sm4766389pfb.59.2019.02.05.07.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 07:57:32 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20190205025727.1937-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <464a0977-01e1-1845-ef2e-969391d51b3c@gmail.com>
Date: Tue, 5 Feb 2019 07:57:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190205025727.1937-1-raj.khem@gmail.com>
Subject: Re: [PATCH 1/6] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Tue, 05 Feb 2019 15:57:32 -0000
Content-Type: multipart/alternative;
	boundary="------------A9BCFA9EF6502F6E7AA9305F"
Content-Language: en-US

--------------A9BCFA9EF6502F6E7AA9305F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 2/4/19 6:57 PM, Khem Raj wrote:
> From: ayaka <ayaka@soulik.info>
>
> There are some addtional instructions apart from bare armv8,
> also there is armv8.1, armv8.2.
>
> Most the processor would support crc, except X-gene 1.

We have had these tune files sent by other folks in the past. Does this
settle all the questions from back then ?

It was sent couple months ago, you can find the discussion in various
threads, e.g.:
http://lists.openembedded.org/pipermail/openembedded-core/2015-October/11=
1318.html
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/1=
12907.html

http://lists.openembedded.org/pipermail/openembedded-core/2016-March/1185=
79.html

and more.

- armin

>
> Signed-off-by: Randy Li <ayaka@soulik.info>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>  meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++=

>  2 files changed, 28 insertions(+), 1 deletion(-)
>  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/m=
achine/include/arm/arch-armv8.inc
> deleted file mode 100644
> index 5e832fae6d..0000000000
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ /dev/null
> @@ -1 +0,0 @@
> -require conf/machine/include/arm/arch-arm64.inc
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/=
machine/include/arm/arch-armv8a.inc
> new file mode 100644
> index 0000000000..323d0d7f0f
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -0,0 +1,28 @@
> +DEFAULTTUNE ?=3D "armv8a-crc"
> +
> +TUNEVALID[armv8a] =3D "Enable instructions for ARMv8-a"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -m=
arch=3Darmv8-a', '', d)}"
> +TUNEVALID[simd] =3D "Enable instructions for ARMv8-a Advanced SIMD and=
 floating-point"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd=
', '', d)}"
> +TUNEVALID[crc] =3D "Enable instructions for ARMv8-a Cyclic Redundancy =
Check (CRC)"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc',=
 '', d)}"
> +TUNEVALID[crypto] =3D "Enable instructions for ARMv8-a cryptographic"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+cr=
ypto', '', d)}"
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a',=
 'armv8a:', '' ,d)}"
> +
> +require conf/machine/include/arm/arch-arm64.inc
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
> +ARMPKGARCH_tune-armv8a                    ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crypto             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-crypto         ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8a                  =3D "aarch64 armv8a simd"
> +TUNE_FEATURES_tune-armv8a-crc              =3D "${TUNE_FEATURES_tune-a=
rmv8a} crc"
> +TUNE_FEATURES_tune-armv8a-crypto           =3D "${TUNE_FEATURES_tune-a=
rmv8a} crypto"
> +TUNE_FEATURES_tune-armv8a-crc-crypto       =3D "${TUNE_FEATURES_tune-a=
rmv8a-crc} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a            =3D "aarch64 armv8a simd"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a-crc} crypto"


--------------A9BCFA9EF6502F6E7AA9305F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/4/19 6:57 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190205025727.1937-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: ayaka <a class="moz-txt-link-rfc2396E" href="mailto:ayaka@soulik.info">&lt;ayaka@soulik.info&gt;</a>

There are some addtional instructions apart from bare armv8,
also there is armv8.1, armv8.2.

Most the processor would support crc, except X-gene 1.</pre>
    </blockquote>
    <br>
    We have had these tune files sent by other folks in the past. Does
    this settle all the questions from back then ?<br>
    <br>
    <pre>It was sent couple months ago, you can find the discussion in various
threads, e.g.:
<a href="http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111318.html">http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111318.html</a>
<a href="http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112907.html">http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112907.html</a>

<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118579.html">http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118579.html</a>

and more.

- armin
</pre>
    <blockquote type="cite"
      cite="mid:20190205025727.1937-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Randy Li <a class="moz-txt-link-rfc2396E" href="mailto:ayaka@soulik.info">&lt;ayaka@soulik.info&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
deleted file mode 100644
index 5e832fae6d..0000000000
--- a/meta/conf/machine/include/arm/arch-armv8.inc
+++ /dev/null
@@ -1 +0,0 @@
-require conf/machine/include/arm/arch-arm64.inc
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
new file mode 100644
index 0000000000..323d0d7f0f
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -0,0 +1,28 @@
+DEFAULTTUNE ?= "armv8a-crc"
+
+TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
+TUNE_CCARGS .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','armv8a','-march=armv8-a','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"</a>
+TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
+TUNE_CCARGS .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','simd','+simd','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"</a>
+TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
+TUNE_CCARGS .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','crc','+crc','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"</a>
+TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
+TUNE_CCARGS .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','crypto','+crypto','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"</a>
+MACHINEOVERRIDES =. <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','armv8a','armv8a:','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"</a>
+
+require conf/machine/include/arm/arch-arm64.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
+ARMPKGARCH_tune-armv8a                    ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
+TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a simd"
+TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
+TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
+TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------A9BCFA9EF6502F6E7AA9305F--
