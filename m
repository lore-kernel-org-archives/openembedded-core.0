Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 599B97F457
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:16:25 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a194so9932000qkg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J36lXR6OjVFw57Ti8cZqYAgychTK1/OZPM9kQd/zd2g=;
	b=rRYkTQgI8FaIwtLaCKHaAvn5mZG5w+jIyyM85SRulQzum7j+ZDgWUXFzjoa3kngEE2
	IFaki/cXI9PQq6bDW007mcGkVZbK73qSsJbuxkXEAYAbrFOTgAFfyVzNbRJgUqfSJ+a1
	Ram3Q8I4DUamvoAXkLjxMumFN3VVIdVmFahtmzsD7Do+Y5vgvLvg3fKWF0dPmV8Hfqhv
	WN+rvP4ovkGnrH9hsog3Ha+6nhQIj6+ik4nF5PJHsLZItch8jfGwzH4AG5IlcJlhermb
	yfs1KqOY6G0ZJRkh3+xuXfM9z8PBBA+MyR4k4AfMmjk4E5lpsaYAKnOEzOOh64CiHQNh
	ZLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J36lXR6OjVFw57Ti8cZqYAgychTK1/OZPM9kQd/zd2g=;
	b=Fu0cVX63zl2FSXY9VAQxfLH1zQVh37NVM+594vLGR5xY1Ro5rCGwIgzQSf+oz2N0FN
	gJmnWKNZ7zojXrT2/kPMQawWMndUNOnvhmvvpCjouU8WythMF6/FJYqBmoV3MqBUC/sq
	3IngHk2oxfW8hv9pnswAfgHWvzn5Xm5z7dCVwxZ+FIMrDQs2dCtyBcQdRcLnGRjR0bgT
	vPb1Wi2HEynYqWb/h3rK0UpEKDDmFhsj8lJG4Wx3Sg38d8fGErTkywFJHp/y+TGlWK3I
	vZSJsSFeGIjxI6aVwn2uPbg7Vp+N5w3QAcPjq4N1/OBQnZdfYfbzgPtcHQhfiOTOo9oS
	0YYA==
X-Gm-Message-State: APjAAAXKNXxIG+SRSzG5e6DwyfkwYMjJmvHzp1Uxw4C/GyvbsZ0g9Bc0
	xoC3Ph2pBGMh/gltX1XxeHCeaj/l+6fnbA==
X-Google-Smtp-Source: APXvYqwfCzjv2LxNC5LZ6+rA4Wy755k3WzPt5Znr+miX4IIsNdt1wMvGhHl+WNBLruj0lpz2f8Zx9w==
X-Received: by 2002:a37:8d01:: with SMTP id p1mr9655957qkd.210.1571688986151; 
	Mon, 21 Oct 2019 13:16:26 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	o12sm4666903qkk.54.2019.10.21.13.16.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 13:16:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 21 Oct 2019 16:16:16 -0400
Message-Id: <e7b23b7fe11b159235160ae6ffb3af41114fb445.1571688520.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571688520.git.bruce.ashfield@gmail.com>
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] perf: create directories before copying single files
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
X-List-Received-Date: Mon, 21 Oct 2019 20:16:25 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

If we need to copy a single file from the linux source tree into
the perf source tree, we need to ensure that the directory structure
it requires has been created first.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 0f5df74f11..66d3c1d325 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -153,6 +153,8 @@ python copy_perf_source_from_kernel() {
         if os.path.isdir(src):
             oe.path.copyhardlinktree(src, dest)
         else:
+            src_path = os.path.dirname(s)
+            os.makedirs(os.path.join(dest_dir,src_path),exist_ok=True)
             bb.utils.copyfile(src, dest)
 }
 
-- 
2.19.1


