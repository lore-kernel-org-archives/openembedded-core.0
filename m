Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 82DF274A0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 21:29:53 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id f189-v6so7898960pfa.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 14:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hgz1lDm61UmT2zy7Mn6FoUWNpggJ9/cUb4CE6Qs6C/4=;
	b=D+Vz/tHoxMmfzksHcawNAlRt/HqbTSuxMN5arRYoYBsne4oRw5BX53V65t4oCP8ije
	ljEX793BmAZwA3rA7NMqZi1DPSwaYpOSewAMjrUhdipVqa/9Lw2HvtWRzXptDaSY/Xjr
	Yf049PAYopYuKoPs77b0/g6ayuPwBF9HE3NDI5qMiw607CswdI1qZXlk7Rmkb/jzGi2B
	y+/rMV8hbKzU0Wfwv9aSq+c1sKmbePOHE+VVS+SMa7ukb/AZkeQt+xCacw/AZlYDUmO6
	Z8IpTJENR63PgTY3auiqFhME6WexdARlMNJ9nriyzVCto0ceXA3drzcNH1+mUI6khC9e
	ZkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hgz1lDm61UmT2zy7Mn6FoUWNpggJ9/cUb4CE6Qs6C/4=;
	b=tSJFkn5zr5GSmKbr6GpGIs5NEK7f2vj/fiysCKqMKVPJy9Zt57QoP2xOP/LqAktofI
	d7fXYVvpxaPydaQClN2Hb5F1RxgKJCtSRbblQTdVBwnY7gGumM2AsgoyiuxygirjsptH
	23Ue8EFmLri2O/0wgB6PZaUnEMrsoYKJCipL6IdoCstB0lNlGg3yoKXa7S+Vn8rWse5v
	DQX3oW6WQpndnfy/vbfVjBu0IzdqXorqK/TUpd7T0WbJ96PRIjAE4mjcKKFyQ5WHp6g+
	B45FUOelQDg8PpVhLongFLrK2tyr5ECvNhJMXa0UfL7mXGGGBJf93iTjsKm1FrOQP0+p
	YFog==
X-Gm-Message-State: ALKqPwfPQzgIf9ThvEy/XowoNIxMGi+63TzD8vaNvzSq34dGIGVi/IiC
	zAxmaSH0stn9pWSLFNiDwHl5gA==
X-Google-Smtp-Source: ADUXVKLnujtXjaqru4Bj3VWHRUTcPkCYgVFwze+6HcmtYYOKMJG3L3mRdCOqH0qLHo2MAMngXamjbw==
X-Received: by 2002:a65:6250:: with SMTP id q16-v6mr69667pgv.113.1527629394220;
	Tue, 29 May 2018 14:29:54 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm24362pfa.34.2018.05.29.14.29.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 May 2018 14:29:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 14:29:43 -0700
Message-Id: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/5] drop as-needed.inc
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
X-List-Received-Date: Tue, 29 May 2018 21:29:53 -0000

v2: Rebase to latest master (where the previous ASNEEDED patch for
    distcc has been reverted to avoid conflicts with a distcc version
    update) + add new patch to fix bitbake.conf typo.

Andre McCurdy (5):
  distcc: move ASNEEDED over-ride into the distcc recipe
  as-needed.inc: drop ASNEEDED over-ride for openobex
  bitbake.conf: drop obsolete commented out value for TARGET_LDFLAGS
  bitbake.conf: include ASNEEDED in TARGET_LDFLAGS directly
  bitbake.conf: fix minor typo in comments

 meta/conf/bitbake.conf                      | 9 ++++-----
 meta/conf/distro/include/as-needed.inc      | 7 -------
 meta/conf/distro/include/tcmode-default.inc | 3 ---
 meta/recipes-devtools/distcc/distcc_3.3.bb  | 2 ++
 4 files changed, 6 insertions(+), 15 deletions(-)
 delete mode 100644 meta/conf/distro/include/as-needed.inc

-- 
1.9.1


