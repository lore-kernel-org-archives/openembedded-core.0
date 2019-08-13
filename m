Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id EDF8D60053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:07:53 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id l14so12460901lje.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DsfUbu7Wx01v4poWSs9UOpE84jsWbVVKY3+zBaBA+1I=;
	b=Men3sdYpzBJYtx2KLsmujbkGvv/fUbXnCL/YgXMJuXJwtca3vhRqrqLd3m2z/WWbNR
	OZmuYWNYazmfKPMTp8EqKq4IrtO/nsyNFl/PQe9Z8ozSKRzhhr0U7K8zRvrq7gZL94a+
	1T8usk7AWj1z30c50ttrNLdIO+ORhphfwQeQBgn5/j6psupVu2Rv8XpBU5elP4tb9da7
	z60AWoIlTLkTWSUXJP2WzTT9sfV57sGuv7d8gSnsUUp0fXEQD/kD8MfBu+MSDm3m4Wwn
	vwTSEMEy5eZMR25abhNj5QBukVYJUVhWygJ6cptB2/6XJcKNzVvHFVn4btU2C0vRDYs9
	s79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DsfUbu7Wx01v4poWSs9UOpE84jsWbVVKY3+zBaBA+1I=;
	b=psKxHrt8wt5O0kZKz+WSPBc7ikAVKgOt2P4j4Aa/emQ7r0yq9RSW2Nlfkt1vQ+QN/o
	xTFBf+yr2WnJLYCwX45lzMGPY9uBDE6Xhj9GUnPXNZ0is5GBh1qXmVDAxaed8MHgEzdX
	y08Qm1pCc99EQ2PRvvMAdA9GDF5G3BP72KyrmRs+EOb99ocnrGkhwe5VtUf7onSCQk94
	J43XhT+UHyw2NAYgWBG9O73Q7yrXxb8v23ShqZXWU7xAL+phHCze7KzITwMJ95S1NPYx
	J7J10ia15Jpph7pprlHn15hOSVw5NOcNmcEb2dG1h+v2XObN4UnKZCJyWoIWiJ0Btse2
	/1Sg==
X-Gm-Message-State: APjAAAUqkO/PHvhsU0x7lTndc7+kcT/0VznX5BeuBS5BsIn+5M9z14iB
	+V2+eJibsdfbpOqzztf2P99T8E8/4zw=
X-Google-Smtp-Source: APXvYqzl92Sw5U/pesfcuYf0vOUtkcjLRmPrtx1tdZQFJxasnPJo+QHSJUMTZnEi5TEECI5FEOPCGw==
X-Received: by 2002:a2e:93c8:: with SMTP id p8mr22248912ljh.6.1565719673974;
	Tue, 13 Aug 2019 11:07:53 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	s21sm21880480ljm.28.2019.08.13.11.07.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:07:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:07:51 +0200
Message-Id: <20190813180751.18686-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-git: update to 3.0.0
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
X-List-Received-Date: Tue, 13 Aug 2019 18:07:54 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-git_2.1.13.bb => python3-git_3.0.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.1.13.bb => python3-git_3.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-git_2.1.13.bb b/meta/recipes-devtools/python/python3-git_3.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-git_2.1.13.bb
rename to meta/recipes-devtools/python/python3-git_3.0.0.bb
index fd6ba50df5..b6c837cdf3 100644
--- a/meta/recipes-devtools/python/python3-git_2.1.13.bb
+++ b/meta/recipes-devtools/python/python3-git_3.0.0.bb
@@ -12,8 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "1ecc2d27123418e4c9e5602788c96855"
-SRC_URI[sha256sum] = "c15c55ff890cd3a6a8330059e80885410a328f645551b55a91d858bfb3eb2573"
+SRC_URI[md5sum] = "9412ae9665fd29328f2afc6df887ae81"
+SRC_URI[sha256sum] = "629867ebf609cef21bb9d849039e281e25963fb7d714a2f6bacc1ecce4800293"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.17.1


