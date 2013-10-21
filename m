Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id C62116D159;
	Mon, 21 Oct 2013 10:38:39 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so597651eek.6
	for <multiple recipients>; Mon, 21 Oct 2013 03:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uqZGxAfv1THTR6uRIwYWLTjXurdB7H6A8PIcrtcxivg=;
	b=YNFAd14/ZNEcbmT55XG4Y8oB9mHbONbjKOQOauTrVrqn6GkY3mKdzsVbjLSa0rzCcY
	E7mxOaOaoJ8V1m3LsNz3CjnneWWz/QwLrTnKbtTKkCpCr+whdlKGvHVjiLYdQxye1GQV
	1KfjvQTcJJntk1D7igUeVAhW/dZKwIwiQ2sZm1z9I7TiVX8kQde2zKLkJVXB213rWIQ0
	8751MfwbARX6SlPUKrp9nbZop75DeAm5ajQOw+MhxY5mHpLZ5hWoumEqtbN7kUuVpOfn
	mLSpdDBrhViQY4IDm/eYh+nLbkfcHH7/4NJqDWg8hva4awYtVqxra9LrJuliT9HRkCYF
	5F4w==
X-Received: by 10.14.246.197 with SMTP id q45mr1136161eer.120.1382351920621;
	Mon, 21 Oct 2013 03:38:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id i1sm42234085eeg.0.2013.10.21.03.38.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Oct 2013 03:38:40 -0700 (PDT)
Date: Mon, 21 Oct 2013 12:38:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20131021103841.GC3709@jama>
References: <20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
	<20131020194345.GB3709@jama>
	<CAAQYJAvrTQUXHeaNcMQyE88WAF1ZySq6y+hCJD3Kpob9dOkhSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAvrTQUXHeaNcMQyE88WAF1ZySq6y+hCJD3Kpob9dOkhSg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 21 Oct 2013 10:38:41 -0000
X-Groupsio-MsgNum: 46091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline

--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 10:58:45AM +0200, Andrea Adami wrote:
> <cut>
> > qemux86* common (5):
> > meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecboot=
-klibc-image.bb, do_rootfs
> </cut>
>=20
> Hi Martin, thanks for taking care of all those builds.
> About this new do_rootfs failure [1], it seems related to update-rc.d
> /postinst code.
>=20
> As you already know, for this image we don't want any initscript nor
> package manager cruft but now and then some change in oe-core opens
> unwanted doors...
>=20
> I'll investigate what's happening: seems strange it only fails on x86*.

This world build didn't have this fix included:
http://git.openembedded.org/openembedded-core/commit/?id=3D2b179d90eacc58f0=
b217f64407782a9174362850

it's queued for next one, maybe it will help.

> | makedevs: No entry for root in search list
is also interesting, should it be calling makedevs in this initramfs
(IIRC kexecboot is creating all dev nodes manually?)


>=20
> Cheers
> Andrea
>=20
>=20
> [1]
> ERROR: Function failed: do_rootfs (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.23292)
> ERROR: Logfile of failure stored in:
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.23292
> Log data follows:
> | DEBUG: Executing python function rootfs_process_ignore
> | DEBUG: Python function rootfs_process_ignore finished
> | DEBUG: Executing python function rootfs_runtime_mapping
> | DEBUG: Python function rootfs_runtime_mapping finished
> | DEBUG: Executing shell function do_rootfs
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/Packages.
> | Updated list of available packages in
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe.
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/all/Packages.
> | Updated list of available packages in
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-al=
l.
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/i586/Packages.
> | Updated list of available packages in
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-i5=
86.
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/qemux86/Packages.
> | Updated list of available packages in
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-qe=
mux86.
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/Packages.
> | Updated list of available packages in
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe.
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/all/Packages.
> | Updated list of available packages in
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-al=
l.
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/i586/Packages.
> | Updated list of available packages in
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-i5=
86.
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/qemux86/Packages.
> | Updated list of available packages in
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-qe=
mux86.
> | Installing kexec-klibc (2.0.2-r0.16) to root...
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/i586/kexec-klibc_2.0.2-r0.16_i586.ipk.
> | Installing run-postinsts (1.0-r9.26) to root...
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/i586/run-postinsts_1.0-r9.26_i586.ipk.
> | Installing update-rc.d (0.7-r5.37) to root...
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/all/update-rc.d_0.7-r5.37_all.ipk.
> | Installing ubiattach-klibc (1.5.0-r0.28) to root...
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/i586/ubiattach-klibc_1.5.0-r0.28_i586.ipk.
> | Installing kexecboot-klibc (0.6-r0.2) to root...
> | Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc=
/deploy/ipk/qemux86/kexecboot-klibc_0.6-r0.2_qemux86.ipk.
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-=
linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/info/run-=
postinsts.postinst:
> 8: /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe=
-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/info/run=
-postinsts.postinst:
> /etc/init.d/run-postinsts: not found
> | update-rc.d: /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/wor=
k/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs/etc/init.d=
/run-postinsts
> exists during rc.d purge (continuing)
> |  Removing any system startup links for run-postinsts ...
> |  Adding system startup for
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs/etc/init.d/run-postinsts.
> | Configuring kexecboot-klibc.
> | Configuring ubiattach-klibc.
> | Configuring kexec-klibc.
> | Configuring update-rc.d.
> | Configuring run-postinsts.
> | Building from feeds activated!
> | Running intercept scripts:
> | log_check: Using
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.23292
> as logfile
> | Logfile is clean
> | makedevs: No entry for root in search list
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_rootfs (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.23292)
> NOTE: recipe initramfs-kexecboot-klibc-image-1.0-r0: task do_rootfs: Fail=
ed
> ERROR: Task 25930
> (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-initr=
amfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb,
> do_rootfs) failed with exit code '1'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJlBDEACgkQN1Ujt2V2gBxTCwCgsqmYMpaoHTb6MNMnN7sXLpLg
eXIAnj6GEsHIm6S1y3r1zW2YHhbCGLd8
=KgSz
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--
