Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RAkTS-00034S-4G
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 17:30:34 +0200
Received: by gyg8 with SMTP id 8so3469762gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 08:24:59 -0700 (PDT)
Received: by 10.236.187.70 with SMTP id x46mr341800yhm.71.1317655499722;
	Mon, 03 Oct 2011 08:24:59 -0700 (PDT)
Received: from [10.0.1.3] (adsl-68-88-70-1.dsl.rcsntx.swbell.net. [68.88.70.1])
	by mx.google.com with ESMTPS id r30sm15962011yhj.20.2011.10.03.08.24.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 08:24:58 -0700 (PDT)
References: <201110031603.31007.schnitzeltony@gmx.de>
In-Reply-To: <201110031603.31007.schnitzeltony@gmx.de>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <C4A96559-DE0F-4549-8A49-909A168B8A66@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 3 Oct 2011 10:24:55 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake webkit-gtk fails with clean temp dir
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
X-List-Received-Date: Mon, 03 Oct 2011 15:30:34 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



Op 3 okt. 2011 om 09:03 heeft Andreas M=C3=BCller <schnitzeltony@gmx.de> het=
 volgende geschreven:

> Have pulled yesterday all the angstom layers (oe-core / meta-oe ..) and de=
leted all files from temp build dir. For
>=20
> bitbake webkit-gtk=20
>=20
> I get
>=20
> NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Started
> ERROR: Function 'do_compile' failed (see /home/Superandy/tmp/oe-core-eglib=
c/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/temp/log.=
do_compile.13377 for further information)
> ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-eglibc/wo=
rk/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/temp/log.do_c=
ompile.13377
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linu=
x', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | + cd /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnuea=
bi/webkit-gtk-1.5.1+svnr90727-r0/
> | + do_compile
> | + base_do_compile
> | + '[' -e Makefile -o -e makefile ']'
> | + oe_runmake
> | + '[' xmake =3D x ']'
> | + bbnote make -j 4
> | + echo 'NOTE: make -j 4'
> | NOTE: make -j 4
> | + make -j 4
> | /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/bindi=
ngs/scripts/generate-bindings.pl --include ./Source/WebCore/dom --include ./=
Source/WebCore/html --include ./Source/WebCore/css --include ./Source/WebCor=
e/page --include ./Source/WebCore/xml --include ./Source/WebCore/svg --outpu=
tDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=3D1 ENABLE_CHANNE=
L_MESSAGING=3D1 ENABLE_METER_TAG=3D1 ENABLE_PROGRESS_TAG=3D1 ENABLE_JAVASCRI=
PT_DEBUGGER=3D1 ENABLE_OFFLINE_WEB_APPLICATIONS=3D1 ENABLE_DATABASE=3D1 ENAB=
LE_DATALIST=3D1 ENABLE_EVENTSOURCE=3D1 ENABLE_DOM_STORAGE=3D1 ENABLE_VIDEO=3D=
1 ENABLE_FULLSCREEN_API=3D1 ENABLE_VIDEO_TRACK=3D1 ENABLE_XPATH=3D1 ENABLE_X=
SLT=3D1 ENABLE_WORKERS=3D1 ENABLE_SHARED_WORKERS=3D1 ENABLE_FILTERS=3D1 ENAB=
LE_WEB_SOCKETS=3D1 ENABLE_BLOB=3D1" --generator GObject ./Source/WebCore/css=
/CSSRule.idl
> | /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/bindi=
ngs/scripts/generate-bindings.pl --include ./Source/WebCore/dom --include ./=
Source/WebCore/html --include ./Source/WebCore/css --include ./Source/WebCor=
e/page --include ./Source/WebCore/xml --include ./Source/WebCore/svg --outpu=
tDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=3D1 ENABLE_CHANNE=
L_MESSAGING=3D1 ENABLE_METER_TAG=3D1 ENABLE_PROGRESS_TAG=3D1 ENABLE_JAVASCRI=
PT_DEBUGGER=3D1 ENABLE_OFFLINE_WEB_APPLICATIONS=3D1 ENABLE_DATABASE=3D1 ENAB=
LE_DATALIST=3D1 ENABLE_EVENTSOURCE=3D1 ENABLE_DOM_STORAGE=3D1 ENABLE_VIDEO=3D=
1 ENABLE_FULLSCREEN_API=3D1 ENABLE_VIDEO_TRACK=3D1 ENABLE_XPATH=3D1 ENABLE_X=
SLT=3D1 ENABLE_WORKERS=3D1 ENABLE_SHARED_WORKERS=3D1 ENABLE_FILTERS=3D1 ENAB=
LE_WEB_SOCKETS=3D1 ENABLE_BLOB=3D1" --generator GObject ./Source/WebCore/css=
/CSSRuleList.idl
> | /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/bindi=
ngs/scripts/generate-bindings.pl --include ./Source/WebCore/dom --include ./=
Source/WebCore/html --include ./Source/WebCore/css --include ./Source/WebCor=
e/page --include ./Source/WebCore/xml --include ./Source/WebCore/svg --outpu=
tDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=3D1 ENABLE_CHANNE=
L_MESSAGING=3D1 ENABLE_METER_TAG=3D1 ENABLE_PROGRESS_TAG=3D1 ENABLE_JAVASCRI=
PT_DEBUGGER=3D1 ENABLE_OFFLINE_WEB_APPLICATIONS=3D1 ENABLE_DATABASE=3D1 ENAB=
LE_DATALIST=3D1 ENABLE_EVENTSOURCE=3D1 ENABLE_DOM_STORAGE=3D1 ENABLE_VIDEO=3D=
1 ENABLE_FULLSCREEN_API=3D1 ENABLE_VIDEO_TRACK=3D1 ENABLE_XPATH=3D1 ENABLE_X=
SLT=3D1 ENABLE_WORKERS=3D1 ENABLE_SHARED_WORKERS=3D1 ENABLE_FILTERS=3D1 ENAB=
LE_WEB_SOCKETS=3D1 ENABLE_BLOB=3D1" --generator GObject ./Source/WebCore/css=
/CSSStyleDeclaration.idl
> | /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/bindi=
ngs/scripts/generate-bindings.pl --include ./Source/WebCore/dom --include ./=
Source/WebCore/html --include ./Source/WebCore/css --include ./Source/WebCor=
e/page --include ./Source/WebCore/xml --include ./Source/WebCore/svg --outpu=
tDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=3D1 ENABLE_CHANNE=
L_MESSAGING=3D1 ENABLE_METER_TAG=3D1 ENABLE_PROGRESS_TAG=3D1 ENABLE_JAVASCRI=
PT_DEBUGGER=3D1 ENABLE_OFFLINE_WEB_APPLICATIONS=3D1 ENABLE_DATABASE=3D1 ENAB=
LE_DATALIST=3D1 ENABLE_EVENTSOURCE=3D1 ENABLE_DOM_STORAGE=3D1 ENABLE_VIDEO=3D=
1 ENABLE_FULLSCREEN_API=3D1 ENABLE_VIDEO_TRACK=3D1 ENABLE_XPATH=3D1 ENABLE_X=
SLT=3D1 ENABLE_WORKERS=3D1 ENABLE_SHARED_WORKERS=3D1 ENABLE_FILTERS=3D1 ENAB=
LE_WEB_SOCKETS=3D1 ENABLE_BLOB=3D1" --generator GObject ./Source/WebCore/css=
/CSSStyleSheet.idl
> | Unquoted string "attributes" may clash with future reserved word at Sour=
ce/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
> | Unquoted string "attributes" may clash with future reserved word at Sour=
ce/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
> | Unquoted string "attributes" may clash with future reserved word at Sour=
ce/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
> | Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSRuleListPrivate.h=
 for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line=
 1122.
> | Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSStyleSheetPrivate=
.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm li=
ne 1122.
> | make: *** [DerivedSources/webkit/WebKitDOMCSSRuleList.h] Error 2
> | make: *** Waiting for unfinished jobs....
> | Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSStyleDeclarationP=
rivate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject=
.pm line 1122.
> | make: *** [DerivedSources/webkit/WebKitDOMCSSStyleSheet.h] Error 2
> | make: *** [DerivedSources/webkit/WebKitDOMCSSStyleDeclaration.h] Error 2=

> | Unquoted string "attributes" may clash with future reserved word at Sour=
ce/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
> | Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSRulePrivate.h for=
 writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 112=
2.
> | make: *** [DerivedSources/webkit/WebKitDOMCSSRule.h] Error 2
> | + die 'oe_runmake failed'
> | + bbfatal 'oe_runmake failed'
> | + echo 'ERROR: oe_runmake failed'
> | ERROR: oe_runmake failed
> | + exit 1
> | ERROR: Function 'do_compile' failed (see /home/Superandy/tmp/oe-core-egl=
ibc/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/temp/lo=
g.do_compile.13377 for further information)
> NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Failed
> ERROR: Task 7 (/home/Superandy/data/oe-core/sources/openembedded-core/meta=
/recipes-sato/webkit/webkit-gtk_svn.bb, do_compile) failed with exit code '1=
'
>=20
> ideas what causes this?

no idea, but I get the same error



>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


