Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 2D7086D130
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 21:13:20 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 7D44F1C0036;
	Thu, 29 Nov 2018 10:13:21 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 10:13:11 +1300
Message-Id: <20181128211319.16648-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128045316.24102-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
Subject: [PATCH v3 0/8] ptest: Strip build host paths from any installed Makefile
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
X-List-Received-Date: Wed, 28 Nov 2018 21:13:22 -0000

Only one change from v1: Simplified commit acl: Use install instead of cp

Douglas Royds (8):
  ptest: Reproducibility: Strip build host paths from any installed Makefile
  ptest: Optionally strip build host tool info from installed files
  openssl ptest: Strip build host paths from configdata.pm
  openssl: Strip perl version from installed ptest configdata.pm file
  strace: Strip build host tool details from installed ptest Makefile
  acl: Use install instead of cp
  acl: Strip build host tool details from installed ptest file
  attr: Strip build host paths and tool versions from ptest files

 meta/classes/ptest.bbclass                     | 18 ++++++++++++++++++
 .../openssl/openssl_1.1.1a.bb                  |  2 ++
 meta/recipes-devtools/strace/strace_4.25.bb    | 11 +----------
 meta/recipes-support/attr/acl_2.2.52.bb        | 11 ++++-------
 meta/recipes-support/attr/attr.inc             |  9 +++------
 5 files changed, 28 insertions(+), 23 deletions(-)

-- 
2.17.1


