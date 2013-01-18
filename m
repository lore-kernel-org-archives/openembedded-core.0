Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Tw2Mw-0002Ko-BU
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 04:11:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0I2uRBB017184
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 18:56:27 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 17 Jan 2013 18:56:25 -0800
From: <rongqing.li@windriver.com>
To: <randy.macleod@windriver.com>, <joe.macdonald@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2013 10:56:23 +0800
Message-ID: <f55fd0b28b693f4a7c0a761c4630e0375b4a526b.1358477598.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358477598.git.rongqing.li@windriver.com>
References: <cover.1358477598.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] default-distrovars: add tcp-wrappers to default DISTRO_FEATURES
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
X-List-Received-Date: Fri, 18 Jan 2013 03:11:58 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

tcp-wrappers DISTRO_FEATURES only is used in xinetd currently, but other
packages maybe need it to enable tcp-wrapper support, like vsftpd.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/conf/distro/include/default-distrovars.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9002fd6..9126825 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -19,7 +19,8 @@ DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-b
 					libc-posix-wchar-io"
 DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 tcp-wrappers \
+			${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
-- 
1.7.10.4



