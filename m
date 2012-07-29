Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SvT7w-0005aD-Uh; Sun, 29 Jul 2012 15:01:44 +0200
Received: by weyr6 with SMTP id r6so2771898wey.6
	for <multiple recipients>; Sun, 29 Jul 2012 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IBTyKGDp2+s/fqrakv2ajWXmXbC2J7HEsbtY+Gcz0es=;
	b=FmW/1uF4wgSiCsHrQTFV65LamHilvvNSe86W41fE995KSPq9bXcxhLcpTO3UdPrJSi
	pMuCdcf6SUf+6ygwT0fRKFLous9kT/KOo3FlHt1J9JPsa5neoLjc94XkgHms4tJFg9lg
	aJ/sy2zc2zj7+mctHOzrwv2Qtq00EIlkvd6vTxVt3bH2guNVuV3XV8mIb+HWH3KHy3Ny
	BpKexupr7uewaxHsVy2x65LQRnRweUy8yWhyxDIfi5D6PvEi90CnsS381fgDj9QR2C84
	dMDckEAMlOQdRjJPs3+yttFCkkaFJpHfkgzSt9+UIjVw/EHLjStgoqwQh0t/Sc0JAcTl
	gwDQ==
Received: by 10.216.131.170 with SMTP id m42mr3614541wei.82.1343566210456;
	Sun, 29 Jul 2012 05:50:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm10369518wib.5.2012.07.29.05.50.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 05:50:09 -0700 (PDT)
Date: Sun, 29 Jul 2012 14:50:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120729125003.GE3261@jama.jama.net>
References: <20120722104358.0339C10217@opal>
	<20120723111829.GA20311@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120723111829.GA20311@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python: Update for python-native changes
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
X-List-Received-Date: Sun, 29 Jul 2012 13:01:45 -0000
X-Groupsio-MsgNum: 26462
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Content-Disposition: inline

--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 01:18:29PM +0200, Martin Jansa wrote:
> On Sun, Jul 22, 2012 at 10:43:53AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 284a65d55f0ffad0f4f7f32d72da0f9410578643
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D284a65d55f0ffad0f4f7f32d72da0f9410578643
> >=20
> > Author: Morgan Little <morgan.little@windriver.com>
> > Date:   Thu Jul 19 13:46:07 2012 -0400
> >=20
> > python: Update for python-native changes
> >=20
> > Add pythonnative onto the list of inherits and update the paths to the =
binaries
> > referenced in the recipe to the new paths.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
>=20
> Any idea why is opkg package-index now failing _sometimes_ ?
>=20
> | + '[' -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/d=
eploy/ipk/ ']'
> | + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/de=
ploy/ipk/Packages
> | + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/de=
ploy/ipk/Packages.flock -c 'opkg-make-index -r /var/lib/jenkins/jobs/shr-co=
re/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/jenkins/jo=
bs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /var/lib/j=
enkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/'
> | Traceback (most recent call last):
> |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sy=
sroots/x86_64-linux/usr/lib/python2.7/site.py", line 569, in <module>
> |     main()
> |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sy=
sroots/x86_64-linux/usr/lib/python2.7/site.py", line 552, in main
> |     known_paths =3D addsitepackages(known_paths)
> |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sy=
sroots/x86_64-linux/usr/lib/python2.7/site.py", line 329, in addsitepackages
> |     for sitedir in getsitepackages():
> |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sy=
sroots/x86_64-linux/usr/lib/python2.7/site.py", line 303, in getsitepackages
> |     sitepackages.append(os.path.join(prefix, sys.lib,
> | AttributeError: 'module' object has no attribute 'lib'
> | ERROR: Function failed: do_package_index (see /var/lib/jenkins/jobs/shr=
-core/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/package-in=
dex-1.0-r0/temp/log.do_package_index.17223 for further information)
> NOTE: package package-index-1.0-r0: task do_package_index: Failed

similar issue when building libxcb (http://pastie.org/4352949), works after=
 applying

http://patchwork.openembedded.org/patch/31987/
http://patchwork.openembedded.org/patch/31977/

and bitbake -c cleansstate libxcb-native libxcb xcb-proto-native xcb-proto =
to rebuild them (missing PR bumps).

Cheers,

NOTE: package inputproto-1_2.2-r0: task do_populate_sysroot: Started
ERROR: Function failed: do_compile (see /OE/shr-core/tmp-eglibc/work/armv7a=
-vfp-neon-oe-linux-gnueabi/libxcb/libxcb-1.8.1-r0/temp/log.do_compile.17687=
 for further information)
ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/armv7a-vf=
p-neon-oe-linux-gnueabi/libxcb/libxcb-1.8.1-r0/temp/log.do_compile.17687
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make
| Making all in src
| make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon=
-oe-linux-gnueabi/libxcb/libxcb-1.8.1-r0/libxcb-1.8.1/src'
| /usr/bin/python ./c_client.py -p /OE/shr-core/tmp-eglibc/sysroots/crespo/=
/usr/lib64/python2.7/site-packages /OE/shr-core/tmp-eglibc/sysroots/crespo/=
/usr/share/xcb/xproto.xml
|=20
| Failed to load the xcbgen Python package!
| Make sure that xcb/proto installed it on your Python path.
| If not, you will need to create a .pth file or define $PYTHONPATH
| to extend the path.
| Refer to the README file in xcb/proto for more info.
|=20
| Traceback (most recent call last):
|   File "./c_client.py", line 2307, in <module>
|     from xcbgen.state import Module
| ImportError: No module named xcbgen.state
| make[1]: *** [xproto.c] Error 1
| make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-=
oe-linux-gnueabi/libxcb/libxcb-1.8.1-r0/libxcb-1.8.1/src'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /OE/shr-core/tmp-eglibc/work/armv=
7a-vfp-neon-oe-linux-gnueabi/libxcb/libxcb-1.8.1-r0/temp/log.do_compile.176=
87 for further information)
NOTE: package libxcb-1.8.1-r0: task do_compile: Failed
ERROR: Task 2798 (/OE/shr-core/openembedded-core/meta/recipes-graphics/xcb/=
libxcb_1.8.1.bb, do_compile) failed with exit code '1'
Waiting for 1 running tasks to finish:
0: inputproto-1_2.2-r0 do_populate_sysroot (pid 17723)
NOTE: package inputproto-1_2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 2315 tasks of which 1252 didn't need to be r=
erun and 1 failed.
ERROR: An uncaught exception occured in runqueue, please see the failure be=
low:

Summary: 1 task failed:
  /OE/shr-core/openembedded-core/meta/recipes-graphics/xcb/libxcb_1.8.1.bb,=
 do_compile
Summary: There were 4 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAVMXsACgkQN1Ujt2V2gByrewCgqeD8scvwZR5YcUsv899ncQD/
UJYAnjBS2eBrKY1SZEZCx+ypfGrWDKGw
=zsqQ
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
