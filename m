Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 078BA6F33C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:11:44 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 43CAEF811F7; Mon, 24 Feb 2014 10:11:45 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8D64BF811EF;
	Mon, 24 Feb 2014 10:11:44 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 10:11:46 -0700
Message-Id: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 0/3 v2] Improve setup scripts
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
X-List-Received-Date: Mon, 24 Feb 2014 17:11:51 -0000

These changes improve the setup scripts which are initiated
by the user via 'oe-init-build-env'.

Gary Thomas (3):
  This script is only useful when sourced into a shell.  These    
    changes improve the detection of this operation, no matter     how
    the script is referenced.
  Keeping track of the TEMPLATECONF variable in the build     tree will
    let this script produce the same output when     listing
    'conf-notes.txt' every time the script is run,     regardless of
    whether or not TEMPLATECONF has been provided     by the user.
  .templateconf: New file for customized template defaults

 .templateconf             |    2 ++
 oe-init-build-env         |   42 +++++++++++++++++++++++-------------------
 scripts/oe-setup-builddir |   10 +++++++++-
 3 files changed, 34 insertions(+), 20 deletions(-)
 create mode 100644 .templateconf

-- 
1.7.9.5


