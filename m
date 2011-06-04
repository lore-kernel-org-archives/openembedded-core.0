Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QSmMM-0007O0-T7
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Jun 2011 10:37:30 +0200
Received: by wye20 with SMTP id 20so2160511wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jun 2011 01:34:14 -0700 (PDT)
Received: by 10.217.7.67 with SMTP id z45mr2644821wes.73.1307176452233;
	Sat, 04 Jun 2011 01:34:12 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k70sm1221597weq.6.2011.06.04.01.34.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Jun 2011 01:34:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 4 Jun 2011 10:34:08 +0200
Message-Id: <9B1F7F06-7640-445D-BE09-57BA04F64A12@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: sysvinit commits that haven't been seen on this list
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
X-List-Received-Date: Sat, 04 Jun 2011 08:37:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed changes to the sysvinit recipes that I haven't seen being =
posted to this list either as heads up or review. The commit is question =
(http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3D5bcd=
6b2c3e935858ac80b17266b9e427060c1650) is a bit half-assed and makes =
updating sysvinit using package feeds about 30 times harder now, since =
it needs to get rebuilt for every machine now even if none of the =
inittabs changed.

regards,

Koen=


