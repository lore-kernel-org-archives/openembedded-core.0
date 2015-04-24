Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E85873D89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:54:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O7sOHr008515
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 00:54:24 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 00:54:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 00:54:18 -0700
Message-ID: <4a3bc7c89a92d001d971f60dd94e26ac503c7933.1429861978.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429861978.git.liezhi.yang@windriver.com>
References: <cover.1429861978.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] texinfo: remove enumerate_greater_than_ten.patch
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
X-List-Received-Date: Fri, 24 Apr 2015 07:54:24 -0000
Content-Type: text/plain

It is a backport patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../texinfo/enumerate_greater_than_ten.patch       |   51 --------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/enumerate_greater_than_ten.patch

diff --git a/meta/recipes-extended/texinfo/texinfo/enumerate_greater_than_ten.patch b/meta/recipes-extended/texinfo/texinfo/enumerate_greater_than_ten.patch
deleted file mode 100644
index ef69143..0000000
--- a/meta/recipes-extended/texinfo/texinfo/enumerate_greater_than_ten.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 0e70072ce655a0d053bb7433083ced5e6eac74d4 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 15 Aug 2013 23:49:47 -0700
-Subject: [PATCH] handle correctly @enumerate specification greater than 10
-
-Upstream-Status: Backport
-
-Revision: 5270
-          http://svn.sv.gnu.org/viewvc/?view=rev&root=texinfo&revision=5270
-Author:   pertusus
-Date:     2013-07-29 20:02:23 +0000 (Mon, 29 Jul 2013)
-Log Message:
------------
-        * tp/Common.pm (enumerate_item_representation), Texinfo/Parser.pm:
-        handle correctly @enumerate specification greater than 10.  Report
-        from Dmitry Shachnev.
-
----
- tp/Texinfo/Common.pm |    2 +-
- tp/Texinfo/Parser.pm |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tp/Texinfo/Common.pm b/tp/Texinfo/Common.pm
-index 8aee9f7..bdffeee 100644
---- a/tp/Texinfo/Common.pm
-+++ b/tp/Texinfo/Common.pm
-@@ -1382,7 +1382,7 @@ sub enumerate_item_representation($$)
-   my $specification = shift;
-   my $number = shift;
-
--  if ($specification =~ /^[0-9]$/) {
-+  if ($specification =~ /^[0-9]+$/) {
-     return $specification + $number -1;
-   }
-
-diff --git a/tp/Texinfo/Parser.pm b/tp/Texinfo/Parser.pm
-index cf8fa72..8e845e9 100644
---- a/tp/Texinfo/Parser.pm
-+++ b/tp/Texinfo/Parser.pm
-@@ -2973,7 +2973,7 @@ sub _end_line($$$)
-                         $current->{'cmdname'});
-           }
-           my $arg = $current->{'extra'}->{'block_command_line_contents'}->[0]->[0];
--          if (!defined($arg->{'text'}) or $arg->{'text'} !~ /^[[:alnum:]]$/) {
-+          if (!defined($arg->{'text'}) or $arg->{'text'} !~ /^(([[:digit:]]+)|([[:alpha:]]+))$/) {
-             $self->_command_error($current, $line_nr, 
-                         $self->__("bad argument to \@%s"),
-                         $current->{'cmdname'});
---
-1.7.1
-
-- 
1.7.9.5


