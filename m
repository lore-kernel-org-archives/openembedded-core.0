Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 52BA260556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:00:08 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id z12so896573wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 22:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=l7082+ktk+X4imue267wlzOYFjhBNojHpktJTKki3Kc=;
	b=NV8qE9r7+G16SkyU8cDWWthC22mAEhYlsdOUMH+KQp72hy/qggYv8Mw/hoa/OCUR9H
	GKXHa+onjORC7F8JowlfjPyf/9RKV6BBOExXu4to7/xzevFyP9sXt7GJvTMmj9FLd9iQ
	+8ugvDdI9eB1V/SQx3n+PCU/niSyYzjp17D9h3Dx8yHrTOjKfbCfGib1puZpjS6IYpIn
	9wPeA52MwPMPDLl48DxyuqVW7VhzHF2lijLRu+wprFzrJzondSoE0yKTuhowNI6t1anF
	ZqAAm20Zyq0+T/tBPEV+Muz26SNM3LRXlWMapse74WJz7PlxtZbKG7b95NzejRd6p2iQ
	50eA==
X-Received: by 10.194.157.38 with SMTP id wj6mr14691790wjb.62.1423807209782;
	Thu, 12 Feb 2015 22:00:09 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id u9sm8547638wjy.37.2015.02.12.22.00.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 22:00:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 06:59:49 +0100
Message-Id: <1423807195-7087-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/6] minor reusability enhancements
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
X-List-Received-Date: Fri, 13 Feb 2015 06:00:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6bf5cbbcac80ee818cc932d69227e70e41ce02d3:

  libtool: Fix option parsing performance regression (2015-02-10 22:36:09 +0000)

are available in the git repository at:

  https://gitorious.org/schnitzeltony-oe-meta/oe-core.git patches

for you to fetch changes up to c0b5d7b36432bce0fb46911940226057ca74fa8f:

  default-versions.inc: remove pinning of liberation-fonts (2015-02-12 22:02:12 +0100)

----------------------------------------------------------------
Andreas Müller (6):
      gpgme: fix configuration by setting proper parameters instead of patching
      libassuan: add native build
      gpgme: add native build and ship a valid gpgme-config
      initial add fontforge(-native) 20141126
      liberation-fonts: update to 1.07.4
      default-versions.inc: remove pinning of liberation-fonts

 meta/conf/distro/include/default-versions.inc                                            |  3 ---
 meta/recipes-graphics/fontforge/fontforge_20141126.bb                                    | 43 +++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-graphics/ttf-fonts/{liberation-fonts_1.04.bb => liberation-fonts_1.07.4.bb} | 16 +++++++++-------
 meta/recipes-support/gpgme/gpgme-1.4.3/0001-return-unknown-as-host.patch                 | 33 +++++++++++++++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch                       | 39 ---------------------------------------
 meta/recipes-support/gpgme/gpgme_1.4.3.bb                                                | 15 ++++++++++-----
 meta/recipes-support/libassuan/libassuan_2.2.0.bb                                        |  2 ++
 7 files changed, 97 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-graphics/fontforge/fontforge_20141126.bb
 rename meta/recipes-graphics/ttf-fonts/{liberation-fonts_1.04.bb => liberation-fonts_1.07.4.bb} (66%)
 create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/0001-return-unknown-as-host.patch
 delete mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch

-- 
1.9.3


