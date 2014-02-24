Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 4556F6B6FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:18:07 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 11EBFF811F2; Mon, 24 Feb 2014 08:18:09 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 753E9F811E6;
	Mon, 24 Feb 2014 08:18:07 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 08:17:58 -0700
Message-Id: <1393255080-12382-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 0/2] Improve setup scripts
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
X-List-Received-Date: Mon, 24 Feb 2014 15:18:11 -0000

These changes improve the setup scripts which are initiated
by the user via 'oe-init-build-env'.

Gary Thomas (2):
  oe-init-build-env: Improve script sourcing detection.
  scripts/oe-setup-builddir: Keep track of TEMPLATECONF setting

 oe-init-build-env         |   42 +++++++++++++++++++++++-------------------
 scripts/oe-setup-builddir |    8 ++++++++
 2 files changed, 31 insertions(+), 19 deletions(-)

-- 
1.7.9.5


