Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1SwHnd-0001Ca-Kb
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 21:08:10 +0200
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6VIuUW6027717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:56:31 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1SwHcL-0003aB-Oy
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 14:56:29 -0400
Date: Tue, 31 Jul 2012 14:56:29 -0400
From: Amy Fong <amy.fong@windriver.com>
To: Openembedded core <openembedded-core@lists.openembedded.org>
Message-ID: <20120731185629.GA13766@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] socat: missing several dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 19:08:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

socat: missing several dependencies
    
socat depends on ncurses, readline, and tcp-wrappers
    
Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 socat_1.7.2.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.0.bb b/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
index 1273dcf..0faf016 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl readline ncurses tcp-wrappers"
 
 LICENSE = "GPL-2.0+-with-OpenSSL-exception"
 


