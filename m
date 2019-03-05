Return-Path: <jdmason@kudzu.us>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4F67C420
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 22:32:45 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w4so10744445qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 14:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gbVAaWDGSfNC0xF8c2YkIWfHFUfWDawKPLuRQzGk3zY=;
	b=Y1P/J/HNoMxG51iEFcEMTBaFD965LqXozGDSMbYyl84x2jAnZZJmcavwGYdbFboTvo
	+4O7I+n/KAd2eEORgiWSYd28OwkeNn/14Z0JeRfuRjxYLi4jF0P2MmGgmpkcSB0tqgnv
	1tLS8Y4gpc7J2ZjKz56fcz2deZv0PgCTSRN7mz29h7V6HHLXLr3Jv5iXc30pTaGdSta0
	0NB0Y0THqKHAdZsA47cGaBzDkhV+sa/qcj5WPqKyqDd/fAr3/kEwAFQpPDyb/OEuwMHc
	VAFyRjt7Yf1/zllbL4oB+WSHk6+QGFs8Lvm6VkZJUYIgXf0nWWQxchNheDGXMb4jnzc4
	fljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gbVAaWDGSfNC0xF8c2YkIWfHFUfWDawKPLuRQzGk3zY=;
	b=adtoSHqVzTjP0oYuO9DZM6nJ2j2qZm3lqbwDt3qMjefclvWJjMQyq4m4OiH/N/L45C
	cZ+orawZxUGN0boevpc1ZvQKXa2C4IpVMGuop8pWIbfDcyB74PT6+n8izosUICW5h0e5
	wzzZ5uSXWCQ/8Zzyf6m65lPfhE8lS3LhHf1qBoeO5gIvijTOaupq9eVYkgJXD7vuyHt/
	9UVfE2zuzNoiyvfEolMBJV7GN5e6Uiv0i1AjoTVxKnu9IPPO9+YqVa4WTdBkpw90wJ/Y
	TvFbuczHM9w13noBVTMx0fccY0wJQuiwoKVqUUu42llmqefdJSuvFBrsdDxvnH82GXS9
	zU4A==
X-Gm-Message-State: APjAAAUSIr4YFuINcljz4YjLm+2jtBwGTT4/rF3jATClR8voUJZmJFQK
	KmgZOWA1hS2X8uel9lHPZ7MZWRxRJHx+sg==
X-Google-Smtp-Source: APXvYqykWvGmOa3rbBikZrpFBbbeOA3iJ6H7eUYwd8md4Wueth+vTxFbiLWDMfrtNe/wMyxwkN1cKQ==
X-Received: by 2002:aed:22c2:: with SMTP id q2mr3433779qtc.289.1551825166115; 
	Tue, 05 Mar 2019 14:32:46 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	c19sm5668109qkg.88.2019.03.05.14.32.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Mar 2019 14:32:20 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Tue, 05 Mar 2019 17:32:19 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 17:32:16 -0500
Message-Id: <20190305223219.30812-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
Subject: [PATCH v2 0/3] qemuarm: new machine and graphics
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
X-List-Received-Date: Tue, 05 Mar 2019 22:32:45 -0000

v2 fixes the issues from the RFC.  Specifically, fix the qemuarm64 error
in testimage (and make a similar change in qemuarma15).

The kernel-config changes were already pulled in.  So this series should
"just work".

However, this series lacks the fix mentioned in
https://lists.yoctoproject.org/pipermail/linux-yocto/2019-February/007585.html
as I was unable to get it working.  This can be added as a follow-on
patch.

Thanks,
Jon

Jon Mason (3):
  qemuarm64: config cleanups
  qemuarm64: Add graphics support
  qemuarma15: ARM A15 Support

 meta/conf/machine/qemuarm64.conf              | 17 +++++++---
 meta/conf/machine/qemuarma15.conf             | 33 +++++++++++++++++++
 .../linux/linux-yocto-rt_4.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
 5 files changed, 48 insertions(+), 8 deletions(-)
 create mode 100644 meta/conf/machine/qemuarma15.conf

-- 
2.17.2


