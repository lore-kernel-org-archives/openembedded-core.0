Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0F0601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:03:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4I93xWu027910
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 02:03:59 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 02:03:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 02:03:58 -0700
Message-ID: <cover.1463562174.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] webkitgtk: turn off JIT on armv4 and armv7a
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
X-List-Received-Date: Wed, 18 May 2016 09:04:01 -0000
Content-Type: text/plain

* V2
  Rebase and resend.

// Robert

The following changes since commit 84b11bce72296d04a0e6bc9f18669284017c3704:

  pkgconfig: Update AM_GLIB_GNU_GETTEXT macro (2016-05-17 17:26:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/webkitgtk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/webkitgtk

Robert Yang (1):
  webkitgtk: turn off JIT on armv4 and armv7a

 meta/recipes-sato/webkit/webkitgtk_2.12.1.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.7.4


