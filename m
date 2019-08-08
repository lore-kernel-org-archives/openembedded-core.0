Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7786E7F301
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 18:07:25 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id z17so1300713ljz.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=htu0o58gVuFn/kD6jCpKqGRZKMtCEYWfqkNsSJRnDMM=;
	b=BapxWp8uoe91vnKOyRUfIvKVzFjDHVmOcqBRNlu+qRlCPshbTf7k/5EyGvOGEICREi
	ZGwn26xpzuict2c8by/9wWLUXvD034MyIbKLJkYxxKWcBkqpNUJnv4iKSyVjI/v5w21K
	WWCQZbPV8cPmcIKJeUCaUPFr3pC3pwRqMYB2P2WcSjZI+XcXdzC7K2O2YHT4/ZB3LjZX
	DXj7Y82UYYfrJoGWue6gkX5MMFjLLab3+DrgXtqxkzG/xzRxJ83SuRtiECh488Tqd+ce
	ZKTskUgDvpV+neWHmYfwkJyuALO4FNyPgYljAYs0In17xXH//qfWBam8ITXmT50Di6T7
	oACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=htu0o58gVuFn/kD6jCpKqGRZKMtCEYWfqkNsSJRnDMM=;
	b=RKuEqA8I4cYLsis8mESSGnc/95DEmPufSP2V2IKgstN3Z0o5C2CaEYg8OfBtY4XFcT
	hEI2tr0cPfeCSdoZNbSsIjI6StBzjFz8now4n451YHYO/StmULa03NILZ7+0WvYvj7Ar
	yuSg21GSVSINU1D8+FFTIzC+ypYsiYdlpeZUizk82uCxni121/uBoBzB3/sIwKl2qkJe
	X840XzMOXBN5MPmS384FDuCRKP5V0l2pq+V1glZ0F657pmYUPdzoarbVdaK3gubvHxEr
	tEjO9p7hztd/vCAZQBki5GukhqPMtSCHX7C5PKAvn+kf95NvjLnFS/l5mjh6h0ke5E3u
	fUFw==
X-Gm-Message-State: APjAAAXT2DT8tbS3Z6I99369BWXLg0SCpBk6EQaBkaxkSOm/Q4wk156u
	x9neewwjRKu23BvN3TgeP80ne2KdnCY=
X-Google-Smtp-Source: APXvYqziYN0WjTdKIHWMZnFXMX/y0ydccko5nNyMQ0c99WJj4nb4yjFkIWnzf/RP60y+LXzSDgfcAQ==
X-Received: by 2002:a2e:980e:: with SMTP id a14mr589656ljj.60.1565287646233;
	Thu, 08 Aug 2019 11:07:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m9sm19288520lfo.45.2019.08.08.11.07.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 11:07:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 20:07:23 +0200
Message-Id: <20190808180723.32382-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] wpa-supplicant: update to 2.9
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
X-List-Received-Date: Thu, 08 Aug 2019 18:07:26 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{wpa-supplicant_2.8.bb => wpa-supplicant_2.9.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.8.bb => wpa-supplicant_2.9.bb} (96%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
similarity index 96%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index bd4167c314..c16978cfe8 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -26,8 +26,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://99_wpa_supplicant \
            file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
           "
-SRC_URI[md5sum] = "0af5998c5d924e985cab16b9a1c77904"
-SRC_URI[sha256sum] = "a689336a12a99151b9de5e25bfccadb88438f4f4438eb8db331cd94346fd3d96"
+SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
+SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
 
 CVE_PRODUCT = "wpa_supplicant"
 
-- 
2.17.1


