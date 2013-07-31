Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id CE29E6ADE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 22:36:44 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so1323019pbb.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=0p1PsKDscqc5N6m3PZ4/0PvAyLJqdkSUYYqRxQPINAg=;
	b=TsexatJGnm5eYpL0LyeAW3SJsETn0xNoSX37HdVuco7a9iIkHwSnxQRZ2TLf2mIBH/
	d0b8z6y12uff3c1A6Pgx0jhMtGO8a2APC3D2VcpFBSUVsks8LaoAzqkaoezbtU53CqOd
	ucwCJQpETHYcs/nBoaTK6uSXtcBwV+MmtHv+q6Twwrd4sfKbvfi3lpcu0gqkiaYfsXeL
	RlW5IT2659m7IYRBelVw+auiix+0lJLRwaYuJdD1ebeA9AbInP9UcHNRMMvT9u/JsSQ+
	peTyvHqu8yeVMq1+s+XkPe+QAPrOnyt10hqHPrUVfKAqhUOG0Vp8fCzXcE1VvPDVA1dV
	w9gA==
X-Received: by 10.66.232.39 with SMTP id tl7mr459843pac.140.1375310205596;
	Wed, 31 Jul 2013 15:36:45 -0700 (PDT)
Received: from sa-nc-spg-213.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id nj9sm443026pbc.13.2013.07.31.15.36.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 15:36:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1375082184-14871-1-git-send-email-lpapp@kde.org>
Date: Wed, 31 Jul 2013 15:36:43 -0700
Message-Id: <10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
To: Laszlo Papp <lpapp@kde.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Wed, 31 Jul 2013 22:36:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 29, 2013, at 12:16 AM, Laszlo Papp <lpapp@kde.org> wrote:

> This is necessary to get the build going, for instance with older Code =
Sourcery
> compilers.
>=20
> It is also disabled in upstream due to this very reason. The details =
can be
> found on the following links:
>=20
> http://comments.gmane.org/gmane.linux.busybox/30999
> =
http://git.busybox.net/busybox/commit/?h=3D1_21_stable&id=3D1cd769a154b04f=
4b058beed482a5dd7192437cdc
>=20
> [YOCTO #4932]

while we use relatively newer toolchain and kernel headers as default. =
this patch is not as appealing
to me. However since busy box now uses same config fragment management =
infra like linux-yocto you could
convert this into a config fragment and then not use it by default. This =
patch as such will be a regression
for normal users.

>=20
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
> meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-
> meta/recipes-core/busybox/busybox.inc              | 2 --
> 2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig =
b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> index bdfdadf..e77a817 100644
> --- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> @@ -705,7 +705,7 @@ CONFIG_MICROCOM=3Dy
> # CONFIG_MT is not set
> # CONFIG_RAIDAUTORUN is not set
> # CONFIG_READAHEAD is not set
> -CONFIG_RFKILL=3Dy
> +# CONFIG_RFKILL is not set
> # CONFIG_RUNLEVEL is not set
> # CONFIG_RX is not set
> # CONFIG_SETSID is not set
> diff --git a/meta/recipes-core/busybox/busybox.inc =
b/meta/recipes-core/busybox/busybox.inc
> index acd2bfb..0e84f4c 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -66,8 +66,6 @@ def features_to_busybox_settings(d):
> 	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', =
cnf, rem)
> 	busybox_cfg('ipv4', distro_features, =
'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
> 	busybox_cfg('ipv6', distro_features, =
'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
> -	busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
> -	busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, =
rem)
> 	return "\n".join(cnf), "\n".join(rem)
>=20
> # X, Y =3D ${@features_to_uclibc_settings(d)}
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


