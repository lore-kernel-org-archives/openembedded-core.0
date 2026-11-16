Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32646.1794847845380652341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lJP+FQEn;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b904d10882so1467038b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847845; x=1795452645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLQKCKypQH3NMZrtv4yuei43JIV/sBCp2pPZjburRtc=;
        b=lJP+FQEnIopz58GWkTWtZoDzBgtqPIJ1zGWjXynAoWnUi+HdvxwUJaV9D+AwojJmm5
         ExjMYm4wWIahV4FNx65+kjstdJ5Ws7u1Ho5LXbnMpFmWPOapK1lQvxfV46vKCz2C866E
         hND/LAsuMiTLJj8CpGv8HXglgfqE5mfMNT+JtIR3yUkSAY/iVJ/kwbgJ+aMGfZA63a/B
         JuDTTnPbRgjox76c0UaW/8cX1yXXbUa0MHLB/oQqPmBbD1cjmO3SVFRtooxkcMU07kPf
         TdIxTg3hMi3tyB0Su4C0DDBJ9IE0dXb2ckUQN3NftFTXGjwVHDPZJ1Wsib0uAHTi596x
         Fvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847845; x=1795452645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLQKCKypQH3NMZrtv4yuei43JIV/sBCp2pPZjburRtc=;
        b=fnE4+JA5EUoq45V9XmNoJHZophqQplxrH1xU/+ge7mi9iiZybTq8H51KQFP0RHp/uw
         cJ9ESaEzcZLQHmoH7iuB56kiO/D3V5pArScbe1/tPoEPMPxyb8cGUM6c8x9LUHHQxufj
         wwZvGuvG8gSC+rsCvAoQ7DWksmaNOKpwTdptu9ZOFZuWpqlEkZPFU2rA4rHPAVKvAvWK
         krrkjMI0j84SFwLtosdely3mLQb1b8698xcOJ+eTwFYp8Qhsccpv05gNzyvPZ8JRHzmJ
         7VnHS2BnxTjLg8WbZ2r8a37kT9079CmGY+9TGjBabsJo7NVElzUl5if61psI7sNDaVuJ
         ZAhA==
X-Gm-Message-State: APuU4Z9N5YbeCInZc+wFEezBqr04Oa9kgQpucbqz065hdBfuv+4501KF
	SvjOcN3y1vpKDR/1B5xD6ti4NoBXtqmfOImTQ2T1U70Q08U+4EIa0c74Id593Q==
X-Gm-Gg: AYBFou3loVp2CtIbETf2Fbp4fmkyGDs7yd0FUN955c7v03yVtriJSt6N8BbF/M1e7XA
	zdsFGJw1S1f0KRR6gcGCf6R31H/0cLCzIanvFtCKUuTYrgB+QflWGZ4pASI+F4bj46V6YM2rBi2
	HMgVIbLN6GKF2eQDtphoNBrdU/nFyNEC1cQ5G9a7NlC/KXaVIPSrVuG8UyL7rD8WcQN3EUwfu+G
	2KDJFYg+VyrvS9458QkMD+h3OEVw9QruVZmxJQX0IASikYBfrsQVDvwWV896DAn0tzUnLkABRYR
	uvkiD6ZxF0lWbzvt8bPNAKhzDn09t6KEIz8X4thOmOEhbH5C0Gn7/Kf//MkN3MaW1qbwSHZn5EW
	/nzcmXxjcEJUpHaHfqztA1tl8k5qPjosudiGh7Tq/xImp73C04XiTKnCr5ugoe2xwxTlYjvxZ+z
	SYbYg7NLQi5Yn5gi5dbziGlmWbj+AqnsUWEPJXaTfQ3fA369gZj4++8koDIpoAy6xkj3G6ZmBLW
	93Ugzh3nQAL3Y53Xu3c2do7yfFfCiDCSLhPFbBPwfaYXCNUPeT2ZmRr4z7L2OgiA0SHyeVo6Enr
	pcwLx8h7V+xVAbME6jvB5XgKoF14p4jjc6M44tWaXv7kUao+GoavHPf0zk85gA==
X-Received: by 2002:a05:6a00:1a92:b0:898:22b4:c8c8 with SMTP id d2e1a72fcca58-8beb1fd9ddfmr9599485b3a.2.1794847844520;
        Mon, 16 Nov 2026 08:50:44 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a902esm3974561b3a.16.2026.11.16.08.50.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 08:50:43 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 0/3] distro_check: fix the Ubuntu and openSUSE package lists, drop Clear
Date: Mon, 16 Nov 2026 08:50:29 -0800
Message-ID: <20261116165032.1829-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250366
Content-Type: text/plain; charset="utf-8"

With the fixes for bug 16503, create_distro_packages_list() still got the
wrong Ubuntu release and no openSUSE or Clear lists:

  NOTE: Distro: Ubuntu, Latest Release: xenial, # src packages: 3456
  WARNING: Cannot fetch packages for openSUSE: HTTP Error 404: Not Found
  WARNING: Cannot fetch packages for Clear: <urlopen error [Errno -3] Temporary failure in name resolution>

1: Bug 16509: the Ubuntu archive ignores the "newest first" sort that
   find_latest_ubuntu_release() relied on, so it always took xenial.
   Use the release list that do-release-upgrade reads instead.
2: Bug 16510: download.opensuse.org's listings now link to "./15.6/",
   still include Leap 42.x, and keep the source RPMs under repo/oss/src/;
   Leap 16 has no update repository.
3: Bug 16511: Clear Linux has been discontinued.

With these, all four lists are fetched:

  NOTE: Distro: Debian, Latest Release: 13.7, # src packages: 37593
  NOTE: Distro: Ubuntu, Latest Release: resolute, # src packages: 3053
  NOTE: Distro: Fedora, Latest Release: 45, # src packages: 23237
  NOTE: Distro: openSUSE, Latest Release: 16.1, # src packages: 10638

The new cases are covered by oe-selftest's oelib.distro_check, run with
plain unittest (not oe-selftest).

This applies on top of "Fix distro_check when a distro list cannot be
fetched" (bug 16503):
https://lore.kernel.org/all/20261114200810.31078-1-tim.orling@konsulko.com/

Changes in v2:
- 2/3: use str.removeprefix() for the "./" links (Richard Purdie)

Tim Orling (3):
  lib/oe/distro_check: find the latest Ubuntu release from meta-release
  lib/oe/distro_check: fix the openSUSE Leap package lists
  lib/oe/distro_check: drop Clear Linux

 meta/lib/oe/distro_check.py                   | 59 ++++++++++++-------
 .../oeqa/selftest/cases/oelib/distro_check.py | 49 ++++++++++++++-
 2 files changed, 84 insertions(+), 24 deletions(-)

-- 
2.56.1

