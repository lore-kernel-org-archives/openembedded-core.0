Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 632CF731E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 08:01:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R81TuP028850
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 00:01:30 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jan 2016 00:01:29 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 16:00:19 +0800
Message-ID: <1453881619-19154-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] netbase: add ipv6 host to /etc/hosts
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
X-List-Received-Date: Wed, 27 Jan 2016 08:01:31 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

There is a script in netbase, debian/netbase.postinst, which create
/etc/hosts, but it is not called, so ipv6 host is missing.

now copy them from Ubuntu; and add localhost as alias of ::1

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-core/netbase/netbase/hosts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/netbase/netbase/hosts b/meta/recipes-core/netbase/netbase/hosts
index 2f33245..b94f414 100644
--- a/meta/recipes-core/netbase/netbase/hosts
+++ b/meta/recipes-core/netbase/netbase/hosts
@@ -1,2 +1,8 @@
 127.0.0.1	localhost.localdomain		localhost
 
+# The following lines are desirable for IPv6 capable hosts
+::1     localhost ip6-localhost ip6-loopback
+fe00::0 ip6-localnet
+ff00::0 ip6-mcastprefix
+ff02::1 ip6-allnodes
+ff02::2 ip6-allrouters
-- 
1.9.1


