Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1545.1795801793022433077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=hNhOlfs7;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491846221ffso7378299f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801791; x=1796406591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2VJJb2hp0FDj+nMCGna8wcDyjYpxxDxG+IpSXW0Xrxs=;
        b=hNhOlfs7JX8UKo96fAVuPCTN9/fRuHpdQPBjgd6if8Ey2JdqsHjMH95aJLCl+JQYnl
         9OBsIA1XvgmerqHPJhF8OdHqrwYfmfNzBVeeGkaRzWSwJf2EeCWix/iGpjI05apxbPP4
         +lm7Pw6oLeHSOitNNTCBwcOyjXwPH9D3Tak5OzNiElVpWFcVb0WFczYydKGCBovglP58
         Ak7yX3aXGzykwZiALT0P3aH6XNW502eWP1IRgN4piOCVLOeEnngo2PClB7JNBYCRuNQL
         bCYtLbeUYnWx8d7PnaLMASPMsdpBjL+WzIHOuJvHjSebe/ZrLwof9MNbHvyjVhEC5/sE
         CKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801791; x=1796406591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2VJJb2hp0FDj+nMCGna8wcDyjYpxxDxG+IpSXW0Xrxs=;
        b=KkeObCuBFSn3xWURFGHt5YSHt70XdBr68qgWYqrR2/8ALRAi++O4Iy2BED38b2Y7lS
         eEYKnaayzFWdJl8otpN/EEI/KxDcx5VF0DtVc2n7bw4t2ixcZTK2D20uqdvgaTrOl1ek
         /+M6IHbWh/7guDoXK9dWN8ko6juErxkhlJnkh36bUodN/zBvGWm0DpRjkgKG9wfTuWsb
         jjL8wboPvskT76Fv2QolxVl6Xv7SFQyHuRx5ijtr87iMLP6lEJbHGR0XVapUzwgYkwYs
         Ogni8Fa5MlceivwVsBCb3yoHhQq6PpRUNiIFQ62ae7+eV1YFD3E379QgT5pkybv5Xf52
         ZPpw==
X-Gm-Message-State: APuU4Z9BtZzw7iCZv+aSfjrSAdTkRSV8ULif69pcK9qhpg9BReSjUbwV
	ZMdwo1P2iU03iTgZYUllSJBaGVcDCWwH510btWn8DYmyQAzUQtqz0pxCjGCVWZwPD5BERjucr7Z
	FV7i2HSU=
X-Gm-Gg: AZFdTZdktEkDCRUZcJIuuj44/No6RhIEB4ig8UPbaPKXzrPXPs4ELuidWPnDGZ4omwL
	1alY2e5TTm0tKVjIaqqCuQfnvqLItVhIFP73lBfc8UBYnJIFdAY2kzkzt2JlUQBvq5tdYcPCnbD
	RWvygg7TCf/1xUZQTy7rVXvFUDs2hoKggr184sJsWgrDstXlRs78Q3cPpGjnhbtSkkYmuOM04Vy
	IpvvAp1yCAcy7umlZmipK/6u/2iXSBxPgQFh7aWCgK508Oi1Zsfh6vzOGu0pzdus9nm02mD/mNB
	kHrubdmQHAdUjEROuHVEoqjlUkyBtPwlE3ezBPyV7HdBKNe7xzTTB9JUXlcuM03P7Kbv/fZwKDq
	DKXHKHfnTaeuGj3A15sJYCKHEd0/fZySJiLIehGfU/ex6w9VTftbpxDfDxfiQIEcEgWHOnO+4zo
	Wb0Sr+/svg3WEilEqpo+r4XmUfHV7eq644mckh8fHsRotRxUr7tbZidyg/lIFw9rUwtvBl9u2Lt
	M7YIqZk25PxwcPNNw58Ixfx0jGkwY0iFlr+cPEHIY5fJ7Ugv4/yJvxANcb4xzB/1ToFu3saLNgL
	yYiBWJGL2H2b/rqGA2DZOtDLb7qVnxoeTYnNoIDxADNnrP9Rs+ZYoDfdhKocWs6ZVEj2TfdCiRc
	UsdBBYhqt7v3Hpo1AHJuw/Fv0gq9EWPyddaGfhVCAV2jQ4cXHqA==
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr59948772f8f.37.1795801791248;
        Fri, 27 Nov 2026 09:49:51 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:50 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/37] tzdata/tzcode-native: upgrade 2026e -> 2026f
Date: Fri, 27 Nov 2026 18:49:13 +0100
Message-ID: <f9d0dfba220d2502be0ecbdb45cede5bba744f0b.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251436
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5c5781d51df60bbb3d9945c9b3ad89f4d9502f4)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 704d6b603f9..a3c981f8ef3 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026e"
+PV = "2026f"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
-SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
+SRC_URI[tzcode.sha256sum] = "5a18da01393679ef2559214dc687563f7f3d05691f6f58b7fbc0166f3e796cd6"
+SRC_URI[tzdata.sha256sum] = "01b4a91cec5167ed48c11e8ab78f2048cead78ce94b0cafcad0ae8c5a3044d3d"
