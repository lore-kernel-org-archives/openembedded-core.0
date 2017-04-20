Return-Path: <avery.brian@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 65D9F7197A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 17:37:58 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id j201so60409576oih.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tD3f4VGrCLcdrJB9TC2phyCpzyU/8fCgiNX2vmoq1kk=;
	b=oYXnZfPnB0mrwV5GiZC0dE2v1cUiY04f73LixqPR+3yQB3pi3NdZe21IrfErVIcJD+
	eMSkInJk31JKfM3eKqxBHa0Ruknsyc6y86kMvHy0Ly9cm6kIr8M/3mIzUQ2teub9suaC
	Pr5SnZWrEJ3swwKrW69gFyiuhg1eMmZ69VQpmJqVw5+kBIamxGO6IfbFy4BtWGY4TlG3
	A4E8VaRfLfQgAsHPVMdTfwMzAHxAXNTgbBghLRSATUV6Uch2wMpO8JSX5FAYGvyzT6ME
	pcufm4UguQUwpaP34Ig6nhjUSO23r7RbHu4LWBjtbLXpIRjot6y2fBpfTU6Naq+DChb7
	8KpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tD3f4VGrCLcdrJB9TC2phyCpzyU/8fCgiNX2vmoq1kk=;
	b=Cj49Q+F5dVI3zlaHGOETfiaRZZC0ePGXQzBVL3vMiy+ilW8hYs97wlWwcJxvjJTze0
	xIl4WvyXYGsROIchTj73ucPRJxm1vOrv3yYDm9Z4oEngBXUQGjvcwu7rkzpMdr7HLdz8
	FepfddiIwgVGo7E5V8kRCZVJ79GrdKpmTVuB7ouI8yWsgGekzsRxptUlL6iWSDeBXC7K
	y/JRZuW+eAQjgfDiXUx4SS7vv7VHkas2Mcncn+AGdHzklrwHWEjbuY1eMuReqAv0BuOd
	VWIv1J0Zg0x8UP+mFLrNvdphrAuRJ8USTbbKO4hxofGma08yBzNPrei4B1vEVbSrrTq5
	wMTQ==
X-Gm-Message-State: AN3rC/6FSK2OF8W8KgzwHvfSw+W3Dv9JOX4aehAc21KCOHJh9SBTnsid
	hega1pwbvXmyTA==
X-Received: by 10.99.8.67 with SMTP id 64mr8790547pgi.220.1492709880276;
	Thu, 20 Apr 2017 10:38:00 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	r77sm11650635pfe.105.2017.04.20.10.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Apr 2017 10:37:59 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
X-Google-Original-From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 10:38:09 -0700
Message-Id: <cover.1492709567.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] testimage: Add missing dependency
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
X-List-Received-Date: Thu, 20 Apr 2017 17:38:00 -0000

As part of RSS, qemu-native-helper got an additional task: "addto_recipe_sysroot".
This task is usually run as part of an image build. In some use cases like downloading
image artefacts and then running testimage, it can be skipped. This adds the dependency explicitly.

I also added an error message that catches running testimage before creating or downloading the
images.

-brian


The following changes since commit 55a53f53263ff4bf7bd6d0c454c464e595e11e4c:

  build-appliance-image: Update to master head revision (2017-04-20 08:16:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/testimage/11375_2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/testimage/11375_2

brian avery (1):
  testimage.bbclass: add additional dependency

 meta/classes/testimage.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--
1.9.1

