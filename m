Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id A52396BECB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 08:32:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,1012,1367942400"; d="scan'208";a="8390032"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 03 Sep 2013 16:29:42 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r838WmPq003885
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 16:32:48 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013090316304144-1174101 ;
	Tue, 3 Sep 2013 16:30:41 +0800 
Message-ID: <52259EB1.1050807@cn.fujitsu.com>
Date: Tue, 03 Sep 2013 16:32:49 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <52259E35.4030405@cn.fujitsu.com>
In-Reply-To: <52259E35.4030405@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/09/03 16:30:41,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/09/03 16:30:42,
	Serialize complete at 2013/09/03 16:30:42
Subject: [PATCH 1/2]acpid: install events directory at default.
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
X-List-Received-Date: Tue, 03 Sep 2013 08:32:51 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

acpid: install events directory at default.

If rule directory "${sysconfdir}/acpi/events" is inexist, 
the acpid initscript will exit with success, but the daemon will be not running.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

---
 meta/recipes-bsp/acpid/acpid.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 1ffe6ff..40293c5 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -27,4 +27,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/init.d
 	cat ${WORKDIR}/init | sed -e's,/usr/sbin,${sbindir},g' > ${D}${sysconfdir}/init.d/acpid
 	chmod 755 ${D}${sysconfdir}/init.d/acpid
+
+	install -d ${D}${sysconfdir}/acpi
+	install -d ${D}${sysconfdir}/acpi/events
 }
-- 
1.7.7




