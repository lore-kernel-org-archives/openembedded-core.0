Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2399B71996
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 13:14:52 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id 188so11251006pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=xwHpPqKuf3M16MUoyby2p5PiYnpuxTmy+vduq3wiEhI=;
	b=kUB3jO9nfvIfK0TClP5/4iP8/PfU/0E94yz75K43Ek5KsvWYqtt21rxm5VwtApPGuc
	bU4NwrJt3NGT3NwerK0rufo0+wKExSpbvwgQK3Wx5I9ocfDfQ4lJP+9ZVRce/mS4O4QV
	ch+d6RKydpP5Dw+vDwGzgv0yCOUuG0ExF76T8QY1B5iAA3QkVhvflCiyzFSX+6UgoXze
	DR0pJX+zQqxskL39jLY0us3jeZVyMGvCDiKYAIC9sbLTVzYOTKUqVdTiNtInlyklPM+r
	+Yv9K5aUXD/DtmflWzlZt5f0AQsv8kWtKWgrhxlLDVdMYfmG7eWdZZPsMVe0vPRERsIi
	ly2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=xwHpPqKuf3M16MUoyby2p5PiYnpuxTmy+vduq3wiEhI=;
	b=jUrGuGYwAMVZGmGmeh4J7B7dPEYILcF0E13mHxNJWxsr9YDl1SXyqFyq3NE8pAbjyj
	9jewdTaUaxTJDyfRZ92O8N+1a4PK0BmmW99914dzXqiRvD6roNkzNcz516tTkV4frHRJ
	QqZdcwSk1u8dmjKQwm9f219v438tmSodmax/4hJhVdogRvFbNzNwkHCp1SH0md2lQpvX
	yjU7TKAfg5l5nn2e/VXPJCpczeTM48nMkWDgQILDUzpxBJEqHHaUKCZB0IEa6mkGiGMD
	Vg1tPxVTc76W5CtI4Q/F5GlAasEES6n1vAkETR8IMN80iFf1UhS46r4vNq3S5UwdrDiG
	XhKA==
X-Gm-Message-State: AHPjjUjWld51u6DQuDLli7GNtxfbVh4I6vOXadweTT9FULFnvAujadMt
	CRC2teupqd6iGdL6GvQWmQ==
X-Google-Smtp-Source: ADKCNb4fhtBwEGqy83+ph6yJ3YblXnskQ2cG5v3Ewb8/yeIc8mV9Bh5Kef/C0b7Kv8CTv37GnrIxkQ==
X-Received: by 10.84.246.200 with SMTP id j8mr9867805plt.55.1505049294148;
	Sun, 10 Sep 2017 06:14:54 -0700 (PDT)
Received: from [127.0.1.1] (CPE-121-223-2-142.lnse2.cha.bigpond.net.au.
	[121.223.2.142]) by smtp.gmail.com with ESMTPSA id
	b75sm11797765pfc.29.2017.09.10.06.14.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 06:14:53 -0700 (PDT)
Date: Sun, 10 Sep 2017 23:14:46 +1000
Message-Id: <20170910131446.4555-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 0/4] Recipes for Open Source Verilog and Lattice iCE40 FPGAs tools
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
X-List-Received-Date: Sun, 10 Sep 2017 13:14:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series contains a set of a recipes for Open Source FPGA tools which
provide a full Verilog to target Bitstream flow for the Lattice iCE40
FPGAs.

This includes the following tools:
 * Yosys - Synthesis
 * Arachne-PNR - Place and Route
 * IceStorm - Bitmapping and JTAG programming

Also included in the series is Icarus Verilog which is useful for
simulation of Verilog designs.

All recipes in the series have been tested on native (x86-64),
nativesdk (x86-64) and target (armv5/qemuarm). With a relatively complex
Verilog design (for iCE40).

For a sample recipe that makes use of these tools within bitbake see:
  https://github.com/nathanrossi/gps-clock-project/blob/master/meta-gps-clock/recipes/display-controller/display-controller.bb

Please note whilst this series is sent for oe-core it may be better
located in another layer? (e.g. meta-oe). However since the recipes and
the tools they build are not specific to a single BSP it did not make
sense to keep in a BSP specific layer.

Nathan Rossi (4):
  yosys: Add Yosys and ABC recipes
  icestorm: Add IceStorm tools for iCE40 FPGAs
  arachne-pnr: Add Arachne Place and route for iCE40 FPGAs
  icarus-verilog: Add Icarus Verilog recipe

 .../arachne-pnr/arachne-pnr_git.bb                 | 44 +++++++++++++++++
 .../icarus-verilog/icarus-verilog_git.bb           | 33 +++++++++++++
 meta/recipes-devtools/icestorm/icestorm_git.bb     | 51 ++++++++++++++++++++
 meta/recipes-devtools/yosys/berkeley-abc_git.bb    | 30 ++++++++++++
 meta/recipes-devtools/yosys/yosys_git.bb           | 55 ++++++++++++++++++++++
 5 files changed, 213 insertions(+)
 create mode 100644 meta/recipes-devtools/arachne-pnr/arachne-pnr_git.bb
 create mode 100644 meta/recipes-devtools/icarus-verilog/icarus-verilog_git.bb
 create mode 100644 meta/recipes-devtools/icestorm/icestorm_git.bb
 create mode 100644 meta/recipes-devtools/yosys/berkeley-abc_git.bb
 create mode 100644 meta/recipes-devtools/yosys/yosys_git.bb

-- 
2.14.1

