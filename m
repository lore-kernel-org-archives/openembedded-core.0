Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1U1Acl-0008Gl-I1
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 08:01:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r116jeVC007417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 22:45:40 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 31 Jan 2013 22:45:38 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 14:45:37 +0800
Message-ID: <1359701137-15892-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <3826>
References: <3826>
MIME-Version: 1.0
Subject: [PATCH] pulseaudio_2.1: when do_compile, pulseaudio needs fftw3.h header file. In order to provide fftw3.h, the dependence of fftw is added.
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
X-List-Received-Date: Fri, 01 Feb 2013 07:01:44 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index a576368..5110cca 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,8 +1,8 @@
 require pulseaudio.inc
 
-PR = "r15"
+PR = "r16"
 
-DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
+DEPENDS += "libjson gdbm speex libxml-parser-perl-native fftw"
 
 inherit gettext perlnative
 
-- 
1.7.11



