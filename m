Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB19618B5;
	Thu, 27 Jun 2013 15:10:29 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un1so1051129pbc.1
	for <multiple recipients>; Thu, 27 Jun 2013 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=pBM5T7Qp94ZgrFYLj/b9rkAGh0Oz2hKixFt1DuaHN/8=;
	b=QycBp/8NVCaN18bgyeXEAzPZUV/kYmM27W7ZQ3H1CQPl3X7a60t0zwm2s8DZtx+Oa8
	pe5/5mSg+C6qOgdWiZqm5mOLv/BdWCP3MIfSiZUTqm2cjPIz+VsnDzNV4C6yzNwcsiRt
	KRjOepQsTxJV/ivnBsmLjji5oJh/O5ZwwttBnC5cqyKDzpDU2ZYLmZw+YmFB0CsdKR0i
	5CymqvNg7tJM79+8V9grZBd8ty14RJtPyP9W9cvSSJ0dCyAwM29byugEeT+Imn+y4vfZ
	rtiiXsxZ+1OvPRlDy3a1qoqZSU9c3HkFqXlxsgdPArU7pdDFogyp4yb0QkLHua6p05s0
	2Edg==
X-Received: by 10.66.251.202 with SMTP id zm10mr6582948pac.53.1372345830659;
	Thu, 27 Jun 2013 08:10:30 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id yj2sm3520002pbb.40.2013.06.27.08.10.28
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 08:10:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1372317615.9930.180.camel@ted>
Date: Thu, 27 Jun 2013 08:10:30 -0700
Message-Id: <9D33DF95-E667-4BD8-9D3B-7E87826795A8@gmail.com>
References: <1831F7C6-54BC-4E5F-BC00-1B8C17E8D1FD@gmail.com>
	<1372317615.9930.180.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1508)
Cc: "yocto@yoctoproject.org \(yocto@yoctoproject.org\)"
	<yocto@yoctoproject.org>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: eglibc (would be 2.18) recipes
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
X-List-Received-Date: Thu, 27 Jun 2013 15:10:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 27, 2013, at 12:20 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2013-06-26 at 14:06 -0700, Khem Raj wrote:
>> Hi All
>>=20
>> I have put together eglibc recipes for upcoming 2.18 release and =
pushed to a contrib tree here
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/eglibc=
-2.18
>>=20
>> They built angstrom/systemd-images fine and booted OK on all =
supported qemu machines
>> on OE-Core
>>=20
>> Please test them out in your configurations and machines and provide =
feedback, lets weed out
>> the issue early
>=20
> You have a fix for bug 4168 in there that nobody else can reproduce or
> understand:

that was an oversite during rebase. I have refresh the tree and dropped =
it from there.

>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4168
>=20
> I'd really like to better understand what is happening there before we
> pull that one in.
>=20
> Cheers,
>=20
> Richard
>=20


