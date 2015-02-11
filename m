Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 69F1D73348
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 18:10:41 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u56so5109810wes.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uLoT6o9AMlmSnas/gXWGJbzkrkqQDdbHAOZPXvqmOXM=;
	b=N6xRIESd2Ru92vD3TctT15+bmG70+xuXjiun9pBOrz5aOnk8oTDrrqWQyx/mSxnmBA
	kp39jsve9qqgr1qF6HqdAIXxdnZVtDGMu2bLDnP7gAzPXuJvJzmJgfvnNxibKaWrAP7l
	aipvJjDFrT4eLF2ODzl5wQ/Du4svRQLNXYRTn3s9vQcpntgfR70hFI/truYRTWkjk3T9
	rTU7UqkmmsT5NaVnDSo1fbLNlWC7E26353Sv4qZUNN2z90wj1wNymayZBBwKPiZEUAIe
	omQexyUF0EOq5wT0jH2IDqT27wLuU2Ba8pxVuGcRJEDZd70hPbg5YYtn/nG0hczq7ift
	CM/Q==
X-Gm-Message-State: ALoCoQlwER7cbrtlVnii4TT8F5nkbwWZoLuN9N/LpqtOODL3+N9Z+0lXA+WVc8w3VyrMonyXSpQJ
X-Received: by 10.180.108.178 with SMTP id hl18mr7871645wib.92.1423678241568; 
	Wed, 11 Feb 2015 10:10:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hn2sm2309857wjc.5.2015.02.11.10.10.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 10:10:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 18:08:30 +0000
Message-Id: <1423678110-27633-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1423678110-27633-1-git-send-email-ross.burton@intel.com>
References: <1423678110-27633-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] gstreamer-plugins: don't ship files in ${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 18:10:47 -0000

${PN} generally should be empty as every file the GStreamer packages ship is
owned by a particular plugin or library, so enforce this behaviour by unsetting
FILES_${PN}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 586bd05..bc33b0e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -53,7 +53,7 @@ FILES_${PN}-apps = "${bindir}"
 RDEPENDS_${PN}-apps += "perl"
 RRECOMMENDS_${PN} += "${PN}-meta"
 
-FILES_${PN} = "${datadir}/gstreamer-${LIBV}"
+FILES_${PN} = ""
 FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
 FILES_${PN}-glib = "${datadir}/glib-2.0"
 
-- 
1.7.10.4


