Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 70C996E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 00:36:56 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so66244089ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 17:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dmWs+WfIgwWNN4QqRRi5hF+lIbDmRmmQxolbOXqjNDE=;
	b=Sh2i50fAiaiNwgyf4UyYxRe2+vmDg3e1b1Pg38A3aB9t3U7XtCTEjwo4s3zGRQqwZ3
	gUk4MlhqQUZNsKoZDQIN3MhvWm0K/VWsAvS5v4k3PuQRsX1rd7DkISncXkxWJVoj953D
	6a2MyYw9Ck0NT49xTp8S1JLCHoQSgxz4rutqmLoibVW9Wx4RleUXPfBhVJBaDDRdJoec
	astM/cjd+c03qJk7ljcGvpeljk/ZhoTkRkUMgC/dNl6BVb/FvY2RQv5SRNTcJ/Qqvhuf
	npi2IZkSsUNlBhJhDt2B/xIw4BowUaUbZYfddELLj4RYH5XcC3IWFKeT/SxXGDwXyWbS
	R30Q==
X-Received: by 10.107.34.81 with SMTP id i78mr13644247ioi.40.1438821416731;
	Wed, 05 Aug 2015 17:36:56 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	k19sm3330223iok.20.2015.08.05.17.36.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 17:36:56 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 17:36:48 -0700
Message-Id: <1438821410-22693-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] gettext_0.16.1 build fixes for uclibc
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
X-List-Received-Date: Thu, 06 Aug 2015 00:37:01 -0000

Assuming everything works out OK in master, fido needs these fixes too.

Andre McCurdy (2):
  gettext_0.16.1: remove obsolete uclibc specific patch
  gettext_0.16.1: add -lrt and -lpthread to LDFLAGS for uclibc builds

 .../gettext-0.16.1/gettext-error_print_progname.patch | 19 -------------------
 meta/recipes-core/gettext/gettext_0.16.1.bb           |  4 +---
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch

-- 
1.9.1


