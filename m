Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 647966A5B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:49:28 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl14so1675838pab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 18:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8iwwEMdlWWmks79JQVW+5WwnHXk35OksSAt2rHXwCJQ=;
	b=xhKq6vkertEASUzzjqltZh9NilevhGxWAhrJysZCqujbCtkLvZZS8RyGWK/BulRxej
	jE8ADOm4Ltg8ex2MAZ8W2FE2QNJe7LcuzsxAC/XjfOUTApwZhIPFgueDR1PK49q4m3ij
	1QsaroyURL3g0VTIEZQrzHpqoZ7nj40uwP2NcV2MYXk8OpPT9Pi3Uavcx3hBaBAfDmtq
	skN/JKbUdaS0Papk7bzMoiNrfhaFjyw1N208JdroHZY+HwxaUKkvTJg43a/WHc8TxWQj
	jKrQF/uGeF9cb2rSNFyUktpFyJpiEsjaYRahyZgSQz+ui1ERgRbQ6nkNZCc//dTNuoIf
	VEiQ==
X-Received: by 10.68.106.130 with SMTP id gu2mr12224053pbb.111.1370915369579; 
	Mon, 10 Jun 2013 18:49:29 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z19sm3388361paf.12.2013.06.10.18.49.27
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 18:49:28 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 18:49:30 -0700
Message-Id: <cover.1370915304.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 0/4] A few miscellaneous improvements from Mentor
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
X-List-Received-Date: Tue, 11 Jun 2013 01:49:28 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit b4f208f418d18f2a4e78a56bebacef481061d917:

  tar: don't mv tar for nativesdk (2013-06-10 18:06:33 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git misc-improvements

Christopher Larson (4):
  connman: use PACKAGECONFIG for WISPr support
  packagegroup-base-vfat: include dosfsprogs
  insane.bbclass: quiet package errors not in *_QA
  libnewt: split python module into libnewt-python

 meta/classes/insane.bbclass                        |  6 ++-
 meta/recipes-connectivity/connman/connman.inc      | 10 ++--
 .../packagegroups/packagegroup-base.bb             |  3 +-
 meta/recipes-extended/newt/libnewt-0.52.14.inc     | 45 ++++++++++++++++++
 .../newt/libnewt-python_0.52.14.bb                 | 26 +++++++++++
 meta/recipes-extended/newt/libnewt_0.52.14.bb      | 54 +---------------------
 6 files changed, 86 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-extended/newt/libnewt-0.52.14.inc
 create mode 100644 meta/recipes-extended/newt/libnewt-python_0.52.14.bb

-- 
1.8.3


