Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E216C77055
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:59:49 +0000 (UTC)
Received: by ioll68 with SMTP id l68so44452880iol.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=33auO67BVLtUyF85mLgB96YotDd+BaTQdYmPfOZt7a8=;
	b=cbGsSn6Ifa6nr6piFGy8riNEW/WWF4JTmZ/jbY1Mq79MOdMHBeIsp3GWEUDxCs91pc
	s/0xa9YRZ/WMppHW1JaHemJITen0JN8XLR29gXlnJ4NWq93YSzoOZ4GuQuUlpPUQsoEz
	EUi9F5njb5VEWKOLKMOihrQiEFDDqLVCRuJjmaLR0DEztt0nJ9yU2uXAHvaySIQ3qIjQ
	hAbK6sXT3EroKsdaWAx8iwhycdyiP5Q4Hjdi3dMZTLgOLi/36tcroOV9WsuRQrrZfw/y
	6gU4oMdleptDuZvbhIvXFDRidUb/ofwzq+A6GrDhPHp4OfW7HnfjBZWsUre+X2/i2J0z
	3JCg==
X-Received: by 10.107.3.156 with SMTP id e28mr30039077ioi.151.1445281189409;
	Mon, 19 Oct 2015 11:59:49 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ot2sm8240489igb.17.2015.10.19.11.59.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 11:59:48 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:59:32 -0700
Message-Id: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] tuning support for 1st and 2nd generation Intel Atom CPUs
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
X-List-Received-Date: Mon, 19 Oct 2015 18:59:52 -0000

Andre McCurdy (5):
  tune-corei7.inc: fix PACKAGE_EXTRA_ARCHS_tune-corei7-32 typo
  tune-bonnell.inc: support for first generation Intel Atom CPUs
  tune-silvermont.inc: support for second generation Intel Atom CPUs
  tune-atom.inc: include tune-bonnell.inc instead of tune-core2.inc
  tune-corei7.inc: update comments regarding Silvermont support

 meta/conf/machine/include/tune-atom.inc       |  4 +--
 meta/conf/machine/include/tune-bonnell.inc    | 35 ++++++++++++++++++++++++++
 meta/conf/machine/include/tune-corei7.inc     |  6 ++---
 meta/conf/machine/include/tune-silvermont.inc | 36 +++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 5 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-bonnell.inc
 create mode 100644 meta/conf/machine/include/tune-silvermont.inc

-- 
1.9.1


