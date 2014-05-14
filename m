Return-Path: <oram.embedded@gmail.com>
Received: from mail-yk0-f169.google.com (unknown [209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id E37AB6098B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 02:10:19 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 200so1056395ykr.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 19:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=2e/8fhm5Ecej9rQ1mtBJSueMrqD3KRvqyujf5vnLW60=;
	b=BbBzGsX48vCHLDuipyijhwUMFkSnLBu7yglDhRvtgbDfGo1auNSISJ4a1COpMFDOgf
	I6i818S4qwmRIP9jL7vEK1iw9X0D9D6/CVBgSzEjGSdlog1mQQEwl9RwW0t2c742vKiP
	g4VqRapsZB3uZq0X85H5OH+wGJiW4pC3jb9lEA8+EYux4ervrH0n+Y34VxeoMUuDODoZ
	mXIPSGSxCLqc9osMQfEd2hlP+ozCJj9se3FZ+pK0l4L4XjZAyb8d1FS5ATrCWorA2okh
	4s4tnun+lQAA22kceWK9N1oOC+zjjd/EJDFZACR+J2M6t5BOCxWX3goOCYzan3eMFkZM
	9QHw==
MIME-Version: 1.0
X-Received: by 10.236.119.99 with SMTP id m63mr801048yhh.65.1400033420156;
	Tue, 13 May 2014 19:10:20 -0700 (PDT)
Sender: oram.embedded@gmail.com
Received: by 10.170.229.84 with HTTP; Tue, 13 May 2014 19:10:20 -0700 (PDT)
Date: Wed, 14 May 2014 14:10:20 +1200
X-Google-Sender-Auth: XKRLOsIEzVC-ayhhFXgetyv5Ydk
Message-ID: <CAGw0TDMuODtcF6P-DFDsGg3d4Vuvgu0nuHG5muAFDBuO=6ZDoA@mail.gmail.com>
From: Charles Oram <charles@oram.co.nz>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe] [PATCH] libmtp_1.1.5.bb : Fix 'Makefile.am: No such file or directory' build error.
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
X-List-Received-Date: Wed, 14 May 2014 02:10:24 -0000
Content-Type: multipart/alternative; boundary=20cf3011e287aea84f04f952ae3f

--20cf3011e287aea84f04f952ae3f
Content-Type: text/plain; charset=UTF-8

libmtp_1.1.5.bb : Fix "Makefile.am: No such file or directory" build error.

skip_udev_rules_generation() needs to reference Makefile.am in the recipe
source directory.

Signed-off-by: Charles Oram <charles at oram.co.nz
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>>

---
 meta-oe/recipes-connectivity/
libmtp/libmtp_1.1.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bbb/meta-oe/recipes-connectivity/libmtp/
libmtp_1.1.5.bb
index f4ea800..e164f49 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -29,7 +29,7 @@ do_unpack[vardeps] += "skip_udev_rules_generation"
 do_unpack[postfuncs] += "skip_udev_rules_generation"

 skip_udev_rules_generation () {
-       sed -i -e '/^noinst_DATA=/,/util\/mtp-hotplug -H/d' Makefile.am
+       sed -i -e '/^noinst_DATA=/,/util\/mtp-hotplug -H/d' ${S}/Makefile.am
        cp ${WORKDIR}/69-libmtp.rules ${S}/
 }


--
1.7.10.4

--20cf3011e287aea84f04f952ae3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font><span style=3D"font-family:arial,helvetica,sans-seri=
f"><a href=3D"http://libmtp_1.1.5.bb">libmtp_1.1.5.bb</a> : Fix &quot;Makef=
ile.am: No such file or directory&quot; build error.<br><br>skip_udev_rules=
_generation() needs to reference Makefile.am in the recipe source directory=
.<br>
<br></span></font><pre><font><span style=3D"font-family:arial,helvetica,san=
s-serif">Signed-off-by: Charles Oram &lt;<a href=3D"http://lists.openembedd=
ed.org/mailman/listinfo/openembedded-core">charles at oram.co.nz</a>&gt;</s=
pan></font><br>
</pre>---<br>
=C2=A0meta-oe/recipes-connectivity/<div id=3D":27j" class=3D"">libmtp/<a hr=
ef=3D"http://libmtp_1.1.5.bb" target=3D"_blank">libmtp_1.1.5.bb</a> | =C2=
=A0 =C2=A02 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/libmtp/<a href=3D"http://libmtp_1=
.1.5.bb" target=3D"_blank">libmtp_1.1.5.bb</a> b/meta-oe/recipes-connectivi=
ty/libmtp/<a href=3D"http://libmtp_1.1.5.bb" target=3D"_blank">libmtp_1.1.5=
.bb</a><br>

index f4ea800..e164f49 100644<br>
--- a/meta-oe/recipes-connectivity/libmtp/<a href=3D"http://libmtp_1.1.5.bb=
" target=3D"_blank">libmtp_1.1.5.bb</a><br>
+++ b/meta-oe/recipes-connectivity/libmtp/<a href=3D"http://libmtp_1.1.5.bb=
" target=3D"_blank">libmtp_1.1.5.bb</a><br>
@@ -29,7 +29,7 @@ do_unpack[vardeps] +=3D &quot;skip_udev_rules_generation&=
quot;<br>
=C2=A0do_unpack[postfuncs] +=3D &quot;skip_udev_rules_generation&quot;<br>
<br>
=C2=A0skip_udev_rules_generation () {<br>
- =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/^noinst_DATA=3D/,/util\/mtp-hotplug =
-H/d&#39; Makefile.am<br>
+ =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/^noinst_DATA=3D/,/util\/mtp-hotplug =
-H/d&#39; ${S}/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/69-libmtp.rules ${S}/<br>
=C2=A0}<div class=3D""><div id=3D":27c" class=3D"" tabindex=3D"0"><img clas=
s=3D"" src=3D"https://mail.google.com/mail/u/0/images/cleardot.gif"></div><=
/div><div class=3D""><br>
</div><span class=3D""><font color=3D"#888888"><br>
--<br>
1.7.10.4</font></span></div><br></div>

--20cf3011e287aea84f04f952ae3f--
