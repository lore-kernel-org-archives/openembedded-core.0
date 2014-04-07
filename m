Return-Path: <fathi.boudra@linaro.org>
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 056BF65DAA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 13:13:10 +0000 (UTC)
Received: by mail-bk0-f42.google.com with SMTP id mx12so188495bkb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 06:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HMEgHgRAvXTXsukBSw0RrAHIKeDrEE4BTsEOzllr9nc=;
	b=QRfJ32foQzFtQNuQDE4M94G86khJiTrSckaHlNW8odoxyPfEUbmTXDDa+S1Ih5/uPh
	72lpsuV2jVdneP0NXDZ6/LlCTpP0uWUFMdWxYkijdU++iOKo0OPHCl3qpONQNO7B1Mel
	TdbavA6Swt3Rv+JAh/jpkiqKiN9G8hxDkNqkno0uIp0rLAFImtxdVYFeYGEIn3EwWSkR
	lycvkMKEg+5Mh0FWNgOjkntOAdoEWByiDP02d8Q2wxjPtmhh01E5XXXrgpiThPAyfQYP
	FWb1hXwT+TwhHquOo2WhwliYYXCHZDTHqTN1UuwkteedhvlWg5si4x1B3ORkvQ6xtk0e
	jGMQ==
X-Gm-Message-State: ALoCoQkqOtX+HXlX2R4x2v7wX/s+4SIUSCQUaLaERJznpKdWnX0SgoPvRnTbr2WZZZeVn9IMZY2c
MIME-Version: 1.0
X-Received: by 10.152.42.230 with SMTP id r6mr2903191lal.32.1396892830718;
	Mon, 07 Apr 2014 10:47:10 -0700 (PDT)
Received: by 10.112.145.229 with HTTP; Mon, 7 Apr 2014 10:47:10 -0700 (PDT)
In-Reply-To: <1396874123.24597.51.camel@ted>
References: <1396872629-5748-1-git-send-email-fathi.boudra@linaro.org>
	<1396874123.24597.51.camel@ted>
Date: Mon, 7 Apr 2014 20:47:10 +0300
Message-ID: <CAGNsrLBV=VkfD=D7ncB3fg1TN_ybjYvHUyj4qnXEX3S=2QA7rQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] trace-cmd/kernelshark: update to 2.3.2 release (latest stable branch)
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
X-List-Received-Date: Tue, 08 Apr 2014 13:13:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 7 April 2014 15:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2014-04-07 at 15:10 +0300, Fathi Boudra wrote:
>>  * drop all the patches - not needed anymore
>>  * update SRCREV and PV to 2.3.2 tag
>>  * drop PR
>>  * update SRC_URI to use trace-cmd-stable-v2.3 branch
>>  * drop EXTRA_OEMAKE - not needed
>>  * update do_install and pass NO_PYTHON/prefix/plugin_dir
>>  * update trace-input.c md5 sum - FSF address has been updated
>>  * oe stylize the recipes
>
> There is too much going on in this patch to make it easy to review. In
> particular, style changes should be put into a separate patch.

all the changes are documented. as you can see, all are trivial changes.

> I'd like
> to better understand why the patches aren't needed too. Were patches
> merged upstream which accounted for these issues? including the docs?

most of the patches were backports, hence already upstream.
exceptions are:
* addldflags.patch - fixed upstream in some other way
* make-docs-optional.patch - useless since upstream has now an
explicit build targets for the docs (doc/install_doc)

