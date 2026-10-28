Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1400.1793207067890987988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 10:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=G/bq0l3L;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7A8DFC4FED5;
	Wed, 28 Oct 2026 17:05:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78B4A60769;
	Wed, 28 Oct 2026 17:04:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEB8C103290AD;
	Wed, 28 Oct 2026 18:04:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793207065; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3NwjgIr9y6/GsuBT3eFxJc2rIITwTD/CqIovJPY/gCU=;
	b=G/bq0l3L1DLkksPUvy6F+EaCRQqEGOdj/bSRNXMktw0Xa8xeZT0LajL/O1WVz7pw3UknL8
	7Ap5LY5IYi2AoWewjaT0e7VzauzBQLvquDiDwe/iaJ+Vske/ZubzyeqZQqJc676Zxwl4oc
	yDtU23avHbbEq7TMjprv6G+/9OH/YYZ4eAT6X8syf5YR7X4l/L+vmfo7sblUPWZCgRk4L2
	LaYSBI6iAQqP1w1F5eKXWPxw9OdeXwTtbMyPkp0ZtPS75AutdxAtDi7Akps8OFE2n0mXXq
	c+k/zKXqqm9ycdsJL85/hJGPlqjTNMBpjsak5+vptRZkCFYNVvPy60dnf6ohFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Oct 2026 18:04:23 +0100
Message-Id: <DMGMUOASKXM3.1G2I8856314UZ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/2] openssl: Upgrade 4.0.3 -> 4.1.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261026183524.6389-1-jaipaul.cheernam@est.tech>
 <20261027183424.11874-1-jaipaul.cheernam@est.tech>
 <20261027183424.11874-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20261027183424.11874-2-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 17:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248823

On Tue Oct 27, 2026 at 7:34 PM CET, Jaipaul Cheernam wrote:
>   Release information [1]:
>
>   OpenSSL 4.1.0 is a feature release adding significant new functionality=
 to OpenSSL.
>
>   This release incorporates the following potentially significant or inco=
mpatible changes:
>
>   - Added VC-WIN32-MSVC2013 and VC-WIN64A-MSVC2013 build targets to provi=
de internal functions for bridging the gaps in C99 standard support that ar=
e present in MSVC 2013.
>   - Added optimized ML-DSA and ML-KEM NTT operations on ppc64le; optimize=
d ML-DSA operations on x86_64; AVX-512-optimized SHAKE x4 operations for ML=
-DSA on x86_64; AVX-512 and VAES optimizations for AES-CBC
>   decryption on x86_64.
>   - Changed tsget utility to use Net::Curl::Easy (from the Net-Curl CPAN =
distribution) instead of the abandoned WWW::Curl::Easy. Users who rely on t=
sget should install Net::Curl::Easy before upgrading.
>   - Dropped Windows-on-Itanium (VC-WIN64I) and Windows CE (VC-CE) targets=
 from Configurations.
>   - Dropped no-ecdsa and no-ecdh options from Configure, as these options=
 did not really disable the implementations. Use no-ec to disable the ellip=
tic curve support.
>
>   This release adds the following new features:
>
>   - Support for DTLS 1.3 (RFC 9147). Refer to the ossl-guide-dtlsv13(7) m=
anual page for details.
>   - Support for RFC 8701 GREASE (Generate Random Extensions And Sustain E=
xtensibility).
>   - DTLS support in the SSL listener API.
>   - Support for IKEV2 KDF.
>   - Initial support for the Elbrus2000 (e2k) architecture.
>
>   [1] https://github.com/openssl/openssl/blob/openssl-4.1/NEWS.md#major-c=
hanges-between-openssl-40-and-openssl-410-23-oct-2026
>
> - Refresh existing patches
> - Verified with world
> - Verified ptest python3-cryptography
>    TOTAL: 4650
>    PASS: 4443
>    FAIL: 0
>    ERROR: 0
>   TOTAL: 1  FAIL: 0
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

This looks better, but we still have one failure:

Failed ptests:
{'python3-pyopenssl': ['tests/test_ssl.py:TestMemoryBIO.test_memory_connect=
']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4828

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

