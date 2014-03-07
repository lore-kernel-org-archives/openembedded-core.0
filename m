Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 145406F653
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 00:55:01 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p61so4090750wes.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 16:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=fUIgT1D5S/lEZ8hAWLqnZ8TSRDwYPOr3D6ocIyE4ank=;
	b=pXkXHrxTgd0Vqno1PTYZVXA8g9ZQubdJ4j7+vX/qmmhXVeNcJ9Nie56dNjtT6XfFn/
	LDFk6Z+n+mHtZSX73ir+fcujV2PVlaZANt0YbnAvenA74rsaPB+QKjdMKhtyfXR9E3ME
	ADhaJi/55pRH43/koBghaHr+8JQt9HAgTOruI1Mz0kbo6gVYnKCp28ZONuE6PHF4gqt8
	STc8b0U+OOrdTxErX0UxQ+pYVKqtU3Na8QszV8+3C/YWVV9QQfxDvAvqo/sDV6aErG/7
	5go1dG0vgzBf62orZxYfP5R73GvrLe9kmsuM0CAe4TbYYF2OnWXE2RTofBVMIreBzfjo
	7LTw==
X-Received: by 10.194.91.232 with SMTP id ch8mr14592495wjb.13.1394153701230;
	Thu, 06 Mar 2014 16:55:01 -0800 (PST)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginmedia.com.
	[81.110.75.141])
	by mx.google.com with ESMTPSA id q15sm905007wjw.18.2014.03.06.16.54.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Mar 2014 16:55:00 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 00:54:26 +0000
Message-Id: <1394153667-4247-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] python3: Add ptest support
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
X-List-Received-Date: Fri, 07 Mar 2014 00:55:04 -0000

This is my first attempt at doing anything ptest related so probably needs a
detailed check.

About 6 out of 350+ test suites fail, compared to 2 or 3 failing on my desktop.
I doubt we'll be able to get a perfect run out of python3 with all tests passing
but I'm not sure where or how to document that.

I'm also not sure where to document that the python3 test suites won't run with
only 256 MB of RAM allocated on the target system. 

I think enabling ptest support is still helpful so I'm sending the patch for
review.

Paul Barker (1):
  python3: Add ptest support

 meta/recipes-devtools/python/python3/run-ptest | 56 ++++++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb  | 12 ++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/run-ptest

-- 
1.9.0


