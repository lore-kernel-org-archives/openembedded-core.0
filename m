Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BEE9A605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:12:52 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v25so3016794qto.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MXUZbJAoef9mxkZ5ICzgzlJ1/rXa6zl2Ty+mX4t+SiQ=;
	b=A8hBvGENzi638qPzwQU7IAAJ/3zAxJTSDjzXL35OOANUCp0NASZFtkDDJnscqKSDTR
	T+fVgELQ7B6/rDVa1wQT8Prtxdog9URLhpdKE++ZF3XdTjPrmrRaqM1W6sMRjpo9YfTQ
	5vJt8DZxmrkkJaRd/AX/4//si6w0pwKkuvU0cQXB1/Z4Qhs9OZ4pH+/kFHdsL0DvYMVP
	t52k2vJP7eZ/0TbQtQJ6dTN06Hgz+ZkU/HxI0uhvaJ92hG/tox3T3guMWTwsTyCuehVJ
	TFLqI9NM16mIQCwYVdoDU95ufDmhF58jw1kPEK2vj6Gjko3VzB60WaolZ069ju4dUKl0
	eJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MXUZbJAoef9mxkZ5ICzgzlJ1/rXa6zl2Ty+mX4t+SiQ=;
	b=OCepr4E0qo/VmyGECPH8HYuvAaSy09IR5/wwztFwNQ288GyHOWczUVcWepyMsAKWCy
	1gksArI+3XQSs5Due4fMKQ4oAIHLeYEQb/RUTVt9fwrHE2zbvnalruJNHO2d/LvL9eVz
	Zknmck1TVfU1nQtc9EXifs93M/GaFi7/C2Pm3hoS5ioIpD2Jf2KtScq05yJtQCfvfEQz
	+BLLHpRZ4GlPpHXx2cTp3OsHLA7M/Izbi/k2yrbRSHu0riy/eXDz6/wZ7CEgTtRCje2z
	FoGSVMCFO0/edoh/T1Vwf+RVkrMa6CiifLEORDkOLBPBEaZlaYbUJ4BwIvbgYVdNm9CC
	5sCQ==
X-Gm-Message-State: APjAAAX0H51oCuy8mQC23lUFYkafL2K2UM7hjdIunPHS9W913emh91fA
	WPTHpXj/PaC912tbemwqHEaE6MuCihPtVw==
X-Google-Smtp-Source: APXvYqx2divftBitLlbBGSDH0QrBKZFfI5pQ4Bnl4VeMvXNImqbdzz3B9Gz20R3qowjDFIQCKiV1zw==
X-Received: by 2002:ac8:3735:: with SMTP id o50mr166609qtb.252.1580944373395; 
	Wed, 05 Feb 2020 15:12:53 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.12.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:12:52 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:41 -0500
Message-Id: <cover.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 05 Feb 2020 23:12:53 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

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

Bruce Ashfield (2):
  kern-tools: tweak symbol_why to be python safe
  kern-tools: integrate merge_config fix for gold linker

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

 meta/classes/kernel-yocto.bbclass             | 43 +++++++++++++------
 .../kern-tools/kern-tools-native_git.bb       | 13 +++---
 meta/recipes-kernel/linux/linux-yocto.inc     | 21 ---------
 3 files changed, 37 insertions(+), 40 deletions(-)

-- 
2.19.1


