Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id F18AD65E3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 05:41:58 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so632637wes.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=LxW4V8A7AuyfhdWn5ngQOAFikSPtScPbgbvSNNEECgY=;
	b=FTGVjdVozvABKJ9h4ta9G4Is3peykszMY3W6vlNnu/O9gg/oMt1eHDjDeDG7/4gg+h
	MXB5a37pfY75l9J0/P94XTBjKfqh6jyhg3v14FdW6Z/DIJq3RUZMcEtFwHj5KB3WJaUP
	Tj0KrjMYEuhmDsNir5ocrX/C74GS8/X2a/M7BvIY3PmpRMhGHF3jX7cNyuIa9zb5Vntv
	AoJzbn8xznjgIRcb7PRBQR1P5YGzqcgEO6HmkcPyGxB711TYyT8FivqEqlZ5Hr1BdECs
	fCE7gw48nZCJZSax5A/e/7VwWIVVmVEGHo43Hayg5gNlbuO/kfEbMSm4CSpi6xsPF0WM
	3qSg==
X-Gm-Message-State: ALoCoQlhSedTP7Bblmbr3V9nDOdsJuAFnUNQG4MXRkB7qNUlqPUR7iM8B+eXEosNq+UJSYCwNaEG
X-Received: by 10.194.60.240 with SMTP id k16mr2476367wjr.109.1406698918854;
	Tue, 29 Jul 2014 22:41:58 -0700 (PDT)
Received: from ?IPv6:2001:610:612::c150:86c7:d217:85ec?
	([2001:610:612:0:c150:86c7:d217:85ec])
	by mx.google.com with ESMTPSA id bx2sm2841000wjb.47.2014.07.29.22.41.57
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jul 2014 22:41:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4ab37f4698f7da551ba81818e7bcbe9267502594.1406599885.git.Qi.Chen@windriver.com>
Date: Wed, 30 Jul 2014 07:41:56 +0200
Message-Id: <6945F403-2326-4B96-9B1D-D09956AE2E01@dominion.thruhere.net>
References: <cover.1406599885.git.Qi.Chen@windriver.com>
	<4ab37f4698f7da551ba81818e7bcbe9267502594.1406599885.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/1] systemd: upgrade to 215
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
X-List-Received-Date: Wed, 30 Jul 2014 05:42:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jul. 2014, om 04:12 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:

> Upgrade systemd from 213 to 215.
>=20
> systemd-older-kernel.patch is removed as it's fixed in 215.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> .../systemd/systemd/systemd-older-kernel.patch     |   56 =
--------------------
> .../systemd/{systemd_213.bb =3D> systemd_215.bb}     |    8 +--
> 2 files changed, 4 insertions(+), 60 deletions(-)
> delete mode 100644 =
meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> rename meta/recipes-core/systemd/{systemd_213.bb =3D> systemd_215.bb} =
(99%)
>=20
> diff --git =
a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch =
b/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> deleted file mode 100644
> index 18b50e7..0000000
> --- a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -=46rom 6109f02dcc4f2d7a461c5772bab494f5753a2203 Mon Sep 17 00:00:00 =
2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 29 May 2014 08:09:07 +0000
> -Subject: [PATCH] rtnl-types.c: check IFLA_VLAN_PROTOCOL
> -
> -The older kernel's linux/if_link.h doesn't have IFLA_VLAN_PROTOCOL, =
we need
> -check whether it has been defined or not.
> -
> -The maintainer said that he would fix it:
> -
> -http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18200
> -
> -Also we need redefine IFLA_MAX from 34 to 35 when define =
IFLA_CARRIER,
> -otherwise there would be error:
> -
> -| src/libsystemd/sd-rtnl/rtnl-types.c:233:9: error: array index in =
initializer exceeds array bounds
> -|          [IFLA_CARRIER]          =3D { .type =3D NLA_U8 },
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - src/libsystemd/sd-rtnl/rtnl-types.c | 2 ++
> - src/shared/missing.h                | 2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/src/libsystemd/sd-rtnl/rtnl-types.c =
b/src/libsystemd/sd-rtnl/rtnl-types.c
> -index 44ac5ec..ab6161f 100644
> ---- a/src/libsystemd/sd-rtnl/rtnl-types.c
> -+++ b/src/libsystemd/sd-rtnl/rtnl-types.c
> -@@ -67,7 +67,9 @@ static const NLType =
rtnl_link_info_data_vlan_types[IFLA_VLAN_MAX + 1] =3D {
> -         [IFLA_VLAN_EGRESS_QOS]  =3D { .type =3D NLA_NESTED },
> -         [IFLA_VLAN_INGRESS_QOS] =3D { .type =3D NLA_NESTED },
> - */
> -+#ifdef IFLA_VLAN_PROTOCOL
> -         [IFLA_VLAN_PROTOCOL]    =3D { .type =3D NLA_U16 },
> -+#endif
> - };
> -=20
> - static const NLType rtnl_link_info_data_bond_types[IFLA_BOND_MAX + =
1] =3D {
> -diff --git a/src/shared/missing.h b/src/shared/missing.h
> -index d5ec2f8..732853f 100644
> ---- a/src/shared/missing.h
> -+++ b/src/shared/missing.h
> -@@ -94,6 +94,8 @@
> -=20
> - #ifndef IFLA_CARRIER
> -   #define IFLA_CARRIER 33
> -+  #undef IFLA_MAX
> -+  #define IFLA_MAX 35
> -   #ifndef IFLA_NUM_RX_QUEUES
> -     #define IFLA_NUM_RX_QUEUES 32
> -     #ifndef IFLA_NUM_TX_QUEUES
> ---=20
> -1.8.3.4
> -
> diff --git a/meta/recipes-core/systemd/systemd_213.bb =
b/meta/recipes-core/systemd/systemd_215.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_213.bb
> rename to meta/recipes-core/systemd/systemd_215.bb
> index 5de7cdc..b1ffbdd 100644
> --- a/meta/recipes-core/systemd/systemd_213.bb
> +++ b/meta/recipes-core/systemd/systemd_215.bb
> @@ -17,9 +17,9 @@ SECTION =3D "base/shell"
>=20
> inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest
>=20
> -SRCREV =3D "c9679c652b3c31f2510e8805d81630680ebc7e95"
> +SRCREV =3D "252ff40a3827b4e8e62e03a5e2f80da3fe02bee6"
>=20
> -PV =3D "213+git${SRCPV}"
> +PV =3D "215+git${SRCPV}"
>=20
> SRC_URI =3D =
"git://anongit.freedesktop.org/systemd/systemd;branch=3Dmaster;protocol=3D=
git \
>            file://binfmt-install.patch \
> @@ -35,8 +35,7 @@ SRC_URI =3D =
"git://anongit.freedesktop.org/systemd/systemd;branch=3Dmaster;protocol=3D=

>            file://00-create-volatile.conf \
>            file://init \
>            file://run-ptest \
> -           file://systemd-older-kernel.patch \
> -          "
> +         "
>=20
> S =3D "${WORKDIR}/git"
>=20
> @@ -231,6 +230,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
>                 ${exec_prefix}/lib/systemd \
>                 ${exec_prefix}/lib/modules-load.d \
>                 ${exec_prefix}/lib/sysctl.d \
> +                ${exec_prefix}/lib/sysusers.d \

Those really need to go into CONFFILES as well=

