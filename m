Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Thy8k-00021Z-DD
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 08:51:08 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Dec 2012 23:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,250,1355126400"; d="scan'208";a="229241630"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by azsmga001.ch.intel.com with ESMTP; 09 Dec 2012 23:35:23 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 10 Dec 2012 07:35:22 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.36]) with mapi id
	14.01.0355.002; Mon, 10 Dec 2012 07:35:22 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] connman: upgrade to 1.9
Thread-Index: AQHN0xAFGHCyqBNycEiSyRk/AIzhtpgMDuCAgAWbl6A=
Date: Mon, 10 Dec 2012 07:35:21 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161D2CB7@IRSMSX102.ger.corp.intel.com>
References: <1354729406-19146-1-git-send-email-cristian.iorga@intel.com>
	<50C0DB6F.7090701@linux.intel.com>
In-Reply-To: <50C0DB6F.7090701@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "Musca, ConstantinX" <constantinx.musca@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: upgrade to 1.9
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
X-List-Received-Date: Mon, 10 Dec 2012 07:51:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

Where I can find the sanity tests source code?
Also, what is the test environment regarding the network?
Is the qemu machine isolated?

I also agree with you that there is a need to investigate this.
I will deal with it coming Thursday.

Thanks,
Cristian


-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Thursday, December 06, 2012 7:53 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org; Musca, ConstantinX
Subject: Re: [OE-core] [PATCH] connman: upgrade to 1.9

On 12/05/2012 09:43 AM, Cristian Iorga wrote:
> From: Constantin Musca <constantinx.musca@intel.com>
>
> 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
>      - adapted to the new version
>
> 0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
>      - patch removed (it is included in the new version)
>
> inet-fix-ip-cleanup-functions.patch: added
>      - fix for ip cleanup functions
>
This seemed to introduce some regression on the Autobuilder and caused all =
Sanity tests to fail, apparently connman is taking longer to start up and l=
onger to aquire an IP address.

This needs to be understood before we merge this change.

Thanks
	Sau!

> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   ...If-there-is-no-d_type-support-use-fstatat.patch |   61 -------------=
-------
>   ...If-there-is-no-d_type-support-use-fstatat.patch |   38 +++++++-----
>   .../connman/inet-fix-ip-cleanup-functions.patch    |   40 +++++++++++++
>   .../connman/{connman_1.4.bb =3D> connman_1.9.bb}     |    6 +-
>   4 files changed, 65 insertions(+), 80 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/connman/connman/0001-timez=
one.c-If-there-is-no-d_type-support-use-fstatat.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman/inet-fix-i=
p-cleanup-functions.patch
>   rename meta/recipes-connectivity/connman/{connman_1.4.bb =3D>=20
> connman_1.9.bb} (72%)
>
> diff --git=20
> a/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-i
> s-no-d_type-support-use-fstatat.patch=20
> b/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-i
> s-no-d_type-support-use-fstatat.patch
> deleted file mode 100644
> index 3bced52..0000000
> ---=20
> a/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-i
> s-no-d_type-support-use-fstatat.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From f2094e6b2e4542adf458d8fa58d7bccd5edb762e Mon Sep 17 00:00:00=20
> 2001
> -From: Andrei Gherzan <andrei@gherzan.ro>
> -Date: Tue, 17 Jul 2012 17:27:39 +0300
> -Subject: [PATCH V3 1/2] timezone.c: If there is no d_type support use
> - fstatat()
> -
> -This is useful for filesystems where d_type is always DT_UNKNOWN.
> -In this case use fstatat() function.
> -
> -Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> -Upstream-Status: Submitted
> -
> ----
> - src/timezone.c |   24 ++++++++++++++++++++++++
> - 1 file changed, 24 insertions(+)
> -
> -diff --git a/src/timezone.c b/src/timezone.c -index 173d658..f951f6b=20
> 100644
> ---- a/src/timezone.c
> -+++ b/src/timezone.c
> -@@ -157,6 +157,8 @@ static char *find_origin(void *src_map, struct stat =
*src_st,
> - 	DIR *dir;
> - 	struct dirent *d;
> - 	char *str, pathname[PATH_MAX];
> -+	struct stat buf;
> -+	int ret;
> -
> - 	if (subpath =3D=3D NULL)
> - 		strncpy(pathname, basepath, sizeof(pathname));
> -@@ -205,6 +207,28 @@ static char *find_origin(void *src_map, struct stat=
 *src_st,
> - 				return str;
> - 			}
> - 			break;
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
> -+			if (subpath =3D=3D NULL)
> -+				strncpy(pathname, d->d_name, sizeof(pathname));
> -+			else
> -+				snprintf(pathname, sizeof(pathname),
> -+						"%s/%s", subpath, d->d_name);
> -+
> -+			str =3D find_origin(src_map, src_st, basepath, pathname);
> -+			if (str !=3D NULL) {
> -+				closedir(dir);
> -+				return str;
> -+			}
> -+			break;
> - 		}
> - 	}
> -
> ---
> -1.7.9.5
> -
> diff --git=20
> a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is
> -no-d_type-support-use-fstatat.patch=20
> b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is
> -no-d_type-support-use-fstatat.patch
> index d3205c0..7315545 100644
> ---=20
> a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is
> -no-d_type-support-use-fstatat.patch
> +++ b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-ther
> +++ e-is-no-d_type-support-use-fstatat.patch
> @@ -8,20 +8,33 @@ This is useful for filesystems where d_type is always D=
T_UNKNOWN.
>   In this case use fstatat() function.
>
>   Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>   Upstream-Status: Submitted
>
>   ---
>    src/storage.c |   19 +++++++++++++++++++
>    1 file changed, 19 insertions(+)
>
> -diff --git a/src/storage.c b/src/storage.c -index 47bd0cb..0491a52=20
> 100644
> ---- a/src/storage.c
> -+++ b/src/storage.c
> -@@ -206,6 +206,25 @@ gchar **connman_storage_get_services()
> +Index: git/src/storage.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/storage.c
> ++++ git/src/storage.c
> +@@ -193,7 +193,6 @@ gchar **connman_storage_get_services()
>
> - 			g_string_append_printf(result, "%s/", d->d_name);
> - 			break;
> + 		switch (d->d_type) {
> + 		case DT_DIR:
> +-		case DT_UNKNOWN:
> + 			/*
> + 			 * If the settings file is not found, then
> + 			 * assume this directory is not a services dir.
> +@@ -203,6 +202,25 @@ gchar **connman_storage_get_services()
> + 			ret =3D stat(str, &buf);
> + 			g_free(str);
> + 			if (ret < 0)
> ++				continue;
> ++
> ++			g_string_append_printf(result, "%s/", d->d_name);
> ++			break;
>   +		case DT_UNKNOWN:
>   +			/*
>   +			 * If there is no d_type support use fstatat()
> @@ -37,13 +50,6 @@ index 47bd0cb..0491a52 100644
>   +			ret =3D stat(str, &buf);
>   +			g_free(str);
>   +			if (ret < 0)
> -+				continue;
> -+
> -+			g_string_append_printf(result, "%s/", d->d_name);
> -+			break;
> - 		}
> - 	}
> + 				continue;
>
> ---
> -1.7.9.5
> -
> + 			g_string_append_printf(result, "%s/", d->d_name);
> diff --git=20
> a/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functi
> ons.patch=20
> b/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functi
> ons.patch
> new file mode 100644
> index 0000000..3071549
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-fu
> +++ nctions.patch
> @@ -0,0 +1,40 @@
> +From 100353e10f60a50ca1ba78daa6bc4dfebf5b3297 Mon Sep 17 00:00:00=20
> +2001
> +From: Constantin Musca <constantinx.musca@intel.com>
> +Date: Wed, 5 Dec 2012 15:07:21 +0200
> +Subject: [PATCH] inet: fix ip cleanup functions
> +
> +Upstream-Status: Pending
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +---
> + src/inet.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/inet.c b/src/inet.c
> +index be69aca..e76a1f1 100644
> +--- a/src/inet.c
> ++++ b/src/inet.c
> +@@ -626,6 +626,10 @@ int connman_inet_clear_ipv6_address(int index,=20
> +const char *address,
> +
> + 	DBG("index %d address %s prefix_len %d", index, address,=20
> + prefix_len);
> +
> ++	if (address =3D=3D NULL) {
> ++		return -1;
> ++	}
> ++
> + 	err =3D __connman_inet_modify_address(RTM_DELADDR, 0, index, AF_INET6,
> + 				address, NULL, prefix_len, NULL);
> + 	if (err < 0) {
> +@@ -649,6 +653,10 @@ int connman_inet_clear_address(int index, struct=20
> +connman_ipaddress *ipaddress)
> +
> + 	DBG("index %d address %s prefix_len %d", index, address,=20
> + prefix_len);
> +
> ++	if (address =3D=3D NULL) {
> ++		return -1;
> ++	}
> ++
> + 	err =3D __connman_inet_modify_address(RTM_DELADDR, 0, index, AF_INET,
> + 				address, peer, prefix_len, broadcast);
> + 	if (err < 0) {
> +--
> +1.7.11.7
> +
> diff --git a/meta/recipes-connectivity/connman/connman_1.4.bb=20
> b/meta/recipes-connectivity/connman/connman_1.9.bb
> similarity index 72%
> rename from meta/recipes-connectivity/connman/connman_1.4.bb
> rename to meta/recipes-connectivity/connman/connman_1.9.bb
> index bd8ba65..3cbabc6 100644
> --- a/meta/recipes-connectivity/connman/connman_1.4.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.9.bb
> @@ -1,12 +1,12 @@
>   require connman.inc
>
> -# 1.4 tag
> -SRCREV =3D "f701bbca259f1f35e68d338f31f5373f75f3da5f"
> +# 1.9 tag
> +SRCREV =3D "4bf217329babf4f7792b43d70228af8269c3332c"
>   SRC_URI  =3D "git://git.kernel.org/pub/scm/network/connman/connman.git =
\
>               file://0001-plugin.h-Change-visibility-to-default-for-debug=
-symb.patch \
>               file://add_xuser_dbus_permission.patch \
>               file://connman \
>               file://0002-storage.c-If-there-is-no-d_type-support-use-fst=
atat.patch \
> -            file://0001-timezone.c-If-there-is-no-d_type-support-use-fst=
atat.patch"
> +            file://inet-fix-ip-cleanup-functions.patch"
>   S =3D "${WORKDIR}/git"
>   PR =3D "${INC_PR}.0"
>


