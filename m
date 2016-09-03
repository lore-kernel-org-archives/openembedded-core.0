Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9162B77181
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Sep 2016 00:12:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c133so4769163wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 17:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0mZ0VbUt6O/ozwjwRC+OQRNB/Hkqk9hayuHcd5XTBDU=;
	b=KLT6lTnJE9ObdlAcNvoxQgJHgkk0+xe/mmcAFkUmvzW8QLCTGzd/lP4SKiLIsRzWdY
	m1aZorOOZX9m0r2/9LfydcuWeNCscnviUvLxkI9J3fmh9NLv9+mTwVFLxkTD522o+NTj
	DgY5A1I/r3BhxaMZ74FCVOWUqhPpTOIjvoxTZWntf6mvZojZB0JPi9TjaHaL6W/TzPp/
	fJ+/MByZ3WImJL1ACN734ovxUv4OfbmB4r20pvfCHTURmHqY+fr9sSbJ20uqYr3CrC1L
	Quo8GLcZVq7ks4xLYz3xl/n5OrY3MCgvT4+DAxr3qwtkuDCKos8KbfgrsLXg09QtZ6B3
	eg+w==
X-Gm-Message-State: AE9vXwOOzTXG8Yrhu/pRLBHqRYghTuCtj8gxuVgl45lVE9jKKCHQm7afTi47FVfoRbDtZg==
X-Received: by 10.194.58.112 with SMTP id p16mr20938337wjq.24.1472861553927;
	Fri, 02 Sep 2016 17:12:33 -0700 (PDT)
Received: from tfsielt31850.tycofs.com (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27]) by smtp.gmail.com with ESMTPSA id
	a3sm12765902wjw.15.2016.09.02.17.12.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Sep 2016 17:12:33 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2016 01:12:19 +0100
Message-Id: <20160903001222.2864-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160829110341.13100-1-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 0/3] boost mips16e and soft-float fixes
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
X-List-Received-Date: Sat, 03 Sep 2016 00:12:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v3 changes:
patch 2/3 completely redone, should not break in -native
          anymore, better standards compliance
patch 3/3 has been merged, so is actually a backport now


