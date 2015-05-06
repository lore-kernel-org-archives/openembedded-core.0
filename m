Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9FFF773DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 07:05:07 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so8150932ied.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 00:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8XhLhgYaCTEGZz4h7ZWjIVoJ0/ZdojnXcj6D/eDMaMw=;
	b=Rj86Hs1IatnN784uqr/8NlrI1JOrlBu0E5dkYZzz/ZtfV1aV+OPL3T+HiIfs7hmPjW
	AC2wJ+y8i7/auJhn1UGYYq9yAtlgz/p9DqV9vcComhwVX941/IPokmWhTCW1Ovin0Snq
	xNY4Pz1D/QHlfff3CcCc+1zJ9o794dxubwt+yU0CuhJydO03B2w0lU37C3bXHOfcJJXv
	Tqs6oMusldrFMH/1oo55VNWkZUqEkfgP8GS2p+/JSVFryW1LHvUWDKx1GNxOB1TF4xWJ
	eOl28lB0dmK/Q/rsQIB7v1cBm6iZyZ9xx3/qlvGNrpOj0H6rbe0d1Xy/wBPBmsJpvn2H
	TyWQ==
X-Received: by 10.42.20.14 with SMTP id e14mr1198179icb.76.1430895908901;
	Wed, 06 May 2015 00:05:08 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id m5sm622733ioi.4.2015.05.06.00.05.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 May 2015 00:05:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 00:04:56 -0700
Message-Id: <738425f47b6296e5251e5e555c41d82a4ae15d87.1430895556.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
References: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
In-Reply-To: <cover.1430895556.git.raj.khem@gmail.com>
References: <cover.1430895556.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] insane: Support aarch64 on musl
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
X-List-Received-Date: Wed, 06 May 2015 07:05:07 -0000

musl 1.1.8 supports aarch64

Change-Id: Ie8d39a29dcb7a41c8d59d2a00528b6add8a7655c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ab4bd78..14d4a3c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -106,6 +106,8 @@ def package_qa_get_machine_dict():
 
                       },
             "linux-musl" : { 
+                        "aarch64" :   (183,    0,    0,            True,          64),
+                        "aarch64_be" :(183,    0,    0,            False,         64),
                         "arm" :       (  40,    97,    0,          True,          32),
                         "armeb":      (  40,    97,    0,          False,         32),
                         "powerpc":    (  20,     0,    0,          False,         32),
-- 
2.1.4


