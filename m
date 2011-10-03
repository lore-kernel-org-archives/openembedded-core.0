Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RAkYF-000398-97
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 17:35:31 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id E2ADD166034C; Mon,  3 Oct 2011 09:29:58 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4FF761660107;
	Mon,  3 Oct 2011 09:29:52 -0600 (MDT)
Message-ID: <4E89D4F0.9080900@mlbassoc.com>
Date: Mon, 03 Oct 2011 09:29:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <201110031603.31007.schnitzeltony@gmx.de>
	<C4A96559-DE0F-4549-8A49-909A168B8A66@dominion.thruhere.net>
In-Reply-To: <C4A96559-DE0F-4549-8A49-909A168B8A66@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 03 Oct 2011 15:35:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011-10-03 09:24, Koen Kooi wrote:
>
>
> Op 3 okt. 2011 om 09:03 heeft Andreas M=C3=BCller<schnitzeltony@gmx.de>=
  het volgende geschreven:
>
>> Have pulled yesterday all the angstom layers (oe-core / meta-oe ..) an=
d deleted all files from temp build dir. For
>>
>> bitbake webkit-gtk
>>
>> I get
>>
>> NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Started
>> ERROR: Function 'do_compile' failed (see /home/Superandy/tmp/oe-core-e=
glibc/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/te=
mp/log.do_compile.13377 for further information)
>> ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-eglib=
c/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/temp/l=
og.do_compile.13377
>> Log data follows:
>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-=
linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
>> | + cd /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-g=
nueabi/webkit-gtk-1.5.1+svnr90727-r0/
>> | + do_compile
>> | + base_do_compile
>> | + '[' -e Makefile -o -e makefile ']'
>> | + oe_runmake
>> | + '[' xmake =3D x ']'
>> | + bbnote make -j 4
>> | + echo 'NOTE: make -j 4'
>> | NOTE: make -j 4
>> | + make -j 4
>> | /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/b=
indings/scripts/generate-bindings.pl --include ./Source/WebCore/dom --inc=
lude ./Source/WebCore/html --include ./Source/WebCore/css --include ./Sou=
rce/WebCore/page --include ./Source/WebCore/xml --include ./Source/WebCor=
e/svg --outputDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=3D=
1 ENABLE_CHANNEL_MESSAGING=3D1 ENABLE_METER_TAG=3D1 ENABLE_PROGRESS_TAG=3D=
1 ENABLE_JAVASCRIPT_DEBUGGER=3D1 ENABLE_OFFLINE_WEB_APPLICATIONS=3D1 ENAB=
LE_DATABASE=3D1 ENABLE_DATALIST=3D1 ENABLE_EVENTSOURCE=3D1 ENABLE_DOM_STO=
RAGE=3D1 ENABLE_VIDEO=3D1 ENABLE_FULLSCREEN_API=3D1 ENABLE_VIDEO_TRACK=3D=
1 ENABLE_XPATH=3D1 ENABLE_XSLT=3D1 ENABLE_WORKERS=3D1 ENABLE_SHARED_WORKE=
RS=3D1 ENABLE_FILTERS=3D1 ENABLE_WEB_SOCKETS=3D1 ENABLE_BLOB=3D1" --gener=
ator GObject ./Source/WebCore/css/CSSRule.idl
>> | /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/b=
indings/scripts/generate-bindings.pl --include ./Source/WebCore/dom --inc=
lude ./Source/WebCore/html --include ./Source/WebCore/css --include ./Sou=
rce/WebCore/page --include ./Source/WebCore/xml --include ./Source/WebCor=
e/svg --outputDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=3D=
1 ENABLE_CHANNEL_MESSAGING=3D1 ENABLE_METER_TAG=3D1 ENABLE_PROGRESS_TAG=3D=
1 ENABLE_JAVASCRIPT_DEBUGGER=3D1 ENABLE_OFFLINE_WEB_APPLICATIONS=3D1 ENAB=
LE_DATABASE=3D1 ENABLE_DATALIST=3D1 ENABLE_EVENTSOURCE=3D1 ENABLE_DOM_STO=
RAGE=3D1 ENABLE_VIDEO=3D1 ENABLE_FULLSCREEN_API=3D1 ENABLE_VIDEO_TRACK=3D=
1 ENABLE_XPATH=3D1 ENABLE_XSLT=3D1 ENABLE_WORKERS=3D1 ENABLE_SHARED_WORKE=
RS=3D1 ENABLE_FILTERS=3D1 ENABLE_WEB_SOCKETS=3D1 ENABLE_BLOB=3D1" --gener=
ator GObject ./Source/WebCore/css/CSSRuleList.idl
>> | /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/b=
indings/scripts/generate-bindings.pl --include ./Source/WebCore/dom --inc=
lude ./Source/WebCore/html --include ./Source/WebCore/css --include ./Sou=
rce/WebCore/page --include ./Source/WebCore/xml --include ./Source/WebCor=
e/svg --outputDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=3D=
1 ENABLE_CHANNEL_MESSAGING=3D1 ENABLE_METER_TAG=3D1 ENABLE_PROGRESS_TAG=3D=
1 ENABLE_JAVASCRIPT_DEBUGGER=3D1 ENABLE_OFFLINE_WEB_APPLICATIONS=3D1 ENAB=
LE_DATABASE=3D1 ENABLE_DATALIST=3D1 ENABLE_EVENTSOURCE=3D1 ENABLE_DOM_STO=
RAGE=3D1 ENABLE_VIDEO=3D1 ENABLE_FULLSCREEN_API=3D1 ENABLE_VIDEO_TRACK=3D=
1 ENABLE_XPATH=3D1 ENABLE_XSLT=3D1 ENABLE_WORKERS=3D1 ENABLE_SHARED_WORKE=
RS=3D1 ENABLE_FILTERS=3D1 ENABLE_WEB_SOCKETS=3D1 ENABLE_BLOB=3D1" --gener=
ator GObject ./Source/WebCore/css/CSSStyleDeclaration.idl
>> | /usr/bin/perl -I./Source/WebCore/bindings/scripts ./Source/WebCore/b=
indings/scripts/generate-bindings.pl --include ./Source/WebCore/dom --inc=
lude ./Source/WebCore/html --include ./Source/WebCore/css --include ./Sou=
rce/WebCore/page --include ./Source/WebCore/xml --include ./Source/WebCor=
e/svg --outputDir "./DerivedSources/webkit" --defines "LANGUAGE_GOBJECT=3D=
1 ENABLE_CHANNEL_MESSAGING=3D1 ENABLE_METER_TAG=3D1 ENABLE_PROGRESS_TAG=3D=
1 ENABLE_JAVASCRIPT_DEBUGGER=3D1 ENABLE_OFFLINE_WEB_APPLICATIONS=3D1 ENAB=
LE_DATABASE=3D1 ENABLE_DATALIST=3D1 ENABLE_EVENTSOURCE=3D1 ENABLE_DOM_STO=
RAGE=3D1 ENABLE_VIDEO=3D1 ENABLE_FULLSCREEN_API=3D1 ENABLE_VIDEO_TRACK=3D=
1 ENABLE_XPATH=3D1 ENABLE_XSLT=3D1 ENABLE_WORKERS=3D1 ENABLE_SHARED_WORKE=
RS=3D1 ENABLE_FILTERS=3D1 ENABLE_WEB_SOCKETS=3D1 ENABLE_BLOB=3D1" --gener=
ator GObject ./Source/WebCore/css/CSSStyleSheet.idl
>> | Unquoted string "attributes" may clash with future reserved word at =
Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
>> | Unquoted string "attributes" may clash with future reserved word at =
Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
>> | Unquoted string "attributes" may clash with future reserved word at =
Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
>> | Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSRuleListPriva=
te.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.=
pm line 1122.
>> | Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSStyleSheetPri=
vate.h for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObjec=
t.pm line 1122.
>> | make: *** [DerivedSources/webkit/WebKitDOMCSSRuleList.h] Error 2
>> | make: *** Waiting for unfinished jobs....
>> | Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSStyleDeclarat=
ionPrivate.h for writing at Source/WebCore/bindings/scripts/CodeGenerator=
GObject.pm line 1122.
>> | make: *** [DerivedSources/webkit/WebKitDOMCSSStyleSheet.h] Error 2
>> | make: *** [DerivedSources/webkit/WebKitDOMCSSStyleDeclaration.h] Err=
or 2
>> | Unquoted string "attributes" may clash with future reserved word at =
Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm line 1036.
>> | Couldn't open file ./DerivedSources/webkit/WebKitDOMCSSRulePrivate.h=
 for writing at Source/WebCore/bindings/scripts/CodeGeneratorGObject.pm l=
ine 1122.
>> | make: *** [DerivedSources/webkit/WebKitDOMCSSRule.h] Error 2
>> | + die 'oe_runmake failed'
>> | + bbfatal 'oe_runmake failed'
>> | + echo 'ERROR: oe_runmake failed'
>> | ERROR: oe_runmake failed
>> | + exit 1
>> | ERROR: Function 'do_compile' failed (see /home/Superandy/tmp/oe-core=
-eglibc/work/armv7a-angstrom-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0/=
temp/log.do_compile.13377 for further information)
>> NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Failed
>> ERROR: Task 7 (/home/Superandy/data/oe-core/sources/openembedded-core/=
meta/recipes-sato/webkit/webkit-gtk_svn.bb, do_compile) failed with exit =
code '1'
>>
>> ideas what causes this?
>
> no idea, but I get the same error
>

It builds in Yocto/Poky so you might compare with those recipes.

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


