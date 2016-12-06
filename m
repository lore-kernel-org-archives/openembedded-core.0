Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2839C71A19
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 14:31:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB6EVLPw020134
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2016 06:31:21 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 06:31:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2016 06:31:20 -0800
Message-ID: <cover.1481030770.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 00/13] [jethro] Consolidated pull
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
X-List-Received-Date: Tue, 06 Dec 2016 14:31:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi RP,

There are two PULLs, the one on openembedded-core-contrib is for oe-core,
the other one on poky-contrib is for poky, the later one has 2 more commits:
  poky.conf: Bump version for 2.0.3 jethro release
  build-appliance-image: Update to jethro head revision

I can't send them in oe-core's PULL is because poky.conf is not in oe-core,
and build-appliance-image depends on poky.conf, please verify the commit
is correct after merged.

// Robert


The following changes since commit d39e7ca717b67ad9f2f78b83d90d91e410e52965:

  gnupg: fix find-version for beta checking (2016-11-03 17:40:52 +0000)

================== PULL 1 (13 commits for oe-core)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Armin Kuster (13):
  gnutils: Security fix CVE-2016-7444
  bind: Security fix CVE-2016-2775
  bind: Security fix CVE-2016-2776
  openssl: Security fix CVE-2016-2179
  openssl: Security fix CVE-2016-8610
  python-2.7: Security fix CVE-2016-0772
  python-2.7: Security fix CVE-2016-5636
  python-2.7: Security fix CVE-2016-5699
  python-2.7: Security fix CVE-2016-1000110
  tzcode-native: update to 2016h
  tzdata: Update to 2016h
  tzcode: update to 2016i
  tzdata: update to 2016i

================== PULL 2 (15 commits for poky, includes PULL 1)

  git://git.pokylinux.org/poky-contrib rbt/jethro-next
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/jethro-next

Armin Kuster (13):
  gnutils: Security fix CVE-2016-7444
  bind: Security fix CVE-2016-2775
  bind: Security fix CVE-2016-2776
  openssl: Security fix CVE-2016-2179
  openssl: Security fix CVE-2016-8610
  python-2.7: Security fix CVE-2016-0772
  python-2.7: Security fix CVE-2016-5636
  python-2.7: Security fix CVE-2016-5699
  python-2.7: Security fix CVE-2016-1000110
  tzcode-native: update to 2016h
  tzdata: Update to 2016h
  tzcode: update to 2016i
  tzdata: update to 2016i

Robert Yang (2):
  poky.conf: Bump version for 2.0.3 jethro release
  build-appliance-image: Update to jethro head revision
-- 
2.10.2


