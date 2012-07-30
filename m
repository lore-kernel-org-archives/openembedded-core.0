Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Svrpe-0002fp-Qr
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 17:24:30 +0200
Received: by wgbdr1 with SMTP id dr1so4372919wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gcY9UGyCEHg9VglmrJ/nWRP9sMV50Tr5OPHcFzcd9HQ=;
	b=Gvd5Rx29dlaJn/wNZpBlbxdzPvVFaMCtxLKl+bspM310XZt6x/ILCGJhbFTT8I4PKu
	8dBAdSJLHbaataRoJGiNSoZ7bGJvuiPi0BntkEQQRrmtkJ6iPGHZypxFFf0tJ821J8PK
	niHkvGukqH+BIlKSlAm3LIBdRra8O0t8vT0FT7hU70/q/6mZGt5dPVh/yZytB7+RsbKd
	GNY8hHu8Y3i84/N+jPwOnbRC9so88OWW4NeLcjU/WK0N5h6E/hmN9XDn7pdMoVMkV9/E
	UcnSKaxvufDeEnPWvVqMUKHOAtH/Q9dvRrt+B4EXhijCJYuFBAOcbWsIW2L2yZCjg1US
	bWcw==
Received: by 10.216.134.169 with SMTP id s41mr3862946wei.183.1343661174942;
	Mon, 30 Jul 2012 08:12:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm1306642wiz.4.2012.07.30.08.12.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 08:12:53 -0700 (PDT)
Date: Mon, 30 Jul 2012 17:12:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120730151249.GK3261@jama.jama.net>
References: <1343660594-16583-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1343660594-16583-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] udev-extraconf: merge with udev-extra-rules from meta-oe
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
X-List-Received-Date: Mon, 30 Jul 2012 15:24:30 -0000
X-Groupsio-MsgNum: 26494
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/0P/MvzTfyTu5j9Q"
Content-Disposition: inline

--/0P/MvzTfyTu5j9Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 30, 2012 at 05:03:14PM +0200, Martin Jansa wrote:
> * license in meta-oe was MIT, in oe-core it was GPLv2, everyone fine with this?
> * add mount.blacklist to CONFFILES
> * add more rules and scripts from meta-oe
> * change PV to 1.0 and bump PR to provide upgrade path from meta-oe's udev-extra-rules
>   including RREPLACE/RPROVIDES/RCONFLICTS trio

BTW: this shows bug in opkg file owner tracking code:

Similar to http://code.google.com/p/opkg/issues/detail?id=51

Upgrading udev-extraconf (1.0-r5) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//all/udev-extraconf_1.0-r5_all.ipk.
Removing package udev-extra-rules from root...
Configuring udev-extraconf.

SHR root@Nokia-N900 / $ opkg files udev-extraconf
Package udev-extraconf (1.0-r5) is installed on root and has the following files:

But the files are there:
SHR root@Nokia-N900 / $ ll /etc/udev/rules.d/
total 20
-rw-r--r-- 1 root root 748 Jul 30 14:57 automount.rules
-rw-r--r-- 1 root root 757 Jul 30 14:57 autonet.rules
-rw-r--r-- 1 root root 742 Jul 30 14:57 local.rules
-rw-r--r-- 1 root root 728 Jul 25 09:33 modprobe.rules
-rw-r--r-- 1 root root 855 Jul 25 09:33 touchscreen.rules

Next install shows them properly:
SHR root@Nokia-N900 / $ opkg install -force-reinstall udev-extraconf
Removing package udev-extraconf from root...
Installing udev-extraconf (1.0-r5) to root...
Downloading http://jama.dyndns-home.com/org.openembedded.shr-core//all/udev-extraconf_1.0-r5_all.ipk.
Configuring udev-extraconf.

SHR root@Nokia-N900 / $ opkg files udev-extraconf
Package udev-extraconf (1.0-r5) is installed on root and has the
following files:
/etc/udev/rules.d/local.rules
/etc/udev/rules.d/automount.rules
/etc/udev/scripts/network.sh
/etc/udev/rules.d/autonet.rules
/etc/udev/scripts/
/etc/udev/scripts/mount.sh
/etc/udev/mount.blacklist


--/0P/MvzTfyTu5j9Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAWpHEACgkQN1Ujt2V2gBym4gCfSHZccPe3YuI1c9IUpJMz+1CR
6NwAn0zU6vu1FSP032VC8VmUDRSb0dea
=YSOy
-----END PGP SIGNATURE-----

--/0P/MvzTfyTu5j9Q--
