Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 631EB6067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:56:56 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id qe5so11709797igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DSlqL4fX/OzafaYZnPqo4yUSLQv7tmCQn16fMc6plxE=;
	b=CkcEJ51bwQeGG98cX6C1EGzvv9GkMJSBpFx4jrOSoqx83R5RblzajP5pykGVN1DoZm
	JIgAeGb77ldY469SYLKtLCbvB4kolLsLMdTLbMcELMaUAeUCp+KVQ6ZnbNKGS6dBYMT4
	s1vif4ZPObkNo/vVG7WtysQ0HR8A2JtZ56zq9wsZaBFa2piIv6zngKZvDHilhDY805JH
	7M4CRcsPDJD0hVyTx1N+Rts5gtos0DUjcyNCMvxCWn0B42Sy3zFElfm4TjgSftDxYhgu
	isddZIqMLZ9i3LFI6HjQlPHw1pGjcjKxMbde0QTK1QIso3WgUlTgQUY5f4XRQuxYVK6W
	YGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DSlqL4fX/OzafaYZnPqo4yUSLQv7tmCQn16fMc6plxE=;
	b=dru4IX/wSaUdYvjeB+DTV6mv3JwUXmlhxebhJnfyy7uqKJSuPHJfL/Uvh9CvXfyOc5
	P1fFrhRfBlb8SPYlYDIjWmRU9m+oeYNEWL2f2ySQVDABgHIewbmsMQbA2qplQoDA6wdO
	DzYrXgB4YOj2sh9093ZtrtSfbNPMUEWee3hKTuffQl+bRg9xhtugGpPIulGtP5MFvuf1
	kEHPwNmRyjPXdUayTBiQ+DCS8btZtmIpBOO3iAS4Hl/6FwBgC02693TYqbJVhC+PCUYW
	LVx5sm2htTNOUigG/yVXLiFJciPWdi6MBd9DXFMLq/0IwJCmrnl3G+jim6QK5ZEhKfPV
	HFaw==
X-Gm-Message-State: AOPr4FX636krbCEpSl2NheiNPHZk+Ub/xzuN4Y/NvrYSCv9DbS5PlXrykwDy1TdqN2XUrFGn
X-Received: by 10.50.224.148 with SMTP id rc20mr2958176igc.39.1463158617179;
	Fri, 13 May 2016 09:56:57 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DAE6.dip0.t-ipconnect.de.
	[93.232.218.230]) by smtp.gmail.com with ESMTPSA id
	z138sm1286070itc.2.2016.05.13.09.56.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:56:56 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 18:56:51 +0200
Message-Id: <cover.1463158480.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] fixes for combo-layer update history mode
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
X-List-Received-Date: Fri, 13 May 2016 16:56:58 -0000

The first fix is urgent: the default mode was accidentally changed
from the traditional "apply patches" to "import the history".

The second fix is less urgent but still useful for those who
actually use the new mode.

The following changes since commit fcaaabb401fffcda4db9a7d1f927a2a404e4776d:

  gcc-runtime, libgcc: Symlink c++ header and startup files in target_triplet for SDK use (2016-05-13 13:40:53 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core combo-layer-history-fixes
  https://github.com/pohly/openembedded-core/tree/combo-layer-history-fixes

Patrick Ohly (2):
  combo-layer: fix default "update" mode
  combo-layer: avoid too long command lines in update with history

 scripts/combo-layer | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

-- 
2.1.4


