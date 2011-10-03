Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RAj8h-0007nU-N5
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 16:05:03 +0200
Received: (qmail invoked by alias); 03 Oct 2011 13:59:31 -0000
Received: from p5B0A2BEE.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.43.238]
	by mail.gmx.net (mp007) with SMTP; 03 Oct 2011 15:59:31 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19ydWxOvvByeWkBCVUcsaGfSMWUDAeCGv4VL4JINV
	fIdwKWXhX/+bpz
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 3 Oct 2011 16:03:30 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-96.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201110031603.31007.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: bitbake webkit-gtk fails with clean temp dir
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
X-List-Received-Date: Mon, 03 Oct 2011 14:05:03 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Have pulled yesterday all the angstom layers (oe-core / meta-oe ..) and deleted all files from temp build dir. For

bitbake webkit-gtk 

I get

NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Started
ERROR: Function 'do_compile' failed (see /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/temp/log.do_compile.13377 for further information)
ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/temp/log.do_compile.13377
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| + cd /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile ']'
| + oe_runmake
| + '[' xmake = x ']'
| + bbnote make -j 4
| + echo 'NOTE: make -j 4'
| NOTE: make -j 4
| + make -j 4
| /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/bindings/scripts/generate-bindings.pl --include ./Source/WebCore/dom --include ./Source/WebCore/html --include ./Source/WebCore/css --include ./Source/WebCore/page --include ./Source/WebCore/xml --include ./Source/WebCore/svg --outputDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=1 ENABLE_CHANNEL_MESSAGING=1 ENABLE_METER_TAG=1 ENABLE_PROGRESS_TAG=1 ENABLE_JAVASCRIPT_DEBUGGER=1 ENABLE_OFFLINE_WEB_APPLICATIONS=1 ENABLE_DATABASE=1 ENABLE_DATALIST=1 ENABLE_EVENTSOURCE=1 ENABLE_DOM_STORAGE=1 ENABLE_VIDEO=1 ENABLE_FULLSCREEN_API=1 ENABLE_VIDEO_TRACK=1 ENABLE_XPATH=1 ENABLE_XSLT=1 ENABLE_WORKERS=1 ENABLE_SHARED_WORKERS=1 ENABLE_FILTERS=1 ENABLE_WEB_SOCKETS=1 ENABLE_BLOB=1" --generator GObject ./Source/WebCore/css/CSSRule.idl
| /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/bindings/scripts/generate-bindings.pl --include ./Source/WebCore/dom --include ./Source/WebCore/html --include ./Source/WebCore/css --include ./Source/WebCore/page --include ./Source/WebCore/xml --include ./Source/WebCore/svg --outputDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=1 ENABLE_CHANNEL_MESSAGING=1 ENABLE_METER_TAG=1 ENABLE_PROGRESS_TAG=1 ENABLE_JAVASCRIPT_DEBUGGER=1 ENABLE_OFFLINE_WEB_APPLICATIONS=1 ENABLE_DATABASE=1 ENABLE_DATALIST=1 ENABLE_EVENTSOURCE=1 ENABLE_DOM_STORAGE=1 ENABLE_VIDEO=1 ENABLE_FULLSCREEN_API=1 ENABLE_VIDEO_TRACK=1 ENABLE_XPATH=1 ENABLE_XSLT=1 ENABLE_WORKERS=1 ENABLE_SHARED_WORKERS=1 ENABLE_FILTERS=1 ENABLE_WEB_SOCKETS=1 ENABLE_BLOB=1" --generator GObject ./Source/WebCore/css/CSSRuleList.idl
| /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/bindings/scripts/generate-bindings.pl --include ./Source/WebCore/dom --include ./Source/WebCore/html --include ./Source/WebCore/css --include ./Source/WebCore/page --include ./Source/WebCore/xml --include ./Source/WebCore/svg --outputDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=1 ENABLE_CHANNEL_MESSAGING=1 ENABLE_METER_TAG=1 ENABLE_PROGRESS_TAG=1 ENABLE_JAVASCRIPT_DEBUGGER=1 ENABLE_OFFLINE_WEB_APPLICATIONS=1 ENABLE_DATABASE=1 ENABLE_DATALIST=1 ENABLE_EVENTSOURCE=1 ENABLE_DOM_STORAGE=1 ENABLE_VIDEO=1 ENABLE_FULLSCREEN_API=1 ENABLE_VIDEO_TRACK=1 ENABLE_XPATH=1 ENABLE_XSLT=1 ENABLE_WORKERS=1 ENABLE_SHARED_WORKERS=1 ENABLE_FILTERS=1 ENABLE_WEB_SOCKETS=1 ENABLE_BLOB=1" --generator GObject ./Source/WebCore/css/CSSStyleDeclaration.idl
| /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/bindings/scripts/generate-bindings.pl --include ./Source/WebCore/dom --include ./Source/WebCore/html --include ./Source/WebCore/css --include ./Source/WebCore/page --include ./Source/WebCore/xml --include ./Source/WebCore/svg --outputDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=1 ENABLE_CHANNEL_MESSAGING=1 ENABLE_METER_TAG=1 ENABLE_PROGRESS_TAG=1 ENABLE_JAVASCRIPT_DEBUGGER=1 ENABLE_OFFLINE_WEB_APPLICATIONS=1 ENABLE_DATABASE=1 ENABLE_DATALIST=1 ENABLE_EVENTSOURCE=1 ENABLE_DOM_STORAGE=1 ENABLE_VIDEO=1 ENABLE_FULLSCREEN_API=1 ENABLE_VIDEO_TRACK=1 ENABLE_XPATH=1 ENABLE_XSLT=1 ENABLE_WORKERS=1 ENABLE_SHARED_WORKERS=1 ENABLE_FILTERS=1 ENABLE_WEB_SOCKETS=1 ENABLE_BLOB=1" --generator GObject ./Source/WebCore/css/CSSStyleSheet.idl
| Unquoted string "attributes" may clash with future reserved word at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
| Unquoted string "attributes" may clash with future reserved word at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
| Unquoted string "attributes" may clash with future reserved word at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
| Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSRuleListPrivate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1122.
| Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSStyleSheetPrivate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1122.
| make: *** [DerivedSources/webkit/WebKitDOMCSSRuleList.h] Error 2
| make: *** Waiting for unfinished jobs....
| Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSStyleDeclarationPrivate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1122.
| make: *** [DerivedSources/webkit/WebKitDOMCSSStyleSheet.h] Error 2
| make: *** [DerivedSources/webkit/WebKitDOMCSSStyleDeclaration.h] Error 2
| Unquoted string "attributes" may clash with future reserved word at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
| Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSRulePrivate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1122.
| make: *** [DerivedSources/webkit/WebKitDOMCSSRule.h] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/temp/log.do_compile.13377 for further information)
NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Failed
ERROR: Task 7 (/home/Superandy/data/oe-core/sources/openembedded-core/meta/recipes-sato/webkit/webkit-gtk_svn.bb, do_compile) failed with exit code '1'

ideas what causes this?

Andreas


