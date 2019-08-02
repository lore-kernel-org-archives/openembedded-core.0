Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 683427F2B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:22:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id p17so77567208wrf.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0JCQCGzkyRNN8/d1NDc659nNauNnjmyWLK6BUnrau2g=;
	b=gLAKU2p7CiJ/BvC0tuNPv05M0T78eDI0xwIevSkpw0oxlDzGcE68hmSNYcDQPE52eC
	3YmDRa1mVz7Z7KZf8B9h1O8TNqOwdszpgV8QJNUBmpYgPM4KmLkQNP7qrvLm1sEfKfhz
	dOjYOdhdLIsgX+fR70O/Op1Wl3Ryvyv33hZfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0JCQCGzkyRNN8/d1NDc659nNauNnjmyWLK6BUnrau2g=;
	b=tG9awn9eewo8mLtmWrZejPHQgoVTm0aUuWm40lvrqufvzZzT0jNgFp115/vJXNNdZJ
	gvLVWFuGmz+mNCDBZXp3iyvGCez7ipG0tMXpndRdKLclEkFoaRjpRHxKnEbyuMrMwqtJ
	0QmgpNntRM64cnO8uRD9fcEj0vWLxYnE9PUljtr4MSSQjz3deub2xBlJKfxyzNGMM7wn
	NjvUD1zaClXD61dmgTWYeE+8GCV1CiBBhmjivhOZ7di3IOx8utWRTSU5ISWSKdtDHwHq
	W4jKPVXg+QbaSeCZeAGQFP1r3dg76VLUHaenHS+jXnz07Fm5MgGYkemtU8J8afr0k+vy
	yb2Q==
X-Gm-Message-State: APjAAAX6RPUXeS3x1ulRTMiUB7Z1XRORsi7qfRnukOX3IKRdlDLDd4xI
	3jjrW7b1OUR9TOG6P5RkE6UzZBzsFfw=
X-Google-Smtp-Source: APXvYqycZCtMfO9sgZSgZqJBqxU7hJ4y0Yp0WP2EOblqM9I8zNGbbN0e+Pa4o2OcFx8c0OuF/nsRXw==
X-Received: by 2002:a5d:4284:: with SMTP id k4mr142421486wrq.194.1564759341863;
	Fri, 02 Aug 2019 08:22:21 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r4sm46734991wrq.82.2019.08.02.08.22.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:22:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 16:22:13 +0100
Message-Id: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/8] sanity.conf: Require bitbake 1.43.1
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
X-List-Received-Date: Fri, 02 Aug 2019 15:22:21 -0000
Content-Transfer-Encoding: 8bit

We depend on a number of bitbake API changes, bump the min bitbake
version requirement.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 45e67525182..92e1886990f 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.39.1"
+BB_MIN_VERSION = "1.43.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.20.1


