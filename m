Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB766617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 14:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7BE9UPM027369
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 07:09:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 11 Aug 2014 07:09:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Aug 2014 07:09:29 -0700
Message-ID: <cover.1407766043.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] insane.bbclass: add QA check: file-rdeps
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
X-List-Received-Date: Mon, 11 Aug 2014 14:09:30 -0000
Content-Type: text/plain

* Changes of V2:
  Refer build-deps to check all the files' rdepends rather than only
  check bash, perl and python as RP suggested.

Next:
* Fix the issues one by one:
  - Remove the depends is possible (such as bash)
  - Split the packages for perl and python depends when needed.

// Robert

The following changes since commit 63cbed337241191f33fe951662a39ce59dce6774:

  oeqa/runtime: add new cpp test and file (2014-08-11 12:30:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/file-rdeps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/file-rdeps

Robert Yang (1):
  insane.bbclass: add QA check: file-rdeps

 meta/classes/insane.bbclass |   37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

-- 
1.7.9.5


