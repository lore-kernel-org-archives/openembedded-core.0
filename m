Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id CC64A61983
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:37:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s1so1885893pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=8nAmWa7Xz1h1ZsfCDrGs5fJUy1sgx45vWuCfNrvnhRU=;
	b=ITEi7RTxoXn8vHjxfbDMFAw3Xfy4YZj9oNAIGkWUG57KhD9nfIze4zxNYCwJIlfHBt
	FEws3QnAAv4XljCTGRAG95yDKFarNaluqFEVrqgxnD0jie+2oeUnVINCm9F/DxRL4nY8
	zxUzJKNQAEAmZY2nSOJLlNnqq62YvPDVv0WqIdipFwx/MZ9gOjqCNLQKnj9rCkeZCYfK
	dHKVczyLoFeOf27l2Gh9Ev5ch6yAY5R4yLDsj75fiENtnrEG5STanIGkdPYOp/5U0VXy
	Hfy0IMt1w375eTGs+NAa9Q1s69Dg6PsLylgMEktcOpVAlXU0OVlHiD8lNCFML8ueDuWj
	76Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=8nAmWa7Xz1h1ZsfCDrGs5fJUy1sgx45vWuCfNrvnhRU=;
	b=RFmE/tU516i7bU+lfgYr0NnpRD/pSHpABaf/JbOmFnQpCuaZMszJN+9sVZZML0ufSU
	vfOsaG6/QU5u/UoBqeNZ8u6NaLtRTTM+bBKdwIbqmLOv5Rb3moWdTIkA8DdVeD9qzUd7
	W5WoAr3rtkZ9lXx3Jl3cxkYQTNBg/aDpeVnBj/CAcju2uhopN19MbfDiSrb6W1YhdVDm
	owqjc5yHrDthCQu5Oddbs2o2ezPCxdEtdTJdWtpg9z5jPBw2GKKcFrs4dX+xRM9xhDbV
	gVeL1v/wVoHq0Rr8KM3TcCfX+0yxeDxjgVPSIhqwSWygg7mOyQHbltMyBTkoGhzDNprC
	8Rpw==
X-Gm-Message-State: APjAAAWKywLj4egrBAVFkqkGy/bmit70FwTAuwF9UShDkj4BGHCSeSvp
	SIp/PuXgwEktGFd20mNAGghW1dD6
X-Google-Smtp-Source: APXvYqy4NWlHQQxuVgv31s7vXhMonXltGLnxs+vnltqiiVzWto5E49Y3QLXOdiKMfXfa1FD6yv19Xw==
X-Received: by 2002:a63:d003:: with SMTP id z3mr5015918pgf.448.1582904264230; 
	Fri, 28 Feb 2020 07:37:44 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:cd0f:944c:c43b:2ac1?
	([2601:202:4180:a5c0:cd0f:944c:c43b:2ac1])
	by smtp.gmail.com with ESMTPSA id e4sm7646109pfi.99.2020.02.28.07.37.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 28 Feb 2020 07:37:43 -0800 (PST)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1582902875.git.anuj.mittal@intel.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ae5430e9-9894-6ea1-307e-f606b44a72f2@gmail.com>
Date: Fri, 28 Feb 2020 07:37:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: Re: [zeus][PATCH 00/22] zeus review request
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
X-List-Received-Date: Fri, 28 Feb 2020 15:37:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/28/20 7:23 AM, Anuj Mittal wrote:
> Next set of changes for zeus. Please review.
>
> Clean a-full on autobuilder except a single unrelated fetch failure for esdk test.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/751

Great. When do you want responses back by ?

