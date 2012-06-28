Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMZY-0005pS-02
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:48:20 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so3329310dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UEo7UOihad0wVtQE08H/fw+CQcy9MqmveVaAdSL4nlQ=;
	b=Hrv1ZmU7rFsWQc7agEIJ8v05QPPlE8MYYw9IlRVmlnX2fA0Fy8fGMxQQgEDvcQ4CaB
	k4CHRxQDPHp8cM5hQN39p8JcWetcI/Z4AuJjZDux3O0TelKAryIA7EnIvkyfEjIndcv0
	zgq82MUMCJ7Q/Pg4A2wh4uMkXfsKUWxlrFtEUmRjG299JPLJ0FiD345Sa6zIPDiiFust
	WGoeVbZ4UXlhSEkbKL8MOyT9Yb395M4nNDIrShgwGclms76edpCbotGjUm2O14Q8xVkD
	0VaEoD3FZgADvmGm6RoVdEFS5jSBOHMNZ9vpnx3q77vLpuCR0RZHtuCVZ7VKUemq2wiB
	EIpA==
Received: by 10.68.221.106 with SMTP id qd10mr12404706pbc.42.1340919446891;
	Thu, 28 Jun 2012 14:37:26 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os1sm3220209pbb.49.2012.06.28.14.37.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:37:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:36:56 -0700
Message-Id: <4e9cdbc999a817f14b6f0a40546f3cae1d13c5e1.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
References: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
Subject: [PATCH 10/11] bison: link in librt on uclibc
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
X-List-Received-Date: Thu, 28 Jun 2012 21:48:20 -0000

uclibc has some functions in librt that are needed
by bison build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/bison/bison_2.5.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
index c5113cd..fc3bb6d 100644
--- a/meta/recipes-devtools/bison/bison_2.5.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
 SRC_URI[sha256sum] = "722def46e4a19a5b7a579ef30db1965f86c37c1a20a5f0113743a2e4399f7c99"
 
+LDFLAGS_prepend_libc-uclibc = " -lrt "
 DEPENDS_virtclass-native = "gettext-minimal-native"
 SRC_URI_virtclass-native = "${BASE_SRC_URI}"
 
-- 
1.7.9.5



