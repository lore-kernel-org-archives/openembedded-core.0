Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4A8E756C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:34:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8YKqk013942
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:34:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 24 Jun 2015 01:34:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 16:34:34 +0800
Message-ID: <cover.1435134771.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrade -- 20150624
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
X-List-Received-Date: Wed, 24 Jun 2015 08:34:20 -0000
Content-Type: text/plain

The following changes since commit 7f85e74d5c53b34e5f470967fdbdbd19fed1929a:

  sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20150624
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20150624

Chen Qi (3):
  sysstat: upgrade to 11.1.5
  curl: upgrade to 7.43.0
  cups: upgrade to 2.1b1

 meta/recipes-extended/cups/{cups_2.0.2.bb => cups_2.1b1.bb}          | 4 ++--
 .../sysstat/{sysstat_11.1.4.bb => sysstat_11.1.5.bb}                 | 5 +++--
 meta/recipes-support/curl/{curl_7.42.1.bb => curl_7.43.0.bb}         | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.2.bb => cups_2.1b1.bb} (40%)
 rename meta/recipes-extended/sysstat/{sysstat_11.1.4.bb => sysstat_11.1.5.bb} (40%)
 rename meta/recipes-support/curl/{curl_7.42.1.bb => curl_7.43.0.bb} (93%)

-- 
1.9.1


