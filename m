Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45196.1795622904926546450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Mf73KrF3;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92134c4592dso52602016d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622904; x=1796227704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTyek/c4neB0gDIPIwEHmqvUkFEpUKNekSv2/nXMbvM=;
        b=Mf73KrF3KaYAeKQ6z6d2Sqvp9SUkNkhAcv4D3iYFs9bITr7KHr+CqJ8mv4VGBpoMNw
         2lRBvdjMQJqrmhTYnPO8WBNWjYaof5aUx7CLnCco2GBgsT0Yt4D+0nbGQGxJnVPxyTPB
         9F1Dj5ITEZXkGJqpQlPUuXcvVCt2XlafJa07Hkpnl5aC2Xhr6tAziqyP0NDmLyB7ZJpR
         BZj/vzW+y2vykzkqQ+cN96YiVJHKrTnkzu2uZsfk3DQyrUiKwKNbTMVlTzkXmPp+f7lV
         slAEflbrQdA3wv1wFOv2rFu2RbEyG5db/u7ECZepXYTqRhKAGh6htoYU6ij73gg9Db2a
         8wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622904; x=1796227704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vTyek/c4neB0gDIPIwEHmqvUkFEpUKNekSv2/nXMbvM=;
        b=Gb1WQQWtVUAhhlUwLKHGqZpgjcP5n4/JdzF05ij/lBcGdzH2ouvjr132F0p2xQuvhf
         0cSRNOoXxQMPQ7rArl9OdlyPBYKEvPbrrRjeTjiS9GwCD8pXW8le7fI0ZgvSz8waCPRs
         4EBr6x3R3O8iSYiRQwLT+4Q+C+QUfOqudaceKcARbAFXpnf4mqE68b136fNxJ5CYXYjC
         M3JLpARDdbxfZapAQKDhDMZUJpBT1AffPJ3tnwP5pE2BUXAK/DggHrOAxc3vIHRr/1eU
         3WpSh56CXDDCP9hSsLCFwm2eR06pIwyE2dFoOCTIOglOtAQ2T1j1kjNjUMAASVx3GnV6
         drtg==
X-Gm-Message-State: APuU4Z+r42bSFMyASY7LsJIGHKRiVr3AN3riBEfNO+VNJsXNzKCfgMko
	GZgJHexUpQXgP7/cJmQBi99ya9htekkuOLEZp44JUuGLHTpSuXmNvrhJgSZdLeyp8Cm79WnpHUf
	+z7B6
X-Gm-Gg: AZFdTZc9dnVEPvds8geei+ehgLpQFdwR73k8N3mDtyJ1yPe8t2+CGUj5TwpYEwxT2XR
	zr4luoI2kxa3+ZM0xNdOCwxAaoze5POy0IEABWfZlpDAVNpmh4ItIKt6dw/gUZaxv399cr5jXJ8
	5lSzajfsBLisOP4Dz9v456eD901cKMdgRKpykajrfnPddslvbQencDiaL8+MMuy7hLYQYvvWOzD
	hWQQeaDhrbyZfqDrj108ia/7SIw1AInAMeJa3wEe8fHqpEy87IPWajxDfDUo7RVPQaqvyhrIlT3
	ufIk+huQ2GuqM3s3IcpBw+Sz9ljELEwXcWQKmwMhk5+xR+Oi/0Qkdy4FsRA8NC6tpaRK+R0mJs6
	y4UJiAuq/VlYdieENb6O9AsJcrjap2o/KDtwHIQlUMGFN/s26qJ7yDGrC47u0pAQNHJ/dVKGJ/s
	+UsRF3tzrHO9AmdqQ2vA/xkbApqFpgBmqIsR23F5L+9szC3NFXpfKKYdA2ZgEnSMI/tz6PCnvKB
	ROuNeLMdJojL+UT9Biq7px419Sjoo8okjEbqS7wdLi0wE+9A8TaafHon3ZD8hRoCUTNQiHCOpgX
	9CDjh/a2EMbfhV3y5BvhwRJgcOEzbYs3SU4zH7atXzkgyDiK46MNO573Hv76JYyKVLVXDVooLJj
	Q0UkQwYjV4A==
X-Received: by 2002:a05:6214:495:b0:921:2fb5:2fe6 with SMTP id 6a1803df08f44-92134a861d9mr339663246d6.34.1795622903585;
        Wed, 25 Nov 2026 08:08:23 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787f6847sm25849466d6.30.2026.11.25.08.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:08:22 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/6 v2] add hyperfine recipe, improve ptest-cargo.bbclass
Date: Wed, 25 Nov 2026 11:08:15 -0500
Message-ID: <20261125160821.3028875-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251205
Content-Type: text/plain; charset="utf-8"

Compared to v1, fix the second patch ('hyperfine: add ptest support') to add a
missing Signed-off-by and be more explicit about the AI usage there.

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
 ...riding-the-hyperfine-binary-with-HYP.patch |  39 +++
 .../hyperfine/files/run-ptest                 |   7 +
 .../hyperfine/hyperfine-crates.inc            | 274 ++++++++++++++++++
 .../hyperfine/hyperfine_2.0.0.bb              |  32 ++
 meta/recipes-gnome/librsvg/librsvg_2.63.4.bb  |   2 +-
 8 files changed, 369 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/hyperfine/files/0001-tests-allow-overriding-the-hyperfine-binary-with-HYP.patch
 create mode 100644 meta/recipes-devtools/hyperfine/files/run-ptest
 create mode 100644 meta/recipes-devtools/hyperfine/hyperfine-crates.inc
 create mode 100644 meta/recipes-devtools/hyperfine/hyperfine_2.0.0.bb

-- 
2.56.1

