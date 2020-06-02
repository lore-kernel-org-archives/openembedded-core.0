Received: from relay.dream-property.net (relay.dream-property.net [178.19.67.222])
 by mx.groups.io with SMTP id smtpd.web11.4229.1591126997453056707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=bad algorithm. Only rsa-sha1 or rsa-sha256 are permitted;
 spf=pass (domain: opendreambox.org, ip: 178.19.67.222, mailfrom: obi@opendreambox.org)
Received: from mail.dream-property.net (mail.dream-property.net [82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 5EC30100944D6;
	Tue,  2 Jun 2020 19:43:14 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de [176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0E0DB3142F9D;
	Tue,  2 Jun 2020 21:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org;
	s=dkim; t=1591126988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70w50RMUY4j4HVyheyoXBQTk4mCi0cJzu07v5bmbsTM=;
	b=ihbGwqazZj3dKRG4eehZm50DNGIBAczVYY2Dq/MGFGx6EuR/I1GmdPq/3XXONg5sDyWs1A
	xa6jnu4fzSHIQdDw==
Date: Tue, 2 Jun 2020 21:43:05 +0200
From: "Andreas Oberritter" <obi@opendreambox.org>
To: "Gregor Zatko" <gzatko@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
Message-ID: <20200602214305.6a3500f2@opendreambox.org>
In-Reply-To: <20200602190925.384853-1-gzatko@gmail.com>
References: <20200602190925.384853-1-gzatko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Gregor,

On Tue,  2 Jun 2020 21:09:25 +0200
"Gregor Zatko" <gzatko@gmail.com> wrote:

> In some cases there is a need for update-alternatives script which gets built
> within opkg-utils recipe into a standalone package. However, this causes to
> many unnecessary dependencies, including Python, bc, OpenSSL etc. to be built.
> 
> In this commit a standalone lightweight recipe for update-alternatives that
> shouldn't be dependent on nothing other than bash.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8879
> 
> Signed-off-by: Gregor Zatko <gzatko@gmail.com>
> ---
>  .../conf/distro/include/default-providers.inc |  6 +--
>  meta/conf/layer.conf                          |  3 +-
>  .../packagegroups/packagegroup-self-hosted.bb |  1 +
>  .../opkg-utils/opkg-utils_0.4.2.bb            | 25 +---------
>  .../update-alternatives_0.4.2.bb              | 49 +++++++++++++++++++

why did you change the name from update-alternatives-opkg to update-alternatives? I would prefer to keep the suffix in order to be able to distinguish it more easily from other implementations, e.g. dpkg's.

Best regards,
Andreas
