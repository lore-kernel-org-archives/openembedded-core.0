Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE1E60A83
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 01:42:49 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id gv17so2895176pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 17:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mnIrgXjOR1sflRPooqU60Hw+Ido41zWe3yGdb32wkHM=;
	b=eR97ne892QQqLjAFtLFkPMuQRMV5wTtAOFZobSAVMgAgKvRUbzjdvMkRIwzhuyOV8b
	XTO0U/LYDCPuJha3mpIor9bdz5qxXMmaBM3gXH6I1sA87y4f6VGTY3KsbAZmf+d9Iyqm
	HtrvE5d/sMtybJiSid4LeVb5kwmoxC0lbKDSconuC9SSylhATs2JQgbmd1RJYRq0yW/b
	xv2i8TB9TDN9gqUt/G6JCTIGaTPbiKE5FjSjj6b5pmJD+Zd2nuTJBJ/tH37wTSayhXQP
	VnOkm2aoqYcToYR+iG2niJGDv1zqVdjOxa57irrqRyptvCmOWiPmjM55lmj+i3DzS0MT
	56cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mnIrgXjOR1sflRPooqU60Hw+Ido41zWe3yGdb32wkHM=;
	b=im86Hv9eHTRE6E9b1MhmRDOrOtHm+roX0emaQ065hJlQD+Rk33lIx5EPio0cNteHVE
	z7ymmTuQqkBPPEnPFLoItkgOjl7P/svMbg/llKq1Ip+NqU5TpRgoc6Ch2/lyPU1qQVS1
	6j3rcNbWQ5L9c6+aA2WHm30mHF/PpSgPjHHchgeYazRsZogqQ6P+HArLDgDSMpaGfIC+
	yf7Ldmn8VBEzDIyYV0LD+nIjMn0wL3n/hQFafErsolle93rmN8gp2JPZHqlVUkkk4tIz
	RAApx7pgIymaeN+p4YGkl2RGRz5cg7OOIrO4R+uiqhnulFwxyP2RZIdPm/6/OfcA2+NK
	TqKA==
X-Gm-Message-State: APjAAAUtbrg5nV9gbxW/GRKhYLQVBDO9K/z13daSyjz7GxXcdAv/vugr
	OdzHUrLDNWNgnbhAe6vo8Ux+yoV+DZo=
X-Google-Smtp-Source: APXvYqyW+Aav7WOGi+HLvKcPwAjvy/FjkrXc80vxy2v0nm9fDQkohJgoiSKORjFibP0OscEKQkfU/Q==
X-Received: by 2002:a17:902:8215:: with SMTP id
	x21mr11845347pln.59.1583026970415; 
	Sat, 29 Feb 2020 17:42:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	hg11sm6753702pjb.14.2020.02.29.17.42.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 17:42:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 17:42:58 -0800
Message-Id: <20200301014301.805156-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Fix host contamination QA errors
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
X-List-Received-Date: Sun, 01 Mar 2020 01:42:50 -0000
Content-Transfer-Encoding: 8bit

These patches fix host-user-contaminated QA issues

Khem Raj (3):
  dbus-test: Fix QA host-contamination errors
  strace: Fix host contamination QA errors
  boost: Fix host-user-contaminated QA errors

 meta/recipes-core/dbus/dbus-test_1.12.16.bb   |  4 +--
 .../strace/0001-Evaluate-AC_PROG_LN_S.patch   | 29 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.5.bb    |  1 +
 meta/recipes-support/boost/boost.inc          |  1 +
 4 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Evaluate-AC_PROG_LN_S.patch

-- 
2.25.1


