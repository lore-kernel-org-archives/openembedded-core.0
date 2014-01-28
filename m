Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 91FEA60CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 12:41:58 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z5so269739lbh.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 04:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1x9nrMX6UsCxfXW9lCj+xPnck7NOBSOcedmrA8S+dl4=;
	b=RfOeuJbTNpZwE0wcWGLiwyf93m3Mg9SHd2j60f2hazoIclqXTCuKQ2uz8S/Y0bp0QR
	/jnLPFSPl2mv49ehC09ijNrC9JGIufYKBFKs4SjKsEeh4PqKiAbkIktuReL0uU3Ullsb
	NXWBuuyZe743gcpp9E5DH+L63Vw7iLpgaRp5LP7wI1VR4af5uf2w3ml1wggM88KBVV/y
	LIQBMgaXtDkhN6ecIKFHN/yFYM0ktSRbc9b37kJiTgrLJc6Udd243kszeZl1B5Xf7Ljg
	PXwbzg6H2rg9hmLHuomO5Cych3oto+4ORzvrDeUlXsI96Cr8+qNh5yKC6rXW1Mxro59i
	NvHw==
X-Gm-Message-State: ALoCoQniOkSiWSG0OXoysYPwnMga1716Fr3Q+CpkwYbdtFcqJYHMh1mMZwigNqzWKj2SnOnN5/EB
X-Received: by 10.152.4.74 with SMTP id i10mr91120lai.58.1390912918829;
	Tue, 28 Jan 2014 04:41:58 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	mx3sm16345665lbc.14.2014.01.28.04.41.57 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Jan 2014 04:41:58 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 14:41:48 +0200
Message-Id: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCHv3 0/6] ltp: update 20140115 release
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
X-List-Received-Date: Tue, 28 Jan 2014 12:41:59 -0000

This patchset update LTP to latest release and fix various style, cross-compilation issues.

Fathi Boudra (6):
  ltp: update SRC_REV to LTP 20140115 release
  ltp: fix style using oe-stylize (no changes in the content of the
    recipe itself)
  ltp: drop do_unpack_append/do_extract_tarball
  ltp: update ffsb-6.0-rc2 license file path
  ltp: fix comment to refer to oe-core instead of poky
  ltp: fix ffsb ftbfs on cross-compiled environment

 .../ltp/ltp/ffsb-remove-hardcoded-configure.patch  | 15 +++++
 meta/recipes-extended/ltp/ltp_20130904.bb          | 78 ----------------------
 meta/recipes-extended/ltp/ltp_20140115.bb          | 75 +++++++++++++++++++++
 3 files changed, 90 insertions(+), 78 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp_20130904.bb
 create mode 100644 meta/recipes-extended/ltp/ltp_20140115.bb

-- 
1.8.1.2


