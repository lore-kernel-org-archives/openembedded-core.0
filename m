Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id EA87560130
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:35:54 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w8so5111537qts.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NmJWv0kCBtrNREq0Px0o28LutU/SGuZv8pRMeJ/ppA8=;
	b=DJQ7ajJ0cHNYkiavJawL+aOQ9Uyw/7AuDK8pMXZJsI2/RomWWF2+DWfH782vv2G3eB
	rZMbWHOPnIMdzCdj0wWz9oBFHkX9+97xKmoZL651tBLYvB1NirY7nRpo26YSpncadEmY
	uCYFdlqoNbpwW5PEvY4ViUm0wyPy4XZDUuXOqeZC3UH8SW1E3GEfXFHBuxu+LjoEy93n
	yL/Ykq/qTg9Alobvfjl0djNHyWRTFjimkmvBUmCeuDaoLXbSPMqxFnuVIh3uMZhS3CD3
	4cM7CbVvBWtT5OUF5yXAci8JpHKCivhciaAsyQxqs6SpWokQPKEHOd/s/yK04e+dMi+U
	Q0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NmJWv0kCBtrNREq0Px0o28LutU/SGuZv8pRMeJ/ppA8=;
	b=gQ0dIKjNbZRxm72Yi+Ar7Cq+AZuON86KrkYru6tCkamBnj8SIXgn6ZTn//+ItfzJSY
	t7L0NzFuFGCYihMGCYd1WAKYT9ra3R+fQ/W39ZexMdD5/WS7sNDHMGWRsYFEh9ZnDeAU
	KL9EZqKJCLAraRAfAPTefwa5Kgx6mJ4LzOV2MoYNdF3IudhjoLfEGR1ptMER+8H8QAdT
	FAFvX5FAhbrEDmJZdV8I5BxitYYyVmPmxuIvwL83F6X6AnRbSsFEspOobvZMvtkVoDuX
	gAnJjIHnyygfaKTolawcUAR2u4Uzlwv0XtdJXEimMy6dnS8d2WhaUoPTtTLowWLOSELO
	QY2Q==
X-Gm-Message-State: APjAAAUEe246JWiC2UQ8DYVR62bJYwQk+3/AYinnK98llSNydD3k8ixG
	eWqpqPdfVWgtzKc9YALCmS0=
X-Google-Smtp-Source: APXvYqwf90AEO32fJVtVqrMPJ+R7IAv7anGuEdn1obyEtdVJKt2qp9MFyWNp7ftGHunqZMZqpe/XPw==
X-Received: by 2002:ac8:6644:: with SMTP id j4mr3521306qtp.90.1581010555610;
	Thu, 06 Feb 2020 09:35:55 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.35.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:35:54 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:43 -0500
Message-Id: <cover.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10][v2] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 06 Feb 2020 17:35:55 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

v2 adds a 10th patch to the series to fixup a config issue seen
with qemuarm64. The other patches are unchanged.

The original pull request text follows:

---------

Hi all,

I've kept the v5.4 content changes, as well as the kernel version default
changes out of this series and instead focused it on the collection of
kernel-yocto and kern-tools tweaks that I've gethered over the past few
weeks.

I have Martin's gold linker fixes included, as well as the re-org'ing of
the linux-yocto tasks that Paul Barker did to make it usable as a single
inherit of the bbclass.

I also have a defconfig detection fix included that was sent to the list.

I was able to confirm that my configuration was the same with this series
enabled, and I was able to boot.

That being said, I'll keep my eye out for any AB fallout and will continue
some more build locally .. but I wanted to get this out today as promised.

Cheers,

Bruce

The following changes since commit 3c6978c8db59f152693f9fae65dbab13ecfcaad4:

  kernel-yocto.bbclass: export LD in the environment used by kconf_check (2020-02-04 15:56:29 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  kern-tools: tweak symbol_why to be python safe
  kern-tools: integrate merge_config fix for gold linker
  kern-tools: fix merge_config when LD contains parameters

Gavin Li (1):
  kernel-yocto: fix defconfig detection in find_sccs()

Martin Jansa (3):
  kern-tools-native: use more common S value and oe_runmake
  kernel-yocto.bbclass: set KERNEL_LD also for merge_config.sh
  kernel-yocto.bbclass: do_kernel_configme: don't use +errexit,
    merge_config_build.log and fail when /.config wasn't created

Paul Barker (3):
  kernel-yocto: Move defaults and tasks from linux-yocto.inc into
    bbclass
  kernel-yocto: Drop setting of unused variables in do_kernel_metadata
  kernel-yocto: Only override CONFIG_LOCALVERSION if
    LINUX_VERSION_EXTENSION is set

 meta/classes/kernel-yocto.bbclass             | 49 +++++++++++++------
 .../kern-tools/kern-tools-native_git.bb       | 13 +++--
 meta/recipes-kernel/linux/linux-yocto.inc     | 21 --------
 3 files changed, 42 insertions(+), 41 deletions(-)

-- 
2.19.1


