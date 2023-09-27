Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D64CE810D2
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 11:23:21 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.14766.1695813791507169628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 04:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=u6tVKDI4;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=EsJAj+FdtwIwmZ82CRajvxhqMPmoChylZIpYsGPEhb8=;
	b=u6tVKDI4g6oLLcSqWS2K77IjQ43O4CYtp4FBGme68d+wv9guM+PHC/377faa/mLKHsYw76nNT0j
	sq0N1Siep+3j3AclYs/B0X6/1+wjHPbvMIkPBtndmQDNriZZ+tZuqEUeAwOpeUrAq2KLmXC0HIrCF
	HngC+P7SuXQ1ngugpKoGn3RDEscvPqXgLVIRMJGTZI1XvW2aJvyCZ4KQxLwFgfp4tTJKg4xGKeNEY
	Z38FtveEo4Bfz+O+OmRSOfYsw4wJU+b6jJBlw4wKab9MzPQ1chkf6N9Ol56a0b3dd4g4GMD9JNbUX
	X9kcTXbE4ffBUFsK5fEyyg3Jxj7EBehcVu4w==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qlSdJ-000B3w-8r; Wed, 27 Sep 2023 13:23:09 +0200
Received: from [2a06:4004:10df:0:9804:a718:e5a7:dac7] (helo=smtpclient.apple)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qlSdJ-000Ieu-1a; Wed, 27 Sep 2023 13:23:09 +0200
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [OE-core][PATCH] gcc: depend on zstd
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <172606da1e993e01dd23f3dd7490a13783390e64.camel@linuxfoundation.org>
Date: Wed, 27 Sep 2023 13:22:58 +0200
Cc: openembedded-core@lists.openembedded.org,
 kasper@krinvent.dk
Content-Transfer-Encoding: quoted-printable
Message-Id: <724DEFD8-F579-4421-9D19-0086E4C7B76A@geanix.com>
References: <20230927104922.3734608-1-sean@geanix.com>
 <172606da1e993e01dd23f3dd7490a13783390e64.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27044/Wed Sep 27 09:43:59 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 11:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188308



> On 27 Sep 2023, at 13.17, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Wed, 2023-09-27 at 12:49 +0200, Sean Nyekjaer wrote:
>> Add zstd LTO support for the nativesdk compiler.
>=20
> This is changing it for the target compiler as well?=20
>=20
> Perhaps also mention it brings it into sync with gcc-cross (assuming =
it
> does?).
>=20
> Cheers,
>=20
> Richard
>=20

Hi Richard,

It looks like the target compiler(x86_64-oe-linux) already had zstd =
support.

---
% x86_64-oe-linux-gcc -v
[...]
Supported LTO compression algorithms: zlib zstd
gcc version 12.2.0 (GCC)
% x86_64-oesdk-linux-gcc -v
[...]
Supported LTO compression algorithms: zlib
gcc version 12.2.0 (GCC)
=E2=80=94

Or I=E2=80=99m wrong?

Br,
/Sean=

