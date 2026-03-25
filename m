Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1988103A9AC
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19960.1774438288602941983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hgwTJKUL;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48374014a77so65483695e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438287; x=1775043087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkgdmGH+RaIskXcdDS/legM+EtpD8grFb/2Y2DqR2nE=;
        b=hgwTJKULOYLvI3ZJAc/cyXvMycLAWdsMzUytfKPhqP2h5T1K6RmFTieulbS/NxIP9g
         pjRRUsTpbduywFl8F6bvAUEEgaNoQFQ3o6FKSc+2OPtUgNiyQK6QGqEOsrGMbLVvXBSY
         X9iYgYNpBE9M7O/8AOzhgkAFaCefDneBf3RA7B1NrJF26+131w2qqKNWoP39xPFN47VN
         n9L3e6GNfnnQ0hF4TPMkEtmt2f3wlpccgTAR202GWKUEVQjEpezHzmSBpnD2bkRBgtuq
         sQxHUGxL6vqqIsknZXnC/P/X54yPOBqpztxRQ36Fz13N39Zm1sJih/CwaO7L5hJAZ0du
         mkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438287; x=1775043087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkgdmGH+RaIskXcdDS/legM+EtpD8grFb/2Y2DqR2nE=;
        b=Q/rkdPLi9mBbm+h3il+vGjBPDwuQ7LbxpY0dHOGVzpGyBlfVzqcS7bFWEWSctSyr20
         ld0ZqwIbrb+Yy7TCj+eBhF4AuWcqtybz/9lFyjbKoquF+5cO9BwSy5e8lWhWQDX7u3Am
         j5YygkIhAyELzJdbQFgy4nelXuXOpUys2UKjxoQr9E6dQOYAlgSJFNOi2fZI7QEJ82RJ
         DHdZlNKewvRzAyLMVzYonK17gIo7qPxw2LJlLjHqUvmKQ13BCStYHsajtqgw/+AmXkhc
         uFGjdmusFU3q3yn0B3waCSzltih847d6LNqI6OZHcAXx6C4gs9/UHY6eX7iMYBGlQNdt
         aVlg==
X-Gm-Message-State: AOJu0Yx78ysMAG2c/9+VHerOynaKb2mRBNM9Ib/VWoW8zFDbxAa5c7/v
	Ena1BvmtM98xbJ+egw4n1v87Ka/UA3vF579ZL+WhxqFZcKWoRnWrq9pr07rOyg==
X-Gm-Gg: ATEYQzyFGu6Zgp5lyc4lJRDuKISp26ugelmDpTo+P0qlhE3WzLw+v0l3J/aJARo/Zp2
	ZKV9OmptSai5Wn4UKo90Ts8jqlHNsva+9HHEStZaZO8jNenA1LGw5ebDW8yZhj04TaRk8ui8XGV
	gERHf7hY1nZUX8N52E25FLUSL1e4nCbKm4+edmewe2i0vzL3afZWmVXNdRboywTiGty35oDvdTQ
	WJIp+draK7PlPDG+20eNWRNZAXqrVbp66Ay7a9syukNZZR6AUSLqlDaMQgXuBOKHop6TvJh32Dz
	y2yVs3CMdObWqGkaKyC1UVpGTlQYLXJ769XNHy0YDlhWfqhnft5OPL3pHwrOmaUmzSl9HlPD2J1
	fCn948RdKj9THCXETFUQZ7memLS/vn9u3dL5bx+wOptsrnqdD1jNLWoPQpBBSFgCaYjhsq8UXrX
	dn0qcxeUlryB7jbw==
X-Received: by 2002:a05:600c:a402:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-48715fef22dmr34840275e9.13.1774438286488;
        Wed, 25 Mar 2026 04:31:26 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:24 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC][PATCH 00/14] Support Python freethreading
Date: Wed, 25 Mar 2026 12:24:10 +0100
Message-ID: <20260325113112.1163632-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233874

This patchset allows turning on Python freethreading by using
a new DISTRO_FEATURES setting:

DISTRO_FEATURES += "python_freethreading"

and optionally:

DISTRO_FEATURES_NATIVE += "python_freethreading"

The change to python3-dir.bbclass is crucial, as all python module
build helper classes rely on it.

I also added native variants of some settings because another
series against meta-openembedded is needed to complete this one.
In that, the change to the fontforge recipe relies on the native
setting for setting BUILD_LDFLAGS.

All of the changes included here were successfully build tested,
except for the gdb-cross-canadian change. That one failed, but
it's included for completeness.

Quite a few of python modules were build tested for native and
target builds, including python3-pytorch from my meta-python-ai
with reduced RDEPENDS because e.g. python3-onnx there failed
to build with freethreading enabled.

All in all, this series at least allows to get things going.
Though maybe not for Yocto 6.0, as it's quite late.

Best regards,
Zoltán Böszörményi

