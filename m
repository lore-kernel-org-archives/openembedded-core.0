Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C149A6C106
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:31:37 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p11so1260418wre.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=zMkkClsNaX5iXCCjkKxhJ+m3CyH2FALCS/RV3c89+sA=;
	b=SU7iWe9cJxAILbdS0mLmPzWnfpaFrAd3gzP3A+Ud+HmSq2F2c3DqCRvyMpvKdOdtlj
	eXmaqRXD8A3ycCXp+gGCmciYofdVjTcV7FjjGG9sRGGq6WBHtmbPZ2RjRdtg1yd5FbCa
	9Gm1+tb6kOvXlZ/fKD4w+YKF8PJ0i2rsT4Iao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zMkkClsNaX5iXCCjkKxhJ+m3CyH2FALCS/RV3c89+sA=;
	b=oi+6QL2Xnx62QdrDPjgY5zudUa6BTrtKz1w2rmGEM12MaVDw4cVCj01/Yu58gYptup
	MQkdNl+I8e8GKU+X5VTr4hxXqQrSu4AmszDpIbKf43OP6enUdoNvrDSEGlcqDlYoRCHA
	FPCxrgvNpUtNtWUFbjZF6k2UTPObd9paMd1YhmAy5b52+LJhhbJXqEvNRHZDGV34V6Ar
	op0xI2VocOaqIjdCWN/hzIW5zx8b74Tv8+RldOZOnWrcPLEc9BuBZhlcurKWmu0rlxAw
	hS2jabWbcenpC1tkry3oB7bhDA/oVpjAEcNNS73j8P+dc2x9XIqoqvQzbGLSojUeg/RZ
	EYLA==
X-Gm-Message-State: APjAAAV0qrAzRl/zZSxsuq8psmLj4crn1WiOzely6rn+bfMg8SH2QGPA
	9OG31qp80p5F1JZ0Iqutkyqo4w==
X-Google-Smtp-Source: APXvYqyfaX4KjbGGq3JquorQTy/c6eLgBXsFdHUxgYlHVdUQwBwzHeCRkUxWQChdrIh5pp6aJDtx0A==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr1948908wrs.334.1561620698494; 
	Thu, 27 Jun 2019 00:31:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id j4sm1044552wrx.57.2019.06.27.00.31.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 00:31:37 -0700 (PDT)
Message-ID: <065a68d75756f3afbc07d2229e307969cd4de386.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pierre Le Magourou <lemagoup@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 08:31:36 +0100
In-Reply-To: <20190619135940.18544-1-lemagoup@gmail.com>
References: <20190619135940.18544-1-lemagoup@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Thu, 27 Jun 2019 07:31:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-19 at 15:59 +0200, Pierre Le Magourou wrote:
> From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> 
> cve-check-tool-native do_populate_cve_db task was using deprecated
> NVD
> xml data feeds, cve-update-db uses NVD json data feeds.
> 
> Sqlite database schema was updated to take into account CVSSv3 CVE
> scores and operator in affected product versions.
> A new META table was added to store the last modification date of the
> NVD json data feeds.
> 
> Signed-off-by: Pierre Le Magourou <
> pierre.lemagourou@softbankrobotics.com>
> ---
>  meta/recipes-core/meta/cve-update-db.bb | 121
> ++++++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 meta/recipes-core/meta/cve-update-db.bb
> 
> diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-
> core/meta/cve-update-db.bb
> new file mode 100644
> index 0000000000..522fd23807
> --- /dev/null
> +++ b/meta/recipes-core/meta/cve-update-db.bb
> @@ -0,0 +1,121 @@
> +SUMMARY = "Updates the NVD CVE database"
> +LICENSE = "MIT"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +PACKAGES = ""
> +
> +inherit nopackages
> +
> +deltask do_fetch
> +deltask do_unpack
> +deltask do_patch
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_populate_sysroot
> +
> +python do_populate_cve_db() {
> +    """
> +    Update NVD database with json data feed
> +    """
> +
> +    import sqlite3, urllib3, shutil, gzip, re
> +    from datetime import date
> +
> +    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
> +    YEAR_START = 2002
> +    JSON_TMPFILE = d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'

It looks like CVE_CHECK_DB_DIR has no default value which resulted in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/988/steps/7/logs/step1b

We only started seeing that error after your later patch to add back
the do_fetch task. build-appliance is trying to collect up all the
sources it may need.

Cheers,

Richard