- armin
>
> Thanks,
>
> Anuj
>
> The following changes since commit f39285bb82e68945a81034b84da09ca1078d6719:
>
>   Revert "bash: Fix CVE-2019-18276" (2020-02-19 18:53:10 +0000)
>
> are available in the git repository at:
>
>   git://push.openembedded.org/openembedded-core-contrib stable/zeus-next
>
> Alexander Kanavin (5):
>   perl: update to 5.30.1
>   perl: package Config.pm from arch directory into the main perl package
>   perl: install typemap and other extutils metadata as part of perl-core
>   libmodule-build-perl: fix ptests
>   perl: fix failing ptests
>
> Anuj Mittal (3):
>   openssh: backport patch to fix "cert not yet valid" test
>   ncurses: add CVE_VERSION
>   libxml2: fix CVE-2020-7595
>
> Bruce Ashfield (2):
>   linux-yocto/5.2: update to v5.2.29
>   linux-yocto/5.2: update to v5.2.32
>
> Jeremy Puhlman (1):
>   toolchain-shar-extract: ignore timestamp on decompress
>
> Kevin Hao (1):
>   xserver-nodm-init: Fix the start failure for non-root user
>
> Lee Chee Yang (2):
>   qemu: Fix CVE-2020-1711
>   libxml2: Fix CVE-2019-20388
>
> Nathan Rossi (2):
>   glibc-testsuite: Remove the do_install task
>   glibc-testsuite: Exclude this recipe from world builds
>
> Richard Purdie (2):
>   perl: Fix encode module reproducibility issues
>   perl: Fix makefile race causing configuration differences
>
> Ross Burton (1):
>   perl: improve reproducibility
>
> Tim Orling (1):
>   liberror-perl: upgrade 0.17028 -> 0.17029
>
> Trevor Gamblin (1):
>   qemurunner.py: add try/except for pid handling race
>
> Yi Zhao (1):
>   ppp: Security fix CVE-2020-8597
>
>  meta/files/toolchain-shar-extract.sh               |  2 +-
>  meta/lib/oeqa/utils/qemurunner.py                  |  5 +-
>  ...at-bozo-decided-to-use-2020-as-a-future-d.patch | 46 ++++++++++++++++
>  meta/recipes-connectivity/openssh/openssh_8.0p1.bb |  1 +
>  .../0001-pppd-Fix-bounds-check-in-EAP-code.patch   | 47 ++++++++++++++++
>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
>  meta/recipes-core/glibc/glibc-testsuite_2.30.bb    |  3 +
>  .../libxml/libxml2/CVE-2019-20388.patch            | 37 +++++++++++++
>  .../libxml/libxml2/CVE-2020-7595.patch             | 36 ++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.9.bb          |  2 +
>  meta/recipes-core/ncurses/ncurses_6.1+20190803.bb  |  2 +
>  ...t-to-correctly-exclude-unbuilt-extensions.patch | 27 +++++++++
>  meta/recipes-devtools/perl/files/encodefix.patch   | 20 +++++++
>  .../recipes-devtools/perl/files/fix-setgroup.patch | 49 -----------------
>  .../perl/files/perl-configpm-switch.patch          |  4 +-
>  meta/recipes-devtools/perl/files/racefix.patch     | 24 ++++++++
>  ...or-perl_0.17028.bb => liberror-perl_0.17029.bb} |  4 +-
>  .../perl/libmodule-build-perl/run-ptest            |  2 -
>  .../perl/libmodule-build-perl_0.4229.bb            |  3 +
>  .../perl/{perl_5.30.0.bb => perl_5.30.1.bb}        | 31 ++++++++---
>  meta/recipes-devtools/qemu/qemu.inc                |  3 +-
>  .../recipes-devtools/qemu/qemu/CVE-2020-1711.patch | 64 ++++++++++++++++++++++
>  .../x11-common/xserver-nodm-init/capability.conf   |  2 +
>  .../x11-common/xserver-nodm-init/xserver-nodm      |  8 +++
>  .../x11-common/xserver-nodm-init_3.0.bb            |  7 ++-
>  meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb    |  6 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb  |  8 +--
>  meta/recipes-kernel/linux/linux-yocto_5.2.bb       | 22 ++++----
>  28 files changed, 379 insertions(+), 87 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch
>  create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
>  create mode 100644 meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
>  create mode 100644 meta/recipes-devtools/perl/files/encodefix.patch
>  delete mode 100644 meta/recipes-devtools/perl/files/fix-setgroup.patch
>  create mode 100644 meta/recipes-devtools/perl/files/racefix.patch
>  rename meta/recipes-devtools/perl/{liberror-perl_0.17028.bb => liberror-perl_0.17029.bb} (89%)
>  rename meta/recipes-devtools/perl/{perl_5.30.0.bb => perl_5.30.1.bb} (93%)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
>


