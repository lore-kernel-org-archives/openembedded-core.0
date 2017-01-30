Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3599B77240
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:47:55 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id 3so40543877pgj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=61aEQxtlaXloQ65BxbIJ8njR8YjMI6i+oDK8Ah7odAE=;
	b=RggAHJzChslNan4zOeGRSnDcOQ+Mh7z2FbZo8eC+Oa5kH3Tp+mdgeFNayJG3kAGlGV
	KH9JkL73gGp5zVXCAPh9/J//+21dSMAkZ3sM5L8TeUIu/MAUzc4x3AOsbGFejrkHt5mi
	9GSoxWk3rMvcOUyCKyCYcgDjEieWsPRY0ow4duoQBMESdYaYPrEkzF8ELShu7x/mx7oD
	R7TLUPFzCECOYKalKMcq1NcPdScsIdSNT8rG3PtQ2i17+BSCZ62ef5EjU7u7s3v8E8Ga
	Y4y8/aaPE/x21gmNjGkCBxMgM1PK4TPSTdk1U2yU7GLvPLpp7uZ67qpQRvOM1A+S6Aks
	APHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=61aEQxtlaXloQ65BxbIJ8njR8YjMI6i+oDK8Ah7odAE=;
	b=QXFUvSALJojZJx4C2MawL0orahnxm+CFPA0I3ytPydfxzAG1kmARJE4pvoYkRWVZs5
	JCJ6rnfDE1MfakVBSapv5N9uxepsBC5r28UHICLbE62a2oQTrDUzVcRSOxYVyF0hvNPe
	6bwt9q3u2ScGRtN9ifC6Ha1RVnyAsbk6Uk5AG4KpH+tM+n4QsP3bc8Vy5amYJO2Wk0E/
	vPj1pVALStL6y74O2GDy9f16PAz5NN80crrxEM3HIxWmTrcYlgzgXOHvXRu19oM71T5v
	v5AT3nehB0P1TjxO9698D4TASR8aKDFtEbqNjNjh9c44zFjTbQ/l58njcs9ZDDi0DX8J
	A13g==
X-Gm-Message-State: AIkVDXJ4WyiFMPgMg+6h0M1YwUyXm77egH5gbdJ2TpcqlPl9igj8gJoTWPxwraYc6qQ28g==
X-Received: by 10.84.218.133 with SMTP id r5mr29705880pli.90.1485762476498;
	Sun, 29 Jan 2017 23:47:56 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	w25sm29741383pge.9.2017.01.29.23.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:47:55 -0800 (PST)
Date: Mon, 30 Jan 2017 17:47:45 +1000
Message-Id: <20170130074745.584-1-nathan@nathanrossi.com>
In-Reply-To: <20170130074745.584-0-nathan@nathanrossi.com>
References: <20170130074745.584-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 1/4] libgpg-error_1.25.bb: Enable nativesdk
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
X-List-Received-Date: Mon, 30 Jan 2017 07:47:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Enable nativesdk on this recipe.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
index 9d402ffbb6..d4ce224948 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
@@ -51,4 +51,4 @@ do_install_append() {
 
 FILES_${PN}-dev += "${bindir}/gpg-error"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


