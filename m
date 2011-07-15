Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qhhf6-0005vg-Ph
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 14:38:32 +0200
Received: by wyg30 with SMTP id 30so863948wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 05:34:32 -0700 (PDT)
Received: by 10.216.159.211 with SMTP id s61mr2992345wek.26.1310733272195;
	Fri, 15 Jul 2011 05:34:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r56sm714424weq.15.2011.07.15.05.34.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 05:34:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310728890.3805.1.camel@phil-desktop>
Date: Fri, 15 Jul 2011 14:34:24 +0200
Message-Id: <79CCB037-3465-454F-999E-8FDEACD98F73@dominion.thruhere.net>
References: <1310634132.2378.36.camel@phil-desktop>
	<6D6FE0B9-0A59-4376-972B-2262C766FDEF@dominion.thruhere.net>
	<1310728890.3805.1.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH v2] insane: make GNU_HASH check slightly more robust (avoids false negatives with gold); add check for useless rpaths
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
X-List-Received-Date: Fri, 15 Jul 2011 12:38:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jul 2011, om 13:21 heeft Phil Blundell het volgende geschreven:

> On Thu, 2011-07-14 at 21:26 +0200, Koen Kooi wrote:
>> The new rpath warning is nice, but a bit too terse:
>=20
> Yes, agreed.  Try this patch and see if the situation improves.

Much better!

WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/groupadd contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/newusers contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/chgpasswd contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/groupmems contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/groupmod contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/useradd contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/groupdel contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/usermod contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/userdel contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/sbin/chpasswd.shadow contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/bin/su contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/bin/passwd.shadow contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/bin/chfn.shadow contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/bin/chage contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/usr/bin/chsh.shadow contains probably-redundant RPATH /lib
WARNING: QA Issue: shadow: =
/work/beagleboard-angstrom-linux-gnueabi/shadow-4.1.4.3-r2/packages-split/=
shadow/bin/login.shadow contains probably-redundant RPATH /lib

For the patch:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>



