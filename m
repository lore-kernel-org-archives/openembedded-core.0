Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9016.1794994171422226095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 01:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=T6xZFnke;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so6646535e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 01:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994169; x=1795598969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J90RROUdUzzNC8vEPTYmyTGpFdYcVc9o3RkY+v19oao=;
        b=T6xZFnkeKQ53yHqEA/P/2s8avP0dd0M4C8DEgt6eungZHBR05vj5s/kIh+RAQA09Rl
         JzvAP9pf9wug+h0eQYZMfXDA+FiM2aoKnl2EzNi7rhrwoKgusTOj+2mdXvbBCTuOVq9t
         3r5LkRJCga+46QYcNRP3Dtbg2VqXd7yvCQVQQF2Ju1Bpn73dS7pgodPZeDRgSTw5/DXO
         KGOK7aBw2fL0FPFO9RfVlmedUJMRoc3CaDLu3rJg4PydGWM88SwxqylyQJwZ+PYVQrNu
         4J4Yup2DCg5Rf5zR5sHUj9TECqAdq7hHw8E0oRaTgzbcxhxYLH4znv3vKHBy9GbOfdP8
         xe9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994169; x=1795598969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J90RROUdUzzNC8vEPTYmyTGpFdYcVc9o3RkY+v19oao=;
        b=HTXZ3yaRO+oI/slqiGNe0yTNmnrwCpTKgQkzynS5jPpmCMVsHZMyBuW55MMli45ly1
         +X4c4Wbqmj+NQzmxdcee1eL3p56wKj36qfA6z27vnOXR6dNUKfuHQQ9lDKz8T2U3w03F
         CMYJohybJuzSmDRNT/XNcsofA+AG+Q7tQWjg4b24kAYrpU3wPIBrochUHFZ7Bg+E2SqW
         1b/dbd6BVYIxNw/hD8proCP4crc/ZeVRpdVPHZn4zwllHO6u2XYpAWigaFmMX7kwACkP
         WkglnYDKTWM0ULdO49+F4OXJO79bPQTlzFIS/c4QFw9h5+4SK0K4vO4vH0z4SmVW6OzD
         ixuw==
X-Gm-Message-State: APuU4Z+Z5TJ5MqP65gYK55WYUWvXBXufYtD24l+4kcYx9L8PJ3oODsJP
	79ET5I/LJjSeeYdpZLbhVM38ul5Yb26CS/XA0iKXVPFWujB+1ral9Tid88YWPQ==
X-Gm-Gg: AYBFou0utbnSPJmhiOA3zGmDr+dLoQ4RFACWKofNi30ocvCT8juE57xan8O6hbpUfxi
	jhTq/RJvDTka4apvfEbhMnH0cxIsG7ziZ9PhjhLmhr7C3HC8j/yvvx3csAYGDj64KdxLh6Ep4MH
	w3N3V90bpZX3IQ8fbCDKhTBE4tX0s5yqtX0rVmOal/6qXkZ/0niXrp7B9s58mF2D4sHgLGIlCRf
	llw9O/CDNvsOmNfFY83/0JcHAzPceiybXx54a/gCPwLfumTmkL+NO/zqGXkp4xWa7E3wZ31cv4l
	8tvVPEktbr6SwK+VwmoCSyHwFQgGKWqfecHmKYmHbrwNJ5iYDfHChDjrWo3oNR4XPOF2G+MHPy6
	aMYLpW99BS48U17oxwU4VMzVPOWhciydIzUy+tJCM2DrOnDNejZrz4gNjCC+Yn3LnWJM62qfiQf
	p1gC2F/i2uX8m3jdUW/7VZ0t5ovlfVupAXMUNrnC+k4DOQLJvAU9QdmsHCWO1eWoYfiwBy5nUXN
	XCSjU/F4ohOTqPmE/8htXFCP7GJFbFCT2Hv4UIQGJnqYeNpk2eHxbQVuspbbb9xOpSeXqXc/lEx
	FkHRVEximCg=
X-Received: by 2002:a05:600c:3b94:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb7da440e4mr38346765e9.35.1794994169445;
        Wed, 18 Nov 2026 01:29:29 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm55486755e9.0.2026.11.18.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:29:28 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Stefano Tondo <stondo@gmail.com>
Subject: [PATCH 0/4] spdx30: identity and purls of dependency downloads
Date: Wed, 18 Nov 2026 10:29:23 +0100
Message-ID: <20261118092927.204959-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250526
Content-Type: text/plain; charset="utf-8"

Hi,

This series implements the parts of the RFC "spdx30: name, version
and purl for dependency downloads" [1] that we agreed on. It needs
the bitbake series "fetch: package identity of crate, gomod and npm
URLs" [2].

1. The SPDX of a crate, gomod or npm download gets the name, the
   version and the purl from the fetcher.
2. For Cargo recipes, a new do_cargo_metadata task writes the crate
   dependency graph for the target. The build links to each crate
   download with a runtime, build or test scope. A crate that is not
   used on the target gets an annotation.
3. Each output package gets the purls of its source downloads as
   external identifiers, as Joshua proposed: a statically linked
   dependency is part of the binary. A purl is left out only when the
   cargo graph proves that the crate is not in the target. The
   software_packageUrl of the package does not change.
4. Selftests with python3-bcrypt.

For python3-bcrypt, the output package gets the purls of 25 of its
42 crates. The other 17 crates are not built into the target.

Two points for review:

- All output packages of a recipe get the purls, also -dbg and -src.
  I have no proof per package, so I followed the rule "keep the purl
  unless there is proof".
- Go recipes have no filter yet. go version -m can give the proof per
  binary, and I can add it in a follow-up.

I ran oe-selftest -r spdx.SPDX30Check on master: all 20 tests pass.

[1] https://lore.kernel.org/openembedded-core/20261105122145.543282-1-stondo@gmail.com/
[2] https://lore.kernel.org/bitbake-devel/20261118092831.201831-1-stondo@gmail.com/

Stefano Tondo (4):
  spdx30: Take name, version and PURL of downloads from the fetcher
  spdx30: Record the lifecycle scope of crate dependencies
  spdx30: Add the PURLs of the source downloads to the output packages
  oeqa/selftest: spdx: Test crate identity, scope and output PURLs

 meta/classes-recipe/cargo.bbclass    |  17 ++++
 meta/lib/oe/spdx30_tasks.py          | 119 +++++++++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/spdx.py | 122 +++++++++++++++++++++++++++
 3 files changed, 257 insertions(+), 1 deletion(-)

-- 
2.56.1

