Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id C32F06CF14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:05 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w7so1882923lbi.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=xZW10PlDK2YQBwQ2HHofzjUa10I7fRWbdptnkBZu2tY=;
	b=oSRuf/hdPkW9a/eYmbKVqfuXYK/RUfRLOiqdM6iz7NkY/Yt6wEI+r0xPTA8jHxe6SZ
	5AQDlUQM7+DBvejByp84q1bSiO7ZzRK4Z6oELTDpa6k83E2Sa3WxTclV+5UrStPEaI5b
	W+HPjvuXLbuVxS07J9oWdy8YPSh/bG1lHtArIQAIoTddC3gjUpi+Ub28vlqgKJzSzFYY
	Jmtq9dQVHV05r4SBGchVBRSeH0/anv4hxcl5zeiVwcY6ERgEBWGLmDOYUMim0AODAx5w
	+ylwgPbwmpQI9CZVje8MyJUxDRuOdRJBupZyi9WxhlnfcNY7yBSnTEfr7TdPciwhbyXa
	Macg==
X-Received: by 10.112.159.166 with SMTP id xd6mr7507029lbb.22.1382018406424;
	Thu, 17 Oct 2013 07:00:06 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id b1sm74990979lah.6.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:06 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id F26CF400F1C; Thu, 17 Oct 2013 15:59:56 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:35 +0200
Message-Id: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH 00/11] RPM PMS in SDK tarball
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As part of the effort to allow wic/mic usability in the SDK tarball:

This is a patchset directed towards adding RPM PMS functionality.
Unfortunately, this also adds a python runtime dependency, so I
took the liberty to add a DISTRO_FEATURE called "sdk-pms" to opt out, 
and to avoid bloating the toolchain tarball.

David Nyström (11):
  popt: Add nativesdk in BBCLASSEXTEND
  icu: Add nativesdk in BBCLASSEXTEND
  beecrypt: Add nativesdk in BBCLASSEXTEND
  attr: Add nativesdk in BBCLASSEXTEND
  acl: Add nativesdk in BBCLASSEXTEND
  rpmresolve: Add nativesdk in BBCLASSEXTEND
  smartpm: Add nativesdk in BBCLASSEXTEND
  ossp-uuid: Add nativesdk in BBCLASSEXTEND
  file: Add nativesdk in BBCLASSEXTEND
  nativesdk-packagegroup-sdk-host: Add new DISTRO_FEATURE, sdk-pms
  rpm: Add nativesdk in BBCLASSEXTEND

 .../nativesdk-packagegroup-sdk-host.bb             |  3 ++-
 meta/recipes-devtools/file/file_5.15.bb            |  2 +-
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |  2 +-
 .../python/python-smartpm_1.4.1.bb                 |  6 +++++-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             | 24 ++++++++++++++++------
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb        |  2 +-
 meta/recipes-support/attr/acl_2.2.51.bb            |  2 ++
 meta/recipes-support/attr/attr_2.4.46.bb           |  2 ++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  2 +-
 meta/recipes-support/icu/icu.inc                   |  3 ++-
 meta/recipes-support/popt/popt_1.16.bb             |  2 +-
 11 files changed, 36 insertions(+), 14 deletions(-)

-- 
1.8.3.2


