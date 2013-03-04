Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UCOqX-0006Hn-S4
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 07:26:02 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Mar 2013 22:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,777,1355126400"; d="scan'208";a="298571341"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2013 22:09:31 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 4 Mar 2013 06:09:31 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.108]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.144]) with mapi id
	14.01.0355.002; Mon, 4 Mar 2013 06:09:31 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] connman: upgrade to 1.12
Thread-Index: AQHOFpyXa/Z5d7uBGki30F+o1HuG85iRgKmAgAONY0A=
Date: Mon, 4 Mar 2013 06:09:30 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16207FC0@IRSMSX102.ger.corp.intel.com>
References: <1362156507-10571-1-git-send-email-cristian.iorga@intel.com>
	<1362156507-10571-2-git-send-email-cristian.iorga@intel.com>
	<51313DBF.3060609@linux.intel.com>
In-Reply-To: <51313DBF.3060609@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] connman: upgrade to 1.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 06:26:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

Momentarily no. This was tested on kernel 3.4 only, but I will integrate th=
at patch and re-test with kernel 3.8.

Regards,
Cristian.

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Saturday, March 02, 2013 1:46 AM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] connman: upgrade to 1.12

On 03/01/2013 08:48 AM, Cristian Iorga wrote:
> - 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch no=20
> longer needed; fix included in package source code
>
Does this also address the netinet/in.h issue that I recently added for
1.10 and the 3.8 Kernel?  Ultimately this patch will need to be rebased bas=
ed on master.

Sau!

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc      |    2 +-
>   ...If-there-is-no-d_type-support-use-fstatat.patch |   55 -------------=
-------
>   .../connman/{connman_1.10.bb =3D> connman_1.12.bb}   |    5 +-
>   3 files changed, 3 insertions(+), 59 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/connman/connman/0002-stora=
ge.c-If-there-is-no-d_type-support-use-fstatat.patch
>   rename meta/recipes-connectivity/connman/{connman_1.10.bb =3D>=20
> connman_1.12.bb} (72%)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc=20
> b/meta/recipes-connectivity/connman/connman.inc
> index db4d26c..04b21f7 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,7 +20,7 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>               ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>               "
>
> -INC_PR =3D "r18"
> +INC_PR =3D "r0"
>
>   TIST =3D "--enable-tist"
>   TIST_powerpc =3D ""
> diff --git=20
> a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is
> -no-d_type-support-use-fstatat.patch=20
> b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is
> -no-d_type-support-use-fstatat.patch
> deleted file mode 100644
> index 7315545..0000000
> ---=20
> a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is
> -no-d_type-support-use-fstatat.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 7007ef32a959ac4717c19339a24fd90a68638a19 Mon Sep 17 00:00:00=20
> 2001
> -From: Andrei Gherzan <andrei@gherzan.ro>
> -Date: Tue, 17 Jul 2012 16:07:17 +0300
> -Subject: [PATCH V3 2/2] storage.c: If there is no d_type support use
> - fstatat()
> -
> -This is useful for filesystems where d_type is always DT_UNKNOWN.
> -In this case use fstatat() function.
> -
> -Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> -Upstream-Status: Submitted
> -
> ----
> - src/storage.c |   19 +++++++++++++++++++
> - 1 file changed, 19 insertions(+)
> -
> -Index: git/src/storage.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/storage.c
> -+++ git/src/storage.c
> -@@ -193,7 +193,6 @@ gchar **connman_storage_get_services()
> -
> - 		switch (d->d_type) {
> - 		case DT_DIR:
> --		case DT_UNKNOWN:
> - 			/*
> - 			 * If the settings file is not found, then
> - 			 * assume this directory is not a services dir.
> -@@ -203,6 +202,25 @@ gchar **connman_storage_get_services()
> - 			ret =3D stat(str, &buf);
> - 			g_free(str);
> - 			if (ret < 0)
> -+				continue;
> -+
> -+			g_string_append_printf(result, "%s/", d->d_name);
> -+			break;
> -+		case DT_UNKNOWN:
> -+			/*
> -+			 * If there is no d_type support use fstatat()
> -+			 * to check if directory
> -+			 */
> -+			ret =3D fstatat(dirfd(dir), d->d_name, &buf, 0);
> -+			if (ret < 0)
> -+				continue;
> -+			if (!(buf.st_mode & S_IFDIR))
> -+				continue;
> -+			str =3D g_strdup_printf("%s/%s/settings", STORAGEDIR,
> -+							d->d_name);
> -+			ret =3D stat(str, &buf);
> -+			g_free(str);
> -+			if (ret < 0)
> - 				continue;
> -
> - 			g_string_append_printf(result, "%s/", d->d_name);
> diff --git a/meta/recipes-connectivity/connman/connman_1.10.bb=20
> b/meta/recipes-connectivity/connman/connman_1.12.bb
> similarity index 72%
> rename from meta/recipes-connectivity/connman/connman_1.10.bb
> rename to meta/recipes-connectivity/connman/connman_1.12.bb
> index 10d5255..5da50fe 100644
> --- a/meta/recipes-connectivity/connman/connman_1.10.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.12.bb
> @@ -1,12 +1,11 @@
>   require connman.inc
>
> -# 1.10 tag
> -SRCREV =3D "3bda76eb442c9395db1dba17352c3e78376671cc"
> +# 1.12 tag
> +SRCREV =3D "8397cbbc0a79d39cf3b1880f4fd3f3405b6bc6ad"
>   SRC_URI  =3D "git://git.kernel.org/pub/scm/network/connman/connman.git =
\
>               file://0001-plugin.h-Change-visibility-to-default-for-debug=
-symb.patch \
>               file://add_xuser_dbus_permission.patch \
>               file://connman \
> -            file://0002-storage.c-If-there-is-no-d_type-support-use-fsta=
tat.patch \
>               file://inet-fix-ip-cleanup-functions.patch"
>   S =3D "${WORKDIR}/git"
>   PR =3D "${INC_PR}.0"
>


