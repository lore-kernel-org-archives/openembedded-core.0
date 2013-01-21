Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxJaL-0006b0-U1
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 16:46:59 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 07:31:27 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so7498087wib.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 07:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Bu+nRzQyMEIQZs32bJx+wNLzXDnJRdr61GBK1k5Tgpo=;
	b=TsTsuAdYdLRn36lCI+RrpDREHenRpg2CP381Ic7niDFTw12YL3QTRZtirN8EHSLYWZ
	5nEiZDUBIHTpZan+naC86AJ1uDqSBYUvIjrE9bas5cIUomM1LO0m29M2WwTjE46D6i8I
	1Fc5OnICv1qH4FW45kNa31p0AdqQzxE2P2zDQFCXNnHNrsDiEfeow98OydFP5wjdeOtU
	cOn70foDUdjBigKqD7+es2pmG6tEAgxLZWX+ZKc8uLFcs8pmi37HQAGchU/b1mzcCohV
	yzztx93meH5DaqIFFyVdZ2wffeD+FuSVruE5hGH6rVeHPldbEqhYEmpD9ZJj0xfoghg6
	9LtA==
X-Received: by 10.180.33.44 with SMTP id o12mr16211992wii.28.1358782285122;
	Mon, 21 Jan 2013 07:31:25 -0800 (PST)
X-Received: by 10.180.33.44 with SMTP id o12mr16211975wii.28.1358782284913;
	Mon, 21 Jan 2013 07:31:24 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm17306508wib.9.2013.01.21.07.31.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 07:31:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 15:29:25 +0000
Message-Id: <cover.1358782098.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlCtNtOqwo5K7ZfsATMBHkrmHNQzomNWJvpI36BEqSXpOJpM5b0N4l+qqvahxDrlZ6vZg0+6iDP1Xhz8RGNsJ7JrkCIxYbjUK8Z3UqkWlvJGTBVg0Nkx0o7UZaCE8Y25IPluk5JbM4rZRivlGz3eKgn/zG+cpoxhxhGWYRuwZ+FXPWpReu+s0t2W8iEiMaRhWOH9q3R
Subject: [PATCH 0/2] Remove GUPnP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 15:47:00 -0000

Hi,

GUPnP is great, but it's untested in oe-core.  It's now in meta-multimedia where
it's been upgraded and live alongside companion projects such as dLeyna and
Rygel.

Ross

The following changes since commit ae118de9a0356ab631eb3024f55b1784fa54e437:

  systemd: remove unused SERIAL_CONSOLE variable (2013-01-21 15:22:36 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/dleyna

for you to fetch changes up to 17d63fe6f27fbf6719b3c6d7344ba896e6b45a58:

  packagegroup-sdk-gmae: remove GUPnP stack as it's no longer in oe-core (2013-01-21 15:27:11 +0000)

----------------------------------------------------------------
Ross Burton (2):
      gupnp: remove, migrated to meta-multimedia
      packagegroup-sdk-gmae: remove GUPnP stack as it's no longer in oe-core

 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb    |   23 ----------------
 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb  |   15 -----------
 .../gupnp/gupnp-tools_0.8.1.bb                     |   14 ----------
 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb    |   28 --------------------
 .../packagegroups/packagegroup-sdk-gmae.inc        |    4 ---
 5 files changed, 84 deletions(-)
 delete mode 100644 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb

Ross Burton (2):
  gupnp: remove, migrated to meta-multimedia
  packagegroup-sdk-gmae: remove GUPnP stack as it's no longer in
    oe-core

 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb    |   23 ----------------
 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb  |   15 -----------
 .../gupnp/gupnp-tools_0.8.1.bb                     |   14 ----------
 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb    |   28 --------------------
 .../packagegroups/packagegroup-sdk-gmae.inc        |    4 ---
 5 files changed, 84 deletions(-)
 delete mode 100644 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb

-- 
1.7.10.4



