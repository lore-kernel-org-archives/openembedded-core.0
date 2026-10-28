Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40311.1793186079323022661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 04:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=k4OXgQtS;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=vWJTr4UD;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793186076; x=1793790876;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=NyhwNw+EqUwtiYmtm9S1TmI7bF9TiXzmgHc1P+aJr8o=;
	b=k4OXgQtSIKUjtJUj4Z1OB9Moz08eYFgBqfK7li4+pYwqFOOMD3omgdOg6iamyY5HrBzvBbb/Ei9i3
	 z3dgxpHhNpm0K3CeRWBxwz34lU0/wgCGCure7LPAKaGoESVfNEqw2gAv8TlkEDBiKMRZaWbRths8WC
	 thVYRHd2R2Bp8GzBiQfBY91rC2u7pfZ/D0gD4h95b153ii/SGhxjyfrh7oHzgqpk/mm5+BOrbpgYk1
	 1tqXDhY5xQR927O53ZLNuieGohZTieL1RA5FskoIKsTj86N4B8f9BiMSfD1ptdUveTkpQwwS2SjLCR
	 z7/jjfPxdtXuyppaN6Sw2VTVTcBFaig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793186076; x=1793790876;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=NyhwNw+EqUwtiYmtm9S1TmI7bF9TiXzmgHc1P+aJr8o=;
	b=vWJTr4UD/PkjX3xx2GbYX+dASQ8GIx9KquBKC7EP9f1SXZhfAlHhqyeihPgGXW9ACiZ1NEDxY60Aj
	 2l4TJbhCg==
X-HalOne-ID: c1adc3d3-d2c0-11f1-85b2-6d49bcc6f3f8
Received: from [IPV6:2a02:3102:8c10:1ae0:c98b:5300:3c35:71e4] (dynamic-2a02-3102-8c10-1ae0-c98b-5300-3c35-71e4.310.pool.telefonica.de [2a02:3102:8c10:1ae0:c98b:5300:3c35:71e4])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id c1adc3d3-d2c0-11f1-85b2-6d49bcc6f3f8;
	Wed, 28 Oct 2026 11:14:36 +0000 (UTC)
Message-ID: <8ed9b8e9-f82b-4275-9284-327b3b0aefae@embetrix.com>
Date: Wed, 28 Oct 2026 12:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] pkcs11-provider: import version 1.3.0 from meta-oe
To: openembedded-core@lists.openembedded.org
References: <20261028093240.345039-1-ayoub.zaki@embetrix.com>
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
In-Reply-To: <20261028093240.345039-1-ayoub.zaki@embetrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248815

Hi,


On 10/28/26 10:32, Ayoub Zaki wrote:
> OpenSSL 4.x removed the ENGINE API. Add pkcs11-provider to OE-Core
> to support token-backed keys for target applications and native signing
> tools without requiring meta-oe. Token drivers and provider activation
> remain product-specific.
> 
> Imported from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
> 
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
> ---
>   meta/conf/distro/include/maintainers.inc      |  1 +
>   .../pkcs11-provider/pkcs11-provider_1.3.0.bb  | 21 +++++++++++++++++++
>   2 files changed, 22 insertions(+)
>   create mode 100644 meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 74db3e44e9..10cf20a885 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -604,6 +604,7 @@ RECIPE_MAINTAINER:pn-piglit = "Ross Burton <ross.burton@arm.com>"
>   RECIPE_MAINTAINER:pn-pigz = "Kris Gavvala <kris.gavvala@windriver.com>"
>   RECIPE_MAINTAINER:pn-pinentry = "Unassigned <unassigned@yoctoproject.org>"
>   RECIPE_MAINTAINER:pn-pixman = "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-pkcs11-provider = "Unassigned <unassigned@yoctoproject.org>"
>   RECIPE_MAINTAINER:pn-pkgconf = "Ross Burton <ross.burton@arm.com>"
>   RECIPE_MAINTAINER:pn-pm-utils = "Ross Burton <ross.burton@arm.com>"
>   RECIPE_MAINTAINER:pn-pointercal-xinput = "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb b/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
> new file mode 100644
> index 0000000000..bd51625b8e
> --- /dev/null
> +++ b/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "An OpenSSL provider for accessing PKCS#11 tokens"
> +DESCRIPTION = "An OpenSSL provider to access hardware or software tokens through \
> +the PKCS#11 Cryptographic Token Interface."
> +HOMEPAGE = "https://github.com/openssl-projects/pkcs11-provider"
> +BUGTRACKER = "https://github.com/openssl-projects/pkcs11-provider/issues"
> +SECTION = "libs"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b53b787444a60266932bd270d1cf2d45"
> +
> +DEPENDS = "openssl p11-kit"
> +
> +SRC_URI = "git://github.com/openssl-projects/${BPN}.git;branch=main;protocol=https;tag=v${PV}"
> +SRCREV = "b55b94344af87a058fd84d6e15390760a5585b1d"
> +
> +CVE_PRODUCT = "latchset:pkcs11-provider"
> +
> +inherit meson pkgconfig
> +
> +FILES:${PN} += "${libdir}/ossl-modules/pkcs11.so"
> +
> +BBCLASSEXTEND = "native"

The integration report this error:


https://bodnuti.dev/reports/openembedded-core/20261028093240.345039-1-ayoub.zaki@embetrix.com/

Is this a known limitation of the checker when introducing a new recipe 
or is there something I should consider?

What is the recommended way to handle this?


Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant
