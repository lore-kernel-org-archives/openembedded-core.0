Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRUxG-0000OE-JI
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 23:27:06 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so120528wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2012 14:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=8Gayr3Und+tXTxO2h/+U/wLDG77hrMomlKqeFmUV5RM=;
	b=CvjJwiKD6VQBf3S6a4bMGtZ6TaOgS4tz/ene6wdYtAuz0UMnMQdrg00QfDg+W1Svbn
	4K67BUIljJ+ZfMQvouoPuqZKzARElAZcsU+xPiNQYmxYrawKfJSq6zLDK4HdE99legC3
	aGbmUKnC3hqKy++/nqywvrU15wTIV3VpgAWGgxG5ZaV0eaEk4Rth6pbERGCwyCevEVBt
	eH9d/my8F4VP34740Pz2ysjLCWBMMPNIl8wX30/rRt7fVk0PhsGptbdEs1FWG+8iCyzT
	BZP6DFVJXeFFXGv7Es5q6P44XHTktO1r6QHmwHHOao/jnhzu6sNL3dWloK3o9AG4nSV0
	/nvA==
Received: by 10.180.87.132 with SMTP id ay4mr248033wib.5.1351199617025;
	Thu, 25 Oct 2012 14:13:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm11806700wif.4.2012.10.25.14.13.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 14:13:34 -0700 (PDT)
Date: Thu, 25 Oct 2012 23:13:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121025211353.GS3269@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Different "allarch" stamps directory for packagegroup recipe
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
X-List-Received-Date: Thu, 25 Oct 2012 21:27:06 -0000
X-Groupsio-MsgNum: 30977
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E6EZ4qVJn/rWPYaj"
Content-Disposition: inline

--E6EZ4qVJn/rWPYaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

While building qemux86-64 and couple of armv7a and armv4t machines in the s=
ame tmpdir=20
I got strange error in do_package:

