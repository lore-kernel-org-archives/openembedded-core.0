Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB8C67D3AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 16:28:09 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id f1so15075296lfl.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uELsWBOSpo6ZbP+pE8Ex85RVLSlSyrJlMpO2hMVdGtQ=;
	b=tJ74FFN5J4olxtcOh8iaLPhLrUCRdDqOukIUEjL5+D5ySAm4mN0SRk8+fdPqk6GbRT
	i8kuX2AiYWJWLE+F4+URa9QVO6U5NqG+O2eaLuMICbt5AtHIe98ym4HKH4nh4kzMlA+D
	fWxYV0/JjZezrr3d0cLY2tPAMKrX9xnTjm3jOvMln4WPRPfGi2tHDNEdOs39MW+NLLgC
	rfKNTt3rUyM8asQHYwugv3OxdzGJ/EnYQL0PRsQ3t1NDfIujOj0ZyKxgvKXlsekmRvJ6
	2B64deRfHJ8C2yRSF2lmH46uD60pAnUYvKUQ2AaNl8/gXSNtkSuT5d7h11uTXwJ19/V9
	12gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uELsWBOSpo6ZbP+pE8Ex85RVLSlSyrJlMpO2hMVdGtQ=;
	b=Cp7BZOR9sEwMnkL7NfNfl/dIbrrI1EQsHhklJmcA9XQw1jBrpTcNi4SIefSjACF+NI
	45ngb0+MhftPK+jEgTLkN44Lk2XCGRgs39S4udsg6Lk7K91FI8zj/JccwNo7cNxocz5o
	3DPhs3P+VvcLZsz0RhCeVarldSmn6N8bpHX4PV9uWvhm4O8O5tBvQUkl8tFcJRhtI3Sr
	i6qYHMYkQk+4XNfJmPMjLBRT4WJmZRuy+HGm+X0gvT+J10xDJCGDKKL0zPkeOwDZZ1Y8
	QoMM4B0HT/RckQ+7yy6DgR0hmEBXjpdoOPzmFsc3SJ9WnLwJKLiO4CFncXrwdm8XEsTF
	nANg==
X-Gm-Message-State: APjAAAW7A/JTk2rltu3CR28wiCl4A2fczBoiLv+IVZAKXq1IqP/Ugdba
	JzA9d77lK2WZgGlSrLK2QC8TnqnHt/w=
X-Google-Smtp-Source: APXvYqydNfLgmnaVS26oc2OCkqm4kLJ6nh4iyV+Gka7HGEGOH/00aXf79IoErZsc3YWJbtN34Av6Pw==
X-Received: by 2002:a19:2981:: with SMTP id
	p123mr11600243lfp.190.1559060890103; 
	Tue, 28 May 2019 09:28:10 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d5sm3026005ljl.59.2019.05.28.09.28.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 09:28:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 18:28:07 +0200
Message-Id: <20190528162807.19314-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] p11-kit: update to 0.23.16.1
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
X-List-Received-Date: Tue, 28 May 2019 16:28:10 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../p11-kit/{p11-kit_0.23.15.bb => p11-kit_0.23.16.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.15.bb => p11-kit_0.23.16.1.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.15.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.15.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
index 59e675b542..54455da1bb 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.15.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "libtasn1 libffi"
 SRC_URI = "git://github.com/p11-glue/p11-kit \
            file://0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch \
            "
-SRCREV = "1ba80c67c492f25581ed97c8c31ffb5f20636d06"
+SRCREV = "c689917b393379d288b868f70b2f7b7f6aafe430"
 S = "${WORKDIR}/git"
 
 AUTOTOOLS_AUXDIR = "${S}/build/litter"
-- 
2.17.1


