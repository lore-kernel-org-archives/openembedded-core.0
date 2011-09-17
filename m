Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1R4xfs-00036k-Ps
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2011 18:23:28 +0200
Received: from [192.168.2.165] (82.125.88.180) by smtp201.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4E70EA77000FF26C for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2011 18:13:10 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Sep 2011 18:13:09 +0200
Message-ID: <1316275989.6161.23.camel@trisquel>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: armv6-novfp and armv6-vfp and tune files
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
X-List-Received-Date: Sat, 17 Sep 2011 16:23:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

hi,
I've an HTC Dream, it has an armv6 CPU but lack a vfp unit.
I want to add correct support for it in meta-smartphone/meta-htc.
In order to have a correct machine config that works a tune inc file
must be required in it.

In openembedded-core there is no tune file yet for an armv6 that lacks a
vfp, but there are theses two files:
meta/conf/machine/include/tune-arm1136jf-s.inc
meta/conf/machine/include/arm/arch-armv6.inc

tune-arm1136jf-s.inc requires arch-armv6.inc.

So I need to create an tune-arm1136ej-s.inc which requires an
arch-armv6-novfp.inc(also to be created).


however I wonder how to create the armv6-novfp.inc:
arch-armv6.inc has things like that inside:
TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
or:
PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp}
armv6-vfp"
or:
TUNEVALID[armv6] = "Enable instructions for ARMv6"

in the recipes and in the feeds and in the workdir it's labeled as
"armv6-vfp".

So the correct way would be to label an armv6 that lacks a vfp "armv6".

however, I fear that the armv6 override is already taken, and also maybe
the arch-armv6.inc should be moved to arch-armv6-vfp.inc.

Denis.



