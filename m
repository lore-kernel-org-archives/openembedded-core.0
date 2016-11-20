Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1737A6B6F7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 19:37:44 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 50so23343849uae.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 11:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NEUkDEFq/rR9nz+XKgYhcvOFieihHZn/6sds9hWnSxg=;
	b=JVYODU5mi69JW+O6GQ4k4DdQ8hLCU4shsBXZNLOGIs1kxC4pbXMehiCO2jA/miT1jy
	9XBulm2fDZ217ov2Z1PG7mf1DpejpwWKNfh5cc/7tSKzbJnFtWY3jpBsM+mFdML2o33O
	jhGanu8HrTgdvOkc2I+rGM9lbJlUC50LMzLPc7b/xnwPJyl1WR+auASwwQaUlogkfd+L
	wBcj3PmusQV3KMe+32pd0da9WPNjnPLwe3/AOL7zQ7lRCliGJuiuUAXaltQo0rOn7XTH
	JHCH+MjsrI8jnsQm34nrvSvwBqAVDD9wqgKYl14nwLs33eviaeuC6h7cPhfnbVxkHaGp
	MDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NEUkDEFq/rR9nz+XKgYhcvOFieihHZn/6sds9hWnSxg=;
	b=F/p/bTrqWtycE9W2t+SaAbawhfAvP8b/wRJKN1JApE5DMmCKMPvbUwJ/5txFCca7jq
	uafP/M85WGyYGjZ4ZDfNK/3Q0eBW971qufKnm17MIDiidlQqkVmwouvstedIOsGufYry
	wTdWoYFugznpWXylWlSsy36iS5vyyZFaza8+u4qWlF4oEWMNl4xaYIBNmfkL87rTLyGN
	Tces9pCJ4oIjHYCgytpNN4wWTfu1YvxvP3znhk4BJ0r7HMt0GhymeJciVa5zvbj4LVGc
	4Din3RVX222xtkU9VNehZ37vfcRta83RqRaeVjJrVBR8Gun7o/wZ5VMkf5L6MXEXOEES
	FMcw==
X-Gm-Message-State: AKaTC007/kY8zk+fQci9zS9SdZgmBisdYcl4YhrDx448qJHpyGZDKx2zoS6qiQInIQw1vzMsFhc+/WMDju2V7Q==
X-Received: by 10.159.32.99 with SMTP id 90mr4459845uam.138.1479670666062;
	Sun, 20 Nov 2016 11:37:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sun, 20 Nov 2016 11:37:15 -0800 (PST)
In-Reply-To: <1479643823-11675-3-git-send-email-herve.jourdain@neuf.fr>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
	<1479643823-11675-3-git-send-email-herve.jourdain@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Nov 2016 11:37:15 -0800
Message-ID: <CAMKF1sqhpWEsjXg-CSoYmrOvxXFHG7voCjAv78gbbV8_QG3v9Q@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] arch-armv8.inc: add support for 32bits armv8 options
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
X-List-Received-Date: Sun, 20 Nov 2016 19:37:45 -0000
Content-Type: text/plain; charset=UTF-8

I dont think we need these many variats for v8, axxia has been
carrying such patches locally.
see
https://github.com/axxia/meta-axxia/tree/master/conf/machine/include

On Sun, Nov 20, 2016 at 4:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc | 60 ++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
> index 5e832fa..8c96efc 100644
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
> @@ -1 +1,61 @@
>  require conf/machine/include/arm/arch-arm64.inc
> +
> +TUNEVALID[armv8] = "Enable instructions for ARMv8"
> +TUNECONFLICTS[armv8] = "armv4 armv5 armv6 armv7 armv7a armv7ve"
> +
> +TUNE_CCARGS .= \
> +"${@' -march=armv8-a+crypto+crc' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'cryptov8', 'crcv8' ], True, False, d) else\
> +' -march=armv8-a+crypto' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'cryptov8' ], True, False, d) else\
> +' -march=armv8-a+crc' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'crcv8' ], True, False, d) else \
> +bb.utils.contains('TUNE_FEATURES', 'armv8', ' -march=armv8-a', '', d)}"
> +
> +TUNE_CCARGS_MFPU .= \
> +"${@' crypto-neon-fp-armv8' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'neon', 'cryptov8' ], True, False, d) else \
> +' neon-fp-armv8' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'neon' ], True, False, d) else \
> +bb.utils.contains('TUNE_FEATURES', [ 'armv8' ], ' fp-armv8', '', d)}"
> +
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8', 'armv8:', '' ,d)}"
> +
> +AVAILTUNES += "armv8 armv8-crypto armv8-crc armv8-crypto-crc"
> +TUNE_FEATURES_tune-armv8 = "armv8"
> +TUNE_FEATURES_tune-armv8-crypto = "${TUNE_FEATURES_tune-armv8} cryptov8"
> +TUNE_FEATURES_tune-armv8-crc = "${TUNE_FEATURES_tune-armv8} crcv8"
> +TUNE_FEATURES_tune-armv8-crypto-crc = "${TUNE_FEATURES_tune-armv8} cryptov8 crcv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8 = "armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-crypto-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crypto-crc"
> +
> +AVAILTUNES += "armv8-neon armv8-neon-crypto armv8-neon-crc armv8-neon-crypto-crc"
> +TUNE_FEATURES_tune-armv8-neon = "${TUNE_FEATURES_tune-armv8} neon"
> +TUNE_FEATURES_tune-armv8-neon-crypto = "${TUNE_FEATURES_tune-armv8-crypto} neon"
> +TUNE_FEATURES_tune-armv8-neon-crc = "${TUNE_FEATURES_tune-armv8-crc} neon"
> +TUNE_FEATURES_tune-armv8-neon-crypto-crc = "${TUNE_FEATURES_tune-armv8-crypto-crc} neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crypto} armv8-neon-crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crc} armv8-neon-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crypto-crc} armv8-neon-crypto-crc"
> +
> +AVAILTUNES += "armv8hf armv8hf-crypto armv8hf-crc armv8hf-crypto-crc"
> +TUNE_FEATURES_tune-armv8hf = "${TUNE_FEATURES_tune-armv8} callconvention-hard"
> +TUNE_FEATURES_tune-armv8hf-crypto = "${TUNE_FEATURES_tune-armv8-crypto} callconvention-hard"
> +TUNE_FEATURES_tune-armv8hf-crc = "${TUNE_FEATURES_tune-armv8-crc} callconvention-hard"
> +TUNE_FEATURES_tune-armv8hf-crypto-crc = "${TUNE_FEATURES_tune-armv8-crypto-crc} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf = "armv8hf"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crypto-crc"
> +
> +AVAILTUNES += "armv8hf-neon armv8hf-neon-crypto armv8hf-neon-crc armv8hf-neon-crypto-crc"
> +TUNE_FEATURES_tune-armv8hf-neon = "${TUNE_FEATURES_tune-armv8hf} neon"
> +TUNE_FEATURES_tune-armv8hf-neon-crypto = "${TUNE_FEATURES_tune-armv8hf-crypto} neon"
> +TUNE_FEATURES_tune-armv8hf-neon-crc = "${TUNE_FEATURES_tune-armv8hf-crc} neon"
> +TUNE_FEATURES_tune-armv8hf-neon-crypto-crc = "${TUNE_FEATURES_tune-armv8hf-crypto-crc} neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto} armv8hf-neon-crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crc} armv8hf-neon-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto-crc} armv8hf-neon-crypto-crc"
> +
> +TUNEVALID[cryptov8] = "Enable armv8 crypto extensions"
> +TUNEVALID[crcv8] = "Enable armv8 crc extensions"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

