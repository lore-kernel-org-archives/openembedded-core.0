Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CAB816011B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 15:40:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7VFeh7I015792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Aug 2018 08:40:43 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 31 Aug 2018 08:40:42 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2018 23:02:41 +0800
Message-ID: <20180831150242.11124-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH v2 0/1] webkitgtk: fix CVEs
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
X-List-Received-Date: Fri, 31 Aug 2018 15:40:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* upgrade to 2.20.5 which has fix of CVE-2018-12911

If upgrade is not accepted right now, please review the first version.
Thanks.

Kai Kang (1):
  webkit: 2.20.3 -> 2.20.5

 .../0001-webkitgtk-fix-CVE-2017-17821.patch   | 44 +++++++++++++++++++
 ...ebkitgtk_2.20.3.bb => webkitgtk_2.20.5.bb} |  5 ++-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.20.3.bb => webkitgtk_2.20.5.bb} (96%)

-- 
2.18.0


