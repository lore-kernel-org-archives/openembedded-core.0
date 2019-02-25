Return-Path: <george.mccollister@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 451E77C860
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:38:06 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id 66so4001996ybo.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Rx1fAYrvMtjJ83eSki5GS72youR9lQRUfhZFbtu+ChA=;
	b=NRbohDKAByiR+/ITZVLjDdbx9m73zt0yjvKKfoJwDA7TExJVtsqVfyelo7U37HT5BD
	eFj2bYpAIk2h9TIfLSO+M3ui0z4Xtm6evllo1j/sPeb7tWxIW8Ym3bY9IFY5eoxANEA6
	caNKBr1AfSYPSCHouVqGwAOI9iasnw5ZE8FjQ1f0QUTDOQ82cinL6tG488jdIIZlih+a
	ZpE+wmc2MnV0o+92E1IbofFZzTnKeikE6AndoACNU5ip/S6WdcJcDITqu6m+jjBGSMdH
	dIreXnP2/BtcsKhKuu0s/uaxI5y6qCVdkgRNcWCYDWC9Dl3XVWE5g28kh5pNA9r6ZbKv
	pquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Rx1fAYrvMtjJ83eSki5GS72youR9lQRUfhZFbtu+ChA=;
	b=bBBNSbiOk3aRaHQnRKcLyJ8lV+lFNjNvJ/sdPDWuaXij9f5xVov7e4nCmlICNxi8T4
	qyI5aUB0EH0Bq0zkiqBS82CcgXTzuzc+j5ZKKprwTYNsAFe/E1xQo3OlfUSf3dXXtCTW
	UBQmeByC1Wkl6smtTuepkJwt4Dgy8BRhegbt3xKSTrW3hTCoPvjf13r/QZ/gIrNPEnqv
	mu6d+DrxDIPZKkQ2yllxET1LqNdeEkT4QVbQ+7O8XGajtzgsEySSzk2Bu5JiPymvnezV
	gbc4Tz5zW3MCgsg9TcsgH0XI5iLY/PNt/OtXNxeUcQH7uPS9RFoCP9AjTnH2Zr4U1lG3
	a1dQ==
X-Gm-Message-State: AHQUAubJwKCin8YfZx15jl2AOSjqmrSSnfML2FQu30ibGDGpPl71ro6A
	hyTG6hJzA8oIUJlYcVeYjWtfBBI=
X-Google-Smtp-Source: AHgI3Ia7DsDVLjy1D8xOyzWYtdhCTMOQxYmHiP2KP3BrXLcKz+/pNXlxTXL2oj4FrHFxJ0wn1RNRIw==
X-Received: by 2002:a25:d94:: with SMTP id 142mr15017388ybn.256.1551112686677; 
	Mon, 25 Feb 2019 08:38:06 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	z23sm6293654ywj.36.2019.02.25.08.38.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 08:38:05 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:37:05 -0600
Message-Id: <cover.1551111341.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [sumo][PATCH 0/8] systemd: fix CVEs
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
X-List-Received-Date: Mon, 25 Feb 2019 16:38:06 -0000

Apply CVE patches to systemd. Backport changes from thud when possible
otherwise use patches from:
https://launchpad.net/ubuntu/+source/systemd/237-3ubuntu10.13

The following changes since commit 31f0c5e59c7fb0ae0915de584fbfcf3d95bbb061:

  testsdk: Improvements to the json logging (2018-12-07 10:56:32 +0000)

are available in the git repository at:

  git://github.com/gmccollister/openembedded-core sumo-cve-fixes
  https://github.com/gmccollister/openembedded-core/tree/sumo-cve-fixes

Chen Qi (2):
  systemd: fix CVE-2018-15686
  systemd: fix CVE-2018-15688

George McCollister (5):
  systemd: fix CVE-2018-15687
  systemd: Security fix CVE-2018-16864
  systemd: Security fix CVE-2018-16865
  systemd: fix CVE-2018-6954
  systemd: fix CVE-2019-6454

Marcus Cooper (1):
  systemd: Security fix CVE-2018-16866

 ...sive-let-s-rework-the-recursive-logic-to-.patch |  252 +++
 ...eserializing-state-always-use-read_line-L.patch |  250 +++
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |   39 +
 ...n-t-resolve-pathnames-when-traversing-rec.patch |  643 +++++++
 .../systemd/systemd/0002-Make-tmpfiles-safe.patch  | 1828 ++++++++++++++++++++
 ...-not-store-the-iovec-entry-for-process-co.patch |  193 +++
 ...ld-set-a-limit-on-the-number-of-fields-1k.patch |   60 +
 ...ote-set-a-limit-on-the-number-of-fields-i.patch |   79 +
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |   49 +
 .../systemd/systemd/CVE-2019-6454.patch            |  210 +++
 ...e-receive-an-invalid-dbus-message-ignore-.patch |   61 +
 meta/recipes-core/systemd/systemd_237.bb           |   11 +
 12 files changed, 3675 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-don-t-resolve-pathnames-when-traversing-rec.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Make-tmpfiles-safe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
 create mode 100644 meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch

-- 
2.11.0


