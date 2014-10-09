Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 80D1E6FDEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 12:24:33 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Thu, 9 Oct 2014
	14:24:34 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id 90CD5288D4F;
	Thu,  9 Oct 2014 14:24:34 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 14:24:30 +0200
Message-ID: <1412857470-47000-2-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1412857470-47000-1-git-send-email-sona.sarmadi@enea.com>
References: <1412857470-47000-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [daisy][PATCH2/4] layer.conf: Mark opkg-utils as ABISAFE for update-alternatives usage
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
X-List-Received-Date: Thu, 09 Oct 2014 12:24:34 -0000
Content-Type: text/plain

From: Steffen Sledz <sledz@dresearch-fe.de>

Currently linux-firmware rebuilds for each machine due to its usage of
update-alternatives which in turn means a dependency on opkg-utils.
Marking opkg-utils as ABISAFE is the only option we have right now
to avoid this.

(From OE-Core rev: e4c4ca3101062ecc956294ac968dc488321eb33b)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index a764ee0..13814dc 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -14,6 +14,7 @@ LAYERVERSION_core = "4"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
+# opkg-utils is for update-altnernatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
   shadow-securetty \
@@ -34,4 +35,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   shadow \
   shadow-sysroot \
   base-passwd \
+  opkg-utils \
 "
-- 
1.9.1


