Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nate.ewest@gmail.com>) id 1SrHl6-0005ej-HT
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 02:04:52 +0200
Received: by wibhm11 with SMTP id hm11so774708wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 16:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:date:message-id:subject:from:to:content-type;
	bh=cAa5fqnD4c/IaYvUsGKlTGWvGdG3UfOw9bUAxIijPzM=;
	b=YwShGXMDULWbLe1A2M6GaaNpCZ499SXVAa839YUNSi3H2mJsmly20fvVkfCtJjbsei
	4aVf92BKyb+IcLvhIjTIzGVoU984GsQrOlmkXqL0/0qfTrlXvF2z+aeAO+E9anxCu0DY
	I9aALGB04ZhS2hMrLaCIF0twZm3ztkTEQEMQBbaVGk3inQE2/Tqq9Nvoib4RDHEoFeYV
	7b4vVOugz/ozgbrGj/ZuxUAFAYJv4SDtPaX9aVMDVWqsYiCg4Z8w40KNhz5Rx4CIWyqj
	tfjHc2l7Tptyavd+52sSqjwQTon/YwtgfQI0ntbi6OgfzWxvJQxKxb8OXqqqJmi+RhlB
	H9qA==
MIME-Version: 1.0
Received: by 10.216.209.8 with SMTP id r8mr488098weo.51.1342569212670; Tue, 17
	Jul 2012 16:53:32 -0700 (PDT)
Received: by 10.194.47.42 with HTTP; Tue, 17 Jul 2012 16:53:32 -0700 (PDT)
Date: Tue, 17 Jul 2012 19:53:32 -0400
Message-ID: <CACFtY+JeSFdNbudJmkRp9wsA6Spvc-O7MM7bMA+Nr2fz_ticSg@mail.gmail.com>
From: Nathan West <nate.ewest@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH] meta/classes/image-prelink.bbclass point prelink config to ${IMAGE_ROOTFS} and remove --root option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: nateewest@gmail.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 18 Jul 2012 00:04:52 -0000
Content-Type: multipart/alternative; boundary=0016e6d99ee001f3db04c50f4109

--0016e6d99ee001f3db04c50f4109
Content-Type: text/plain; charset=ISO-8859-1

The --root option doesn't work and isn't documented anywhere I could find.
In a previous
line the config is created in ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf,
without the
${IMAGE_ROOTFS} we point to /etc/prelink.conf (on the native machine).

Signed-off-by: westn <nathan.west@ieee.org>
---
 meta/classes/image-prelink.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-prelink.bbclass
b/meta/classes/image-prelink.bbclass
index 53ef47e..2d62f03 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -21,7 +21,7 @@ prelink_image () {
  fi

  # prelink!
- ${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS}
-amR -N -c ${sysconfdir}/prelink.conf
+ ${STAGING_DIR_NATIVE}${sbindir_native}/prelink ${IMAGE_ROOTFS} -amR -N -c
${IMAGE_ROOTFS}${sysconfdir}/prelink.conf

  # Remove the prelink.conf if we had to add it.
  if [ "$dummy_prelink_conf" = "true" ]; then
-- 
1.7.9.5

--0016e6d99ee001f3db04c50f4109
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-ser=
if"><div>The --root option doesn&#39;t work and isn&#39;t documented anywhe=
re I could find. In a previous=A0</div><div>line the config is created in $=
{IMAGE_ROOTFS}${sysconfdir}/prelink.conf, without the=A0</div>
<div>${IMAGE_ROOTFS} we point to /etc/prelink.conf (on the native machine).=
</div></div><div style=3D"color:rgb(34,34,34);font-size:13px;font-family:ar=
ial,sans-serif">
<br></div><div><font color=3D"#222222" face=3D"arial, sans-serif">Signed-of=
f-by: westn &lt;<a href=3D"mailto:nathan.west@ieee.org">nathan.west@ieee.or=
g</a>&gt;=A0</font></div><div style=3D"color:rgb(34,34,34);font-size:13px;f=
ont-family:arial,sans-serif">

---</div><div style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial=
,sans-serif">=A0meta/classes/image-prelink.bbclass | =A0 =A02 +-</div><div =
style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">
=A01 file changed, 1 insertion(+), 1 deletion(-)</div><div style=3D"color:r=
gb(34,34,34);font-size:13px;font-family:arial,sans-serif"><br></div><div st=
yle=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">
diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelin=
k.bbclass</div><div style=3D"color:rgb(34,34,34);font-size:13px;font-family=
:arial,sans-serif">index 53ef47e..2d62f03 100644</div>
<div style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-ser=
if">--- a/meta/classes/image-prelink.bbclass</div><div style=3D"color:rgb(3=
4,34,34);font-size:13px;font-family:arial,sans-serif">
+++ b/meta/classes/image-prelink.bbclass</div><div style=3D"color:rgb(34,34=
,34);font-size:13px;font-family:arial,sans-serif">@@ -21,7 +21,7 @@ prelink=
_image () {</div><div style=3D"color:rgb(34,34,34);font-size:13px;font-fami=
ly:arial,sans-serif">

=A0<span style=3D"white-space:pre-wrap">	</span>fi</div><div style=3D"color=
:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">=A0</div><div s=
tyle=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">
=A0<span style=3D"white-space:pre-wrap">	</span># prelink!</div><div style=
=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-serif">-<span=
 style=3D"white-space:pre-wrap">	</span>${STAGING_DIR_NATIVE}${sbindir_nati=
ve}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf</d=
iv>

<div style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-ser=
if">+<span style=3D"white-space:pre-wrap">	</span>${STAGING_DIR_NATIVE}${sb=
indir_native}/prelink ${IMAGE_ROOTFS} -amR -N -c ${IMAGE_ROOTFS}${sysconfdi=
r}/prelink.conf</div>

<div style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-ser=
if">=A0</div><div style=3D"color:rgb(34,34,34);font-size:13px;font-family:a=
rial,sans-serif">
=A0<span style=3D"white-space:pre-wrap">	</span># Remove the prelink.conf i=
f we had to add it.</div><div style=3D"color:rgb(34,34,34);font-size:13px;f=
ont-family:arial,sans-serif">=A0<span style=3D"white-space:pre-wrap">	</spa=
n>if [ &quot;$dummy_prelink_conf&quot; =3D &quot;true&quot; ]; then</div>

<div style=3D"color:rgb(34,34,34);font-size:13px;font-family:arial,sans-ser=
if">--=A0</div><div style=3D"color:rgb(34,34,34);font-size:13px;font-family=
:arial,sans-serif">
1.7.9.5</div>

--0016e6d99ee001f3db04c50f4109--
