Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id 9C68B65D6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 02:25:51 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 25 Apr 2014 11:25:51 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-core@lists.openembedded.org>
References: <1398391066-30575-1-git-send-email-changhyeok.bae@lge.com>
In-Reply-To: <1398391066-30575-1-git-send-email-changhyeok.bae@lge.com>
Date: Fri, 25 Apr 2014 11:26:09 +0900
Message-ID: <011101cf602d$b7ecfbb0$27c6f310$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQGhLR649I01J6a8P2S82Iw3GWquNZt+ANiw
Subject: Re: [PATCH v2] mirrors.bbclass: Add mirror site for savannah
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
X-List-Received-Date: Fri, 25 Apr 2014 02:26:00 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Hi

I'll withdraw this and "dmidecode: change the SRC_URI" patch.
Because I'll create one patch with those patches as Martin's comment.

Thanks

-----Original Message-----
From: Changhyeok Bae [mailto:changhyeok.bae@lge.com] 
Sent: Friday, April 25, 2014 10:58 AM
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae
Subject: [PATCH v2] mirrors.bbclass: Add mirror site for savannah

* The SRC_URI is not accessible.
  So need to add mirror site referred by the original site.
* The problem is that
  http://download.savannah.nongnu.org/releases and
  http://download.savannah.gnu.org/releases redirects to closest mirror
  and few mirrors (e.g. .jp) weren't working correctly while
  http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 meta/classes/mirrors.bbclass |    2 ++
 meta/conf/bitbake.conf       |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 1fd7cd8..5c5f8b6 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -45,6 +45,8 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://sunsite.ualberta.ca/pub/M
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
http://www.apache.org/dist  http://archive.apache.org/dist \n \
http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n
\
+${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases 
+\n \ ${SAVANNAH_NONGNU_MIRROR} 
+http://download-mirror.savannah.gnu.org/releases \n \
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf index
b3786a7..4a08fac 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -568,6 +568,8 @@ KERNELORG_MIRROR = "http://kernel.org/pub"
 SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
 XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
 XORG_MIRROR = "http://xorg.freedesktop.org/releases"
+SAVANNAH_GNU_MIRROR = "http://download.savannah.gnu.org/releases"
+SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
 
 # You can use the mirror of your country to get faster downloads by putting
#  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
--
1.7.9.5


