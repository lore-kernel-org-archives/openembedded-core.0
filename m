Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIFp5-0006oF-R0
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 11:28:27 +0200
Received: by wgbdq11 with SMTP id dq11so2553646wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2012 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=E0P4E2MehlToAZLRaXG2VmOsL4V7y+r52mbU2BkuD7M=;
	b=a0Av2vJ1Kf2NGzl7f9u+dSaSpF/wCj20jO27EPXJnLcqtd/A/xF2DmNKCIXIU5p1R7
	8pFsN14B4px0B9SsE2oR3ZY0JH9g14TJ8h8kfqXE5vFI1uPUuTGQcy0m3cRnLuSFA8ia
	T0lmiG0X9jEW2IEW/ovOCBW0TUEqPGP6Ry0yOe3ATE2mwUE8PrKnTaaXDsUa40/lXN3D
	3bTG4+2JaT5rrtVRK0eI6dwHrqYbltCajWb1ZEhMSMQDRvkNDPrejQhM3HGJDzszob/r
	yGaQ4OwBxe+PQcAK8xFmLZ98dOIr1NYcaDeQzcCryOs8Jx8OYidvC0L9MQjEVD3ZufA7
	KVog==
Received: by 10.180.82.34 with SMTP id f2mr5832274wiy.17.1348996532560;
	Sun, 30 Sep 2012 02:15:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ct3sm9704738wib.5.2012.09.30.02.15.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Sep 2012 02:15:31 -0700 (PDT)
Date: Sun, 30 Sep 2012 11:15:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120930091546.GC3299@jama.jama.net>
References: <20120930070906.GA3299@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120930070906.GA3299@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Fetcher errors when looking for sstate package in do_package_write_ipk_setscene
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
X-List-Received-Date: Sun, 30 Sep 2012 09:28:27 -0000
X-Groupsio-MsgNum: 30157
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline

--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 30, 2012 at 09:09:06AM +0200, Martin Jansa wrote:
> In last few days I often see errors when looking for sstate packages. The=
y aren't fatal, build continues,=20
> but in the end bitbake returns non-zero exit code:
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> Which causes jenkins jobs seeing it as failure. Can we hide fetcher error=
 in this case?
>=20
> NOTE: recipe shr-version-1.020120930-r0: task do_package_write_ipk_setsce=
ne: Started
> WARNING: Failed to fetch URL file://5c/sstate-shr-version-om_gta02-oe-lin=
ux-gnueabi-1.020120930-r0-om_gta02-2-5c3135b290962ddfbeb18f87956911bb_deplo=
y-ipk.tgz,
> attempting MIRRORS if available
> ERROR: Fetcher failure: Unable to find file file://5c/sstate-shr-version-=
om_gta02-oe-linux-gnueabi-1.020120930-r0-om_gta02-2-5c3135b290962ddfbeb18f8=
7956911bb_deploy-ipk.tgz
> anywhere. The paths that were searched were:

The file is there, but with different PV
PV =3D "1.0${DISTRO_VERSION}"
DISTRO_VERSION =3D "${DATE}"

-rw-rw-r-- 1 jenkins nogroup 918 Sep 30 10:53
/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/sstate-cache/5c/=
sstate-shr-version-om_gta02-oe-linux-gnueabi-1.020120928-r0-om_gta02-2-5c31=
35b290962ddfbeb18f87956911bb_deploy-ipk.tgz
-rw-rw-r-- 1 jenkins nogroup 13K Sep 30 10:53
/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/sstate-cache/5c/=
sstate-shr-version-om_gta02-oe-linux-gnueabi-1.020120928-r0-om_gta02-2-5c31=
35b290962ddfbeb18f87956911bb_deploy-ipk.tgz.siginfo

So it's correct that it's not reused from sstate, just the fetcher error
shouldn't be ERROR imho.

Cheers,

>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/task-package_writ=
e_ipk_setscene
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/linux-gnueabi
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/arm
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/build-linux
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/pn-shr-version
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/armv4
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/shr
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/class-target
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/forcevariable
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/thumb
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/libc-glibc
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/task-package_write_i=
pk_setscene
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/linux-gnueabi
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/arm
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/build-linux
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/pn-shr-version
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/armv4
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/shr
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/class-target
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/forcevariable
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/thumb
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/libc-glibc
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/task-package_write_ipk_setscene
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/linux-gnueabi
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/arm
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/build-linux
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/pn-shr-version
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/armv4
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/shr
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/class-target
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/forcevariable
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/thumb
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/libc-glibc
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/task-package_write_i=
pk_setscene
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/linux-gnueabi
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/arm
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/build-linux
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/pn-shr-version
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/armv4
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/shr
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/class-target
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/forcevariable
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/thumb
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/libc-glibc
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version-1.020120930/
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/task-package_write_ipk_setscene
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/linux-gnueabi
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/arm
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/build-linux
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/pn-shr-version
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/armv4
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/shr
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/class-target
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/forcevariable
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/thumb
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/libc-glibc
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr-version/
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/task-package_write_ipk_setscene
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/linux-gnueabi
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/arm
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/build-linux
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/pn-shr-version
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/armv4
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/shr
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/class-target
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/forcevariable
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/thumb
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/libc-glibc
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/files/
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/task-package_write_ipk_setscene
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/linux-gnueabi
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/arm
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/build-linux
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/pn-shr-version
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/armv4
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/om-gta02
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/shr
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/class-target
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/forcevariable
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/thumb
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/libc-glibc
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smart=
phone/meta-shr/recipes-shr/shr/.
>     /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/sstate-cac=
he
> NOTE: recipe xserver-common-1.34-r8: task do_populate_sysroot_setscene: S=
ucceeded
> NOTE: recipe shr-version-1.020120930-r0: task do_package_write_ipk_setsce=
ne: Failed
> WARNING: Setscene task 642 (/var/lib/jenkins/jobs/shr-core-branches/works=
pace/shr-core/meta-smartphone/meta-shr/recipes-shr/shr/shr-version.bb, do_p=
ackage_write_ipk_setscene) failed with exit code '1' - real task will be ru=
n instead
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBoDcIACgkQN1Ujt2V2gBwpmQCgmAi1ulbrW+aR0AaJQYc072cn
IBwAniZ7gGuRBUS3li/HXhxrUNqV0Ab6
=hKVz
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
