Return-Path: <>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0924C7C3B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 12:59:35 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u18so8795306lff.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 04:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YAf9jgqUBwelhmzCUWqlmLZNEYGhKlu5CHTPp0ALLg8=;
	b=tDP1NpnY1CDhdrUub+/EbOqzUCS426FrIFmCjSWN3A+izdvzjAkll1KJh1cThCnoB+
	M4Wnxi0njTAxnQSKO1AGRtOMImUAYaPeu1RHTEwPNaM4cWkbvJECXj6OSjh0RmJlhvsZ
	o7G+CtA2uZ+WY33Pxm/SEKn1iMCAE0lJwmUClB0X7Be85fReryVGhdnef9m8Jwkh5RQ3
	0RaIva03dxd9H9sqlK0xwUYtMOCYRa8mVrBCO+rIij57OX7D1i1C1bruXLiPw9cvWp5o
	FGtWSX0EfUE5mwL+8K896iUY3ZQrAAwAciH/oRpQBHndAfddkRqVlSzrnFkzaT4yNiJQ
	g0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YAf9jgqUBwelhmzCUWqlmLZNEYGhKlu5CHTPp0ALLg8=;
	b=ONqqsokUinFVFHKZfM+Q0/O4sdHz5Jk6kVab8XwN4qobueSmLMgQLmLCrb6S2cW3A+
	N6+1/9tpP3tDuHxrlTCVsTmAe4mFzLkwLY6VX0UcxQMfPSzoaug8jTZgoIBlhJmR781B
	sWzzS20jPwc7MYN4N773k/bz9hH7uizjHfs+c5FOVxco6BR0tdhs6nvYjwuNUsW9eIst
	nakNOHMvEWBd1If3fJzYhkRCDEvCVIaZEGSb0E40BpBC4fMq/cWjszTTx7kpJCjwh7U4
	Ferl0w8tSeAaTeGmKjk+rynamy4Np5m4EBbUrtaki8lih6y6pCbnO+9wYycOydIg1mh8
	SiPA==
X-Gm-Message-State: AJcUukfUBT9bUQwgrGMZANPNrD14lX5g+NloqiQhKRmNh7dVjESlCXEE
	p2Y5AzY4EKp9tomX6ZlbgTU=
X-Google-Smtp-Source: ALg8bN5C2eJXJbUlBeFkxep1opHXBwU3nWQjYx+aNXKo0GjGmzEusozMz80otEjf9rhkh44Mhpv5mA==
X-Received: by 2002:a19:7352:: with SMTP id o79mr11842416lfc.104.1548507575313;
	Sat, 26 Jan 2019 04:59:35 -0800 (PST)
Received: from localhost ([80.64.92.72]) by smtp.gmail.com with ESMTPSA id
	p23sm2042090lfh.47.2019.01.26.04.59.34
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 26 Jan 2019 04:59:34 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 14:57:54 +0200
Message-Id: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/6] Remove lost patches from oe-core
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
X-List-Received-Date: Sat, 26 Jan 2019 12:59:36 -0000

Working with recent oe-core I noticed that there are
patches not used by any recipe, which is confusing.
This is caused by mistakes in recipe upgrades, when
people remove patch from SRC_URI but forgets to
delete actual patch.
Instead of fixing only recipes I worked on,
I wrote a simple bash script which found all 6
lost patches in oe-core.

This patch series removes all of them

Ruslan Bilovol (6):
  lttng: drop lost patch
  bind: drop lost patch
  dhcp: drop lost patch
  connman: drop lost patch
  subversion: drop lost patch
  perl: drop lost patch

 ...0001-build-use-pkg-config-to-find-libxml2.patch |  54 ----------
 ...Add-prefixlen-to-iproute_default_function.patch |  63 -----------
 .../dhcp/0008-tweak-to-support-external-bind.patch | 117 ---------------------
 ...kefile.SH-Pod-Simple-requires-Getopt-Long.patch |  34 ------
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch |  32 ------
 ...trfs-Remove-unnecessary-fs_info-parameter.patch | 116 --------------------
 6 files changed, 416 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/serf.m4-Regex-modified-to-allow-D-in-paths.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch

-- 
1.9.1


