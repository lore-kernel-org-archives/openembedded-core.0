Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6DE6A9BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 14:33:24 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jun 2013 07:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="253504508"
Received: from unknown (HELO [10.255.12.247]) ([10.255.12.247])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jun 2013 07:33:25 -0700
Message-ID: <51B73535.8000504@linux.intel.com>
Date: Tue, 11 Jun 2013 07:33:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1370949528-4946-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1370949528-4946-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: drop Makefile.in hunks from patch
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
X-List-Received-Date: Tue, 11 Jun 2013 14:33:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2013 04:18 AM, Ross Burton wrote:
> Patching a generated file is prone to conflicts, and we'll be replacing this
> file anyway when configuring, so drop the Makefile.in hunks.
>
Is there any replacement for  this patch, did you check that glib-2.0 
will still build correctly for x32?

Sau!

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |   34 --------------------
>   1 file changed, 34 deletions(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
> index 2920e2f..0c243cd 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
> @@ -23,23 +23,6 @@ Index: glib-2.30.0/glib/Makefile.am
>    BUILT_SOURCES += glib_probes.h glib_probes.o
>    CLEANFILES += glib_probes.h glib_probes.h.tmp
>    libglib_2_0_la_LIBADD += glib_probes.o
> -Index: glib-2.30.0/glib/Makefile.in
> -===================================================================
> ---- glib-2.30.0.orig/glib/Makefile.in
> -+++ glib-2.30.0/glib/Makefile.in
> -@@ -1691,10 +1691,10 @@ uninstall-local: uninstall-ms-lib uninst
> - @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
> -
> - @ENABLE_DTRACE_TRUE@glib_probes.h: glib_probes.d Makefile
> --@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
> -+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN)  CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
> - @ENABLE_DTRACE_TRUE@	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
> - @ENABLE_DTRACE_TRUE@glib_probes.o: glib_probes.d Makefile
> --@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
> -+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN)  CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
> -
> - gspawn-win32-helper-console.c:
> - 	echo '#define HELPER_CONSOLE' >$@
>   Index: glib-2.30.0/gobject/Makefile.am
>   ===================================================================
>   --- glib-2.30.0.orig/gobject/Makefile.am
> @@ -57,20 +40,3 @@ Index: glib-2.30.0/gobject/Makefile.am
>    BUILT_SOURCES += gobject_probes.h gobject_probes.o
>    CLEANFILES += gobject_probes.h
>    libgobject_2_0_la_LIBADD += gobject_probes.o
> -Index: glib-2.30.0/gobject/Makefile.in
> -===================================================================
> ---- glib-2.30.0.orig/gobject/Makefile.in
> -+++ glib-2.30.0/gobject/Makefile.in
> -@@ -1581,10 +1581,10 @@ uninstall-ms-lib:
> - @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
> -
> - @ENABLE_DTRACE_TRUE@gobject_probes.h: gobject_probes.d Makefile
> --@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
> -+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
> - @ENABLE_DTRACE_TRUE@	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
> - @ENABLE_DTRACE_TRUE@gobject_probes.o: gobject_probes.d Makefile
> --@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
> -+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
> -
> - # This is read by gobject-introspection/misc/ and gtk-doc
> - gobject-public-headers.txt: Makefile
>

