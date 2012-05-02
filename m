Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgj5-0000L2-49
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:04:43 +0200
Received: by pbbrq2 with SMTP id rq2so1385234pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=BkaACQtYezeRu77RTgQcc/AXLbKcn3+KAIcecRtltuk=;
	b=dXjZrTfdsMyuGTzwwyoi5JyQCwvqRNx1ryFO4+2GdXwCd4qLdntx4j9ZgynrdZHhjl
	7FsdG/jeRF43YdBzH70MJzBt/Xp4ltrpCYowK5rgI/7ea5J6AOC/Pc9YcqLtfLY3jX70
	YxUhmAjsT6jOFD+CwfNyjaXWGEXR8BcfXmqyHslkFd7Z8FpbuKwYThhboFBwcqBJ4Adx
	MAirgQTnU2xw7NGIZd3lbgyptNFYCX+W4yVX/iAMENOuo2/DFsYjCUfAwFgFZYwqFcPm
	T3wub3roP2AnQ91h7Qg/aNGKEPzk6n8FIDtCiFOANUV6K0od0nfNAmp4hTCBAnzS3GKf
	B/4w==
Received: by 10.68.136.69 with SMTP id py5mr746249pbb.115.1335992096546;
	Wed, 02 May 2012 13:54:56 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pg6sm2949558pbb.41.2012.05.02.13.54.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:54:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:53:54 -0700
Message-Id: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
Subject: [PATCH 1/7] unfs-server: Do not use DESTDIR
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
X-List-Received-Date: Wed, 02 May 2012 21:04:43 -0000

DESTDIR is makefile variable not available in
bitbake environment

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
index d03c153..682891d 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
+++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} = "pseudo"
 RDEPENDS_${PN}_virtclass-native = "pseudo-native"
 RDEPENDS_${PN}_virtclass-nativesdk = "pseudo-nativesdk"
 BASEPV = "2.2beta47"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://linux.mathematik.tu-darmstadt.de/pub/linux/oldstuff/people/okir/nfs-server-${BASEPV}.tar.gz \
            file://001-2.2b47-2.2b51.patch \
@@ -53,7 +53,7 @@ EXTRA_OECONF = "--enable-ugid-dynamic \
                 --with-exports-uid=0 \
                 --with-exports-gid=0 \
                 --enable-mount-logging \
-                --with-devtab=${DESTDIR}${base_prefix}/var/lib/nfs/devtab \
+                --with-devtab=${base_prefix}/var/lib/nfs/devtab \
                "
 
 do_configure_prepend () {
-- 
1.7.5.4



