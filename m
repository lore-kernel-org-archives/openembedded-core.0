Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKxQ2-0005W4-Cm
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 20:48:58 +0200
Received: by pxi6 with SMTP id 6so2142610pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=UewmTBKLyyQrATp2+bBojCX1qRvC3rwiNoPiFuMplZ0=;
	b=vpbmQQb4RxBW9RuUny9fnGzTgerbyN0nrdZEzZvdPRimUJABFuSVjryxhi35rAkabz
	0wQzShAhPRaP/kWhGO4vPfClSuqazIKBwZks/JFFqev+0QVd0AjiNAW912ifEOKHmck8
	iz9B/LGfTIbe6yCYq07d3TTQxAQujYYd2UMwg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fJMMWS/plve0505Ym0mEKbhkFDMCvnRSb1UEHmBZRx0+A3nX1FagcUrn9MdVWIAZV5
	wPLCEtpHg7wG2yRocCFMqbau1ddoMfy96507ujShruT5O3mQQTj1fv0HFXx3V5f9j3Kl
	0TrBgDt2P8RLms4tbf0n9ShRc6W3GVxEnLUTQ=
Received: by 10.68.56.130 with SMTP id a2mr2615833pbq.3.1305312368662;
	Fri, 13 May 2011 11:46:08 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p17sm1514533pbt.83.2011.05.13.11.46.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:46:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2011 11:46:01 -0700
Message-Id: <40b6bd5baa980cd13fc33ba15509be078239bdbc.1305312304.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305312304.git.raj.khem@gmail.com>
References: <cover.1305312304.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] util-linux: inherit pkgconfig
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
X-List-Received-Date: Fri, 13 May 2011 18:48:58 -0000

Configure of util-linux used pkg-config to poke for gtk-doc versions
so we need this dependency on pkgconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 447e5b7..489ec1a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1530e36fe1304d4535513de90a290df9
                     file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
                     file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native_append = " lzo-native"
 
-- 
1.7.4.1



