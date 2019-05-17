Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 149327E034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y3so7781777wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4FQD9lmprEllL1iDkIXd0V6rcKjHcSjA5v5WJ2rmdCs=;
	b=fvOwtiTkEcOWbMf+N4KNUSQcEWnIGspckB2asr40xlyb4oN1ivcuBeNwcM01rgPKp4
	L5/rrtIAY0N6bU5cup+iBBJl/LPHicJQkaZVD8KY67ssia91Xl/dIfj8VGuyjCCI1D2Z
	lhME5rPR87rnb9IywfPYb7TFktcUrUWBQJvUJWKXdQB36hqXt3MoUewxUFUSpQQfQb3e
	bfID5CotF2xnzNluGg6gYYoBhRwDQl9uMzoMTJoPyN/taqGwkiRxVEJzknmhfLR6qbHD
	FHpnbj1mVfBq4qxgNq6ZY+CEEgGs6C9dPjbjGJJE6XUUd2x6i0rVdaKE6tTh193WO+vV
	+d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4FQD9lmprEllL1iDkIXd0V6rcKjHcSjA5v5WJ2rmdCs=;
	b=irdJE3kOVInrQbIixMs1QrOdlt0xqyER83/WupSEPyfriTLfaq2oaN8e2X4C+3o6os
	x4Y38QEJYvCVYxQ6Ku98wIFjBZij16ttn1gTgCVZwzGnyqy2BmIBWCLlOa5zy7cpL9WW
	G59XUBuPNTqK5Auz+rGVMFUr8nUcR+Px41DJYYVFkoykjW+acW0qm0dRkPDb+qoQ+dI9
	1iuWHO1i+ZHQEU8qR/kUuYtJBXNANCMTZQgFSxLh7BA0xFqwXU343dWC8Ec29CJ+yKAs
	l4IvQbFL1QTh6zf7le8OrtlDiHrU+guWACCjtOMwACdxfo5DaPFt8xGbfhKigGbi3go4
	V+ww==
X-Gm-Message-State: APjAAAUiCilY2ba4X+5IBsMdzrCsawbF1iNKNihUiDc8oISHppKqPQfW
	KNOpSEobXtqV305eVbiz/sSpAu61
X-Google-Smtp-Source: APXvYqw3vDc8dzloD8BcmLw0Ds/Kv50kj7G+VdGrrtNXS/LEigySsrhl1N0qLxCmyIzwMdWJRlUkgw==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr125949wmh.0.1558116747762;
	Fri, 17 May 2019 11:12:27 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:48 +0200
Message-Id: <20190517181151.44001-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 34/37] acpica: upgrade 20190405 -> 20190509
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
X-List-Received-Date: Fri, 17 May 2019 18:12:27 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20190405.bb => acpica_20190509.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20190405.bb => acpica_20190509.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20190405.bb b/meta/recipes-extended/acpica/acpica_20190509.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20190405.bb
rename to meta/recipes-extended/acpica/acpica_20190509.bb
index 25ad7ce31c9..cf6db336a6f 100644
--- a/meta/recipes-extended/acpica/acpica_20190405.bb
+++ b/meta/recipes-extended/acpica/acpica_20190509.bb
@@ -17,8 +17,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "bison flex bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
-SRC_URI[md5sum] = "9ee30c8ff3012e213bc3b21a9d632215"
-SRC_URI[sha256sum] = "7e144fd011c23a0a10be0b0d7448c527a4c0f621f1f835a271636e448bc96643"
+SRC_URI[md5sum] = "dd1f8240f924b12b0a0de0c31ab26ab1"
+SRC_URI[sha256sum] = "860b5f94a0590b278592acf16a4556b05ff0309c08e8c48aa29827cfa02c8e9d"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
-- 
2.17.1


