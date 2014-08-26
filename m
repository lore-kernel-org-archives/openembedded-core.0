Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6717070E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 03:13:02 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so21789600pdi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 20:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=mUaJWrV7cyWFy642aoP1SnL8TwCXV19UCXORu8INJXg=;
	b=dYn5on3mm6F8cTQosKEdaavIgaSPkMNj1S7TDvtoM3bBnKuJT+h6JO0/2Fw0AbRMyI
	hP0++CLhGXZfn9OqGiJNBcfNN3q6QFxqUAEsNym+ifD+6l8lwRdVuePvMiIEWvSLIsj5
	xqNlW5UobSl1Ezs2B+d/re6EdR0RIMoZJalxOtquOOzoAZzuJcfND/F7Emla5zpVfudN
	94oUlPnmIB/HE6HP4EPloE24XS7YcjwMPle1DQu4FULr7uoYpBjrvKtRzN/+B6rAFW0E
	mbtcoFQ4If5AhFeDwgkBJPR1Hhisnhv9sQJ/m177bH3OUU/aBwqM+UL1X6vmyi7Q21kH
	t/kQ==
X-Received: by 10.69.18.11 with SMTP id gi11mr9310084pbd.163.1409022783384;
	Mon, 25 Aug 2014 20:13:03 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qv9sm1233944pbb.86.2014.08.25.20.13.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 20:13:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 20:12:55 -0700
Message-Id: <1409022778-29904-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3 v2] IBM power: new tune files for power5,6,7
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
X-List-Received-Date: Tue, 26 Aug 2014 03:13:04 -0000

Add tune files for IBM's POWER 5,6 and 7 cpus.

V2: rename file from ppcpower* to power* after
    feedback from community.

Armin Kuster (3):
  IBM Power5 v2: Add new tune file for PPC power5 cpu
  IBM power6 v2: Add new tune file for PPC power6
  IBM power7 v2: Add new tune file for PPC power7

 meta/conf/machine/include/tune-power5.inc | 21 +++++++++++++++++++++
 meta/conf/machine/include/tune-power6.inc | 21 +++++++++++++++++++++
 meta/conf/machine/include/tune-power7.inc | 21 +++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-power5.inc
 create mode 100644 meta/conf/machine/include/tune-power6.inc
 create mode 100644 meta/conf/machine/include/tune-power7.inc

-- 
1.9.1


