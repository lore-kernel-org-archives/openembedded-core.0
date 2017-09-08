Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id BED4878293
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:31 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id e199so6576647pfh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OH+6jKAhy80noZWcLmaLFo0RldacN8fD3d79oa//lNg=;
	b=nqOCv64mEQx735H0ZEWrSNfXHDASvAlY6XWf/Vb6Kg3atE1Ezz1SKzMLXEk6i9+H+/
	r7+L+dGls27JOqdLPEOX+f5sw3HYvdo2lEFFsxBcEk22QC51kE+lvFeNMaqDGaa5/htL
	WOM66f8kbfPYOiO3dsePrwPCCoYrozF2Lifc+sMQi0IS+Cem2aFNCW/be4KI1ufRMnge
	ra+FWQpl6Dj7LoxRtWe34w1yVAMykV2xWTjuGqz679YJnPysDq68ayo0yFW7Pf2Lv43e
	a887Y5/06i7Uw6HzvA+ztTAVVjypaPEBUU/p9Iwirkda1YJThF6hp93z7fQQfWBlUpxh
	1RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OH+6jKAhy80noZWcLmaLFo0RldacN8fD3d79oa//lNg=;
	b=rxhNfQbXbPtCar66JCSiqiLmSRZVkLS3Ft259t9q1vtU4TuQCWd9vMVgeI8GG0oeT5
	HQ+30RApmQXrGIfs9ur8v9ukhmVqQ0PPBT8G0mIOxtrMlOqzTreqei2Vs5hEwQfHo8uG
	SgCD1RKka32iDGMVNu2U49LIzheXRIzGaSt0+vY0UUxHxTBRp4zzJstcJqkfVQc2fxZY
	BPlPDPrcTDDB46VIVUw3kxj+UxkT4udA35Ge7VVUeNMlBLxY/bnBN8ABddWSZli3Ch9o
	U0FAXWMdTl5wUBv1cI0sjWPNzuQVHRMCZNV6agtbBBvtpJt6WwsPDKblsX040tGjjy4A
	ozgA==
X-Gm-Message-State: AHPjjUgvD0svF1H6SdU19BsAuMhiwWH/9RKDe433H61TXl1spCq1sZUp
	2SGOff6hPLIO4LTT
X-Google-Smtp-Source: ADKCNb4Z1DeDhcMp8JiwyYv3RaWDP9kz/cOPXDiU0cggzuGrxH6lZJblarFg5ASRbadHSaCoEBC6rA==
X-Received: by 10.84.129.226 with SMTP id b89mr5037790plb.6.1504912953139;
	Fri, 08 Sep 2017 16:22:33 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:48 -0700
Message-Id: <1504912911-23120-13-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 12/15] libproxy: update SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:32 -0000

Google Code has been shut down so libproxy tarball needs to be
fetched from elsewhere.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index aecb7b5..acfe8e5 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "gconf glib-2.0"
 
-SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/libproxy-${PV}.zip \
           "
 
 SRC_URI[md5sum] = "06be230b8b612e64997f8f15af6373aa"
-- 
1.9.1


