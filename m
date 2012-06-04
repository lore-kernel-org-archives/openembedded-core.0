Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sbaqo-0007gh-3R
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 19:13:54 +0200
Received: by eekd49 with SMTP id d49so1619517eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 10:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=JJp8z2O4ZOSZ9OxHq2ItuX2D2MjAtPjEojqnXVWQ6SA=;
	b=PtoYNxvW+KNg0oEBhI2swwlMASHoJuCWVYKjO34IyjbDV4g9d1umwqJstwxtNVuup3
	D974GBbmxrx4xdU9OI/EkljvvpRBCNMQsx0ZoRfmosY+T6PjcdOl3c9DyUBNGA4rCFi2
	jKuTp8MMbCeGQqTRytrHUBh1a3L34GkcynfTotBqIHjLysGPXryLdVtXbZYHlYCpBsE0
	tPKRi0FB9zOP7w43f9B8uJYu/eDDO6/PhkLzhw+zFj+0E7l0MNoZQo/XIgcZzpdlXUxD
	PgwkC2tuuUgtS6J73nNbsInDyvqqNHwqw4WjnkTkViaJmkTWbrd/9V3Fr+YYZLDYJiYb
	o+8Q==
Received: by 10.14.96.67 with SMTP id q43mr6115636eef.11.1338829409176;
	Mon, 04 Jun 2012 10:03:29 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y54sm39303580eef.10.2012.06.04.10.03.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 10:03:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FCCE8B8.7020705@intel.com>
Date: Mon, 4 Jun 2012 19:03:24 +0200
Message-Id: <5ED865DB-2E68-4D69-A7FA-1AD406330F99@dominion.thruhere.net>
References: <4FCCE8B8.7020705@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQk/+vKQdvqxXBTt0aKxwWahn0d64oNeeWr9y8qXO3SJeWr7IYP+sh//PDb0CXnjyvpUh47+
Subject: Re: [Consolidated Pull 00/19] General pull request
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
X-List-Received-Date: Mon, 04 Jun 2012 17:13:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 jun. 2012, om 18:56 heeft Elizabeth Flanagan het volgende =
geschreven:

> Richard,
>=20
> These patches have been tested on the autobuilder with no introduced =
issues.
>=20
> I've excluded Mark's RPM update until we figure out why it's failing
> do_populate_sdk as well as Cristian Iorga's ltp patch which breaks ltp
> do_compiles.
>=20
> I seem to be having issues posting to the OE-core list from
> git-send-mail, so this
> is being sent outside of git-send-mail.
>=20
> -b
>=20
> The following changes since commit =
de4cdfd6bc1280ac7ac0559b87734d26294ef773:
>=20
>  documentation/kernel-manual/kernel-how-to.xml: Updated to kernel 3.4
> (2012-05-31 21:16:55 +0100)
>=20
> are available in the git repository at:
>  git://git.yoctoproject.org/poky-contrib stage/eflanagan_mut
>=20
> =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstage/eflanagan=
_mut
>=20
> Christopher Larson (3):
>  external-sourcery: extract src and dest sysroot paths from gcc
>  tcmode-external-sourcery: pass -msgxx-glibc for x86
>  external-sourcery-toolchain: forcibly create usr/lib
>=20
> Elizabeth Flanagan (3):
>  license.bbclass: Adding PV to package.manifest
>  license.bbclass: optimize pkg runtime data
>  lsbinitscripts: Missing popt DEPENDS
>=20
> Laurentiu Palcu (2):
>  directfb: upgrade to 1.5.3
>  directfb-examples: upgrade to 1.5.3
>=20
> Radu Moisan (1):
>  dbus: update to version 1.4.20
>=20
> Robert Yang (3):
>  kernel.py: replace os.popen with subprocess.Popen
>  generate-manifest-2.7.py: replace os.popen with os.unlink
>  opkg 0.1.8: respect to the arch when choose the alternatives

And again: NAK on the opkg patch, it breaks feeds.=


