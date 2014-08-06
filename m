Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 918CB70A02
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:07:09 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id rd3so3874389pab.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 12:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a3faGyb3Vbs4dIsHVPX3BoGNx/O7AtGIqdtlJVB6ME8=;
	b=kMs7kXKBwZLbeaT8jq7spapK/vK97d7eG+c6mnCc8F4wDUXZcJklLsIdgqIkEYC/Q8
	lO2vRRrffkuuU2LUwk62iwPIdtllEAuRgDlq7mSS6QDw9LmbCMvE3Z4qApGrzZiqMUrw
	LRmZ5nyzuN0oYDeJO636sh0qqfMwgH+m1Tu1INI9VOMTduQ0+u4aAPgF9XY0R3AIbwKy
	otMArSqc/fu4KFjr75GRGuthgvPzclGyeftw2zGXB6mjvCNAMTiZVJTb32ItFWezmwzO
	RYF785m4I/5NBuS2VGDemPb8SHP6OozxyJl2VbalGceEGr2pXUgWmNVwybYQPeZ/6HI1
	s09A==
X-Gm-Message-State: ALoCoQnBgBzFkuGyPAEVb4aHA/h0JqacCwbrax9BpMeadhq4HjejyfpMRjb8OQ4qQOrHicBXZRYj
X-Received: by 10.68.87.101 with SMTP id w5mr13130390pbz.130.1407352030691;
	Wed, 06 Aug 2014 12:07:10 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id b4sm2929766pdm.14.2014.08.06.12.07.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Aug 2014 12:07:10 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 12:07:05 -0700
Message-Id: <1407352027-29680-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] 0/2] Update tzcode and data to 2014f
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
X-List-Received-Date: Wed, 06 Aug 2014 19:07:13 -0000


http://mm.icann.org/pipermail/tz-announce/2014-August/000023.html


Armin Kuster (2):
  tzcode: update to 2014f
  tzdata: update to 2014f

 meta/recipes-extended/tzcode/tzcode-native_2014e.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2014f.bb | 11 +++++++++++
 meta/recipes-extended/tzdata/tzdata.inc             |  2 +-
 meta/recipes-extended/tzdata/tzdata_2014e.bb        |  6 ------
 meta/recipes-extended/tzdata/tzdata_2014f.bb        |  6 ++++++
 5 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014e.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014f.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014e.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014f.bb

-- 
1.9.1


