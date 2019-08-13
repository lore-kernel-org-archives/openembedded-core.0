Return-Path: <bounces+12060237-dea2-openembedded-core=lists.openembedded.org@sendgrid.net>
Received: from o1.f.az.sendgrid.net (o1.f.az.sendgrid.net [208.117.55.132])
	by mail.openembedded.org (Postfix) with ESMTP id 176B375E80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=sendgrid.me; 
	h=from:to:cc:subject:in-reply-to:references:mime-version:content-type; 
	s=smtpapi; bh=KRLZbERWVzbXrm0XyZo+ZEnYj3A=; b=pS2djyshZavyobY2Ga
	YTmmMSQxvrIypI1W0fSDw9H7DCDxagDVJYcy2XYq8YyeBQNJi1kdJm5t32A51JsL
	33Y5U2WXRJOBv0bxDBWiWD93dTnXGSinfVUj3Q3nyx7fvrRQVsRA+eQKqHETleea
	6dkk5yypSuSx/5xuzoRQyjTXI=
Received: by filter0110p3las1.sendgrid.net with SMTP id
	filter0110p3las1-13300-5D533A0C-3F
	2019-08-13 22:30:36.80507515 +0000 UTC m=+1568148.818720649
Received: from
	t-keweng-westus2-ubuntu.sthawock52fuzp14qwoa2ht3of.xx.internal.cloudapp.net
	(unknown [52.143.72.184])
	by ismtpd0005p1las1.sendgrid.net (SG) with ESMTP id
	RJOfXuMGSoGzz2lffiRHvw Tue, 13 Aug 2019 22:30:36.734 +0000 (UTC)
From: Kevin Weng <t-keweng@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 22:31:37 +0000 (UTC)
Message-Id: <20190813223031.40138-3-t-keweng@microsoft.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813223031.40138-1-t-keweng@microsoft.com>
References: <20190813223031.40138-1-t-keweng@microsoft.com>
MIME-Version: 1.0
X-SG-EID: NueaD3OYy6TFANBcuSZZzWeqNF8z73veS5dGPAsjLWggnA2yQn0uEn6uw+MVASYb0NXldbZ7b71No3
	RM77vLtdK3ZIDsknFcjj1nY71GALjVV7TsJeFQ79HkaMWTAfs0NzaLN5yAUzexzuU/u7FcjfFit9ly
	pmSRw6Yga1YvPWz8RwZaXtuTR0bk4d3UnauEQIYQcoMlxcg7AtxsOKbCF20sjoxOWlUjvuEVqTA8uK
	AebCMqjRzW+os321GH43is
Cc: Kevin Weng <t-keweng@microsoft.com>
Subject: [thud][PATCH 3/4] glib-2.0: fix CVE-2019-13012
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
X-List-Received-Date: Tue, 13 Aug 2019 22:36:40 -0000
Content-type: multipart/alternative;
	boundary="----------=_1565735437-29016-698"

