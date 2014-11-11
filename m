Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9423565CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 22:40:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sABMeGwO018782
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 14:40:16 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 11 Nov 2014 14:40:15 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Nov 2014 16:40:13 -0600
Message-ID: <cover.1415745561.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] v2: option groups fixup
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
X-List-Received-Date: Tue, 11 Nov 2014 22:40:19 -0000
Content-Type: text/plain

This is like the previous one, only it's been updated to
use a conditional test on HAVE_MBSTATE_T so it doesn't break
poky-tiny.

The following changes since commit 33b7885ecdc8774e34ac3534ec49fed6ffdb3916:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:19:58 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/optiongroups2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/optiongroups2

Peter Seebach (1):
  eglibc-use-option-groups.patch: Minor fixups.

 .../glibc/glibc/eglibc-use-option-groups.patch     |   25 +++----------------
 1 files changed, 4 insertions(+), 21 deletions(-)


