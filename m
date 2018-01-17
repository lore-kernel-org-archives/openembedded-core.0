Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id A2C587875A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:59:47 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a5so22990578qkg.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 07:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=gc4d7C7Bpks4Wluzxa1w/2pq6oLF17PoJ8CSlPrJU+4=;
	b=Y4kkFY40nFgXAR3vfmNBcCfjfGd4Wpq/YhXxpjixXX/j8Ob03T8yJzzjQj6cgUJRR0
	K9jD3u0ASF+wAdi4paSLofC5WF8GzafhUdtGWJx6s0P3l16NMcEZrsNIzfbHRIwbCym+
	U7wjArBP8yXAQixnZkG4zXn9EItjXxBp+jkAaHwF7kpgTezofqGfSPDhVm7GO1+qjtGC
	pD+xI2Xv6ClJ+iMJ7oEK/LBZTPBoBnd7RVShV9leNfZu4IeID2U3t05hiCESX6wGxHI4
	uxMy4J3zbIvNH6a5il650RIfu7ls5Ctzdeedhvlstb6KjH3GcuYfzaI4mpzK3V6K9HLs
	EhQA==
X-Gm-Message-State: AKwxyteckcj2GPJGAI8i8J2F9OqSJ8yw8FRf0FOqTNXj6bEm+NqerdKt
	E6AW6C91kVVVUtr7A7fBHk3Otg==
X-Google-Smtp-Source: ACJfBouaTks8ONVGg8PvVFS/9aHGgzWotanGKx/56eEUNash2/D9pr0eFtfGcY1xnug3Wummf9FpDQ==
X-Received: by 10.55.24.138 with SMTP id 10mr59466316qky.358.1516204788707;
	Wed, 17 Jan 2018 07:59:48 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	g192sm3125510qke.59.2018.01.17.07.59.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 07:59:47 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 17 Jan 2018 13:59:41 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 13:59:32 -0200
Message-Id: <20180117155933.29634-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180117155933.29634-1-otavio@ossystems.com.br>
References: <20180117155933.29634-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 2/3] go-dep: upgrade 0.3.1 -> 0.3.2
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
X-List-Received-Date: Wed, 17 Jan 2018 15:59:47 -0000

The 0.3.2 version has been released in Oct 19, 2017, and has a great
set of features and improvements, as seen in the announcement summary:

,----
| NEW FEATURES:
|
| - Add support for importing from gvt and gb. (#1149)
| - Wildcard ignore support. (#1156)
| - Disable SourceManager lock by setting DEPNOLOCK environment
|   variable.  (#1206)
| - dep ensure -no-vendor -dry-run now exits with an error when
|   changes would have to be made to Gopkg.lock. This is useful
|   for CI. (#1256)
|
| BUG FIXES:
|
| - gps: Fix case mismatch error with multiple dependers. (#1233)
| - Skip broken vendor symlink rather than returning an error. (#1191)
| - Fix status shows incorrect reason for lock mismatch when ignoring
|   packages. (#1216)
|
| IMPROVEMENTS:
|
| - Allow dep ensure -add and -update when lock is out-of-sync. (#1225)
| - gps: vcs: Dedupe git version list (#1212)
| - gps: Add prune functions to gps. (#1020)
| - gps: Skip broken vendor symlinks. (#1191)
| - dep ensure -add now concurrently fetches the source and adds the
|   projects. (#1218)
| - File name case check is now performed on Gopkg.toml and Gopkg.lock.
|   (#1114)
| - gps: gps now supports pruning. (#1020)
| - dep ensure -update now concurrently validates the passed project
|   arguments. Improving performance when updating dependencies with
|   -update. (#1175)
| - dep status now concurrently fetches repo info. Improving status
|   performance. (#1135)
| - gps: Add SourceURLsForPath() to SourceManager. (#1166)
| - gps: Include output in error. (#1180)
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-devtools/go/{go-dep_0.3.1.bb => go-dep_0.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/go/{go-dep_0.3.1.bb => go-dep_0.3.2.bb} (88%)

diff --git a/meta/recipes-devtools/go/go-dep_0.3.1.bb b/meta/recipes-devtools/go/go-dep_0.3.2.bb
similarity index 88%
rename from meta/recipes-devtools/go/go-dep_0.3.1.bb
rename to meta/recipes-devtools/go/go-dep_0.3.2.bb
index 3a404e357f..627324a1df 100644
--- a/meta/recipes-devtools/go/go-dep_0.3.1.bb
+++ b/meta/recipes-devtools/go/go-dep_0.3.2.bb
@@ -9,8 +9,8 @@ SRC_URI = "git://${GO_IMPORT} \
            file://0001-Add-support-for-mips-mips64.patch;patchdir=src/github.com/golang/dep \
           "
 
-# Points to 0.3.1 tag
-SRCREV = "83789e236d7ff64c82ee8392005455fc1ec1983b"
+# Points to 0.3.2 tag
+SRCREV = "8ddfc8afb2d520d41997ebddd921b52152706c01"
 
 inherit go
 
-- 
2.15.1


