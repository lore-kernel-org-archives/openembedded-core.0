Return-Path: <malus.brandywine@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D683C615FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:03:32 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n17so3071359qtv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Jt+UN3+mGntN182kK4HpfRWImt9sGet2ejAmXJNO+9E=;
	b=fVcFMkQk5SbtysrAsCYx/YqRQMvBIR5UgjEqgFw/ptZQPtGxA2JlJ8KMoQJW0Dfy8m
	c2spyLyHY99QvlKt50z6pFuhLF43QjpC6Nr5LXw/fLg2AOleca2nbUQk2WTZjm21ODsW
	lKWtfBzL7u3jiapkEPVneU+bEBfGJrGzqIjpzqPDnHZ7CEJlm/+hOrIoubQXdgZt5HkL
	aLwh9kuknn5t+DYABnJO3Wut45VhC+aFVoSzr4aa76mn6QVM8sKw1oKAWLH+Exy4nDWg
	UpVmvLlbqbIULMt4foCwY6uyB/LUUqr7PG4e5WMemsqRPTJ/0nxpWrdxjR1oEjlpAlTP
	szcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jt+UN3+mGntN182kK4HpfRWImt9sGet2ejAmXJNO+9E=;
	b=GGxs8Xx7n4JNElsu/K12uJ2IDkDv5uBz/YLCJdFlI7aV2cvltLdaT9KiHLfyNNW0oP
	Q/Tpw3IdkqYh7J9+qP/BdUtEBuINxClW9aBO7F1/r0Uu8VgBLq29yI6BOUaMC+WsNoVH
	CSrrfhyJrdnkvXdph89gahW20weCoICEhrsXls6xG6rVzcDb4Ct4pkME2iRX0LhaW3VX
	sCfS10wX3TBQRIqbi+LJjSZGQHHkATIXzzeiZbQppwijSZF+J/ZH8qoC8u7dL3UxUmpJ
	qyVx59XGjlRjFn14ULlQU27vhPJUod8LO1qPtWlzhfUAs8L7FcJuH33fawCIBN78zRo9
	2smw==
X-Gm-Message-State: APjAAAWRar/j4CZ1I8Cj+4FR0z+r8m4k4edUv2P+nt0CkanSIHOkO+sX
	tPbXNk6sWb0AgcS82QU4V2G43H+f
X-Google-Smtp-Source: APXvYqzGDdMa0nXkLqn9niHMdTrdLTnXq+wP+aqKsJ0fVR0p5h3UOW2A6PS7/bk9Eq59n/w4wzRqhw==
X-Received: by 2002:aed:2266:: with SMTP id o35mr27102789qtc.392.1582211012978;
	Thu, 20 Feb 2020 07:03:32 -0800 (PST)
Received: from Lubuntu1804nataliya.tkf.ru
	(kntaon1614w-grc-09-74-15-93-240.dsl.bell.ca. [74.15.93.240])
	by smtp.gmail.com with ESMTPSA id
	j30sm1689878qki.96.2020.02.20.07.03.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 07:03:32 -0800 (PST)
From: Nataliya Korovkina <malus.brandywine@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 10:03:18 -0500
Message-Id: <20200220150318.20003-1-malus.brandywine@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Set default CONNECTIVITY_CHECK_URIS to https://www.yoctoproject.org/
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
X-List-Received-Date: Thu, 20 Feb 2020 15:03:33 -0000

Signed-off-by: Nataliya Korovkina <malus.brandywine@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 433d4b6651..6c9155b2ae 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -48,4 +48,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master
-CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
+CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/"
-- 
2.17.1


