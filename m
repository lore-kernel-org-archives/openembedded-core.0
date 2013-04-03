Received: from mail-gh0-f172.google.com ([209.85.160.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UNWGT-0007yt-Hp
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 00:34:45 +0200
Received: by mail-gh0-f172.google.com with SMTP id r19so339058ghr.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=w58Y/fyj2melDN0i7A9IBAe6mGXt59B8r0DdE4d6+w8=;
	b=UX8y+nwOQaPoc8mjqThWvJQElW3nCa/vxgBvez12gxuOjdnfDJOrbKN0Fmqkz0rUqI
	NsYRDunhlvmTjS4Wvbrg/SGE3yiCLxHBCbAcJLM8m7DOghdmc2YpLnHx2df7znXtwxiU
	Ng7n1ynx7xTA+aTbkOQp8ycujxfPILEBAxYIQHTt5OIJ9skTcAURVg0/sP9nlLr/oJ0x
	3RTEmYmw92Nn2xKfAJWOPDDTFnQb5bA2Wmk5I+zVJ4bnTu2gBVo6wYbHmUeWgFNtoS8E
	DE3YSISXGqF9O8VNHazUHrBLGstGVqMzfcb8AF+YT4TvRixlgPaC42vwOCj0fGpTI9zt
	mVIA==
X-Received: by 10.236.117.226 with SMTP id j62mr2244734yhh.139.1365027453358; 
	Wed, 03 Apr 2013 15:17:33 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id f70sm12089239yhi.12.2013.04.03.15.17.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 15:17:32 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  3 Apr 2013 19:23:39 -0300
Message-Id: <1365027820-2912-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] pointercal: Move override files from 'files' to 'pointercal' directory
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
X-List-Received-Date: Wed, 03 Apr 2013 22:34:45 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/pointercal/{files => pointercal}/COPYING   |   0
 .../recipes-bsp/pointercal/{files => pointercal}/pointercal |   0
 .../pointercal/{files => pointercal}/qemuarm/pointercal     |   0
 .../pointercal/{files => pointercal}/qemuarmv6/pointercal   |   0
 .../pointercal/{files => pointercal}/qemuarmv7/pointercal   |   0
 .../pointercal/{files => pointercal}/qemumips/pointercal    |   0
 .../pointercal/{files => pointercal}/qemuppc/pointercal     | Bin
 .../pointercal/{files => pointercal}/qemux86-64/pointercal  |   0
 .../pointercal/{files => pointercal}/qemux86/pointercal     |   0
 9 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/COPYING (100%)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/pointercal (100%)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/qemuarm/pointercal (100%)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/qemuarmv6/pointercal (100%)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/qemuarmv7/pointercal (100%)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/qemumips/pointercal (100%)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/qemuppc/pointercal (100%)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/qemux86-64/pointercal (100%)
 rename meta/recipes-bsp/pointercal/{files => pointercal}/qemux86/pointercal (100%)

diff --git a/meta/recipes-bsp/pointercal/files/COPYING b/meta/recipes-bsp/pointercal/pointercal/COPYING
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/COPYING
rename to meta/recipes-bsp/pointercal/pointercal/COPYING
diff --git a/meta/recipes-bsp/pointercal/files/pointercal b/meta/recipes-bsp/pointercal/pointercal/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/pointercal
rename to meta/recipes-bsp/pointercal/pointercal/pointercal
diff --git a/meta/recipes-bsp/pointercal/files/qemuarm/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/qemuarm/pointercal
rename to meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
diff --git a/meta/recipes-bsp/pointercal/files/qemuarmv6/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/qemuarmv6/pointercal
rename to meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
diff --git a/meta/recipes-bsp/pointercal/files/qemuarmv7/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/qemuarmv7/pointercal
rename to meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
diff --git a/meta/recipes-bsp/pointercal/files/qemumips/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/qemumips/pointercal
rename to meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal
diff --git a/meta/recipes-bsp/pointercal/files/qemuppc/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/qemuppc/pointercal
rename to meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
diff --git a/meta/recipes-bsp/pointercal/files/qemux86-64/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/qemux86-64/pointercal
rename to meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
diff --git a/meta/recipes-bsp/pointercal/files/qemux86/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal
similarity index 100%
rename from meta/recipes-bsp/pointercal/files/qemux86/pointercal
rename to meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal
-- 
1.8.1



