Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id B3CD0608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 14:11:27 +0000 (UTC)
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CAC48D22B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 16:11:26 +0200 (CEST)
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:11:19 +0200
Message-Id: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.8.1.2
Subject: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Fri, 31 May 2013 14:11:28 -0000

I build core-image-minimal today and got 5.1MB image (AArch64/eglibc).
Looked inside the image and found some extra files which can be dropped.

First hit: pci.ids.gz and usb.ids.gz ~350KB in total.

Normally they are needed for lspci/lsusb but they are brought by udev
which does not need them.

Next one can be ldconfig which is ~600KB.

What do you think?