> Cheers,
>
> Richard
>
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  .../{kernelshark_1.2.bb => kernelshark_2.3.2.bb}   | 32 ++++----
>>  .../trace-cmd/trace-cmd/addldflags.patch           | 51 ------------
>>  .../trace-cmd/blktrace-api-compatibility.patch     | 29 -------
>>  .../trace-cmd/trace-cmd/make-docs-optional.patch   | 36 --------
>>  ...dd-checks-for-invalid-pointers-to-fix-seg.patch | 61 --------------
>>  ...o-not-call-stop_threads-if-doing-latency-.patch | 38 ---------
>>  ...etting-plugin-to-nop-clears-data-before-i.patch | 96 ----------------------
>>  .../{trace-cmd_1.2.bb => trace-cmd_2.3.2.bb}       | 27 ++----
>>  8 files changed, 23 insertions(+), 347 deletions(-)
>>  rename meta/recipes-kernel/trace-cmd/{kernelshark_1.2.bb => kernelshark_2.3.2.bb} (51%)
>>  delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
>>  delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
>>  delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
>>  delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
>>  delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
>>  delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
>>  rename meta/recipes-kernel/trace-cmd/{trace-cmd_1.2.bb => trace-cmd_2.3.2.bb} (41%)
>>
>> diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_2.3.2.bb
>> similarity index 51%
>> rename from meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>> rename to meta/recipes-kernel/trace-cmd/kernelshark_2.3.2.bb
>> index 9268a50..545244e 100644
>> --- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>> +++ b/meta/recipes-kernel/trace-cmd/kernelshark_2.3.2.bb
>> @@ -2,28 +2,26 @@ SUMMARY = "Graphical trace viewer for Ftrace"
>>  LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>>                      file://kernel-shark.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
>> -
>> -SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
>> -PR = "r3"
>> -PV = "1.2+git${SRCPV}"
>> -
>>  DEPENDS = "gtk+"
>> -RDEPENDS_${PN} = "trace-cmd"
>> +SRCREV = "79e08f8edb38c4c5098486caaa87ca90ba00f547"
>> +PV = "2.3.2"
>>
>> -inherit pkgconfig pythonnative
>> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=trace-cmd-stable-v2.3 \
>> +"
>>
>> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
>> -           file://addldflags.patch \
>> -           file://make-docs-optional.patch \
>> -           file://blktrace-api-compatibility.patch"
>>  S = "${WORKDIR}/git"
>>
>> -EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
>> -
>> -FILESPATH = "${FILE_DIRNAME}/trace-cmd"
>> +inherit pkgconfig pythonnative
>>
>>  do_install() {
>> -     oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}" install_gui
>> -     rm -rf ${D}${datadir}/trace-cmd
>> -     rmdir ${D}${datadir}
>> +    ${MAKE} NO_PYTHON=1 prefix=${prefix} plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install_gui
>> +
>> +    # remove files already shipped in trace-cmd package
>> +    rm -f ${D}${bindir}/trace-cmd
>> +    rm -rf ${D}${libdir}/trace-cmd
>> +    rmdir ${D}${libdir}
>>  }
>> +
>> +RDEPENDS_${PN} = "trace-cmd"
>> +
>> +FILESPATH = "${FILE_DIRNAME}/trace-cmd"
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
>> deleted file mode 100644
>> index 14730db..0000000
>> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -trace-cmd: Cross-compile fixes for LDFLAGS and include path
>> -
>> -Add ability for the Makefile to respect LDFLAGS.
>> -Also remove hardcoded /usr/local/include include path.
>> -
>> -Upstream-Status: Accepted [Post 1.2: 5f576e9af7ad706774d9764a9ae3989376797c0e]
>> -
>> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> -
>> ----
>> - Makefile |    7 ++++---
>> - 1 file changed, 4 insertions(+), 3 deletions(-)
>> -
>> -Index: git/Makefile
>> -===================================================================
>> ---- git.orig/Makefile
>> -+++ git/Makefile
>> -@@ -202,12 +202,13 @@ export Q VERBOSE
>> - TRACECMD_VERSION = $(TC_VERSION).$(TC_PATCHLEVEL).$(TC_EXTRAVERSION)
>> - KERNELSHARK_VERSION = $(KS_VERSION).$(KS_PATCHLEVEL).$(KS_EXTRAVERSION)
>> -
>> --INCLUDES = -I. -I/usr/local/include $(CONFIG_INCLUDES)
>> -+INCLUDES = -I. $(CONFIG_INCLUDES)
>> -
>> - include features.mk
>> -
>> - # Set compile option CFLAGS if not set elsewhere
>> - CFLAGS ?= -g -Wall
>> -+LDFLAGS ?=
>> -
>> - ifndef NO_PTRACE
>> - ifneq ($(call try-cc,$(SOURCE_PTRACE),),y)
>> -@@ -251,7 +252,7 @@ do_fpic_compile =                                        \
>> -
>> - do_app_build =                                              \
>> -     ($(print_app_build)                             \
>> --    $(CC) $^ -rdynamic -o $@ $(CONFIG_LIBS) $(LIBS))
>> -+    $(CC) $^ -rdynamic -o $@ $(LDFLAGS) $(CONFIG_LIBS) $(LIBS))
>> -
>> - do_compile_shared_library =                 \
>> -     ($(print_shared_lib_compile)            \
>> -@@ -263,7 +264,7 @@ do_compile_plugin_obj =                          \
>> -
>> - do_plugin_build =                           \
>> -     ($(print_plugin_build)                  \
>> --    $(CC) $(CFLAGS) -shared -nostartfiles -o $@ $<)
>> -+    $(CC) $(CFLAGS) $(LDFLAGS) -shared -nostartfiles -o $@ $<)
>> -
>> - do_build_static_lib =                               \
>> -     ($(print_static_lib_build)              \
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
>> deleted file mode 100644
>> index 0789e9f..0000000
>> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -trace-cmd: Add blktrace_api compatibility for TC_BARRIER
>> -
>> -Newer kernels replace TC_BARRIER with TC_FLUSH. Ensure trace-cmd
>> -can build regardless of the linux-kernel-headers version.
>> -
>> -Upstream-Status: Innapropriate [Stop gap]
>> -
>> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> -
>> -diff --git a/plugin_blk.c b/plugin_blk.c
>> -index 9327b17..c8e5e1c 100644
>> ---- a/plugin_blk.c
>> -+++ b/plugin_blk.c
>> -@@ -44,6 +44,15 @@ struct blk_data {
>> -     unsigned short          pdu_len;
>> - };
>> -
>> -+/*
>> -+ * Newer kernels don't define BLK_TC_BARRIER and have replaced it with
>> -+ * BLK_TC_FLUSH. In this case, define it here and report FLUSHES as BARRIERS as
>> -+ * a workaround, as described in:
>> -+ * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=c09c47caedc9854d59378d6e34c989e51cfdd2b4
>> -+ */
>> -+#ifndef BLK_TC_BARRIER
>> -+#define BLK_TC_BARRIER 1<<2
>> -+#endif
>> - static void fill_rwbs(char *rwbs, int action, unsigned int bytes)
>> - {
>> -     int i = 0;
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
>> deleted file mode 100644
>> index 8402426..0000000
>> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -Disable building docs until we have asciidocs available as a recipe.
>> -
>> -Upstream-Status: Inappropriate [Account for missing dependency, the lazy way]
>> -
>> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> -
>> ----
>> - Makefile |    8 ++++++--
>> - 1 file changed, 6 insertions(+), 2 deletions(-)
>> -
>> -Index: git/Makefile
>> -===================================================================
>> ---- git.orig/Makefile
>> -+++ git/Makefile
>> -@@ -327,7 +327,9 @@ TARGETS = $(CMD_TARGETS) $(GUI_TARGETS)
>> - #    If you want kernelshark, then do:  make gui
>> - ###
>> -
>> --all: all_cmd doc show_gui_make
>> -+# Make doc optional
>> -+#all: all_cmd doc show_gui_make
>> -+all: all_cmd show_gui_make
>> -
>> - all_cmd: $(CMD_TARGETS)
>> -
>> -@@ -503,7 +505,9 @@ install_python: $(PYTHON_SO_INSTALL) $(P
>> - install_cmd: all_cmd install_plugins install_python
>> -     $(Q)$(call do_install,trace-cmd,$(bindir_SQ))
>> -
>> --install: install_cmd install_doc
>> -+# Make doc optional
>> -+#install: install_cmd install_doc
>> -+install: install_cmd
>> -     @echo "Note: to install the gui, type \"make install_gui\""
>> -
>> - install_gui: install_cmd gui
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
>> deleted file mode 100644
>> index 8fdeedb..0000000
>> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -From a6e259b2cd43db3c0f69441f627a8cf214f88506 Mon Sep 17 00:00:00 2001
>> -From: Mark Asselstine <mark.asselstine@windriver.com>
>> -Date: Thu, 5 Apr 2012 15:19:44 -0400
>> -Subject: [PATCH] trace-cmd: Add checks for invalid pointers to fix segfaults
>> -
>> -Upstream-Status: Backport
>> -
>> -Running 'trace-cmd report' after running latency tracers will cause a
>> -segfault due to invalid pointers. Adding checks to ensure
>> -pointers/lists are initialized before attempting to use them prevents
>> -these segfaults.
>> -
>> -Link: http://lkml.kernel.org/r/1333653586-3379-2-git-send-email-mark.asselstine@windriver.com
>> -
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
>> ----
>> - trace-input.c |   12 +++++++++---
>> - 1 file changed, 9 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/trace-input.c b/trace-input.c
>> -index b6af1e6..5151c1e 100644
>> ---- a/trace-input.c
>> -+++ b/trace-input.c
>> -@@ -695,7 +695,8 @@ static void __free_page(struct tracecmd_input *handle, struct page *page)
>> -
>> - static void free_page(struct tracecmd_input *handle, int cpu)
>> - {
>> --    if (!handle->cpu_data[cpu].page)
>> -+    if (!handle->cpu_data || cpu >= handle->cpus ||
>> -+        !handle->cpu_data[cpu].page)
>> -             return;
>> -
>> -     __free_page(handle, handle->cpu_data[cpu].page);
>> -@@ -746,8 +747,12 @@ void tracecmd_record_ref(struct record *record)
>> -
>> - static void free_next(struct tracecmd_input *handle, int cpu)
>> - {
>> --    struct record *record = handle->cpu_data[cpu].next;
>> -+    struct record *record;
>> -+
>> -+    if (!handle->cpu_data || cpu >= handle->cpus)
>> -+            return;
>> -
>> -+    record = handle->cpu_data[cpu].next;
>> -     if (!record)
>> -             return;
>> -
>> -@@ -2337,7 +2342,8 @@ void tracecmd_close(struct tracecmd_input *handle)
>> -             /* The tracecmd_peek_data may have cached a record */
>> -             free_next(handle, cpu);
>> -             free_page(handle, cpu);
>> --            if (!list_empty(&handle->cpu_data[cpu].pages))
>> -+            if (handle->cpu_data &&
>> -+                !list_empty(&handle->cpu_data[cpu].pages))
>> -                     warning("pages still allocated on cpu %d%s",
>> -                             cpu, show_records(&handle->cpu_data[cpu].pages));
>> -     }
>> ---
>> -1.7.10.4
>> -
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
>> deleted file mode 100644
>> index 4c00c51..0000000
>> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From 356dee73d9ced3e019dea2883a7f357fd4664b3e Mon Sep 17 00:00:00 2001
>> -From: Mark Asselstine <mark.asselstine@windriver.com>
>> -Date: Thu, 5 Apr 2012 15:19:45 -0400
>> -Subject: [PATCH] trace-cmd: Do not call stop_threads() if doing latency
>> - tracing
>> -
>> -Upstream-Status: Backport
>> -
>> -If we are using a latency tracer we do not call start_threads() we
>> -should therefore not call stop_threads() if 'latency'. Attempting
>> -to call stop_threads() without first calling start_threads() will
>> -cause a segfault since pids will be uninitialized.
>> -
>> -Link: http://lkml.kernel.org/r/1333653586-3379-3-git-send-email-mark.asselstine@windriver.com
>> -
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
>> ----
>> - trace-record.c |    3 ++-
>> - 1 file changed, 2 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/trace-record.c b/trace-record.c
>> -index fcec28b..1c56fa9 100644
>> ---- a/trace-record.c
>> -+++ b/trace-record.c
>> -@@ -2216,7 +2216,8 @@ void trace_record (int argc, char **argv)
>> -             }
>> -
>> -             disable_tracing();
>> --            stop_threads();
>> -+            if (!latency)
>> -+                    stop_threads();
>> -     }
>> -
>> -     for (cpu = 0; cpu < cpu_count; cpu++) {
>> ---
>> -1.7.10.4
>> -
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
>> deleted file mode 100644
>> index 724e1e8..0000000
>> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
>> +++ /dev/null
>> @@ -1,96 +0,0 @@
>> -From d65740d61e7a4ea6d8d77237954b33dd18e3276c Mon Sep 17 00:00:00 2001
>> -From: Mark Asselstine <mark.asselstine@windriver.com>
>> -Date: Sun, 8 Apr 2012 11:38:45 -0400
>> -Subject: [PATCH] trace-cmd: Setting plugin to 'nop' clears data before it's
>> - recorded
>> -
>> -Upstream-Status: Backport
>> -
>> -commit e09a5db1a929ab668c273b87c4f0a32b81e1c21a
>> -[trace-cmd: Add trace-cmd record --date option]
>> -
>> -moved the call to disable_all() in trace_record() from after record_data()
>> -to before it. Unfortunately disable_all() sets 'nop' in 'current_tracer'
>> -which has the side affect of clearing 'trace', thus all the latency tracer
>> -reports are empty/useless. Here we make disable_all() optionally call
>> -set_plugin() thus, where we need to, we can delay the disabling of the tracer
>> -until we have had a chance to capture 'trace'. We have added this delayed
>> -behavior to trace_record() to fix the latency reports, for all other calls to
>> -disable_all() we continue to have set_plugin() called.
>> -
>> -Link: http://lkml.kernel.org/r/1333899525-6436-1-git-send-email-mark.asselstine@windriver.com
>> -
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
>> ----
>> - trace-record.c |   16 ++++++++++------
>> - 1 file changed, 10 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/trace-record.c b/trace-record.c
>> -index 1c56fa9..95d4a2a 100644
>> ---- a/trace-record.c
>> -+++ b/trace-record.c
>> -@@ -897,11 +897,13 @@ static void disable_tracing(void)
>> -     write_tracing_on(0);
>> - }
>> -
>> --static void disable_all(void)
>> -+static void disable_all(int disable_tracer)
>> - {
>> -     disable_tracing();
>> -
>> --    set_plugin("nop");
>> -+    if (disable_tracer)
>> -+            set_plugin("nop");
>> -+
>> -     reset_events();
>> -
>> -     /* Force close and reset of ftrace pid file */
>> -@@ -1573,7 +1575,7 @@ static void set_funcs(void)
>> -     /* make sure we are filtering functions */
>> -     if (func_stack) {
>> -             if (!functions_filtered()) {
>> --                    disable_all();
>> -+                    disable_all(1);
>> -                     die("Function stack trace set, but functions not filtered");
>> -             }
>> -             save_option(FUNC_STACK_TRACE);
>> -@@ -1938,7 +1940,7 @@ void trace_record (int argc, char **argv)
>> -                             break;
>> -                     }
>> -             }
>> --            disable_all();
>> -+            disable_all(1);
>> -             set_buffer_size();
>> -             exit(0);
>> -     } else
>> -@@ -2147,7 +2149,7 @@ void trace_record (int argc, char **argv)
>> -
>> -     if (!extract) {
>> -             fset = set_ftrace(!disable);
>> --            disable_all();
>> -+            disable_all(1);
>> -
>> -             /* Record records the date first */
>> -             if (record && date)
>> -@@ -2227,7 +2229,7 @@ void trace_record (int argc, char **argv)
>> -     }
>> -
>> -     if (!keep)
>> --            disable_all();
>> -+            disable_all(0);
>> -
>> -     printf("Kernel buffer statistics:\n"
>> -            "  Note: \"entries\" are the entries left in the kernel ring buffer and are not\n"
>> -@@ -2249,6 +2251,8 @@ void trace_record (int argc, char **argv)
>> -     if (keep)
>> -             exit(0);
>> -
>> -+    set_plugin("nop");
>> -+
>> -     /* If tracing_on was enabled before we started, set it on now */
>> -     if (tracing_on_init_val)
>> -             write_tracing_on(tracing_on_init_val);
>> ---
>> -1.7.10.4
>> -
>> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
>> similarity index 41%
>> rename from meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
>> rename to meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
>> index 74eafbb..05ce218 100644
>> --- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
>> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
>> @@ -3,28 +3,17 @@ LICENSE = "GPLv2 & LGPLv2.1"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>>                      file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
>>                      file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
>> -                    file://trace-input.c;beginline=5;endine=8;md5=6ad47cc2b03385d8456771eec5eeea0b"
>> +                    file://trace-input.c;beginline=5;endine=8;md5=dafd8a1cade30b847a8686dd3628cea4"
>> +SRCREV = "79e08f8edb38c4c5098486caaa87ca90ba00f547"
>> +PV = "2.3.2"
>>
>> -SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
>> -PR = "r3"
>> -PV = "1.2+git${SRCPV}"
>> -
>> -inherit pkgconfig pythonnative
>> -
>> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
>> -           file://addldflags.patch \
>> -           file://make-docs-optional.patch \
>> -           file://blktrace-api-compatibility.patch \
>> -           file://trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch \
>> -           file://trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch \
>> -           file://trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch \
>> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=trace-cmd-stable-v2.3 \
>>  "
>> -S = "${WORKDIR}/git"
>>
>> -EXTRA_OEMAKE = "'prefix=${prefix}'"
>> -
>> -FILES_${PN}-dbg += "${datadir}/trace-cmd/plugins/.debug/"
>> +S = "${WORKDIR}/git"
>>
>>  do_install() {
>> -     oe_runmake prefix="${prefix}" DESTDIR="${D}" install
>> +    ${MAKE} NO_PYTHON=1 prefix=${prefix} plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
>>  }
>> +
>> +FILES_${PN}-dbg += "${libdir}/trace-cmd/plugins/.debug/"

