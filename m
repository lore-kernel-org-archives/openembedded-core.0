Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T27t2-0003pD-Lr
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:45:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Aug 2012 14:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,781,1336374000"; d="scan'208";a="203034729"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2012 14:33:37 -0700
Message-ID: <502D6731.8090607@linux.intel.com>
Date: Thu, 16 Aug 2012 14:33:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344524789-17424-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1344524789-17424-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] pimlico: Remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 21:45:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2012 08:06 AM, Ross Burton wrote:
> Remove the Pimlico applications (Contacts, Dates, Tasks) and associated
> libraries, features, documentation and tasks.  oe-core isn't a reference PIM
> stack, so we don't need this.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   documentation/dev-manual/dev-manual-intro.xml      |    4 -
>   documentation/poky-ref-manual/ref-features.xml     |    2 -
>   documentation/poky-ref-manual/resources.xml        |    3 -
>   meta/classes/core-image.bbclass                    |    4 +-
>   .../avoid_automake_errors.patch                    |   83 --------
>   .../eds/evolution-data-server/depbuildfix.patch    |   78 --------
>   .../fix_for_automake-1.12.x.patch                  |   28 ---
>   .../eds/evolution-data-server/iconv-detect.h       |    5 -
>   .../evolution-data-server/new-contact-fix.patch    |   23 ---
>   .../eds/evolution-data-server/nossl.patch          |   70 -------
>   .../eds/evolution-data-server/oh-contact.patch     |  203 --------------------
>   .../eds/evolution-data-server/old-gdk-api.patch    |   19 --
>   .../optional_imapx_provider.patch                  |   64 ------
>   meta/recipes-sato/eds/evolution-data-server_git.bb |  111 -----------
>   meta/recipes-sato/libical/files/pthread-fix.patch  |   52 -----
>   meta/recipes-sato/libical/libical_0.48.bb          |   17 --
>   meta/recipes-sato/pimlico/contacts.inc             |   34 ----
>   .../contacts-conditionally-install-schema.patch    |   37 ----
>   .../contacts/contacts-owl-window-menu.patch        |   54 ------
>   meta/recipes-sato/pimlico/contacts/make-382.patch  |   16 --
>   .../pimlico/contacts/stock_contact.png             |  Bin 2311 -> 0 bytes
>   .../recipes-sato/pimlico/contacts/stock_person.png |  Bin 2280 -> 0 bytes
>   meta/recipes-sato/pimlico/contacts_0.9.bb          |   18 --
>   meta/recipes-sato/pimlico/contacts_git.bb          |   19 --
>   meta/recipes-sato/pimlico/dates.inc                |   20 --
>   .../pimlico/dates/dates-owl-window-menu.patch      |   67 -------
>   .../dates/dso_linking_change_build_fix.patch       |   46 -----
>   meta/recipes-sato/pimlico/dates/make-382.patch     |   18 --
>   .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |   37 ----
>   meta/recipes-sato/pimlico/dates_0.4.8.bb           |    5 -
>   meta/recipes-sato/pimlico/dates_git.bb             |   18 --
>   meta/recipes-sato/pimlico/tasks.inc                |   16 --
>   meta/recipes-sato/pimlico/tasks/tasks-owl.diff     |   67 -------
>   meta/recipes-sato/pimlico/tasks_0.19.bb            |   15 --
>   meta/recipes-sato/pimlico/tasks_git.bb             |    9 -
>   .../tasks/task-core-apps-x11-pimlico.bb            |   34 ----
>   meta/recipes-sato/tasks/task-core-x11-sato.bb      |    7 +-
>   37 files changed, 7 insertions(+), 1296 deletions(-)
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/depbuildfix.patch
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/iconv-detect.h
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/new-contact-fix.patch
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/nossl.patch
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/oh-contact.patch
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/old-gdk-api.patch
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server/optional_imapx_provider.patch
>   delete mode 100644 meta/recipes-sato/eds/evolution-data-server_git.bb
>   delete mode 100644 meta/recipes-sato/libical/files/pthread-fix.patch
>   delete mode 100644 meta/recipes-sato/libical/libical_0.48.bb
>   delete mode 100644 meta/recipes-sato/pimlico/contacts.inc
>   delete mode 100644 meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch
>   delete mode 100644 meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
>   delete mode 100644 meta/recipes-sato/pimlico/contacts/make-382.patch
>   delete mode 100644 meta/recipes-sato/pimlico/contacts/stock_contact.png
>   delete mode 100644 meta/recipes-sato/pimlico/contacts/stock_person.png
>   delete mode 100644 meta/recipes-sato/pimlico/contacts_0.9.bb
>   delete mode 100644 meta/recipes-sato/pimlico/contacts_git.bb
>   delete mode 100644 meta/recipes-sato/pimlico/dates.inc
>   delete mode 100644 meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
>   delete mode 100644 meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
>   delete mode 100644 meta/recipes-sato/pimlico/dates/make-382.patch
>   delete mode 100644 meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
>   delete mode 100644 meta/recipes-sato/pimlico/dates_0.4.8.bb
>   delete mode 100644 meta/recipes-sato/pimlico/dates_git.bb
>   delete mode 100644 meta/recipes-sato/pimlico/tasks.inc
>   delete mode 100644 meta/recipes-sato/pimlico/tasks/tasks-owl.diff
>   delete mode 100644 meta/recipes-sato/pimlico/tasks_0.19.bb
>   delete mode 100644 meta/recipes-sato/pimlico/tasks_git.bb
>   delete mode 100644 meta/recipes-sato/tasks/task-core-apps-x11-pimlico.bb
>

Merged the Updated bits into OE-Core

Thanks
	Sau!

