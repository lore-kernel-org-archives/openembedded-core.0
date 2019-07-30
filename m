Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id AD7B57F332
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 15:54:44 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y4so66360364wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tc5jiygbGAUwDg2P9EwIWvu2VNEKprkuI2m+Xp94V60=;
	b=gB43S0OouMktjB3jueCaWCdLH0JT/fF6ndzoo+OXLXWjzf4kh1LKfg2ziYH6i/WYKY
	RBU/TSp+fTX3RjmKoYlczISKmtlVf9nsKoDqb3LsYPer339WX7+r1zcuA+FqJqTki074
	oRTxqJ1e8eMPxyHigxUHqwT/oD6FB6EzrJN7LmLjkQehAf3oFthrUmlm9ORb6oaX3U8A
	OmXd4KbtRzZ3Lhe2ZSd6krqig6MDJhDGIhFHrjuntDCcpBbncVD+dqo1zqJcd4/xojwf
	6CYr0JAH6LyB9ZkDB0S1Sz0u5m0O4Pd8Mij4Q2W3giSnoZ3av34Ou8M4nVXAWQnawuUM
	baCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tc5jiygbGAUwDg2P9EwIWvu2VNEKprkuI2m+Xp94V60=;
	b=hIvt6oMmo5hCAZtc4qQczRHmFx3etwXwSKDuhU7cEQNF1jKrT3+tD33wP0PCj4E3Rc
	LIlu/c6zxm35zZ2IzE1yV2NURWeOGosiwJN2s1STdXalRuZCxg+2qD7rn0OZ5LmNsdi1
	6yRsaC7++2NPzODfOfZRUecY/tHbP0YPp6FQxdYyiXMolXX8tsJF8MDUzjD6GJ86ORwJ
	8uFwEdBY8VhbaCSuE7cs+24SZPeAiCjs0yTYiXCjpT9mIPLuVgFXQ75TNwkllWGS/1YF
	BCkSerozG/JmiMCRL4nepJse3SoKYqtfOaL7Ml7cHQWHwnnbWs3/FZhq8NyxJeRHtVuJ
	Cq0g==
X-Gm-Message-State: APjAAAUSizCZbjgoH89Gk3GpaJcnP57HTLP/iEjBBCpwvIbGwyQba38Y
	tg6RbDNNiCVqH+idIoOvMxfRFd7Ou2I=
X-Google-Smtp-Source: APXvYqz7z16UbV0lcjHnxGaQvzhaEF+z76DcNwD6kZvkaCtcXJ+0f+E5iBokSsPK4QxoxYMnkmCk6g==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr13412068wrj.272.1564502085091;
	Tue, 30 Jul 2019 08:54:45 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c3sm70781403wrx.19.2019.07.30.08.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 08:54:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:54:30 +0200
Message-Id: <20190730155432.96611-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155432.96611-1-alex.kanavin@gmail.com>
References: <20190730155432.96611-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/8] createrepo-c: upgrade 0.14.2 -> 0.14.3
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
X-List-Received-Date: Tue, 30 Jul 2019 15:54:45 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.14.2.bb => createrepo-c_0.14.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.14.2.bb => createrepo-c_0.14.3.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.3.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.14.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.14.3.bb
index 80c559fefb8..22b9f3d3b14 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "f390af98c8f1bb04010e293ea864eae160f75879"
+SRCREV = "de9d8337885d953baae501cce75decc11d5468dd"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


