Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA136FEFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 16:32:51 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id c55so39286760wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lXE+M1qC8F7V04/Gn3LA/K/ttpNdYfwTDjhY72o3Pis=;
	b=FXjGBdK26sJb9ikLHPuRpsEsfCmMSAXjYIbPdFpamGFIuTfmfCm9PUGs0HISRtNxoz
	pbA33izpaSuFlKUy84uQK98va9UUCWFUq1lAFIUufXKX8X1RJztqJO3kiy2q/0BeFf96
	yqI+LfH1foVn+d5PgFh7YX17pWlPAIMXutQE0fkIIeLkmL4qH2StR50HIGKcm5c+vJct
	Cr7aO5Rtb5u4FDP2ro1EtXITODVSEJ7KBRutRljrYQTLBzY1gJuE4pbGIvHFhuYBAYM3
	JgQJWhrIOeBMJj9YKz7ZzHjYTsOxGVjviOh+6XCThcyIgz0z/szLntE+kdufxVVNDNeD
	lLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lXE+M1qC8F7V04/Gn3LA/K/ttpNdYfwTDjhY72o3Pis=;
	b=CmSyEglsiR3ZpgX5jdO2GZEr8RQ31HakcSBCqXmxUbpZ8xuD6Djgemmq3JXsVt9xwh
	w6zYlC/2Fzb+LzUNoTysNtvTnuew/bFbn4qShmUMkLD1Y2RZziS4IU/17TtYGTRrjzMA
	bSkp3l0dvuJPetam6ZQ01NpjBobUmeWrJOJQlChG/rINjqUYnEFjMpstWQyvSxfP3Z+i
	EqU6nF6FJnL4XCsaJ8ynB+5oLPDVfQ6hwxZi4Mf6FBxjR69s5XzjxlLS4TxfdSgt+gMy
	vLQuEGiGq7JyqiLA1y23LTTENGjdPcW77mZsIVIiOXQqvHxYBOX1M50WiyNmhN0lpigG
	OgIQ==
X-Gm-Message-State: AN3rC/6ir2vb5bqECRS4rOrKaoLaqlSLfEmFG42wTjMQrKb+PhS6LEso
	2GljAVbhyjRi6okCY6A=
X-Received: by 10.223.141.214 with SMTP id o80mr8507679wrb.110.1492705972247; 
	Thu, 20 Apr 2017 09:32:52 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	n45sm8153445wrn.30.2017.04.20.09.32.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Apr 2017 09:32:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 17:32:49 +0100
Message-Id: <1492705969-11666-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] Revert "logrotate: set downloadfilename"
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
X-List-Received-Date: Thu, 20 Apr 2017 16:32:52 -0000

Sadly this breaks previous OE releases as it means the source mirror contains a
tarball with the same name but different checksums as was previously available.

This reverts commit 99c6e89db193d572e845f95eabbd9ec89c3508c7.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index 3773170..c938d9f 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/${BPN}-r3-9-1"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz;downloadfilename=${BP}.tar.gz\
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz \
            file://act-as-mv-when-rotate.patch \
            file://update-the-manual.patch \
            file://disable-check-different-filesystems.patch \
-- 
2.8.1


