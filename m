Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20282.1793111843249839327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 07:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cqzRRR5e;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E56164E41343
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 14:37:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ACB54603BD;
	Tue, 27 Oct 2026 14:37:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12B3510328FB2;
	Tue, 27 Oct 2026 15:37:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793111836; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mK4VTSe3tkcopEFiLNsm1ZPaH4V6WD27ONXTzWR3iuk=;
	b=cqzRRR5eo7qCgaYo2Qw7qron17Mzo+qn1SISfte+ZG991yhQO2q84lyfyc2+K9PVB/Cdmm
	e+aIUG0880IVTuZT6WzpDVmpv+f5pIC5vWiRJ8FmCz0fc2lwFP5qYLr1cHSiZ3yuv71OOZ
	96ISg7eS+bBU4obhAS4bI++nX1bJbvWNQjd+WT2FcYl/Gy+Dx4RkZjn8Hl1gGP6WjvPGZI
	jxCnBHKiaHX+rCYXL1uwn7j+TLZCeDXT0JAlQodkByebPUtVkZQ+ysehgBcCbJtVRngNJ7
	svfnuIrK4Lk+YaO2e4CJVRVvAgbu7o2OMV9Z6QE5dJDqeXlW07VgEZfAT0QyLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 15:37:14 +0100
Message-Id: <DMFP3GTRT2CQ.3DUW7MRPBWP8T@bootlin.com>
Subject: Re: [OE-core] [PATCH] openssl: Upgrade 4.0.3 -> 4.1.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261026183524.6389-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261026183524.6389-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 14:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248750

On Mon Oct 26, 2026 at 7:35 PM CET, Jaipaul Cheernam wrote:
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
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade. This is breaking python3 crypto:

Failed ptests:
{'python3-cryptography': ['tests/hazmat/primitives/utils.py:TestAESModeGCM.=
test_gcm',
                          'tests/hazmat/primitives/test_sm4.py:TestSM4ModeG=
CM.test_invalid_tag[vector0]',
                          'tests/hazmat/primitives/test_ssh.py:TestOpenSSHS=
erialization.test_load_ssh_private_key_invalid_tag']}

Failed ptests:
{'python3-pyopenssl': ['tests/test_ssl.py:TestMemoryBIO.test_memory_connect=
']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4822

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