NOTE: recipe packagegroup-core-x11-1.0-r40: task do_package_write_ipk: Star=
ted
ERROR: Error executing a python function in /OE/shr-core/openembedded-core/=
meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb:
ExpansionError: Failure expanding variable SUMMARY, expression was ${SUMMAR=
Y} - Debugging files which triggered exception Exception: variable SUMMARY =
references itself!

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "do_package_ipk", line 193, in <module>
ERROR:
ERROR:   File "do_package_ipk", line 96, in do_package_ipk
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 293, in get=
Var
ERROR:     return self.expand(value, var)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 157, in exp=
and
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 147, in exp=
andWithRefs
ERROR:     raise ExpansionError(varname, s, exc)
ERROR:
ERROR: The code that was being executed was:  =20
ERROR:      0189:        bb.utils.unlockfile(lf)
ERROR:      0190:
ERROR:      0191:
ERROR:      0192:
ERROR:  *** 0193:do_package_ipk(d)
ERROR:      0194:
ERROR: [From file: 'do_package_ipk', lineno: 193, function: <module>]
ERROR:      0092:                    if localdata.getVar(f) is None:
ERROR:      0093:                        raise KeyError(f)
ERROR:      0094:                # Special behavior for description...
ERROR:      0095:                if 'DESCRIPTION' in fs:
ERROR:  *** 0096:                    summary =3D localdata.getVar('SUMMARY'=
, True) or localdata.getVar('DESCRIPTION', True) or "."
ERROR:      0097:                    description =3D localdata.getVar('DESC=
RIPTION', True) or "."
ERROR:      0098:                    description =3D textwrap.dedent(descri=
ption).strip()
ERROR:      0099:                    ctrlfile.write('Description: %s\n' % s=
ummary)
ERROR:      0100:                    ctrlfile.write('%s\n' % textwrap.fill(=
description, width=3D74, initial_indent=3D' ', subsequent_indent=3D' '))
ERROR: [From file: 'do_package_ipk', lineno: 96, function: do_package_ipk]
ERROR: Function failed: do_package_ipk
ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/all-oe-li=
nux-gnueabi/packagegroup-core-x11-1.0-r40/temp/log.do_package_write_ipk.240=
73
NOTE: recipe packagegroup-core-x11-1.0-r40: task do_package_write_ipk: Fail=
ed
ERROR: Task 2773 (/OE/shr-core/openembedded-core/meta/recipes-graphics/pack=
agegroups/packagegroup-core-x11.bb, do_package_write_ipk) failed with exit =
code '1'

While looking in stamps directory I've noticed that qemux86-64 was using di=
fferent=20
subdirectory then arm builds. packagegroup.bbclass does not inherit allarch=
=2Ebbclass,
only sets=20
PACKAGE_ARCH =3D "all"
should it set also TARGET_OS?

OE nokia900@shr ~/shr-core/tmp-eglibc/stamps $ ls */packagegroup-core-x11-1*
all-oe-linux-gnueabi/packagegroup-core-x11-1.0-r40.do_build
all-oe-linux-gnueabi/packagegroup-core-x11-1.0-r40.do_package_setscene
all-oe-linux-gnueabi/packagegroup-core-x11-1.0-r40.do_package_write
all-oe-linux-gnueabi/packagegroup-core-x11-1.0-r40.do_populate_lic_setscene
all-oe-linux-gnueabi/packagegroup-core-x11-1.0-r40.do_populate_sysroot_sets=
cene.nokia900
all-oe-linux-gnueabi/packagegroup-core-x11-1.0-r40.do_populate_sysroot_sets=
cene.om-gta02
all-oe-linux-gnueabi/packagegroup-core-x11-1.0-r40.do_populate_sysroot_sets=
cene.om-gta04
all-oe-linux-gnueabi/packagegroup-core-x11-1.0-r40.do_populate_sysroot_sets=
cene.tuna
all-oe-linux/packagegroup-core-x11-1.0-r40.do_build
all-oe-linux/packagegroup-core-x11-1.0-r40.do_compile
all-oe-linux/packagegroup-core-x11-1.0-r40.do_configure
all-oe-linux/packagegroup-core-x11-1.0-r40.do_fetch
all-oe-linux/packagegroup-core-x11-1.0-r40.do_install
all-oe-linux/packagegroup-core-x11-1.0-r40.do_package
all-oe-linux/packagegroup-core-x11-1.0-r40.do_package.sigdata.63dc7a62d8e97=
40c34d18728830aed44
all-oe-linux/packagegroup-core-x11-1.0-r40.do_package_write
all-oe-linux/packagegroup-core-x11-1.0-r40.do_package_write_ipk_setscene
all-oe-linux/packagegroup-core-x11-1.0-r40.do_patch
all-oe-linux/packagegroup-core-x11-1.0-r40.do_populate_lic
all-oe-linux/packagegroup-core-x11-1.0-r40.do_populate_lic.sigdata.8451162b=
66b25e639ed440c09fbbf766
all-oe-linux/packagegroup-core-x11-1.0-r40.do_populate_sysroot_setscene.qem=
ux86-64
all-oe-linux/packagegroup-core-x11-1.0-r40.do_unpack
OE nokia900@shr ~/shr-core/tmp-eglibc/stamps $ ls */packagegroup-core-ssh-o=
penssh*
all-oe-linux-gnueabi/packagegroup-core-ssh-openssh-1.0-r1.do_build
all-oe-linux-gnueabi/packagegroup-core-ssh-openssh-1.0-r1.do_package_setsce=
ne
all-oe-linux-gnueabi/packagegroup-core-ssh-openssh-1.0-r1.do_package_write
all-oe-linux-gnueabi/packagegroup-core-ssh-openssh-1.0-r1.do_populate_lic_s=
etscene
all-oe-linux-gnueabi/packagegroup-core-ssh-openssh-1.0-r1.do_populate_sysro=
ot_setscene.nokia900
all-oe-linux-gnueabi/packagegroup-core-ssh-openssh-1.0-r1.do_populate_sysro=
ot_setscene.om-gta02
all-oe-linux-gnueabi/packagegroup-core-ssh-openssh-1.0-r1.do_populate_sysro=
ot_setscene.om-gta04
all-oe-linux-gnueabi/packagegroup-core-ssh-openssh-1.0-r1.do_populate_sysro=
ot_setscene.tuna
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_build
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_compile
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_configure
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_fetch
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_install
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_package
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_package.sigdata.c398f5=
83265815c38b5295be14baf99e
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_package_write
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_package_write_ipk_sets=
cene
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_patch
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_populate_lic
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_populate_lic.sigdata.a=
dbcefb359671185ec720b654b496707
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_populate_sysroot_setsc=
ene.qemux86-64
all-oe-linux/packagegroup-core-ssh-openssh-1.0-r1.do_unpack

Only those 2 recipes seem to have this problem (from what I'm building here)

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E6EZ4qVJn/rWPYaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCJq5EACgkQN1Ujt2V2gBzeCQCghzoRLhfDB4oY1H2dzg5ExJ4s
2JgAoJ/UX8C8ijz0esfxDMRCsWY3Srhz
=tZsV
-----END PGP SIGNATURE-----

--E6EZ4qVJn/rWPYaj--
