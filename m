Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EEE47771F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:58:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i138so8468054wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CXUEkxcWSywSeVkmZS00d3gDmpF65V+aMnsHPdNn2RY=;
	b=XDe2tYF0hy5vj8S122vL3cjP6h2jk5+PECM+OGhi1zPcgzk0kzQ1Q4+p7JUt6mijvU
	C+qNjKU0yeW5tQMg3kjIJ7XsHjNMp4N415fqvYAoAbm0QdrTNqxj/g1k9beQ4Gh2Z5uv
	RRMAz+J9pQ+5WF8q1MTtseg0gnIBpesxa2NIq+0HoZ8+xXk3eANc9jJBOvPCCbC8+cJK
	0ae/ccYUfCtPUQuOsryMBGzoUVH8ztkqydKTh1QfjBcNFCyucI9uSGA0uInsUwEA+oNq
	w0x5z4QpGk67Ok5phJWafX7OkAU6PQIGqwmfEr0in0IetncfPP5ibVR4ccTzuDRmTnFP
	lgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CXUEkxcWSywSeVkmZS00d3gDmpF65V+aMnsHPdNn2RY=;
	b=k1dVHXUYjpuMH1TnRD1Oaw6v5l9YwC1YrBscz//HKUwJnm7UjMi5er/xwXGob1YrTM
	M9oYwGsXhlwPu63UHBJZA/IXcxxXgF+5Wtn0d4yXA1roZ47MfY8EbTETq9ozZc6ZiykY
	pm0fe3oImFj+Zzg95cDp/Z1W6knw6+jlfW6CqX3yAICBKaodBAiI8ZgBEqWTuvjeNvLd
	YZTDm8dEUetmHfTh8HXgpMSTQeiV3/JbGndyjBhqrWGJpFKNAQ14UosuLWOerb/8TFVx
	jTQAJdzhy7DXfoVC10fGBoEEUks9xUn+hC7BVCeSd5HleocDz1jheb0Q2ekWjSTMfaMA
	Q8IA==
X-Gm-Message-State: AEkoousdEYnWAhniV9JUII8eLM4+5MwlKZ4mPOLamuIQUCPd070uzfRVz8xHS883jLLYeQ==
X-Received: by 10.194.175.170 with SMTP id cb10mr3063785wjc.17.1470823089053; 
	Wed, 10 Aug 2016 02:58:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	t185sm4549949wma.2.2016.08.10.02.58.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Aug 2016 02:58:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Aug 2016 11:58:12 +0200
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160810095812.duksmuoyl5r6t5zt@jama>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 00/10] replace xtscal with xinput-calibrator
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
X-List-Received-Date: Wed, 10 Aug 2016 09:58:10 -0000
X-Groupsio-MsgNum: 85609
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w3kn44f2tlcvlhb5"
Content-Disposition: inline

