Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYcQ2-0004QE-GJ
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 13:13:27 +0200
Received: by wyb34 with SMTP id 34so1326063wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 04:09:54 -0700 (PDT)
Received: by 10.227.29.27 with SMTP id o27mr4985090wbc.16.1308568194173;
	Mon, 20 Jun 2011 04:09:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm6sm509764wbb.61.2011.06.20.04.09.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2011 04:09:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 20 Jun 2011 13:09:51 +0200
Message-Id: <E52858E1-3BB1-497E-83D1-1411B4DD9373@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: 'elfutils' needed to build kernel (perf), but not listed in DEPENDS
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
X-List-Received-Date: Mon, 20 Jun 2011 11:13:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I finally tracked down the heisenbug that was causing kernel builds to =
fail: kernel*bbclass has no DEPENDS on elfutils, but it still tries to =
build perf.

While grepping I also stumbled accross this gem:

image-swab.bbclass:PARALLEL_MAKE_pn-elfutils =3D ""

Parallel make fails only when using swabber?

regards,

Koen=


