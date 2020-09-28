Received: from relay.dream-property.net (relay.dream-property.net [178.19.67.222])
 by mx.groups.io with SMTP id smtpd.web11.30733.1601274315004960915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 23:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=bad algorithm. Only rsa-sha1 or rsa-sha256 are permitted;
 spf=pass (domain: opendreambox.org, ip: 178.19.67.222, mailfrom: obi@opendreambox.org)
Received: from mail.dream-property.net (mail.dream-property.net [82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 7376F10097041;
	Mon, 28 Sep 2020 06:25:13 +0000 (UTC)
Received: from localhost (ip-88-152-32-15.hsi03.unitymediagroup.de [88.152.32.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 822B43143656;
	Mon, 28 Sep 2020 08:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org;
	s=dkim; t=1601274312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGTMJg64e8UGRZyZn4KAzAgVWE3OeJimKF9s+XKjOCQ=;
	b=BXAPefoYhAUlzlfg5PXZ4JtDuLGJL66Jv9YxrqN3FgLNMtwvZEddfeyfifzy3FwbDDguhn
	kuNhDXXyCrXy5RAQ==
Date: Mon, 28 Sep 2020 08:25:04 +0200
From: "Andreas Oberritter" <obi@opendreambox.org>
To: "Jon Mason" <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH v3 3/6] armv8/tunes: reference parent's TUNE_FEATURES
Message-ID: <20200928082504.08014c32@opendreambox.org>
In-Reply-To: <20200928020142.5706-4-jon.mason@arm.com>
References: <20200928020142.5706-1-jon.mason@arm.com>
	<20200928020142.5706-4-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jon,

On Sun, 27 Sep 2020 22:01:39 -0400
"Jon Mason" <jdmason@kudzu.us> wrote:

> diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
> index 66a5d0c437ee..51842e9edda9 100644
> --- a/meta/conf/machine/include/tune-cortexa55.inc
> +++ b/meta/conf/machine/include/tune-cortexa55.inc
> @@ -8,6 +8,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES += "cortexa55"
>  ARMPKGARCH_tune-cortexa55             = "cortexa55"
> -TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
> +TUNE_FEATURES_tune-cortexa53          = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
>  BASE_LIB_tune-cortexa55               = "lib64"

cortexa55 somehow became cortexa53 in this hunk.

Best regards,
Andreas
