Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A68F36AE73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:17:37 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id n12so1195752wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 18:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7I9PhE4h4CHdyUwUBw9L6zXY0CYyA21xfV2GCKY60IY=;
	b=l31naaW02ypiFo/oeBS3LBcKV04dE5obdb+fsIBiVzKjNZocanpAvKQuOXGLxnjFVj
	kYv0MVs5f274YY8LUiiratztJVYKo6F6AOOeCxdyk3TL/GtoNMqNyR8kXP9MfmKy50G9
	KH4vIocBtwGaGILRYguuQaPRjlXgTYaBb1M0r5jcCoYg5WxIwgh6caMp182OwO/lccAT
	E9ssevDpZQ1ccwLEDPE9WcrHDX3cvTd3vnnY2jSj7UVe6Q+zwRmgIQyo+JVJSge/GFdA
	DbreTNuG8MMtcxvLX3FFV3yQEZFFYNBlW8/enqQnj1r6XTlCqGmU0JbQMFdLNnHCL2v3
	hwzw==
X-Received: by 10.180.39.2 with SMTP id l2mr11941450wik.47.1389752257871;
	Tue, 14 Jan 2014 18:17:37 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id gd5sm26004632wic.0.2014.01.14.18.17.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jan 2014 18:17:37 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 02:17:23 +0000
Message-Id: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH 0/3] Change update-alternatives provider
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
X-List-Received-Date: Wed, 15 Jan 2014 02:17:38 -0000

The update-alternatives script has been copied from opkg to opkg-utils so the
openembedded recipe for opkg-utils is updated accordingly. Changing the default
provider of update-alternatives to opkg-utils allows dependencies to be added to
the opkg recipe without causing circular dependency loops. This series partially
solves Yocto Project issue 4836.

Tested on Raspberry Pi hardware both with and without "gpg" added to
PACKAGECONFIG for opkg.

Paul Barker (3):
  opkg-utils: Upgrade to latest git HEAD
  default-providers: Change update-alternatives provider to opkg-utils
  opkg: No longer PROVIDES update-alternatives

 meta/conf/distro/include/default-providers.inc     |  6 +++---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  7 ++++++-
 meta/recipes-devtools/opkg/opkg.inc                | 12 +++---------
 3 files changed, 12 insertions(+), 13 deletions(-)

-- 
1.8.5.2


