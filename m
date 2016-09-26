Return-Path: <joe.konno@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF5B6069D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 15:02:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 26 Sep 2016 08:02:15 -0700
Message-Id: <4f15c9$v5iu4p@fmsmga001.fm.intel.com>
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,400,1470726000"; d="scan'208";a="1046050969"
Received: from jbkonno-cardamom.jf.intel.com ([10.54.75.7])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2016 08:02:16 -0700
Date: Mon, 26 Sep 2016 08:02:15 -0700
From: Joe Konno <joe.konno@linux.intel.com>
To: Ian Geiser <geiseri@geekcentral.pub>
In-Reply-To: <1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
References: <cover.1474562101.git.akuster808@gmail.com>
	<1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
Organization: Intel Corporation
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/60] krogoth-next staged
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
X-List-Received-Date: Mon, 26 Sep 2016 15:02:14 -0000
X-Groupsio-MsgNum: 87540
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/hV7QlF+ZQsp8+QIfTBXVNkb";
	protocol="application/pgp-signature"

--Sig_/hV7QlF+ZQsp8+QIfTBXVNkb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I saw this as well. Opened the following bug:
  * https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10329

On Sat, 24 Sep 2016 10:48:00 -0400
Ian Geiser <geiseri@geekcentral.pub> wrote:

> I think the systemd change may have broken something.  It looks like it i=
s running a useradd with no arguments other than the root. Now I see the fo=
llowing error in krogoth:
>=20
> from "tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0=
/temp/log.do_install"
>=20
> DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linu=
x', 'common-glibc', 'i586-linux', 'common']
> DEBUG: Executing shell function useradd_sysroot
> Running groupadd commands...
> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/=
tmp-glibc/sysroots/unified -r lock]
> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/=
tmp-glibc/sysroots/unified  -r systemd-journal]
> NOTE: systemd: group systemd-journal already exists, not re-creating it
> Running useradd commands...
> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/t=
mp-glibc/sysroots/unified     --system -d / -M --shell /bin/nologin systemd=
-timesync]
> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/t=
mp-glibc/sysroots/unified    ]
> Usage: useradd [options] LOGIN
>        useradd -D
>        useradd -D [options]
>=20
> Options:
>   -b, --base-dir BASE_DIR       base directory for the home directory of =
the
>                                 new account
>   -c, --comment COMMENT         GECOS field of the new account
>   -d, --home-dir HOME_DIR       home directory of the new account
>   -D, --defaults                print or change default useradd configura=
tion
>   -e, --expiredate EXPIRE_DATE  expiration date of the new account
>   -f, --inactive INACTIVE       password inactivity period of the new acc=
ount
>   -g, --gid GROUP               name or ID of the primary group of the new
>                                 account
>   -G, --groups GROUPS           list of supplementary groups of the new
>                                 account
>   -h, --help                    display this help message and exit
>   -k, --skel SKEL_DIR           use this alternative skeleton directory
>   -K, --key KEY=3DVALUE           override /etc/login.defs defaults
>   -l, --no-log-init             do not add the user to the lastlog and
>                                 faillog databases
>   -m, --create-home             create the user's home directory
>   -M, --no-create-home          do not create the user's home directory
>   -N, --no-user-group           do not create a group with the same name =
as
>                                 the user
>   -o, --non-unique              allow to create users with duplicate
>                                 (non-unique) UID
>   -p, --password PASSWORD       encrypted password of the new account
>   -P, --clear-password PASSWORD clear password of the new account
>   -r, --system                  create a system account
>   -R, --root CHROOT_DIR         directory to chroot into
>   -s, --shell SHELL             login shell of the new account
>   -u, --uid UID                 user ID of the new account
>   -U, --user-group              create a group with the same name as the =
user
>=20
> WARNING: /mnt/bitbake/build/detos/tmp-glibc/work/i586-oe-linux/systemd/1_=
229+gitAUTOINC+714c62b463-r0/temp/run.useradd_sysroot.31611:1 exit 1 from '=
exit 1'
> ERROR: systemd: useradd command did not succeed.
>=20
>=20


--Sig_/hV7QlF+ZQsp8+QIfTBXVNkb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJX6Th3AAoJEI2IR9UvSqpmP4IQAMdoh+ymOQ0YohMu2yzPUdsL
bxiq0dAeqLlKE4s7yvnfg5GLxpv08E/+vH5cnD7ZgB/YZd2sq/eqZV0Fzsefx+do
bQN/qSna1S+78VRWdVM1wV8bD9ibhcJp2uGA1vHE4egSF2dvpgY4I3MBQ7lKkdwe
DJfX+UqadIxg8m1Hn8zr1yZroJ9VaImjrbYWACOY+hWjY2tIeTxfNOc0EAXVJN5I
9croXThbwVh+K8SMpuDJCHux2dyc2KwxXxgUBewxMaWITzpmzfe0c5HIUqMlIKPh
EP5F0noCZgQcP8VmDwOVftCPXotrEKBfv/pKZXOu7mMycL2YglBQ831VT28x8ljn
hdNOacYsjyoAP87mCXlsD6+AXOkAdaxLG7kt5XHhf7PvuaTzx6mqB1IW9Istk7R1
CQv14XWpGVTO2ZImqUcZqjEuGPFOv4Grn9dRz4JBPP9+tL0H5y2+UJKiDj2IMRZ0
E3rpWTMnXNPtJJmyIhLykOQSWmKVX7zTwaHRGlfNKyYKNWUf3AH5TRtIszRxl3Mx
sVKUHYsAhMcXnp3nS/J7JpU7oMcwky4t/8t72OqI6b58xmqN8phHJQWhae5N/KEH
wCcFd/xrL5t34DPHL6ngrzDFxPLT6oG67JWx3JGflePalZdZ68KLqyfoVVu2qC6Y
95Iux7OagAq9KYlOgBc5
=v1u4
-----END PGP SIGNATURE-----

--Sig_/hV7QlF+ZQsp8+QIfTBXVNkb--
