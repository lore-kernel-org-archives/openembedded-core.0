Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVQ-0001Gq-Rv
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:13 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:49 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so1873962wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=jNqE28jjKpc98XRhZp7jZ5K+Mv3YLA52AGI/T8uwhpM=;
	b=UL+sblYFnLkeVlger1325pCEd2YgmrmPhFV0YWULAwVoELgYBdSG05NksZ65r0atWW
	DlhnKItaBWws8By6y94kgjEyN8kkMz3Z9qpwel6jPAw2QovOjqkFT9dXM2NcKkt69Iu3
	hnILbObnSZdUfniN1lZ8L5zQ8Pu14BDqUvBBD2i67jaVlpAKyx1fP+abSTWF+yaUXsDZ
	HKuaW8yTKJBTuJf9irqaY2pfru9DpAo90LBjJpzKrWFbHtT5/wRcT9tLXmyxLdvHEeEX
	ED+vwBLtWxGsA7d6ah9vCs/PRn7qZHnvSWgPi+C2m8ySlhR5rq2meOYBg19dW1nuVSN6
	5NIQ==
Received: by 10.216.113.4 with SMTP id z4mr1410364weg.201.1342714309535;
	Thu, 19 Jul 2012 09:11:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:59 +0100
Message-Id: <6461a14d2e281da1ec6cb1df6ddf9a92e1f99944.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn6tPpFvLy9x5EDjcbP2iHzVraztLwJnSR42BKbO7zRCWaF2xrQBWo2SsaZZe672k3esKHh
Subject: [PATCH 12/26] gail: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:15 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gail_1.20.2.bb |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gail_1.20.2.bb b/meta/recipes-gnome/gnome/gail_1.20.2.bb
index 32ef6c5..df6cd03 100644
--- a/meta/recipes-gnome/gnome/gail_1.20.2.bb
+++ b/meta/recipes-gnome/gnome/gail_1.20.2.bb
@@ -7,15 +7,13 @@ PROVIDES = "virtual/gail"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r1"
+PR = "r2"
 
-inherit gnome
+inherit gnome gtk-doc
 
 SRC_URI[archive.md5sum] = "e805806f897cf6040e1f3e9c0cd2151b"
 SRC_URI[archive.sha256sum] = "5025b13a4f3b960c8ab7c3e5c7d6d86082e2e1af6ee18e61e37fd4ce3dcc0153"
 
-EXTRA_OECONF = "--disable-gtk-doc"
-
 FILES_${PN} += "${libdir}/gtk-2.0/modules/*.so"
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
 
-- 
1.7.10



