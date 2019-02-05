Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4345F7C3B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 17:37:30 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l11so4815400qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E2fF8mNRsby5pgXjYKSCLaNBVdojFWV8A06EGwLN1BQ=;
	b=Td6Dy5hLWYbIV7Lmw/v55thb/JIsg4dqK+GgYXljK801S8lOgs483nEVF2uFuFUC1T
	G35Q/r2K58qaj+FgCH2g6h97MaJfvPeQ+lcatrnO0jacByf0SnQcnMLXIaQq4Gl59Oo3
	vdOxyOEl9iKKGpOjUVLTEP7i6uM3dvCtBs0UoVvNKya3fwyc7YDd7oTrNV7kLi2DDa+K
	69QD7EHg1Z+RF8z61K412AJ2Vp6tQoVxmvULBXcZdk6tZ77fCumfag/WbReuUeUOxLRf
	ulfRWPtapIu7QtI53Dz1E3z/z3164F0BSKNq09o2eG2kvtZwHSI34oBURGMXf2R6D/ng
	y43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E2fF8mNRsby5pgXjYKSCLaNBVdojFWV8A06EGwLN1BQ=;
	b=oDw8GFq9UnNyW1ZFUzGigTmtfv5VGZKdpWJTbH2zI/+7pODSRqbhxjkLuNQyAPLkSR
	KpslOGeBSfH6McWKJJLUS8ljW4oWSwe4a3wutGcRpK02ft5vnGkQ9OIIcDeTSv7upr08
	rgIyMW7uiAQuw+YBaHkwf3f42Nubv94FyuQvB/AvlaObXRLUGkjYtTxfPj5ZawwUhvHx
	AzCYlEkOZjMb3WO00W21rtnS8O8ddyUYsVAl5ka3dxxqH6x699XeI9YHGvLtEl3lb/mk
	nNccNE3dNkHmkDQOHQkCPUbES9h21IHpi8sDIJwLexAtKMkss1FHt8Y42nmo8Nfquynn
	QAHQ==
X-Gm-Message-State: AHQUAuafdQioW9VsgPvfDElSj6jIepj09ePfo4KTswI3cfKYNkLrtGtv
	zSSHJ4k47J8TAuRKUP4iSzMp4rTK8hyy/KPHUHY=
X-Google-Smtp-Source: AHgI3IYBf5JxZqlpLy67jWK6TdsM3qFSSPtIXuY7w4BUfbDlpLenDJWWAFHJBzcQ5LLz4qwcYrehutA38gW+BfCieFY=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr4750853qva.50.1549388250709; 
	Tue, 05 Feb 2019 09:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20190205025727.1937-1-raj.khem@gmail.com>
	<464a0977-01e1-1845-ef2e-969391d51b3c@gmail.com>
In-Reply-To: <464a0977-01e1-1845-ef2e-969391d51b3c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Feb 2019 09:37:04 -0800
Message-ID: <CAMKF1sqzfqq7s9Jh6gO2MjFa-e=U=8hhoxVeeKTF4_1mOZd0jg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 05 Feb 2019 17:37:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 5, 2019 at 7:57 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 2/4/19 6:57 PM, Khem Raj wrote:
>
> From: ayaka <ayaka@soulik.info>
>
> There are some addtional instructions apart from bare armv8,
> also there is armv8.1, armv8.2.
>
> Most the processor would support crc, except X-gene 1.
>
>
> We have had these tune files sent by other folks in the past. Does this settle all the questions from back then ?
>
> It was sent couple months ago, you can find the discussion in various
> threads, e.g.:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111318.html
> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112907.html
>

these are not relevant here.

> http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118579.html
>

This I have looked at. Eventually, I plan to add aarch32 bit tunes as well
for now, I just want to make aarch64 piece look good with option to
have aarch32 in mind, if there are specific questions I would be
interested to here

> and more.
>
> - armin
>
> Signed-off-by: Randy Li <ayaka@soulik.info>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>  meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
> deleted file mode 100644
> index 5e832fae6d..0000000000
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ /dev/null
> @@ -1 +0,0 @@
> -require conf/machine/include/arm/arch-arm64.inc
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
> new file mode 100644
> index 0000000000..323d0d7f0f
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -0,0 +1,28 @@
> +DEFAULTTUNE ?= "armv8a-crc"
> +
> +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
> +TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
> +TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
> +TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
> +
> +require conf/machine/include/arm/arch-arm64.inc
> +
> +# Little Endian base configs
> +AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
> +ARMPKGARCH_tune-armv8a                    ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
> +TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a simd"
> +TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
> +TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
> +TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
>
>

