Return-Path: <d.falko.work@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 448106E6B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 08:35:32 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x7so5176371vkf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 01:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=+529nc8q5NHxBMVKxNayqEsaDN3tmzGml9tda6vxiTY=;
	b=g0QXHL/jILm1mAj/YYQTjbw3KSdc++TRPwuwCF0a/Oq6q/eD27yZBtiMBsm9BR/tlK
	MqzO6GR8lwnKPCW4rZ5swHksDiuXXRp63GTeojzk7XEWR2We+R9H+joDJ3dB1Y6eUKNB
	fKZPb92PIKe47c27P9IWQk+Kn2RtZQAHotR1Io7jYb4L6Mlv9sH4MYNKQccs+42FnK0E
	Q7K2QaymB7LJmvX964m5uCYTdvulH64hj4JVloV+J4+9tgjtxnNogpivEpX7gJT4o95k
	YTFXB2zG1MzL7VygilwQkOSJZPDnot6eczlOffmPWR0XzQIqo5CjBp37nnCooEPr0V2b
	+6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=+529nc8q5NHxBMVKxNayqEsaDN3tmzGml9tda6vxiTY=;
	b=DQGaBUqB1qFPS/k/Lqy2e2dOQyYTuYNwAhZqauxuV+8u0bN4mGD3EEJNzTjvEHvrNl
	Re3YTtuRkUHebYb4I1kL9n/BtuYTnFjFCFkUt8F/qH0m/Si08SkUgnkABwLLJSqXoQvI
	O9iJnML2+J4t0mcOfN0WDHOZvT7E4WH2vAQJ6u0sN/V9yg6MPCJdO2EHM9xg8liSsPKn
	c4NwxKPcNh72xEy+7TY/6sHFHC9PAOLKP1mILEPh9vZXTmPPbS92I9RRc6yJo75n27Ax
	eyyPePM4z9WXl2NDzgmT8vIpKfYaw8ZAcERWgUKdH1j3drq9mkEQoPiLDt12KEBhSao0
	Oiyg==
X-Gm-Message-State: ALyK8tIaD/khOBur6Iu3Af3U9sxZCEXlpdOgDHBRK6tm1XYJRAuOKfXaIEerC8eOz0i790K7UdwUE7RvL49Fqw==
X-Received: by 10.159.35.19 with SMTP id 19mr4303000uae.31.1465461333411; Thu,
	09 Jun 2016 01:35:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.42.129 with HTTP; Thu, 9 Jun 2016 01:35:33 -0700 (PDT)
From: Dmitriy Falko <d.falko.work@gmail.com>
Date: Thu, 9 Jun 2016 11:35:33 +0300
Message-ID: <CAG+FGgfFMYHhcHp_PcJw+dk6LDj8CzC4UjRrc7aLAZAhEq0ChA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Avahi, add extra path to GIR_EXTRA_LIBS_PATH
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
X-List-Received-Date: Thu, 09 Jun 2016 08:35:34 -0000
Content-Type: multipart/alternative; boundary=001a113d15f835cd2a0534d44ed5

--001a113d15f835cd2a0534d44ed5
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Dmitriy Falko <d.falko.work@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc
b/meta/recipes-connectivity/avahi/avahi.inc
index 81aad79..340b3e6 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -71,7 +71,7 @@ do_configure_prepend() {
 }

 do_compile_prepend() {
-    export
GIR_EXTRA_LIBS_PATH="${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
+    export
GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
 }

 PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client
avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
-- 
2.7.4

--001a113d15f835cd2a0534d44ed5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Signed-off-by: Dmitriy Falko &lt;<a hr=
ef=3D"mailto:d.falko.work@gmail.com">d.falko.work@gmail.com</a>&gt;</div><d=
iv>---</div><div>=C2=A0meta/recipes-connectivity/avahi/avahi.inc | 2 +-</di=
v><div>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)</div><div><br></=
div><div>diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/reci=
pes-connectivity/avahi/avahi.inc</div><div>index 81aad79..340b3e6 100644</d=
iv><div>--- a/meta/recipes-connectivity/avahi/avahi.inc</div><div>+++ b/met=
a/recipes-connectivity/avahi/avahi.inc</div><div>@@ -71,7 +71,7 @@ do_confi=
gure_prepend() {</div><div>=C2=A0}</div><div>=C2=A0</div><div>=C2=A0do_comp=
ile_prepend() {</div><div>- =C2=A0 =C2=A0export GIR_EXTRA_LIBS_PATH=3D&quot=
;${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs&quot=
;</div><div>+ =C2=A0 =C2=A0export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/avahi-go=
bject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib=
/.libs&quot;</div><div>=C2=A0}</div><div>=C2=A0</div><div>=C2=A0PACKAGES =
=3D+ &quot;avahi-daemon libavahi-common libavahi-core libavahi-client avahi=
-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils&quot;</div><d=
iv>--=C2=A0</div><div>2.7.4</div></div>

--001a113d15f835cd2a0534d44ed5--
