Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE3470F0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:31:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7M8VSuq005637
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 01:31:28 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 01:31:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Aug 2014 01:31:26 -0700
Message-ID: <cover.1408695516.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: check the format of MIRRORS
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
X-List-Received-Date: Fri, 22 Aug 2014 08:31:30 -0000
Content-Type: text/plain

Hello,

The MIRRORS' config is a little special, so it's easy to make typos,
this patch can help check the common errors.

// Robert

The following changes since commit 1fafe7ccc563d5ac9e41f5c1de93d2736745b512:

  ghostscript: Remove bogus gsfonts reference from DESCRIPTION (2014-08-06 11:14:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/mir
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/mir

Robert Yang (1):
  sanity.bbclass: check the format of MIRRORS

 meta/classes/sanity.bbclass |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

-- 
1.7.9.5


