Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id C574B6A4E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:14 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x12so1326908wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=1hVqEJPWbulpdrP1MNIWPKFJi1s3MNZe2/DX64NmMDE=;
	b=bnOZ17mblRf0YMrPwZnkPpTDx5BDHgW/V0BXNZKtMnAuIRdd6SthtGYJGYCgby0Hux
	0HNcV2Gspj5vqohPCNPS+uInQMO5DNcaJA9HYkbYeBERr8pZkDHBZahVBXQD0C05aBip
	EcuAH7FlrjzTanHF0Ulpmz03PZIm6bKQWmM/5ONNWzZ8VgjGK1NNFoWcMQIy45M/s0BM
	eyhy8rb5FMdWD8CDl5qd1IEbjQqyZIsv19YCdpEyATbI1ulJFCStn328YbXfY4tPsGMK
	N2m3YVuRpWjUWh0vX7GlqBAtobOE2lhCCglHehtmS+w4V+SZVj5WsQ6EU3jZl8wufN4C
	jWkw==
X-Received: by 10.194.58.11 with SMTP id m11mr8224606wjq.45.1370012954909;
	Fri, 31 May 2013 08:09:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:42 +0100
Message-Id: <55d4ca897580df2e27e37649afc415ce688e3fc5.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkkMBlRt+hheMTOZlg8dcmY6KKUQ5ECdJpYCB8paEVDWkiJTlTSCC95ThmlipX0cKSdoZ4R
Subject: [PATCH 06/11] gtk+3: add dependencies for gtk+3-demo
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
X-List-Received-Date: Fri, 31 May 2013 15:09:15 -0000

The demo loads PNG files and sniffs mime types, so ensure that these
dependencies are present so the demo actually works.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 1e0fed2..cc51fcd 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -65,6 +65,10 @@ FILES_${PN}-demo = "${bindir}/gtk3-demo \
                     ${bindir}/gtk3-widget-factory \
                     ${datadir}/gtk-3.0/demo"
 
+# The demo uses PNG files and mime type sniffing, so ensure that these
+# dependencies are present.
+RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
+
 FILES_${PN} = "${bindir}/gtk-update-icon-cache-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
                ${bindir}/gtk-launch \
-- 
1.7.10.4


