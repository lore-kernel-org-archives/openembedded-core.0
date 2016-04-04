Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6391476FFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:41:29 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id f1so72235053igr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yy4JtiezRfyV1fpw7lbl8oK/r2WGVObxTgwnkLJsDYU=;
	b=AxwFxHOu7z5TdQKZZwm3RphQGnjn+OE3xxTbMrNVhSG0kZxNjU8D5u0Mc358lyGnWV
	pPmlY7tdK+B12+HFVdMEAEDZSno5JtUD07lKapEN31YXzo9k7TSbkGBq64yFLFp/iUex
	M0o/+xxHNpRscTkNKxIRoDcPiYJiSvL1PSpeA25VV2vng4FelqcIx94GNm26fJoM4q/8
	1KKbN9HS+2T063hrIs6zVARmSURP9LOre0/NW2i7S3tOTxnc3GaORkQZuNjm3aL/8c7r
	H6YmpVDBlvDycjxI3bsXa6ffW9pYLAY2WzivhfFktdVJ7waULicW40F5ZLGCYLHad80Z
	hLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yy4JtiezRfyV1fpw7lbl8oK/r2WGVObxTgwnkLJsDYU=;
	b=Bu/FJPfA2n5kXk9YiEEjGdK04LkfGxjMsWXJ7izCDSu4sdVdLD8e1hZ1PW7A/mNtrE
	5LYI17BLJeVDyQ77ceirvSYQkHDJID+aZWJV1VnBi2tEQaczoWdwWS8fCVcjFgxiZVcr
	XabXrZJzXYBsy/fbavOdBw3/HTC1lIaqxz3D1J22xcgGTVej9vaBS2uoNf5pcNxHmqNv
	jUsKgmkUPKse+p0caFN4eki0V1MqArsVQJfcU4zaR+1Rv7UK+x0MyHISubDZ5fUj83ts
	vOE6pcvjERcY9uBdzVKL2h3akPODz4rJ3FoxJ/NvRs6zFIUHgL982a1RqPxsnlaX7RWp
	Dxxw==
X-Gm-Message-State: AD7BkJIgof2FseWBPMpyyYFY65sJwMPc5LbJGIPFsvYqwnY+6+ZJ6+M3cJBnGf6mQJxuE3qB
X-Received: by 10.107.133.151 with SMTP id p23mr16341198ioi.16.1459777288619; 
	Mon, 04 Apr 2016 06:41:28 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56B6F.dip0.t-ipconnect.de.
	[87.165.107.111]) by smtp.gmail.com with ESMTPSA id
	g190sm9886579iog.29.2016.04.04.06.41.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 06:41:28 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:41:18 +0200
Message-Id: <cover.1459776943.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] misc enhancements
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
X-List-Received-Date: Mon, 04 Apr 2016 13:41:30 -0000

I've worked on making Ostro OS support Toybox and "stateless"
configuration, i.e. running with empty /etc and reserving that
for local configuration changes.

That work depends on several enhancements in
OE-core. "package_manager.py: better error handling in opkg's package
listing" is not needed anymore, but helped debug a packaging problem.

Please pick whatever you deem suitable for OE-core at this time, I'll
keep maintaining the rest and can re-submit again later.

The following changes since commit d60806e56aed2f62f6a0e030a564f7fdc4a1314d:

  build-appliance-image: Exclude DDATETIME from task signature (2016-04-03 15:51:10 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core stateless
  https://github.com/pohly/openembedded-core/tree/stateless

Patrick Ohly (5):
  bluez5.inc: remove obsolete workaround
  ncurses: reorder PACKAGES
  systemd: make systemd-serialgetty optional
  package_manager.py: better error handling in opkg's package listing
  ca-certificates: support Toybox

 meta/lib/oe/package_manager.py                     | 15 ++++++----
 meta/recipes-connectivity/bluez5/bluez5.inc        |  2 --
 meta/recipes-core/ncurses/ncurses.inc              |  2 +-
 meta/recipes-core/systemd/systemd_229.bb           | 14 +++++++--
 .../update-ca-certificates-support-Toybox.patch    | 35 ++++++++++++++++++++++
 .../ca-certificates/ca-certificates_20160104.bb    |  1 +
 6 files changed, 57 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch

-- 
2.1.4


