Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id EB37E71637;
	Wed, 14 Jan 2015 18:50:00 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so13246772wiv.0;
	Wed, 14 Jan 2015 10:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jdO1Wrbykz3yYnkO9T0NP3Vf4OWTTGU3pTSieIDW9Mc=;
	b=S06ZYtvxcqipKm8APHPwfIo3Ql8gUr0tmTodVl0RQW8Lk97ABdtGGVG4ECVsa/RpY/
	mGLeTbVsObZIVG/hQ6ExXKgHwqcvViWP0wlkpQgZNa1wuJTdNtcu3MVF9DMOC6hVmNPd
	7SEB0lDLWre0p4nWhVGlRiBQOqBmilunXgLFiqbcaxzcsAIwgEIOzyiWqDf5LGlKO+Rj
	bn8ebhqyE3QMgjZI1IUbEGN0auIsRQEbM5wwvROO1PN53nourUg3sRtzVtJps4vSPYmW
	vNZ3g6IqQRe94PzqpUfzX2mMuCFKRr00YCkOykukX2ewj8XfbK9xQPJzV4zi31sKuweu
	/3Kw==
X-Received: by 10.180.94.37 with SMTP id cz5mr52069899wib.61.1421261399873;
	Wed, 14 Jan 2015 10:49:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g2sm23134434wjn.11.2015.01.14.10.49.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jan 2015 10:49:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Jan 2015 19:50:01 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150114185001.GA24855@jama>
References: <20140801134613.GE16445@jama>
MIME-Version: 1.0
In-Reply-To: <20140801134613.GE16445@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, wrong PACKAGE_ARCHs 2015-01-14
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
X-List-Received-Date: Wed, 14 Jan 2015 18:50:08 -0000
X-Groupsio-MsgNum: 61379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 03:46:13PM +0200, Martin Jansa wrote:
> On Thu, Jul 24, 2014 at 01:19:01PM +0200, Martin Jansa wrote:
> > This is new report generated with oe-core/scripts/sstate-diff-machines.=
sh
> > =20
> > To reproduce it, you need "qemux86copy" MACHINE which is the same as
> > qemux86 only with different name (to simulate 2 MACHINEs with same
> > TUNE_PKGARCH in oe-core). You can find commit adding "qemux86copy" in
> > jansa/master branch:
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/ma=
ster
> >=20
> > Current logs:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20140724_=
010942.log/
> >=20
> > jansa/master branches are containing couple of pending changes (mostly
> > to remove allarch), so if you try it with current master branches it
> > will be (a lot) worse.
>=20
> Just for test I've just dropped these fixes, so a few more issues reporte=
d now:
>=20
> ERROR: 63 issues were found in these recipes: android-tools dracut
> font-alias initramfs-framework initscripts ipsec-tools linux-firmware
> lmsensors oprofile oprofileui oprofileui-server
> polkit-group-rule-datetime polkit-group-rule-network ppp-dialin
> qt-demo-init resolvconf run-postinsts shr-theme-neo sysvinit
> terminus-font tipcutils ttf-arphic-uming ttf-dejavu ttf-droid
> ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-liberation ttf-mplus
> ttf-sazanami ttf-ubuntu-font-family ttf-wqy-zenhei usbinit vpnc
> weston-init xfce4-session xl2tpd xserver-common xserver-nodm-init
> xuser-account

Nothing was merged or fixed since last report:

With my pending changes:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20150113_1903=
46.log/
ERROR: 5 errors found in 1421175826/signatures.qemux86.do_configure.sigdata=
=2Elog
ERROR: 6 errors found in 1421175826/signatures.qemux86.do_populate_sysroot.=
sigdata.log
ERROR: 13 errors found in 1421175826/signatures.qemux86.do_package_write_ip=
k.sigdata.log
ERROR: 7 errors found in 1421175826/signatures.qemuarm.do_configure.sigdata=
=2Elog
ERROR: 7 errors found in 1421175826/signatures.qemuarm.do_populate_sysroot.=
sigdata.log
ERROR: 24 errors found in 1421175826/signatures.qemuarm.do_package_write_ip=
k.sigdata.log

