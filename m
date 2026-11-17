Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16513.1794918302968356314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=HFEHD6rw;
 spf=pass (domain: snapchat.com, ip: 209.85.128.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so54592815e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1794918301; x=1795523101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNRGlh5u6COlE5L+fvP3uiEbAU4OA+15jV0Mz45wabo=;
        b=HFEHD6rwk2RSyR6FHY75PRXyJgj0PXnrTVff79y+EHw877RNgc0vGlkBGb0IUCB22J
         BhCSY/Vl8NiCwjpsUP2vRaAxaZo6apeMaYE7+MT6YKmpmCHV1WTSNxqO4s5+/hphjhfz
         XQYcYPxD9CbhoSXyctt0MwdZvOEptYSwnhbJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918301; x=1795523101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNRGlh5u6COlE5L+fvP3uiEbAU4OA+15jV0Mz45wabo=;
        b=g+t0vBrPQNsUB0A0Ca+AnBewU/1FZUlYmpDOUl4T+Xt0UuySxa9s6yQ94PneURO+p2
         GIZ809FXn2mM7QVes3RwJa9k6c9vK34Fo2AqG+O9XkOrS8CjAlPsNBgdk1uHnWJhRoZ/
         bwENRALhlrrrQz7FOxDWYgWC0+Fo7NTacXw7/Z8yP6OJ//OdOaevlfBDr1rlQuyghrCx
         GuGhvnfIbSATAUHi5/Gl5wQCXcxihjA4tfO6sJbu4zYRxDv6Or9MjnKgpWFVEicNpk/l
         RBPrj98bcoTL+ASPSG4Ni5dzzpkrwqgkfmwkpKgz3YRhOyrSbyDaHzmGq3XimI+oJ7di
         48GA==
X-Gm-Message-State: APuU4Z/vFDFeGaWs7U3Sgl639I9H/jjIIdBgQ//Ma1yhWRLRcOJ95Hgo
	X0zi6o9+//L5orCDOek/4xsDpBZiGaCHvj63sCAGVJQN5zCc+IvLW1ysHs6IxpQ2NeUDMx1SXR6
	hMJ6N6eI=
X-Gm-Gg: AYBFou2ptH0cu++1suQfkUSoNoxRXRqN6eurvPZiNmz4za9YMAnTzvYX7za+72nmfg3
	hg9ogqibwbKRI01QuEpBpn0hBoDCEqA9cVUfC+VoNIFHBOvTImAzbobLqt3Zyq43iuJu2RtuGkF
	79XPt+uxaCyB40AyADAGo+40JQUpCPuQhX+dGFWS6yf3MkUTuDV+V0HJ5xAyUK7M2cUpaibgnpZ
	5hVo6nRxm+u3nsp0XXIQw98VmnFR9u462qHN6+2CP8BOr0qR/j0TGUC3PIK7sE1bviCR+Glj4VI
	tN6DIz8h1hKJ34A5GZNhL3XfvgJA1jdVxSzDedQnzJUevolxjJ2fUSyvPhv4A5Xr0XrekiPMc7X
	nD/cAjYroqfKYZGcL0SwxpDTsO3/3ktQHQ7lrxuATOI6gFsc0fHj+MGdTR5sk1S2Ge4j7zu1uiN
	ov/JH4bSW5g/krNqQ0JfjnsaQEId1NTzB1ClSQe3HjybxK9j5gc6uuZZkGuHmMNmVLSsjVulMFM
	vEoWnBg5L5gO+wRM21n+EMsMLjvYfR6IToWa85retinKwu8/eSaimeFJn+J8WnPuKQ6XOipktit
	PwgX5bOU26VYkjy92zs+0gtlSoi6Idtc1hALzHyTM27VXKHn6whXOFH6sYUiUqSVLyhGWvoYmAD
	jHvFaiaTd9L6w5601jQp/MBAoeOZ+Uz+juILM1iZ2bPnDsAUeXXa9GdMP
X-Received: by 2002:a05:600c:482:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb55a59c9dmr210459265e9.22.1794918300746;
        Tue, 17 Nov 2026 04:25:00 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm26284925e9.4.2026.11.17.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:25:00 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v3 0/3] archiver.bbclass: archive shallow git sources which have no clone
Date: Tue, 17 Nov 2026 13:24:54 +0100
Message-ID: <20261117122457.435864-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250438
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

As feedback to the v2 of this patch, it was requested to modify the fetcher to ensure that
localpath() exists when do_fetch completes, in order to avoid the need
for special handling in the archiver bbclass.

This v3 series addresses this feedback, and requires the bitbake
change "fetch/git: return the shallow tarball as localpath when there is no clone"

Etienne Cordonnier (3):
  archiver.bbclass: archive shallow git sources which have no clone
  archiver.bbclass: remove .git from original git source archives
  archiver.bbclass: fail on sources which cannot be archived

 meta/classes/archiver.bbclass            | 23 +++++-
 meta/lib/oeqa/selftest/cases/archiver.py | 91 ++++++++++++++++++++++++
 2 files changed, 112 insertions(+), 2 deletions(-)

-- 
2.43.0

