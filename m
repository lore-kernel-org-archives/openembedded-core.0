Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id B5B416C3B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 13:44:30 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 205so1798432pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=cpG0LuVKeWI8NsK0WWGaAXUyW0FEMiVDSdqWRCpu+VA=;
	b=NKvErmi6AI6VAwYVQV6M1S2+LBsS0WJA3PwKV8z1WTFH2TQF3RqLHa7zDfZtzGxHV0
	TS3hI5uXTtiN4BaOqgXVwbF3Q7j43c52k/h9xteAdU7Wr1hDwbVKVKt/TOEqcoh4+Vqz
	DjlXr/8P9tuBlh7uZN4l1mYdYIEn0HVCDLIerCOqiQnMV2aq7GjHJLt7BRDd+b1YtYn+
	Mr2r95f9tWnLo8uEi41UW87urxWTv3siE16PuqKUVD89gihEa/81x68jGaJVi63P9x2D
	xtBVntVQ6nR8Sy3GtW8A/d+lQpnKL/et4/SZrblSrOsrD8OYLeCdbiKv1UsiehsCsxnj
	+zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=cpG0LuVKeWI8NsK0WWGaAXUyW0FEMiVDSdqWRCpu+VA=;
	b=CCUWouj/13SM7iIXpQMinSKxXwNeS8KEVW39T5V03NgufIIVkLfpTUb8LAwojxqG1m
	CZYyG/U8M6youOFfaKsxwb/jrRmABm1ZHSm43TCncCU0E5krQwsiAWmjhtDuIJNX5e3M
	TdpUWzlS1XvzvolOO066mfe2MQjvY6FLzz95fO6lpcVCBH2Oca8R70IM8SNozchiEI52
	cJlFYX4sL/cLP5HS0qCqHrjuCAWJEaSptx3Vz+9QHlK74R31t2cD+Wqv+gWosCeNVrSA
	jFi6iCVm9vfyO/U9/8cPsqFhFFt5rM8ZXhE1kyMNvgjfb7aBWhEqejKCDNINdD8gLj4i
	ErFA==
X-Gm-Message-State: APjAAAXKqgAC6tEaH7XNBgwLllTMTI0FbuBxDaG6OXwPgp+nswzryqto
	L+O8achnYhYafkfT9725kZo2P8jHZNeMJg==
X-Google-Smtp-Source: APXvYqwzqTAbXO4YwhDGlt77+D376Z++c4zIEKdEUhnPfmVcP9qdA3S+Zw3C6Yr/JkC8VaXw7h3RfQ==
X-Received: by 2002:a63:6c4:: with SMTP id 187mr2978246pgg.401.1567691071362; 
	Thu, 05 Sep 2019 06:44:31 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	y128sm2056969pgy.41.2019.09.05.06.44.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 06:44:30 -0700 (PDT)
Date: Thu, 05 Sep 2019 13:44:15 +0000
Message-Id: <20190905134415.26785-2-nathan@nathanrossi.com>
In-Reply-To: <20190905134415.26785-1-nathan@nathanrossi.com>
References: <20190905134415.26785-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/3] security_flags.inc: Add overrides for glibc-testsuite to match glibc
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
X-List-Received-Date: Thu, 05 Sep 2019 13:44:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Ensure glibc-testsuite has the same flags as glibc.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 758bd89c3e..aaf04e9e59 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -36,6 +36,7 @@ SECURITY_CFLAGS_remove_powerpc = "${SECURITY_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 
 SECURITY_CFLAGS_pn-glibc = ""
+SECURITY_CFLAGS_pn-glibc-testsuite = ""
 SECURITY_CFLAGS_pn-gcc-runtime = ""
 SECURITY_CFLAGS_pn-grub = ""
 SECURITY_CFLAGS_pn-grub-efi = ""
@@ -59,6 +60,7 @@ TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 
 SECURITY_STACK_PROTECTOR_pn-gcc-runtime = ""
 SECURITY_STACK_PROTECTOR_pn-glibc = ""
+SECURITY_STACK_PROTECTOR_pn-glibc-testsuite = ""
 # All xorg module drivers need to be linked this way as well and are
 # handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
---
2.23.0.rc1

