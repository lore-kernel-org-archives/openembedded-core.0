Return-Path: <spopovyc@cisco.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Mar 2017 18:36:49 UTC
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mail.openembedded.org (Postfix) with ESMTP id 33A2F72FA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1238; q=dns/txt; s=iport;
	t=1490726211; x=1491935811;
	h=from:to:cc:subject:date:message-id;
	bh=j1YtKD+Ed47Q1nKAWWhc9vE28LQTJCf/3CciVNpy+pY=;
	b=AeDApH6xYrtUXwlxiSr1nSXpYsbi5j9khnZ6f2KowXbk4Isqq4DsBWf9
	uUGZDUJyCkbN0cUNyfRlNCwrKChl2ylmQHD+KlUOKkAhWhdlYABsHGOoR
	p1fGAswLE2ddjvKN+w4ClFCUL0dPlPl7A1rWyGDYydJgH5FV2BB7KIVvb I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DyAABWqtpY/4ENJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1RhgQuNcaUNgg+CDiaFfIMlPxgBAgEBAQEBAQFrKIYVgVGJeg2?=
	=?us-ascii?q?vVYpNAQEIKBOGO4oPhRkFlhCGUIZ8i1OBfIUqiFOBOpNqHzg+RjofFYVPgUpAN?=
	=?us-ascii?q?YlSAQEB?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; d="scan'208";a="223760017"
Received: from alln-core-9.cisco.com ([173.36.13.129])
	by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	28 Mar 2017 18:27:16 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-9.cisco.com (8.14.5/8.14.5) with ESMTP id v2SIRFr3006083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 28 Mar 2017 18:27:16 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 18:26:46 +0000
Message-Id: <cover.1490722167.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH 0/2] automake/autoconf: avoid path to perl interpreter hardcoding
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
X-List-Received-Date: Tue, 28 Mar 2017 18:36:50 -0000

Hi,

In this small series I would like to address build host perl
interpreter hardcoding in shebang lines of various
automake/autoconf scripts.

This allows to use newer version of perl interpreter from
some toolchain (e.g. devtoolset from SCL on RHEL6) when
build host version is quite old to be used with automake/autoconf.

Please review.

Thanks.

Cc: XE-Linux <xe-linux-external@cisco.com>
Serhii Popovych (2):
  autoconf: Adjust shebang lines to remove interpreter path hardcode
  automake: Adjust shebang lines to remove interpreter path hardcode

 meta/recipes-devtools/autoconf/autoconf.inc        |   7 +-
 ...tion-in-shebangs-with-modern-use-warnings.patch | 196 +++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
 ...tion-in-shebangs-with-modern-use-warnings.patch |  99 +++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  13 +-
 5 files changed, 312 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
 create mode 100644 meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch

-- 
2.7.4


