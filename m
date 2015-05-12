Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 62BB973FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 13:43:15 +0000 (UTC)
Received: by qcbgu10 with SMTP id gu10so4188053qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 06:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IM1b6N3AAPuDL4JlyvCMzQByEuDIAa6BeIn68v1xVa0=;
	b=eOqBcr8W6Hlay31D22L4Cyj/DGWZcRDfSpIMiWpN1FguH2t1w8IOOmKcC5o7vjgQLv
	sbXfBe7JpT9JZOVMIfcafVQoI/K3XaBJwZ+n0fRk+zSsI2ePgMr0TiL7ehZnpJq+ghqS
	OMEqVmpE2a5dXapPlysaZdfo6dkUR0yBTV6RIGKX5GqSj8z56wAItXS09XMeAQgGMQX7
	gOoBebl6ED879GiX3H3D7kEj0/xe4RQTNLlzXOtec8cqbp36VyT+UL/rDqsA7wSiqi1K
	SDoMX+/V74QO1RAbCeoripg1VXnEFWvb9juas5Ouzm+oLTCxeKa1vGvYoARWtd3MP+H9
	p10Q==
X-Gm-Message-State: ALoCoQktVusk5frGAHeckG0dsvTlfrQ6FiRx9G5aefX+kXHxhQ45IZ8PXAgOu/ymNtDX6wtjoIb6
X-Received: by 10.229.110.10 with SMTP id l10mr20734772qcp.5.1431438196716;
	Tue, 12 May 2015 06:43:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 12 May 2015 06:42:56 -0700 (PDT)
In-Reply-To: <37d60010ba7e3f90761dc8d7a83c66eda3382481.1431396786.git.liezhi.yang@windriver.com>
References: <cover.1431396786.git.liezhi.yang@windriver.com>
	<37d60010ba7e3f90761dc8d7a83c66eda3382481.1431396786.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 May 2015 14:42:56 +0100
Message-ID: <CAJTo0LYRqP04Vo6_D-casMqthhhp0NAYz9iqjZ_eHdgeo+hLCg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] lttng-tools: separate B and S
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
X-List-Received-Date: Tue, 12 May 2015 13:43:17 -0000
Content-Type: multipart/alternative; boundary=001a11344c843bcc7c0515e2add9

--001a11344c843bcc7c0515e2add9
Content-Type: text/plain; charset=UTF-8

On 12 May 2015 at 03:13, Robert Yang <liezhi.yang@windriver.com> wrote:

> It works well with autotools now.
>

I'm not sure about that:

packages/corei7-64-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST:
removed
"/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/gen-ust-nevents
/usr/lib/lttng-tools/ptest/tests/unit/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_ust_data.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/.libs/.debug/live_test
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/libhealthtpfail.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo-demo.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/validate_xml-validate_xml.o
/usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/libtap.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/exit-fast.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp2.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_exit.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp2.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/.debug/extract_xml
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/gen-ust-events.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/.debug/gen-ust-nevents
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/.debug/gen-nevents
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/gen-events
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_stall.o
/usr/lib/lttng-tools/ptest/tests/utils/tap/libtap.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/
liblttng-ust-provider-ust-tests-demo3.la
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/libhealthexit.la
/usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/tap.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_stall.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/.debug/liblttng-ust-provider-ust-tests-demo.so
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_exit.lo
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/.debug/gen-ust-tracef
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/tp2.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/
liblttng-ust-provider-ust-tests-demo.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-demo.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/extract_xml
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/
libhealthtpfail.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp3.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/demo
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthtpfail.lai
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/
liblttng-ust-provider-ust-tests-demo-static.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/main.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo3.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/java-jul/Makefile
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/gen-ust-events
/usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/daemon.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/libhealthexit.so
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/extract_xml-extract_xml.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/.debug/liblttng-ust-provider-ust-tests-demo.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/.debug/gen-ust-events
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/gen-ust-tracef.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/gen-ust-tracef
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp2.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/
libhealthstall.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-provider-ust-tests-demo3.lai
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_stall.lo
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/.libs/live_test
/usr/lib/lttng-tools/ptest/tests/regression/ust/before-after/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/libhealthtpfail.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.debug/demo
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo.lai
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_utils_parse_size_suffix
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/.debug/validate_xml
/usr/lib/lttng-tools/ptest/tests/regression/ust/nprocesses/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/gen-ust-events
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/.libs/.debug/ini_config
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_kernel_data
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_static
/usr/lib/lttng-tools/ptest/tests/utils/tap/tap.lo
/usr/lib/lttng-tools/ptest/tests/stress/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/.debug/daemon
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/.debug/liblttng-ust-provider-ust-tests-demo3.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/
liblttng-ust-provider-ust-tests-demo3-static.la
/usr/lib/lttng-tools/ptest/tests/unit/test_kernel_data.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/demo
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/prog
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/exclusion/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/.debug/prog
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp.o
/usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/libtap.a
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/main.o
/usr/lib/lttng-tools/ptest/tests/unit/test_utils_expand_path.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/tracefile-limits/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/.debug/liblttng-ust-provider-ust-tests-demo3.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/.debug/gen-events
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/
liblttng-ust-provider-ust-tests-demo.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-tp.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/streaming/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/gen-events
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthstall.lai
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-provider-ust-tests-demo.lai
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo3.lai
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_check
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_test.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/
liblttng-ust-provider-ust-tests-demo3-static.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/exit-fast
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/
liblttng-ust-provider-ust-tests-demo3.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/
liblttng-ust-provider-ust-tests-demo.la
/usr/lib/lttng-tools/ptest/tests/unit/test_utils_parse_size_suffix.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_session
/usr/lib/lttng-tools/ptest/tests/regression/tools/save-load/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_uri
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthstall.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-tp2.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/gen-nevents
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_exit.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/
liblttng-ust-provider-ust-tests-demo3.la
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/health_check
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_session
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/snapshots/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/java-log4j/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/libhealthstall.la
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/.debug/gen-ust-events
/usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/kernel/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp3.lo
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthexit.so
/usr/lib/lttng-tools/ptest/tests/unit/test_uri.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/Makefile
/usr/lib/lttng-tools/ptest/tests/utils/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/buffers-pid/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_session.o
/usr/lib/lttng-tools/ptest/tests/utils/tap/tap.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/daemon
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/.debug/gen-events
/usr/lib/lttng-tools/ptest/tests/unit/test_utils_expand_path
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/gen-nevents.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/
liblttng-ust-provider-ust-tests-demo.la
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/.libs/ini_config
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_uri
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_fail.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/demo.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork2.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo-static.a
/usr/lib/lttng-tools/ptest/tests/utils/tap/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork2
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp2.lo
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_ust_data
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/.debug/fork2
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_test
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/
liblttng-ust-provider-ust-tests-demo-static.la
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/demo_builtin
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/demo_static
/usr/lib/lttng-tools/ptest/tests/unit/test_utils_parse_size_suffix
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp2.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo3-static.a
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-provider-ust-tests-demo.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_ust_data
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-provider-ust-tests-demo3.so
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_kernel_data
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/
liblttng-ust-provider-ust-tests-demo3.la
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthexit.lai
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/libhealthstall.so
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_fail.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/periodical-metadata-flush/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthtpfail.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/.debug/fork
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_utils_expand_path
/usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/
libhealthexit.la
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/tp.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/gen-ust-nevents.o
/usr/lib/lttng-tools/ptest/tests/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/gen-ust-events.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_fail.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/prog.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/.debug/exit-fast
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/validate_xml"
  * PR changed from "r0" to "r1"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-ptest: RDEPENDS:
