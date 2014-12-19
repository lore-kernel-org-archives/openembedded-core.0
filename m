Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8293872886
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 05:44:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ5iJch014604
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 21:44:20 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 21:44:18 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 13:41:58 +0800
Message-ID: <cover.1418953574.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Upgrade less, cups and byacc
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
X-List-Received-Date: Fri, 19 Dec 2014 05:44:23 -0000
Content-Type: text/plain

The following changes since commit 0a791e91e55d30b328ddbd90fdb0d5911c388b96:

  bitbake: data: escape '$' in shell variable assignment (2014-12-18 10:28:44 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/less
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/less

Chong Lu (3):
  less: Upgrade to 471
  cups: Upgrade to 2.0.1
  byacc: Upgrade to 20141128

 meta/recipes-extended/byacc/{byacc_20141006.bb => byacc_20141128.bb} | 4 ++--
 meta/recipes-extended/cups/{cups_2.0.0.bb => cups_2.0.1.bb}          | 4 ++--
 meta/recipes-extended/less/{less_470.bb => less_471.bb}              | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20141006.bb => byacc_20141128.bb} (74%)
 rename meta/recipes-extended/cups/{cups_2.0.0.bb => cups_2.0.1.bb} (40%)
 rename meta/recipes-extended/less/{less_470.bb => less_471.bb} (88%)

-- 
1.9.1


