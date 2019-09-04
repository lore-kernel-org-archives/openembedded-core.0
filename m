Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67A617D70B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 09:36:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x849a1hQ020392
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Sep 2019 02:36:01 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 4 Sep 2019 02:36:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2019 05:35:52 -0400
Message-ID: <20190904093555.59494-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH v2 0/3] Fix multilib file conflictions
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
X-List-Received-Date: Wed, 04 Sep 2019 09:36:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* don't remove sysstat.service from sysstat

Kai Kang (3):
  cups: redefine CUPS_SERVERBIN
  texinfo: fix multilib file confliction
  sysstat: 12.1.3 -> 12.1.6

 meta/recipes-extended/cups/cups.inc                    |  2 +-
 meta/recipes-extended/cups/cups/cups_serverbin.patch   | 10 ++++++++--
 meta/recipes-extended/sysstat/sysstat.inc              |  4 ++--
 .../sysstat/{sysstat_12.1.3.bb => sysstat_12.1.6.bb}   |  4 ++--
 meta/recipes-extended/texinfo/texinfo_6.5.bb           |  4 +++-
 5 files changed, 16 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.1.3.bb => sysstat_12.1.6.bb} (53%)

-- 
2.20.0


