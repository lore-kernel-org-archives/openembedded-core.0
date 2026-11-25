Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44778.1795622112080662091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 07:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Wy5Wn0Vd;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9217fbf97fbso3763726d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 07:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622111; x=1796226911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=372rU6O4AbMN/6eua2jq5ckVmgl63xkGfJF/P7FRPD0=;
        b=Wy5Wn0Vdw6ACI5jTpriJtPGyPPINo5QpRkjsE8FB+7Jh+QYj65/ELy+E8Ex2ND00QW
         0vhmpnEB0IepBKPH1LaYALP22mqKqBs2t+t5XQrQ7JsS8YWsaJq/0sCXRzXaEG+1LsJg
         ++u/Lmsm0zsZI4TKMkEKqfihvgWVNzwhAdGJyZieXqbw2gCuebAyYZSr3SXBHRyZCJIV
         VL1f4OgxXIKOqjdFPu8ojmlE/kXMzwlinNwRwFG55Ya45JnUpTeRQ4Q+M8AorpganPzJ
         pPogjodGZBwgpBt1wkLJr9NH0ha+rP5GA8uHabOXbfm0rs9t0ln2LuWAcAv7ciqQuv2G
         nRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622111; x=1796226911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=372rU6O4AbMN/6eua2jq5ckVmgl63xkGfJF/P7FRPD0=;
        b=Q5JyZjP+vVurV1A0SofCBtZXRDAjSbEFeqLshhLZmxIowavw6EJ33IoldYAWuF03C5
         FQwBH1fn5G7gxH7Z9lQfy+76itYt6KM3dPFAwtLbBdjvuIrtAnjDSvtd7umR0XCeye+l
         K5SC66fpWEGb0HV6mXJYfHTMJKvWhC+ljbMpZKyq5cQvbcPQEk4Y3sNh5Y782A4FEyFQ
         hhwQp1zkFi7pwiXiXYQ6fyMTONggkv81qP8cHikmm0OBoZYbvDNAmRr1huGtJv1+EcOr
         329RBzFtkZnhp6he6LxmDciKvcz5/P++E5l2cG6JVm8CQT9aAKrmpy8zPRuclQBCiF0z
         iSFg==
X-Gm-Message-State: APuU4Z+2dRhts0QfQ3h5RVce47kgi6fXBrEHaJDlr/idtKiyg14V1z9b
	+AFzpgkLzhCdkZvXALtjxwKKIMdBYJJxbIXg7R80I98Xp/0He/KqSquLhXZ0Ig0896KGKgyUwSa
	BGiJd
X-Gm-Gg: AZFdTZeCNpKGzgn9c04viJiOh/PR217wUjA0Q5PerStSK/7q3/krr0YwyMazM+YvYDF
	aLvyYr2c3FY9Ytoxz9L/pc9sfwHoe5aS5KeDAWoBzZBKlpV0jA3w+dCf3ija6oyZIbUrmfj9CnV
	+B/j5B59QMt876OUsobrHqO+ywOnI+Q0njDJpXEZuiAYXW8T7tLYW9wTNashe+H7nF2VtytKeBX
	W6i9gRTf4bOYqJ51iW8FRUS4doFUwLt1ZqNAI4mXcWiWWZ66bo3FzJOxLs+VUJqDYCVOXOLsHud
	n3SHF+B6GCxuWmv9U86GuZ0Flnb2znLWZcqOTClQzuoHUGE7FPz3ZMgLmz5Ct8FaxDEWESwZKfQ
	02BpXT8difxC5u8ObDg0cY/ckZw23S/OFrUWP2AwfbD9RRDVyYzcHXHju1cHaykRpuRPrLy8ukz
	nXPY5g0KJ9d0FbP6UXg0VoQD3XnBNHBlCtnkiTzzftdDS7lG0p5zH4mSEcol9VIBcSvxHUZWNnW
	w825go5tHDONE0yMhopsP96zYDlFsiFNxVoBxD9/AJLtYMXC+LntJjAF/FwRzMeVWsmJUFhXAQO
	BcNVW2x2ixoQaPsyRQ6v0niRYsD338Slem50GBNsy8GonpxiNKU4TElc5mR+AsXwINctKInALrA
	mf2FK+3rszA==
X-Received: by 2002:a05:6214:5196:b0:921:199e:553f with SMTP id 6a1803df08f44-92134969053mr348610386d6.1.1795622110540;
        Wed, 25 Nov 2026 07:55:10 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm167601326d6.15.2026.11.25.07.55.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:09 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/6] add hyperfine recipe, improve ptest-cargo.bbclass
Date: Wed, 25 Nov 2026 10:55:01 -0500
Message-ID: <20261125155508.3024814-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 15:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251197
Content-Type: text/plain; charset="utf-8"

This began as a "simple" attempt to add a recipe for hyperfine [1], which is a
very handy benchmarking tool we could use for statistcal analysis on test
targets. Once the ptests were added in a follow-up to the recipe patch, I
started hitting issues with ptest-cargo.bbclass and the way that we're deploying
test binaries, so the final four commits address that. The last patch changes
the way we invoke chown - if everyone were using Python 3.13 or newer, we could
stick with shutil, but this would break compatibility for older distros.

All of this has been assisted by Claude Opus 5.5, except for
'ptest-cargo.bbclass: improve test binary matching', which I ended up going to
the docs and reading a bit for. I think that one is correct, but if someone has
a better approach, let me know.

[1]: https://github.com/sharkdp/hyperfine

Trevor Gamblin (6):
  hyperfine: add recipe
  hyperfine: add ptest support
  ptest-cargo.bbclass: improve test binary matching
  ptest-cargo.bbclass: run do_install_ptest_cargo as a postfunc
  librsvg: make ptest symlink creation idempotent
  ptest-cargo.bbclass: don't follow symlinks when chowning

 meta/classes-recipe/ptest-cargo.bbclass       |  29 +-
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../distro/include/ptest-packagelists.inc     |   1 +
 ...riding-the-hyperfine-binary-with-HYP.patch |  38 +++
 .../hyperfine/files/run-ptest                 |   7 +
 .../hyperfine/hyperfine-crates.inc            | 274 ++++++++++++++++++
 .../hyperfine/hyperfine_2.0.0.bb              |  32 ++
 meta/recipes-gnome/librsvg/librsvg_2.63.4.bb  |   2 +-
 8 files changed, 368 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/hyperfine/files/0001-tests-allow-overriding-the-hyperfine-binary-with-HYP.patch
 create mode 100644 meta/recipes-devtools/hyperfine/files/run-ptest
 create mode 100644 meta/recipes-devtools/hyperfine/hyperfine-crates.inc
 create mode 100644 meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb

-- 
2.56.1

