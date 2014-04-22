Return-Path: <Adrian.Calianu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4113660C22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 08:04:20 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 22 Apr 2014 10:04:18 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4191)	id 221282800C6;
	Tue, 22 Apr 2014 10:04:19 +0200 (CEST)
From: Adrian Calianu <adrian.calianu@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Apr 2014 10:04:14 +0200
Message-ID: <1398153854-53487-1-git-send-email-adrian.calianu@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.calianu@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] oprofileui-server_git: add avahi-daemon to RDEPENDS list
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
X-List-Received-Date: Tue, 22 Apr 2014 08:04:23 -0000
Content-Type: text/plain

oprofileui-server recipe depends on avahi recipe. But avahi recipe
generates more packages and one of those packages(avahi-daemon) which
oprofileui-server expected to be available is not found into image.
A runtime dependency of oprofileui-server on avahi-daemon is required.

Upstream-Status: Pending

Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
---
 meta/recipes-kernel/oprofile/oprofileui-server_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index dbb5599..be9320f 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.yoctoproject.org/oprofileui \
 
 EXTRA_OECONF += "--disable-client --enable-server"
 
-RDEPENDS_${PN} = "oprofile"
+RDEPENDS_${PN} = "oprofile avahi-daemon"
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
-- 
1.7.10.4