> diff --git a/documentation/dev-manual/dev-manual-intro.xml b/documentation/dev-manual/dev-manual-intro.xml
> index d499d56..3507ec7 100644
> --- a/documentation/dev-manual/dev-manual-intro.xml
> +++ b/documentation/dev-manual/dev-manual-intro.xml
> @@ -179,10 +179,6 @@
>                       BitBake User Manual</ulink>:</emphasis> A comprehensive guide to the BitBake tool.
>                       </para></listitem>
>                   <listitem><para><emphasis>
> -                    <ulink url='http://pimlico-project.org/'>Pimlico</ulink>:</emphasis>
> -                    A suite of lightweight Personal Information Management (PIM) applications designed
> -                    primarily for handheld and mobile devices.</para></listitem>
> -                <listitem><para><emphasis>
>                       <ulink url='http://wiki.qemu.org/Index.html'>QEMU</ulink>:
>                       </emphasis> An open-source machine emulator and virtualizer.</para></listitem>
>               </itemizedlist>
> diff --git a/documentation/poky-ref-manual/ref-features.xml b/documentation/poky-ref-manual/ref-features.xml
> index bdf29a2..51bd73a 100644
> --- a/documentation/poky-ref-manual/ref-features.xml
> +++ b/documentation/poky-ref-manual/ref-features.xml
> @@ -136,8 +136,6 @@
>                   <listitem><para><emphasis>apps-x11-core:</emphasis> Core X11 applications such as an
>                       X Terminal, file manager, and file editor</para></listitem>
>                   <listitem><para><emphasis>apps-x11-games:</emphasis> A set of X11 games</para></listitem>
> -                <listitem><para><emphasis>apps-x11-pimlico:</emphasis> OpenedHand Pimlico application suite
> -                    </para></listitem>
>                   <listitem><para><emphasis>tools-sdk:</emphasis> A full SDK that runs on the device
>                       </para></listitem>
>                   <listitem><para><emphasis>tools-debug:</emphasis> Debugging tools such as
> diff --git a/documentation/poky-ref-manual/resources.xml b/documentation/poky-ref-manual/resources.xml
> index 5c4549e..b314d9c 100644
> --- a/documentation/poky-ref-manual/resources.xml
> +++ b/documentation/poky-ref-manual/resources.xml
> @@ -86,9 +86,6 @@
>               <listitem><para><emphasis><ulink url='&BITBAKE_DOCS_URL;'>
>                   BitBake User Manual</ulink>:</emphasis> A comprehensive guide to the BitBake tool.
>                   </para></listitem>
> -            <listitem><para><emphasis><ulink url='http://pimlico-project.org/'>Pimlico</ulink>:</emphasis>
> -                A suite of lightweight Personal Information Management (PIM) applications designed
> -                primarily for handheld and mobile devices.</para></listitem>
>               <listitem><para><emphasis><ulink url='http://wiki.qemu.org/Index.html'>QEMU</ulink>:
>                   </emphasis> An open source machine emulator and virtualizer.</para></listitem>
>           </itemizedlist>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index b2815b9..52836d2 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -18,7 +18,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>   # - x11-sato            - OpenedHand Sato environment
>   # - apps-x11-core       - X Terminal, file manager, file editor
>   # - apps-x11-games
> -# - apps-x11-pimlico    - OpenedHand Pimlico apps
>   # - tools-sdk           - SDK
>   # - tools-debug         - debugging tools
>   # - tools-profile       - profiling tools
> @@ -34,7 +33,6 @@ PACKAGE_GROUP_x11-base = "task-core-x11-base"
>   PACKAGE_GROUP_x11-sato = "task-core-x11-sato"
>   PACKAGE_GROUP_apps-x11-core = "task-core-apps-x11-core"
>   PACKAGE_GROUP_apps-x11-games = "task-core-apps-x11-games"
> -PACKAGE_GROUP_apps-x11-pimlico = "task-core-apps-x11-pimlico"
>   PACKAGE_GROUP_tools-debug = "task-core-tools-debug"
>   PACKAGE_GROUP_tools-profile = "task-core-tools-profile"
>   PACKAGE_GROUP_tools-testapps = "task-core-tools-testapps"
> @@ -65,7 +63,7 @@ CORE_IMAGE_EXTRA_INSTALL ?= ""
>   IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>
>   X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
> -ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games apps-x11-pimlico package-management"
> +ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games package-management"
>   SSHSERVER_IMAGE_FEATURES ??= "ssh-server-dropbear"
>   SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ${SSHSERVER_IMAGE_FEATURES}"
>
> diff --git a/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch b/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
> deleted file mode 100644
> index ebf00c3..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Avoid these warning-errors
> -
> -automake: warnings are treated as errors
> -Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
> -Makefile.am:21: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -addressbook/backends/file/Makefile.am: installing './depcomp'
> -addressbook/libebook/Makefile.am:55: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libebook/Makefile.am:65: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libebook/Makefile.am:66: warning: subst -,_,$*: non-POSIX variable name
> -addressbook/libebook/Makefile.am:66: (probably a GNU make extension)
> -addressbook/libebook/Makefile.am:72: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -addressbook/libedata-book/Makefile.am:2: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:3: warning: subst -,_,$*: non-POSIX variable name
> -addressbook/libedata-book/Makefile.am:3: (probably a GNU make extension)
> -glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -addressbook/libedata-book/Makefile.am:86: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:101: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -calendar/backends/weather/Makefile.am:44: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libecal/Makefile.am:53: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libecal/Makefile.am:61: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libecal/Makefile.am:62: warning: subst -,_,$*: non-POSIX variable name
> -calendar/libecal/Makefile.am:62: (probably a GNU make extension) calendar/libecal/Makefile.am:68: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -calendar/libedata-cal/Makefile.am:5: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:6: warning: subst -,_,$*: non-POSIX variable name
> -calendar/libedata-cal/Makefile.am:6: (probably a GNU make extension)
> -glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -calendar/libedata-cal/Makefile.am:71: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:86: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -camel/Makefile.am:17: warning: '%'-style pattern rules are a GNU make extension
> -libebackend/Makefile.am:35: warning: '%'-style pattern rules are a GNU make extension
> -libebackend/Makefile.am:41: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -libedataserver/Makefile.am:91: warning: '%'-style pattern rules are a GNU make extension
> -libedataserver/Makefile.am:97: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -libedataserverui/Makefile.am:108: warning: '%'-style pattern rules are a GNU make extension
> -libedataserverui/Makefile.am:118: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -servers/google/libgdata-google/Makefile.am:27: warning: '%'-style pattern rules are a GNU make extension
> -servers/google/libgdata-google/Makefile.am:33: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -servers/google/libgdata/Makefile.am:31: warning: '%'-style pattern rules are a GNU make extension
> -servers/google/libgdata/Makefile.am:37: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -servers/groupwise/Makefile.am:85: warning: '%'-style pattern rules are a GNU make extension
> -servers/groupwise/Makefile.am:91: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -autoreconf: automake failed with exit status: 1
> -
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -2012/07/09
> -
> -Index: git/configure.ac
> -===================================================================
> ---- git.orig/configure.ac
> -+++ git/configure.ac
> -@@ -21,7 +21,7 @@ m4_define([api_version], [1.2])
> - dnl Autoconf / Automake Initialization
> - AC_PREREQ(2.58)
> - AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
> --AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall -Werror foreign])
> -+AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall foreign])
> - AC_CONFIG_MACRO_DIR([m4])
> - AC_CONFIG_SRCDIR(README)
> - AC_CONFIG_HEADERS(config.h)
> diff --git a/meta/recipes-sato/eds/evolution-data-server/depbuildfix.patch b/meta/recipes-sato/eds/evolution-data-server/depbuildfix.patch
> deleted file mode 100644
> index 0785a93..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/depbuildfix.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
> -build failures. Also resolve other deprecation issues.
> -
> -RP 2011/10/12
> -
> -Upstream-Status: Pending
> -
> -Index: git/libedataserver/e-data-server-util.c
> -===================================================================
> ---- git.orig/libedataserver/e-data-server-util.c	2011-10-12 01:42:40.622045788 +0100
> -+++ git/libedataserver/e-data-server-util.c	2011-10-12 01:48:16.732045664 +0100
> -@@ -165,7 +165,8 @@
> - static gunichar
> - stripped_char (gunichar ch)
> - {
> --        gunichar *decomp, retval;
> -+        gunichar decomp[4];
> -+        gunichar retval;
> -         GUnicodeType utype;
> -         gsize dlen;
> -
> -@@ -175,7 +176,7 @@
> -         case G_UNICODE_CONTROL:
> -         case G_UNICODE_FORMAT:
> -         case G_UNICODE_UNASSIGNED:
> --        case G_UNICODE_COMBINING_MARK:
> -+        case G_UNICODE_SPACING_MARK:
> -                 /* Ignore those */
> -                 return 0;
> -                break;
> -@@ -183,7 +184,7 @@
> -                 /* Convert to lowercase, fall through */
> -                 ch = g_unichar_tolower (ch);
> -         case G_UNICODE_LOWERCASE_LETTER:
> --                if ((decomp = g_unicode_canonical_decomposition (ch, &dlen))) {
> -+                if ((dlen = g_unichar_fully_decompose (ch, FALSE, decomp, 4))) {
> -                         retval = decomp[0];
> -                         g_free (decomp);
> -                         return retval;
> -Index: git/addressbook/libedata-book/e-data-book-factory.c
> -===================================================================
> ---- git.orig/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:52:25.692045500 +0100
> -+++ git/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:53:31.862045707 +0100
> -@@ -238,7 +238,7 @@
> - 	return g_strdup_printf (
> - 		"/org/gnome/evolution/dataserver/addressbook/%d/%u",
> - 		getpid (),
> --		g_atomic_int_exchange_and_add (&counter, 1));
> -+		g_atomic_int_add (&counter, 1));
> - }
> -
> - static void
> -Index: git/addressbook/libedata-book/e-data-book.c
> -===================================================================
> ---- git.orig/addressbook/libedata-book/e-data-book.c	2011-10-12 01:54:40.752045465 +0100
> -+++ git/addressbook/libedata-book/e-data-book.c	2011-10-12 01:55:16.012045897 +0100
> -@@ -553,7 +553,7 @@
> -
> - 	return g_strdup_printf ("/org/gnome/evolution/dataserver/addressbook/BookView/%d/%d",
> - 				getpid (),
> --				g_atomic_int_exchange_and_add ((int*)&counter, 1));
> -+				g_atomic_int_add ((int*)&counter, 1));
> - }
> -
> - static void
> -Index: git/calendar/libedata-cal/e-data-cal-factory.c
> -===================================================================
> ---- git.orig/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:56.612045081 +0100
> -+++ git/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:58.832045211 +0100
> -@@ -227,7 +227,7 @@
> - 	return g_strdup_printf (
> - 		"/org/gnome/evolution/dataserver/calendar/%d/%u",
> - 		getpid (),
> --		g_atomic_int_exchange_and_add (&counter, 1));
> -+		g_atomic_int_add (&counter, 1));
> - }
> -
> - static void
> diff --git a/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch b/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
> deleted file mode 100644
> index ac77a6d..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Upstream-Status: Pending
> -
> -Fixed these kinds if warning-errors
> -
> -warning: 'libebookbackendfile.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -2012/07/09
> -
> -Index: git/configure.ac
> -===================================================================
> ---- git.orig/configure.ac
> -+++ git/configure.ac
> -@@ -17,6 +17,7 @@ dnl This number is meaningless, but we'r
> - dnl library names for backward compatibility.
> - m4_define([api_version], [1.2])
> -
> -+
> - dnl Autoconf / Automake Initialization
> - AC_PREREQ(2.58)
> - AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
> -@@ -30,6 +31,7 @@ AC_LANG(C)
> -
> - dnl Automake 1.11 - Silent Build Rules
> - m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> -+m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
> -
> - dnl Required Package Versions
> - m4_define([glib_minimum_version], [2.16.1])
> diff --git a/meta/recipes-sato/eds/evolution-data-server/iconv-detect.h b/meta/recipes-sato/eds/evolution-data-server/iconv-detect.h
> deleted file mode 100644
> index 46f476d..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/iconv-detect.h
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -/* This is an auto-generated header, DO NOT EDIT! */
> -
> -#define ICONV_ISO_D_FORMAT "iso-%d-%d"
> -#define ICONV_ISO_S_FORMAT "iso-%d-%s"
> -#define ICONV_10646 "iso-10646"
> diff --git a/meta/recipes-sato/eds/evolution-data-server/new-contact-fix.patch b/meta/recipes-sato/eds/evolution-data-server/new-contact-fix.patch
> deleted file mode 100644
> index 22c293d..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/new-contact-fix.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -When contacts called for the 1st time, adding new contact always failed but
> -worked after restart. The reason is e-addressbook-factory used to handle
> -addressbook leads a segmentation fault. Root cause is that factory would create
> -the data base if not exist, but use it without proper initialization.
> -
> -This patch fix it.
> -
> -Upstream-Status: Submitted
> -
> -Signed-off-by: Edwin Zhai <edwin.zhai@intel.com>
> -Index: git/addressbook/backends/file/e-book-backend-file.c
> -===================================================================
> ---- git.orig/addressbook/backends/file/e-book-backend-file.c	2010-10-20 16:14:31.000000000 +0800
> -+++ git/addressbook/backends/file/e-book-backend-file.c	2010-10-22 14:11:47.000000000 +0800
> -@@ -1217,6 +1217,8 @@
> - 				EContact *contact = NULL;
> - 				EBookBackendSyncStatus status;
> -
> -+				/* Initialize file_db, or else following do_create cause seg fault */
> -+				bf->priv->file_db = db;
> - 				status = do_create (bf, XIMIAN_VCARD, &contact);
> - 				if (status != GNOME_Evolution_Addressbook_Success)
> - 					g_warning ("Cannot create default contact: %d", status);
> diff --git a/meta/recipes-sato/eds/evolution-data-server/nossl.patch b/meta/recipes-sato/eds/evolution-data-server/nossl.patch
> deleted file mode 100644
> index 67b6d07..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/nossl.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -Upstream-Status: Inappropriate [disable feature]
> -
> -Index: git/camel/Makefile.am
> -===================================================================
> ---- git.orig/camel/Makefile.am	2010-02-05 15:25:09.000000000 +0000
> -+++ git/camel/Makefile.am	2010-02-05 15:25:20.000000000 +0000
> -@@ -80,7 +80,6 @@
> - 	camel-store-summary.c			\
> - 	camel-store.c				\
> - 	camel-tcp-stream-raw.c			\
> --	camel-tcp-stream-ssl.c			\
> - 	camel-tcp-stream.c			\
> - 	camel-transport.c			\
> - 	camel-uid-cache.c			\
> -@@ -133,7 +132,6 @@
> - 	camel-store-summary.h			\
> - 	camel-store.h				\
> - 	camel-tcp-stream-raw.h			\
> --	camel-tcp-stream-ssl.h			\
> - 	camel-tcp-stream.h			\
> - 	camel-transport.h			\
> - 	camel-uid-cache.h			\
> -Index: git/camel/camel.h
> -===================================================================
> ---- git.orig/camel/camel.h	2010-02-05 15:26:30.000000000 +0000
> -+++ git/camel/camel.h	2010-02-05 15:26:52.000000000 +0000
> -@@ -122,7 +122,6 @@
> - #include <camel/camel-string-utils.h>
> - #include <camel/camel-tcp-stream.h>
> - #include <camel/camel-tcp-stream-raw.h>
> --#include <camel/camel-tcp-stream-ssl.h>
> - #include <camel/camel-text-index.h>
> - #include <camel/camel-transport.h>
> - #include <camel/camel-trie.h>
> -Index: git/camel/providers/imap/camel-imap-store.c
> -===================================================================
> ---- git.orig/camel/providers/imap/camel-imap-store.c	2010-02-05 15:28:19.000000000 +0000
> -+++ git/camel/providers/imap/camel-imap-store.c	2010-02-05 15:28:38.000000000 +0000
> -@@ -51,7 +51,6 @@
> - #include "camel/camel-stream.h"
> - #include "camel/camel-string-utils.h"
> - #include "camel/camel-tcp-stream-raw.h"
> --#include "camel/camel-tcp-stream-ssl.h"
> - #include "camel/camel-url.h"
> - #include "camel/camel-utf8.h"
> -
> -Index: git/configure.ac
> -===================================================================
> ---- git.orig/configure.ac	2010-02-05 15:31:59.000000000 +0000
> -+++ git/configure.ac	2010-02-05 15:33:00.000000000 +0000
> -@@ -1272,7 +1272,8 @@
> - dnl We have fixed all our instances to use <libical/ical.h>. Until the .pc from
> - dnl libical is fixed, we have to work-around the buggy CFlags.
> - dnl *****
> --	LIBICAL_EXTRA_CFLAGS=" -I`$PKG_CONFIG --variable=includedir libical` "
> -+	m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
> -+	LIBICAL_EXTRA_CFLAGS=" -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=includedir libical` "
> - 	LIBICAL_EXTRA_LIBS=""
> - 	AC_SUBST(LIBICAL_EXTRA_CFLAGS)
> - 	AC_SUBST(LIBICAL_EXTRA_LIBS)
> -Index: git/calendar/libecal/libecal.pc.in
> -===================================================================
> ---- git.orig/calendar/libecal/libecal.pc.in	2010-02-05 15:39:41.000000000 +0000
> -+++ git/calendar/libecal/libecal.pc.in	2010-02-05 15:39:55.000000000 +0000
> -@@ -12,4 +12,4 @@
> - Version: @VERSION@
> - Requires: libical >= @LIBICAL_REQUIRED@ libedataserver-1.2 dbus-glib-1
> - Libs: -L${libdir} -lecal-1.2
> --Cflags: -I${privincludedir} @LIBICAL_EXTRA_CFLAGS@
> -+Cflags: -I${privincludedir}
> diff --git a/meta/recipes-sato/eds/evolution-data-server/oh-contact.patch b/meta/recipes-sato/eds/evolution-data-server/oh-contact.patch
> deleted file mode 100644
> index b746044..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/oh-contact.patch
> +++ /dev/null
> @@ -1,203 +0,0 @@
> -Replace the Novell sample contact with something more appropriate
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: addressbook/libedata-book/ximian-vcard.h
> -===================================================================
> ---- addressbook/libedata-book/ximian-vcard.h.orig	2011-12-19 13:58:29.058859231 +0000
> -+++ addressbook/libedata-book/ximian-vcard.h	2011-12-19 14:41:48.678918549 +0000
> -@@ -1,80 +1,105 @@
> - #define XIMIAN_VCARD \
> - "BEGIN:VCARD\n" \
> --"X-EVOLUTION-FILE-AS:Novell Ximian Group\n" \
> --"ADR;TYPE=WORK:;Suite 500;8 Cambridge Center;Cambridge;MA;02142;USA\n" \
> --"LABEL;TYPE=WORK:8 Cambridge Center, Suite 500\\nCambridge\\, MA\\n02142\\nUSA\n" \
> --"TEL;WORK;VOICE:(617) 613-2000\n" \
> --"TEL;WORK;FAX:(617) 613-2001\n" \
> --"EMAIL;INTERNET:hello@ximian.com\n" \
> --"URL:http://www.ximian.com/\n" \
> --"ORG:Novell;Ximian Group\n" \
> --"PHOTO;ENCODING=b;TYPE=JPEG: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\n" \
> -+"VERSION:3.0\n" \
> -+"FN:Yocto Project\n" \
> -+"URL:http://www.yoctoproject.org/\n" \
> -+"EMAIL:yocto@yoctoproject.org\n" \
> -+"TEL;TYPE=VOICE:+00 000 000 0000\n" \
> -+"ADR;TYPE=HOME:;1720 Beaver Creek;Dam #4;Planet Earth\n" \
> -+"LABEL:1720 Beaver Creek\\nDam #4\\nPlanet Earth\n" \
> -+"PHOTO;ENCODING=b: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\n" \
> - "END:VCARD"
> -Index: addressbook/backends/file/Makefile.am
> -===================================================================
> ---- addressbook/backends/file/Makefile.am.orig	2011-12-19 13:58:28.954859229 +0000
> -+++ addressbook/backends/file/Makefile.am	2011-12-19 13:58:31.442859286 +0000
> -@@ -2,6 +2,7 @@
> -
> - libebookbackendfile_la_CPPFLAGS = \
> - 	$(AM_CPPFLAGS)					\
> -+	-DCREATE_DEFAULT_VCARD \
> - 	-DG_LOG_DOMAIN=\"libebookbackend\"		\
> - 	-I$(top_srcdir)					\
> - 	-I$(top_builddir)				\
> diff --git a/meta/recipes-sato/eds/evolution-data-server/old-gdk-api.patch b/meta/recipes-sato/eds/evolution-data-server/old-gdk-api.patch
> deleted file mode 100644
> index 7ef2956..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/old-gdk-api.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Do not disable old API after upgrading gtk+.
> -This avoid build error due to defination missing.
> -
> -Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: git/configure.ac
> -===================================================================
> ---- git.orig/configure.ac	2010-12-16 10:25:24.000000000 +0800
> -+++ git/configure.ac	2010-12-16 10:25:58.000000000 +0800
> -@@ -147,7 +147,6 @@
> - AS_COMPILER_FLAGS(WARNING_FLAGS,
> - 	"-DG_DISABLE_DEPRECATED
> - 	-DPANGO_DISABLE_DEPRECATED
> --	-DGDK_DISABLE_DEPRECATED
> - 	-DGDK_PIXBUF_DISABLE_DEPRECATED
> - 	-DG_DISABLE_SINGLE_INCLUDES
> - 	-DGTK_DISABLE_SINGLE_INCLUDES
> diff --git a/meta/recipes-sato/eds/evolution-data-server/optional_imapx_provider.patch b/meta/recipes-sato/eds/evolution-data-server/optional_imapx_provider.patch
> deleted file mode 100644
> index d9b0940..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server/optional_imapx_provider.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -Upstream-Status: Inappropriate [disable feature]
> -
> -Index: git/camel/providers/Makefile.am
> -===================================================================
> ---- git.orig/camel/providers/Makefile.am	2010-07-06 18:49:34.000000000 +0800
> -+++ git/camel/providers/Makefile.am	2010-07-08 17:23:56.000000000 +0800
> -@@ -6,6 +6,10 @@
> - IMAP4_DIR=imap4
> - endif
> -
> -+if ENABLE_IMAPX
> -+IMAPX_DIR=imapx
> -+endif
> -+
> - if ENABLE_HULA
> - HULA_DIR=hula
> - endif
> -@@ -15,6 +19,6 @@
> - SENDMAIL_DIR=sendmail
> - endif
> -
> --SUBDIRS = pop3 $(SENDMAIL_DIR) smtp imap imapx $(IMAP4_DIR) $(NNTP_DIR) local groupwise $(HULA_DIR)
> -+SUBDIRS = pop3 $(SENDMAIL_DIR) smtp imap $(IMAPX_DIR) $(IMAP4_DIR) $(NNTP_DIR) local groupwise $(HULA_DIR)
> -
> - -include $(top_srcdir)/git.mk
> -Index: git/configure.ac
> -===================================================================
> ---- git.orig/configure.ac	2010-07-08 17:24:36.000000000 +0800
> -+++ git/configure.ac	2010-07-08 17:32:06.000000000 +0800
> -@@ -1002,6 +1002,26 @@
> - AM_CONDITIONAL(ENABLE_IMAP4, [test x$enable_imap4 = xyes])
> -
> - dnl ******************************
> -+dnl IMAPX code support.
> -+dnl ******************************
> -+AC_ARG_ENABLE(imapx,
> -+	AS_HELP_STRING([--enable-imapx=no/yes],
> -+	[Attempt to compile yet another, incomplete, very unsupported IMAPv4r1 implementation]),
> -+	[],[enable_imapx=no])
> -+
> -+if test "x$enable_imapx" = "xyes"; then
> -+	AC_DEFINE(ENABLE_IMAPX,1,[Really don't try this at home])
> -+	AC_PATH_PROG(GPERF, gperf)
> -+	if test -z "$GPERF" ; then
> -+	AC_MSG_ERROR([You need gperf to compile imapx provider])
> -+	fi
> -+	msg_imapx=yes
> -+else
> -+	msg_imapx=no
> -+fi
> -+AM_CONDITIONAL(ENABLE_IMAPX, [test x$enable_imapx = xyes])
> -+
> -+dnl ******************************
> - dnl Hula support
> - dnl ******************************
> - AC_ARG_ENABLE([hula],
> -@@ -1541,3 +1561,7 @@
> - if test "x$msg_hula" = "xyes"; then
> - 	echo "Hula support:	$msg_hula"
> - fi
> -+
> -+if test "x$msg_imapx" = "xyes"; then
> -+	echo "IMAPX support:	$msg_imapx"
> -+fi
> diff --git a/meta/recipes-sato/eds/evolution-data-server_git.bb b/meta/recipes-sato/eds/evolution-data-server_git.bb
> deleted file mode 100644
> index c114c0e..0000000
> --- a/meta/recipes-sato/eds/evolution-data-server_git.bb
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -DESCRIPTION = "Evolution database backend server"
> -HOMEPAGE = "http://www.gnome.org/projects/evolution/"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -
> -LICENSE = "LGPLv2 & LGPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
> -                    file://camel/camel.h;endline=24;md5=b02175c88f821224746b347a89731a2b \
> -                    file://libedataserver/e-data-server-util.h;endline=23;md5=9df8127bd8cfdc5469e938fc710d1f40 \
> -                    file://calendar/libecal/e-cal.h;endline=24;md5=5d496b9b6fd2a4fdbbfc31ef9455c9d0"
> -
> -DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libsoup-2.4 libglade libical gnome-keyring gperf-native"
> -
> -SRCREV = "3ca578d968d09785933ebbb45b66b3bccdbd5832"
> -
> -PV = "2.30+git${SRCPV}"
> -PR = "r2"
> -
> -SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
> -           file://oh-contact.patch;striplevel=0 \
> -           file://nossl.patch \
> -           file://optional_imapx_provider.patch \
> -           file://new-contact-fix.patch \
> -           file://old-gdk-api.patch \
> -           file://depbuildfix.patch \
> -           file://fix_for_automake-1.12.x.patch \
> -           file://avoid_automake_errors.patch \
> -           file://iconv-detect.h"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools gtk-doc pkgconfig
> -
> -# -ldb needs this on some platforms
> -LDFLAGS += "-lpthread"
> -
> -# Parallel make shows many issues with this source code.
> -# Current problems seem to be duplicate execution of the calander/backends
> -# directories by make resulting in truncated/corrupt .la files
> -#PARALLEL_MAKE = ""
> -
> -do_configure_append () {
> -        cp ${WORKDIR}/iconv-detect.h ${S}
> -        sed -i 's/-DG_DISABLE_DEPRECATED//g' ${S}/libedataserver/Makefile
> -}
> -
> -EXTRA_OECONF = "--without-openldap --with-dbus --without-bug-buddy \
> -                --with-soup --with-libdb=${STAGING_DIR_HOST}${prefix} \
> -                --disable-smime --disable-ssl --disable-nntp --without-weather"
> -
> -PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
> -             libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
> -             libedataserver libedataserver-dev \
> -             libedataserverui libedataserverui-dev"
> -
> -FILES_${PN} =+ "${datadir}/evolution-data-server-*/ui/"
> -FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
> -FILES_${PN}-dbg =+ "${libdir}/evolution-data-server-*/camel-providers/.debug \
> -                    ${libdir}/evolution-data-server*/extensions/.debug/"
> -RRECOMMENDS_${PN}-dev += "libecal-dev libebook-dev"
> -
> -FILES_libcamel = "${libexecdir}/camel-* ${libdir}/libcamel-*.so.* \
> -                  ${libdir}/libcamel-provider-*.so.* \
> -                  ${libdir}/evolution-data-server-*/camel-providers/*.so \
> -                  ${libdir}/evolution-data-server-*/camel-providers/*.urls"
> -FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
> -                      ${libdir}/pkgconfig/camel*pc \
> -                    ${libdir}/evolution-data-server-*/camel-providers/*.la \
> -                      ${includedir}/evolution-data-server*/camel"
> -
> -FILES_libebook = "${libdir}/libebook-*.so.*"
> -FILES_libebook-dev = "${libdir}/libebook-1.2.so \
> -                      ${libdir}/pkgconfig/libebook-*.pc \
> -                      ${includedir}/evolution-data-server*/libebook/*.h"
> -RRECOMMENDS_libebook = "libedata-book"
> -
> -FILES_libecal = "${libdir}/libecal-*.so.* \
> -                 ${datadir}/evolution-data-server-1.4/zoneinfo"
> -FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
> -                     ${includedir}/evolution-data-server*/libecal/*.h \
> -                     ${includedir}/evolution-data-server*/libical/*.h"
> -RRECOMMENDS_libecal = "libedata-cal tzdata"
> -
> -FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
> -                       ${datadir}/dbus-1/services/*.AddressBook.service \
> -                       ${libdir}/libedata-book-*.so.* \
> -                       ${libdir}/evolution-data-server-*/extensions/libebook*.so \
> -                       ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
> -FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
> -                           ${libdir}/pkgconfig/libedata-book-*.pc \
> -                           ${libdir}/evolution-data-server-*/extensions/libebook*.la \
> -                           ${includedir}/evolution-data-server-*/libedata-book"
> -
> -FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
> -                      ${datadir}/dbus-1/services/*.Calendar.service \
> -                      ${libdir}/libedata-cal-*.so.* \
> -                      ${libdir}/evolution-data-server-*/extensions/libecal*.so"
> -FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
> -                          ${libdir}/pkgconfig/libedata-cal-*.pc \
> -                          ${includedir}/evolution-data-server-*/libedata-cal \
> -                          ${libdir}/evolution-data-server-*/extensions/libecal*.la"
> -
> -FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
> -FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
> -                            ${libdir}/pkgconfig/libedataserver-*.pc \
> -                            ${includedir}/evolution-data-server-*/libedataserver/*.h"
> -
> -FILES_libedataserverui = "${libdir}/libedataserverui-*.so.* ${datadir}/evolution-data-server-1.4/glade/*.glade"
> -FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
> -                              ${libdir}/pkgconfig/libedataserverui-*.pc \
> -                              ${includedir}/evolution-data-server-*/libedataserverui/*.h"
> -
> diff --git a/meta/recipes-sato/libical/files/pthread-fix.patch b/meta/recipes-sato/libical/files/pthread-fix.patch
> deleted file mode 100644
> index aa7767f..0000000
> --- a/meta/recipes-sato/libical/files/pthread-fix.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -New added pthread feathre leads some deadlock with some unlock code missing.
> -This patch fix it.
> -
> -Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> -
> -Upstream-Status: Pending
> -
> -Index: libical-0.47/src/libical/icaltimezone.c
> -===================================================================
> ---- libical-0.47.orig/src/libical/icaltimezone.c	2011-12-16 13:42:25.000000000 +0800
> -+++ libical-0.47/src/libical/icaltimezone.c	2011-12-16 14:16:25.000000000 +0800
> -@@ -1773,7 +1773,7 @@
> -     filename = (char*) malloc (filename_len);
> -     if (!filename) {
> - 	icalerror_set_errno(ICAL_NEWFAILED_ERROR);
> --	return;
> -+	goto out;
> -     }
> -
> -     snprintf (filename, filename_len, "%s/%s.ics", get_zone_directory(),
> -@@ -1783,7 +1783,7 @@
> -     free (filename);
> -     if (!fp) {
> - 	icalerror_set_errno(ICAL_FILE_ERROR);
> --	return;
> -+	goto out;
> -     }
> -
> - 	
> -@@ -1807,7 +1807,7 @@
> -
> -     if (!subcomp) {
> - 	icalerror_set_errno(ICAL_PARSE_ERROR);
> --	return;
> -+	goto out;
> -     }
> -
> -     icaltimezone_get_vtimezone_properties (zone, subcomp);
> -@@ -1817,10 +1817,12 @@
> -     icalcomponent_free(comp);
> -     }
> - #endif
> --#ifdef HAVE_PTHREAD
> -+
> -  out:
> -+#ifdef HAVE_PTHREAD
> -     pthread_mutex_unlock(&builtin_mutex);
> - #endif
> -+    return;
> - }
> -
> -
> diff --git a/meta/recipes-sato/libical/libical_0.48.bb b/meta/recipes-sato/libical/libical_0.48.bb
> deleted file mode 100644
> index 80f629c..0000000
> --- a/meta/recipes-sato/libical/libical_0.48.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
> -HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
> -BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
> -LICENSE = "LGPLv2.1 | MPL-1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
> -                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
> -SECTION = "libs"
> -
> -PR = "r0"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
> -           file://pthread-fix.patch"
> -
> -SRC_URI[md5sum] = "e549f434d5fbf9cd156c60ed4943618f"
> -SRC_URI[sha256sum] = "2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0"
> -
> -inherit autotools
> diff --git a/meta/recipes-sato/pimlico/contacts.inc b/meta/recipes-sato/pimlico/contacts.inc
> deleted file mode 100644
> index 9798985..0000000
> --- a/meta/recipes-sato/pimlico/contacts.inc
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -DESCRIPTION = "Address-book application."
> -HOMEPAGE = "http://pimlico-project.org/contacts.html"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -
> -LICENSE = "GPLv2 & GPLv2+ & GPLv3+ "
> -SECTION = "x11"
> -DEPENDS = "glib-2.0 gtk+ evolution-data-server"
> -DEPENDS_append_poky = " libowl"
> -RDEPENDS_${PN} = "libedata-book"
> -
> -inherit autotools pkgconfig
> -
> -OWL = "--disable-owl"
> -OWL_poky = "--enable-owl"
> -
> -EXTRA_OECONF += "--disable-gnome-vfs ${OWL}"
> -EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
> -
> -do_install_append () {
> -	install -d ${D}/${datadir}/pixmaps
> -	install -m 0644 ${WORKDIR}/stock_contact.png ${D}/${datadir}/pixmaps
> -	install -m 0644 ${WORKDIR}/stock_person.png ${D}/${datadir}/pixmaps
> -}
> -
> -FILES_${PN} += "${datadir}/pixmaps/stock_contact.png \
> -		${datadir}/pixmaps/stock_person.png \
> -		${datadir}/icons/hicolor"
> -
> -SRC_URI = "file://stock_contact.png \
> -           file://stock_person.png \
> -           file://contacts-conditionally-install-schema.patch \
> -          "
> -
> -SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
> diff --git a/meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch b/meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch
> deleted file mode 100644
> index 2ab7882..0000000
> --- a/meta/recipes-sato/pimlico/contacts/contacts-conditionally-install-schema.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Install schema should respect to GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
> -
> -If GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL is set, the schema should not
> -be installed.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Upstream-Status: Pending
> ----
> - data/Makefile.am |    7 ++++---
> - 1 files changed, 4 insertions(+), 3 deletions(-)
> -
> -diff --git a/data/Makefile.am b/data/Makefile.am
> -index f790823..b6fd643 100644
> ---- a/data/Makefile.am
> -+++ b/data/Makefile.am
> -@@ -14,13 +14,14 @@ dist_man1_MANS = contacts.1
> -
> - if HAVE_GCONF
> - install-data-local:
> --	GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) \
> -+	if [ "$(GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL)" != "1" ]; then \
> -+		GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) \
> - 		$(GCONFTOOL) --makefile-install-rule $(schema_DATA) || \
> - 		(echo ;\
> - 		echo "*****************************************************"; \
> - 		echo "Installation of schemas failed, install them manually"; \
> --		echo "*****************************************************";)
> --		@true
> -+		echo "*****************************************************";); \
> -+	fi
> - endif
> -
> - CLEANFILES = $(desktop_DATA)
> ---
> -1.7.7.6
> -
> diff --git a/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch b/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
> deleted file mode 100644
> index 5323876..0000000
> --- a/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -Upstream-Status: Inappropriate [enable feature]
> -
> -Index: contacts-0.9/src/contacts-gtk.c
> -===================================================================
> ---- contacts-0.9.orig/src/contacts-gtk.c	2008-06-06 12:56:08.000000000 +0100
> -+++ contacts-0.9/src/contacts-gtk.c	2008-06-16 08:14:28.000000000 +0100
> -@@ -220,8 +220,8 @@
> - 	vbox7 = gtk_vbox_new (FALSE, 0);
> - 	gtk_container_add (GTK_CONTAINER (main_window), vbox7);
> -
> --	main_menubar = gtk_menu_bar_new ();
> --	gtk_box_pack_start (GTK_BOX (vbox7), main_menubar, FALSE, FALSE, 0);
> -+	main_menubar = gtk_menu_new ();
> -+	gtk_widget_show (main_menubar);
> -
> - 	contacts_menu = gtk_menu_item_new_with_mnemonic (_("C_ontacts"));
> - 	gtk_container_add (GTK_CONTAINER (main_menubar), contacts_menu);
> -Index: contacts-0.9/src/Makefile.am
> -===================================================================
> ---- contacts-0.9.orig/src/Makefile.am	2008-06-03 09:16:56.000000000 +0100
> -+++ contacts-0.9/src/Makefile.am	2008-06-16 08:15:34.000000000 +0100
> -@@ -40,7 +40,7 @@
> -                     contacts-@FRONTEND@.c \
> -                     contacts-@FRONTEND@.h
> -
> --contacts_LDADD   = $(CONTACTS_LIBS) $(DBUS_LIBS)
> -+contacts_LDADD   = $(CONTACTS_LIBS) $(DBUS_LIBS) -lowl
> -
> - contacts_LDFLAGS = @CONTACTS_LIBS@ @DBUS_LIBS@
> -
> -Index: contacts-0.9/src/contacts-main.c
> -===================================================================
> ---- contacts-0.9.orig/src/contacts-main.c	2008-06-06 10:26:52.000000000 +0100
> -+++ contacts-0.9/src/contacts-main.c	2008-06-16 08:14:28.000000000 +0100
> -@@ -27,6 +27,8 @@
> - #include <libgnomevfs/gnome-vfs.h>
> - #endif
> -
> -+#include <libowl/owlwindowmenu.h>
> -+
> - #include "bacon-message-connection.h"
> - #include "contacts-defs.h"
> - #include "contacts-utils.h"
> -@@ -266,6 +268,10 @@
> - 		gtk_widget_show_all (widget);
> - 	}
> -
> -+	gtk_widget_show_all (data->ui->main_menubar);
> -+	owl_set_window_menu (GTK_WINDOW (data->ui->main_window),
> -+			     GTK_MENU (data->ui->main_menubar));
> -+
> - 	gtk_main ();
> -
> - 	/* if we have modified the current contact, but not saved it, do so now */
> diff --git a/meta/recipes-sato/pimlico/contacts/make-382.patch b/meta/recipes-sato/pimlico/contacts/make-382.patch
> deleted file mode 100644
> index a7cfee3..0000000
> --- a/meta/recipes-sato/pimlico/contacts/make-382.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Fix for stricter parser in make 3.82. This fix has been pushed to upstream git.
> -
> -JL - 15/12/10
> -
> -Upstream-Status: Accepted
> -
> -Index: git/Makefile.am
> -===================================================================
> ---- git.orig/Makefile.am
> -+++ git/Makefile.am
> -@@ -11,4 +11,4 @@ DISTCLEANFILES = $(INTLTOOL_BUILT)
> - MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp $(INTLTOOL_BUILT:=.in) install-sh ltmain.sh mkinstalldirs Makefile.in missing
> -
> - snapshot:
> --        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
> -+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
> diff --git a/meta/recipes-sato/pimlico/contacts/stock_contact.png b/meta/recipes-sato/pimlico/contacts/stock_contact.png
> deleted file mode 100644
> index 123b4485acaaaf665eb9dbff5e9f126a02e6e6d4..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 2311
> 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
>
> diff --git a/meta/recipes-sato/pimlico/contacts/stock_person.png b/meta/recipes-sato/pimlico/contacts/stock_person.png
> deleted file mode 100644
> index 2b1328b4e2cc6a131a7ff9df4722c6fa49b0a6f1..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 2280
> 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
> CvpRJE
>
> diff --git a/meta/recipes-sato/pimlico/contacts_0.9.bb b/meta/recipes-sato/pimlico/contacts_0.9.bb
> deleted file mode 100644
> index 251bbe1..0000000
> --- a/meta/recipes-sato/pimlico/contacts_0.9.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require contacts.inc
> -
> -PR = "r7"
> -
> -SRC_URI =+ "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "aab5affbf93d6fa7b978b323a8d44de0"
> -SRC_URI[sha256sum] = "9cacec98f8123993033aaa255f3f4c04c86a1be65e487dd21f0aaa54384a6f6d"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://src/contacts-main.h;endline=18;md5=0371af46fbc72e33575e0072dca5fb19 \
> -                    file://src/contacts-dbus.c;endline=18;md5=e4da9ac1a0539fafc7df431010904fd5 \
> -                    file://src/contacts-gtk.c;endline=21;md5=1c2e3f55b215635eff4ba76f7696f8ee"
> -
> -do_configure_prepend () {
> -	# It used 8 spaces to instead of a tab, but it doesn't work for us
> -	sed -i 's/^        $(MAKE) dist distdir=/\t$(MAKE) dist distdir/' Makefile.am
> -}
> diff --git a/meta/recipes-sato/pimlico/contacts_git.bb b/meta/recipes-sato/pimlico/contacts_git.bb
> deleted file mode 100644
> index 45a6a0d..0000000
> --- a/meta/recipes-sato/pimlico/contacts_git.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require contacts.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://src/contacts-main.h;endline=20;md5=9dc3531c914fb6d6d4a8d1aee4519fef \
> -                    file://src/contacts-dbus.c;endline=20;md5=95e02d77f155fbd07a14dba3348b9b03 \
> -                    file://src/contacts-gtk.c;endline=23;md5=e1ee9b9e72045f2d3aa44cf17313b46e"
> -
> -SRCREV = "19853893fdb595de6aa59db0d9dc2f9451ed2933"
> -PV = "0.12+git${SRCPV}"
> -PR = "r4"
> -
> -S = "${WORKDIR}/git"
> -
> -SRC_URI =+ "git://git.gnome.org/${BPN};protocol=git \
> -	    file://make-382.patch"
> -
> -S = "${WORKDIR}/git"
> -
> -
> diff --git a/meta/recipes-sato/pimlico/dates.inc b/meta/recipes-sato/pimlico/dates.inc
> deleted file mode 100644
> index 9b338fd..0000000
> --- a/meta/recipes-sato/pimlico/dates.inc
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "Dates is a calendar application."
> -HOMEPAGE = "http://pimlico-project.org/dates.html"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -
> -LICENSE = "GPLv2 & GPLv2+ & LGPLv2+"
> -
> -SECTION = "x11"
> -DEPENDS = "glib-2.0 gtk+ libglade evolution-data-server"
> -RDEPENDS_${PN} = "libedata-cal"
> -
> -inherit autotools gettext pkgconfig gtk-icon-cache
> -
> -# Poky/Sato specific enhancements
> -OWL = "--disable-owl"
> -OWL_poky = "--enable-owl --disable-dnd"
> -
> -EXTRA_OECONF += "${OWL}"
> -DEPENDS_append_poky = " libowl"
> -SRC_URI_append_poky = " file://dates-owl-window-menu.patch;apply=yes "
> -
> diff --git a/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch b/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
> deleted file mode 100644
> index 714623e..0000000
> --- a/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> ----
> - src/dates_gtk.c      |    5 -----
> - src/dates_main.c     |    5 +++++
> - src/dates_platform.h |    2 +-
> - 3 files changed, 7 insertions(+), 7 deletions(-)
> -
> -Upstream-Status: Inappropriate [enable feature]
> -
> -Index: git/src/dates_gtk.c
> -===================================================================
> ---- git.orig/src/dates_gtk.c	2009-08-18 12:44:56.000000000 +0100
> -+++ git/src/dates_gtk.c	2009-09-03 22:28:50.000000000 +0100
> -@@ -33,10 +33,6 @@
> - #endif
> -
> - #ifndef DATES_PLATFORM_create_main_window
> --/* the default implementation assumes that menu is GtkMenuBar */
> --#ifdef DATES_MENU_WITHOUT_BAR
> --#error Cannot use default create_main_window () if DATES_MENU_WITHOUT_BAR is defined !!!
> --#endif
> - static GtkWidget *
> - create_main_window (DatesData * d, GtkWidget * toolbar,
> - 					GtkWidget * menu, GtkAccelGroup * accel_group)
> -@@ -59,7 +55,6 @@
> - 	gtk_container_add (GTK_CONTAINER (d->main_window), main_vbox);
> -
> - 	gtk_widget_show (menu);
> --	gtk_box_pack_start (GTK_BOX (main_vbox), menu, FALSE, FALSE, 0);
> -
> - 	gtk_box_pack_end (GTK_BOX (main_vbox), toolbar, FALSE, FALSE, 0);
> - 	gtk_container_set_border_width (GTK_CONTAINER (toolbar), 3);
> -Index: git/src/dates_main.c
> -===================================================================
> ---- git.orig/src/dates_main.c	2009-08-18 12:44:56.000000000 +0100
> -+++ git/src/dates_main.c	2009-09-03 22:29:21.000000000 +0100
> -@@ -26,6 +26,8 @@
> - #include <libical/icaltime.h>
> - #include <gconf/gconf-client.h>
> -
> -+#include <gtk/gtkmenuitem.h>
> -+#include <libowl/owlwindowmenu.h>
> - #include "dates_types.h"
> - #include "dates_platform.h"
> - #include "dates_callbacks.h"
> -@@ -582,6 +584,9 @@
> - 		g_free (url_uri);
> - 	}
> -
> -+	owl_set_window_menu (GTK_WINDOW (data.main_window),
> -+			     GTK_MENU (data.main_menu));
> -+
> - 	gtk_main ();
> -
> - 	return 0;
> -Index: git/src/dates_platform.h
> -===================================================================
> ---- git.orig/src/dates_platform.h	2009-08-18 12:44:56.000000000 +0100
> -+++ git/src/dates_platform.h	2009-09-03 22:28:50.000000000 +0100
> -@@ -20,7 +20,7 @@
> -
> - #include "dates_types.h"
> -
> --#ifdef WITH_HILDON
> -+#if 1
> - #define DATES_MENU_WITHOUT_BAR 1
> - #endif
> -
> diff --git a/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch b/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
> deleted file mode 100644
> index eccc782..0000000
> --- a/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -after gcc linking has changed, all the libraries must be explicitely specified
> -This patch avoids these linking errors:
> -
> -
> -| make[2]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/dates-0.4.11+git0+514185dc1f6588085fda41eb59898b93d0487dd4-r2/git/src'^M
> -| /bin/sh ../i586-poky-linux-libtool --tag=CC   --mode=link ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -std=gnu99 -Wall -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -I/disk0/pokybuild/build1/tmp/sysroots/i586-
poky-linux/usr/include/evolution-data-server-2.30 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/dbus-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libxml2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gconf/2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libsoup-2.4 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/dbus-1.0/include   -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libowl -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build
1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12   -DUSE_OWL=1 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o dates dates_gtk.o  dates_main.o dates_callbacks.o gconf-bridge.o -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lecal-1.2 -lical -licalss -licalvcal -ledataserver-1.2 -lxml2 -lsoup-2.4 -lgio-2.0 -lgmodule-2.0 -lgconf-2 -ldbus-glib-1 -ldbus-1 -lpthread -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0   -pthread -lowl -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontcon
fig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   libgtkdatesview.la
> -| i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -std=gnu99 -Wall -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/evol
ution-data-server-2.30 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/dbus-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libxml2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gconf/2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libsoup-2.4 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/dbus-1.0/include -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libowl -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linu
x/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -DUSE_OWL=1 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/dates dates_gtk.o dates_main.o dates_callbacks.o gconf-bridge.o -pthread -pthread  -L/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libecal-1.2.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libicalss.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libicalvcal.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libical.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libedataserver-1.2.so /disk0/pokybuild/build1/tmp/sysroots/i586-p
oky-linux/usr/lib/libsoup-2.4.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libxml2.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgnutls.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libtasn1.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgcrypt.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgpg-error.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgconf-2.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libdbus-glib-1.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libdbus-1.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libowl.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgtk-x11-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk-x11-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libatk-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/lib
gdk_pixbuf-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgio-2.0.so -lresolv /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpangocairo-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpangoft2-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libstdc++.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libcairo.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpixman-1.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpng12.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXrender.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libxcb.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXau.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXdmcp.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libz.so /disk0/po
kybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpango-1.0.so -lm /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libfontconfig.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libfreetype.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libexpat.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgobject-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgmodule-2.0.so -ldl /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgthread-2.0.so -lpthread /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libglib-2.0.so -lrt ./.libs/libgtkdatesview.a -pthread
> -|
> -| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: e: invalid DSO for symbol `pow@@GLIBC_2.0' definition^M
> -| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libm.so: could not read symbols: Bad value^M
> -| collect2: ld returned 1 exit status^M
> -| make[2]: *** [dates] Error 1
> -
> -
> -
> -| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: z: invalid DSO for symbol `pango_layout_get_extents' definition
> -| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpango-1.0.so: could not read symbols: Bad value
> -| collect2: ld returned 1 exit status
> -| make[2]: *** [dates] Error 1
> -
> -
> -Nitin A Kamble <nitin.a.kamble@intel.com>
> -Date: 2011/01/11
> -
> -Update:
> -This is identified as a libtool issue. While creating the libgtkdatesview.la
> -file, libtool should have added these needed libraries in there.
> - A bug has been created for this issue:
> -   http://bugzilla.pokylinux.org/show_bug.cgi?id=664
> -Nitin A Kamble <nitin.a.kamble@intel.com>
> -Date: 2011/01/19
> -
> -Upstream-Status: Pending
> -
> -Index: git/src/Makefile.am
> -===================================================================
> ---- git.orig/src/Makefile.am
> -+++ git/src/Makefile.am
> -@@ -34,6 +34,6 @@ dates_SOURCES = $(platform) 	\
> - 	gconf-bridge.h		\
> - 	gconf-bridge.c
> -
> --dates_LDADD = $(DATES_LIBS) $(OWL_LIBS) libgtkdatesview.la
> -+dates_LDADD = $(DATES_LIBS) $(OWL_LIBS) libgtkdatesview.la -lm -lpango-1.0
> -
> - MAINTAINERCLEANFILES = config.h.in Makefile.in
> diff --git a/meta/recipes-sato/pimlico/dates/make-382.patch b/meta/recipes-sato/pimlico/dates/make-382.patch
> deleted file mode 100644
> index fad3c58..0000000
> --- a/meta/recipes-sato/pimlico/dates/make-382.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Make 3.82 is offended by the use of spaces instead of tabs. This has been fixed
> -in upstream git.
> -
> -JL - 15/12/10
> -
> -Upstream-Status: Accepted
> -
> -Index: git/Makefile.am
> -===================================================================
> ---- git.orig/Makefile.am
> -+++ git/Makefile.am
> -@@ -7,5 +7,5 @@ DISTCLEANFILES = intltool-extract intlto
> - MAINTAINERCLEANFILES = $(DISTCLEANFILES) aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
> -
> - snapshot:
> --        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
> -+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
> -
> diff --git a/meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch b/meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
> deleted file mode 100644
> index 6ade470..0000000
> --- a/meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -uclibc has langinfo.h but it does not define _NL_TIME_FIRST_WEEKDAY
> -therefore we introduce a check in configure for the this define
> -and then we make sure that we use it when it really exists
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -Index: git/configure.ac
> -===================================================================
> ---- git.orig/configure.ac	2011-07-18 10:34:15.000000000 -0700
> -+++ git/configure.ac	2011-07-18 10:54:26.403798188 -0700
> -@@ -98,6 +98,8 @@
> - 		src/libgtkdatesview.pc
> - ])
> -
> -+AC_CHECK_DECLS([_NL_TIME_FIRST_WEEKDAY],[],[],[[#include <langinfo.h>]])
> -+
> - AC_OUTPUT
> -
> - echo " "
> -Index: git/src/dates_view.c
> -===================================================================
> ---- git.orig/src/dates_view.c	2011-07-18 10:34:15.000000000 -0700
> -+++ git/src/dates_view.c	2011-07-18 10:58:46.093798136 -0700
> -@@ -1505,7 +1505,11 @@
> - 	priv->days = 1;
> - 	priv->months = 0;
> - 	priv->months_in_row = 4;
> -+#if HAVE_DECL__NL_TIME_FIRST_WEEKDAY
> - 	priv->week_start = *nl_langinfo (_NL_TIME_FIRST_WEEKDAY) - 1;
> -+#else
> -+	priv->week_start = 0;
> -+#endif
> - 	priv->dragbox = TRUE;
> - 	priv->single_click = TRUE;
> - 	priv->double_click = FALSE;
> diff --git a/meta/recipes-sato/pimlico/dates_0.4.8.bb b/meta/recipes-sato/pimlico/dates_0.4.8.bb
> deleted file mode 100644
> index da3f273..0000000
> --- a/meta/recipes-sato/pimlico/dates_0.4.8.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require dates.inc
> -
> -PR = "r6"
> -
> -SRC_URI = "http://pimlico-project.org/sources/dates/dates-${PV}.tar.gz"
> diff --git a/meta/recipes-sato/pimlico/dates_git.bb b/meta/recipes-sato/pimlico/dates_git.bb
> deleted file mode 100644
> index 9ee0105..0000000
> --- a/meta/recipes-sato/pimlico/dates_git.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require dates.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> -                    file://src/dates_view.h;endline=22;md5=29f934f356eb970309cdeb6693b3123a \
> -                    file://src/dates_hildon.c;endline=19;md5=63938904198b25de429abb65fbdbdb8a \
> -                    file://src/gconf-bridge.c;endline=22;md5=ad7626c6daf4aec590474a243f4912fa"
> -
> -SRCREV = "514185dc1f6588085fda41eb59898b93d0487dd4"
> -PV = "0.4.11+git${SRCPV}"
> -PR = "r8"
> -
> -S = "${WORKDIR}/git"
> -
> -SRC_URI = "git://git.gnome.org/${BPN};protocol=git \
> -	   file://make-382.patch \
> -	   file://dso_linking_change_build_fix.patch \
> -	   file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
> -          "
> diff --git a/meta/recipes-sato/pimlico/tasks.inc b/meta/recipes-sato/pimlico/tasks.inc
> deleted file mode 100644
> index 9cd5259..0000000
> --- a/meta/recipes-sato/pimlico/tasks.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION = "Task list application"
> -HOMEPAGE = "http://pimlico-project.org/tasks.html"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -
> -LICENSE = "GPLv2 & GPLv2+"
> -
> -SECTION = "x11"
> -DEPENDS = "glib-2.0 gtk+ evolution-data-server"
> -DEPENDS_append_poky = " libowl"
> -
> -inherit autotools pkgconfig gtk-icon-cache
> -
> -OWL ?= "--disable-owl"
> -OWL_poky ?= "--enable-owl"
> -
> -EXTRA_OECONF += "${OWL}"
> diff --git a/meta/recipes-sato/pimlico/tasks/tasks-owl.diff b/meta/recipes-sato/pimlico/tasks/tasks-owl.diff
> deleted file mode 100644
> index aab23ff..0000000
> --- a/meta/recipes-sato/pimlico/tasks/tasks-owl.diff
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -This patch enable owl menu, which is hidden in the title bar to save space on
> -small screen. It has not been used for a long time, rebase needed.
> -
> -Upstream-Status: Inappropriate [enable feature]
> -
> -Index: src/gtk/tasks-ui.xml
> -===================================================================
> ---- src/gtk/tasks-ui.xml	(revision 338)
> -+++ src/gtk/tasks-ui.xml	(working copy)
> -@@ -7,17 +7,14 @@
> -       <menuitem action="EditTask"/>
> -       <menuitem action="CompleteTask"/>
> -       <separator/>
> -+      <menuitem action="Undo"/>
> -+      <menuitem action="Redo"/>
> -+      <separator/>
> -       <menuitem action="DeleteTask"/>
> -       <menuitem action="PurgeTasks"/>
> -       <separator/>
> -+      <menuitem action="About"/>
> -       <menuitem action="Quit"/>
> -     </menu>
> --    <menu action="EditMenu">
> --      <menuitem action="Undo"/>
> --      <menuitem action="Redo"/>
> --    </menu>
> --    <menu action="HelpMenu">
> --      <menuitem action="About"/>
> --    </menu>
> -   </menubar>
> - </ui>
> -Index: src/gtk/main.c
> -===================================================================
> ---- src/gtk/main.c	(revision 338)
> -+++ src/gtk/main.c	(working copy)
> -@@ -21,6 +21,7 @@
> - #include <libecal/e-cal.h>
> - #include <glib/gi18n.h>
> - #include <gtk/gtk.h>
> -+#include <libowl/owlwindowmenu.h>
> -
> - #include <libkoto/ical-util.h>
> - #include <libkoto/koto-actions.h>
> -@@ -564,8 +565,8 @@
> -   gtk_window_add_accel_group (GTK_WINDOW (window), gtk_ui_manager_get_accel_group (ui_manager));
> -   gtk_ui_manager_ensure_update (ui_manager);
> -
> --  menu = gtk_ui_manager_get_widget (ui_manager, "/MenuBar");
> --  gtk_box_pack_start (GTK_BOX (top_box), menu, FALSE, FALSE, 0);
> -+  menu = gtk_ui_manager_get_widget (ui_manager, "/MenuBar/TasksMenu");
> -+  owl_set_window_menu_item (GTK_WINDOW (window), GTK_MENU_ITEM (menu));
> -
> -   box = gtk_vbox_new (FALSE, 4);
> -   gtk_container_set_border_width (GTK_CONTAINER (box), 4);
> -Index: src/gtk/Makefile.am
> -===================================================================
> ---- src/gtk/Makefile.am	(revision 338)
> -+++ src/gtk/Makefile.am	(working copy)
> -@@ -4,7 +4,7 @@
> - bin_PROGRAMS = tasks
> - tasks_CPPFLAGS = -I$(top_srcdir)/
> - tasks_CFLAGS = $(WARN_CFLAGS) $(GTK_CFLAGS) $(ECAL_CFLAGS) $(SEXY_CFLAGS)
> --tasks_LDADD = $(top_builddir)/libkoto/libkoto.a $(GTK_LIBS) $(ECAL_LIBS) $(SEXY_LIBS)
> -+tasks_LDADD = $(top_builddir)/libkoto/libkoto.a $(GTK_LIBS) $(ECAL_LIBS) $(SEXY_LIBS)  -lowl
> -
> - tasks_SOURCES = \
> - 	main.c \
> diff --git a/meta/recipes-sato/pimlico/tasks_0.19.bb b/meta/recipes-sato/pimlico/tasks_0.19.bb
> deleted file mode 100644
> index f0d9542..0000000
> --- a/meta/recipes-sato/pimlico/tasks_0.19.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require tasks.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://src/gtk/main.c;endline=19;md5=8659d0b7fd68a2ad6ac30c6539ea5b82 \
> -                    file://src/omoko/openmoko-tasks.c;endline=20;md5=04d56a46863c9f4247694f40257a836a \
> -                    file://src/hildon/hildon-tasks.c;endline=21;md5=488ddf31dc14b2196dec7cc736211b52"
> -
> -SRC_URI = "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "0afd969758561599fd782e1effb39c08"
> -SRC_URI[sha256sum] = "1a7fdc5f95a2193a1a25fdb13f071867fb7e42245ce19ccee4bcccb69e557f2e"
> -
> -OWL_poky = "--with-owl"
> -
> -PR = "r2"
> diff --git a/meta/recipes-sato/pimlico/tasks_git.bb b/meta/recipes-sato/pimlico/tasks_git.bb
> deleted file mode 100644
> index 16c0430..0000000
> --- a/meta/recipes-sato/pimlico/tasks_git.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require tasks.inc
> -
> -SRC_URI = "git://git.gnome.org/${BPN};protocol=git"
> -
> -SRCREV = "ea52d46d691c5fce4473ea4e24a35411381f3a65"
> -PV = "0.13+git${SRCPV}"
> -PR = "r3"
> -
> -S = "${WORKDIR}/git"
> diff --git a/meta/recipes-sato/tasks/task-core-apps-x11-pimlico.bb b/meta/recipes-sato/tasks/task-core-apps-x11-pimlico.bb
> deleted file mode 100644
> index 835625c..0000000
> --- a/meta/recipes-sato/tasks/task-core-apps-x11-pimlico.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -#
> -# Copyright (C) 2007-2008 OpenedHand Ltd.
> -#
> -
> -DESCRIPTION = "X11 Pimlico Appications List"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> -                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r28"
> -
> -PACKAGES = "\
> -    task-core-apps-x11-pimlico \
> -    task-core-apps-x11-pimlico-dbg \
> -    task-core-apps-x11-pimlico-dev \
> -    "
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -ALLOW_EMPTY = "1"
> -
> -WEB ?= ""
> -#WEB = "web-webkit"
> -# WebKit takes too much space to fit on some devices
> -# List here for now...
> -#WEB_c7x0 = ""
> -#WEB_mx31ads = ""
> -
> -RDEPENDS_task-core-apps-x11-pimlico = "\
> -    evolution-data-server \
> -    contacts \
> -    dates \
> -    tasks \
> -    gaku \
> -    ${WEB}"
> diff --git a/meta/recipes-sato/tasks/task-core-x11-sato.bb b/meta/recipes-sato/tasks/task-core-x11-sato.bb
> index ed43075..cf294b3 100644
> --- a/meta/recipes-sato/tasks/task-core-x11-sato.bb
> +++ b/meta/recipes-sato/tasks/task-core-x11-sato.bb
> @@ -6,7 +6,7 @@ DESCRIPTION = "Sato Tasks for Poky"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>                       file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r31"
> +PR = "r32"
>
>   PACKAGES = "\
>       task-core-x11-sato \
> @@ -21,6 +21,9 @@ ALLOW_EMPTY = "1"
>   NETWORK_MANAGER ?= "connman-gnome"
>   NETWORK_MANAGER_libc-uclibc = ""
>
> +WEB ?= ""
> +#WEB = "web-webkit"
> +
>   RDEPENDS_task-core-x11-sato = "\
>       matchbox-desktop \
>       matchbox-session-sato \
> @@ -34,4 +37,6 @@ RDEPENDS_task-core-x11-sato = "\
>       gthumb \
>       x11vnc \
>       libsdl \
> +    gaku \
> +    ${WEB} \
>       ${NETWORK_MANAGER}"
>


