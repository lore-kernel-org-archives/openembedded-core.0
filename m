Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qc2EQ-0003f4-6V
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 23:23:34 +0200
Received: by wwi18 with SMTP id 18so1402006wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:19:51 -0700 (PDT)
Received: by 10.227.206.14 with SMTP id fs14mr1155472wbb.30.1309382391597;
	Wed, 29 Jun 2011 14:19:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fi5sm1182414wbb.5.2011.06.29.14.19.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 14:19:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E0B9288.9010001@linux.intel.com>
Date: Wed, 29 Jun 2011 23:19:44 +0200
Message-Id: <CC992F09-A620-421C-9AC6-ED807B17F03F@dominion.thruhere.net>
References: <4E0B9288.9010001@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Consistent MAC on Beagleboard xM
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
X-List-Received-Date: Wed, 29 Jun 2011 21:23:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jun 2011, om 23:00 heeft Darren Hart het volgende geschreven:

> We have an open bug for a consistent MAC on the Beagleboard xM on the
> yocto project bugzilla. I want to track whatever solution you have or
> plan to take. I didn't see a fix in linux-omap_2.6.39 at a quick scan
> through the patches. There are two approaches suggested in Comment 3
> of the bug:
>=20
> http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1073
>=20
> They are:
> https://bugs.launchpad.net/ubuntu/+source/linux-linaro/+bug/687396
> =
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/02624=
0.html
>=20
> Do you already have plans to address this? If not, do you have any
> opinion on the proposed solutions in the bug?

I'd like to use the die-ID for the mac, but the proposed patch by the =
linaro folks is just wrong in the way it is done, I don't want to add 40 =
lines of code to my boardfiles just for the mac address *and* need to =
hardcode usb topology as well.=


