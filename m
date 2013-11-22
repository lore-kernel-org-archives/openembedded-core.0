Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id 497346C735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:04:37 +0000 (UTC)
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>) id 1VjrLX-0006UF-3I
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Nov 2013 14:04:35 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>) id 1VjrLX-0000G8-2D
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Nov 2013 14:04:35 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 14:04:17 +0000
Message-Id: <1385129059-941-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
Subject: kernel.bbclass: Fix various bundle_initramfs problems
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
X-List-Received-Date: Fri, 22 Nov 2013 14:04:38 -0000

The second of these two patches fix various problems with the
bundle_initramfs feature in kernel.bbclass. The first one reverts a
recent patch which should make the history easier to follow.

Mike.


