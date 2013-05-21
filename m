Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id C5F6F6148D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:04:22 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 8CA72952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:04:23 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 12:04:11 +0100
Message-Id: <1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: updates for cogl, clutter and mx v3
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
X-List-Received-Date: Tue, 21 May 2013 11:04:23 -0000

Fixes per Ross' comments:

 * Removed unused/unnecessary configure options
 * Reworked PACKAGECONFIG for cogl and clutter
 * Removed unnecessary configure framment's from cogl/clutter/clutter-gst

[PATCH v3 1/8] clutter.bbclass: helper class for clutter and friends
[PATCH v3 2/8] New cogl recipe (1.14.0)
[PATCH v3 3/8] New clutter recipe (1.14.4)
[PATCH v3 4/8] fix clutter
[PATCH v3 5/8] New clutter-gst recipe (1.6.0)
[PATCH v3 6/8] New clutter-gtk recipe (1.4.2)
[PATCH v3 7/8] New mx recipe (1.4.7)
[PATCH v3 8/8] packagegroup-core-clutter: use clutter-1.0 packages

