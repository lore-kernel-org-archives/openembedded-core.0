Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1A84C7FBCD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:41:24 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id s7so5031918pjc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WcTxryMQc3fG1dj1uTAYX9RfXyMJQINqIdpOPSnI+Ws=;
	b=rRGrtAszos0B7rx0axWG0Ta81p/xczZpacwauj/lFUsHMBm8CJI0zBS6dmPcxb2QCh
	FzHnYT8EIDoST/gCENvIxTWpKjuy4XlgkI4pVXKaCb1lhrM/sjEuhr+NB/6XXPJuxPhS
	LZw0pKgRxbDvnkGBQDoFBZMuC+cInrvsaYYaExggaD0L07LVQNl7TT7tV3YN6YerbOo/
	Ynr8E6vQnbz0/5/Ruh455cdl2oTovkBEKFO71xgFNybvslI0o3GuJtO2ul9OHTanuDj3
	8vEEYJNuJSRShaVcf1+eRniJC+4jHj8PlJSHBHwPtoDhhbvxRCOIFhki54M9GrsVxFYm
	rKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WcTxryMQc3fG1dj1uTAYX9RfXyMJQINqIdpOPSnI+Ws=;
	b=pOCGU8PZxu6PuMXtHRI9Q/09Qjctx/0S+Jj+rNmpR33/sd66rkxTegfVm1k6dDmQZp
	/uwdT7ScqqsLns+mbmqo0zf77cJHYhW9lg7TA1HGrklW7p2qzCEXqf53F71bWl1Ncce3
	Yp4taSd2vaxaee3l+62AtRdZDnOg3JmBt5LO5iUq4/BwPXC8Edky6hVrL8gkJdaIX7Au
	nvHG7LF9Jhxq8Kig34TJfmYlOJGbKdveEgsBtRjsjdtAxl91i6UO62mOpoEwpogGPn8i
	H32PzY1qf9FPZUDkd49OuUfTS6RSbJua0IjVymNvIsbRxhEwAzuGlQ5HKg4RueM2ZBPO
	uJ+Q==
X-Gm-Message-State: APjAAAWeT/UvkcPQQYufWTUC7ySQn/C75asurwOdU7DLiI9+KKQ3nC2O
	Zige+LqibFUznFlb0BtgmvfT1FJU8Fk=
X-Google-Smtp-Source: APXvYqy7BbXtjL+A96sNbNwMaqXB1mQ+IckF+Bw8xBnwQArV4siz3q4THtBzNeT3oi8M6TNFM2KH9w==
X-Received: by 2002:a17:90b:8ce:: with SMTP id
	ds14mr14012094pjb.57.1579376485726; 
	Sat, 18 Jan 2020 11:41:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id l8sm751610pjy.24.2020.01.18.11.41.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 11:41:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 11:41:21 -0800
Message-Id: <be3ba655a2780f767ef5f8177be679ca8be37ec1.1579376298.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579376298.git.raj.khem@gmail.com>
References: <cover.1579376298.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] tcf-agent: Add LCL_STOP_SERVICES for powerpc64 LE
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
X-List-Received-Date: Sat, 18 Jan 2020 19:41:25 -0000
Content-Transfer-Encoding: 8bit

This is same as PPC64 BE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index b4bd4ca63c..e0a07a9375 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -46,6 +46,7 @@ CFLAGS_append_mips = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_mips64 = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_libc-musl = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_powerpc64 = " ${LCL_STOP_SERVICES}"
+CFLAGS_append_powerpc64le = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_riscv64 = " ${LCL_STOP_SERVICES}"
 
 do_install() {
-- 
2.25.0


