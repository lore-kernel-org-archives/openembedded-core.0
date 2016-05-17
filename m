Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-09.clustermail.de (good-out-09.clustermail.de
	[212.223.36.10])
	by mail.openembedded.org (Postfix) with ESMTP id D8C3B7327F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 15:09:54 +0000 (UTC)
Received: from frontend-04 ([10.0.0.4] helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtps
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84_2)
	(envelope-from <Daniel.Klauer@gin.de>) id 1b2eXF-0002Ov-6x
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2016 14:55:46 +0200
Received: from [217.6.33.234] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa (TLSv1.2:AES256-SHA:256)
	(Exim 4.84_2) (envelope-from <Daniel.Klauer@gin.de>)
	id 1b2eXF-00042k-1I for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2016 14:55:41 +0200
Received: from Win2012-02.gin-domain.local (192.168.1.12) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Tue, 17 May 2016 14:55:40 +0200
Received: from Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90]) by
	Win2012-02.gin-domain.local ([fe80::3db4:55fd:d76e:9d90%12]) with mapi
	id 15.00.1130.005; Tue, 17 May 2016 14:55:40 +0200
From: "Klauer, Daniel" <Daniel.Klauer@gin.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] smartpm: Fix channel command --remove-all option (again)
Thread-Index: AQHRsDtp//YpfIS/B0+OLSXr+zO7Ug==
Date: Tue, 17 May 2016 12:55:39 +0000
Message-ID: <7a1612796508464687a78747bf62d41a@Win2012-02.gin-domain.local>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.1.219]
x-brightmail-tracker: H4sIAAAAAAAAC+NgFnrFqsTGxXJgBSOP7hkR63CDCdNOH+Kw+LnmKZsDYwBDFGtmXlJ+RQJrxoNnh5gKPsdXXLzQzNbAOCm6i5GLQ0hgD6PEh8ZrrBDOSUaJ7RdWMHcxcnIwC5hKXPnayAJhK0pcuNcAZrMJ6Eqca3/PCmKLCERLLJ0xk72LkZ1DWMBTYj9U1E9i74VFULaexK6Lq9hBbAkBHYm/ixrB4iwCqhIb7x9lArF5BbwkFk/8ALaVUUBWorPhHRPEVnGJW0/mM0H0Ckgs2XOeGcJWkui9/Q4qHiJxceF0Rog5ghInZz5hgYibSex9sASohgPI1pNom8IJEQ6UuP5mJTNE2FTi6vtgiLCBxLu1n6E6jSVWbvzPCGHbSuyZMRFqirPEvBv1EGEniTcdb1khbG2J7a/2scI8uOnaKqgx8hL/792Hsh0lrrzrZ4OwFSU+3W5im8CoNgsplGchhfIsJL/PQvLXAkaWVYzS4Zl5RgaGRroGRnrpmXm6Kfm5iZl5ejn5yYk5mxih6WAH46PProcYJTmYlER5X160ChfiS8pPqcxILM6ILyrNSS0+xCjBwaMkwntG2DpciLe4IDG3ODMdJiXDwaEkwRsIkhIsSk1PrUjLzClJLYJIn2KUlBLnDQNJCoD0ZZTmweUuMYpKCfM+4wPK8RSkFuVmlkDEbzEKczxkEmLJy89LlQI6kQEINBhfMYpzMCoJ884AmcWTmVcCd8IroOuYgK6bYGYBcl1JIkJKqoFRJJi//fUpz4fTHXSSdy7fG12o9OnM56CjLJ2nX3mVy3At/B/6fR/PrcuZHFEC3+/mzVVOtTp5uqNUb8+34EA3n/B1Tke6Cibx/sp69mZSb1bk3+r3J/PubHzuYtkzYR+XD1Nz6cVFjkHlM98/Sp/yv9dnqdr3K93ByVIHnpxc1Pdl2/9YwzW5SizFGYmGWsxFxYkAqsqQ4X0DAAA=
MIME-Version: 1.0
Subject: [PATCH] smartpm: Fix channel command --remove-all option (again)
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
X-List-Received-Date: Tue, 17 May 2016 15:09:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

SmartPM's --remove-all option was unusable, because the fix from=0A=
commit 03266e89a6 was lost in commit 5fc580fc44. Thus, add a new=0A=
patch to fix --remove-all.=0A=
=0A=
It seems like the previous fix was lost by mistake:=0A=
Upstream merged the *old* version of the patch (smartpm 406541f569),=0A=
and when SmartPM in oe-core was upgraded to the new upstream release,=0A=
the --remove-all fix from the *new* patch was not carried over.=0A=
=0A=
Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>=0A=
---=0A=
 .../python-smartpm/smart-channel-remove-all.patch  | 33 ++++++++++++++++++=
++++=0A=
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +=0A=
 2 files changed, 34 insertions(+)=0A=
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-chann=
el-remove-all.patch=0A=
=0A=
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-channel-remo=
ve-all.patch b/meta/recipes-devtools/python/python-smartpm/smart-channel-re=
move-all.patch=0A=
new file mode 100644=0A=
index 0000000..da23e7c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-devtools/python/python-smartpm/smart-channel-remove-all.=
patch=0A=
@@ -0,0 +1,33 @@=0A=
+From 6d2363a705697f615d9e5af5d6703b291e618b46 Mon Sep 17 00:00:00 2001=0A=
+From: Daniel Klauer <daniel.klauer@gin.de>=0A=
+Date: Thu, 12 May 2016 17:55:01 +0200=0A=
+Subject: [PATCH] Fix channel command --remove-all option parsing=0A=
+=0A=
+Option.take_action() stores a list of options given for validation later.=
=0A=
+It strips leading dashes and turns remaining dashes into underscores.=0A=
+This list is what ensure_action() will compare its arguments against,=0A=
+thus we must use underscores here.=0A=
+=0A=
+Upstream-Status: Pending=0A=
+=0A=
+Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>=0A=
+---=0A=
+ smart/commands/channel.py | 2 +-=0A=
+ 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/smart/commands/channel.py b/smart/commands/channel.py=0A=
+index 108f3f1..6234f69 100644=0A=
+--- a/smart/commands/channel.py=0A=
++++ b/smart/commands/channel.py=0A=
+@@ -164,7 +164,7 @@ def main(ctrl, opts):=0A=
+     opts.check_args_of_option("edit", 0)=0A=
+     opts.check_args_of_option("enable", -1)=0A=
+     opts.check_args_of_option("disable", -1)=0A=
+-    opts.ensure_action("channel", ["add", "set", "remove", "remove-all",=
=0A=
++    opts.ensure_action("channel", ["add", "set", "remove", "remove_all",=
=0A=
+                        "list", "show", "yaml", "enable", "disable"])=0A=
+     opts.check_remaining_args()=0A=
+ =0A=
+-- =0A=
+1.9.1=0A=
+=0A=
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/reci=
pes-devtools/python/python-smartpm_git.bb=0A=
index 0d7f88c..0d37dae 100644=0A=
--- a/meta/recipes-devtools/python/python-smartpm_git.bb=0A=
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb=0A=
@@ -24,6 +24,7 @@ SRC_URI =3D "\=0A=
           file://smart-already-installed-message.patch \=0A=
           file://smart-set-noprogress-for-pycurl.patch \=0A=
           file://smart-cache.py-getPackages-matches-name-version.patch \=
=0A=
+          file://smart-channel-remove-all.patch \=0A=
          "=0A=
 =0A=
 SRCREV =3D "407a7eca766431257dcd1da15175cc36a1bb22d0"=0A=
-- =0A=
1.9.1=0A=
=0A=

