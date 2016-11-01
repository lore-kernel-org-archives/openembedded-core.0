Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id B767271B15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:54:40 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id p9so1709729vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=NzSz8HGdFWneLG9MlzyhIjVcNP479ZS/EVSrFGR332Y=;
	b=kFB/gTxPkD6bQmAz9dvJpyQlCdj4+0GQyakeLEpBHqZoxQNM5Rgmv8zIm3CrcHVCMp
	+QTPL5MGgJ+0EulZc0vLOHDZn+yXtIpWrsRaeHU1ECcbibNBCOOHpEYzFZOo82Ze7A/W
	RM8MeukFPCRl1rhnN2KPYvVlM2T0OZElnmL+SXgndfXuP5d6/tKRSxH6YG+9mN3/OwRB
	6X4g6QzS3AftwNDWnIBy+HVq0YhwNsMWLDT7LH0982dmkuelABTpTPZ3Ney4aqF86tq2
	cTNuNe2qSQDIZjkcc6C559WJBcREgi6m883/53/uurBX2YMcD2d7+MjxdeLw94QrZ52r
	TU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=NzSz8HGdFWneLG9MlzyhIjVcNP479ZS/EVSrFGR332Y=;
	b=A3kQYGorQbDu7cUjtwwNmrgm7jhsIVXCtU6Vvna7TjAcoE9B/T6sbN6nNKPKylptDg
	jVfHpgQxBcLCxbwuNY+0EisW55pZh79VGEju21a7kYiqvkeUFbk6NgwZ9qkg66I90SQK
	ouTvwe88cpdHsf6hYiYDkK9Rx2I6FffwjnUnWmvf4Ca56xpb1L3aUEJv+x2YpzxzpcJj
	FWekDI5+mxmQ7FxUg8xNOOHZzawcUoArncUksFNvKNtQEt/mG6ZDywPxRy7P3AjsBuJq
	7ROYyGx2ZLzp0HJgw7q2f9rN8ryH6h3+pskDIEcH6K2rrLqA2h33lRswRtzby0K8Ht4Q
	uRHQ==
X-Gm-Message-State: ABUngvfSEVnk4BcydC8vzFZO18gZdLjWFA5+mbn7k3E8vSiTbDFT1wK4diHVZZnP8U64lw==
X-Received: by 10.31.128.208 with SMTP id b199mr30962477vkd.117.1478030081557; 
	Tue, 01 Nov 2016 12:54:41 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id q7sm8055913vke.20.2016.11.01.12.54.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 12:54:40 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:53:55 -0200
Message-Id: <1478030040-20670-3-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 3/8] clutter-gst-3.0: Update to version 3.0.20
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
X-List-Received-Date: Tue, 01 Nov 2016 19:54:40 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../clutter/{clutter-gst-3.0_3.0.18.bb => clutter-gst-3.0_3.0.20.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.18.bb => clutter-gst-3.0_3.0.20.bb} (58%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.18.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.20.bb
similarity index 58%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.18.bb
rename to meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.20.bb
index 9626cd9..0bf9386 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.18.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.20.bb
@@ -3,5 +3,5 @@ require clutter-gst-3.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
 
-SRC_URI[archive.md5sum] = "3e4f64477f26d9cfd2db06d3aaed203a"
-SRC_URI[archive.sha256sum] = "0aec0d0c6020cd19a5bb0dab1165a92748f81a9a3acdfabb0f966d5f53bc8093"
+SRC_URI[archive.md5sum] = "e6de3afcf82fcddab8193665f1a1667e"
+SRC_URI[archive.sha256sum] = "a0011787ed2a2dafe914f973c1ede283d40b8eb75123f4a7b608ae6d1cc066c9"
-- 
2.1.4


