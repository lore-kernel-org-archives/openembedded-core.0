Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6EZ-0007gU-6o
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:35 +0100
Received: by mail-wg0-f42.google.com with SMTP id 12so2390668wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=7tfNI+sQW31uQjAlGFtQ4MHyfW9ZnUPEhe8Dm56M0y0=;
	b=QQBKf6vqEDp3fZ+yWKRwOvYAMLLB+RIuXp5p7u/JkVU/18J1inefCWg2MGaAx8huIX
	UgyO7u/C8cJsBrt8rKKObAwh6Dc/98GxU+MrtPR5BI+OkstoFDh4q1KVhsOs/bCPXq81
	0pN1p29eI97ESPskjbHwuOTvRfgTSrkYBxWdFSgMvINre2ktu6i44EjElAIZHaD7iUAB
	8JElKYvs5D+Pk/Jmv09TwVAUmStkuCPd9wy+l2Vd9gJqRYgtYyAlOhbq80gfEEndBW0l
	DeyFATczXoOJTXGhU9tWnjaR6yus7iW2AP8EIQOxPnmrhXInp+VJ/kEfERnZj/v4K1A4
	n/BA==
X-Received: by 10.180.81.193 with SMTP id c1mr4611983wiy.19.1363974097246;
	Fri, 22 Mar 2013 10:41:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:25 +0000
Message-Id: <310d2109fe0d11dc71db93aeb03c5244ee5c79cb.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlDnblnvIGEkivlbyfi53rL2f+VIQJx8lDVE6MnS8zkBfLbS4YDU5cgbecRDslUOJ8r8rxv
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/22] core-image-minimal-initramfs: don't install busybox-syslog
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:30 -0000

This uses BAD_RECOMMENDATIONS which isn't supported by all package backends, but
it's a start.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 7f6826c..6de24b3 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -17,3 +17,5 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
+
+BAD_RECOMMENDATIONS += "busybox-syslog"
-- 
1.7.10.4



