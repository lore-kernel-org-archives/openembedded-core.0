Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id B65BC65D6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:47:13 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8A804F811EC; Wed,  3 Jun 2015 08:47:14 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2D8F7F811EA;
	Wed,  3 Jun 2015 08:47:14 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 08:47:45 -0600
Message-Id: <1433342867-4644-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 0/2] gst-player: Update to latest GIT
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
X-List-Received-Date: Wed, 03 Jun 2015 14:47:15 -0000

These patches bring the gst-player up to date (2015-05-21)

Gary Thomas (2):
  Update to latest GIT
  gst-player: Remove obsolete patches (now in upstream)

 ...error-signal-emission-for-missing-plugins.patch | 252 ---------------------
 .../gstreamer/gst-player/Fix-pause-play.patch      | 107 ---------
 .../gstreamer/gst-player/filechooser.patch         |  54 -----
 .../gstreamer/gst-player/gtk2.patch                | 121 +++++++++-
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   7 +-
 5 files changed, 112 insertions(+), 429 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch

-- 
1.9.1