removed "glibc (['>= 2.21']) lttng-tools (['>= 2.6.0']) libxml2 (['>=
2.9.2']) popt (['>= 1.16']) lttng-ust (['>= 2.6.0']) util-linux-libuuid
(['>= 2.26.1']) liburcu (['>= 0.8.6'])"
  * PR changed from "r0" to "r1"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-ptest: PKGR changed
from r0.24 to r1.0
  * PR changed from "r0" to "r1"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-ptest: PKGSIZE
changed from 9251406 to 1276028 (-86%)
  * PR changed from "r0" to "r1"
  * FILELIST: removed
"/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/gen-ust-nevents
/usr/lib/lttng-tools/ptest/tests/unit/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_ust_data.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/.libs/.debug/live_test
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/libhealthtpfail.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo-demo.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/validate_xml-validate_xml.o
/usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/libtap.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/exit-fast.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp2.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_exit.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp2.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/.debug/extract_xml
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/gen-ust-events.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/.debug/gen-ust-nevents
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/.debug/gen-nevents
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/gen-events
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_stall.o
/usr/lib/lttng-tools/ptest/tests/utils/tap/libtap.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/
liblttng-ust-provider-ust-tests-demo3.la
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/libhealthexit.la
/usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/tap.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_stall.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/.debug/liblttng-ust-provider-ust-tests-demo.so
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_exit.lo
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/.debug/gen-ust-tracef
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/tp2.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/
liblttng-ust-provider-ust-tests-demo.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-demo.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/extract_xml
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/
libhealthtpfail.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp3.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/demo
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthtpfail.lai
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/
liblttng-ust-provider-ust-tests-demo-static.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/main.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo3.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/java-jul/Makefile
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/gen-ust-events
/usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/daemon.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/libhealthexit.so
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/extract_xml-extract_xml.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/.debug/liblttng-ust-provider-ust-tests-demo.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/.debug/gen-ust-events
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/gen-ust-tracef.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/gen-ust-tracef
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp2.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/
libhealthstall.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-provider-ust-tests-demo3.lai
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_stall.lo
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/.libs/live_test
/usr/lib/lttng-tools/ptest/tests/regression/ust/before-after/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/libhealthtpfail.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.debug/demo
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo.lai
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_utils_parse_size_suffix
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/.debug/validate_xml
/usr/lib/lttng-tools/ptest/tests/regression/ust/nprocesses/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/gen-ust-events
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/.libs/.debug/ini_config
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_kernel_data
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_static
/usr/lib/lttng-tools/ptest/tests/utils/tap/tap.lo
/usr/lib/lttng-tools/ptest/tests/stress/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/.debug/daemon
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/.debug/liblttng-ust-provider-ust-tests-demo3.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/
liblttng-ust-provider-ust-tests-demo3-static.la
/usr/lib/lttng-tools/ptest/tests/unit/test_kernel_data.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/demo
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/prog
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/exclusion/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/.debug/prog
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp.o
/usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/libtap.a
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/main.o
/usr/lib/lttng-tools/ptest/tests/unit/test_utils_expand_path.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/tracefile-limits/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/.debug/liblttng-ust-provider-ust-tests-demo3.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/.debug/gen-events
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/
liblttng-ust-provider-ust-tests-demo.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-tp.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/streaming/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/gen-events
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthstall.lai
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-provider-ust-tests-demo.lai
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo3.lai
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_check
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_test.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/
liblttng-ust-provider-ust-tests-demo3-static.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/exit-fast
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/
liblttng-ust-provider-ust-tests-demo3.la
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/
liblttng-ust-provider-ust-tests-demo.la
/usr/lib/lttng-tools/ptest/tests/unit/test_utils_parse_size_suffix.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_session
/usr/lib/lttng-tools/ptest/tests/regression/tools/save-load/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_uri
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthstall.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-tp2.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/gen-nevents
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_exit.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/
liblttng-ust-provider-ust-tests-demo3.la
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/health_check
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_session
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/snapshots/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/java-log4j/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/libhealthstall.la
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/.debug/gen-ust-events
/usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/kernel/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp3.lo
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthexit.so
/usr/lib/lttng-tools/ptest/tests/unit/test_uri.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/Makefile
/usr/lib/lttng-tools/ptest/tests/utils/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/buffers-pid/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_session.o
/usr/lib/lttng-tools/ptest/tests/utils/tap/tap.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/daemon
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/tp.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/.debug/gen-events
/usr/lib/lttng-tools/ptest/tests/unit/test_utils_expand_path
/usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/gen-nevents.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/
liblttng-ust-provider-ust-tests-demo.la
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/.libs/ini_config
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_uri
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_fail.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/demo.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork2.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo-static.a
/usr/lib/lttng-tools/ptest/tests/utils/tap/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork2
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp2.lo
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_ust_data
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/.debug/fork2
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_test
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/
liblttng-ust-provider-ust-tests-demo-static.la
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/demo_builtin
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/demo_static
/usr/lib/lttng-tools/ptest/tests/unit/test_utils_parse_size_suffix
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp2.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo3-static.a
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp.lo
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-provider-ust-tests-demo.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/Makefile
/usr/lib/lttng-tools/ptest/tests/unit/test_ust_data
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-provider-ust-tests-demo3.so
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_kernel_data
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo
/usr/lib/lttng-tools/ptest/tests/regression/ust/linking/
liblttng-ust-provider-ust-tests-demo3.la
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthexit.lai
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/libhealthstall.so
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_fail.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/periodical-metadata-flush/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthtpfail.so
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/.debug/fork
/usr/lib/lttng-tools/ptest/tests/unit/.debug/test_utils_expand_path
/usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/
libhealthexit.la
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/tp.o
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/gen-ust-nevents.o
/usr/lib/lttng-tools/ptest/tests/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp3.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/gen-ust-events.o
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_fail.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/prog.o
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/.debug/exit-fast
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/Makefile
/usr/lib/lttng-tools/ptest/tests/regression/tools/mi/validate_xml"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-staticdev: PKGR
changed from r0.24 to r1.0
  * PR changed from "r0" to "r1"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools: PKGR changed from
r0.24 to r1.0
  * PR changed from "r0" to "r1"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools: PKGSIZE changed from
1453502 to 1636926 (+12%)

Ross

