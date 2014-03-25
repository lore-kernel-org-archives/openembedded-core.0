Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E69660EFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 08:28:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2P8SP9C014209
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 01:28:25 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 25 Mar 2014 01:28:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 16:34:13 +0800
Message-ID: <cover.1395736394.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] two fixes for sstate issue
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
X-List-Received-Date: Tue, 25 Mar 2014 08:28:27 -0000
Content-Type: text/plain

The following changes since commit 5d70928a37ce6dbebf41d42ca1f09d99b272a728:

  base-files: do_install.sigdata: remove the depends on DATE (2014-03-25 11:09:05 +0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sstate
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sstate

Robert Yang (2):
  tcl: fix path in Config.sh for sstate
  perl-native: fix path in Config.sh for sstate

 meta/recipes-devtools/perl/perl-native_5.14.3.bb | 3 +++
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb         | 3 +++
 2 files changed, 6 insertions(+)

-- 
1.8.3.1


