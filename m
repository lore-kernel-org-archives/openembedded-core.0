Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UI2iZ-00072u-B4
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 21:01:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2JJiHOF019678
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 12:44:17 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 19 Mar 2013 12:44:17 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2013 15:20:58 -0500
Message-ID: <1363724459-31561-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] base.bbclass: Update the preferred_ml_updates
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
X-List-Received-Date: Tue, 19 Mar 2013 20:01:15 -0000
Content-Type: text/plain

While working on a problem related to variable key expansion, I noticed
that the multilib PREFERRED_* expansion wasn't working exactly the way
it should have.  This patch addresses that issue.  Below is a diff of 
PREFERRED_* entries before and after this patch.

@@ -58,11 +58,6 @@
 PREFERRED_PROVIDER_virtual/lib32-libiconv="lib32-eglibc"
 PREFERRED_PROVIDER_virtual/lib32-libintl="lib32-eglibc"
 PREFERRED_PROVIDER_virtual/lib32-libx11="lib32-libx11"
-PREFERRED_PROVIDER_virtual/lib32-nativesdk-libc="lib32-nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/lib32-nativesdk-libiconv="lib32-nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/lib32-nativesdk-libintl="lib32-nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/lib32-nativesdk-x86_64-oesdk-linux-libc-for-gcc="lib32-nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/lib32-nativesdk-x86_64-oesdk-linux-libc-initial="lib32-nativesdk-eglibc-initial"
 PREFERRED_PROVIDER_virtual/lib32-update-alternatives="lib32-opkg"
 PREFERRED_PROVIDER_virtual/lib32-xserver="lib32-xserver-xorg"
 PREFERRED_PROVIDER_virtual/lib32-xserver-xf86="lib32-xserver-xorg"
@@ -77,9 +72,7 @@
 PREFERRED_PROVIDER_virtual/nativesdk-libc="nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv="nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl="nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/nativesdk-x86_64-oesdk-linux-libc-for-gcc="lib32-nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/nativesdk-x86_64-oesdk-linux-libc-for-gcc="nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/nativesdk-x86_64-oesdk-linux-libc-initial="lib32-nativesdk-eglibc-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-x86_64-oesdk-linux-libc-initial="nativesdk-eglibc-initial"
 PREFERRED_PROVIDER_virtual/update-alternatives-native="opkg-native"
 PREFERRED_PROVIDER_virtual/update-alternatives="opkg"



