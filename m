Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlMqD-0004TD-34
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:13:09 +0200
Received: by wyg30 with SMTP id 30so3139734wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 08:08:56 -0700 (PDT)
Received: by 10.227.142.78 with SMTP id p14mr4064386wbu.58.1311606235945;
	Mon, 25 Jul 2011 08:03:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fe4sm4398308wbb.11.2011.07.25.08.03.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 08:03:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <35b13046d50006f3eec3f0cbfd37c8463c1fb485.1311605321.git.bruce.ashfield@windriver.com>
Date: Mon, 25 Jul 2011 17:03:49 +0200
Message-Id: <AA347147-88BC-4B0F-AD8D-BE0AA9C41AD4@dominion.thruhere.net>
References: <cover.1311605321.git.bruce.ashfield@windriver.com>
	<35b13046d50006f3eec3f0cbfd37c8463c1fb485.1311605321.git.bruce.ashfield@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: saul.wold@intel.com
Subject: Re: [PATCH 1/1] machine/qemu: set preferred linux-yocto kernel version
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
X-List-Received-Date: Mon, 25 Jul 2011 15:13:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jul. 2011, om 16:51 heeft Bruce Ashfield het volgende geschreven:

> The introduction of the linux-yocto-3.0 kernel is taking
> precedence over the known working 2.6.37 version. Forcing
> 2.6.37 until 3.0 is validated on the qemu machines.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> meta/conf/machine/include/qemu.inc |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/qemu.inc =
b/meta/conf/machine/include/qemu.inc
> index 9ef242f..c2d116f 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -12,6 +12,7 @@ RDEPENDS_kernel-base =3D ""
>=20
> # Use a common kernel recipe for all QEMU machines
> PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
> +PREFERRED_VERSION_linux-yocto =3D "2.6.37+git%"

Please not that this won't do anything on incremental builds or when =
using package feeds since the cat is already out of the bag for the =
3.0rc7 version.=


