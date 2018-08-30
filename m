Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE1C7842F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 01:24:30 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id h4-v6so8066576qtj.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 18:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=A40w+yu+021IVmVLrfmiYqsB8X3xoEc9sEvO2sU4t18=;
	b=atHBQD5TY4K2BMkkDTfhvuYHEmVt/8JFjb1xu0NFoN+FfPBZqzrIwtnaqeUGMgAnwB
	SppO9XzKrV2z3ReRF5gY79mI+JD6JF5WwDJMWUpXLBP04eZpOZm4tRBlfg2qKK+M2XgD
	gIXHTxKYyAfGQ05f6lHrJL3tZiAvvn1/U7Tyh6pI82GLZSAP8rdn1SZRNqatUabEtw+8
	YUaVOkzwP/y6ImUh6GdPZqllmWFIQubyqnaBGrB6jUzmVCbOVQpNf3FUtBZDHKivKQzg
	DJ/5KQ9tWxIBhfzda8tiSwpNH0hDuhVIP6ykYcDHPQEvqteQkNpDZ0OVkWgOLBWM4Atx
	GQRA==
X-Gm-Message-State: APzg51CZ3VBFHpzDZN2ZPihevOU7HNh+j+0SIdteEUp3jJ8YbE4LfXZK
	5vLM5/6R+1oaSPy32RRmEHZsIdE1GpE=
X-Google-Smtp-Source: ANB0VdaY6lDNPUjB9g0gpyIZbbC3ExneF41ADpes8Q7nr9m+vkBFLWCKnwZsv+Ji5ow7135Jeliy6Q==
X-Received: by 2002:ac8:1888:: with SMTP id
	s8-v6mr9583638qtj.268.1535592271023; 
	Wed, 29 Aug 2018 18:24:31 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	o5-v6sm3731665qtc.63.2018.08.29.18.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Aug 2018 18:24:30 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 29 Aug 2018 22:24:23 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 22:24:20 -0300
Message-Id: <20180830012422.7886-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] go-dep: Update 0.4.1 -> 0.5.0
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
X-List-Received-Date: Thu, 30 Aug 2018 01:24:30 -0000

NEW FEATURES:

- Add CI tests against go1.10. Drop support for go1.8. (#1620).
- Added install.sh script. (#1533).
- List out of date projects in dep status (#1553).
- Enabled opt-in persistent caching via DEPCACHEAGE env var. (#1711).
- Allow DEPPROJECTROOT environment variable to supersede GOPATH
  deduction and explicitly set the current project's root (#1883).
- dep ensure now explains what changes to the code or Gopkg.toml have
  induced solving (#1912).
- Hash digests of vendor contents are now stored in Gopkg.lock, and
  the contents of vendor are only rewritten on change or hash
  mismatch (#1912).
- Added support for ppc64/ppc64le.
- New subcommand dep check quickly reports if imports, Gopkg.toml,
  Gopkg.lock, and vendor are out of sync (#1932).

BUG FIXES:

- Excise certain git-related environment variables. (#1872)

IMPROVEMENTS:

- Add template operations support in dep status template output (#1549).
- Reduce network access by trusting local source information and only
  pulling from upstream when necessary (#1250).
- Update our dependency on Masterminds/semver to follow upstream again
  now that Masterminds/semver#67 is merged(#1792).
- inputs-digest was removed from Gopkg.lock (#1912).
- Hash digests of vendor contents are now stored in Gopkg.lock, and
  the contents of vendor are only rewritten on change or hash
  mismatch (#1912).
- Don't exclude Godeps folder (#1822).
- Add project-package relationship graph support in graphviz (#1588).
- Limit concurrency of dep status to avoid hitting open file
  limits (#1923).

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/{go-dep_0.4.1.bb => go-dep_0.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/go/{go-dep_0.4.1.bb => go-dep_0.5.0.bb} (93%)

diff --git a/meta/recipes-devtools/go/go-dep_0.4.1.bb b/meta/recipes-devtools/go/go-dep_0.5.0.bb
similarity index 93%
rename from meta/recipes-devtools/go/go-dep_0.4.1.bb
rename to meta/recipes-devtools/go/go-dep_0.5.0.bb
index 10af1d660c..f0ce60a8ec 100644
--- a/meta/recipes-devtools/go/go-dep_0.4.1.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://${GO_IMPORT} \
            file://0001-Add-support-for-mips-mips64.patch;patchdir=src/github.com/golang/dep \
           "
 
-# Points to 0.4.1 tag
-SRCREV = "37d9ea0ac16f0e0a05afc3b60e1ac8c364b6c329"
+# Points to 0.5.0 tag
+SRCREV = "224a564abe296670b692fe08bb63a3e4c4ad7978"
 
 inherit go
 
-- 
2.18.0


