Return-Path: <matt@console-pimps.org>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E37AC60438
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:03:47 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so11126682wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 06:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lx4mM1R8HAl1zFzl+1x5EIu3lp2IJkgb8Gb3SRSyFow=;
	b=hvF0M+/JBNaV2q2XWmE1syuCtjNkMILQg6IxN7fPEzIqOunmiagaqtCY5Oa1pU4731
	qt6lxlWksVAJMTBsprkHNmsJC9ellJQV7M31pdWJt0/fwfNq8K9sha790noMQihMh28X
	h7i27jJTtHJdoBCwvb7uJCjvGsHP084MJr1CypP5CYMuqGeW7wSRl1iD54ZPj++Uu76H
	Q4J4Fm2sqoGGgNmZw9scj6rIudeHF+4MFLf2VxGbcN7pnFkpcne+FuKf7I0WmscA5o8r
	tfSdshQEN3TYpfIfsx+UIYFR8jdv0ERvNT1if6JT8q7GsrsLjpGqfXQACjlN54rSEItf
	U3zA==
X-Gm-Message-State: ALoCoQnldrYprFa6wtMPEQGxPKJuSPXOIKLiix1n6TeyNTEEiXe1DQpD7XJla3PTei3V9uN4me8I
X-Received: by 10.180.73.6 with SMTP id h6mr4807919wiv.65.1407935028079;
	Wed, 13 Aug 2014 06:03:48 -0700 (PDT)
Received: from localhost (05428d07.skybroadband.com. [5.66.141.7])
	by mx.google.com with ESMTPSA id bx2sm4288907wjb.47.2014.08.13.06.03.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 06:03:47 -0700 (PDT)
From: Matt Fleming <matt@console-pimps.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 14:03:41 +0100
Message-Id: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
X-Mailer: git-send-email 1.9.3
Cc: Matt Fleming <matt.fleming@intel.com>
Subject: [PATCH 0/2] OVMF recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 13:03:52 -0000

From: Matt Fleming <matt.fleming@intel.com>

This is v2 of the OVMF recipe patch. This version addresses some of the
comments from Martin Jansa on style, as documented in the openembedded
styleguide.

Additionally, iasl is a dependency of OVMF but no iasl recipe currently
exists in oe-core so one is included in this series.

Matt Fleming (2):
  recipes-extended: Add iasl recipe
  recipes-devtools: Add OVMF recipe

 ...s-Force-tools-variables-to-host-toolchain.patch | 48 ++++++++++++++++++++
 meta/recipes-devtools/ovmf/ovmf_git.bb             | 52 ++++++++++++++++++++++
 meta/recipes-extended/iasl/iasl_20120215.bb        | 27 +++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-devtools/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
 create mode 100644 meta/recipes-devtools/ovmf/ovmf_git.bb
 create mode 100644 meta/recipes-extended/iasl/iasl_20120215.bb

-- 
1.9.3


