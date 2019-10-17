Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0804E7F54D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 11:29:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z9so1906528wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 04:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3wf9yRlikQqeTwGMG1DMdbMogkMyJ9dxb/2vuEJ7agM=;
	b=SbQKoCHuiBYYPfBlw4LsRvrG5D3Wl/ljl5cDhBZN1B5t5vXLLnAhjzGcYJnXEpQXsA
	1euJzsebvuNnh959pLrkf3fsQViR836KmMj4Y+SYO3oV/8p2YExWbEorP0LHpRgD1b0w
	SrQshYbYlnhpiohcczVIDKGStwBuIQSPyWy/8lxengqHmu0uc/XAYc9UnmAyqmN+AN99
	F9sjRiMqyAHk4EaCVarxjs0P8tQbcAl+qU4tXxaBO5O0jUsm8mkOL09IyHEb0JCLMCAk
	LKMQnfxOhJwGExSwOO9hDnYK4YDJ00WYOvzuLdVB/1a2LrHbw+l1NUm2El5CYAf5IUJn
	Vs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3wf9yRlikQqeTwGMG1DMdbMogkMyJ9dxb/2vuEJ7agM=;
	b=kpl8SWgx5hAANh1gPnFukBxq/97Yp4M3Tmtmu0CSYAEbbyj171QDCalS/Rpkg3OXSf
	6VDyKz7ciTgJYUWTtt1td3XSai9PoYEMBd506/aUmOJyYqhBSFOQVLhTX1Uk654sB/GK
	yR9p+0/BJjbvoRqZjNh/zXyucsJWaSmaD4i8+8hNtkrkKQIV+82oUR9yMg355+hMyv2y
	xjxGgpYEuLojKkRpz92X0l4umT/LxkwYfPV5D1Bp+7glhwXZPm+NoK4vBoAufm9SLUiq
	916D5cHaB1fGEZgXL6ZPlajdj4DEF2ph52mBGAY9/QBh7hC6OY1rJkXdYYdzPYpfS9RV
	LvVA==
X-Gm-Message-State: APjAAAWXGmXnM152/qX9OPNaLkDTq7HzURGzic61Z9hwzMh3Oj6O3h47
	VssQpxyeHsQAlMXZY8FV303NEqKs5vg=
X-Google-Smtp-Source: APXvYqzGXnTcXIkasFGEXM4CoQwgVSuu8vGzgsvYO9R9VYy4j/xvml75YPKrMyc9vgnQbPkLO4G80g==
X-Received: by 2002:adf:a50b:: with SMTP id i11mr2720052wrb.308.1571311793622; 
	Thu, 17 Oct 2019 04:29:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r2sm1907514wrm.3.2019.10.17.04.29.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 04:29:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2019 12:29:45 +0100
Message-Id: <20191017112945.345-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017112945.345-1-ross.burton@intel.com>
References: <20191017112945.345-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gawk: add PACKAGECONFIG for readline
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
X-List-Received-Date: Thu, 17 Oct 2019 11:29:53 -0000
Content-Transfer-Encoding: 8bit

Add a PACKAGECONFIG so that readline can be disabled if desired.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/gawk/gawk_5.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.0.1.bb b/meta/recipes-extended/gawk/gawk_5.0.1.bb
index b3eb39e4eda..eaba6c78eda 100644
--- a/meta/recipes-extended/gawk/gawk_5.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.0.1.bb
@@ -11,8 +11,8 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS += "readline"
-
+PACKAGECONFIG ??= "readline"
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
-- 
2.20.1


