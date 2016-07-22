Return-Path: <amarnath.valluri@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 864A9606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 10:40:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 22 Jul 2016 03:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1027018492"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2016 03:40:00 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.113]) by
	IRSMSX107.ger.corp.intel.com ([169.254.10.204]) with mapi id
	14.03.0248.002; Fri, 22 Jul 2016 11:39:59 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "Valluri, Amarnath" <amarnath.valluri@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [meta-oe][PATCH v2] swupd-client,	swupd-server:
	Patch swupd to treat /home/* as non-state
Thread-Index: AQHR5ATio/81smmkTUOhIph1Lfp0MKAkQkUg
Date: Fri, 22 Jul 2016 10:39:58 +0000
Message-ID: <D3C33C4430ACA6488F343D1125FCCECC38131471@irsmsx110.ger.corp.intel.com>
References: <1469183729-8859-1-git-send-email-amarnath.valluri@intel.com>
	<1469183729-8859-2-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1469183729-8859-2-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] swupd-client, swupd-server: Patch swupd to treat /home/* as non-state
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
X-List-Received-Date: Fri, 22 Jul 2016 10:40:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch, this is not for meta-oe, sorry for noise.

-Amarnath

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Amarnath Valluri
> Sent: Friday, July 22, 2016 1:35 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [meta-oe][PATCH v2] swupd-client, swupd-server: Patch
> swupd to treat /home/* as non-state
> =

> This allows bundles to deploy content specific to user
> =

> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  .../0001-Do-not-consider-home-as-user-state.patch  | 62
> ++++++++++++++++++++++  .../0001-Do-not-consider-home-as-user-
> state.patch  | 62 ++++++++++++++++++++++
>  recipes-core/swupd-client/swupd-client_2.87.bb     |  1 +
>  recipes-core/swupd-client/swupd-client_git.bb      |  1 +
>  .../0001-Don-t-treat-home-as-user-state.patch      | 60
> +++++++++++++++++++++
>  .../0001-Don-t-treate-home-as-user-state.patch     | 61
> +++++++++++++++++++++
>  .../0001-Don-t-treat-home-as-user-state.patch      | 61
> +++++++++++++++++++++
>  .../0001-Don-t-treate-home-as-user-state.patch     | 61
> +++++++++++++++++++++
>  recipes-core/swupd-server/swupd-server_2.53.bb     |  1 +
>  recipes-core/swupd-server/swupd-server_git.bb      |  1 +
>  10 files changed, 371 insertions(+)
>  create mode 100644 recipes-core/swupd-client/swupd-client-2.87/0001-Do-
> not-consider-home-as-user-state.patch
>  create mode 100644 recipes-core/swupd-client/swupd-client/0001-Do-not-
> consider-home-as-user-state.patch
>  create mode 100644 recipes-core/swupd-server/swupd-server-2.53/0001-
> Don-t-treat-home-as-user-state.patch
>  create mode 100644 recipes-core/swupd-server/swupd-server-2.53/0001-
> Don-t-treate-home-as-user-state.patch
>  create mode 100644 recipes-core/swupd-server/swupd-server/0001-Don-t-
> treat-home-as-user-state.patch
>  create mode 100644 recipes-core/swupd-server/swupd-server/0001-Don-t-
> treate-home-as-user-state.patch
> =

> diff --git a/recipes-core/swupd-client/swupd-client-2.87/0001-Do-not-
> consider-home-as-user-state.patch b/recipes-core/swupd-client/swupd-
> client-2.87/0001-Do-not-consider-home-as-user-state.patch
> new file mode 100644
> index 0000000..29c8a7b
> --- /dev/null
> +++ b/recipes-core/swupd-client/swupd-client-2.87/0001-Do-not-consider-h
> +++ ome-as-user-state.patch
> @@ -0,0 +1,62 @@
> +From 6a7101d85ac6c3df4d12c2e31daf3759d3fabecc Mon Sep 17 00:00:00
> 2001
> +From: Amarnath Valluri <amarnath.valluri@intel.com>
> +Date: Wed, 13 Jul 2016 14:37:26 +0300
> +Subject: [PATCH] Do not consider /home/* as user state
> +
> +This allows to deploy user home folder as part of a bundle.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> +---
> + configure.ac     | 11 +++++++++++
> + src/heuristics.c |  4 +++-
> + 2 files changed, 14 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac index ec26c63..bb4de76 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -79,6 +79,17 @@ AC_ARG_ENABLE(
> +         AC_DEFINE(OS_IS_STATELESS,1,[OS is stateless])
> + )
> +
> ++AC_ARG_ENABLE([stateless-home],
> ++              AS_HELP_STRING([--disable-stateless-home], [treat /home/*=
 as
> ++                              user state, ignore user home folder chang=
es (stateless by
> default)]),
> ++              [enable_stateless_home=3D$enableval],
> ++              [enable_stateless_home=3Dyes]
> ++)
> ++AS_IF([test "x$enable_stateless_home" =3D "xyes"],
> ++      [AC_DEFINE([STATELESS_HOME], [1], [Treat $HOME as user state])],
> ++      [AC_DEFINE([STATELESS_HOME], [0], [Do not treat $HOME as user
> ++state])]
> ++)
> ++
> + AC_ARG_WITH([systemdsystemunitdir], AS_HELP_STRING([--with-
> systemdsystemunitdir=3DDIR],
> +             [path to systemd system service dir
> @<:@default=3D/usr/lib/systemd/system@:>@]), [unitpath=3D${withval}],
> +             [unitpath=3D"$($PKG_CONFIG --variable=3Dsystemdsystemunitdir
> +systemd)"]) diff --git a/src/heuristics.c b/src/heuristics.c index
> +c488e17..7999015 100644
> +--- a/src/heuristics.c
> ++++ b/src/heuristics.c
> +@@ -30,6 +30,8 @@
> + #include "config.h"
> + #include "swupd.h"
> +
> ++#include "config.h"
> ++
> + /* trailing slash is to indicate dir itself is expected to exist, but
> +  * contents are ignored */
> + bool is_config(char *filename)
> +@@ -65,7 +67,7 @@ bool is_state(char *filename)
> +
> + 	if ((strncmp(filename, "/data", 5) =3D=3D 0) ||
> + 	    (strncmp(filename, "/dev/", 5) =3D=3D 0) ||
> +-	    (strncmp(filename, "/home/", 6) =3D=3D 0) ||
> ++	    (!STATELESS_HOME && (strncmp(filename, "/home/", 6) =3D=3D
> 0)) ||
> + 	    (strncmp(filename, "/lost+found", 11) =3D=3D 0) ||
> + 	    (strncmp(filename, "/proc/", 6) =3D=3D 0) ||
> + 	    (strncmp(filename, "/root/", 6) =3D=3D 0) ||
> +--
> +2.5.0
> +
> diff --git a/recipes-core/swupd-client/swupd-client/0001-Do-not-consider-
> home-as-user-state.patch b/recipes-core/swupd-client/swupd-client/0001-
> Do-not-consider-home-as-user-state.patch
> new file mode 100644
> index 0000000..29c8a7b
> --- /dev/null
> +++ b/recipes-core/swupd-client/swupd-client/0001-Do-not-consider-
> home-a
> +++ s-user-state.patch
> @@ -0,0 +1,62 @@
> +From 6a7101d85ac6c3df4d12c2e31daf3759d3fabecc Mon Sep 17 00:00:00
> 2001
> +From: Amarnath Valluri <amarnath.valluri@intel.com>
> +Date: Wed, 13 Jul 2016 14:37:26 +0300
> +Subject: [PATCH] Do not consider /home/* as user state
> +
> +This allows to deploy user home folder as part of a bundle.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> +---
> + configure.ac     | 11 +++++++++++
> + src/heuristics.c |  4 +++-
> + 2 files changed, 14 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac index ec26c63..bb4de76 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -79,6 +79,17 @@ AC_ARG_ENABLE(
> +         AC_DEFINE(OS_IS_STATELESS,1,[OS is stateless])
> + )
> +
> ++AC_ARG_ENABLE([stateless-home],
> ++              AS_HELP_STRING([--disable-stateless-home], [treat /home/*=
 as
> ++                              user state, ignore user home folder chang=
es (stateless by
> default)]),
> ++              [enable_stateless_home=3D$enableval],
> ++              [enable_stateless_home=3Dyes]
> ++)
> ++AS_IF([test "x$enable_stateless_home" =3D "xyes"],
> ++      [AC_DEFINE([STATELESS_HOME], [1], [Treat $HOME as user state])],
> ++      [AC_DEFINE([STATELESS_HOME], [0], [Do not treat $HOME as user
> ++state])]
> ++)
> ++
> + AC_ARG_WITH([systemdsystemunitdir], AS_HELP_STRING([--with-
> systemdsystemunitdir=3DDIR],
> +             [path to systemd system service dir
> @<:@default=3D/usr/lib/systemd/system@:>@]), [unitpath=3D${withval}],
> +             [unitpath=3D"$($PKG_CONFIG --variable=3Dsystemdsystemunitdir
> +systemd)"]) diff --git a/src/heuristics.c b/src/heuristics.c index
> +c488e17..7999015 100644
> +--- a/src/heuristics.c
> ++++ b/src/heuristics.c
> +@@ -30,6 +30,8 @@
> + #include "config.h"
> + #include "swupd.h"
> +
> ++#include "config.h"
> ++
> + /* trailing slash is to indicate dir itself is expected to exist, but
> +  * contents are ignored */
> + bool is_config(char *filename)
> +@@ -65,7 +67,7 @@ bool is_state(char *filename)
> +
> + 	if ((strncmp(filename, "/data", 5) =3D=3D 0) ||
> + 	    (strncmp(filename, "/dev/", 5) =3D=3D 0) ||
> +-	    (strncmp(filename, "/home/", 6) =3D=3D 0) ||
> ++	    (!STATELESS_HOME && (strncmp(filename, "/home/", 6) =3D=3D
> 0)) ||
> + 	    (strncmp(filename, "/lost+found", 11) =3D=3D 0) ||
> + 	    (strncmp(filename, "/proc/", 6) =3D=3D 0) ||
> + 	    (strncmp(filename, "/root/", 6) =3D=3D 0) ||
> +--
> +2.5.0
> +
> diff --git a/recipes-core/swupd-client/swupd-client_2.87.bb b/recipes-
> core/swupd-client/swupd-client_2.87.bb
> index 96e7a10..8a005ff 100644
> --- a/recipes-core/swupd-client/swupd-client_2.87.bb
> +++ b/recipes-core/swupd-client/swupd-client_2.87.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "\
>      file://0001-manifest.c-Always-initialize-preserver-pointer-of-fi.pat=
ch \
>      file://0001-Add-configure-option-to-re-enable-updating-of-config.pat=
ch \
>      file://0001-staging.c-Protect-tar-command-against-special-charac.pat=
ch \
> +    file://0001-Do-not-consider-home-as-user-state.patch \
>  "
> =

>  SRC_URI[md5sum] =3D "5d272c62edb8a9c576005ac5e1182ea3"
> diff --git a/recipes-core/swupd-client/swupd-client_git.bb b/recipes-
> core/swupd-client/swupd-client_git.bb
> index 1815db0..2a23c19 100644
> --- a/recipes-core/swupd-client/swupd-client_git.bb
> +++ b/recipes-core/swupd-client/swupd-client_git.bb
> @@ -10,6 +10,7 @@ SRC_URI =3D "\
>      git://github.com/clearlinux/swupd-client.git;protocol=3Dhttps \
>      file://Change-systemctl-path-to-OE-systemctl-path.patch \
>      file://0001-Add-configure-option-to-re-enable-updating-of-config.pat=
ch \
> +    file://0001-Do-not-consider-home-as-user-state.patch \
>  "
>  SRCREV =3D "f4000c5b22be47ec1af2f8748fd71a36148b5dc4"
> =

> diff --git a/recipes-core/swupd-server/swupd-server-2.53/0001-Don-t-treat-
> home-as-user-state.patch b/recipes-core/swupd-server/swupd-server-
> 2.53/0001-Don-t-treat-home-as-user-state.patch
> new file mode 100644
> index 0000000..e2aaa5d
> --- /dev/null
> +++ b/recipes-core/swupd-server/swupd-server-2.53/0001-Don-t-treat-
> home-
> +++ as-user-state.patch
> @@ -0,0 +1,60 @@
> +From 3d79a5bef173edfc34a612d1ef5994faedea723b Mon Sep 17 00:00:00
> 2001
> +From: Amarnath Valluri <amarnath.valluri@intel.com>
> +Date: Fri, 15 Jul 2016 14:29:53 +0300
> +Subject: [PATCH] Don't treat /home/* as user state
> +
> +This allows to deploy user home folder as part of a bundle
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> +---
> + configure.ac     | 11 +++++++++++
> + src/heuristics.c |  3 ++-
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac index 32d1412..fb70313 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -53,5 +53,16 @@ AS_IF([test "$enable_lzma" =3D "check"],
> +
> + AM_CONDITIONAL([ENABLE_LZMA], [test "$enable_lzma" =3D "yes"])
> +
> ++AC_ARG_ENABLE([stateless-home],
> ++              AS_HELP_STRING([--disable-stateless-home], [treat /home/*=
 as
> user state, ignore user home folder changes (stateless by default)]),
> ++              [enable_stateless_home=3D$enableval],
> ++              [enable_stateless_home=3Dyes]
> ++)
> ++AS_IF([test "x$enable_stateless_home" =3D "xyes"],
> ++      [AC_DEFINE([STATELESS_HOME], [1], [Treat $HOME as user state])],
> ++      [AC_DEFINE([STATELESS_HOME], [0], [Do not treat $HOME as user
> ++state])]
> ++)
> ++
> ++
> + AC_CONFIG_FILES([Makefile])
> + AC_OUTPUT
> +diff --git a/src/heuristics.c b/src/heuristics.c index 18fa9b9..e52af76
> +100644
> +--- a/src/heuristics.c
> ++++ b/src/heuristics.c
> +@@ -31,6 +31,7 @@
> +
> + #include <swupd.h>
> +
> ++#include "config.h"
> +
> +
> + /* TODO: this needs to come from a file that has a list of regexps */
> +@@ -62,7 +63,7 @@ static void runtime_state_heuristics(struct file *file)
> + 	/* the contents of these directory are state, ideally this never
> + 	 * triggers if our package builds are clean */
> + 	if ((strncmp(file->filename, "/dev/", 5) =3D=3D 0) ||
> +-	    (strncmp(file->filename, "/home/", 6) =3D=3D 0) ||
> ++	    (!STATELESS_HOME && (strncmp(file->filename, "/home/",
> 6) =3D=3D 0))
> ++||
> + 	    (strncmp(file->filename, "/proc/", 6) =3D=3D 0) ||
> + 	    (strncmp(file->filename, "/root/", 6) =3D=3D 0) ||
> + 	    (strncmp(file->filename, "/run/", 5) =3D=3D 0) ||
> +--
> +2.5.0
> +
> diff --git a/recipes-core/swupd-server/swupd-server-2.53/0001-Don-t-
> treate-home-as-user-state.patch b/recipes-core/swupd-server/swupd-
> server-2.53/0001-Don-t-treate-home-as-user-state.patch
> new file mode 100644
> index 0000000..5555e14
> --- /dev/null
> +++ b/recipes-core/swupd-server/swupd-server-2.53/0001-Don-t-treate-
> home
> +++ -as-user-state.patch
> @@ -0,0 +1,61 @@
> +From 60dcc111ba50419f31af970690b4a9bba59af232 Mon Sep 17 00:00:00
> 2001
> +From: Amarnath Valluri <amarnath.valluri@intel.com>
> +Date: Fri, 15 Jul 2016 12:44:31 +0300
> +Subject: [PATCH] Don't treate /home/* as user state
> +
> +This allows to deploy user home folder as part of a bundle
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> +---
> + configure.ac     | 10 ++++++++++
> + src/heuristics.c |  4 +++-
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac index c2bd7bf..69ee5e4 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -82,6 +82,16 @@ AS_IF([test "$enable_lzma" !=3D "no"], [
> + ])
> + AM_CONDITIONAL([ENABLE_LZMA], [test "$enable_lzma" !=3D "no"])
> +
> ++AC_ARG_ENABLE([stateless-home],
> ++              AS_HELP_STRING([--disable-stateless-home], [treate /home/=
* as
> user state, ignore user home folder changes (stateless by default)]),
> ++              [enable_stateless_home=3D$enableval],
> ++              [enable_stateless_home=3Dyes]
> ++)
> ++AS_IF([test "x$enable_stateless_home" =3D "xyes"],
> ++      [AC_DEFINE([STATELESS_HOME], [1], [Treat $HOME as user state])],
> ++      [AC_DEFINE([STATELESS_HOME], [0], [Do not treat $HOME as user
> ++state])]
> ++)
> ++
> + AC_CONFIG_FILES([Makefile])
> + AC_REQUIRE_AUX_FILE([tap-driver.sh])
> + AC_OUTPUT
> +diff --git a/src/heuristics.c b/src/heuristics.c index 94eee53..35c66f5
> +100644
> +--- a/src/heuristics.c
> ++++ b/src/heuristics.c
> +@@ -28,6 +28,8 @@
> + #include <string.h>
> + #include <unistd.h>
> +
> ++#include "config.h"
> ++
> + #include "swupd.h"
> +
> + /* TODO: this needs to come from a file that has a list of regexps */
> +@@ -59,7 +61,7 @@ static void runtime_state_heuristics(struct file *file)
> + 	/* the contents of these directory are state, ideally this never
> + 	 * triggers if our package builds are clean */
> + 	if ((strncmp(file->filename, "/dev/", 5) =3D=3D 0) ||
> +-	    (strncmp(file->filename, "/home/", 6) =3D=3D 0) ||
> ++	    (!STATELESS_HOME && (strncmp(file->filename, "/home/",
> 6) =3D=3D 0))
> ++||
> + 	    (strncmp(file->filename, "/proc/", 6) =3D=3D 0) ||
> + 	    (strncmp(file->filename, "/root/", 6) =3D=3D 0) ||
> + 	    (strncmp(file->filename, "/run/", 5) =3D=3D 0) ||
> +--
> +2.5.0
> +
> diff --git a/recipes-core/swupd-server/swupd-server/0001-Don-t-treat-
> home-as-user-state.patch b/recipes-core/swupd-server/swupd-
> server/0001-Don-t-treat-home-as-user-state.patch
> new file mode 100644
> index 0000000..6cbd30b
> --- /dev/null
> +++ b/recipes-core/swupd-server/swupd-server/0001-Don-t-treat-home-
> as-us
> +++ er-state.patch
> @@ -0,0 +1,61 @@
> +From 60dcc111ba50419f31af970690b4a9bba59af232 Mon Sep 17 00:00:00
> 2001
> +From: Amarnath Valluri <amarnath.valluri@intel.com>
> +Date: Fri, 15 Jul 2016 12:44:31 +0300
> +Subject: [PATCH] Don't treat /home/* as user state
> +
> +This allows to deploy user home folder as part of a bundle
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> +---
> + configure.ac     | 10 ++++++++++
> + src/heuristics.c |  4 +++-
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac index c2bd7bf..69ee5e4 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -82,6 +82,16 @@ AS_IF([test "$enable_lzma" !=3D "no"], [
> + ])
> + AM_CONDITIONAL([ENABLE_LZMA], [test "$enable_lzma" !=3D "no"])
> +
> ++AC_ARG_ENABLE([stateless-home],
> ++              AS_HELP_STRING([--disable-stateless-home], [treat /home/*=
 as
> user state, ignore user home folder changes (stateless by default)]),
> ++              [enable_stateless_home=3D$enableval],
> ++              [enable_stateless_home=3Dyes]
> ++)
> ++AS_IF([test "x$enable_stateless_home" =3D "xyes"],
> ++      [AC_DEFINE([STATELESS_HOME], [1], [Treat $HOME as user state])],
> ++      [AC_DEFINE([STATELESS_HOME], [0], [Do not treat $HOME as user
> ++state])]
> ++)
> ++
> + AC_CONFIG_FILES([Makefile])
> + AC_REQUIRE_AUX_FILE([tap-driver.sh])
> + AC_OUTPUT
> +diff --git a/src/heuristics.c b/src/heuristics.c index 94eee53..35c66f5
> +100644
> +--- a/src/heuristics.c
> ++++ b/src/heuristics.c
> +@@ -28,6 +28,8 @@
> + #include <string.h>
> + #include <unistd.h>
> +
> ++#include "config.h"
> ++
> + #include "swupd.h"
> +
> + /* TODO: this needs to come from a file that has a list of regexps */
> +@@ -59,7 +61,7 @@ static void runtime_state_heuristics(struct file *file)
> + 	/* the contents of these directory are state, ideally this never
> + 	 * triggers if our package builds are clean */
> + 	if ((strncmp(file->filename, "/dev/", 5) =3D=3D 0) ||
> +-	    (strncmp(file->filename, "/home/", 6) =3D=3D 0) ||
> ++	    (!STATELESS_HOME && (strncmp(file->filename, "/home/",
> 6) =3D=3D 0))
> ++||
> + 	    (strncmp(file->filename, "/proc/", 6) =3D=3D 0) ||
> + 	    (strncmp(file->filename, "/root/", 6) =3D=3D 0) ||
> + 	    (strncmp(file->filename, "/run/", 5) =3D=3D 0) ||
> +--
> +2.5.0
> +
> diff --git a/recipes-core/swupd-server/swupd-server/0001-Don-t-treate-
> home-as-user-state.patch b/recipes-core/swupd-server/swupd-
> server/0001-Don-t-treate-home-as-user-state.patch
> new file mode 100644
> index 0000000..5555e14
> --- /dev/null
> +++ b/recipes-core/swupd-server/swupd-server/0001-Don-t-treate-home-
> as-u
> +++ ser-state.patch
> @@ -0,0 +1,61 @@
> +From 60dcc111ba50419f31af970690b4a9bba59af232 Mon Sep 17 00:00:00
> 2001
> +From: Amarnath Valluri <amarnath.valluri@intel.com>
> +Date: Fri, 15 Jul 2016 12:44:31 +0300
> +Subject: [PATCH] Don't treate /home/* as user state
> +
> +This allows to deploy user home folder as part of a bundle
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> +---
> + configure.ac     | 10 ++++++++++
> + src/heuristics.c |  4 +++-
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac index c2bd7bf..69ee5e4 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -82,6 +82,16 @@ AS_IF([test "$enable_lzma" !=3D "no"], [
> + ])
> + AM_CONDITIONAL([ENABLE_LZMA], [test "$enable_lzma" !=3D "no"])
> +
> ++AC_ARG_ENABLE([stateless-home],
> ++              AS_HELP_STRING([--disable-stateless-home], [treate /home/=
* as
> user state, ignore user home folder changes (stateless by default)]),
> ++              [enable_stateless_home=3D$enableval],
> ++              [enable_stateless_home=3Dyes]
> ++)
> ++AS_IF([test "x$enable_stateless_home" =3D "xyes"],
> ++      [AC_DEFINE([STATELESS_HOME], [1], [Treat $HOME as user state])],
> ++      [AC_DEFINE([STATELESS_HOME], [0], [Do not treat $HOME as user
> ++state])]
> ++)
> ++
> + AC_CONFIG_FILES([Makefile])
> + AC_REQUIRE_AUX_FILE([tap-driver.sh])
> + AC_OUTPUT
> +diff --git a/src/heuristics.c b/src/heuristics.c index 94eee53..35c66f5
> +100644
> +--- a/src/heuristics.c
> ++++ b/src/heuristics.c
> +@@ -28,6 +28,8 @@
> + #include <string.h>
> + #include <unistd.h>
> +
> ++#include "config.h"
> ++
> + #include "swupd.h"
> +
> + /* TODO: this needs to come from a file that has a list of regexps */
> +@@ -59,7 +61,7 @@ static void runtime_state_heuristics(struct file *file)
> + 	/* the contents of these directory are state, ideally this never
> + 	 * triggers if our package builds are clean */
> + 	if ((strncmp(file->filename, "/dev/", 5) =3D=3D 0) ||
> +-	    (strncmp(file->filename, "/home/", 6) =3D=3D 0) ||
> ++	    (!STATELESS_HOME && (strncmp(file->filename, "/home/",
> 6) =3D=3D 0))
> ++||
> + 	    (strncmp(file->filename, "/proc/", 6) =3D=3D 0) ||
> + 	    (strncmp(file->filename, "/root/", 6) =3D=3D 0) ||
> + 	    (strncmp(file->filename, "/run/", 5) =3D=3D 0) ||
> +--
> +2.5.0
> +
> diff --git a/recipes-core/swupd-server/swupd-server_2.53.bb b/recipes-
> core/swupd-server/swupd-server_2.53.bb
> index edb4407..74d4525 100644
> --- a/recipes-core/swupd-server/swupd-server_2.53.bb
> +++ b/recipes-core/swupd-server/swupd-server_2.53.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "\
>      file://0008-Clean-up-tar-commands-always-put-files-after-options.pat=
ch \
>      file://0009-Add-compatibility-with-libarchive-s-bsdtar-command.patch=
 \
>      file://fullfiles.c-work-around-pseudo-bug.patch \
> +    file://0001-Don-t-treat-home-as-user-state.patch \
>  "
> =

>  SRC_URI[md5sum] =3D "14f25677b5a4f0b33785910b03860939"
> diff --git a/recipes-core/swupd-server/swupd-server_git.bb b/recipes-
> core/swupd-server/swupd-server_git.bb
> index fccc0fe..7d78736 100644
> --- a/recipes-core/swupd-server/swupd-server_git.bb
> +++ b/recipes-core/swupd-server/swupd-server_git.bb
> @@ -10,6 +10,7 @@ PV =3D "3.2.3+git${SRCPV}"
>  SRC_URI =3D "\
>      git://github.com/clearlinux/swupd-server.git;protocol=3Dhttps \
>      file://fullfiles.c-work-around-pseudo-bug.patch \
> +    file://0001-Don-t-treat-home-as-user-state.patch \
>  "
>  SRCREV =3D "9d4df7e0350d3d8d1aa8af9f92d752046dbc72d0"
> =

> --
> 2.5.0
> =

> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki Business Identity Code: 035760=
6 -
> 4 Domiciled in Helsinki
> =

> This e-mail and any attachments may contain confidential material for the
> sole use of the intended recipient(s). Any review or distribution by othe=
rs is
> strictly prohibited. If you are not the intended recipient, please contac=
t the
> sender and delete all copies.
> =

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


