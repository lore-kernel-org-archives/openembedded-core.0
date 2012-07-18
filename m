Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1SrYOb-0004f5-Nb
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 19:50:46 +0200
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6IHdMI0022408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 10:39:23 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1SrYDa-0005Jj-HK
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 13:39:22 -0400
Date: Wed, 18 Jul 2012 13:39:22 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120718173922.GA20427@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] nasm: nasm has a build dependency on groff-native
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
X-List-Received-Date: Wed, 18 Jul 2012 17:50:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

nasm has a build dependency on groff-native
    
In one incident, there was a case where nasm-native compile phase failed
with the following:
    
      +troff: can't find `DESC' file
      +troff: fatal error: sorry, I can't continue
    
During this, groff-native was in the sysroot install phase.
To remedy this, adding groff-native in nasm's dependency list.
    
Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 nasm_2.07.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/nasm/nasm_2.07.bb b/meta/recipes-devtools/nasm/nasm_2.07.bb
index fc2d531..d3e3f5b 100644
--- a/meta/recipes-devtools/nasm/nasm_2.07.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.07.bb
@@ -27,3 +27,5 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+
+DEPENDS = "groff-native"


