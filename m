Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14633.1794910482990483527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:14:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zoXtQ5Ms;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B15B54E41471
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:14:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80C345FC81;
	Tue, 17 Nov 2026 10:14:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B8D911BC0493;
	Tue, 17 Nov 2026 11:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794910480; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G79y4qS3i6Ci4qiOI2FehqAsC0tW7sMfEhwACo4wDhQ=;
	b=zoXtQ5Ms3Fh3sKf5HnczzJCrM4MUCRwYskI5a4UnnL9vhvRMuRyRE6D2j3t0cseD+MXYgT
	hPcZFJsaeMfvVnTt+i6RIqNdpxr5foALPaFT6ffAWBrcjNi7u6CD4vh4c2C6uvi4VkYmku
	uggn92kEYfCmZOZBeaEHRpckmrKd8cCjHpfQ+X2DYSCXHMoUvtu1EQihxRRcAWWgg9TAw6
	00jXMSlpu9H3xx09ngOzsfd1TBpGw2qjGEPePkDD4gDGOKpj7kGfA+3bqdwWPHjFsHfY0x
	G7ji6Y9j1aAYeU3p4rV8QMBAZkR/3f/KfqdfgGISCqfVCh5RzcP7tBpVJlfZaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 11:14:38 +0100
Message-Id: <DMXENUOACAP2.3O2C7HTAPH1ML@bootlin.com>
Subject: Re: [OE-core] [PATCH] cmake,cmake-native: upgrade 4.4.5 -> 4.5.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ragaprasanth@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261117061549.1066408-1-ragaprasanth@gmail.com>
In-Reply-To: <20261117061549.1066408-1-ragaprasanth@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250420

On Tue Nov 17, 2026 at 7:15 AM CET, prasanth via openembedded-core wrote:
> CMake 4.5 now bundles rapidhash (MIT), so add its license file.
>
> Release notes:
> https://cmake.org/cmake/help/v4.5/release/4.5.html
>
> AI-Generated: Uses Claude
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>

Hi Prasanth,

Thanks for the update.

It looks like this is failing to build:

ERROR: cmake-native-4.5.0-r0 do_configure: Execution of '/srv/pokybuild/yoc=
to-worker/genericarm64/build/build/tmp/work/x86_64-linux/cmake-native/4.5.0=
/temp/run.do_configure.575456' failed with exit code 11
...
| -- Looking for OPENSSL_IS_AWSLC
| -- Looking for OPENSSL_IS_AWSLC - not found
| -- Looking for OPENSSL_IS_BORINGSSL
| -- Looking for OPENSSL_IS_BORINGSSL - not found
| -- Looking for LIBRESSL_VERSION_NUMBER
| -- Looking for LIBRESSL_VERSION_NUMBER - not found
| -- Configuring incomplete, errors occurred!
| CMake Error at Utilities/cmcurl/CMakeLists.txt:1040 (message):
|   Found OpenSSL version 1.1.1k.  When building CMake with vendored curl, =
at
|   least version 3.0.0 is required, or configure CMake with
|   -DCMAKE_USE_OPENSSL=3DOFF to build without OpenSSL.
|

https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/5016

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

