Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5E47873C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:21:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id s39so5330592qth.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=CyPvl0fOEt8rWv5bqAIX57/crxMjktkTJ7X3A4fUju0=;
	b=eZz+a8tMieApq83ixaA2YZZlFixpVuUIyI+CSabRA1TBEgJfa6SPU9s6K9+31fqBrh
	eLZu0Q75naGGFpzK7BZutbXgQ8L20jfvvWrAqfOToUiKvqVeSb04cPBh88dVjArOmTiW
	3QKPjSQ8znfzrpIzQ61vXVxnoazvvc8/IMAyBvkd0LV6R8vOw8FP/X7RwSCSA9kblhlF
	XwJwDeUMppTMYPbNSZXSUSi/b3rpuYQMvEATZqiyqIWfLDGYI2HoPcR7I98S5vLKwvpZ
	CySKZfOcnv77sx5l5wEqn8sHIHT4EON6LbnYb3ev8SYtzQlvZkT3IRLrLfCoMhSwMkG2
	ZshA==
X-Gm-Message-State: AKwxytdaWcjdbhqZrEyw7sMGzkZjNPrfjsA1k/lRpW+RTz0BJQUcLruN
	aLdEVcrupLRFKKu8T4WInSSDAw==
X-Google-Smtp-Source: ACJfBov9eLffGOUR5cX5IxcHH61EseQSiFmUxzDI56c3YlJ7yeMiYHcBBoGg1xGDZWNtnzi46lyjow==
X-Received: by 10.200.33.195 with SMTP id 3mr25352968qtz.102.1516195282924;
	Wed, 17 Jan 2018 05:21:22 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	q36sm3121840qtf.39.2018.01.17.05.21.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 05:21:22 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 17 Jan 2018 11:21:16 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 11:21:06 -0200
Message-Id: <20180117132107.3599-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180117132107.3599-1-otavio@ossystems.com.br>
References: <20180117132107.3599-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 2/3] go-dep: upgrade 0.3.1 -> 0.3.2
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
X-List-Received-Date: Wed, 17 Jan 2018 13:21:22 -0000

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


