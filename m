Received: from mail-ie0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvDGz-0000Fu-PR
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:38:20 +0100
Received: by mail-ie0-f179.google.com with SMTP id k14so1024325iea.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=QUIsR13d6nl7JrZKis5nTat5cNStAA6IptIQRvPHqUo=;
	b=VdvqSTMcDaB833cy5uEJMUFeq5nMxdGUOgmtcY28TjMlE5v/+dLG9RhmbwjUkTkILy
	plV4K40kqOB7kyBBbE93iELQuh8rNaHk/FQU7YynTd73qKlpjZ+JiAQrLUERZq9MS7FA
	SANjJ2vVlUuWE/dfdweGdngJ9au5q1P5H6ijdiPsfUkGzVtP4rcmDPKGsy/DK4kT3ihY
	DQY5l9jnROfXlGLAOq6x4aNRTqJeYSZ+LKjnuah+LGPwT+lcHsraVYh2zAKnfIy6VtHj
	CIzkzVCvH26bLdPwu7wppzlVlM6fH21B/AIeq4NYwcbOLC2bFqQDE2ZYrZmZAV0YiW3k
	u+yA==
X-Received: by 10.50.187.134 with SMTP id fs6mr2722129igc.79.1358281376576;
	Tue, 15 Jan 2013 12:22:56 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qn10sm2655187igc.15.2013.01.15.12.22.53
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:22:54 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 13:22:45 -0700
Message-Id: <cover.1358281118.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/6] Fixes for INCOMPATIBLE_LICENSE handling
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
X-List-Received-Date: Tue, 15 Jan 2013 20:38:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

This fixes a number of bugs spotted while trying to use INCOMPATIBLE_LICENSE
= "*GPLv3", and also while experimenting with a recipe whose LICENSE includes
GPLv3, but whose packages do not. In addition, it reduces the message spam by
switching the license incompatibility messages to debug.

Note: there's still one remaining bug I noticed, the wildcard support which
was added is not very well supported in concert with the host tools exclusion
variables. It asks for an spdx version of "*GPLv3", gets nothing but itself,
and tries to look up whitelists for that string. This is not addressed by this
patch series, but I mention it here for awareness, and also a reminder to
myself to look in to it.

The following changes since commit 6080d1dc719c38fd97c2abd38e0ad938fbf6f452:

  connman: fixed init script so connman can runs over nfs (2013-01-15 08:09:30 +0000)

are available in the git repository at:

  https://github.com/kergoth/oe-core incompatible-license

for you to fetch changes up to 5cb12f38b2ac74ea118b58888a0c37f63917fbfa:

  base.bbclass: improve the incompatible license logic a bit (2013-01-15 12:48:51 -0700)

----------------------------------------------------------------
Christopher Larson (6):
      license.bbclass: check LICENSE_pkg, not LICENSE_pn-pkg
      license: correct re.search/fnmatch indentation
      license.bbclass: cleanly handle invalid licenses in incompatible_license
      linux-firmware: use LICENSEs which can actually be parsed
      base.bbclass: use debug messages for INCOMPATIBLE_LICENSE
      base.bbclass: improve the incompatible license logic a bit

 meta/classes/base.bbclass                                |  9 ++++-----
 meta/classes/license.bbclass                             | 16 +++++++++-------
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 13 ++++++-------
 3 files changed, 19 insertions(+), 19 deletions(-)

Christopher Larson (6):
  license.bbclass: check LICENSE_pkg, not LICENSE_pn-pkg
  license: correct re.search/fnmatch indentation
  license.bbclass: cleanly handle invalid licenses in
    incompatible_license
  linux-firmware: use LICENSEs which can actually be parsed
  base.bbclass: use debug messages for INCOMPATIBLE_LICENSE
  base.bbclass: improve the incompatible license logic a bit

 meta/classes/base.bbclass                                |  9 ++++-----
 meta/classes/license.bbclass                             | 16 +++++++++-------
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 13 ++++++-------
 3 files changed, 19 insertions(+), 19 deletions(-)

-- 
1.8.0.3