--w3kn44f2tlcvlhb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 12:30:19PM +0300, Maxin B. John wrote:
> Remove xtscal in preference of xinput-calibrator
>=20
> [YOCTO #9365]
> [YOCTO #8380]
>=20
> Changes in v2:
>     1. Removed bash dependency from xinput-calibrator
>     2. Moved tslib recipe from oe-core since modern systems tend to use
>        kernel driver or libinput
>     3. removed pointercal reference from packagegroup-core-x11-base
>     4. removed tslib references from packagegroup-core-tools-testapps
>=20
> The following changes since commit dfc016fbf13e62f7767edaf7abadf1d1b72680=
b2:
>=20
> maintainers.inc: remove augeas (2016-08-02 14:05:58 +0100)

It would be nice to order the changes in this series that the recipes
are removed only after the references to them to keep the history
bisect-able, e.g. xtscal, tslib and pointercal are removed while they are s=
till
referenced from elsewhere.

> are available in the git repository at:
>=20
> git://git.yoctoproject.org/poky-contrib maxin/xtscal
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dmaxin/xtscal
>=20
> Maxin B. John (10):
>   xtscal: remove recipe
>   x11-common: replace xtscal with xinput-calibrator
>   pointercal-xinput: add a dummy calibration file for qemu
>   packagegroup-core-x11-base.bb: remove pointercal
>   xinput-calibrator: remove bash dependency
>   pointercal: remove recipe
>   tslib: remove recipe
>   packagegroup-core-tools-testapps: remove tslib references
>   distro_alias.inc: remove xtscal, pointercal and tslib references
>   layer.conf: remove pointercal
>=20
>  meta/conf/distro/include/distro_alias.inc          |   3 -
>  meta/conf/layer.conf                               |   1 -
>  meta/recipes-bsp/pointercal/pointercal/COPYING     |   2 -
>  meta/recipes-bsp/pointercal/pointercal/pointercal  |   0
>  .../pointercal/pointercal/qemuarm/pointercal       |   1 -
>  .../pointercal/pointercal/qemuarmv6/pointercal     |   1 -
>  .../pointercal/pointercal/qemuarmv7/pointercal     |   1 -
>  .../pointercal/pointercal/qemumips/pointercal      |   1 -
>  .../pointercal/pointercal/qemuppc/pointercal       | Bin 36 -> 0 bytes
>  .../pointercal/pointercal/qemux86-64/pointercal    |   1 -
>  .../pointercal/pointercal/qemux86/pointercal       |   1 -
>  meta/recipes-bsp/pointercal/pointercal_0.0.bb      |  22 -
>  .../packagegroup-core-tools-testapps.bb            |   2 -
>  .../packagegroups/packagegroup-core-x11-base.bb    |   1 -
>  meta/recipes-graphics/tslib/tslib/ts.conf          |  25 -
>  meta/recipes-graphics/tslib/tslib/tslib.sh         |   8 -
>  meta/recipes-graphics/tslib/tslib_1.1.bb           |  53 --
>  meta/recipes-graphics/x11-common/x11-common_0.1.bb |   2 +-
>  .../pointercal-xinput/qemuall/pointercal.xinput    |   2 +
>  .../add-geometry-input-when-calibrating.patch      |  31 +-
>  .../xinput-calibrator/xinput-calibrator_git.bb     |   2 +-
>  .../xtscal/xtscal/30xTs_Calibrate.sh               |  13 -
>  .../xtscal/xtscal/change-cross.patch               |  18 -
>  meta/recipes-graphics/xtscal/xtscal/cleanup.patch  | 621 ---------------=
------
>  .../xtscal/dso_linking_change_build_fix.patch      |  27 -
>  meta/recipes-graphics/xtscal/xtscal_0.6.3.bb       |  33 --
>  26 files changed, 20 insertions(+), 852 deletions(-)
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/COPYING
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/pointercal
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarm/pointe=
rcal
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarmv6/poin=
tercal
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarmv7/poin=
tercal
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemumips/point=
ercal
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuppc/pointe=
rcal
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemux86-64/poi=
ntercal
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemux86/pointe=
rcal
>  delete mode 100644 meta/recipes-bsp/pointercal/pointercal_0.0.bb
>  delete mode 100644 meta/recipes-graphics/tslib/tslib/ts.conf
>  delete mode 100644 meta/recipes-graphics/tslib/tslib/tslib.sh
>  delete mode 100644 meta/recipes-graphics/tslib/tslib_1.1.bb
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput/qemuall/pointercal.xinput
>  delete mode 100644 meta/recipes-graphics/xtscal/xtscal/30xTs_Calibrate.sh
>  delete mode 100644 meta/recipes-graphics/xtscal/xtscal/change-cross.patch
>  delete mode 100644 meta/recipes-graphics/xtscal/xtscal/cleanup.patch
>  delete mode 100644 meta/recipes-graphics/xtscal/xtscal/dso_linking_chang=
e_build_fix.patch
>  delete mode 100644 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
>=20
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w3kn44f2tlcvlhb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleq+iEACgkQN1Ujt2V2gBw2bwCaAwQJ/LpKgFWQVcCy0M88DKgr
d3AAoJr4ZtXZVpzgg2ETaLRP6DGb/R6+
=9Inc
-----END PGP SIGNATURE-----

--w3kn44f2tlcvlhb5--
