Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6Gyn-0004xi-1B
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 09:12:25 +0200
Received: by fxi1 with SMTP id 1so1367437fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 00:07:07 -0700 (PDT)
Received: by 10.223.63.8 with SMTP id z8mr555997fah.84.1316588827050;
	Wed, 21 Sep 2011 00:07:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k26sm3485503fab.12.2011.09.21.00.07.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 00:07:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <91e9da0fc938b836752d9e956e99931ec61464c0.1316562083.git.sgw@linux.intel.com>
Date: Wed, 21 Sep 2011 09:07:04 +0200
Message-Id: <3688FC08-2B0B-4230-BD32-4C57ED2B6BF1@dominion.thruhere.net>
References: <cover.1316562083.git.sgw@linux.intel.com>
	<91e9da0fc938b836752d9e956e99931ec61464c0.1316562083.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [RC Fixes 7/8] distro tracking: Update Distro Aliases
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
X-List-Received-Date: Wed, 21 Sep 2011 07:12:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 01:43 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> .../conf/distro/include/distro_tracking_fields.inc |   83 =
+++++++++++++++++++-
> 1 files changed, 81 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc =
b/meta/conf/distro/include/distro_tracking_fields.inc
>=20
> DISTRO_PN_ALIAS_pn-task-core-qt =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-sdk =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-sdk-gmae =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-task-core-ssh-dropbear =3D "Poky"
> +DISTRO_PN_ALIAS_pn-task-core-ssh-openssh =3D "Poky"
> DISTRO_PN_ALIAS_pn-task-core-standalone-gmae-sdk-target =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-standalone-sdk-target =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-tools =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-task-core-x11-sato =3D "OE-Core"
> +DISTRO_PN_ALIAS_pn-task-qt4e =3D "Poky"
> +DISTRO_PN_ALIAS_pn-task-qte-toolchain-host-natives =3D "Poky"
> DISTRO_PN_ALIAS_pn-initramfs-boot =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-initramfs-live-boot =3D "OE-Core"
> DISTRO_PN_ALIAS_pn-initramfs-live-install =3D "OE-Core"


That doesn't look right=