--001a11344c843bcc7c0515e2add9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 May 2015 at 03:13, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div id=3D":42u" class=3D"" style=
=3D"overflow:hidden">It works well with autotools now.<br></div></blockquot=
e></div><br>I&#39;m not sure about that:</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">packages/core=
i7-64-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST: removed &quot;/us=
r/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/gen-ust-nevents=
 /usr/lib/lttng-tools/ptest/tests/unit/Makefile /usr/lib/lttng-tools/ptest/=
tests/unit/test_ust_data.o /usr/lib/lttng-tools/ptest/tests/regression/ust/=
linking/tp3.o /usr/lib/lttng-tools/ptest/tests/regression/tools/live/.libs/=
.debug/live_test /usr/lib/lttng-tools/ptest/tests/regression/tools/health/.=
libs/.debug/libhealthtpfail.so /usr/lib/lttng-tools/ptest/tests/regression/=
ust/linking/tp.lo /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/d=
emo-demo.o /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/Ma=
kefile /usr/lib/lttng-tools/ptest/tests/regression/tools/mi/validate_xml-va=
lidate_xml.o /usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/<a href=3D"ht=
tp://libtap.la">libtap.la</a> /usr/lib/lttng-tools/ptest/tests/regression/u=
st/exit-fast/exit-fast.o /usr/lib/lttng-tools/ptest/tests/regression/ust/ov=
erlap/demo/tp2.o /usr/lib/lttng-tools/ptest/tests/utils/testapp/Makefile /u=
sr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_exit.o =
/usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp2.o /u=
sr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin /usr/lib=
/lttng-tools/ptest/tests/regression/tools/mi/.debug/extract_xml /usr/lib/lt=
tng-tools/ptest/tests/utils/testapp/gen-ust-events/gen-ust-events.o /usr/li=
b/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/.debug/gen-ust-neve=
nts /usr/lib/lttng-tools/ptest/tests/regression/ust/multi-session/.debug/ge=
n-nevents /usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/g=
en-events /usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_s=
tall.o /usr/lib/lttng-tools/ptest/tests/utils/tap/<a href=3D"http://libtap.=
la">libtap.la</a> /usr/lib/lttng-tools/ptest/tests/regression/ust/high-thro=
ughput/tp.o /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/<=
a href=3D"http://liblttng-ust-provider-ust-tests-demo3.la">liblttng-ust-pro=
vider-ust-tests-demo3.la</a> /usr/lib/lttng-tools/ptest/tests/regression/to=
ols/health/<a href=3D"http://libhealthexit.la">libhealthexit.la</a> /usr/li=
b/lttng-tools/ptest/tests/utils/tap/.libs/tap.o /usr/lib/lttng-tools/ptest/=
tests/regression/tools/health/.libs/health_stall.o /usr/lib/lttng-tools/pte=
st/tests/regression/ust/overlap/demo/.libs/.debug/liblttng-ust-provider-ust=
-tests-demo.so /usr/lib/lttng-tools/ptest/tests/regression/tools/health/hea=
lth_exit.lo /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-tracef/.=
debug/gen-ust-tracef /usr/lib/lttng-tools/ptest/tests/regression/ust/linkin=
g/.libs/tp2.o /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/=
<a href=3D"http://liblttng-ust-provider-ust-tests-demo.la">liblttng-ust-pro=
vider-ust-tests-demo.la</a> /usr/lib/lttng-tools/ptest/tests/regression/ust=
/linking/demo_builtin-demo.o /usr/lib/lttng-tools/ptest/tests/regression/to=
ols/mi/extract_xml /usr/lib/lttng-tools/ptest/tests/regression/tools/health=
/.libs/<a href=3D"http://libhealthtpfail.la">libhealthtpfail.la</a> /usr/li=
b/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp3.lo /usr/lib/lttng=
-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp.o /usr/lib/lttng-to=
ols/ptest/tests/regression/ust/overlap/demo/demo /usr/lib/lttng-tools/ptest=
/tests/regression/tools/health/.libs/libhealthtpfail.lai /usr/lib/lttng-too=
ls/ptest/tests/regression/ust/linking/.libs/<a href=3D"http://liblttng-ust-=
provider-ust-tests-demo-static.la">liblttng-ust-provider-ust-tests-demo-sta=
tic.la</a> /usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/=
main.o /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/Makefil=
e /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-us=
t-provider-ust-tests-demo3.so /usr/lib/lttng-tools/ptest/tests/regression/u=
st/java-jul/Makefile /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust=
-events/tp.o /usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/ge=
n-ust-events /usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/daemon.=
o /usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/lib=
healthexit.so /usr/lib/lttng-tools/ptest/tests/regression/tools/mi/extract_=
xml-extract_xml.o /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.=
libs/.debug/liblttng-ust-provider-ust-tests-demo.so /usr/lib/lttng-tools/pt=
est/tests/regression/ust/low-throughput/Makefile /usr/lib/lttng-tools/ptest=
/tests/regression/ust/linking/demo.o /usr/lib/lttng-tools/ptest/tests/regre=
ssion/tools/filtering/Makefile /usr/lib/lttng-tools/ptest/tests/regression/=
tools/filtering/.debug/gen-ust-events /usr/lib/lttng-tools/ptest/tests/util=
s/testapp/gen-ust-tracef/gen-ust-tracef.o /usr/lib/lttng-tools/ptest/tests/=
utils/testapp/gen-ust-tracef/gen-ust-tracef /usr/lib/lttng-tools/ptest/test=
s/regression/ust/linking/tp2.o /usr/lib/lttng-tools/ptest/tests/regression/=
tools/health/.libs/<a href=3D"http://libhealthstall.la">libhealthstall.la</=
a> /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblt=
tng-ust-provider-ust-tests-demo3.lai /usr/lib/lttng-tools/ptest/tests/regre=
ssion/ust/overlap/demo/tp.o /usr/lib/lttng-tools/ptest/tests/regression/too=
ls/health/health_check.o /usr/lib/lttng-tools/ptest/tests/regression/tools/=
health/health_stall.lo /usr/lib/lttng-tools/ptest/tests/regression/tools/li=
ve/.libs/live_test /usr/lib/lttng-tools/ptest/tests/regression/ust/before-a=
fter/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/Makef=
ile /usr/lib/lttng-tools/ptest/tests/regression/tools/health/<a href=3D"htt=
p://libhealthtpfail.la">libhealthtpfail.la</a> /usr/lib/lttng-tools/ptest/t=
ests/regression/ust/overlap/demo/.debug/demo /usr/lib/lttng-tools/ptest/tes=
ts/utils/testapp/gen-ust-nevents/Makefile /usr/lib/lttng-tools/ptest/tests/=
regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo.lai /usr/=
lib/lttng-tools/ptest/tests/unit/.debug/test_utils_parse_size_suffix /usr/l=
ib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp3.o /usr/lib/lttng=
-tools/ptest/tests/regression/tools/mi/.debug/validate_xml /usr/lib/lttng-t=
ools/ptest/tests/regression/ust/nprocesses/Makefile /usr/lib/lttng-tools/pt=
est/tests/unit/ini_config/ini_config.o /usr/lib/lttng-tools/ptest/tests/uti=
ls/testapp/gen-ust-events/gen-ust-events /usr/lib/lttng-tools/ptest/tests/u=
nit/ini_config/.libs/.debug/ini_config /usr/lib/lttng-tools/ptest/tests/reg=
ression/ust/multi-session/Makefile /usr/lib/lttng-tools/ptest/tests/regress=
ion/tools/live/Makefile /usr/lib/lttng-tools/ptest/tests/unit/test_kernel_d=
ata /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_static /us=
r/lib/lttng-tools/ptest/tests/utils/tap/tap.lo /usr/lib/lttng-tools/ptest/t=
ests/stress/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/daemon=
/.debug/daemon /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.lib=
s/liblttng-ust-provider-ust-tests-demo.so /usr/lib/lttng-tools/ptest/tests/=
regression/ust/linking/.libs/.debug/liblttng-ust-provider-ust-tests-demo3.s=
o /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/<a href=3D"http:/=
/liblttng-ust-provider-ust-tests-demo3-static.la">liblttng-ust-provider-ust=
-tests-demo3-static.la</a> /usr/lib/lttng-tools/ptest/tests/unit/test_kerne=
l_data.o /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/dem=
o /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/tp3.o /usr/=
lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper/prog /usr/lib/lttng=
-tools/ptest/tests/regression/ust/fork/Makefile /usr/lib/lttng-tools/ptest/=
tests/regression/tools/exclusion/Makefile /usr/lib/lttng-tools/ptest/tests/=
regression/ust/libc-wrapper/.debug/prog /usr/lib/lttng-tools/ptest/tests/re=
gression/ust/fork/fork /usr/lib/lttng-tools/ptest/tests/regression/ust/link=
ing/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp.o /=
usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/libtap.a /usr/lib/lttng-too=
ls/ptest/tests/regression/ust/high-throughput/Makefile /usr/lib/lttng-tools=
/ptest/tests/regression/Makefile /usr/lib/lttng-tools/ptest/tests/regressio=
n/ust/low-throughput/main.o /usr/lib/lttng-tools/ptest/tests/unit/test_util=
s_expand_path.o /usr/lib/lttng-tools/ptest/tests/regression/tools/tracefile=
-limits/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/de=
mo/.libs/.debug/liblttng-ust-provider-ust-tests-demo3.so /usr/lib/lttng-too=
ls/ptest/tests/regression/ust/high-throughput/.debug/gen-events /usr/lib/lt=
tng-tools/ptest/tests/regression/ust/linking/<a href=3D"http://liblttng-ust=
-provider-ust-tests-demo.la">liblttng-ust-provider-ust-tests-demo.la</a> /u=
sr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin-tp.o /us=
r/lib/lttng-tools/ptest/tests/regression/tools/streaming/Makefile /usr/lib/=
lttng-tools/ptest/tests/regression/ust/low-throughput/gen-events /usr/lib/l=
ttng-tools/ptest/tests/regression/tools/health/.libs/libhealthstall.lai /us=
r/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-us=
t-provider-ust-tests-demo.lai /usr/lib/lttng-tools/ptest/tests/regression/u=
st/multi-session/tp.o /usr/lib/lttng-tools/ptest/tests/regression/ust/linki=
ng/.libs/liblttng-ust-provider-ust-tests-demo3.lai /usr/lib/lttng-tools/pte=
st/tests/regression/tools/health/.libs/health_check /usr/lib/lttng-tools/pt=
est/tests/regression/tools/live/live_test.o /usr/lib/lttng-tools/ptest/test=
s/regression/ust/linking/.libs/<a href=3D"http://liblttng-ust-provider-ust-=
tests-demo3-static.la">liblttng-ust-provider-ust-tests-demo3-static.la</a> =
/usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/exit-fast /usr/li=
b/lttng-tools/ptest/tests/regression/ust/overlap/demo/<a href=3D"http://lib=
lttng-ust-provider-ust-tests-demo3.la">liblttng-ust-provider-ust-tests-demo=
3.la</a> /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/<a h=
ref=3D"http://liblttng-ust-provider-ust-tests-demo.la">liblttng-ust-provide=
r-ust-tests-demo.la</a> /usr/lib/lttng-tools/ptest/tests/unit/test_utils_pa=
rse_size_suffix.o /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-ev=
ents/Makefile /usr/lib/lttng-tools/ptest/tests/unit/test_session /usr/lib/l=
ttng-tools/ptest/tests/regression/tools/save-load/Makefile /usr/lib/lttng-t=
ools/ptest/tests/unit/test_uri /usr/lib/lttng-tools/ptest/tests/regression/=
tools/health/.libs/libhealthstall.so /usr/lib/lttng-tools/ptest/tests/regre=
ssion/ust/linking/demo_builtin-tp2.o /usr/lib/lttng-tools/ptest/tests/regre=
ssion/ust/multi-session/gen-nevents /usr/lib/lttng-tools/ptest/tests/regres=
sion/tools/health/health_exit.o /usr/lib/lttng-tools/ptest/tests/regression=
/ust/overlap/demo/.libs/<a href=3D"http://liblttng-ust-provider-ust-tests-d=
emo3.la">liblttng-ust-provider-ust-tests-demo3.la</a> /usr/lib/lttng-tools/=
ptest/tests/regression/tools/health/.libs/.debug/health_check /usr/lib/lttn=
g-tools/ptest/tests/unit/.debug/test_session /usr/lib/lttng-tools/ptest/tes=
ts/regression/tools/filtering/tp.o /usr/lib/lttng-tools/ptest/tests/regress=
ion/tools/snapshots/Makefile /usr/lib/lttng-tools/ptest/tests/regression/us=
t/java-log4j/Makefile /usr/lib/lttng-tools/ptest/tests/regression/tools/hea=
lth/<a href=3D"http://libhealthstall.la">libhealthstall.la</a> /usr/lib/ltt=
ng-tools/ptest/tests/utils/testapp/gen-ust-events/.debug/gen-ust-events /us=
r/lib/lttng-tools/ptest/tests/regression/ust/daemon/Makefile /usr/lib/lttng=
-tools/ptest/tests/regression/ust/linking/.libs/tp.o /usr/lib/lttng-tools/p=
test/tests/regression/kernel/Makefile /usr/lib/lttng-tools/ptest/tests/regr=
ession/ust/linking/tp3.lo /usr/lib/lttng-tools/ptest/tests/regression/tools=
/health/.libs/libhealthexit.so /usr/lib/lttng-tools/ptest/tests/unit/test_u=
ri.o /usr/lib/lttng-tools/ptest/tests/regression/tools/Makefile /usr/lib/lt=
tng-tools/ptest/tests/utils/Makefile /usr/lib/lttng-tools/ptest/tests/regre=
ssion/ust/buffers-pid/Makefile /usr/lib/lttng-tools/ptest/tests/unit/test_s=
ession.o /usr/lib/lttng-tools/ptest/tests/utils/tap/tap.o /usr/lib/lttng-to=
ols/ptest/tests/regression/ust/daemon/daemon /usr/lib/lttng-tools/ptest/tes=
ts/regression/ust/exit-fast/Makefile /usr/lib/lttng-tools/ptest/tests/regre=
ssion/ust/low-throughput/tp.o /usr/lib/lttng-tools/ptest/tests/regression/u=
st/low-throughput/.debug/gen-events /usr/lib/lttng-tools/ptest/tests/unit/t=
est_utils_expand_path /usr/lib/lttng-tools/ptest/tests/regression/ust/multi=
-session/gen-nevents.o /usr/lib/lttng-tools/ptest/tests/regression/ust/over=
lap/demo/.libs/<a href=3D"http://liblttng-ust-provider-ust-tests-demo.la">l=
iblttng-ust-provider-ust-tests-demo.la</a> /usr/lib/lttng-tools/ptest/tests=
/unit/ini_config/.libs/ini_config /usr/lib/lttng-tools/ptest/tests/unit/.de=
bug/test_uri /usr/lib/lttng-tools/ptest/tests/regression/tools/health/healt=
h_fail.lo /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/demo=
.o /usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork2.o /usr/lib/lt=
tng-tools/ptest/tests/regression/tools/mi/Makefile /usr/lib/lttng-tools/pte=
st/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo-=
static.a /usr/lib/lttng-tools/ptest/tests/utils/tap/Makefile /usr/lib/lttng=
-tools/ptest/tests/regression/ust/fork/fork2 /usr/lib/lttng-tools/ptest/tes=
ts/regression/ust/overlap/demo/tp2.lo /usr/lib/lttng-tools/ptest/tests/unit=
/.debug/test_ust_data /usr/lib/lttng-tools/ptest/tests/regression/ust/fork/=
.debug/fork2 /usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_te=
st /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/<a href=3D"http:=
//liblttng-ust-provider-ust-tests-demo-static.la">liblttng-ust-provider-ust=
-tests-demo-static.la</a> /usr/lib/lttng-tools/ptest/tests/unit/ini_config/=
ini_config /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/d=
emo_builtin /usr/lib/lttng-tools/ptest/tests/regression/tools/health/health=
_check /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo_builtin=
-tp3.o /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.debug/demo_=
static /usr/lib/lttng-tools/ptest/tests/unit/test_utils_parse_size_suffix /=
usr/lib/lttng-tools/ptest/tests/regression/tools/health/Makefile /usr/lib/l=
ttng-tools/ptest/tests/regression/ust/linking/tp2.lo /usr/lib/lttng-tools/p=
test/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-dem=
o3-static.a /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/tp=
.lo /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/libl=
ttng-ust-provider-ust-tests-demo.so /usr/lib/lttng-tools/ptest/tests/regres=
sion/ust/Makefile /usr/lib/lttng-tools/ptest/tests/unit/test_ust_data /usr/=
lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/liblttng-ust-=
provider-ust-tests-demo3.so /usr/lib/lttng-tools/ptest/tests/unit/.debug/te=
st_kernel_data /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/demo=
 /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/<a href=3D"http://=
