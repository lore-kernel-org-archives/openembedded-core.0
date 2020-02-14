Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 68AFA610AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:42:38 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i6so5083208pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=muqUsQbRtNjJDgj5aDMfbP4BQV0r5sCkzZxtMdh43j4=;
	b=YXRnh2U1SaQFuZN6aqXknfdCBbApG2yIo11uFrkr889XIew6TSKtUOLeGsWEY0Wrju
	k5SZWrzmIPw0aqGeSSmc8TbCdlFCAPhWtfen5gOpRDxF3sdk4SM3sTiCtxHiFMaRR0Ux
	FRh7TxNTgKcTfuS/EVvvaCPXibBQu1dTWgTqReIKY7o0MoU1tWekuz2bA5co+f5yqTps
	RDdkQvNUh8dX7eqEkZQPGFaY7KRS+VsxPOlVxqlz9qijOyuKvXmpoReLZtsMKPFQMDKM
	tD9bkilDYEV0KATpm6dOZr3j0sD3G41mNx8kM8wMZSFGsokS4tzJs0Oy95vu+jySHQEF
	dw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=muqUsQbRtNjJDgj5aDMfbP4BQV0r5sCkzZxtMdh43j4=;
	b=T9PvDlq3kUAe6FCKjLj1e1zl1BJz0QLcoRRHqpdje2lNPBwqNC6nOviCTHoycYMq7F
	ANxKT206xLwq49BBArjXdoyl1MNDvy2K/NjgyJU4QOiqQoBKqHcOEqtjAqeN2K2j57If
	6jN2otxEASNWiJHZvI/RTR0DkxqcpLCaosweMnbeKbSJmyytR94B7h+lss3QyAOVY2xU
	OAtQTQwtUVK9FIEzSGh9DOUpw9Q46L1s5gc/OXrwD+UI662WWHSZcTMOwc7NkCQBcfxD
	XSqYDMWwVEB1ccnRdA7iDEi4TF5KiIjJxzZeZim4PwSNo4hfjtykgP1t63YKZRnL0z9g
	btKg==
X-Gm-Message-State: APjAAAWTkuz1+q3A02om1Jmqle/i86vIKuYWk02rShiR3coKEVY7hbqZ
	D6zkXpVQ6l/WFm3qRnU+ks6O9yR+Ahc=
X-Google-Smtp-Source: APXvYqzOxje/8jt6EKD7xqeA7Q8cc2Yn61L/JgNdE9HZ02cECT+uDsAaMMHubVkWHkvpYEPptSFnKA==
X-Received: by 2002:a63:451b:: with SMTP id s27mr4037369pga.233.1581694959064; 
	Fri, 14 Feb 2020 07:42:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id w2sm3426193pfw.43.2020.02.14.07.42.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 07:42:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 07:42:38 -0800
Message-Id: <20200214154240.2222810-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/3] musl: Update to latest tip
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
X-List-Received-Date: Fri, 14 Feb 2020 15:42:38 -0000
Content-Transfer-Encoding: 8bit

Detailed changelog is here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=e6093b5a870a38ebfb3e54382acd48c698bde15d..a662220df547e5c2446518e74440a7d834f9ebe6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f4853b4f2e..b6ec6fe9af 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "e6093b5a870a38ebfb3e54382acd48c698bde15d"
+SRCREV = "a662220df547e5c2446518e74440a7d834f9ebe6"
 
 BASEVER = "1.1.24"
 
-- 
2.25.0


