Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4EFC0782CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:43:08 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k3so7738205wrg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Z5SdF3k+/pv6iK+5ijt3hPOmzACku23wWGGv3hYRPQU=;
	b=oIUG0IMketxnZ+/cTdid8nPJSA6IAcmwxuPOinz8GQIWASXPYq6G1+OWeqKnT+dvuE
	qK1Cm0KX1zIRKuKPZaU+bvPr3ZR0XBqVfLTweTIOFpvxEQUfSk2XDBu5RxUREXorYrn4
	HrsQiK8Khz/3s4PPZAmwe9Cmh/XDR9qI6L4/bWzvYRTJCKXjbCSR81Y0kJPja90faASt
	4F6o1UVAVafFdg/LNaMLH+5ODcr1YzGeBjD1e5JfVAAvwIlzWvw8sPJzH22lSggfZATF
	Uy5uIGa96UV7OXto4NV7sEg5TJ7MlkrmcSb4HnOaaQqQQ00FsIdV7zQ1X+kl/6CYi2+7
	WlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Z5SdF3k+/pv6iK+5ijt3hPOmzACku23wWGGv3hYRPQU=;
	b=XT5GvqCjGZURAf+7q5PPJ+1ciPtotlKFyQ8hHFiApU33Z1mCqUHk3xSQ93mreLBRae
	uHUoWywOkOagAYVGomN2/Bl9GPSBVbfm41703zUBjOKP2JmrlnB7iib3wmmwX8MoMI4S
	u1qYoAp0/gIFbOADahbN/E/8Uj4daHITxcTgzXRidvHpvL06peTSgOTjAcjvCdYqEDW3
	ejmGQ+KxvW4XIq0PFac5aBuxSbKlWxhkvfcXrE2H5Z0k/LeRmese76zUprhq7wpuvauy
	snFe4EoepV/XOlXHFebMAR4UcMC/c1npKVuVIl1UDlc4oV+1052yb8af8e9aRPlAQnXN
	ctCA==
X-Gm-Message-State: AElRT7Gr4rogKs72B/P/7z3ma+aSaNxKu9EV2Vxkv1vzWHDawsXmvbfI
	2xvC38L95N40xjzbqiSh32nJ39VY
X-Google-Smtp-Source: AG47ELtPdjI4TCar6y2zWIGutYuQ8qUPnAJK/rDAJOAifSs3axp0uF7deMVMih0oij0zzfaZRsJDBg==
X-Received: by 10.223.189.133 with SMTP id l5mr4638636wrh.69.1521110589668;
	Thu, 15 Mar 2018 03:43:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q16sm4261667wmg.3.2018.03.15.03.43.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Mar 2018 03:43:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 10:43:03 +0000
Message-Id: <20180315104303.14908-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gtk-doc: always inherit python3native
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
X-List-Received-Date: Thu, 15 Mar 2018 10:43:09 -0000

My attempt at only inheriting python3native if it was needed was broken and
didn't work, so back it out and always inherit.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index b8db4280bcd..3f731cb93bf 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -28,10 +28,8 @@ GTKDOC_DOCDIR ?= "${S}"
 
 export STAGING_DIR_HOST
 
-inherit ${@oe.utils.ifelse(d.getVar('GTKDOC_ENABLED') == 'True', 'python3native', '')}
-
-inherit pkgconfig qemu
-DEPENDS_append = "${@oe.utils.ifelse(d.getVar('GTKDOC_ENABLED') == 'True', ' qemu-native', '')}"
+inherit python3native pkgconfig qemu
+DEPENDS_append = "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 do_configure_prepend () {
 	( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} || true )
-- 
2.11.0


