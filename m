Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2257A6AF00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:16:26 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so1276201pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=5vxJaU3iCwwBY3CuSyZVmjQFEkXeuq1cwu1FwbuBOmQ=;
	b=ZAZnPDl/XXuCLzcNTy8GiTtp4wOz1owTMWokycTL8Mhkc9Q2y6hmyrIHC7lzsbUV41
	UNnE7MamWITJKc2zDiGZknXHssAD/+NyNnY/Cn9JprjbFtrgzXu/d9/Dlj9g2+uG4p5N
	uuc1LHTBw/yXiFIe24QMHJvlsresGJdzGrclqhsWp/R366MxIg+ds17NMXSifZEIyOZ3
	6CXpGvh3H065yfeeP8hhfv77XuxLTfy9UksV8p31Bj+FS/HM8DaP2I+lHI9UDAHLMi0u
	9LUgzYynkFWVA6YUd9p+40QSy9oCTzK6fi18Sz3igdxRegQ0yMy9VuAKiyZERLpDSr4E
	ERmw==
X-Received: by 10.68.171.226 with SMTP id ax2mr13386827pbc.201.1372457787383; 
	Fri, 28 Jun 2013 15:16:27 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id b4sm9838825pba.45.2013.06.28.15.16.25
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:16:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1372449088.28188.3.camel@pb-ThinkPad-R50e>
Date: Fri, 28 Jun 2013 15:16:24 -0700
Message-Id: <9FC4E545-EDDA-465A-A320-9D9E9691FF99@gmail.com>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
	<1372449088.28188.3.camel@pb-ThinkPad-R50e>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 v2] bitbake.conf: Add SECURITY_*FLAGS overridable definition
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
X-List-Received-Date: Fri, 28 Jun 2013 22:16:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 28, 2013, at 12:51 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Fri, 2013-06-28 at 12:23 -0700, Saul Wold wrote:
>> This will allow for SECURITY_CFLAGS and SECURITY_LDFLAGS to be
>> defined in the security_flags.inc and override the empty default.
>=20
> Why can't security_flags.inc just append to CFLAGS and LDFLAGS
> respectively, or some other set of variables that already exists?
>=20

It could help debugging metadata a bit if they are separate but =
appending to TARGET_FLAGS
in this inc file is not as bad an option

> Creating new variables in bitbake.conf does have a cost in terms of
> parse time and memory footprint for every recipe.  If the variables =
are
> referenced in ${CFLAGS} etc then it also adds an extra substitution
> whenever CFLAGS is expanded.  The cost of those things isn't enormous,
> but it isn't zero either and adding them isn't something that we =
should
> do capriciously.
>=20
> p.
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


