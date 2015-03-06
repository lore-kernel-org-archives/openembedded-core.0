Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 305176017E;
	Fri,  6 Mar 2015 06:27:49 +0000 (UTC)
Received: by wesu56 with SMTP id u56so57450386wes.10;
	Thu, 05 Mar 2015 22:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qaSnt+u49sO8HGrFm+n83Cd/53de6hkC5inczEHPMlc=;
	b=RZvBwP+MM/SypAlGupzq1bHKYGQHqmapFZV41YPLG2J9skwuuTGt8KjhPeAJbqf7yG
	QFrQiOh6k7/2A5z+PxFjZ8GMuJLAwfiWDLx2xNwTL+Lk4MNy93YYuWlHSMaiADwwfvJR
	rRrKn0+MGlMGpNzuuSIJ67PWC7KkL+7/zPyQR37VKN8XFRp1oKHNzX2Gabka9+xW4nRX
	mYK1NTE1FFJNgBMLc4fOl6Ifjw0lmnW8qDgkVctw3izuVMVTxHibzgk3+xrky9GtRpWF
	k85zWrlA4W97JTTeFU2SiaZL9JIAFpwT+nT4AwSs2VlDfmqBGN+xZnEwWZ1fRB43yT3d
	nGew==
X-Received: by 10.194.177.195 with SMTP id cs3mr25042387wjc.141.1425623270340; 
	Thu, 05 Mar 2015 22:27:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n3sm13492020wja.36.2015.03.05.22.27.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 22:27:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Mar 2015 07:27:55 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150306062755.GD2337@jama>
References: <20141211092332.GA2467@jama>
 <20150305212212.GZ2337@jama>
MIME-Version: 1.0
In-Reply-To: <20150305212212.GZ2337@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, test-dependencies 2015-03-05
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
X-List-Received-Date: Fri, 06 Mar 2015 06:27:50 -0000
X-Groupsio-MsgNum: 63030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSMWOr4h/ZU3vZ/E"
Content-Disposition: inline

--aSMWOr4h/ZU3vZ/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 10:22:12PM +0100, Martin Jansa wrote:
> On Thu, Dec 11, 2014 at 10:23:32AM +0100, Martin Jansa wrote:
> > On Sat, Aug 09, 2014 at 11:01:10AM +0200, Martin Jansa wrote:
> > > Complete logs:
> > > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140=
808_063907.log/
> > >=20
> > > ERROR: 483 issues were found in these recipes: directfb engrave epiph=
any expedite gd gmtk gnome-disk-utility gst-ffmpeg guile leptonica libarchi=
ve libmicrohttpd libmikmod libungif libwebp libwmf mariadb midori mpd mpeg2=
dec mpg123 openal-soft opendataplane oscam piglit protobuf snort sox stunne=
l synergy tesseract tracker
> >=20
> > Complete logs;
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.2014121=
0_162427.log/
> >=20
> > This was only partial build, so the results don't look so bad.
> > ERROR: 27 issues were found in these recipes: android-audiosystem
> > collectd fbida gnome-bluetooth gst-plugins-bad mongodb opencv
> > polkit-gnome qtbase tcpdump udisks xbmc xfce4-vala
> >=20
> > Found differences:=20
> > WARN: collectd: collectd rdepends on libcrypto, but it isn't a build de=
pendency?
> > WARN: collectd: collectd rdepends on libesmtp, but it isn't a build dep=
endency?
> > WARN: collectd: collectd rdepends on libssl, but it isn't a build depen=
dency?
> > WARN: fbida: fbida rdepends on libwebp, but it isn't a build dependency?
> > WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on gst-plugins-bad=
-rtmp, but it isn't a build dependency?
> > WARN: opencv: libopencv-highgui rdepends on jasper, but it isn't a buil=
d dependency?
> > WARN: opencv: libopencv-highgui rdepends on libdc1394, but it isn't a b=
uild dependency?
> > WARN: qtbase: qtbase-plugins rdepends on cups-lib, but it isn't a build=
 dependency?
> > WARN: tcpdump: tcpdump rdepends on libsmi, but it isn't a build depende=
ncy?
> > WARN: udisks: udisks rdepends on lvm2, but it isn't a build dependency?
> >=20
> > Found errors:=20
> > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created when=
 building with minimal dependencies?
> > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't created =
when building with minimal dependencies?
>=20
> I've another partial build which basically confirmed that some of these
> issues are still there.
>=20
> Found differences:=20
> WARN: fbida: fbida rdepends on libwebp, but it isn't a build dependency?
> WARN: fbida: fbida rdepends on lirc, but it isn't a build dependency?
> WARN: qt5-creator: qt5-creator rdepends on qt-creator, but it isn't a bui=
ld dependency?
> WARN: tcpdump: tcpdump rdepends on libsmi, but it isn't a build dependenc=
y?
> WARN: udisks: udisks rdepends on lvm2, but it isn't a build dependency?
>=20
> Logs weren't uploaded this time, because we've run out of space on
> logs.nslu2-linux.org/buildlogs/

Now we have the logs as well
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20150305_21=
3704.log/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aSMWOr4h/ZU3vZ/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT5SOsACgkQN1Ujt2V2gBzaKQCcCiYiopLFAQAEouVG6Zhh54+z
KNgAn3MsmFc+sJJx13FkLxvExqyFa+eq
=3RdD
-----END PGP SIGNATURE-----

--aSMWOr4h/ZU3vZ/E--
