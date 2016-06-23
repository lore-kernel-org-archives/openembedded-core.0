Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id E86F173174
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 22:23:33 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ts6so7413095pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 15:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nlqp/lvzrODW4T8zc55QJSZb/yZSQsMwujruakS+Ea4=;
	b=jG2t4Nz4y43D6ehDUC6HZKdpI8N2q6y1/rLL4JdjgKZ+kW8WSiQryf8WgjPBZeki61
	EfVWVlPgC6dhrEeC3bO5hK92Rdpyy7fIRUJ/TEQ6UMvAFVrAK3f95XZZFsa19wNhRBNL
	VKvbvZuLUx3MDcpip2x6TXRJ0TFM5rGeeGuKdr7rDuPTIjVjY7LV0zho5J96EbOAZac4
	Nwa9ApkwZpd+kY2W/9kM3gcfkZvSDACTomILVFd/s0Fce3NldDN1aoTiZIieS3fdr4Bf
	7X+90t4DTHNLO4G9mXs8EG1yhK2WAixEw5oOPhO2s+6oQVJgyFQXe6DCP80kEhEZwUVx
	8ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nlqp/lvzrODW4T8zc55QJSZb/yZSQsMwujruakS+Ea4=;
	b=EbfIHmpnQgfJaQzFT29RsO5rdtLRsGL95etXSDnI4ny4wPPNzJt02h1D6Iwm+87r+U
	vNPynwDsx+fRVAidGEUwMZerF5qOn0WoMSeO2BtSKXQnnwrPpzybUM170U5F5aFDKTT6
	8Vy3yXtD2lhh2T88ScxdYeoLj8CkkL9VqTp7FgCunm/5kj3FWoi6gXnz7DD453EAYlOr
	IN/MhfVD5K+8kbz7NztwRk9+mEyLMT6isA6hOc7bGCdoxspE5lrrs/IuD/w9P35MoQbu
	pdwUFYNNlCF7+AZ0yoejzg89gnFk2kBRjHHJEcM9yO07l9NuSBVPV5sM5h9U2YgZF4J5
	druA==
X-Gm-Message-State: ALyK8tL5LsuAK3StKGVF+W+FESdtHWyY/3VZrJyLALQc2gqwehX97mmUN5bZh/dLm9OofQ==
X-Received: by 10.67.4.137 with SMTP id ce9mr1593123pad.120.1466720614313;
	Thu, 23 Jun 2016 15:23:34 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	tj10sm2396547pab.21.2016.06.23.15.23.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 15:23:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2016 15:23:19 -0700
Message-Id: <20160623222320.8387-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 1/2] musl: Upgrade to tip
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
X-List-Received-Date: Thu, 23 Jun 2016 22:23:36 -0000

Rich Felker (4):
      fix undefined pointer arithmetic in CMSG_NXTHDR macro
      fix a64l undefined behavior on ILP32 archs, wrong results on LP64 archs
      avoid padding gaps in struct sockaddr_storage
      remove comments on copyright status from UTF-8 implementation files

Szabolcs Nagy (8):
      fix the use of uninitialized value in regcomp
      add preadv2 and pwritev2 syscall numbers for linux v4.6
      add SO_CNX_ADVICE to sys/socket.h, new in linux v4.6
      add ETH_P_MACSEC netinet/if_ether.h, new in linux v4.6
      update siginfo struct for linux v4.6
      add CLONE_NEWCGROUP clone flag, new in linux v4.6
      add new tcp_info fields from linux v4.6
      update sys/socket.h to linux v4.6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b1abf4f..956d9dd 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "63e3a1661f1fa5552e2023683617ce09fac3248b"
+SRCREV = "6cec7bc57f599f43f4041cec2093e3c9231dbaab"
 
 PV = "1.1.14+git${SRCPV}"
 
-- 
2.9.0


