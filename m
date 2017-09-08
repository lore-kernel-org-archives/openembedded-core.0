Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 52EB478234
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:05:42 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h15so2255822qta.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ayXg3ze4qP+v3u82VFkLSrNaYYUXro0x6VnG7q7tnds=;
	b=DQwGauChZMlX/eH0GRZ+GSQmdAzM6hMqPUZbVYOSr++t2ZBNvtxEx7NLBR+4he2XqZ
	BUPVJ0NoV4KOGT8puHqwcqEA+Hog6m8VQIcCPK90FSj8OmZONws1nyLXR3bMUGOjpuQh
	H9PyIFciVEJZDEruRW1Zc1R8S4ImqFPycCIF6TE+yMlgAlR5MuwHELZbl5A4YfaXjwrX
	n2oUPglzv9BA/eRK46Zf6wwkzsWWFtfaAigPXeNzWJYo5K+pC3z/JGnWWfGSGXilPdN4
	WnzNQMKjpp+kJ5XUxWYvQtG68PcOWIPLJEc7YQelWch227m6ku2RSqWEULJa6z6XwCXj
	PvAQ==
X-Gm-Message-State: AHPjjUhGante1dN32bKNDJH0Sv9dLUA+8He/RQr7/DvK9LF+funJ+A3c
	7EZ0+wZ4h8NsDknS
X-Google-Smtp-Source: AOwi7QDYWStAF4JMeEY7D7HA+F+l407AS65FeLf5uQCITRGjuy8YNcjhaGWARt+t7IIZmSpiD1Gctg==
X-Received: by 10.200.44.207 with SMTP id 15mr6196615qtx.259.1504904743429;
	Fri, 08 Sep 2017 14:05:43 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t123sm1778339qkh.39.2017.09.08.14.05.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:05:41 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:05:34 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:35 -0300
Message-Id: <20170908210444.25763-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 05/14] goarch.bbclass: Add support for ARMv5
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
X-List-Received-Date: Fri, 08 Sep 2017 21:05:42 -0000

This adds support to return the proper ARMv5 format.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4:
- rebase on top of new "goarch.bbclass: Replace logic for setting
  GOARM"

Changes in v3: None
Changes in v2: None

 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 0f0d8b6a60..0c22f80518 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -50,6 +50,8 @@ def go_map_arm(a, f, d):
             return '7'
         elif 'armv6' in f:
             return '6'
+        elif 'armv5' in f:
+            return '5'
     return ''
 
 def go_map_os(o, d):
-- 
2.14.1


