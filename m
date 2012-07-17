Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nate.ewest@gmail.com>) id 1SrGFH-0002Hn-4u
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 00:27:55 +0200
Received: by wibhm2 with SMTP id hm2so3393037wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=hjXKXhcZ0r2zxjKiXKCgntWFTO/cK3u9Tx1ldVltctA=;
	b=k37SMzR5PswiX8dMDtGDXAPlYZgcf3hSef5jIos9ypenJs6z4sT0cjHxqeP1yp14TX
	nmc96CbkK9R75uAAVqbRxxnOn19FwX8utVl/gpmvEVFeG7JKSHClG+lTHjMZceM2Z/Rf
	jySIC3BS2KyCZ3BCQ1b0s5Kq7DMSjJ34fLzC9qiYONGEx0lVBNzkFHuMps/s3ZHjk8E4
	y5+4HCaw3l4UmS7Lw4J4tVVN24kuMavqpylTeXMHge3rfVKOWBv7nL6vyyovmWq28afc
	twUduKYglFTE98ivcUAqxrSaJf1QBUln7VRWl6+VUb5XdKGpa9lZnN7o3YRHFFFUdBBM
	4OTw==
MIME-Version: 1.0
Received: by 10.217.1.202 with SMTP id n52mr314028wes.21.1342563395400; Tue,
	17 Jul 2012 15:16:35 -0700 (PDT)
Sender: nate.ewest@gmail.com
Received: by 10.194.47.42 with HTTP; Tue, 17 Jul 2012 15:16:35 -0700 (PDT)
Date: Tue, 17 Jul 2012 18:16:35 -0400
X-Google-Sender-Auth: J0XZ9dyFApmS685Om15tzKCM-fc
Message-ID: <CACFtY++ekHacLd5VLvfEabKxkdTFxSzfa6oU+aRbS5br_PzDxA@mail.gmail.com>
From: Nathan West <nathan.west@okstate.edu>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] point prelink.conf to ${IMAGE_ROOTFS}
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
X-List-Received-Date: Tue, 17 Jul 2012 22:27:55 -0000
Content-Type: multipart/alternative; boundary=20cf301e2e7d45723e04c50de63c

--20cf301e2e7d45723e04c50de63c
Content-Type: text/plain; charset=ISO-8859-1

Hopefully I do this right. First time patching (ever! this is exciting :-) )

The --root option doesn't work and isn't documented anywhere I could find,
and without the ${IMAGE_ROOTFS} before the config file it was point to my
native /etc/prelink.conf (which doesn't exist and probably would be useful
if it did)

Be gentle if I screwed up!
-Nathan



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

--20cf301e2e7d45723e04c50de63c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)"><div>Hopefully I do this right. First=
 time patching (ever! this is exciting :-) )</div><div><br></div><div>The -=
-root option doesn&#39;t work and isn&#39;t documented anywhere I could fin=
d, and without the ${IMAGE_ROOTFS} before the config file it was point to m=
y native /etc/prelink.conf (which doesn&#39;t exist and probably would be u=
seful if it did)</div>
<div><br></div><div>Be gentle if I screwed up!</div><div>-Nathan</div></div=
><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)"><br></div><div style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(25=
5,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)"><br></div><div style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-col=
or:rgb(255,255,255)">
---</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:13px;background-color:rgb(255,255,255)">=A0meta/classes/image-prelin=
k.bbclass | =A0 =A02 +-</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
=A01 file changed, 1 insertion(+), 1 deletion(-)</div><div style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:r=
gb(255,255,255)"><br></div><div style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelin=
k.bbclass</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:13px;background-color:rgb(255,255,255)">index 53ef47e..2d62f03=
 100644</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">--- a/meta/classes/image-prelink.bbcl=
ass</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:13px;background-color:rgb(255,255,255)">
+++ b/meta/classes/image-prelink.bbclass</div><div style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,2=
55,255)">@@ -21,7 +21,7 @@ prelink_image () {</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">
=A0<span style=3D"white-space:pre-wrap">	</span>fi</div><div style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color=
:rgb(255,255,255)">=A0</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
=A0<span style=3D"white-space:pre-wrap">	</span># prelink!</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">-<span style=3D"white-space:pre-wrap">	</span>$=
{STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -=
N -c ${sysconfdir}/prelink.conf</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">+<span style=3D"white-space:pre-wrap"=
>	</span>${STAGING_DIR_NATIVE}${sbindir_native}/prelink ${IMAGE_ROOTFS} -am=
R -N -c ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">=A0</div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,=
255,255)">
=A0<span style=3D"white-space:pre-wrap">	</span># Remove the prelink.conf i=
f we had to add it.</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)">=A0<span sty=
le=3D"white-space:pre-wrap">	</span>if [ &quot;$dummy_prelink_conf&quot; =
=3D &quot;true&quot; ]; then</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">--=A0</div><div style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(25=
5,255,255)">
1.7.9.5</div>

--20cf301e2e7d45723e04c50de63c--
