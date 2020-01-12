Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7C26B7F8B6
	for <openembedded-core@openembedded.org>;
	Sun, 12 Jan 2020 06:36:37 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 2so3249298pfg.12
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 22:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1uv0pRZRRzGkLeLmRBRVSgzmq0HSvsM34XHFcu2bJOg=;
	b=lpRAl2p82TKwEs5PK0hzcGx27glFAPXskugL1tnPv9TWhBo5drkZYWH9N2u2GOYwi6
	WwpN1RlV4ED8Jrv0k3/Rln0FozBW9B27AcfM4NytGdGzHFDAZsIEx8JRQTY+tQ2X4OFz
	esuqzceK0K8+DVdWBIq1gHpkgUwVnC9LSu1mD9U9ARnBBxyxDcdIrZxCRZhPSxlBCg0t
	QAYIaL9BCDAxcWQmJQ5bFHoVpEoaFf9Gtol7PG4WTBW9avaw04uQOJnHzWgB1F/CpHrv
	0TZzBD0+Lr4Jc8PIs5sz/dJudJUhJtHIyJCbzZTVmx89Z99wnsAfpMTacFfpOq7auCxC
	d3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1uv0pRZRRzGkLeLmRBRVSgzmq0HSvsM34XHFcu2bJOg=;
	b=RdwtTKYfdBjwcyjRmLhruHO5NS9n8AkrY5v6tW5eArLcWiBBEegCtlMbO/ln4y0Vr6
	OMn9uHjvU9Dvwk4wbkSn0lcChsJ0uVHLnno4TAweiM6/lUkCn6yKEavTWRupZJGkRNQT
	1LThEQIKQaB7hKRoMo+hlLFMSUIsaYhDJ5y0dbluKKQQXgOq3Bm3+2SAkug8HQSsmrwh
	msrRnR2e+2E9xHM4vV+hL7xPTB3HJKUaI6iWz6v1XR/yV6r4tPegMGlIgrbKjI7Z0hZP
	CM4LsUeGhJlG4EpMtJLo/FHJ+Qoq7K/15goGb8gk7lGgfWJHGOt4zHGk0Cw5lZwbksHn
	8XCw==
X-Gm-Message-State: APjAAAX0Xo8V2SVUNYuLIDhk8JTOUmrqGIIIuY0ss7eAGd6YBoaIu1Ky
	PCNbikh9jO2XjVn3qBRripHGf8AN
X-Google-Smtp-Source: APXvYqyJNLRapnVlCp6CcXkCZHHyI6i48IrIdcLezUPX1bJpJYOz4AqAFX4rEQ/1BrfdBBc91xbCBQ==
X-Received: by 2002:a62:3086:: with SMTP id w128mr13485530pfw.58.1578810998477;
	Sat, 11 Jan 2020 22:36:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:3849:7200:d754:59fc])
	by smtp.gmail.com with ESMTPSA id
	136sm8437493pgg.74.2020.01.11.22.36.37
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 22:36:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sat, 11 Jan 2020 22:36:33 -0800
Message-Id: <20200112063633.11144-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200112063633.11144-1-akuster808@gmail.com>
References: <20200112063633.11144-1-akuster808@gmail.com>
Subject: [warror][PATCH 4/4] stress: update SRC_URI
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
X-List-Received-Date: Sun, 12 Jan 2020 06:36:37 -0000

Fixes:
WARNING: stress-1.0.4-r0 do_fetch: Failed to fetch URL http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz, attempting MIRRORS if available

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/stress/stress_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
index e9179d3e19..42046d5bf4 100644
--- a/meta/recipes-extended/stress/stress_1.0.4.bb
+++ b/meta/recipes-extended/stress/stress_1.0.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://people.seas.harvard.edu/~apw/${BPN}/${BP}.tar.gz \
+SRC_URI = "https://fossies.org/linux/privat/${BP}.tar.gz \
            file://texinfo.patch \
            "
 
-- 
2.17.1


