Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E264E75322
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 11:02:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t11-v6so2107025wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ozcu8B3PkG6VmDpbDPfvJ3idhwyEENbe273pwqoYHHk=;
	b=YtIJ1KQZMXabcm+3XmoS06Ankj3pL2LWVtHvk+U0LlAGOGdtOWMRkyEI8etOrKzw6A
	yhrRAKJoziLh3txGYqUou7vujEVgw5NI3EdhDL2sY/cEb2aSpcdZCc9lXYsZkBe8sq7G
	8zc5/qAzRHSeAYfHzoLEVceQ4Vn8XQlr2z8lcY/WxRG9Il8tU3ugPYC+Q7KIV05kjSKk
	HIaYutJXpDwdGLBGXZd48PbfNl5wdSnRsbbWLi94MzLny+YigUoHNe2cdRnvq8Lw6vU0
	LR9H6w+XOrE9ti3agE5p49KBR8NHskOsaHbVdo0GmUR4EK2fmbFCpwVqD+ZPtRHlmpG8
	MOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ozcu8B3PkG6VmDpbDPfvJ3idhwyEENbe273pwqoYHHk=;
	b=fjEmxYZslkWH5dqWDNL/gOiF0RIbNIBfBAOOTL+6EIvMeUVBVT6YaS8vxJDuGRmatO
	1OpQYCJdsfFA96Lpw+McjAULt7mmOclR1nbHU3ER1fTSNmPc9s82b1ctoLl5wF1oembj
	mOhkDicK5GHJWhhrtuA/+FgUVD+Huv5ixZlfVTKH3/W3um7aHTouWgKw74mEhLIBYnKO
	XXhKyp5XMkv+ub/ys5RUwB8OrvI5DMPPyZx/faFcWgbvAsEuBx+8TCgyaoVGGbb46RLR
	s38QZTDJIldkpqS0WtYsqp4GHATCPxuVpIYQdqDUkxBTKmpmVlqlmMwYvRIK7zujN8IC
	GzkQ==
X-Gm-Message-State: ALKqPwf6g5t6mn4G5tMUzhNwzm7FwYeCf4c+on4IbLPSL/qsYNY5kRFZ
	aMZDwimA0jo1hEQ7tyDdQPSW2R8l
X-Google-Smtp-Source: AB8JxZrGUpClW4LqC0ZMQtZOfZf4jsMx2b0YctmRKWfysOTkLALiWxcSJZzZBhSoT3T/Yf/r0Xu8GQ==
X-Received: by 2002:a1c:1b4d:: with SMTP id
	b74-v6mr1521819wmb.71.1526036555099; 
	Fri, 11 May 2018 04:02:35 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l69-v6sm1617814wmb.6.2018.05.11.04.02.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 04:02:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 12:02:30 +0100
Message-Id: <20180511110230.9867-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180511110230.9867-1-ross.burton@intel.com>
References: <20180511110230.9867-1-ross.burton@intel.com>
Subject: [PATCH 2/2] distcc: disable upstream checking for now
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
X-List-Received-Date: Fri, 11 May 2018 11:02:35 -0000

Whilst we're using a fork of the upstream repository, disable upstream checking.
Once we upgrade to 3.3 this can be removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index ee077495d5f..2b19d69000d 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -17,6 +17,9 @@ SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
 
 SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
 
+# Because we're using a fork currently, upstream checks don't work
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
-- 
2.11.0


