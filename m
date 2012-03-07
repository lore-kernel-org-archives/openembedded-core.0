Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S5CG6-0002hw-2H
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 09:30:06 +0100
Received: by wera1 with SMTP id a1so3779635wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2012 00:21:29 -0800 (PST)
Received: by 10.180.103.35 with SMTP id ft3mr2057958wib.0.1331108489457;
	Wed, 07 Mar 2012 00:21:29 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j3sm12923280wiw.1.2012.03.07.00.21.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 00:21:28 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <83eeb4ed11a6a63abda1f3978c849a46516b92a1.1331107546.git.dvhart@linux.intel.com>
Date: Wed, 7 Mar 2012 09:21:27 +0100
Message-Id: <AE0C8B23-EB0D-4DD3-9BF9-22BAEB66969F@dominion.thruhere.net>
References: <cover.1331107546.git.dvhart@linux.intel.com>
	<83eeb4ed11a6a63abda1f3978c849a46516b92a1.1331107546.git.dvhart@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlLonLrd3T6KIGh1SzVoJ5uDHIB/sBHzVwUsJY1fSy2S1cJewxNpsp+Jc9g6C83aM3lsozd
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] kernel.bbclass: Remove warnings for modutils and modprobe.d
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
X-List-Received-Date: Wed, 07 Mar 2012 08:30:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 mrt. 2012, om 09:06 heeft Darren Hart het volgende geschreven:

> Fixes [Yocto #2036]
>=20
> The source and build directories are unused, remove them.
>=20
> The modutils and modprobe.d directories may be used if modules are =
built that
> are either autoloaded or have modprobe.d entries. This isn't known at =
install
> time, so check after the package split if these directories are empty =
and
> remove them if they are.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/kernel.bbclass |   10 ++++++++++
> 1 files changed, 10 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 8fbec90..169df33 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -105,6 +105,8 @@ kernel_do_install() {
> 		oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=3D"${D}" =
modules_install
> 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
> 		rm -f =
"${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
> +		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
> +		rm "${D}/lib/modules/${KERNEL_VERSION}/source"

How do you want to support on-target building of exernal modules?

regards,

Koen=


