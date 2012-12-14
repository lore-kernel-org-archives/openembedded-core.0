Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjYZL-00025H-0w
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 17:57:07 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 08:41:57 -0800
Received: by mail-wg0-f69.google.com with SMTP id es5so2444724wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 08:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ONWI4w1VdcONGdl76Y9xzqcxikSzIm2SLciFvXayUaE=;
	b=aLNzTzflz8H/6ScugM4XfpsmLtok7me/5LQntJrbMKHbo4rr+l3BCRqWGVd34yvMIP
	uchwe/tMVwigMfwxKiwu9Ydgzrfg4e+snoNQ0hj2vEryKrJEYqpQAIg4ItRfb7M12jaP
	9GPn1ldf1cFHagq8ItsettP8hqr1SraFrb8QshZF2CUl0tkylBn7H/yaYzA5RyR07ImV
	n2jA8fNwuHXVtakRA1ToXXbOns5iUKtK9OUUacwyb+e817xgbz5DdHAqAc6kIUvjlKY5
	lPpyGj67v/zjM8xOIMTIPAIA/cHaIEo7aiAASKx0loak9vHyH/XHJ4S1cbIgDA1Izljj
	MUQg==
Received: by 10.180.88.70 with SMTP id be6mr3704535wib.14.1355503316164;
	Fri, 14 Dec 2012 08:41:56 -0800 (PST)
Received: by 10.180.88.70 with SMTP id be6mr3704522wib.14.1355503315990;
	Fri, 14 Dec 2012 08:41:55 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hg17sm13018222wib.1.2012.12.14.08.41.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 08:41:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 16:40:15 +0000
Message-Id: <1355503215-8637-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnXWTCLgjEyx/YafGyLjijpOUIbJiRtKKPQiIyp6sSWaV/xt2iaIf/vVBaFbtb7HQpTJyGTtYBApWBrF8f8FXhCkImQ6ahFNRkE4f5TKVlldQ/1L85cIGD8xmgwbmKMsNNhhrT3kcDMwsWreTBYUAtHWJ7nJx4X/jaH+XijH1yJE3Fv2QscN9qRn3/wHcsym/qumaLV
Subject: [PATCH] libsoup: RRECOMMEND glib-networking
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
X-List-Received-Date: Fri, 14 Dec 2012 16:57:08 -0000

Without glib-networking, libsoup can't do SSL, proxies, and probably more.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
index 486c38b..4a4d59a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r1"
+PR = "r2"
 
 SECTION = "x11/gnome/libs"
 
@@ -21,3 +21,5 @@ S = "${WORKDIR}/libsoup-${PV}"
 
 inherit autotools pkgconfig
 
+# glib-networking is needed for SSL, proxies, etc.
+RRECOMMENDS_${PN} = "glib-networking"
-- 
1.7.10



