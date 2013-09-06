Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF4A6186F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 16:51:26 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr4so3427308pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 09:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Wzbgu+TFL00+tPHTswCimdGDc7mlrCJ1Eboj9ws6Bys=;
	b=i2H33WEmSsjb3PfSmap7w3sFNfif+HIrCYDaSWzH0bneZnYfL+PIkeOQIclI6WaHDf
	EMTrLuUcwS7d1BRqDhW9IB5TBkphQJPpOIlAqeKhSDn/chhU/a3+1G8JsEnmyUG2N4sI
	GKGe4hmptQPGyih46QultnP03cD1KmRLlrrmfR5zA+Ag/DVkfBIE3ksx2piVyUSC657R
	SZuY0n2Y5OwSBGV5f5yF8FtL7uiCp73ZlxJgXOH1bito/B9Srme89tFsXnQXtcgx4+J9
	rWvVk1DWwQyAg0197Bd1DMxO7nCiXnqMiHd8sGgRpcqrvWh6MRrPNe5gE0EelFRBNrah
	54Rw==
X-Received: by 10.67.4.197 with SMTP id cg5mr5153762pad.10.1378486288508;
	Fri, 06 Sep 2013 09:51:28 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	os4sm4937499pbb.25.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 09:51:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZ44ECCEzHXCZ=ZFraK3hwALGKUTN5E0S3Teymraita6A@mail.gmail.com>
Date: Fri, 6 Sep 2013 09:51:29 -0700
Message-Id: <9F740015-76B4-465D-8AD5-286DF4C93E74@gmail.com>
References: <1378442169-15822-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZ44ECCEzHXCZ=ZFraK3hwALGKUTN5E0S3Teymraita6A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix build with multilib
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
X-List-Received-Date: Fri, 06 Sep 2013 16:51:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 6, 2013, at 2:10 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 6 September 2013 05:36, Khem Raj <raj.khem@gmail.com> wrote:
>> rpm macros should be independent of libdir
>> Fixes errors seen when multilib is turned on
>> it shows up since then libdir !=3D usr/lib
>=20
> I can't see a reason to package the rpm macros at all, it's not like
> there'll be ever be used unless you are building RPMs from your own
> spec files inside a Yocto image.

thats why its packaged into package of its own. Secondly Poky is one =
usecase of OE-Core
there are valid usecases of folks using on device SDKs and package =
management using other distributions driven
out of OE-Core

>=20
> Ross


