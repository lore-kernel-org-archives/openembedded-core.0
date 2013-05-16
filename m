Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UcoL4-00047N-VA
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 04:54:45 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4G2aUbs024431
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 19:36:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 15 May 2013 19:36:27 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2013 10:36:25 +0800
Message-ID: <05add70b55729aaf6780063d8cb0f8b806e88481.1368602187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368602187.git.Qi.Chen@windriver.com>
References: <cover.1368602187.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] bind: use /var/run/named instead of /var/run/bind/run
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 02:54:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Change /var/run/bind/run to /var/run/named to avoid the following error message.

  chmod: cannot access '/var/run/bind/run': No such file or directory

[YOCTO #4429]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../bind/bind-9.8.1/conf.patch                     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch b/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
index 6fea70e..2785c6a 100644
--- a/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
@@ -270,8 +270,8 @@ diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
 +	# dirs under /var/run can go away on reboots.
 +	mkdir -p /var/run/named
 +	mkdir -p /var/cache/bind
-+	chmod 775 /var/run/bind/run
-+	chown root:bind /var/run/bind/run >/dev/null 2>&1 || true
++	chmod 775 /var/run/named
++	chown root:bind /var/run/named >/dev/null 2>&1 || true
 +
 +	if [ ! -x /usr/sbin/named ]; then
 +	    echo "named binary missing - not starting"
-- 
1.7.9.5



