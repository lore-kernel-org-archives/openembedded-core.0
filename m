Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5988A7F83B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 16:11:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l7so24531625wrp.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9tUMMZQtw9NWI22gfLQi1giZg6Nxt84AUhY2fq/2Sc8=;
	b=YNnREhae97QmdEbd/IGLpnCUVawXArdFJnzvm1S2KW27nMgNKSY+XEi1MwhSov2X50
	RDpfTy8xAlUuNRJcR1JChUteVAqvdZ48dNN2sE8noSsND1kKafMV/ftU5z2h4qdFIPGB
	IELV9WT3BqOyHl5uCSmQCjxUaRbMn/BJpW1GjeE/+6vP7yLz+eLCWz0lYR6tpB//KPHY
	g2ZTbAAkJeW+TGgeNGpborqTkKDwjiMPRamPO0Jq+eBQa18lnjU75Ns8AOES60Y3LVjF
	FBh2zPpP+bYbu2eD+iYyC5aSPlW0Eu0nSAKsmji+9ikgMXT3TMxwjMgYuO3u0W0hBov7
	T5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9tUMMZQtw9NWI22gfLQi1giZg6Nxt84AUhY2fq/2Sc8=;
	b=SrZssYcwWYiLe3UuXnpmFGQNUgcescNyii10MgO0dLYxq3/k/+0PX1dqRu98uH0HVr
	rnNqvdbbwrCZmpVKe6+9Ht9CCKKMDnczXTKdfL1/J8ZcvNXs7Ze1S3go7LDIj166hSVK
	DFt3xV9uNxE83vAVHy3xFcrxJry78msVht5C1WppXXBZq+0pcyGFdbOpIihut5EWwAa+
	n0cvvywHja8IJMQGQ7kWf8IYDMmT5F3Cs09SiLlkwc08gkVHvOAVyla4zUR3PwetLKgd
	HCFr11oBx4mzsflFNmyyLHCqMQLeDcM/JzOojwR2VIUe2Z1yTKVIPVjAaNAsZ71YKIPL
	P0jQ==
X-Gm-Message-State: APjAAAUhqUpqbshudKUpvTwPRmxsNfY3ozgJCf5uDQVzZwip/c+f8H+w
	v7RHZBoyIiL4mHVDb51BN7aVyw8QJ2Q=
X-Google-Smtp-Source: APXvYqy3gUW7Xei2mx8aeWDDPF4SHfN9nFly/kCp1tg74VvDmYMLEtwzSZwHhcFzx6eXki+RfBh7xQ==
X-Received: by 2002:a5d:458d:: with SMTP id p13mr38004433wrq.181.1574179910676;
	Tue, 19 Nov 2019 08:11:50 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z14sm27127315wrl.60.2019.11.19.08.11.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 08:11:50 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 16:11:12 +0000
Message-Id: <20191119161111.6539-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-importlib-metadata: revert RDEPEND python3-misc only for target and nativesdk"
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
X-List-Received-Date: Tue, 19 Nov 2019 16:11:50 -0000
Content-Transfer-Encoding: 8bit

This commit: fcda3fb1a3fbfac075325482074898dfb7138da7
  python3-importlib-metadata: RDEPEND python3-misc only for target and nativesdk

Was actually mascherading an error in the python3 recipe
(missing RPROVIDES for python3-misc-native) that has been fixed in commit

python3: add python3-misc-native to RPROVIDES

in oe-core.

Revert it to restore the previous state of the recipe.

(also this commit was introducing an error:
  += with class target was overriding the RDEPENDS for every target instead
  of appending to it. the right patch would have been:

  RDEPENDS_${PN}_append_class-target = " python3-misc"
  RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
)

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../recipes-devtools/python/python3-importlib-metadata_0.23.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
index 851d703c9..4c53d5fbb 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
@@ -1,5 +1,4 @@
 inherit pypi setuptools3
 require python-importlib-metadata.inc
 
-RDEPENDS_${PN}_class-target += "python3-misc"
-RDEPENDS_${PN}_class-nativesdk += "python3-misc"
+RDEPENDS_${PN} += "python3-misc"
-- 
2.20.1


