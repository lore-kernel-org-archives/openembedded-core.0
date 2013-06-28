Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8F01F6AF04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:17:52 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so2915843pab.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=yYCG8pYOD8OjukrWViSFp/Bkeb+pQmPvlI1DEup8BTY=;
	b=xvZL6hIDOaLP5ZkxfXnKtLyoW7jvpOq910o3/ujxcu8YrIQ8fOjdqy7kVPBllMBG9g
	6UVYVS7czqKb9976x4o8pU1+mxiWDP/GNHfDD+C+sVJGfr1KFdX3rAmn6xehVbqzjtWL
	zFrJwTBXn2QDtU+AYPwVCzLfG9/lrT/dZoDcdjw0auD/q881qO2w2tX8yFaQHqGLH/gd
	cPCuxHPmOgTGKRcfd0Qrc16WVHpKNNR7oUZV77LmhcnV+3GgMnnF4nNemvOAwFYZFzpx
	S0lJnpTPDoSjGxYmUZ6p9mt9zebn9KUg0hZG+kE5qTGqDHJVRCIOJ0O553FLPXn/aIfR
	SbWw==
X-Received: by 10.68.136.168 with SMTP id qb8mr13669139pbb.62.1372457873936;
	Fri, 28 Jun 2013 15:17:53 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id xl3sm9892001pbb.17.2013.06.28.15.17.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:17:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51CDEFEF.2090801@linux.intel.com>
Date: Fri, 28 Jun 2013 15:17:51 -0700
Message-Id: <A496288F-F0AD-4013-9078-AB68461E1178@gmail.com>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
	<1372449088.28188.3.camel@pb-ThinkPad-R50e>
	<51CDEFEF.2090801@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Fri, 28 Jun 2013 22:17:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 28, 2013, at 1:19 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 06/28/2013 12:51 PM, Phil Blundell wrote:
>> On Fri, 2013-06-28 at 12:23 -0700, Saul Wold wrote:
>>> This will allow for SECURITY_CFLAGS and SECURITY_LDFLAGS to be
>>> defined in the security_flags.inc and override the empty default.
>>=20
>> Why can't security_flags.inc just append to CFLAGS and LDFLAGS
>> respectively, or some other set of variables that already exists?
>>=20
> So, if I remember correctly there was issues with this because there =
are a number of packages that have to modify specifically the security =
related flags (see the list in security_flags.inc), the ordering/timing =
of being able to due that correctly did not allow for setting it =
directly in CFLAGS or TARGET_CFLAGS.

can you use append|prepend override ?

>=20
>> Creating new variables in bitbake.conf does have a cost in terms of
>> parse time and memory footprint for every recipe.  If the variables =
are
>> referenced in ${CFLAGS} etc then it also adds an extra substitution
>> whenever CFLAGS is expanded.  The cost of those things isn't =
enormous,
>> but it isn't zero either and adding them isn't something that we =
should
>> do capriciously.
>>=20
> I understand, and RP and I talked about this, we needed a separate =
variable to ensure the correct substitution occurred for those that =
needed to disable or remove certain flags.
>=20
> Sau!
>=20
>=20
>> p.
>>=20
>>=20
>>=20
>>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


