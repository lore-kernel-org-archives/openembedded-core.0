Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 302BF60089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 17:19:17 +0000 (UTC)
Received: by pddn5 with SMTP id n5so121977073pdd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+SFu5m6D3GlUXlORA/kqQO4wBQfupnSGKo3TD/HWHnU=;
	b=l1Ij4icBvrmf9vm3sMsEFWBQ7vKtBmxP53Vfhl3nKs9P1Rw+EM4JmJBgeZpO4widsq
	zrYecJXJiSNpHXGNpA02ZOgsRwT/FHCYwPOlspGtmktxqmUzitwTjiYHphW54hyLwEyJ
	SsAaOBGs2AS0Rx4xJxkJkl9Ff7FBLvdMtmJDzgGTQ1ZKYcF1cCq9llBC7yUUU4wdzvJe
	u0TCKCkXuHkEWmN0uxkJrr3dKXCS6MSZT6Vtx8usv5HZEoGWJ6yyPKO29X2tCiPbxEgF
	SaS4fxv7GCYzx5FtcrpadCNlC/RUatNl0ah7zYl2zskm2+9d8TqvDurf7eQ3xNR0bUtm
	iCgQ==
X-Received: by 10.70.135.106 with SMTP id pr10mr47824148pdb.156.1428513558893; 
	Wed, 08 Apr 2015 10:19:18 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:fccc:5877:1fd:ee97?
	([2601:9:3580:84c:fccc:5877:1fd:ee97])
	by mx.google.com with ESMTPSA id
	yc2sm11628582pbb.87.2015.04.08.10.19.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 Apr 2015 10:19:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150408165602.GI2337@jama>
Date: Wed, 8 Apr 2015 10:19:16 -0700
Message-Id: <146A88B2-0A81-4062-AD0C-A25DBA71C51E@gmail.com>
References: <20150408095412.1AF5150308@opal.openembedded.org>
	<20150408165602.GI2337@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : gdb: Upgrade 7.8.1 -> 7.9
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
X-List-Received-Date: Wed, 08 Apr 2015 17:19:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 8, 2015, at 9:56 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Apr 08, 2015 at 09:54:11AM +0000, git@git.openembedded.org =
wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 34a77b11350f1f4ccd952f78fd660710b6efaac8
>> URL:    =
http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3D34a7=
7b11350f1f4ccd952f78fd660710b6efaac8
>>=20
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Mon Mar  2 02:11:00 2015 +0000
>>=20
>> gdb: Upgrade 7.8.1 -> 7.9
>=20
> meta/conf/distro/include/tcmode-default.inc
>=20
> should be updated with the same commit, now it causes:
>=20
> NOTE: Resolving any missing task queue dependencies
> NOTE: preferred version 7.8% of gdb-cross-canadian-arm not available =
(for item gdb-cross-canadian-arm)
> NOTE: versions of gdb-cross-canadian-arm available: 7.9
> NOTE: preferred version 7.8% of gdb not available (for item gdb)
> NOTE: versions of gdb available: 7.9
> NOTE: preferred version 7.8% of gdb-cross-canadian-arm not available =
(for item gdb-cross-canadian-arm-dev)
> NOTE: versions of gdb-cross-canadian-arm available: 7.9
> NOTE: preferred version 7.8% of gdb not available (for item gdb-dev)
> NOTE: versions of gdb available: 7.9
>=20
> because it still sets:
> GDBVERSION ?=3D "7.8%=E2=80=9D



There is already a patch for it
=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mas=
ter&id=3D81ceaf4901ab23ef65ee8656cd4de1288fe87dd2


