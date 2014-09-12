Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A81465D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 08:57:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8C8vaB2005722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 01:57:36 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 12 Sep 2014 01:57:36 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Sep 2014 04:57:33 -0400
Message-ID: <cover.1410510784.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] dropbear: add pam modules dependencies
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
X-List-Received-Date: Fri, 12 Sep 2014 08:57:42 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If pam distro feature enabled, dropbear will need below pam rpms
to work:
  
  * libpam-runtime
  * pam-plugin-deny
  * pam-plugin-permit
  * pam-plugin-unix
 
Just add the runtime dependencies explicitly.

The following changes since commit 429802fe6691c8a70ec9735c0db4c6a4e1e1b038:

  classes/populate_sdk_base: enable adding custom commands to SDK install script (2014-09-11 18:02:55 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/fix-dropbear
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix-dropbear

Wenzong Fan (1):
  dropbear: add pam modules dependencies

 meta/recipes-core/dropbear/dropbear.inc |    7 +++++++
 1 file changed, 7 insertions(+)

-- 
1.7.9.5


