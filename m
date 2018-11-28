Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 6989A6C126
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 20:52:57 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 544DA1C0036;
	Thu, 29 Nov 2018 09:52:57 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 09:52:47 +1300
Message-Id: <20181128205250.15333-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128045316.24102-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
Subject: [PATCH v2 0/3] ptest: Strip build host paths from any installed Makefile
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
X-List-Received-Date: Wed, 28 Nov 2018 20:52:58 -0000

Only one change from v1: Simplified commit acl: Use install instead of cp

Douglas Royds (3):
  acl: Use install instead of cp
  acl: Strip build host tool details from installed ptest file
  attr: Strip build host paths and tool versions from ptest files

 meta/recipes-support/attr/acl_2.2.52.bb | 11 ++++-------
 meta/recipes-support/attr/attr.inc      |  9 +++------
 2 files changed, 7 insertions(+), 13 deletions(-)

-- 
2.17.1


