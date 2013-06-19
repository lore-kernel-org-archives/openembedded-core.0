Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B80F8608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 11:33:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5JBXnVq002396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2013 04:33:49 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 19 Jun 2013 04:33:48 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 19 Jun 2013 19:33:14 +0800
Message-ID: <db6aa1ea9fd6480a4892f7672c25894179e8424f.1371641469.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371641469.git.kai.kang@windriver.com>
References: <cover.1371641469.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] strace: rename the recipe
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
X-List-Received-Date: Wed, 19 Jun 2013 11:33:50 -0000
Content-Type: text/plain

Because changes too much, git doesn't take update from strace_4.7.bb to
strace_4.8.bb as rename. That can't show history log with '--follow'.

Split rename to a separate commit to workaround. Be careful, this commit
is not buildable.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../strace/{strace_4.7.bb => strace_4.8.bb}        |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.7.bb => strace_4.8.bb} (100%)

diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.8.bb
similarity index 100%
rename from meta/recipes-devtools/strace/strace_4.7.bb
rename to meta/recipes-devtools/strace/strace_4.8.bb
-- 
1.7.5.4


