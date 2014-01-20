Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id A80116CD4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:40:23 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id ec20so5403205lab.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g9AUVKrNJGaRJOe/o5c70f8rWGWTwGa/s/4Hxvgysvg=;
	b=LgadM14kMVl1vP0UcmOZmRO0nVo7Xb8wtJzN58xuPgFCeXOIpQ7mCIx/uQfK4AiOeN
	qgguUseqgcUbUf1dV17MfrTWeXOp/gwE957At5UVcsm56R41AbO+rfEgK9CO3bY6AeBP
	6KLq2FTycDlZD6iX/nqoxvw1U3wWqOP4hv3Y5T29hk26RqhrH0TLfGnVSjor9APgxye/
	ibOqZjLdzY4YmlAuDCkQSx15U+fr58+/1Rqiy3A4+hTso0L+SFbluX0T3Cl+34YToECy
	t1qQ7NDa9TwFGF4RQEapDHdnYaCzRjD0DJ3eLSpv5bRIG/KSKWj5FI0gjGTEup4eauEQ
	O38g==
X-Gm-Message-State: ALoCoQkEr8GpoQFx9ezZbuLhekpAQkJIM1LJZTr8mHg/db+fvxRyX0qs9uftkAZqh0g8hid8zIjI
X-Received: by 10.112.141.225 with SMTP id rr1mr328948lbb.59.1390218022668;
	Mon, 20 Jan 2014 03:40:22 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id gi5sm609509lbc.4.2014.01.20.03.40.21
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 03:40:21 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 13:40:10 +0200
Message-Id: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCHv2 0/7] ltp: update 20140115 release
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
X-List-Received-Date: Mon, 20 Jan 2014 11:40:24 -0000

This patchset update LTP to latest release and fix various style, cross-compilation issues.

Fathi Boudra (7):
  rename recipe to ltp_20140115.bb
  Fix style using oe-stylize (no changes in the content of the recipe
    itself)
  drop do_unpack_append/do_extract_tarball
  Update SRC_REV to LTP 20140115 release
  Update ffsb-6.0-rc2 license file path
  Fix comment to refer to oe-core instead of poky
  Fix ffsb ftbfs on cross-compiled environment

 .../ltp/ltp/ffsb-remove-hardcoded-configure.patch  | 15 +++++
 meta/recipes-extended/ltp/ltp_20130904.bb          | 78 ----------------------
 meta/recipes-extended/ltp/ltp_20140115.bb          | 75 +++++++++++++++++++++
 3 files changed, 90 insertions(+), 78 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp_20130904.bb
 create mode 100644 meta/recipes-extended/ltp/ltp_20140115.bb

-- 
1.8.1.2


