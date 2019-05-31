Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 29FE77E5BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 16:03:49 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x4so6885190wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zFTAy1W1g5PDSAofO2GEN7uZS0zNNmTyxYD92Pg3UPc=;
	b=eA3NZl4oqgMbyECqPjlpX0Weg6kvvmjP+MbEuyRmrOpxCewiG1CTI+2MBC9/JQX03h
	X9Ut2dtfOwInAp2bdXbBYBC5S9ug1gmSqJGCo8wwiREfCWizv42qXOQOjKev1/Ax2Fif
	n4uBQc8ZlJzfkPiKUjF7ZrY9x6vBQe5Ni/KBRRVSOmPLKkhHnGvZQw8xv6GLexmhL1BA
	Dc/oUuzwwO4NpAAJHL4vvzqOvXeaNYrFmnyKOIefpEwpC0zLCoXnf6yLYbhjLMg9jZVt
	ZC3CeWmdPGAEHpp6f3Fk9wqWgFtiaw7EcGHvsTNwtQ6Q0VxKbSJA8D77mPrYGcRyCYE+
	L6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zFTAy1W1g5PDSAofO2GEN7uZS0zNNmTyxYD92Pg3UPc=;
	b=luxX0SXCWTXJ7ogMDBicOQlVMnZGwF2/OkOs7iD+XldBlOvOEt9HrsM06PNmnpApf8
	CQZ3UXuTSVUmwNzpkOh6vxdedDAqQzU0CZmqWtw49cuGwjPi3LXwWbj4sdEe6Ck2ad46
	EzwIezzrXsI6zziq2fRZH8fN2uFHORY5O5NFhxCKYEKyzEvvlJybSnhXHpaJlvEliCKG
	/Uby6DaFx8aWWrztTbgQjRVxN+VDLAFtTztZFb/FO2bgwNbNBbbfddEFHcThP+T9t8iS
	o59hwdiAc4TupYmSAPvWdZTIj0QyikG9c/jrVUDBv5J0CKWKfJGTeU9V1KB3I7tLLyxa
	VINQ==
X-Gm-Message-State: APjAAAWZTP/OZgidJ7IbMGbzZJHVEzhDpkMPzpSqKlc4ws0eBVvm5cTN
	qK5XkZSM8tuuqsDM7NjQGNOyJzSaFvZGBA==
X-Google-Smtp-Source: APXvYqwtlYB8OIiKE3gUmmlmwQeHstS9lt10e2hSXIHVOyg+8E2cDYxJ2CTNEofABD7FqNJqOU2KrA==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr7290468wrw.345.1559318629644; 
	Fri, 31 May 2019 09:03:49 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	p13sm5391218wmb.23.2019.05.31.09.03.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 09:03:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 18:03:43 +0200
Message-Id: <20190531160343.76201-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] mesa: fix upstream version check
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
X-List-Received-Date: Fri, 31 May 2019 16:03:49 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa_19.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa_19.0.3.bb b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
index 001c2f41237..a5643636801 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/mesa.git;protocol=https;branch=${@v
 SRCREV = "c8cdee5dc3c6f9856ee73aed2b47cee77d675022"
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
+
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
-- 
2.17.1


