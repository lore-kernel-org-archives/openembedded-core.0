Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 74E3A6BEC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:17:36 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id wz12so659723pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=KSeW3PC5jm+ehywonUBSJK7ZdaOrGy/CLOlWBexol7M=;
	b=LrDwdVT9uapxqK3CKFfGZx4SEvOeP2vLUtiB67HQMTJ1qEdEN29ekF9Dz9erW8WAFP
	GZ+5ikWQkF6Dd5JPRhgi3ZszzB8XXM0m8w8ZH0qlJiBBdwk3z7DMBkj4ktVEVoo87iR/
	3EoLlT3ftTa6SrzhkNDict6c+j4lnUR4EmyxIvRLjH6UoJONY+M6ebYAEqdMKi25DkLX
	0ktuGUUaICrycw4XZOe+XCtkfbl/Y8KrSZ97ymgHcNvh20ofWFfj0dNaxGO8hWajIzWL
	6knw1+K441mLcFtNYx4Z+R6Bp/6UpKRSMiEYw8UOYPsnlMAK386rl4HdakfbwQNhoFfR
	nA5w==
X-Received: by 10.66.142.132 with SMTP id rw4mr5519510pab.6.1377793057123;
	Thu, 29 Aug 2013 09:17:37 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	lm2sm41907215pab.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:17:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6A28979E-6351-4F22-B118-8987B099613B@gmail.com>
Date: Thu, 29 Aug 2013 09:17:38 -0700
Message-Id: <7C83EB0C-C1E8-4481-AD5A-D38135A15D9F@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
	<521D0622.6090802@windriver.com>
	<2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
	<521E7D2E.6060404@windriver.com>
	<E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
	<A3529AF4-7650-4866-A83B-5D948D733723@gmail.com>
	<6A28979E-6351-4F22-B118-8987B099613B@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 16:17:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 29, 2013, at 1:50 AM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:

>>> also take a look at meta-linaro, they test armv7+ qemu regularly.
>=20
> I built core-image-minimal using meta-linaro, using genericarmv7 =
machine but it just generates an Image file for the kernel and a tar.gz =
rootfs. It doesn't look like its useful out of the box for a QEMU image. =
Additionally you have to do something extra for the image to be usable =
for a beagle QEMU machine, related to x-load and u-boot, to get it to =
work.

x-load, u-boot are not needed when booting a qemu machine. You just need =
a kernel and rfs. So make sure that you use a kernel thats configured =
correctly to boot on say vexpress emulation on qemu and that should be =
it. Real thing is to figure out the kernel and any patches if needed.

>=20
> Are you aware of the extract steps? Most of the docs I've seen use pre =
built sd card images.
>=20
> Best regards,
>=20
> Elvis


