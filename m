Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C2EDE77E68
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 04:42:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w69so11066114pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 21:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=70Tcj7AedAEvrswrbOeYQlP6CsMTdE5FL4Vx2CGdZ9Q=;
	b=eyxHA44jnrYWwSnya3w8Ki9vQ45zJi+nQqe/zG45Abq1sd0SYM9Adt3bnKMFLHn/Zi
	iaCdXN6xFfTHOtYbTJoHj7f+zYAP3VzYnXENGCWskoCfGCSJegAP/A0VQzlGZDXDKi+K
	uv0HrBemS26i3YdVxX1wljnBpS/ulvaMtUUQX/sYgi6cTP6MrHSlTesIlgGNfXkK6gPK
	0hmOHqz2MB3v47YKApMTAqXy1Lk5EAosS6RBnVsM3ZQsgl0Wk1iDQY7A25g9TugNKnbi
	CM7DpITuAk1wUasTsPE/QV59P5qFpAoszFSUtr9FSwoxteAwx8H8SCJdbjnsMXFTqj2B
	snfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=70Tcj7AedAEvrswrbOeYQlP6CsMTdE5FL4Vx2CGdZ9Q=;
	b=OBeoU+VGc7V6K6PJIqzkxKFDmKp/vPwRK3AatrItu0wrI8OmQi5jigO7/kDABNzhMk
	sob7NAJB/oY/pOafY55zS5atllJe1eLd6JxsX//Mwz+kkV4qzd7BkUN8e/dkyI9hvovB
	yb11RivwF2NCECjKPat05XapnVefwbl4r30FOZn9juko+8gf2GMR8dEswQjff5VRcwcP
	FjIHcOI3WubSCor5gCkP+1y1xpYPCWIvJEr9LVysohk8l5Y6NZmp2h0YHODyWsGfW52v
	syhZnd77U7eWJqAJj6d+MuVg2+YfVqJ022N5r9SbvEmOgxFxGlWU46FTyjGkKLkkY8eV
	0fBw==
X-Gm-Message-State: AODbwcBkQkVbuW6NVFWOKLQJAOJ/bU8mX2stfTeSH7Ayo5HIGYO4t0+M
	buNS/N5P5kxn40TY
X-Received: by 10.98.192.80 with SMTP id x77mr4902409pff.1.1496378521589;
	Thu, 01 Jun 2017 21:42:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	t66sm37003163pfe.134.2017.06.01.21.42.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 21:42:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 21:41:51 -0700
Message-Id: <20170602044153.9629-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH 1/3] as-needed.inc: Compile pulseaudio with --as-needed
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
X-List-Received-Date: Fri, 02 Jun 2017 04:42:00 -0000

This effectively reverts
commit f06e99d194eda49ee194f8ae401a23819e61b90f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/as-needed.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 114d377eac..6a8ad9d624 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -8,7 +8,6 @@ ASNEEDED_pn-openobex = ""
 ASNEEDED_pn-icu = ""
 ASNEEDED_pn-pciutils = ""
 ASNEEDED_pn-puzzles = ""
-ASNEEDED_pn-pulseaudio = ""
 ASNEEDED_pn-rpm = ""
 
 TARGET_LDFLAGS += "${ASNEEDED}"
-- 
2.13.0


