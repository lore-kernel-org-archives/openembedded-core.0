Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38087.1793174830191187694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 01:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=C8CkflIU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5BE21C4FECD
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:08:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8339460769
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:07:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A12001032906B;
	Wed, 28 Oct 2026 09:07:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2z1zlt25TGME1om+tMfShCT8dLXsxdMcqzm28ZKHGC8=;
	b=C8CkflIUcTOYUc8kpO+C86wVbXsbYAKYR+URJ22b/VHH/ltHQ4ZtLQS3LB/EQOnW9OWGbu
	p3/X0eSYcD8AypCxbhVBruOUU8ysy2MWwSPGAyzLHnaU0XWWJIgoqXcm5lPO01BgVxpaJS
	Gunk8e3mNkUiBk+7M3YOw05DFA3S7mWtxaCkOtH9wqWF002EyJ+RzzeXEcvyjRPvGEIbOS
	YVcOu+5VwA+MEvlluL1ZirYhRow0Ug5u/ih7TTLo8VyDVAimIWpsGBdzYQX5IGuZZs36TQ
	4gv4Z32rL9G2/r7db9UIY+7tZcc2QTlEw/UIwOx5cmrNoTPDO5/M0AHoHWwblw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:07:00 +0100
Subject: [PATCH 2/3] python3-sphinx-tags: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-sphinx-tags-v1-2-65bf95b5f2d8@bootlin.com>
References: <20261028-sphinx-tags-v1-0-65bf95b5f2d8@bootlin.com>
In-Reply-To: <20261028-sphinx-tags-v1-0-65bf95b5f2d8@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xSKFlaBk2sRWcePC3QgkJHPtLVytmqqpW4YvuplCsaM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4a0kKnEZSOqe5AsjLrnoo1gou4ftmV43l4gk/
 dUp2rGKDf2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGtJAAKCRDRgEFAKaOo
 NqlxEACO1MyBBnowRq7NIfJgIC2TZgLKjzAiinSpjkjNPwK9f6XTI+Xxct0lbXqcDpJlKqKFQTz
 f0tzbzcseJuzqNF+3drK5b+85gG3Fct5BrRpH+PUacuggfq6ttg4YqCUADKV2MLJlW+QtrtdVB2
 Ob3tkwKAw2b/sglOTTsz1MxGAINWQe2YZjItD6E1SK63Lul8m+tmJOZCdyuboVG/28pun72JcAt
 CuzDqWyOoeW6hnrQGLjoUpe4Vh5rh576K7B5aI2rZfw4Q+57foRsITKRrTZl7+ibS0Jm3Ul3qBZ
 RKnk8OTz+k8kEXuj/1jkGZcZEZ6qNdcDL5zuRRolot2HlTQ4vtC9GAsnZH7IpIEAgkBCIUh1/0L
 ji5Zqrzr6rrIJZaWFb3FSsXDE2Bj2mpOf0OuNb2VkHWQFLVG5dxJ60UJT50Di8ww3e9NNkFu3PW
 ktpx51PJmXDItQTzSE4fYNw1fG/BW2RXG7vuusb3ZViKwrqldGk9yE32w9o/dJrlWtJaEU/JNLS
 OrSJRumMZfJnkIW8LtSwx8K9jsXsa5c3s26K+uvAKozaemEv2BXlKHABAVn673uHNUdsC4K4Lih
 byWzU1bRZgLWlus/ODrJuuqiTJJFPr52bfN3bMw4PqP2zy6bWoZESjw/jR4mRCZA0CQEe9G5Hs7
 CSmTciXjgZf9Cnw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248795

The python3-sphinx-tags recipe will be used in the Yocto Project
documentation with of purpose of categorizing documents with tags.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc                |  1 +
 meta/recipes-devtools/python/python3-sphinx-tags_0.4.bb | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6e37eb1095..bac12e4ec0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -733,6 +733,7 @@ RECIPE_MAINTAINER:pn-python3-sphinx-argparse = "Antonin Godard <antonin.godard@b
 RECIPE_MAINTAINER:pn-python3-sphinx-copybutton = "Antonin Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-design = "Antonin Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-sphinx-tags = "Antonin Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-htmlhelp = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-sphinx-tags_0.4.bb b/meta/recipes-devtools/python/python3-sphinx-tags_0.4.bb
new file mode 100644
index 0000000000..fad627e64d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinx-tags_0.4.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A tiny Sphinx extension that implements blog-style tags for documentation"
+HOMEPAGE = "https://sphinx-tags.readthedocs.io/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05c148fce9144d129e885beada2a6c94"
+
+SRC_URI[sha256sum] = "3065219bacf47567c706f2237d5665b22f3a5167367b4c4568bcda4371a5359d"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += "python3-sphinx-design"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.55.0

