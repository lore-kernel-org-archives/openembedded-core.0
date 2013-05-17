Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UdJ5B-0000YQ-01
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:44:22 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 372DC952B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 12:26:07 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 12:25:35 +0100
Message-Id: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
Subject: updates for cogl, clutter and mx
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000
X-List-Received-Date: Fri, 17 May 2013 11:44:47 -0000

The following set of patches updates clutter and friends; the recipes were
completely reworked and use PACKAGECONFIG to facilitate easy reconfiguration 
to match distro / machine needs. 

Clutter and Cogl packages are renamed to use a '-1.0' suffix instead of the 
'-vmajor.vminor' suffix of the old recipes, in keeping up with the upstream 
versioning policy, and to simplify dependency maintenance (note that dev files
for the 1.x series are not parallel installable anyway); the '-1.0' suffix is 
with a view toward the '2.0' series which are on the horizon.

The Cogl recipe is moved into a subdirectory of its own, this seemed 
appropriate as Cogl is now a seprate project in its own right.

The new versions are: cogl 1.4.0, clutter 1.14.4, clutter-gst 1.6.0, 
clutter-gtk 1.4.2. The mx recipe is fixed up to build against the updated cogl
and clutter.

[PATCH 1/7] Remove old clutter recipes
[PATCH 2/7] clutter.bbclass: helper class for clutter and friends
[PATCH 3/7] New cogl recipe (1.14.0)
[PATCH 4/7] New clutter recipe (1.14.4)
[PATCH 5/7] New clutter gst recipe (1.6.0)
[PATCH 6/7] New clutter-gtk recipe (1.4.2)
[PATCH 7/7] Update mx recipe to build with clutter 1.14.4


