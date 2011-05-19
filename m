Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QN0uj-0000OW-4r
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:57:09 +0200
Received: by wye20 with SMTP id 20so2060451wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 03:54:13 -0700 (PDT)
Received: by 10.216.68.18 with SMTP id k18mr1996921wed.109.1305802453198;
	Thu, 19 May 2011 03:54:13 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k76sm1225215wej.19.2011.05.19.03.54.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 03:54:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1305800693.git.lianhao.lu@intel.com>
Date: Thu, 19 May 2011 12:54:06 +0200
Message-Id: <53BCC7D4-31CB-43AA-A5DD-CC1730DDD0B2@dominion.thruhere.net>
References: <cover.1305800693.git.lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 10:57:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mei 2011, om 12:29 heeft Lianhao Lu het volgende geschreven:

> From: Lianhao Lu <lianhao.lu@intel.com>
>=20
> This series of 5 patches implemented the network based PR service and =
enabled=20
> the poky to use it during the task do_package and =
do_package_write_xxx. By=20
> using the network based PR service and the basichash for =
BB_SIGNATURE_HANDLER,=20
> the poky user may not need to bump the PR manually everytime he/she =
changes=20
> the recipe. The package will get automatically rebuilt and new =
revision number=20
> reflecting the change will be included in the package feed.

Does it have a public/private mode? In the angstrom case, we only want =
developers to 'submit' PR bumps and users only retrieve them.

regards,

Koen=


