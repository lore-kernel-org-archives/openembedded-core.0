Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id D0ED67CECE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 22:14:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v25so11610334qto.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 14:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YFTv+EA3SUwpGURnTSDudChCUIBok5TDCrsqDc3hreY=;
	b=DUKlUlaSxF5zaDkwq2uy0LW/OMcFOVIkC1lIw+JGWXnHrkKYfbx+dJc8+v2mgukpIX
	0FaYDpysGBt2gCOn53wyz4O2PZ7Tq4JUeQnZe86pz1hnA8pTs3FIL0l2kmuuoAN5SGEk
	hIpcaMNEKkD5vK4kI9SJE6Qyr5o2OnsBvOhjK1gXDf7zSPmG1TOZnnqg2XmLMCm0tyum
	56WkDp09OQBKVqGmuJzhrVbxSOcRtcoYme0iINk3yL6jq8FFGMnbGptwAe3MakKMPX2d
	y1d3pbqEDauGtkgU6vjBHV9MMEf58aLklbHqp/2Wf8D1ONNrkMQ+8bpsgUR+2xCLXDLD
	54TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YFTv+EA3SUwpGURnTSDudChCUIBok5TDCrsqDc3hreY=;
	b=dHdTs1HBt4dtObCOC+iC0OXu8zBWhP/GuEoZvP6dUF9RvX7G8Mi1L4ltNf01ERonwX
	YQ5c+14exJfytzlgWPyXSLwkeenVnoaxGSjeR+hQOLH6e8z1IJ7TYEZMmhk1Fb99Oxy+
	ui7GnIXh7/cQNN640nQkkTH5/9miWtd6+hsRiTU2hmtk7SlM/jwqYO1Gsq0dMomsRxzE
	CAnRXP0S1hRD9Z/FHub21q4T8cmbC8JA3rdP0gNMiUbU9s7QDbmmd7hmx4MdRaEsXpOO
	k5eHeyKdst6JbHVMbgcsefB/n0zLvb1AF5nFbewjnIVVWiwk7nv1LayFkIPz2UpwXXBp
	F2sQ==
X-Gm-Message-State: APjAAAWT9UQGBilokAx7BIOMH9XY+/QY+8ZCqPGnBWk83+zlbomp54M9
	VnmTIBCbHCz/hp62wTOT+8o=
X-Google-Smtp-Source: APXvYqy2NLFwmSZ2PvWOhB3K3yrpNVMi5n2NLZXTnxNg30gnwnlxi7gbtz+mVumSOKe0gAOHmoXqfg==
X-Received: by 2002:ac8:198c:: with SMTP id u12mr21587202qtj.225.1580249652555;
	Tue, 28 Jan 2020 14:14:12 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	l184sm13194994qkc.107.2020.01.28.14.14.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 14:14:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 28 Jan 2020 17:14:07 -0500
Message-Id: <cover.1580248809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3][RFT]: kernel-yocto: v5.4 LTS kernel
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
X-List-Received-Date: Tue, 28 Jan 2020 22:14:12 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

I just wanted to send these to the list, so everyone could see the
reference kernel that we are planning for the upcoming release.

I have other patches to drop 4.19, 5.2 and make this the default
kernel for the various reference platforms as well, but I'm not
sending them, since we still have two outstanding issues:

1) mips64 init is segfaulting after / during some self tests.

   https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c

2) x86 musl is getting a gpf on many commands:

   https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/steps/8/logs/step1c

I've looked into both, and don't have any great ideas on how to debug
or fix them.

So if anyone has ideas, or wants to poke at these, feel free to follow up.
But as of now, we still can't merge the v5.4 kernel as the reference due
to these remaining problems.

Bruce


The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:

  bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (3):
  linux-yocto: introduce 5.4 recipes
  kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
  kernel-devsrc: update to v5.4+

 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  8 +--
 .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
 .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
 5 files changed, 136 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb

-- 
2.19.1


