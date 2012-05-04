Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SQNAO-0005KJ-D5
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 20:23:44 +0200
Received: by wgbdr1 with SMTP id dr1so2588862wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 11:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=xpyN8uZZYGkCrVQoJ0iXZxbEJxDp/UP7zbUvx4WVIao=;
	b=mJCM5DzbutX7jXSPU3LYmRzcJxxam3GGGgrVzQCs9S8/N+q3j2zGi+yi9smnmWdUEs
	gyeA7vDKmpch6LtEat477s6I8b4vZBP4W1vvtFFi9HU6ycj/0tIEI44TlSIssf8cyTc+
	5tHbFy2JpshxIVptbKf+aOxVMsDTtp8AJ5ZWqIrG0waT6KFwU/FijKEiE8lFRvDVJTet
	rhtRibs1KA5u1hCGYGGWyGXlI/Q8AKJnQNrI5ibK8XSzMb4yDhUm+1XqmhQjftSM32ha
	Of0E1aLzk8f172JGoTpg/dmwJkncJlzbC7XM97F7gllEnndoX5DH4mWejdYTPshHfTmk
	6RhA==
Received: by 10.180.89.9 with SMTP id bk9mr15142149wib.11.1336155237612;
	Fri, 04 May 2012 11:13:57 -0700 (PDT)
Received: from [192.168.1.34] (5.Red-83-49-41.dynamicIP.rima-tde.net.
	[83.49.41.5])
	by mx.google.com with ESMTPS id l5sm2778512wia.11.2012.05.04.11.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 11:13:56 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1257)
Date: Fri, 4 May 2012 20:09:39 +0200
In-Reply-To: <0E974700-0AC5-4D2D-8CED-9B50FFC36854@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
	<20120504080242.GD3163@jama.jama.net>
	<E4CB1C49-5AAE-4A6D-9218-83F2ED109A08@gmail.com>
	<0E974700-0AC5-4D2D-8CED-9B50FFC36854@dominion.thruhere.net>
Message-Id: <BEB5EFF4-B2E1-40DC-A12F-60ACB097C4E3@gmail.com>
X-Mailer: Apple Mail (2.1257)
Subject: Re: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 18:23:44 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FD1A54DB-D6E2-40AF-851A-608935D15A89"

--Apple-Mail=_FD1A54DB-D6E2-40AF-851A-608935D15A89
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Koen,

On May 4, 2012, at 11:46 AM, Koen Kooi wrote:

> When doing things like that you need to bump PR and fixup all =
dependents like tasks and images to ensure upgrade paths.

I bumped the PR, but still get the warning message. How is the warning =
for this specific package linked to its dependents. The warning looks =
localized to the lighttpd_1.4.30.bb recipe.

If you can tell me how to fix it, I'll do it and send a patch.

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb =
b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.
index 3ae3867..71ae64c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} +=3D " \
                lighttpd-module-staticfile \
 "
=20
-PR =3D "r0"
+PR =3D "r1"
=20
 SRC_URI =3D =
"http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.b=
z2 \
         file://index.html.lighttpd \
@@ -51,6 +51,9 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/index.html.lighttpd =
${D}/www/pages/index.html
 }
=20
+SYSTEMD_PACKAGES =3D "${PN}-systemd"
+SYSTEMD_SERVICE =3D "lighttpd.service"
+
 FILES_${PN} +=3D "${sysconfdir} /www"
=20
 CONFFILES_${PN} =3D "${sysconfdir}/lighttpd.conf"

Elvis Dowson


--Apple-Mail=_FD1A54DB-D6E2-40AF-851A-608935D15A89
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">Hi =
Koen,<div><br><div><div>On May 4, 2012, at 11:46 AM, Koen Kooi =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div>When doing things like that you need to bump PR and =
fixup all dependents like tasks and images to ensure upgrade =
paths.<br></div></blockquote><br></div><div>I bumped the PR, but still =
get the warning message. How is the warning for this specific package =
linked to its dependents. The warning looks localized to the =
lighttpd_1.4.30.bb recipe.</div><div><br></div><div>If you can tell me =
how to fix it, I'll do it and send a =
patch.</div><div><br></div><div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">diff --git =
a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb =
b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">index =
3ae3867..71ae64c 100644</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">--- =
a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb</font></div><div><font=
 class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">+++ =
b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb</font></div><div><font=
 class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">@@ -16,7 +16,7 @@ =
RDEPENDS_${PN} +=3D " \</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; lighttpd-module-staticfile \</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp;"</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">&nbsp;</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">-PR =3D =
"r0"</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">+PR =3D "r1"</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">&nbsp;</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp;SRC_URI =3D =
"<a =
href=3D"http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV=
}.tar.bz2">http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-$=
{PV}.tar.bz2</a> \</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a =
href=3D"file:///index.html.lighttpd">file://index.html.lighttpd</a> =
\</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">@@ -51,6 +51,9 @@ do_install_append() =
{</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; &nbsp; &nbsp;install -m 0644 =
${WORKDIR}/index.html.lighttpd =
${D}/www/pages/index.html</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp;}</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">&nbsp;</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">+SYSTEMD_PACKAGES =
=3D "${PN}-systemd"</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">+SYSTEMD_SERVICE =3D =
"lighttpd.service"</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">+</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp;FILES_${PN} =
+=3D "${sysconfdir} /www"</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp;</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">&nbsp;CONFFILES_${PN} =3D =
"${sysconfdir}/lighttpd.conf"</font></div><div><br></div><div>Elvis =
Dowson</div><div><br></div></div></div></body></html>=

--Apple-Mail=_FD1A54DB-D6E2-40AF-851A-608935D15A89--
