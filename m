Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFAB7873C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 12:25:04 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j185so24972034qkc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 04:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ZFzOe/1QcHChplIVacKoW47OTksVaUVaBYZNtVlynRc=;
	b=RtL3BnVEjwjsIPymUfR2PvULKPkPcqU/nsa2Zixu4zn5P5/CP4RQyxEM1Xphl2GASx
	HoJB6aUUYzvrJHypCXzDAesd7iiNSF4ov60+czEj69UynxwFwTT/8qWBCa+05IRtSlFW
	krC/ct2p7Iqyd3wCSmc1qoqWovt+MCX73vlPc3tEXz9Tkx0UD/aml6jNjmbu4OJqGfEJ
	nuG+HjEUcGoDadRtfF71o1p2b1JbvegklUffuV0uh51TOJG3hcuzZP2TS+CCpHpxi/5Z
	LZuvOzMlvspa7KgP17l03S8zJ+iEKV8oNfhKXwzjwduw/Ik0eSY+2rZ2pG78vVGWXUU3
	WpBg==
X-Gm-Message-State: AKwxytcg/m/IRfMOOQMBQZNPVnkyfGXubQGTjZgKuPLXS2nHVrBi/egt
	R5p5+twhGdHPqQxFLfX9rapZMw==
X-Google-Smtp-Source: ACJfBos5Ea3JIJeDkfihZ+L5bVKGazbKEUiEWTWkqB8YKqZALgdSw1MV/4p1gYkCxoOKd+VsWyzzew==
X-Received: by 10.55.204.81 with SMTP id r78mr59232393qki.356.1516191905257;
	Wed, 17 Jan 2018 04:25:05 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	m69sm3155110qkm.56.2018.01.17.04.25.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 04:25:04 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 17 Jan 2018 10:24:58 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 10:24:48 -0200
Message-Id: <20180117122449.8395-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180117122449.8395-1-otavio@ossystems.com.br>
References: <20180117122449.8395-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] go-dep: upgrade 0.3.1 -> 0.3.2
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
X-List-Received-Date: Wed, 17 Jan 2018 12:25:04 -0000

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


