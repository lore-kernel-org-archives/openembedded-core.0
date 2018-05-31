Return-Path: <nick83ola@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 04C3174F37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 17:34:44 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id z6-v6so2502780wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 10:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=M0Mk1uPWK15eM+NrIvcabNCBXIngBF7MYTokeVJJAu8=;
	b=fHPlHV0BKijOAmxpmDSKGs4ip/UXbTLlM1bVO7xDHoaPPt6BVVtbp7rJZhPO9RuHh7
	slzBncdVNnXn0P5LwIkiUNjzRGi7p+PKMTzJiCrJeTXg63iZala8ZVRJ6/N9vzIIZLH4
	RgcBNBQG/4toEvnDqqL2tRh/tMDeWNmcbSequjX2VlcSKgiciHa2WsUZuUNjMsCiumLC
	0JNpcGUOhg5bijPE7Jqs0M5qui19UVPvs7gfcbPzaDy+oMmZ3TJYRUgoAvDtTs+boEP6
	wLcQuMBFM7VtCBnO76LRZ9EcIMNcZcsL7Y7TlZbPf64W61G85xUeZ5ryHD9CXfHjyPsm
	HvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=M0Mk1uPWK15eM+NrIvcabNCBXIngBF7MYTokeVJJAu8=;
	b=Ksz62Gb0QiHq/JjnGs/J7Rj/MmOo7YQxGrnrPj74UsBghEdDYJ+GGb0K7BUe/8lrAs
	IDiaMu+MRvs9UKVFWN50MMBgmJtVRe+hclY/O15EcGN3iBeI4nKwoFHoz6UQZw3WeuSQ
	iLpkQTlRMa36Vq2LG3aVrYzHw0pm8AjJ7Kv9UZ021u7D2uzEPjSTBTjwCyMVdI7N8bKg
	Ef2+Y+NoK7H0xPRpEHzhXu91ph6AEZrbFbaBVAHHl5IvlYnd98+FORNBKeph1rS8xZI5
	b21tM/7LN9Qi9o8xyjBB1wY4CyxKk6P6wZjAVonPlUUDeR3sAKEcntwFSBBPCWu3C/Eo
	DulQ==
X-Gm-Message-State: ALKqPwfs+AgNBagZSeYraafP3kMS2g0WTYUO61/fui3QSQGIKV4nKPNS
	VS4f2y1ZgaiVt+M8jFvIZJSPnWns
X-Google-Smtp-Source: ADUXVKLI8K3JjXNbBOWneRDz0+cYk7qMcqw1RVoRv06gVWs0nzTFqqCZi2SE2xQxqNY8skiWqBiSAg==
X-Received: by 2002:a50:97e1:: with SMTP id
	f30-v6mr8781184edb.256.1527788085287; 
	Thu, 31 May 2018 10:34:45 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e6-v6sm20268662edr.23.2018.05.31.10.34.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 May 2018 10:34:44 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 18:34:41 +0100
Message-Id: <20180531173441.28785-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] ifupdown: add ifquery link
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
X-List-Received-Date: Thu, 31 May 2018 17:34:45 -0000

in the ifupdown recipe is missing the ifquery link

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.16.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
index e9f3a2aee9..88e41732d9 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
@@ -34,13 +34,15 @@ do_install () {
 
 	install -m 0755 ifup ${D}${base_sbindir}/
 	ln ${D}${base_sbindir}/ifup ${D}${base_sbindir}/ifdown
+	ln ${D}${base_sbindir}/ifup ${D}${base_sbindir}/ifquery
 	install -m 0644 ifup.8 ${D}${mandir}/man8
 	install -m 0644 interfaces.5 ${D}${mandir}/man5
 	cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
 }
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "ifup ifdown"
+ALTERNATIVE_${PN} = "ifup ifdown ifquery"
 
 ALTERNATIVE_LINK_NAME[ifup] = "${base_sbindir}/ifup"
 ALTERNATIVE_LINK_NAME[ifdown] = "${base_sbindir}/ifdown"
+ALTERNATIVE_LINK_NAME[ifquery] = "${base_sbindir}/ifquery"
-- 
2.17.0


