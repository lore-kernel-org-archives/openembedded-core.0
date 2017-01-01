Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 80C9D65CB5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jan 2017 19:53:37 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id hb5so33412327wjc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jan 2017 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PjAclFCUEK2toEWEFGejLv2KXH1c/ce7OJFEYjlfK44=;
	b=kyIHkj+ne/xZf07Msyv9WnKfqWVNcXxmzaMLbTwbarWBU4+TdxBdzp8IaYlr3N60U3
	d3HansgpBH5ensu0xhE63TV9C4fM0VjTBmD1OXzVHDFDMawUOIEv9yWbhDiIQG798vpU
	+/9zQ/Mk+Uvz3LTIsjS+ElqLs1AKJD77fOh9dcc8DnF75Ds1U1SIEaYYknnFZTL7OyZL
	VDhFtJQR0IE9HXjsgsA+Lrd29Xz3SZZg4+0imt7+bYbSmtXp3baqws38SI66g2yBkhxO
	wJuIRkhhcjn+5rsJ1LRVPPamJIoCUiavv5jhhdj3fp0v3yb7ZBGxBaK6r48LGJBcB2Xf
	Hj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PjAclFCUEK2toEWEFGejLv2KXH1c/ce7OJFEYjlfK44=;
	b=Oq6EmSBflFuLNle1gfXyVL+mGSnCWt1GUokL7JP8mEP2hHgW4/S1q/XaKRiLkk+DmA
	cCdwq6gBmORfscXOiVQVfTaB6GVxL1usGDSzUXliK7pMuuE9KWE0J5DSlX02P5VtD0oi
	Zypit66Ab3qJ1/H+uSFJ+qsQuw5K50l8Sp3UZiPHJxLoG1Xk+BKLYTrzI7bfEgCe1YjX
	HjmJxCY/bpol/rzg2YvrGLqbyRoBcDwC6BcI+4bzxNs8+PYQy/7fcmVtcmwbVpxx6tys
	9mq3C555bCgHl4oDLOcrXQQb36Wv0Yl2IBQKxtkvHOUPalAX6uOf78FzJ1Gf9qCr1L/v
	4DQg==
X-Gm-Message-State: AIkVDXLHEy8PJkTD6rpOoJ0Tr2TA0dfbgM0J49obYo5R354WNJew2VRLRwHLTSxPE2aWnQ==
X-Received: by 10.194.249.72 with SMTP id ys8mr54749791wjc.92.1483300417750;
	Sun, 01 Jan 2017 11:53:37 -0800 (PST)
Received: from localhost.localdomain (p579F77E4.dip0.t-ipconnect.de.
	[87.159.119.228]) by smtp.googlemail.com with ESMTPSA id
	t194sm63631951wmd.1.2017.01.01.11.53.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Jan 2017 11:53:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Jan 2017 20:53:13 +0100
Message-Id: <1483300393-10174-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] alsa-utils-scripts: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Sun, 01 Jan 2017 19:53:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../alsa/{alsa-utils-scripts_1.1.2.bb => alsa-utils-scripts_1.1.3.bb}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.2.bb => alsa-utils-scripts_1.1.3.bb} (100%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
-- 
2.5.5


