Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id C87627D39B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 13:53:10 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g24so6017356wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 06:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cUw7Eg5mW9DFobUIXpCQ2oaCKv50pSwSPOiPpEFPjyo=;
	b=hYa14t8KQS3u0Rgyh+Qtxbv8wF2cyYyYmbLHpa4SybSV+xRMTJwF0YGCHqpkTBo92U
	y+JIvlPsXd9uycePDRu9uFOJWRVP0ncz4mo/gT8+KIsVUIgWnRMDGJQtF7mhB4Anwa+p
	Md/AgxG5cQa8LIg2nW56W/dI7DrVGEl5Pa0klpfheqOyYyyrg2PuIZ6YAmcbJm5QdNAW
	GmVrXSZJX5ELDG+Lsj1oj5LhNJc9w/goG1rJ3szIsHZDMrjHzndaOtIGZEruvFRQ/2tq
	myyNNtbCYgFUCq2E6+EPP6g+LAJx1f4a4iSbIIsCE/L6GTZYyX1b1ZQ5N/YmQdhNtsul
	wZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cUw7Eg5mW9DFobUIXpCQ2oaCKv50pSwSPOiPpEFPjyo=;
	b=gGIbZdoJi3v48PZ5hIHpjg8UgI8Hk6aTbIZyQl41F3rx0Yc/XAveNFo1TeaibMHVPK
	K3sRyzwNdyiGUUA9/A1nb3KqLnhiwo6YU7fw4wqBiH1U+KdzaZTvYEZHsq0ayG5rYpF5
	Xz+x2LM4a640RdPG4Y9q+7n5Mgggyc/N9x1ND/tAs/qDdNEBeCO4ihvnHxIY8F/n3xe6
	g9YNaNLPVDMN4Ir2/riIsfstVFJmN7dUhIEh3jzd9GmOJYtmdEleUcuFVHHZHKe7Rw8i
	2nHN8lrLdt6uJ9WTLOr7Gi6wByHIBGwxOpYrDsnj5f+p6Bhrz/nSPGhn8YE8ghd0vb4M
	GDAQ==
X-Gm-Message-State: APjAAAWwywGNu0EkXKIQgXbe+h3wxdgwSaZVEfAnwSeXpbadqLoynEy1
	TKom8ISAbbpOC7Ls/LY5Kl6LT+l96LI=
X-Google-Smtp-Source: APXvYqzj4dhnyCnqtYkRgro1RHC7xFi+MmvUeDn7GdGOqxJgJtImSBw96dD4sqUXFqRGR9ccFf4mKg==
X-Received: by 2002:a1c:9a88:: with SMTP id c130mr5485051wme.164.1572529991116;
	Thu, 31 Oct 2019 06:53:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	w22sm3602712wmc.16.2019.10.31.06.53.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 06:53:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 14:53:04 +0100
Message-Id: <20191031135305.53420-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] nfs-utils: do not depend on bash unnecessarily
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
X-List-Received-Date: Thu, 31 Oct 2019 13:53:11 -0000

Nothing in the target install actually needs it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
index 7e80354e4e7..eb32bccb57c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
 DEPENDS = "libcap libevent util-linux sqlite3 libtirpc"
-RDEPENDS_${PN} = "${PN}-client bash"
+RDEPENDS_${PN} = "${PN}-client"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 inherit useradd
-- 
2.17.1


