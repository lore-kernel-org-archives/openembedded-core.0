Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOI-000799-RH
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:35 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so1214584wib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=sakGhZ1XRge3jn6hICiJp9qYKNUKAoeMyHBrUhMVxLQ=;
	b=aQU4huNXF/0/wX4beXczFCUyZkgBnYdOGvN+acZ/ldE4WQm6tFknpkzdqUKqpk598T
	3QDDf8hG4omgnXJdLksXHwVNKraeP1es+rVud9nEHVjl8Sj9vZW0vCBT+xid+Ji4tGqJ
	PUorWYSuyueHi9NaZ5Uv7Q8vf5GJENiOejB4/4ZYO8vB6QR63/qUKEPKNsrhQlwYQjJC
	gnQVNFMCa8N0OzvcppzdqCaZ9os1HxiW80MybyHqYrPXLrsPF4rkKYBPVhfvHqJBCtm3
	lVXVsniVXdbud+DUQL+cs3zYLyy8jezJzJL4cSDU2caZfJ9ixDT9dAUiXgeZ4xqBWyEd
	7NLQ==
X-Received: by 10.194.220.70 with SMTP id pu6mr26088464wjc.27.1364316811223;
	Tue, 26 Mar 2013 09:53:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:19 +0000
Message-Id: <d965404e7d7bff87ff5b2d99faf157e447a91e10.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmDiiF/Nro8nnNI1gEMfv4i6t1PhO4re9U0dkDZlgJ3QfHDao3u2JCuYkOZ/CeEE7CHAbUn
Subject: [PATCH 21/24] systemd: recommend systemd-compat-units
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:43 -0000

These are more than useful as they ensure some services are not started twice,
and cause the first-boot postinstalls to run.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index d07fa95..5ba3a23 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -180,7 +180,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "dbus"
 
-RRECOMMENDS_${PN} += "systemd-serialgetty \
+RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
-- 
1.7.10.4



