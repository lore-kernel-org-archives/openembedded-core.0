Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R1DhF-0002lt-H7
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 10:41:25 +0200
Received: by wwi18 with SMTP id 18so1060337wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2011 01:36:23 -0700 (PDT)
Received: by 10.227.202.70 with SMTP id fd6mr6046040wbb.114.1315384583508;
	Wed, 07 Sep 2011 01:36:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b3sm2866521wbp.10.2011.09.07.01.36.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 01:36:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4959b5dd8cbbed8bbbd6aace139e93b9ced52f80.1314953755.git.dongxiao.xu@intel.com>
Date: Wed, 7 Sep 2011 10:36:19 +0200
Message-Id: <BE7333AC-4DA0-4DDB-8707-96F15A7A8A58@dominion.thruhere.net>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
	<4959b5dd8cbbed8bbbd6aace139e93b9ced52f80.1314953755.git.dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/5] hal: Remove build time dependency of virtual/kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2011 08:41:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 sep. 2011, om 11:03 heeft Dongxiao Xu het volgende geschreven:

> hal has runtime dependency on kernel, but not build time. Remove it =
from
> "DEPENDS" list.
>=20
> Also fix a wrong PACKAGE_ARCH setting when building multilib =
lib32-hal,
> because ":=3D" will be extended immediately which is not the right =
value.
> Using TUNE_PKGARCH instead.

After this patch it fails to build with:

| probe-video4linux.c:33:28: fatal error: linux/videodev.h: No such file =
or directory

Which does look like a kernel header to me=


