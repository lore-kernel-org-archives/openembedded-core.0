Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD9s-000731-AL
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:40:32 +0100
Received: by wibhm17 with SMTP id hm17so2142819wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=e5sKd+vF1Aq0Xl4fwYZrk5/66cuzVOMjBOCai7t0LOE=;
	b=iwlG934l23Z7pti2mzvY/WrtSuLSm0BTNaz8Hah+2Q/o7Vb66zFVdoyx3K6FJkPeTs
	KC6y4YnfVgmp2bGZ375pVcH9DK5+T1F1QoCw4SzQNn23T37Qx9qIbSxuUk3UpSlvL/ft
	YZw4T53mtHOk0b0zPXzFONXpWydE7+2gBtSjCo+Q/Y4uvY/tS9TuvI8HbO+2nDJ6k9pf
	RpTX/mEC1VBmXliTdPyQJ1feunC1OXXiAdl7Yfq/2UWovbMC9i05t5ERPlivie7rLBi0
	9RhxeOmqkJ6kpWnoD9EQkP4Zd/+Ullw6dUZbz5glYTgFkb9I9a3NRPFSDtRIhl7l6VQf
	WIoQ==
Received: by 10.180.84.164 with SMTP id a4mr685304wiz.2.1332541896003;
	Fri, 23 Mar 2012 15:31:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm28631580wiv.11.2012.03.23.15.31.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:46 +0100
Message-Id: <9a008659688c196ac5cf230c144d5a382e5bdb89.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 07/10] tiff: import native support from meta-oe
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
X-List-Received-Date: Fri, 23 Mar 2012 22:40:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.0.1.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
index 6fb4163..80677fc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
@@ -3,6 +3,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
+BBCLASSEXTEND = "native"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
-- 
1.7.8.5



