Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 17A086A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:01:59 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so2271783pab.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lRzRqK+tXPf5qYOjfhJHkeDzbghVllAHcotOVbk22T0=;
	b=rvXbGsY7YNaL9J0n2C31/m2hfHeY+kRnimbyKxKYNZEpyCcL+o9IxE+jQHiBxFuMPF
	rWRghNZiVeRRNcTVtCBQPFuqA3b/Pug+HPH5eIwI9z32ZSDJxwAZnzN6btYY6vXI7aYj
	t/+/Mh1ERayxiIAEQsv+fbZU/832SwNODZYz4mDTgIxEVa0RBZ+nNW+/QmaL4bjD79Ao
	O6Bh3uKtUrbDYmd7qvkFlbbGrAJ7OFaZNSqAQ7pR0xs2zLHmfEeyn4955q+PIfJmw0qi
	qNvew2tIrni+mZB/+L96KX20XUKnulaXkJ8PdR4w9YNh66EdgyQIFXzSEGzcNwbvnTM5
	h0xg==
X-Received: by 10.68.75.110 with SMTP id b14mr42133431pbw.89.1370581320043;
	Thu, 06 Jun 2013 22:02:00 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id v7sm75834121pbq.32.2013.06.06.22.01.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:01:59 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:15:34 +1000
Message-Id: <1370582137-26940-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH 0/3] qt4: add support for lconvert and xmlpatterns tools
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
X-List-Received-Date: Fri, 07 Jun 2013 05:01:59 -0000

This patchset adds support for lconvert and xmlpatterns tools for Qt
projects that require them (e.g. Qt Creator).

Jonathan Liu (3):
  qt4-native: build lconvert and xmlpatterns
  classes/qmake2: export OE_QMAKE_LCONVERT and OE_QMAKE_XMLPATTERNS
  classes/qmake_base: update .pro hack

 meta/classes/qmake2.bbclass        |  2 ++
 meta/classes/qmake_base.bbclass    | 15 +++++++++++++--
 meta/recipes-qt/qt4/qt4-native.inc |  4 +++-
 3 files changed, 18 insertions(+), 3 deletions(-)

-- 
1.8.2.3


