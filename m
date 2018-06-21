Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 058307713C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:07:46 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id w7-v6so2113431pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+yBxXuo3tnHycCCEfpt+YrdXokW5Lv3hz3i6bEoNyFc=;
	b=J/ydIvuujNVpS2/2r4SaNYvUyHQkNVPGQB90WGf32xczOoWiDt7f1wd0ddjXqDXErr
	bw4lT6QomW7MdespXjIurLIn68zQb8VdhCqXSK5iPxyx3aZTxHNRO4n7B8tHRAXG6gOY
	n0F50YyJVyr2m8YXGWU1BKu/ix53Wyte02GRqO0nww6EEIlcuTzzLuJZJ0hVyqV05wXA
	FwQyPXBh5Qhi3L332vzV3hKWuiDMmMco4Ov27j3hIkLwWenB0ML/8V3r7pAKWpqVvyuc
	vLMvoo1nULkn9JGHP7Aw3U2DI7Dyr5ZgDEAJYN5BBiLPFLZzLtZ/5ZSZJ3NGARnFy5lW
	YEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+yBxXuo3tnHycCCEfpt+YrdXokW5Lv3hz3i6bEoNyFc=;
	b=c36nTXiE8JXGeD59lcFBU+Se0AX5uA0HVCN2Y3/Zmrz+ouf0c3MqjALDx+gPy2wZa2
	nuSbT10lRooUd3NSAPmrY4qCT249FzB85w3RHBPknbm2xL5ZMiBdm7DPvnX1TncQPSaT
	xBaNhmx24tEEEvbpVo23n7hf6JWxsmoHK41vWKmc49EYSqeHTII8cStciHN6jf/lRZnu
	jZrn7uCEXVhZq8lvwhou00u4l7/XO9eCCudIB+PxZL4ByCNDxUsjd/jYssA9qtSIP+oy
	G7Vm/Cb0JkY7wfXt2biPcTRaNlMeuR6kIop7Xy5vEifVtde53dI0sCJY8oB6Oywat5uA
	UHKw==
X-Gm-Message-State: APt69E20jn9GWxTy6kf9rH6bBdAwWWMJv4HPuBfIr8qjL150pyOfc4Zt
	VV0rYCHMAyRbbcUJlKN8zlr1J0AB
X-Google-Smtp-Source: ADUXVKKM1xQb2lmF7N5Z0wpDQ6kvq29+Wxvyqs85p4TsTGFsL7PZdWI02GtRVvOrgSYehY7bYETJPg==
X-Received: by 2002:a65:5085:: with SMTP id
	r5-v6mr24393814pgp.123.1529615267745; 
	Thu, 21 Jun 2018 14:07:47 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm8448499pga.21.2018.06.21.14.07.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:07:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:07:30 +0500
Message-Id: <cover.1529604086.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/6] A few misc fixes from meta-mentor-staging
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
X-List-Received-Date: Thu, 21 Jun 2018 21:07:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit 83c9405df5748744ef673ac8757bb89d7050ad8d:

  alsa-tools: rewrite packaging (2018-06-15 11:18:15 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core.git misc-fixes

for you to fetch changes up to 5ce7b09e00b4967d2c0efaad58049cf871fab57a:

  perf: drop the rdep on man (2018-06-16 02:04:35 +0500)

----------------------------------------------------------------
Christopher Larson (6):
  oe.scriptutils.run_editor: ditch the error-prone argument quoting
  pcmciautils: depend on bison-native
  console-tools: add missing flex/bison deps
  ovmf: set PARALLEL_MAKE for target as well
  dmidecode: correct docdir
  perf: drop the rdep on man

 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |  2 +-
 .../console-tools/console-tools_0.3.2.bb           |  1 +
 meta/recipes-core/ovmf/ovmf_git.bb                 |  2 +-
 meta/recipes-devtools/dmidecode/dmidecode_3.1.bb   |  4 ++++
 meta/recipes-kernel/perf/perf.bb                   |  1 -
 scripts/lib/scriptutils.py                         | 24 +++++++++++-----------
 6 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.11.1


