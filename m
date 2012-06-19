Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sh0R2-0001Jx-G2
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 17:33:40 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Jun 2012 08:22:45 -0700
Received: by wibhm11 with SMTP id hm11so634132wib.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 08:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=80jhJaSszQGRAvBNQFO4aozNtm0usfbcGJjeev6N358=;
	b=Vd89goupviVQ2tirAGRw8riz+mRTksWppYyvAujVfrCH+LvqcMPXu1Fub2vatczDPE
	fMPXT0pXVOpVNCHmq4eQuF6g1NJzlS1iFYw4fMuuAR7eb4jG44ANsXcKC4esYA1JkNTo
	N/YA5rVfEBfVfOoAY5qRNckYiVhzQsQDAIxKJV/YKzPppyPrZdGVCwkUCnhobOzyiS00
	IpMUOUqJ5G5gLnV8nxJFmR1RSckxMlpuEdVMeFMckux58I4t7LWdl/Bao50iTWkuN1C6
	5Tz++yd1LWmEyJWnQ2lUVW0sAEsI9lj0LFnhI2VNYeKjYDhuWIG904cn+BOKFb6nqlGo
	U84g==
Received: by 10.216.226.32 with SMTP id a32mr10359133weq.190.1340119363497;
	Tue, 19 Jun 2012 08:22:43 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q6sm33612651wiy.0.2012.06.19.08.22.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 08:22:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 16:22:28 +0100
Message-Id: <048890badd121e651e2524215ca798a5250c0d0a.1340119197.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
References: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
In-Reply-To: <cover.1340119197.git.ross.burton@intel.com>
References: <cover.1340119197.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQljheeERnlnv8PCYzqhAL1J+vwLn11dbKURvvh6b02YEYtrgQRf8mwEe3RyPc87pgLd1q3l
Subject: [PATCH 4/6] connman-gnome: fix build depends (Yocto #2556)
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
X-List-Received-Date: Tue, 19 Jun 2012 15:33:40 -0000

---
 .../connman/connman-gnome_0.5.bb                   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index e2e8deb..a4327f5 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
 
-DEPENDS = "gtk+ dbus"
+DEPENDS = "gtk+ dbus-glib"
 
-PR = "r10"
+PR = "r11"
 
 SRCREV = "42c652d123ea133d0a0930b96e8e39dbd0c597b5"
 SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git \
-- 
1.7.7.6



