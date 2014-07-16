Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 79D2D701D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:08:20 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so1510045wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 14:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IRsYE13qsOUdlBixsX8loZB82pu3UtRrv34lJS/iXVM=;
	b=ETRMn0trAcvo6a+9DgfDhdgnOrEYLbkFT26GWsFmtSo2rxJxYK7st5pXpUw2y0SRnR
	4SHmz5DnNKasmZzDgG0kRpQr6uFbnpaW56CekTujy5zMaYQZzsxNSY8c1/ImbvQw8UsI
	ll+QdT/N5AUG2sC/eLyYq6EbGUDv3k9K3laIihOT8qjmg7ONgbLjQ5+ePykxFfgsDbkO
	U0VfoT1oGxVzt3A6HhKMX2Ytxhwzw7TArGPReqImvJLmK+9goK0Z0Y/Vomy//+hj8V1O
	UuPTm/tCAtDm0ZhmFwcT1CgYovAJfvHYeDD94crZHfoyynHPaRQbZ/ppAm2u7hhZEA7H
	TEZQ==
X-Gm-Message-State: ALoCoQldZDGgbaEGvjmEa0FJnI/q4wjAGkHU49E+PBMQrUcBAuQAuyoXWlwUtZiHj6EI6vBZ4Ayi
X-Received: by 10.194.191.131 with SMTP id gy3mr24256982wjc.108.1405544900861; 
	Wed, 16 Jul 2014 14:08:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm13215918wik.7.2014.07.16.14.08.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 14:08:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 22:08:12 +0100
Message-Id: <cover.1405542583.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2][V2] License compliance fixes
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
X-List-Received-Date: Wed, 16 Jul 2014 21:08:25 -0000

Hi,

If INCOMPATIBLE_LICENSE=GPLv3.0 but the recipe sets LICENSE=GPLv3, the current
code won't trigger because they're different strings.

Fix this by attempting to canonicalise every license name to a SPDX name, so
both names in this example become GPL-3.0.

The whitelists also have to be updated.  This means using variable names that
could be considered non-standard (or "crazy"), such as WHITELIST_GPL-3.0.  This
does look strange and if the community agrees we can take the compatibility hit
I'll change the whitelists to use flags, i.e HOSTTOOLS_WHITELIST[GPL-3.0].

Ross

The following changes since commit 1dcdd877c7946be4c0b1203deb14e2f842f9d0c2:

  bitbake: toasterui: fix build - project identification (2014-07-14 14:10:03 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/license

for you to fetch changes up to 934289b8ba6a8b7a0f1eec8aabf723f823d515d8:

  default-distrovars: update license whitelists to use canonical names (2014-07-16 21:02:45 +0100)

----------------------------------------------------------------
Ross Burton (2):
      license.bbclass: canonicalise licenses when dealing with INCOMPATIBLE_LICENSE
      default-distrovars: update license whitelists to use canonical names

 meta/classes/base.bbclass                       |    2 ++
 meta/classes/license.bbclass                    |   14 +++++++++++---
 meta/conf/distro/include/default-distrovars.inc |    6 +++---
 3 files changed, 16 insertions(+), 6 deletions(-)

Ross Burton (2):
  license.bbclass: canonicalise licenses when dealing with
    INCOMPATIBLE_LICENSE
  default-distrovars: update license whitelists to use canonical names

 meta/classes/base.bbclass                       |    2 ++
 meta/classes/license.bbclass                    |   14 +++++++++++---
 meta/conf/distro/include/default-distrovars.inc |    6 +++---
 3 files changed, 16 insertions(+), 6 deletions(-)

-- 
1.7.10.4


