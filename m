Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7EDDC6B4C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 21:57:12 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so3425275lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ky2Znd1PA+ZdjblF+Fr0kkeMt8AN2k7IEcmSpBSzuVA=;
	b=HgSEaOB2N2tgjNSM5zRdUYMJ2GNKnhlem+fDgPiWruoA9ms7wURxniENXzWdmQ+mVr
	VG54aZjYbHEWFPnG294qzjDuiSn9iuIpKdFf26Jd+2rpZYSCGsnERS4a9ehphsW3c3tO
	iJ05CR8IEFAaeN2qOGAxaAR220tZ37ua8PMuwb+hvoF+7kKxrUU9/pSFPKb3AT7QrV9+
	vGuAVQ/D16Z8yQHZ91HMmOSTBFk5Q8No0rbHopq04q8d/g5oN18LwWE2HDmBDOnPzy6N
	LTDIj/4bS7+UofJFGaP9pyHpnYADMMoqg27mqtHaB24OxtAZW6SLL+QZ05Ge1HIBWv4u
	/v+A==
X-Gm-Message-State: ALoCoQmAfkkBURlHOQtgQD9Hb/lJY5CmrqPwgRez+PhbYjaw8Mu2NpTcdqfdPZoQ5S6vI7BIT+eH
X-Received: by 10.152.44.133 with SMTP id e5mr2204948lam.37.1389995832543;
	Fri, 17 Jan 2014 13:57:12 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id bl6sm7612764lbb.5.2014.01.17.13.57.11
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 Jan 2014 13:57:12 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 23:56:57 +0200
Message-Id: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/7] Update LTP to 20140115 release
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
X-List-Received-Date: Fri, 17 Jan 2014 21:57:13 -0000

This patchset update LTP to latest release and fix various style, cross-compilation issues.

Fathi Boudra (7):
  rename recipe to ltp_20140115.bb
  Fix style using oe-stylize (no changes in the content of the recipe
    itself)
  drop do_unpack_append/do_extract_tarball
  Update SRC_REV to LTP 20140115 release
  Update ffsb-6.0-rc2 license file path
  Fix comment to refer to oe-core instead of poky
  Fix ffsb ftbfs on arm64 and cross-compiled environment

 meta/recipes-extended/ltp/ltp/ffsb-arm64.patch | 1412 ++++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130904.bb      |   78 --
 meta/recipes-extended/ltp/ltp_20140115.bb      |   75 ++
 3 files changed, 1487 insertions(+), 78 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/ffsb-arm64.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp_20130904.bb
 create mode 100644 meta/recipes-extended/ltp/ltp_20140115.bb

-- 
1.8.1.2


