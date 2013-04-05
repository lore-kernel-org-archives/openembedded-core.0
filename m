Received: from mail-pd0-f178.google.com ([209.85.192.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UO7Nj-0005sa-Mk
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 16:12:51 +0200
Received: by mail-pd0-f178.google.com with SMTP id w11so2015290pde.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 06:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=IDtw17uDuxBhoynXMmB4TNg7vtpyM14Il0xrUdrbGH4=;
	b=pfBkZwgJvqlrz37c8hEKzH6K7yLfBmgv8DiueT6lmJ5hF0guWAi0/QfXAS8BPcPPbt
	JRKnpTYat5hRLZnxkcZ36+JFDb0a7tXegZf9DVz62YpuVeDk6ard9bKReGMYP6lLQ4Fl
	tcJQPibvHrIOT0W4QY/JdA1M6o+ITot7LC48xyfmw1JhDXPcw3tWgAf68ILsLx3CdoF7
	lLHU1Nh/sgsU930Fq6WTakYRHcjeNGY2qIgO39GzEB6PcnGNVljrHf2pRGvAsZrvbwku
	e7Gi9sOnj8Sme2Yl6GV51oLOQ3sQQzccnhDkj4FhsFowWKf4RXTtlatXTNUXn2k8qHRK
	EvaQ==
X-Received: by 10.66.230.198 with SMTP id ta6mr15194887pac.126.1365170128752; 
	Fri, 05 Apr 2013 06:55:28 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id gn2sm14539089pbb.22.2013.04.05.06.55.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 06:55:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1365122145.git.raj.khem@gmail.com>
Date: Fri, 5 Apr 2013 06:55:26 -0700
Message-Id: <336418D0-6DF4-433D-9A1D-E45DD91B8BAC@gmail.com>
References: <cover.1365122145.git.raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [PATCH 0/1] Fix coreutils build on uclibc
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
X-List-Received-Date: Fri, 05 Apr 2013 14:12:52 -0000
X-List-Received-Date: Fri, 05 Apr 2013 14:12:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I think Henning's patch to site config will solve the same problem we do =
not need this patch

On Apr 4, 2013, at 5:38 PM, Khem Raj <raj.khem@gmail.com> wrote:

> coreutils after upgrade has started to fail to build on uclibc
> targets, this series of patches fix the build on uclibc as well
> as on eglibc is working normal.
>=20
> The following changes since commit =
2587a33134fde80dd1367629d9def45ac70256ee:
>=20
>  site: add endianness information for libmemcached (2013-04-04 =
23:58:00 +0100)
>=20
> are available in the git repository at:
>=20
>  git://git.openembedded.org/openembedded-core-contrib kraj/coreutils
>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dk=
raj/coreutils
>=20
> Khem Raj (1):
>  coreutils: Fix build on uclibc after upgrade to 8.21
>=20
> ...d-ltr-and-lpthread-for-getting-spawn-func.patch |   15 ++++
> ...sys_time.in.h-Fix-use-of-restrict-keyword.patch |   51 =
+++++++++++++
> .../coreutils/coreutils-8.21/gcc-uclibc.patch      |   77 =
++++++++++++++++++++
> meta/recipes-core/coreutils/coreutils_8.21.bb      |    5 +-
> 4 files changed, 147 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-core/coreutils/coreutils-8.21/0001-local.mk-Add-ltr-and-lpthr=
ead-for-getting-spawn-func.patch
> create mode 100644 =
meta/recipes-core/coreutils/coreutils-8.21/0001-sys_time.in.h-Fix-use-of-r=
estrict-keyword.patch
> create mode 100644 =
meta/recipes-core/coreutils/coreutils-8.21/gcc-uclibc.patch
>=20
> --=20
> 1.7.9.5
>=20



