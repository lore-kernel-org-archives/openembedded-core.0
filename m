Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id CEF8873178
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 09:13:51 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id y89so120463027qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qu6XvfZLKuGPbghkGo2UEU90W5WE5O3tIjmTqSblWSk=;
	b=zTx27nfiy682ieUNqJBkAZmasf23TKxWpYCAK2/NJDq1+aQ2YDf/eDjD1v+MCqGj5m
	XgsN59mK/eAxED7J/SmCUerEUse16MSlChr/cmIqstJkN+kZKsolfImFfj79i6VwWWLn
	BzwdyNvFzZupZJLCbG/f01FolROD5fmzy0Qr5+Rf7NLuQhgrfHN4DMLuEf09N5+j/TZN
	/ZrOHiCbloUp7lsyeOhtwcnqN8YJOPqvB51OlMIfToMmAUsbJvwTDcC/mUdJ5D1dtPj3
	b8h4rd5s5nvYpmEgG7jeBvCvdaRMTZUTQ1AVbfelXU+TdlGwiWIYMFgbXb/ayTIVRDe0
	TGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qu6XvfZLKuGPbghkGo2UEU90W5WE5O3tIjmTqSblWSk=;
	b=TUG6Ar4RLErcs0hJN61AfazhkXaVz7higjl6hjV6zEcM6mvKglsS7VHEvdxAd1YySh
	LtELwt+/X7zqdxs/NLJosbEIekaBH6Vg7ijwyjfyOyr8cUowDElIdbmwxOMZRFFbF4tB
	qsJTvMc1XrmTZgFya5UgfWnjTmv3VWgngs+UDEU9DzNhsm4j0oarcYNKvXRVOvQZw3Op
	K2zws54omyOdNeOHIVURdsSIl6ah281n15WhfBu1NkCUmVywTVj2VpeKTdfP4wT6L5g0
	Fhm88MhrXrdHsFuiMxpzlzB6k0z82OD/cV3q+qPa5zAqCGdN9zT95K2y7TzXtF7P33J4
	vk9Q==
X-Gm-Message-State: AD7BkJI6ua5iuV1+JQxzG8TqKJLBj7VhYoy+TdsF2J+8P7AEnobRvnaldEptAhaSxt2rUQ==
X-Received: by 10.140.237.204 with SMTP id i195mr29928401qhc.55.1458378831889; 
	Sat, 19 Mar 2016 02:13:51 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id d64sm7827750qgd.9.2016.03.19.02.13.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Mar 2016 02:13:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Mar 2016 09:13:42 +0000
Message-Id: <1458378822-24897-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1458378822-24897-1-git-send-email-raj.khem@gmail.com>
References: <1458378822-24897-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH V2 4/4] lttng-tools: Remove lttng-ust from PACKAGECONFIG for musl
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
X-List-Received-Date: Sat, 19 Mar 2016 09:13:52 -0000

Remove lttng-ust from DEPENDS its added by PACKAGECONFIG anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 2631203..8bd0989 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
-DEPENDS = "liburcu popt lttng-ust libxml2"
+DEPENDS = "liburcu popt libxml2"
 RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest += "make perl bash"
 
@@ -24,6 +24,7 @@ PACKAGECONFIG ??= "lttng-ust"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python swig-native"
 PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
+PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
            file://Revert-Build-look-for-python-3.0-when-building-pytho.patch \
-- 
1.8.3.1


