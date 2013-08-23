Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id F1B4361013
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 04:00:09 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa1so152660pad.19
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mZ7NtEFMwYQNmdii7vmTiYfg+ZYBHiZQALMSqh4RBY4=;
	b=lytwUiAar750qzlzUnC0vaaUVgHPs+uEV76Uo5Dl366JcvY1hCD5rNhbwvd8L+GI2O
	zMtRlcQeUfdT/WxDcn61angzvLmOd/J9yKVc5hpOYxuBPxJ340N+tIEfpUk9vgzORkux
	1beHt4jimOmSfPrFc7DfGYZbH9F1As+R/B122dP9mtj5HifTtBE5el89kT4YOh4yS+Xk
	HOiIHx5/kvNAXUWNWBevfqwtqPPd2qjZ1qeXvwRWpGSN+S4Jk5436DyASXMWfiW0UVw2
	TMhOpD0g1rHXlxVCb1yU3sUUlWgz284zHZaxMrzmfyknMayrIHxbWsJEFtMZKgGsnZ+0
	fgmw==
X-Received: by 10.68.106.99 with SMTP id gt3mr8913005pbb.116.1377230409724;
	Thu, 22 Aug 2013 21:00:09 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id sz3sm18508928pbc.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 21:00:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <52168CC1.5050906@linux.intel.com>
Date: Thu, 22 Aug 2013 21:00:06 -0700
Message-Id: <76D3B97F-7A74-4AC3-B7E2-CFDA076983DF@gmail.com>
References: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
	<52168CC1.5050906@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: World build on OE-Core
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
X-List-Received-Date: Fri, 23 Aug 2013 04:00:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 22, 2013, at 3:12 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/22/2013 02:24 PM, Khem Raj wrote:
>> Hi
>>=20
>> In spare cycles my box ran world build for all eglibc/qemus, arm, =
ppc, mips looks all fine however I see errors on mips64,x86 and x86_64
>> I am looking into the mips64 one.
>>=20
>> x86_64
>> =3D=3D=3D=3D=3D=3D
>>=20
>> Summary: 17 tasks failed:
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-lib=
/libxft_2.3.1.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/cairo/ca=
iro_1.12.14.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstrea=
mer/gst-plugins-base_0.10.36.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/blue=
z/bluez4_4.101.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/curl/curl=
_7.32.0.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/beecrypt/=
beecrypt_4.2.1.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-xse=
rver/xserver-xorg_1.14.0.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/mesa/mes=
a_9.1.6.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-core/glib-network=
ing/glib-networking_2.36.2.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/enchant/e=
nchant_1.6.0.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/neon/neon=
_0.30.0.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstrea=
mer/gstreamer1.0-plugins-base_1.0.9.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/taglib/ta=
glib_1.8.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-extended/parted/p=
arted_3.1.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-extended/libuser/=
libuser_0.59.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/near=
d/neard_0.10.bb, do_compile
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/blue=
z5/bluez5_5.7.bb, do_compile
>>=20
> I do regular builds on my local machine of world and qemumips (not =
mips64) with MUT, I wonder what your failures are.

Do you build OE-Core or poky ?

>  I will do a scratch build right now.
>=20
> What's your exact setup?  any other settings in your local.conf?


I checkout OE-Core and bitbake and have default local.conf and  I append =
following to local.conf

DISTRO_FEATURES_append =3D " systemd"
# DISTRO_FEATURES_BACKFILL_CONSIDERED_append =3D " sysvinit"
VIRTUAL-RUNTIME_dev_manager =3D "udev"
VIRTUAL-RUNTIME_login_manager =3D "busybox"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
VIRTUAL-RUNTIME_keymaps =3D "keymaps"


>=20
> Sau!
>=20
>=20
>>=20
>> x86
>> =3D=3D=3D=3D
>>=20
>> Summary: 1 task failed:
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-dri=
ver/xf86-video-intel_2.21.13.bb, do_compile
>>=20
> This is strange because we do world builds regularly.
>=20
>>=20
>> mips64
>> =3D=3D=3D=3D=3D=3D
>>=20
>> Summary: 1 task failed:
>>   =
/builds1/angstrom/sources/openembedded-core/meta/recipes-devtools/dpkg/dpk=
g_1.17.1.bb, do_configure
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>>=20


