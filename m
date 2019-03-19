Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id EAC126BF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:28:10 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id z25so22772068qti.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=2I/c/+4lDZFKNTZUpvoErHdTsOSRYDyKfewvZjkomxU=;
	b=k/8uIgFhE30x7CfbpM8915A+hvd990DWuhbnwgWUARXb4yuubkCFjgSo6GdxhDlRvx
	lYhU3HZpWU/mDZdFb4jqBXIOzQEgW3g6KucbD8SPS3OMlpcpQJTwJfzpi59LYtjEGgNF
	/Whgv04cqIL9DfCxE4crU7cLf3U7bmGa4i0rYgnKNq1mHpVt/QESlmI6bWTpf2WCuti3
	kUKqAfNXzXLXPeTaGZEXtrBIqOlKEtTA+OEOS69SJ43w1anhPxd2cWQRZ/Z+xtXDXIY/
	JXTMvAVdTsvl5+am7GBe7UyuDwXQASVSgNKiNCYydeTYWF2ggtud+v0Gxt2yj3gmqLj7
	Nseg==
X-Gm-Message-State: APjAAAVERy6T0hQPUb506qvEc0lOVXwXljKoUR5EqpVRKG+AJ3RyQNmx
	/tvHpl1zws7OI89VfQrhWMYSxyH7
X-Google-Smtp-Source: APXvYqz/jfAA/f1xQ6TKCbMskSjMjWhlnNxpbe4uMZ3frjaNyzvuxoktJ11C0qTOBT0Fe9S4nphHDg==
X-Received: by 2002:ac8:6155:: with SMTP id d21mr2837803qtm.386.1553012891585; 
	Tue, 19 Mar 2019 09:28:11 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id l2sm921612qtc.47.2019.03.19.09.28.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 09:28:10 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Mar 2019 13:28:05 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 13:28:04 -0300
Message-Id: <20190319162804.21011-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] openssl10: Upgrade 1.0.2q -> 1.0.2r
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
X-List-Received-Date: Tue, 19 Mar 2019 16:28:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../openssl/{openssl10_1.0.2q.bb => openssl10_1.0.2r.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl10_1.0.2q.bb => openssl10_1.0.2r.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
rename to meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
index eacdf8b86e..87df4f517a 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
@@ -53,8 +53,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "7563e1ce046cb21948eeb6ba1a0eb71c"
-SRC_URI[sha256sum] = "5744cfcbcec2b1b48629f7354203bc1e5e9b5466998bbccc5b5fcde3b18eb684"
+SRC_URI[md5sum] = "0d2baaf04c56d542f6cc757b9c2a2aac"
+SRC_URI[sha256sum] = "ae51d08bba8a83958e894946f15303ff894d75c2b8bbd44a852b64e3fe11d0d6"
 
 S = "${WORKDIR}/openssl-${PV}"
 
-- 
2.21.0


