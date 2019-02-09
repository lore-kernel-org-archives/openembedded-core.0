Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7AAB17C581
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 18:37:13 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id x124so11818193itd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 10:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YrPyBOwpqedJoRmWh4GBUGaH+hdiAdHCOMQFnitpD3k=;
	b=IlJb6HjOurcRDY/u7rnjjkMUSJopNc+sj9ti1ZAC1wsJO53W/YwCucq08aAnDN+6pt
	4Ui+fC4QjLzXL3Ed1q7A2uo9z1lKAaTwKOVWadDJsoGWHDvW2DnXINBibJGHKgSCaffF
	tsaSbrjhOnyXmD1y7V21r6XbmFRIr0TIOkUB6D73Ijk5dmwUpCLbdLUbO+W3NkxvNRjQ
	RxmHQu5WzXNPKipN67QrDgsRDkCmGLlLpvRyC/2iKFYJoi+wZhUdrxWYxC/TCVLXb+o0
	zW/TY1FI3m+tcPPpBWz7j8lnXG/Zqu8fx/Kwe4w9Ggz9IINKWtpOy7RH74h1usuSlQ+M
	uEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YrPyBOwpqedJoRmWh4GBUGaH+hdiAdHCOMQFnitpD3k=;
	b=R9EjiR+MQZRJtSZm+ZeMF6P+f6Pj5md1YwCnO0jW0KpWIijWqublO5KiPvJ1C5zgEW
	8wUe3YkEMGrL6KbBOab62TlCmO+Rtlw4ExKNB2aZ/VqJTmgK3iVkqJbbTiUrBApXskt0
	EyV5CMPjjAk/8r4IjjxLxcqdnAJ6Ij+daUvhUSM7QfgQWR5+d9SslhplCHfDDrN7mOoh
	udrs6V72lBrSILcKM6WwKmgfm1/7OhPxcsMOHo0eN0zJG3kXNCbTvECcEnnFOE9knNt0
	Yt99/LUtYcxwFAqJ/nWtoN8ZMuy8xJMvcGW54/0z0LQUkUI95ej6ie49kR3JcmwWAYj5
	N2eg==
X-Gm-Message-State: AHQUAuZIwOBxrLazTA2lvAIpv3+BOJbOH966hlLyzyye237zKOG7ZpdW
	7KP9pf/2EfBx5x9Ke4oADMdg/gpOBfuQ+Q==
X-Google-Smtp-Source: AHgI3IbJ3UEB1+AQdg4bYL1TF+5O3dg/IwsDPy93H2FZK5j5I+3ooNQEJD3roY7SAdvcPnrWQoxQJQ==
X-Received: by 2002:a02:a514:: with SMTP id e20mr15435610jam.23.1549737434357; 
	Sat, 09 Feb 2019 10:37:14 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id h2sm2633643itk.0.2019.02.09.10.37.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 10:37:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sat,  9 Feb 2019 18:37:07 +0000
Message-Id: <27ba07714afcc27de6d180d8eca6985a3ddb6b6e.1549737160.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1549737160.git.bruce.ashfield@gmail.com>
References: <cover.1549737160.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto: add baseline ARC support
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
X-List-Received-Date: Sat, 09 Feb 2019 18:37:13 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Adding both the required toolchain options (libgcc) and baseline
BSP definitions for arc support.

  Author: Alexey Brodkin <alexey.brodkin@synopsys.com>
  Date:   Fri Feb 8 18:32:21 2019 +0300

    linux-yocto: Add dependency on libgcc for ARC

    As of now in case of ARC there's no in-kernel implementation of basic libgcc
    functions used for millicode, multiplication, division etc instead we simply
    link with libgcc.a which provides everything used by the compiler.

    Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

  Author: Alexey Brodkin <alexey.brodkin@synopsys.com>
  Date:   Fri Feb 8 17:29:40 2019 +0300

    ARC: Add nsimhs- and hsdk-standard configs

    With ARC support ramping-up in upstream OE we're ready to
    build more complicated distributions and linux-yocto is
    a nice and configurable base for that.

    This commit adds support of 1 simulated board (nSIM) and
    the mast affordable and powerful to date development board (HSDK).

    Once Qemu port for ARC is functional (it's being actively developed now)
    we'll switch from nSIM to Qemu.

    Still it would be really good to keep nSIM support in linux-yocto for now
    as it allows for simpler testing as compared to real HW.

    Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
    Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 591981aa31..345073bceb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3059029718900250904b9f587e37ba22fb949ea6"
-SRCREV_meta ?= "5d93f38b0eed56071261895aefecfca287595536"
+SRCREV_meta ?= "8d7d003531151ba0a0e0cdb3cefa0bf9b0e84b55"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index bb2ea2d991..df8ecb6cee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6cc861e796ab19a6827cf9996e7755f1875d553e"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "5d93f38b0eed56071261895aefecfca287595536"
+SRCREV_meta ?= "8d7d003531151ba0a0e0cdb3cefa0bf9b0e84b55"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 13d6eb0ea0..48949d3f9b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemux86-64 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemumips64 ?= "fc7a2bf24e0e39b6a260f8650a3c8d497b8cdcfd"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "5d93f38b0eed56071261895aefecfca287595536"
+SRCREV_meta ?= "8d7d003531151ba0a0e0cdb3cefa0bf9b0e84b55"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.19.1


