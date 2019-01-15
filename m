Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E58AF7C137
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:27:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 327DC5C0843;
	Tue, 15 Jan 2019 23:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547591255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=1iSMrV5UfcLLTy0TadkJ6IGj67MdTWOhQxt2+u7jPPw=;
	b=uQlswde4snVdBjtiY+tLbz5s1oZZVSDscbS6oD/OauDR4fL0LOlZQLSyOvDiOi4ak91Myw
	eTmEzyNsvNU0kh4EavLkNMA13eUP88Z7ygh0LGLDc6zBMwtTjI6hmIlCsuIZtisQZPgeQ6
	soOr5PR4B986Qt5784cG9VlT0TpWyiw=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 23:27:25 +0100
Message-Id: <20190115222730.54560-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 0/5] Add polkit distro feature
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
X-List-Received-Date: Tue, 15 Jan 2019 22:27:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

This patchset adds Polkit (formerly known as PolicyKit) as a distro feature.
Polkit is used to centrally manage system policies and allows non-privileged
processes access privileged operations.

Since various packages such as systemd, ConnMan or NetworkManager allow building
with/without Polkit support it is sensible to have a global policy by using a
distro feature to descide whether to use Polkit.

Currently there is NetworkManager and xfce4 which enable polkit if systemd is
enabled. Using Polkit as a distro feature allows to easily prevent any Polkit
use while still using systemd.

I plan to send another patch to wire this up in various packages in
meta-openembedded as well as documentation update.

--
Stefan

Stefan Agner (5):
  systemd: only enable polkit if DISTRO_FEATURES asks for polkit
  gconf: rename policykit to polkit
  gconf: enable polkit if polkit distro feature is set
  consolekit: rename policykit to polkit
  consolekit: enable polkit if polkit distro feature is set

 meta/recipes-core/systemd/systemd_239.bb            | 3 +--
 meta/recipes-gnome/gnome/gconf_3.2.6.bb             | 7 +++----
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.13.6


