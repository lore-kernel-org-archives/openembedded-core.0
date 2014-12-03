Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF8B601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 08:16:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB38G8oK004467
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 3 Dec 2014 00:16:08 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Dec 2014 00:16:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 16:16:03 +0800
Message-ID: <cover.1417594233.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] fix archiver missing tasks between do_unpack and do_patch
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
X-List-Received-Date: Wed, 03 Dec 2014 08:16:09 -0000
Content-Type: text/plain

The following changes since commit b8631416f12b8a904ce3deb036f9d5ce632937b0:

  package_regex.inc: Update REGEX'es in order to find upstream versions correctly (2014-11-28 14:03:02 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-archiver
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-archiver

Hongxu Jia (1):
  archiver: execute the probable tasks between do_unpack and do_patch

 meta/classes/archiver.bbclass | 81 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 7 deletions(-)

-- 
1.9.1