------------=_1565735437-29016-698
content-transfer-encoding: quoted-printable

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
---=0D
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch    | 47 +++++++++++++++++++=0D
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb |  1 +=0D
 2 files changed, 48 insertions(+)=0D
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patc=
h=0D
=0D
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch b/met=
a/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch=0D
new file mode 100644=0D
index 0000000000..29c5d98402=0D
--- /dev/null=0D
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch=0D
@@ -0,0 +1,47 @@=0D
+From c7f7fd53780f8caebccc903d61ffc21632b46a6c Mon Sep 17 00:00:00 2001=0D
+From: Matthias Clasen <mclasen@redhat.com>=0D
+Date: Tue, 22 Jan 2019 13:26:31 -0500=0D
+Subject: [PATCH] keyfile settings: Use tighter permissions=0D
+=0D
+When creating directories, create them with 700 permissions,=0D
+instead of 777.=0D
+=0D
+Closes: #1658=0D
+=0D
+Upstream-Status: Backport=0D
+[https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsnGd=
ThIumwxbeCM-2BExoUQb3xoFKw5ia4SQ7gfdvTfxmZ8uW8wNMPXLlzqfBPx5Spkg-3D-3D_TE0K=
xc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FzBSP6=
0qI2GfklY0UAhXTU7-2BagK7GE0pY2gSbtzQgRWAtFRzsX5zZc4SnBz-2BZn2IxtzjkOKKVfBGZ=
VXe6NZ6yH17NLIcwrFuflIpbosCts2lUbNM0C5tds-2BcpFGJ8YNExatD8xQHoIdKQdWh2yVHTS=
L7gxkDxYkzDoXFn-2F-2FQGctFXEl8VKUiRClzAawIH0Ckv=0D
+/5e4da714f00f6bfb2ccd6d73d61329c6f3a08429]=0D
+=0D
+CVE: CVE-2019-13012=0D
+=0D
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
+---=0D
+ gio/gkeyfilesettingsbackend.c | 5 +++--=0D
+ 1 file changed, 3 insertions(+), 2 deletions(-)=0D
+=0D
+diff --git a/gio/gkeyfilesettingsbackend.c b/gio/gkeyfilesettingsbackend.c=
=0D
+index a37978e83..580a0b0a1 100644=0D
+--- a/gio/gkeyfilesettingsbackend.c=0D
++++ b/gio/gkeyfilesettingsbackend.c=0D
+@@ -89,7 +89,8 @@ g_keyfile_settings_backend_keyfile_write (GKeyfileSettin=
gsBackend *kfsb)=0D
+ =0D
+   contents =3D g_key_file_to_data (kfsb->keyfile, &length, NULL);=0D
+   g_file_replace_contents (kfsb->file, contents, length, NULL, FALSE,=0D
+-                           G_FILE_CREATE_REPLACE_DESTINATION,=0D
++                           G_FILE_CREATE_REPLACE_DESTINATION |=0D
++                           G_FILE_CREATE_PRIVATE,=0D
+                            NULL, NULL, NULL);=0D
+ =0D
+   compute_checksum (kfsb->digest, contents, length);=0D
+@@ -640,7 +641,7 @@ g_keyfile_settings_backend_new (const gchar *filename,=
=0D
+ =0D
+   kfsb->file =3D g_file_new_for_path (filename);=0D
+   kfsb->dir =3D g_file_get_parent (kfsb->file);=0D
+-  g_file_make_directory_with_parents (kfsb->dir, NULL, NULL);=0D
++  g_mkdir_with_parents (g_file_peek_path (kfsb->dir), 0700);=0D
+ =0D
+   kfsb->file_monitor =3D g_file_monitor (kfsb->file, 0, NULL, NULL);=0D
+   kfsb->dir_monitor =3D g_file_monitor (kfsb->dir, 0, NULL, NULL);=0D
+-- =0D
+2.22.0=0D
+=0D
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.58.0.bb=0D
index f007596968..611abd8eb8 100644=0D
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb=0D
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb=0D
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.=
tar.xz \=0D
            file://CVE-2019-12450.patch \=0D
            file://CVE-2019-9633_p1.patch \=0D
            file://CVE-2019-9633_p2.patch \=0D
+           file://CVE-2019-13012.patch \=0D
            "=0D
 =0D
 SRC_URI_append_class-native =3D " file://relocate-modules.patch"=0D
-- =0D
2.22.0=0D


------------=_1565735437-29016-698
Content-Type: text/html
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body>
<h3>Signed-off-by: Kevin Weng &lt;t-keweng@microsoft.com&gt;</h3>
<pre>.../glib-2.0/glib-2.0/CVE-2019-13012.patch    | 47 +++++++++++++++++++
meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb |  1 +
2 files changed, 48 insertions(+)
create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch=
</pre>
<p>diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch b/=
meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch new file mode 1006=
44 index 0000000000..29c5d98402 --- /dev/null +++ b/meta/recipes-core/glib-=
2.0/glib-2.0/CVE-2019-13012.patch @@ -0,0 +1,47 @@ +From c7f7fd53780f8caebc=
cc903d61ffc21632b46a6c Mon Sep 17 00:00:00 2001 +From: Matthias Clasen &lt;=
mclasen@redhat.com&gt; +Date: Tue, 22 Jan 2019 13:26:31 -0500 +Subject: [PA=
TCH] keyfile settings: Use tighter permissions + +When creating directories=
, create them with 700 permissions, +instead of 777. + +Closes: #1658 + +Up=
stream-Status: Backport +[<a href=3D"https://u12060237.ct.sendgrid.net/wf/c=
lick?upn=3DZUEdHBk4v9DOmlXxaQIXsnGdThIumwxbeCM-2BExoUQb3xoFKw5ia4SQ7gfdvTfx=
mZ8uW8wNMPXLlzqfBPx5Spkg-3D-3D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeW=
xsyZzZlOtbMQm4wqVCgNIpo7dsW-2FzBSP60qI2GfklY0UAhXTU7-2BagK7GE0pY2gSbtzQgRWA=
ya5z5oXuJLBeFfOyIUWgwQYBvVRCFNERs3rRKhqg8nOzFaltX0WKbijIhhfyKGLbpCWM-2F8tTP=
NIjBerCdf2XROEWYDCcBqE9iPUdJJ-2BxBTKtJjW7pwDmIg8dkaNHbL0FwsRYKiW3MhLSe6-2By=
32FRq">https://gitlab.gnome.org/GNOME/glib/commit</a> +/5e4da714f00f6bfb2cc=
d6d73d61329c6f3a08429] + +CVE: CVE-2019-13012 + +Signed-off-by: Kevin Weng =
&lt;t-keweng@microsoft.com&gt; +--- + gio/gkeyfilesettingsbackend.c | 5 +++=
-- + 1 file changed, 3 insertions(+), 2 deletions(-) + +diff --git a/gio/gk=
eyfilesettingsbackend.c b/gio/gkeyfilesettingsbackend.c +index a37978e83..5=
80a0b0a1 100644 +--- a/gio/gkeyfilesettingsbackend.c ++++ b/gio/gkeyfileset=
tingsbackend.c +@@ -89,7 +89,8 @@ g_keyfile_settings_backend_keyfile_write =
(GKeyfileSettingsBackend *kfsb) + +   contents =3D g_key_file_to_data (kfsb=
-&gt;keyfile, &amp;length, NULL); +   g_file_replace_contents (kfsb-&gt;fil=
e, contents, length, NULL, FALSE, +-                           G_FILE_CREAT=
E_REPLACE_DESTINATION, ++                           G_FILE_CREATE_REPLACE_D=
ESTINATION | ++                           G_FILE_CREATE_PRIVATE, +         =
                   NULL, NULL, NULL); + +   compute_checksum (kfsb-&gt;dige=
st, contents, length); +@@ -640,7 +641,7 @@ g_keyfile_settings_backend_new =
(const gchar *filename, + +   kfsb-&gt;file =3D g_file_new_for_path (filena=
me); +   kfsb-&gt;dir =3D g_file_get_parent (kfsb-&gt;file); +-  g_file_mak=
e_directory_with_parents (kfsb-&gt;dir, NULL, NULL); ++  g_mkdir_with_paren=
ts (g_file_peek_path (kfsb-&gt;dir), 0700); + +   kfsb-&gt;file_monitor =3D=
 g_file_monitor (kfsb-&gt;file, 0, NULL, NULL); +   kfsb-&gt;dir_monitor =
=3D g_file_monitor (kfsb-&gt;dir, 0, NULL, NULL); +-- +2.22.0 + diff --git =
a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-core/glib-2.=
0/glib-2.0_2.58.0.bb index f007596968..611abd8eb8 100644 --- a/meta/recipes=
-core/glib-2.0/glib-2.0_2.58.0.bb +++ b/meta/recipes-core/glib-2.0/glib-2.0=
_2.58.0.bb @@ -17,6 +17,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_=
VER}/glib-${PV}.tar.xz \</p>
<pre>file://CVE-2019-12450.patch \
file://CVE-2019-9633_p1.patch \
file://CVE-2019-9633_p2.patch \</pre>
<p>+           <a href=3D"file://CVE-2019-13012.patch">file://CVE-2019-1301=
2.patch</a> \</p>
<pre>           "

SRC_URI_append_class-native =3D " file://relocate-modules.patch"</pre>
<p>&mdash; 2.22.0</p>

<img src=3D"https://u12060237.ct.sendgrid.net/wf/open?upn=3DTE0Kxc-2FihH-2B=
EaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FzBSP60qI2GfklY0U=
AhXTU7-2BagK7GE0pY2gSbtzQgRWB4AmDK-2FyXkRCDVOTR37H31U-2FrgapuX34FAlgC23YxOj=
-2BIubL7OKaPjwaZfTaWQKU9w6bNdrrhAfkhhfFQ4-2Bg4tq0lczYO8nXZDxtNj232J8nUInR4-=
2FVbHFXT8RHoXpP2iyAqH3XIXoU-2BK98B0E6sqo" alt=3D"" width=3D"1" height=3D"1"=
 border=3D"0" style=3D"height:1px !important;width:1px !important;border-wi=
dth:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-=
right:0 !important;margin-left:0 !important;padding-top:0 !important;paddin=
g-bottom:0 !important;padding-right:0 !important;padding-left:0 !important;=
"/>
</body></html>

------------=_1565735437-29016-698--
