Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC6D65D31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 22:09:22 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id uy5so3400612obc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 15:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o4rixQSMgf5FVd/UVawxEgiLZRoav9TOLv3VBOXHyoo=;
	b=lYMiyqsjFlhOkF4GtIzbLyOYDAVA9WNnA43MOU9InjwVuwdeAVpNvCMcPBWaEXXwy/
	C4hWs2xmqydZvHuCB2+5vyodP11MwNMZG6P6OrCZyb/NmhTz9C/+iUTvvxBR9Jl8HLjk
	2+IxEhyc3BDoqKwE3GphXDWzF7CJCI1soX9H4fWTV1vibN0EZvYJ+FXX9CBPujDEluGu
	yxcXORnhzao70vZL0M3dt15M9DBFWfsPcSVGuQ+saaBDNJaiLOzUBdqfClInh1lBTv8i
	XBVLn/1agjMxzMFvo8oeNY5AXfSqPZdDs3/YX1iEeEkFwNSqH3vlAO9wTYaxW3FJnfG7
	JdOA==
X-Gm-Message-State: ALoCoQn2eEiCP0qr8NB7LiKJZ81W3yUQA+rMh5Fyqt0by2M6I5ZRj985XRRZPI7k8paynpp44HkI
X-Received: by 10.60.125.195 with SMTP id ms3mr3669861oeb.3.1398377363400;
	Thu, 24 Apr 2014 15:09:23 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114]) by mx.google.com with ESMTPSA id
	qh7sm11198194obc.13.2014.04.24.15.09.22 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 15:09:22 -0700 (PDT)
From: gary.robertson@linaro.org
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2014 17:09:04 -0500
Message-Id: <1398377346-19557-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org, clark.williams@gmail.com
Subject: [PATCH V3 0/1] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Thu, 24 Apr 2014 22:09:23 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

 Okay - let't try this again... unfortunately learning how git send-email options work via live emails... buggered the subject lines because I didn't realize '--compose' would create a separate cover letter email :(

In response to your helpful comments re. my original patch email, I have:
   - included contents from the initial cover letter into the patch header and
   - removed the obsoleted patch files from the recipe metadata.

Hopefully the revised patch which follows is acceptable.
Thanks for your forbearance.

Gary Robertson

Anders Roxell (1):
  rt-tests: bump version 0.87 => 0.89

 ...1-rt-tests-Allow-for-user-specified-PYLIB.patch |   35 ----------
 ...02-rt-tests-Break-out-install_hwlatdetect.patch |   68 --------------------
 .../files/added-missing-dependencies.patch         |   50 --------------
 meta/recipes-rt/rt-tests/rt-tests.inc              |    7 +-
 .../{rt-tests_0.87.bb => rt-tests_0.89.bb}         |    0
 5 files changed, 2 insertions(+), 158 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
 rename meta/recipes-rt/rt-tests/{rt-tests_0.87.bb => rt-tests_0.89.bb} (100%)

-- 
1.7.9.5