liblttng-ust-provider-ust-tests-demo3.la">liblttng-ust-provider-ust-tests-d=
emo3.la</a> /usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/=
libhealthexit.lai /usr/lib/lttng-tools/ptest/tests/regression/tools/health/=
.libs/.debug/libhealthstall.so /usr/lib/lttng-tools/ptest/tests/regression/=
tools/health/health_fail.o /usr/lib/lttng-tools/ptest/tests/regression/ust/=
periodical-metadata-flush/Makefile /usr/lib/lttng-tools/ptest/tests/regress=
ion/tools/health/.libs/libhealthtpfail.so /usr/lib/lttng-tools/ptest/tests/=
regression/ust/fork/.debug/fork /usr/lib/lttng-tools/ptest/tests/unit/.debu=
g/test_utils_expand_path /usr/lib/lttng-tools/ptest/tests/regression/ust/li=
bc-wrapper/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fo=
rk.o /usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/<a href=
=3D"http://libhealthexit.la">libhealthexit.la</a> /usr/lib/lttng-tools/ptes=
t/tests/utils/testapp/gen-ust-nevents/tp.o /usr/lib/lttng-tools/ptest/tests=
/utils/testapp/gen-ust-nevents/gen-ust-nevents.o /usr/lib/lttng-tools/ptest=
/tests/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/dem=
o/.libs/tp3.o /usr/lib/lttng-tools/ptest/tests/regression/tools/filtering/g=
en-ust-events.o /usr/lib/lttng-tools/ptest/tests/regression/tools/health/.l=
ibs/health_fail.o /usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrap=
per/prog.o /usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fast/.debug=
/exit-fast /usr/lib/lttng-tools/ptest/tests/unit/ini_config/Makefile /usr/l=
ib/lttng-tools/ptest/tests/regression/tools/mi/validate_xml&quot;</div><div=
 class=3D"gmail_extra">=C2=A0 * PR changed from &quot;r0&quot; to &quot;r1&=
