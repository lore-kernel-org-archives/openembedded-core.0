Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6693A6C9B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 17:59:39 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hi8so2628820wib.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 09:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=BGQpQtu+VGaBxb0+L+tNpfiQ+0U76k4TcmDtIDsMzMQ=;
	b=v9orJTjvsngRS9PV1wN0sURtggA/Aw1IBnIPJtHJ7bi5ZUlCcfVMm3ieZOny186jQi
	tdqjnFYLgqTXZADYTHcbTDGYJUshmz6WSK7KxEtk9V7qwa1Ywi00/FJT0bnGMWOkdoSV
	KNM4OmK+c3uz2X6p4X8kL78PW0CU8wux5mt5idr5PLB3dg4H44ntr69HIU1yolX4ma5b
	vPi4HeGInSeVJQBL/c8y9HLvvCaGPLMMRu3PlGxd6NzbyEnqmoQTcEoFsaj+Mdnh9DiV
	W0xp9iS0LJeCkBpW2jy+O/qP3ddq8Xvtq468eR2+hSQ/PhHc0UIOo29tl7CNjUIylFaN
	n1pQ==
X-Received: by 10.181.13.112 with SMTP id ex16mr9307906wid.23.1389895179466;
	Thu, 16 Jan 2014 09:59:39 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ua8sm6926729wjc.4.2014.01.16.09.59.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jan 2014 09:59:38 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 17:59:23 +0000
Message-Id: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH v2 0/3] Change update-alternatives provider
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
X-List-Received-Date: Thu, 16 Jan 2014 17:59:39 -0000

The update-alternatives script has been copied from opkg to opkg-utils so the
openembedded recipe for opkg-utils is updated accordingly. Changing the default
provider of update-alternatives to opkg-utils allows dependencies to be added to
the opkg recipe without causing circular dependency loops. This series partially
solves Yocto Project issue 4836.

Changes in v2:

    - Reordered variables in opkg-utils recipe
    - Added nativesdk class to opkg-utils

Paul Barker (3):
  opkg-utils: Upgrade to latest git HEAD
  default-providers: Change update-alternatives provider to opkg-utils
  opkg: No longer PROVIDES update-alternatives

 meta/conf/distro/include/default-providers.inc     |  6 +++---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  9 +++++++--
 meta/recipes-devtools/opkg/opkg.inc                | 12 +++---------
 3 files changed, 13 insertions(+), 14 deletions(-)

-- 
1.8.5.2


