Return-Path: <matt@madison.systems>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id BBF4D60796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 14:35:15 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id q3so41293619pav.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 06:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XltOKNUiL4bHwA2nPQO1ch8Oj5mF2DPhmi0SLGg/BUI=;
	b=Jtqa7agdmjxppr+3XapINgbbieepYoWmg2cG9yxvNJSk4v7sIIwaMm1sEw6qyUkmgn
	XzVqWMktqpdTJyAKOFF0/MUPXyqzbATvgOzEa7hmjYsuwTfs63wGScI6HFHPWFwfuM2p
	j1tjnSmvXG7P46CSdjYDFiQBIMmTFKZyCp9M8ucGFn9GUS26AVrWp+OguCbLe0XLYqld
	EwbLlK98ROJ3zy1DU4sRg4QctSNmA6pTwgVYo5NQfC50CYC0ykmQYn2qeNoW/8dfRToA
	LELvKhVupxS3xPd8idKYUAMZCcvakziXOPHtqbzbBpvn0az37khJl0ypdws1tn6EWrhI
	8y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XltOKNUiL4bHwA2nPQO1ch8Oj5mF2DPhmi0SLGg/BUI=;
	b=USOv8mZ2VZcWrLgpn63HT9BoF3V2GgHIXEjGdtGV8uCafWS5M4+cl/71wU2dPKVeCn
	hts7zSkRmuJ4L7XhJ8V+j4mlbNZLC4/FuKHS6gX29QOuLqvIOGmQl6kbuamEfPvdxcFt
	0dhvGOH0ZEnODUn5LkIwbhc9dIFkLDRriPSzeTLhcC58FWk+tEmrrCris0u2PggQnl3l
	NOqXwaF8L41WH6h4TMqZpovbPb5Zo0LyYG5+xtIkJph2JUMi823rk3Yri5eFvj9mXKUR
	rMEE+PiylkKsVHXftKcg6bJHMfYS36myinmAbJCTrfEi9OXOaLllA3DFcXFo/TGwfO5f
	9rDw==
X-Gm-Message-State: ALoCoQmm7Rq2TjGMWvPK6il6dK1gW/pOpDfkD/Xizj1m//4A1BgwUmJfTCbN+pJcIUUOHXq0cXVrYfSvQjE7AhOl0rTy0tbx6Q==
X-Received: by 10.66.162.231 with SMTP id yd7mr5603269pab.98.1450449315853;
	Fri, 18 Dec 2015 06:35:15 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	l66sm18429653pfj.71.2015.12.18.06.35.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Dec 2015 06:35:14 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 06:34:28 -0800
Message-Id: <1450449271-28582-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2 0/3] Debian multilib packaging fixes
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
X-List-Received-Date: Fri, 18 Dec 2015 14:35:17 -0000

This adds a third patch that fixes the problem where APT couldn't
resolve dependencies between when two packages of different architectures
both depended on an allarch package.

Matt Madison (3):
  package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
    function
  package_manager.py: fixes for multilib deb packaging builds
  package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages

 meta/classes/cross-canadian.bbclass |  2 +-
 meta/classes/package_deb.bbclass    | 37 +++++++++++++++++++++++++++----------
 meta/lib/oe/package_manager.py      | 17 +++++++++++------
 3 files changed, 39 insertions(+), 17 deletions(-)

-- 
2.5.0


