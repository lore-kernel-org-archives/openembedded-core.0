Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5587948C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 17:27:46 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id h4-v6so11218707qtj.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=yHl33XlKIG1lOs8lYx9/LXTBzWKZ7lqsQXpYhEp+Aag=;
	b=oFuXI33NJSso9wxHQQesgN3XMSQkyhKV4ePTR4Uy+meFoIbZjXN00383J8Vanfhu6V
	ytcA85Fh/cEbigtWmfXpP8xxjb1YLZuAjkvkYliD7GxReaF/F2XEsVYx51xHl+wRh+dE
	oAo6rGUE2iTalbnhRqqXI8upPx9MVJRGihtkz9Qf57AnQ5lakapp8SPMEz7IyYQ7347I
	psMAd+mVkTZJvBJUz7Rc5ATMvgwVdQJhy4m2PwhbsVhrXmOk+0Lv8zAljrMuVgb5gs61
	aXPL+VbPb5LzsQkgwzp+aRX8vBGLx0rz8NnrtwyuUz5VycQfdF2lLOS74/o/Pmt33Pyo
	/PBQ==
X-Gm-Message-State: APzg51B6RSEsYZxfkL8x9Rbmth+rBBKkLpCMAEHIMNFgOlyRO43fqA8q
	TOCjs7FyCx4CggOwSyqtNjRrE5ShHH4=
X-Google-Smtp-Source: ANB0VdbQuS/qKm7vX3EiS2ooDdGcocTlH6uZxLzXdhmQuKTaeM+BQClvoEBt2I6Z3TVCf1oT/8CqjA==
X-Received: by 2002:aed:3f22:: with SMTP id
	p31-v6mr12583757qtf.185.1535650067345; 
	Thu, 30 Aug 2018 10:27:47 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	s8-v6sm4853175qtc.71.2018.08.30.10.27.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Aug 2018 10:27:46 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 30 Aug 2018 14:27:39 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 14:27:35 -0300
Message-Id: <20180830172737.26950-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] go-dep: Update 0.4.1 -> 0.5.0
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
X-List-Received-Date: Thu, 30 Aug 2018 17:27:47 -0000

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

Changes in v2: None

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