quot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/lttng-t=
ools/lttng-tools-ptest: RDEPENDS: removed &quot;glibc ([&#39;&gt;=3D 2.21&#=
39;]) lttng-tools ([&#39;&gt;=3D 2.6.0&#39;]) libxml2 ([&#39;&gt;=3D 2.9.2&=
#39;]) popt ([&#39;&gt;=3D 1.16&#39;]) lttng-ust ([&#39;&gt;=3D 2.6.0&#39;]=
) util-linux-libuuid ([&#39;&gt;=3D 2.26.1&#39;]) liburcu ([&#39;&gt;=3D 0.=
8.6&#39;])&quot;</div><div class=3D"gmail_extra">=C2=A0 * PR changed from &=
quot;r0&quot; to &quot;r1&quot;</div><div class=3D"gmail_extra">packages/co=
rei7-64-poky-linux/lttng-tools/lttng-tools-ptest: PKGR changed from r0.24 t=
o r1.0</div><div class=3D"gmail_extra">=C2=A0 * PR changed from &quot;r0&qu=
ot; to &quot;r1&quot;</div><div class=3D"gmail_extra">packages/corei7-64-po=
ky-linux/lttng-tools/lttng-tools-ptest: PKGSIZE changed from 9251406 to 127=
6028 (-86%)</div><div class=3D"gmail_extra">=C2=A0 * PR changed from &quot;=
r0&quot; to &quot;r1&quot;</div><div class=3D"gmail_extra">=C2=A0 * FILELIS=
T: removed &quot;/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nev=
ents/gen-ust-nevents /usr/lib/lttng-tools/ptest/tests/unit/Makefile /usr/li=
b/lttng-tools/ptest/tests/unit/test_ust_data.o /usr/lib/lttng-tools/ptest/t=
ests/regression/ust/linking/tp3.o /usr/lib/lttng-tools/ptest/tests/regressi=
on/tools/live/.libs/.debug/live_test /usr/lib/lttng-tools/ptest/tests/regre=
ssion/tools/health/.libs/.debug/libhealthtpfail.so /usr/lib/lttng-tools/pte=
st/tests/regression/ust/linking/tp.lo /usr/lib/lttng-tools/ptest/tests/regr=
ession/ust/linking/demo-demo.o /usr/lib/lttng-tools/ptest/tests/utils/testa=
pp/gen-ust-tracef/Makefile /usr/lib/lttng-tools/ptest/tests/regression/tool=
s/mi/validate_xml-validate_xml.o /usr/lib/lttng-tools/ptest/tests/utils/tap=
/.libs/<a href=3D"http://libtap.la">libtap.la</a> /usr/lib/lttng-tools/ptes=
t/tests/regression/ust/exit-fast/exit-fast.o /usr/lib/lttng-tools/ptest/tes=
ts/regression/ust/overlap/demo/tp2.o /usr/lib/lttng-tools/ptest/tests/utils=
/testapp/Makefile /usr/lib/lttng-tools/ptest/tests/regression/tools/health/=
.libs/health_exit.o /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap=
/demo/.libs/tp2.o /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/d=
emo_builtin /usr/lib/lttng-tools/ptest/tests/regression/tools/mi/.debug/ext=
ract_xml /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/gen-=
ust-events.o /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents=
/.debug/gen-ust-nevents /usr/lib/lttng-tools/ptest/tests/regression/ust/mul=
ti-session/.debug/gen-nevents /usr/lib/lttng-tools/ptest/tests/regression/u=
st/high-throughput/gen-events /usr/lib/lttng-tools/ptest/tests/regression/t=
ools/health/health_stall.o /usr/lib/lttng-tools/ptest/tests/utils/tap/<a hr=
ef=3D"http://libtap.la">libtap.la</a> /usr/lib/lttng-tools/ptest/tests/regr=
ession/ust/high-throughput/tp.o /usr/lib/lttng-tools/ptest/tests/regression=
/ust/linking/.libs/<a href=3D"http://liblttng-ust-provider-ust-tests-demo3.=
la">liblttng-ust-provider-ust-tests-demo3.la</a> /usr/lib/lttng-tools/ptest=
/tests/regression/tools/health/<a href=3D"http://libhealthexit.la">libhealt=
hexit.la</a> /usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/tap.o /usr/li=
b/lttng-tools/ptest/tests/regression/tools/health/.libs/health_stall.o /usr=
/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/.debug/liblt=
tng-ust-provider-ust-tests-demo.so /usr/lib/lttng-tools/ptest/tests/regress=
ion/tools/health/health_exit.lo /usr/lib/lttng-tools/ptest/tests/utils/test=
app/gen-ust-tracef/.debug/gen-ust-tracef /usr/lib/lttng-tools/ptest/tests/r=
egression/ust/linking/.libs/tp2.o /usr/lib/lttng-tools/ptest/tests/regressi=
on/ust/overlap/demo/<a href=3D"http://liblttng-ust-provider-ust-tests-demo.=
la">liblttng-ust-provider-ust-tests-demo.la</a> /usr/lib/lttng-tools/ptest/=
tests/regression/ust/linking/demo_builtin-demo.o /usr/lib/lttng-tools/ptest=
/tests/regression/tools/mi/extract_xml /usr/lib/lttng-tools/ptest/tests/reg=
ression/tools/health/.libs/<a href=3D"http://libhealthtpfail.la">libhealtht=
pfail.la</a> /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/t=
p3.lo /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/.libs/tp=
.o /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/demo /usr/l=
ib/lttng-tools/ptest/tests/regression/tools/health/.libs/libhealthtpfail.la=
i /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/<a href=3D"=
http://liblttng-ust-provider-ust-tests-demo-static.la">liblttng-ust-provide=
r-ust-tests-demo-static.la</a> /usr/lib/lttng-tools/ptest/tests/regression/=
ust/high-throughput/main.o /usr/lib/lttng-tools/ptest/tests/regression/ust/=
overlap/demo/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/linki=
ng/.libs/liblttng-ust-provider-ust-tests-demo3.so /usr/lib/lttng-tools/ptes=
t/tests/regression/ust/java-jul/Makefile /usr/lib/lttng-tools/ptest/tests/u=
tils/testapp/gen-ust-events/tp.o /usr/lib/lttng-tools/ptest/tests/regressio=
n/tools/filtering/gen-ust-events /usr/lib/lttng-tools/ptest/tests/regressio=
n/ust/daemon/daemon.o /usr/lib/lttng-tools/ptest/tests/regression/tools/hea=
lth/.libs/.debug/libhealthexit.so /usr/lib/lttng-tools/ptest/tests/regressi=
on/tools/mi/extract_xml-extract_xml.o /usr/lib/lttng-tools/ptest/tests/regr=
ession/ust/linking/.libs/.debug/liblttng-ust-provider-ust-tests-demo.so /us=
r/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/Makefile /usr/l=
ib/lttng-tools/ptest/tests/regression/ust/linking/demo.o /usr/lib/lttng-too=
ls/ptest/tests/regression/tools/filtering/Makefile /usr/lib/lttng-tools/pte=
st/tests/regression/tools/filtering/.debug/gen-ust-events /usr/lib/lttng-to=
ols/ptest/tests/utils/testapp/gen-ust-tracef/gen-ust-tracef.o /usr/lib/lttn=
g-tools/ptest/tests/utils/testapp/gen-ust-tracef/gen-ust-tracef /usr/lib/lt=
tng-tools/ptest/tests/regression/ust/linking/tp2.o /usr/lib/lttng-tools/pte=
st/tests/regression/tools/health/.libs/<a href=3D"http://libhealthstall.la"=
>libhealthstall.la</a> /usr/lib/lttng-tools/ptest/tests/regression/ust/over=
lap/demo/.libs/liblttng-ust-provider-ust-tests-demo3.lai /usr/lib/lttng-too=
ls/ptest/tests/regression/ust/overlap/demo/tp.o /usr/lib/lttng-tools/ptest/=
tests/regression/tools/health/health_check.o /usr/lib/lttng-tools/ptest/tes=
ts/regression/tools/health/health_stall.lo /usr/lib/lttng-tools/ptest/tests=
/regression/tools/live/.libs/live_test /usr/lib/lttng-tools/ptest/tests/reg=
ression/ust/before-after/Makefile /usr/lib/lttng-tools/ptest/tests/regressi=
on/ust/overlap/Makefile /usr/lib/lttng-tools/ptest/tests/regression/tools/h=
ealth/<a href=3D"http://libhealthtpfail.la">libhealthtpfail.la</a> /usr/lib=
/lttng-tools/ptest/tests/regression/ust/overlap/demo/.debug/demo /usr/lib/l=
ttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/Makefile /usr/lib/lttn=
g-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-provider-ust-=
tests-demo.lai /usr/lib/lttng-tools/ptest/tests/unit/.debug/test_utils_pars=
e_size_suffix /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/=
tp3.o /usr/lib/lttng-tools/ptest/tests/regression/tools/mi/.debug/validate_=
xml /usr/lib/lttng-tools/ptest/tests/regression/ust/nprocesses/Makefile /us=
r/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config.o /usr/lib/lttng-t=
ools/ptest/tests/utils/testapp/gen-ust-events/gen-ust-events /usr/lib/lttng=
-tools/ptest/tests/unit/ini_config/.libs/.debug/ini_config /usr/lib/lttng-t=
ools/ptest/tests/regression/ust/multi-session/Makefile /usr/lib/lttng-tools=
/ptest/tests/regression/tools/live/Makefile /usr/lib/lttng-tools/ptest/test=
s/unit/test_kernel_data /usr/lib/lttng-tools/ptest/tests/regression/ust/lin=
king/demo_static /usr/lib/lttng-tools/ptest/tests/utils/tap/tap.lo /usr/lib=
/lttng-tools/ptest/tests/stress/Makefile /usr/lib/lttng-tools/ptest/tests/r=
egression/ust/daemon/.debug/daemon /usr/lib/lttng-tools/ptest/tests/regress=
ion/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo.so /usr/lib/lttn=
g-tools/ptest/tests/regression/ust/linking/.libs/.debug/liblttng-ust-provid=
er-ust-tests-demo3.so /usr/lib/lttng-tools/ptest/tests/regression/ust/linki=
ng/<a href=3D"http://liblttng-ust-provider-ust-tests-demo3-static.la">liblt=
tng-ust-provider-ust-tests-demo3-static.la</a> /usr/lib/lttng-tools/ptest/t=
ests/unit/test_kernel_data.o /usr/lib/lttng-tools/ptest/tests/regression/us=
t/linking/.debug/demo /usr/lib/lttng-tools/ptest/tests/regression/ust/linki=
ng/.libs/tp3.o /usr/lib/lttng-tools/ptest/tests/regression/ust/libc-wrapper=
/prog /usr/lib/lttng-tools/ptest/tests/regression/ust/fork/Makefile /usr/li=
b/lttng-tools/ptest/tests/regression/tools/exclusion/Makefile /usr/lib/lttn=
g-tools/ptest/tests/regression/ust/libc-wrapper/.debug/prog /usr/lib/lttng-=
tools/ptest/tests/regression/ust/fork/fork /usr/lib/lttng-tools/ptest/tests=
/regression/ust/linking/Makefile /usr/lib/lttng-tools/ptest/tests/regressio=
n/ust/linking/tp.o /usr/lib/lttng-tools/ptest/tests/utils/tap/.libs/libtap.=
a /usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/Makefile =
/usr/lib/lttng-tools/ptest/tests/regression/Makefile /usr/lib/lttng-tools/p=
test/tests/regression/ust/low-throughput/main.o /usr/lib/lttng-tools/ptest/=
tests/unit/test_utils_expand_path.o /usr/lib/lttng-tools/ptest/tests/regres=
sion/tools/tracefile-limits/Makefile /usr/lib/lttng-tools/ptest/tests/regre=
ssion/ust/overlap/demo/.libs/.debug/liblttng-ust-provider-ust-tests-demo3.s=
o /usr/lib/lttng-tools/ptest/tests/regression/ust/high-throughput/.debug/ge=
n-events /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/<a href=3D=
"http://liblttng-ust-provider-ust-tests-demo.la">liblttng-ust-provider-ust-=
tests-demo.la</a> /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/d=
emo_builtin-tp.o /usr/lib/lttng-tools/ptest/tests/regression/tools/streamin=
g/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/low-throughput/g=
en-events /usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/li=
bhealthstall.lai /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/de=
mo/.libs/liblttng-ust-provider-ust-tests-demo.lai /usr/lib/lttng-tools/ptes=
t/tests/regression/ust/multi-session/tp.o /usr/lib/lttng-tools/ptest/tests/=
regression/ust/linking/.libs/liblttng-ust-provider-ust-tests-demo3.lai /usr=
/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/health_check /us=
r/lib/lttng-tools/ptest/tests/regression/tools/live/live_test.o /usr/lib/lt=
tng-tools/ptest/tests/regression/ust/linking/.libs/<a href=3D"http://libltt=
ng-ust-provider-ust-tests-demo3-static.la">liblttng-ust-provider-ust-tests-=
demo3-static.la</a> /usr/lib/lttng-tools/ptest/tests/regression/ust/exit-fa=
st/exit-fast /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo/<=
a href=3D"http://liblttng-ust-provider-ust-tests-demo3.la">liblttng-ust-pro=
vider-ust-tests-demo3.la</a> /usr/lib/lttng-tools/ptest/tests/regression/us=
t/linking/.libs/<a href=3D"http://liblttng-ust-provider-ust-tests-demo.la">=
liblttng-ust-provider-ust-tests-demo.la</a> /usr/lib/lttng-tools/ptest/test=
s/unit/test_utils_parse_size_suffix.o /usr/lib/lttng-tools/ptest/tests/util=
s/testapp/gen-ust-events/Makefile /usr/lib/lttng-tools/ptest/tests/unit/tes=
t_session /usr/lib/lttng-tools/ptest/tests/regression/tools/save-load/Makef=
ile /usr/lib/lttng-tools/ptest/tests/unit/test_uri /usr/lib/lttng-tools/pte=
st/tests/regression/tools/health/.libs/libhealthstall.so /usr/lib/lttng-too=
ls/ptest/tests/regression/ust/linking/demo_builtin-tp2.o /usr/lib/lttng-too=
ls/ptest/tests/regression/ust/multi-session/gen-nevents /usr/lib/lttng-tool=
s/ptest/tests/regression/tools/health/health_exit.o /usr/lib/lttng-tools/pt=
est/tests/regression/ust/overlap/demo/.libs/<a href=3D"http://liblttng-ust-=
provider-ust-tests-demo3.la">liblttng-ust-provider-ust-tests-demo3.la</a> /=
usr/lib/lttng-tools/ptest/tests/regression/tools/health/.libs/.debug/health=
_check /usr/lib/lttng-tools/ptest/tests/unit/.debug/test_session /usr/lib/l=
ttng-tools/ptest/tests/regression/tools/filtering/tp.o /usr/lib/lttng-tools=
/ptest/tests/regression/tools/snapshots/Makefile /usr/lib/lttng-tools/ptest=
/tests/regression/ust/java-log4j/Makefile /usr/lib/lttng-tools/ptest/tests/=
regression/tools/health/<a href=3D"http://libhealthstall.la">libhealthstall=
.la</a> /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events/.debu=
g/gen-ust-events /usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/Mak=
efile /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/tp.o /u=
sr/lib/lttng-tools/ptest/tests/regression/kernel/Makefile /usr/lib/lttng-to=
ols/ptest/tests/regression/ust/linking/tp3.lo /usr/lib/lttng-tools/ptest/te=
sts/regression/tools/health/.libs/libhealthexit.so /usr/lib/lttng-tools/pte=
st/tests/unit/test_uri.o /usr/lib/lttng-tools/ptest/tests/regression/tools/=
Makefile /usr/lib/lttng-tools/ptest/tests/utils/Makefile /usr/lib/lttng-too=
ls/ptest/tests/regression/ust/buffers-pid/Makefile /usr/lib/lttng-tools/pte=
st/tests/unit/test_session.o /usr/lib/lttng-tools/ptest/tests/utils/tap/tap=
.o /usr/lib/lttng-tools/ptest/tests/regression/ust/daemon/daemon /usr/lib/l=
ttng-tools/ptest/tests/regression/ust/exit-fast/Makefile /usr/lib/lttng-too=
ls/ptest/tests/regression/ust/low-throughput/tp.o /usr/lib/lttng-tools/ptes=
t/tests/regression/ust/low-throughput/.debug/gen-events /usr/lib/lttng-tool=
s/ptest/tests/unit/test_utils_expand_path /usr/lib/lttng-tools/ptest/tests/=
regression/ust/multi-session/gen-nevents.o /usr/lib/lttng-tools/ptest/tests=
/regression/ust/overlap/demo/.libs/<a href=3D"http://liblttng-ust-provider-=
ust-tests-demo.la">liblttng-ust-provider-ust-tests-demo.la</a> /usr/lib/ltt=
ng-tools/ptest/tests/unit/ini_config/.libs/ini_config /usr/lib/lttng-tools/=
ptest/tests/unit/.debug/test_uri /usr/lib/lttng-tools/ptest/tests/regressio=
n/tools/health/health_fail.lo /usr/lib/lttng-tools/ptest/tests/regression/u=
st/overlap/demo/demo.o /usr/lib/lttng-tools/ptest/tests/regression/ust/fork=
/fork2.o /usr/lib/lttng-tools/ptest/tests/regression/tools/mi/Makefile /usr=
/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-prov=
ider-ust-tests-demo-static.a /usr/lib/lttng-tools/ptest/tests/utils/tap/Mak=
efile /usr/lib/lttng-tools/ptest/tests/regression/ust/fork/fork2 /usr/lib/l=
ttng-tools/ptest/tests/regression/ust/overlap/demo/tp2.lo /usr/lib/lttng-to=
ols/ptest/tests/unit/.debug/test_ust_data /usr/lib/lttng-tools/ptest/tests/=
regression/ust/fork/.debug/fork2 /usr/lib/lttng-tools/ptest/tests/regressio=
n/tools/live/live_test /usr/lib/lttng-tools/ptest/tests/regression/ust/link=
ing/<a href=3D"http://liblttng-ust-provider-ust-tests-demo-static.la">liblt=
tng-ust-provider-ust-tests-demo-static.la</a> /usr/lib/lttng-tools/ptest/te=
sts/unit/ini_config/ini_config /usr/lib/lttng-tools/ptest/tests/regression/=
ust/linking/.debug/demo_builtin /usr/lib/lttng-tools/ptest/tests/regression=
/tools/health/health_check /usr/lib/lttng-tools/ptest/tests/regression/ust/=
linking/demo_builtin-tp3.o /usr/lib/lttng-tools/ptest/tests/regression/ust/=
linking/.debug/demo_static /usr/lib/lttng-tools/ptest/tests/unit/test_utils=
_parse_size_suffix /usr/lib/lttng-tools/ptest/tests/regression/tools/health=
/Makefile /usr/lib/lttng-tools/ptest/tests/regression/ust/linking/tp2.lo /u=
sr/lib/lttng-tools/ptest/tests/regression/ust/linking/.libs/liblttng-ust-pr=
ovider-ust-tests-demo3-static.a /usr/lib/lttng-tools/ptest/tests/regression=
/ust/overlap/demo/tp.lo /usr/lib/lttng-tools/ptest/tests/regression/ust/ove=
rlap/demo/.libs/liblttng-ust-provider-ust-tests-demo.so /usr/lib/lttng-tool=
s/ptest/tests/regression/ust/Makefile /usr/lib/lttng-tools/ptest/tests/unit=
/test_ust_data /usr/lib/lttng-tools/ptest/tests/regression/ust/overlap/demo=
/.libs/liblttng-ust-provider-ust-tests-demo3.so /usr/lib/lttng-tools/ptest/=
tests/unit/.debug/test_kernel_data /usr/lib/lttng-tools/ptest/tests/regress=
ion/ust/linking/demo /usr/lib/lttng-tools/ptest/tests/regression/ust/linkin=
g/<a href=3D"http://liblttng-ust-provider-ust-tests-demo3.la">liblttng-ust-=
provider-ust-tests-demo3.la</a> /usr/lib/lttng-tools/ptest/tests/regression=
/tools/health/.libs/libhealthexit.lai /usr/lib/lttng-tools/ptest/tests/regr=
ession/tools/health/.libs/.debug/libhealthstall.so /usr/lib/lttng-tools/pte=
st/tests/regression/tools/health/health_fail.o /usr/lib/lttng-tools/ptest/t=
ests/regression/ust/periodical-metadata-flush/Makefile /usr/lib/lttng-tools=
/ptest/tests/regression/tools/health/.libs/libhealthtpfail.so /usr/lib/lttn=
g-tools/ptest/tests/regression/ust/fork/.debug/fork /usr/lib/lttng-tools/pt=
est/tests/unit/.debug/test_utils_expand_path /usr/lib/lttng-tools/ptest/tes=
ts/regression/ust/libc-wrapper/Makefile /usr/lib/lttng-tools/ptest/tests/re=
gression/ust/fork/fork.o /usr/lib/lttng-tools/ptest/tests/regression/tools/=
health/.libs/<a href=3D"http://libhealthexit.la">libhealthexit.la</a> /usr/=
lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-nevents/tp.o /usr/lib/ltt=
ng-tools/ptest/tests/utils/testapp/gen-ust-nevents/gen-ust-nevents.o /usr/l=
ib/lttng-tools/ptest/tests/Makefile /usr/lib/lttng-tools/ptest/tests/regres=
sion/ust/overlap/demo/.libs/tp3.o /usr/lib/lttng-tools/ptest/tests/regressi=
on/tools/filtering/gen-ust-events.o /usr/lib/lttng-tools/ptest/tests/regres=
sion/tools/health/.libs/health_fail.o /usr/lib/lttng-tools/ptest/tests/regr=
ession/ust/libc-wrapper/prog.o /usr/lib/lttng-tools/ptest/tests/regression/=
ust/exit-fast/.debug/exit-fast /usr/lib/lttng-tools/ptest/tests/unit/ini_co=
nfig/Makefile /usr/lib/lttng-tools/ptest/tests/regression/tools/mi/validate=
_xml&quot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/lt=
tng-tools/lttng-tools-staticdev: PKGR changed from r0.24 to r1.0</div><div =
class=3D"gmail_extra">=C2=A0 * PR changed from &quot;r0&quot; to &quot;r1&q=
uot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/lttng-to=
ols/lttng-tools: PKGR changed from r0.24 to r1.0</div><div class=3D"gmail_e=
xtra">=C2=A0 * PR changed from &quot;r0&quot; to &quot;r1&quot;</div><div c=
lass=3D"gmail_extra">packages/corei7-64-poky-linux/lttng-tools/lttng-tools:=
 PKGSIZE changed from 1453502 to 1636926 (+12%)</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a11344c843bcc7c0515e2add9--
