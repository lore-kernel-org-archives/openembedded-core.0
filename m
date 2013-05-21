Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 631A460897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 15:08:52 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 350F6952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 16:08:53 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 16:08:39 +0100
Message-Id: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
Subject: further colg/clutter improvements and fixes
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
X-List-Received-Date: Tue, 21 May 2013 15:08:52 -0000

These patches take on board Ross feedback on the previous patch set, removing
unnecessary gtk-doc bits from the receipes, as well as the configure fragments
related to DOLT. Also, more of the configure parameters have been moved into
the PACKAGECONFIG definitions.

While modifying the PACKAGECONFIG, I noticed a typo in the cogl recipe that 
effected the RDEPENDS setup for the 'gl' option, and also a missing comma 
in the 'glx' setup for clutter, so these are fixed as well.

[PATCH 1/4] clutter.bbclass: removed unused function
[PATCH 2/4] cogl: further improvements
[PATCH 3/4] clutter: further improvements
[PATCH 4/4] clutter-gst: removed no longer required configure

