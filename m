Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 18F186B513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:46 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id h13so1213564plr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Z9rdyMzjeqLwSK/9Gl7i283hF+3edlura44Mc8RiBxs=;
	b=Iq6EpnXo14tBnN/987JDwrgspkcdt4Dmq5DrIQ8qhj3KYvHzHchz8mxm4r1WDVdSg9
	tTl4fUgxt+gl5+ZhmtPhDcwRDqZi3rJXRukaltf/d3Ci+mwyaoxJen4tNs2B4XFKqVI6
	MnsdxmWfUmgxGtVT9DhNOQhsajmqKhjSkeghG78HTqub1eOT7VUYAlvP7+De1n0q5a5/
	FgQbRy8WX9CpIoAMIAirppBUA3HBLBDWQoXdLSTWmsGGOAm0U7RimLG1rAq4gZLSo8Bq
	fNOlb2psMCcs65wHcJ998762BCCdTCnmnrsM9GisNSdbRntQsEDxcHy7qqVGSjWbGP/s
	s9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Z9rdyMzjeqLwSK/9Gl7i283hF+3edlura44Mc8RiBxs=;
	b=fysrtsyZX6DsvZs7lI1sLKH+jsHKSriOYoZhJhS052MP/hjzLyUisMqBtUalcxo0Mq
	s6S3x0km71IyjVGr7rhbO4XwHpccVErmBIoVqkWZ/ORZHLTCP2IJ/hQG5D5Tt2/dUBNk
	sKnjW8LbMKNu8r9HO0xsSSdNVU3UmGy2F38Rd+dMO7fCMpkX/qxVOpAeCJ3q+g3AL6am
	KcqpDobKo/h7qyKN7v+yqQjMo8YpBzCTsjLbINp60YLUYzMOKktpRiWVjNNoi8LuqnpQ
	OdbUoRo4ykl2MsKcEJ/keozK7T34H6LtYq44KSYD9ml+fORn8rJVwg03Qf9mZ1sfP7T6
	ViFw==
X-Gm-Message-State: APjAAAVOv98b0u0cynOvukBDnyZgzJYEJabzZMsTFGA9jwz1XzQ/Sdla
	fh09OEPTtrcYOHpa2fen4P6mhLqp
X-Google-Smtp-Source: APXvYqxxpG3jK/np2hnToXV2LDchQgb6RXk+lK110Kac8DkE/+ZH5ed5wvCWIG+ucmSv0R+Nvfvfxg==
X-Received: by 2002:a17:902:6903:: with SMTP id
	j3mr4081444plk.231.1573658387879; 
	Wed, 13 Nov 2019 07:19:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:05 -0800
Message-Id: <650aa572f96266ea532666b5896d259ceb0dc1da.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 02/25] meson.bbclass: Remove the MESON_*_ARGS variables
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:47 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The options in ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} are already passed
via ${CC}/${CXX} and there is no reason to pass them a second time. Thus
we can remove MESON_TOOLCHAIN_ARGS. And when it is removed, the other
MESON_*_ARGS variables revert to the standard CFLAGS, CXXFLAGS and
LDFLAGS, so just use them directly instead.

Apart from the obvious improvement with not passing a lot of options
twice, this also solves a problem where -pie would be passed on the
command line in a way that it would prevent building any dynamic
libraries using meson if using a toolchain that is not built with
--enable-default-pie and if security_flags.inc is used.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/meson.bbclass | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 115d1ae..5c0139f 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -30,11 +30,6 @@ MESONOPTS = " --prefix ${prefix} \
               -Dcpp_args='${BUILD_CPPFLAGS} ${BUILD_CXXFLAGS}' \
               -Dcpp_link_args='${BUILD_LDFLAGS}'"
 
-MESON_TOOLCHAIN_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
-MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CXXFLAGS}"
-MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
-
 EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 
 MESON_CROSS_FILE = ""
@@ -76,7 +71,7 @@ def meson_endian(prefix, d):
         bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
+do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -93,10 +88,10 @@ llvm-config = 'llvm-config8.0.0'
 
 [properties]
 needs_exe_wrapper = true
-c_args = ${@meson_array('MESON_C_ARGS', d)}
-c_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
-cpp_args = ${@meson_array('MESON_CPP_ARGS', d)}
-cpp_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
+c_args = ${@meson_array('CFLAGS', d)}
+c_link_args = ${@meson_array('LDFLAGS', d)}
+cpp_args = ${@meson_array('CXXFLAGS', d)}
+cpp_link_args = ${@meson_array('LDFLAGS', d)}
 gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 
 [host_machine]
-- 
2.7.4


