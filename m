Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TqjUm-0005HT-F2
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 13:02:09 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 03 Jan 2013 03:46:54 -0800
Received: by mail-ee0-f69.google.com with SMTP id d41so14042599eek.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 03:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=8/5LI5QjCMjX0QaawZ7mGQKZdjMZ0Zy615cliB7gLN4=;
	b=UpY0WlcLx8UvgCqJmrRL6FC9MPAWJ2rhJKhQgjFNrhHpTWEnmWPzE97F7wA4PVi+vT
	Ngox5HNglx1qOBRMWp4IzaQpzZx2uyeT0mDDlrZS5yFbwRAuPUMrFT8tgtArJ5Q13VUH
	93Qjjt1O8hv6xduT36RZITKgzfc290tSjC9oKrn+NG1OzELe4Cs7wcTAyE7trdgCGdUc
	o81HICOHi6AYl3tXMghmJKoeTTXPXj8rcM9fUn2P1PdnFE0T3XMsS/plEJdWoivDV9xg
	9e4xZy0afVUabYwebjzatBN70ClmaH8l8W6vm7Si8LZSfenBBkUj/amd8BjgTIoMfD3Q
	MPtg==
X-Received: by 10.180.24.70 with SMTP id s6mr76193210wif.22.1357213611955;
	Thu, 03 Jan 2013 03:46:51 -0800 (PST)
X-Received: by 10.180.24.70 with SMTP id s6mr76193178wif.22.1357213611620;
	Thu, 03 Jan 2013 03:46:51 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hg17sm89143210wib.1.2013.01.03.03.46.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 03:46:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 11:44:53 +0000
Message-Id: <1357213493-25506-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnE8U4z863QFF1AwTFUcDykNkff9PTuwf1gzL2QD3siGlvB52I09aSqNl86atT0AMmL9Z+EQT/LhKy88ygpCkR+bMvvQZCyON4O9vPdBCzEusLdd8uRoYanwWEabTw0Wv1xMPhcoceoQaMKYlW08IN5k1/IHrD4CjwUDO5Ao0Q9Ck041YHrDyNDvOuARas4GloDztzv
Subject: [PATCH] gtk+: add native class
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
X-List-Received-Date: Thu, 03 Jan 2013 12:02:10 -0000

It's easiest to bootstrap GTK+ 3 using a native GTK+ 2.

(Patch taken from meta-oe)

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
index 553196a..a6e705b 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
@@ -60,3 +60,6 @@ python populate_packages_prepend () {
     if (d.getVar('DEBIAN_NAMES', True)):
         d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
 }
+
+BBCLASSEXTEND = "native"
+RRECOMMENDS_${PN}_virtclass-native = ""
-- 
1.7.10