ERROR: 64 issues were found in these recipes: android-tools docbook-xsl-sty=
lesheets dracut font-alias initscripts ipsec-tools libauthen-sasl-perl libd=
igest-hmac-perl libio-socket-ssl-perl linux-atm lmsensors luna-sysmgr-ipc-m=
essages oprofile oprofileui oprofileui-server phpmyadmin polkit-group-rule-=
datetime polkit-group-rule-network shr-theme-neo terminus-font tipcutils tt=
f-arphic-uming ttf-dejavu ttf-droid ttf-gentium ttf-hunkyfonts ttf-inconsol=
ata ttf-liberation ttf-mplus ttf-sazanami ttf-ubuntu-font-family ttf-wqy-ze=
nhei vpnc xfce4-session xl2tpd xserver-common xserver-nodm-init

Without my pending changes:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20150114_0838=
19.log/
ERROR: 5 errors found in 1421224721/signatures.qemux86.do_configure.sigdata=
=2Elog
ERROR: 7 errors found in 1421224721/signatures.qemux86.do_populate_sysroot.=
sigdata.log
ERROR: 14 errors found in 1421224721/signatures.qemux86.do_package_write_ip=
k.sigdata.log
ERROR: 8 errors found in 1421224721/signatures.qemuarm.do_configure.sigdata=
=2Elog
ERROR: 8 errors found in 1421224721/signatures.qemuarm.do_populate_sysroot.=
sigdata.log
ERROR: 28 errors found in 1421224721/signatures.qemuarm.do_package_write_ip=
k.sigdata.log

ERROR: 72 issues were found in these recipes: android-tools docbook-xsl-sty=
lesheets dracut font-alias initramfs-framework initscripts ipsec-tools liba=
uthen-sasl-perl libdigest-hmac-perl libio-socket-ssl-perl linux-atm lmsenso=
rs luna-sysmgr-ipc-messages oprofile oprofileui oprofileui-server phpmyadmi=
n polkit-group-rule-datetime polkit-group-rule-network ppp-dialin python3-d=
istribute resolvconf shr-theme-neo terminus-font tipcutils ttf-arphic-uming=
 ttf-dejavu ttf-droid ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-libera=
tion ttf-mplus ttf-sazanami ttf-ubuntu-font-family ttf-wqy-zenhei vpnc west=
on-init xfce4-session xl2tpd xserver-common xserver-nodm-init

For details see full logs (it's quite long with new bitbake-diffsigs output=
 showing unnecessary runtaskdeps changes (when the list is identical), e.g.:

=3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux8=
6copy and qemux86 =3D=3D=3D
ERROR: ipsec-tools different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.14.1.bb.do_populate_sysroot:virtual:nativ=
e', 'bisonbison_2.7.1.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5=
=2E39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_4.9.bb.do_popul=
ate_sysroot', 'gccgcc-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.20=
=2Ebb.do_populate_sysroot', 'gnu-configgnu-config_20120814.bb.do_populate_s=
ysroot:virtual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoo=
llibtool-cross_2.4.2.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.2.=
bb.do_populate_sysroot', 'linuxlinux-yocto_3.17.bb.do_populate_sysroot', 'o=
pensslopenssl_1.0.1j.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_p=
opulate_sysroot'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual=
:native', 'automakeautomake_1.14.1.bb.do_populate_sysroot:virtual:native', =
'bisonbison_2.7.1.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.39.=
bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_4.9.bb.do_populate_sy=
sroot', 'gccgcc-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.20.bb.do=
_populate_sysroot', 'gnu-configgnu-config_20120814.bb.do_populate_sysroot:v=
irtual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool=
-cross_2.4.2.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.2.bb.do_po=
pulate_sysroot', 'linuxlinux-yocto_3.17.bb.do_populate_sysroot', 'opensslop=
enssl_1.0.1j.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate_=
sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_3.17.bb.do_populate_sysroot with hash b423337f992f3a0dfc7ff2b7=
32aa06f3
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_3.17.bb.do_populate_sysroot with hash 76113e6e66f1c1c0294ed622=
56e1df0b
Hash for dependent task linuxlinux-yocto_3.17.bb.do_populate_sysroot change=
d from b423337f992f3a0dfc7ff2b732aa06f3 to 76113e6e66f1c1c0294ed62256e1df0b

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS2ulkACgkQN1Ujt2V2gBzGNACeMH2rIolU9z9NX+CQ7JW80Vd6
nicAnAq5qFbDqP8T2ocvMrOMLbD3eMD+
=AYqg
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
