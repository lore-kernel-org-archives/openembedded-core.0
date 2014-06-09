Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 193C165F1F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:45:11 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id x13so3301979wgg.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 08:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sRUk8I1mY8Yd2NF4zrd5vkWn4r7ee8kRpt2p8ztY6W4=;
	b=dBcbKSX9H92szsaxS5QBcogWU/Hd6PnDIb9Zgy4OtFfCgD/C1GE2qMN3vu+4ga6H2s
	zXkXQEYGFhUhzms5UDs7cE9WJr8V6Tlv8xwUlzVqRfr7MTg22fWdm9gYbl2bVJ1/k5G2
	PWcQrxMNNi7ElpbzrZQfJ5KRi0oZya/9kX2+1iftujFsGjnwe5k0KxFXBlRYXKPo3kja
	ifTP4BFI7uSg0+4GoFGpT9vi/hOGVNpmWMvPNuIxQ0O3UJyXpMsqbfxtkNkQAWdwvbD/
	Zxnis31u47oYoR0WbHWOXx6lsOrgGnmDFlpyG+xNmu27TrkWPa/NhEKssyROLZ+qlYQr
	aNZA==
X-Gm-Message-State: ALoCoQnlpqtQuPJ+mxsIr2NjQGjVHM13LdzO22o2mPI0owHny2X5KJZBSO0vjekdxH7EQjwPqNuB
X-Received: by 10.180.211.106 with SMTP id nb10mr21721111wic.9.1402328711608; 
	Mon, 09 Jun 2014 08:45:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	en6sm15386875wib.11.2014.06.09.08.45.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 08:45:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:45:03 +0100
Message-Id: <1402328704-6854-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] gdk-pixbuf: fix paths to test binaries
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
X-List-Received-Date: Mon, 09 Jun 2014 15:45:15 -0000

The tests are installed to $libexecdir not $libdir/gdk-pixbuf.  By default these
are the same location but they can be changed independently.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.7.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.7.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.7.bb
index a9d1eed..7bdd723 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.7.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.7.bb
@@ -67,7 +67,7 @@ FILES_${PN}-dbg += " \
 	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
 "
 
-FILES_${PN}-ptest += "${libdir}/gdk-pixbuf/installed-tests \
+FILES_${PN}-ptest += "${libexecdir}/installed-tests \
                       ${datadir}/installed-tests/gdk-pixbuf"
 
 RDEPENDS_${PN}-ptest += "gnome-desktop-testing"
-- 
1.7.10.4


