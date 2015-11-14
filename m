Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD6A7737F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 21:35:30 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so126874776wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 13:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qD89JfFr0iR6/AVsglUNxjPAySoNaZdw2wf9SCT593c=;
	b=b98Sqb1mYzKShCaSd/dDfim9xva37owGWrmeK+CG7EBHapHVwJuHf65O7Qittz+c96
	/tA+a8vH7Cm7V9XvQqp/pohbyCLAPbSoP3XysqlRQfCKPZN/Yfbofw0opEeDVrendHRf
	tRgIGPLn/ALCF1W+7edw225SsV9qGRrHfTlnMUaHA7CJBcpDdiWldtRW7wC3RAqh/ydY
	Jr7wc9INDHeiGV8ex2q1md/MGnm4GIbjoL7BA1+o6NkvC8DBL14dTEutxxLk1+ZQ+63l
	dnoPHEakuhDLL/q9pOeSdr9UVLR8wiQsIsNCOaboKZcsyBzkDnou1WJr+l47LzRcBFqW
	jwJA==
X-Received: by 10.28.146.82 with SMTP id u79mr10336639wmd.96.1447536930902;
	Sat, 14 Nov 2015 13:35:30 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	c4sm14784681wjs.36.2015.11.14.13.35.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 13:35:30 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Nov 2015 22:35:05 +0100
Message-Id: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: [meta-oe][PATCH 0/3] runqemu improve networking
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
X-List-Received-Date: Sat, 14 Nov 2015 21:35:32 -0000

This patch series adds two features to runqemu:
- Support the emulation of more than one NIC
- Add a hostonly networking mode. This networking mode enables
  the user to implement different virtual networking environments
  such as a bridged network as discussed in #7887.

Note: Without the first patch connman fails if the virtual device
      provides more than one NIC.

@Aws Ismail: I'm using this since more than one year. Would be great
             if you could test this and provide feedback.

Adrian Freihofer (3):
  connman: fix qemu config
  runqemu: add support for multiple NICs
  runqemu: support hostonly net mode

 .../connman/connman-conf/qemuall/wired-setup       |  6 ++--
 scripts/runqemu                                    |  7 +++-
 scripts/runqemu-gen-tapdevs                        | 11 ++++---
 scripts/runqemu-ifdown                             | 33 +++++++++++--------
 scripts/runqemu-ifup                               | 38 +++++++++++++---------
 scripts/runqemu-internal                           | 21 +++++++-----
 6 files changed, 72 insertions(+), 44 deletions(-)

-- 
2.4.3


