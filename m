Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B26E16FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 09:16:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0E9G9o9008253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 01:16:09 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jan 2016 01:16:08 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 17:16:22 +0800
Message-ID: <cover.1452762932.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dbus: upgrade to 1.10.6
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
X-List-Received-Date: Thu, 14 Jan 2016 09:16:10 -0000
Content-Type: text/plain

The following changes since commit 541315d6c56df6448f64c262f99d43d5c1e9400b:

  update_font_cache: only scan system font directories (2016-01-11 23:23:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/dbus-1.10.6
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/dbus-1.10.6

Chen Qi (1):
  dbus: upgrade to 1.10.6

 .../{dbus-test_1.8.20.bb => dbus-test_1.10.6.bb}    |  4 ++--
 meta/recipes-core/dbus/dbus/python-config.patch     | 21 +++++++++++++++------
 .../dbus/{dbus_1.8.20.bb => dbus_1.10.6.bb}         | 17 +++++++++++------
 3 files changed, 28 insertions(+), 14 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.20.bb => dbus-test_1.10.6.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.8.20.bb => dbus_1.10.6.bb} (90%)

-- 
1.9.1


