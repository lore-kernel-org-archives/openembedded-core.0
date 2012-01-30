Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rrykr-0004wW-CA
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 22:27:13 +0100
Received: by dakf10 with SMTP id f10so3277160dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 13:19:19 -0800 (PST)
Received-SPF: pass (google.com: domain of steve@sakoman.com designates
	10.68.75.233 as permitted sender) client-ip=10.68.75.233; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of steve@sakoman.com
	designates 10.68.75.233 as permitted sender)
	smtp.mail=steve@sakoman.com
Received: from mr.google.com ([10.68.75.233])
	by 10.68.75.233 with SMTP id f9mr55123159pbw.10.1327958359833 (num_hops
	= 1); Mon, 30 Jan 2012 13:19:19 -0800 (PST)
Received: by 10.68.75.233 with SMTP id f9mr45199874pbw.10.1327957981765;
	Mon, 30 Jan 2012 13:13:01 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id x8sm49849976pbr.11.2012.01.30.13.12.59
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 13:13:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 13:12:47 -0800
Message-Id: <1327957970-15159-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v4 0/3] zypper: support signed repositories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2012 21:27:13 -0000

The current zypper implementation does not work with signed repositories.
This patch series adds recipes for the required packages as well as the
necessary runtime dependencies to zypper.

Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
a systemd based console image.

Version 4 incorporates feedback from Koen Kooi, Saul Wold, Khem Raj, and
Anders Darander
 - adds runtime dependencies to existing RDEPENDS_${PN} of zypper
 - removes duplicate recipe for libassuan
 - moves recipes for gnupg and libksba to recipes-support
 - adds dependency on libgpg-error for libksba
 - cleans up LICENSE field
 
Steve Sakoman (3):
  libksba: add recipe for 1.2.0
  gnupg: add recipe for 2.0.18
  zypper: add missing runtime dependences on gzip and gnupg

 meta/recipes-extended/zypper/zypper_git.bb    |    4 ++--
 meta/recipes-support/gnupg/gnupg_2.0.18.bb    |   25 +++++++++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.2.0.bb |   12 ++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
 create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb



