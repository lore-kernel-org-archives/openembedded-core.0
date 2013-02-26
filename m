Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UAFfP-0006dw-7v
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:13:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q7vJn9011998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 23:57:19 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 25 Feb 2013 23:57:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:57:14 +0800
Message-ID: <cover.1361864565.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/3]sstate-cache-management.sh: fix remove duplicate failed when multiple archs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 08:13:45 -0000
Content-Type: text/plain

The following changes since commit 7d22ef28e64de06b6238d0ef9b664c0bee6efa46:

  bitbake: Revert "fetch2: Adapt encode/decode url to use URI class" (2013-02-19 23:07:23 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-sstate-mngt-sh
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-sstate-mngt-sh

Hongxu Jia (3):
  sstate-cache-management.sh: fix remove duplicate failed when multiple
    archs
  sstate-cache-management.sh: don't hardcode available sstate_suffixes
  sstate-cache-management.sh:fix the incorrect usage of option `-d'

 scripts/sstate-cache-management.sh |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
1.7.10.4



