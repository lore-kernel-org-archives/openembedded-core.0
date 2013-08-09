Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAE76B478;
	Fri,  9 Aug 2013 07:21:26 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z7so1855493eaf.14
	for <multiple recipients>; Fri, 09 Aug 2013 00:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GiHAGGxhXM5C+fibI1lIbAhBQ3Trj8biRr/CAoF2CIc=;
	b=BmurBrbgFhl4/fp+7Igizq7ESCzLhgSZccjMkKAWnvi4CHbGUZNZVXN3/Idht2v46z
	YF2S6mPbQZSJPstb2tAFtLBbR4n74DhZ4bF1i/pF5cIjF/7ucYaroVry0fIxv5E2NeCV
	8Frca45tbppElJV3hHPcKMuzOgpf7vydB2JvpK4xJLHG1UsBCMej+A0oeSKlu3YCO7F/
	d8bWTRq4SqjTtEmwCvDNeEYZAfazYH8crHIp8gv3jr9E7c+oebnSHTi/ZUp3k7nMKrxO
	wLapOMxsElDjVAkBNLCkSWC367BVomhAjQvZor0RhdwKB0PDozGkspwpNsr0dl9xmV90
	bPLg==
X-Received: by 10.14.8.199 with SMTP id 47mr11955530eer.101.1376032886887;
	Fri, 09 Aug 2013 00:21:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm26176580eex.2.2013.08.09.00.21.25 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 00:21:26 -0700 (PDT)
Date: Fri, 9 Aug 2013 09:22:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130809072212.GC17945@jama>
References: <20130731055135.A7345504BD@opal> <20130808172507.GB3269@jama>
	<5204907A.5040301@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5204907A.5040301@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Hongxu Jia : util-linux: use u-a for su
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
X-List-Received-Date: Fri, 09 Aug 2013 07:21:27 -0000
X-Groupsio-MsgNum: 43141
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline

--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2013 at 02:47:22PM +0800, Hongxu Jia wrote:
> On 08/09/2013 01:25 AM, Martin Jansa wrote:
> > On Wed, Jul 31, 2013 at 05:51:35AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 6190c69a9f78aeef951c39e4c8700e945bbec5f7
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D6190c69a9f78aeef951c39e4c8700e945bbec5f7
> >>
> >> Author: Hongxu Jia <hongxu.jia@windriver.com>
> >> Date:   Fri Jul 26 20:09:08 2013 +0800
> >>
> >> util-linux: use u-a for su
> >>
> >> Use alternatives mechanism to prevent confliction of attempted
> >> installing su binary among busybox, shadow and util-linux.
> >>
> >> [YOCTO #4926]
> >>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > Doesn't seem to work correctly:
> >
> > Configuring util-linux.
> > update-alternatives: Linking //bin/dmesg to /bin/dmesg.util-linux
> > update-alternatives: Linking //bin/kill to /bin/kill.procps
> > update-alternatives: Linking //bin/more to /bin/more.util-linux
> > update-alternatives: Linking //sbin/mkswap to /sbin/mkswap.util-linux
> > update-alternatives: Linking //sbin/blockdev to /sbin/blockdev.util-lin=
ux
> > update-alternatives: Linking //sbin/pivot_root to /sbin/pivot_root.util=
-linux
> > update-alternatives: Linking //sbin/mkfs.minix to /sbin/mkfs.minix.util=
-linux
> > update-alternatives: Linking //usr/bin/hexdump to /usr/bin/hexdump.util=
-linux
> > update-alternatives: Linking //usr/bin/last to /usr/bin/last.util-linux
> > update-alternatives: Linking //usr/bin/logger to /usr/bin/logger.util-l=
inux
> > update-alternatives: Linking //usr/bin/mesg to /usr/bin/mesg.util-linux
> > update-alternatives: Linking //usr/bin/renice to /usr/bin/renice.util-l=
inux
> > update-alternatives: Linking //usr/bin/wall to /usr/bin/wall.util-linux
> > update-alternatives: Linking //usr/bin/setsid to /usr/bin/setsid.util-l=
inux
> > update-alternatives: Linking //usr/bin/chrt to /usr/bin/chrt.util-linux
> > update-alternatives: Linking //usr/bin/flock to /usr/bin/flock.util-lin=
ux
> > update-alternatives: Linking //sbin/hwclock to /bin/busybox.nosuid
> > update-alternatives: Linking //usr/bin/utmpdump to /usr/bin/utmpdump.ut=
il-linux
> > update-alternatives: Linking //usr/bin/eject to /usr/bin/eject.util-lin=
ux
> > update-alternatives: Linking //bin/getopt to /usr/bin/getopt
> > update-alternatives: Error: cannot register alternative su to /usr/bin/=
su since it is already registered to /bin/su
> >
> > SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/su
> > /bin/su
> > /bin/busybox.suid 50
> Are you sure the following patch has been updated to your local branch?
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dhongxu/fix-=
su&id=3D32eee3e731772da04ccb64b4da9ca9b413433674
>=20
> busybox: move /bin/su to /usr/bin/su to match util-linux and shadow
> This patch is used to fix this issue.
>=20
> Maybe you should rebuild busybox and try again.

Maybe opkg was upgrading them in different order and util-linux was
upgraded before busybox, I don't have complete log from first 2 devices,
but I'll keep whole log when upgrading other devices.

If there isn't runtime dependency between busybox and util-linux then it
will probably install them in undeterministic order.

> > should base_bindir be used for ALTERNATIVE_LINK_NAME and bindir for TAR=
GET?
> >
> >> ---
> >>
> >>   meta/recipes-core/util-linux/util-linux.inc |    7 +++++++
> >>   1 files changed, 7 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipe=
s-core/util-linux/util-linux.inc
> >> index 3c8c246..961bcc5 100644
> >> --- a/meta/recipes-core/util-linux/util-linux.inc
> >> +++ b/meta/recipes-core/util-linux/util-linux.inc
> >> @@ -215,3 +215,10 @@ ALTERNATIVE_LINK_NAME[reset] =3D "${bindir}/reset"
> >>   ALTERNATIVE_TARGET[reset] =3D "${base_bindir}/reset"
> >>  =20
> >>   BBCLASSEXTEND =3D "native nativesdk"
> >> +
> >> +python do_package_prepend () {
> >> +    if '--enable-su' in d.getVar('EXTRA_OECONF', True).split():
> >> +        alt_name =3D "su"
> >> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, '%s/%s' % (d.=
getVar('bindir', True), alt_name))
> >> +        d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + =
alt_name)
> >> +}
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIEmKQACgkQN1Ujt2V2gBx4XACeL23Glb5wMIht75Sa5u/CQjPV
4lcAoIXxstziVAneIcRuE+ZoSy9yhiYF
=i8qi
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
