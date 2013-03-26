Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKd5g-0003lX-PE
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 00:15:47 +0100
Received: by mail-da0-f50.google.com with SMTP id t1so2335280dae.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 15:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=hH6y38xN0IYmbY8cGWnLWrYnmK9I2oFJzvH4FjUz3XM=;
	b=WyNcZXESDbsxr2jUYKQ/Boi52+ek0rrR1DV/595DIDCdDrF12ZuffDN97odDfwFiiq
	kUjT7H4BwetKXNOXWdYFRaRdDBBGl+Ff/DNrlKTRXs/+ie9lVLZNz/KfuJeNTFYrWcq8
	zAELX/8dAYpLwfCPFbdprRm8m72MZ4zKS6LL4Pbc+XhXpCYXdJCMqbdRNG6JAOVKcpUy
	oiQL4PByvGrZyQ+2IzJwxu6rwZ8F4zViYoAUEvli9bSjWTodAb+YurElqq1L9wfcMkBO
	CIEbgxqkC8qZb8figYFNBmlwR5C1/AdQNhlUpuzJkm4L/L05RKutqQN41XpLRV/LOInh
	C1Hg==
X-Received: by 10.68.253.68 with SMTP id zy4mr7293093pbc.38.1364338719772;
	Tue, 26 Mar 2013 15:58:39 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id qa6sm18958343pbc.46.2013.03.26.15.58.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 15:58:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364338373.3097.117.camel@ted>
Date: Tue, 26 Mar 2013 15:58:38 -0700
Message-Id: <DDFE5CA4-5FBE-4338-928B-533D38D81DFD@gmail.com>
References: <1364334507-16539-1-git-send-email-raj.khem@gmail.com>
	<1364338373.3097.117.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uclibc-git: Fix build on x86 and move to latest master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 23:15:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 26, 2013, at 3:52 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2013-03-26 at 14:48 -0700, Khem Raj wrote:
>> debugedit from rpm has unearthed a bug in uclibc
>> where it was mixing stabs with elf/dwarf
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
>> .../0001-i386-sysdep.h-Remove-STABS_-macros.patch  |   71 ++++
>> ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |    8 +-
>> .../uclibc/uclibc-git/posix_fallocate.patch        |  408 =
--------------------
>> .../uclibc/uclibc-git/uclibc-execvpe.patch         |  163 --------
>> 5 files changed, 77 insertions(+), 578 deletions(-)
>> create mode 100644 =
meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macro=
s.patch
>> delete mode 100644 =
meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
>> delete mode 100644 =
meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
>=20
> git am really doesn't like applying this, is there a tree I can pull =
it
> from somewhere?
>=20

OK pushed to a branch

git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-upgrade

> Cheers,
>=20
> Richard
>=20



