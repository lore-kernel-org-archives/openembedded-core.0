Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38879.1793004972291244478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=FIFSvXH5;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B9FAF3D818A9;
	Mon, 26 Oct 2026 04:56:10 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 9MsGxfzOVGEJ; Mon, 26 Oct 2026 04:56:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 829AE3D8187E;
	Mon, 26 Oct 2026 04:56:09 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 829AE3D8187E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004969; bh=xbtE+ooKZdujFqFAU9n0g5p4q7rhanI+YFLOxk4PS0Q=;
	h=From:Date:Message-Id:MIME-Version:To;
	b=FIFSvXH5JTVzZASiImmqRIj5QPyR+ZeIRRZ7uCrQ7qs/F3dHc3vizpnMYFd8/JX11
	 yf7iJTZ1qWU2Gi1psh3JqH9UDmRMLevN2oX8y0ig18tZvb+S4GTRAHbVb66HrFv1qq
	 ldVfObPIB5X+7KCSJbQlXxaPP7cyKrdfxjY/1qgPevMj4x+zrNutiu/Mlt5/Ej+WYL
	 jZh8Scn1GdfoEUTVQkKQaWNGJqqVslJ/O2jM7DnWbKnMORaLEGVpXyhaJjVACrTeEu
	 y2s8rstXfIL+FOpigwd4dIKsCo01hMofXmdI/3qHoKNQiim7dGezbhdDnpMuIq0fXa
	 AiWhuZJlBYZCA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Cs_old7UyTVU; Mon, 26 Oct 2026 04:56:09 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D15D83D81844;
	Mon, 26 Oct 2026 04:56:08 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH 00/20] devtool: ide-sdk: add support for Rust recipes
Date: Mon, 26 Oct 2026 09:55:38 +0100
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXYhWbEUryI+xGTabpVGsrUIp
 Xc36uM3MP9GhqIwOjcbFaxqmucKf2gojmEewJqqSZy03olwwrrk/Kgz2NKdYyhD5uTc0Z+6AOk
 91e+zoNf3r3u5/m2v24S4fGO07x9v6PeYeQAAAA==
X-Change-ID: 20261022-devtool-ide-sdk-cargo-d003158ae2f1
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248638

Hello, this series introduces support for Rust ide-sdk VS Code configuration
against the Yocto cross-compilation toolchain:

 - editor symbol resolution and linting
 - build task
 - deploy task
 - debuging

It introduces a cargo-example recipe, on the model we have for cmake or meson.

The generated configurations can be portable to standalone SDK installations,
by manually updating the paths.

I reproduced the selftest coverage that is expected from other recipe classes,
including configuration analysis up to actual debuging symbol resolution.

I largely used AI generation to write this stack. After many iterations, I am
finally happy with the code and commit history quality of this series.
I also have a documentation commit at the ready for the manual if this gets
aproved.

Any feedback is appreciated. Hope this will help lots of Rust developers
working with Yocto distros :).

Cheers,
Enguerrand de Ribaucourt

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
Enguerrand de Ribaucourt (20):
      cargo-example: add minimal selftest fixture
      devtool: ide-sdk: capture Cargo cross environment
      devtool: ide-sdk: export recipe Cargo configuration
      devtool: ide-sdk: recommend Rust Analyzer for Cargo
      devtool: ide-sdk: configure Rust Analyzer for Cargo
      devtool: ide-sdk: share IntelliSense architecture mapping
      devtool: ide-sdk: configure Cargo C++ IntelliSense
      devtool: ide-sdk: generalize binary install task name
      devtool: ide-sdk: extract install task definition
      devtool: ide-sdk: order install after optional build task
      devtool: ide-sdk: add Cargo build task
      devtool: ide-sdk: enforce LLDB for Cargo
      devtool: ide-sdk: parse Rust debug path remaps
      devtool: ide-sdk: remap Cargo sources for BitBake builds
      devtool: ide-sdk: map Cargo workspace sources for LLDB
      devtool: ide-sdk: map libstd-rs sources to Rust SDK
      oeqa/selftest: share source breakpoint lookup
      oeqa/selftest: run IDE tasks with configured environment
      oeqa/selftest: debug Cargo example over QEMU slirp
      oeqa/selftest: verify Cargo rebuild and redeploy

 meta-selftest/recipes-test/rust/cargo-example.bb   |  15 +
 .../recipes-test/rust/cargo-example/Cargo.lock     |   5 +
 .../recipes-test/rust/cargo-example/Cargo.toml     |   8 +
 .../recipes-test/rust/cargo-example/build.rs       |  20 ++
 .../recipes-test/rust/cargo-example/src/main.rs    |  11 +
 meta/lib/oeqa/selftest/cases/devtool.py            | 310 +++++++++++++++++++--
 scripts/lib/devtool/ide_plugins/__init__.py        |   1 +
 scripts/lib/devtool/ide_plugins/ide_code.py        | 125 +++++++--
 scripts/lib/devtool/ide_sdk.py                     | 247 ++++++++++++++--
 9 files changed, 673 insertions(+), 69 deletions(-)
---
base-commit: 39b27e524f3c092e5018cbed23ddf1829390ae65
change-id: 20261022-devtool-ide-sdk-cargo-d003158ae2f1

Best regards,
--  
Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

