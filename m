Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1Qr4Ka-0007IU-82
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 10:40:04 +0200
Received: by wwe32 with SMTP id 32so735621wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 01:35:34 -0700 (PDT)
Received: by 10.216.37.19 with SMTP id x19mr3550834wea.60.1312965333983;
	Wed, 10 Aug 2011 01:35:33 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h13sm428656wee.34.2011.08.10.01.35.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Aug 2011 01:35:33 -0700 (PDT)
From: Koen Kooi <koen@beagleboard.org>
Date: Wed, 10 Aug 2011 10:35:31 +0200
Message-Id: <CF0FECEF-6C97-49A5-9829-F016716FB058@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: QT4 packaging errors
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
X-List-Received-Date: Wed, 10 Aug 2011 08:40:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

This has been sitting on my TODO for way too long now, so I'll just post =
the errors here and hope someone else finds the time to fix them :)

WARNING: For recipe qt4-embedded, the following files were installed but =
not shipped in any package:
WARNING:   /usr/imports/Qt/labs/particles/libqmlparticlesplugin.so
WARNING:   /usr/imports/Qt/labs/particles/qmldir
WARNING:   =
/usr/imports/Qt/labs/particles/.debug/libqmlparticlesplugin.so
WARNING:   /usr/imports/Qt/labs/gestures/libqmlgesturesplugin.so
WARNING:   /usr/imports/Qt/labs/gestures/qmldir
WARNING:   /usr/imports/Qt/labs/gestures/.debug/libqmlgesturesplugin.so
WARNING:   /usr/imports/Qt/labs/folderlistmodel/qmldir
WARNING:   =
/usr/imports/Qt/labs/folderlistmodel/libqmlfolderlistmodelplugin.so
WARNING:   =
/usr/imports/Qt/labs/folderlistmodel/.debug/libqmlfolderlistmodelplugin.so=

WARNING:   /usr/imports/QtWebKit/libqmlwebkitplugin.so
WARNING:   /usr/imports/QtWebKit/qmldir
WARNING:   /usr/imports/QtWebKit/.debug/libqmlwebkitplugin.so
WARNING:   /usr/bin/uic3
WARNING:   /usr/bin/.debug/uic3
WARNING:   /usr/lib/qtopia/plugins/qmltooling/libtcpserver.so
WARNING:   /usr/lib/qtopia/plugins/qmltooling/.debug/libtcpserver.so
WARNING:   /usr/lib/.debug/libQtMultimediaE.so
WARNING:   /usr/lib/.debug/libQtHelpE.so
WARNING:   /usr/lib/.debug/libQt3SupportE.so
WARNING:   /usr/lib/.debug/libQtXmlE.so
WARNING:   /usr/lib/.debug/libQtSvgE.so
WARNING:   /usr/lib/.debug/libQtSqlE.so
WARNING:   /usr/lib/.debug/libQtDesignerE.so
WARNING:   /usr/lib/.debug/libQtDBusE.so
WARNING:   /usr/lib/.debug/libQtDeclarativeE.so
WARNING:   /usr/lib/.debug/libQtScriptE.so
WARNING:   /usr/lib/.debug/libQtCLuceneE.so
WARNING:   /usr/lib/.debug/libQtXmlPatternsE.so
WARNING:   /usr/lib/.debug/libQtWebKitE.so
WARNING:   /usr/lib/.debug/libQtScriptToolsE.so
WARNING:   /usr/lib/.debug/libQtGuiE.so
WARNING:   /usr/lib/.debug/libQtNetworkE.so
WARNING:   /usr/lib/.debug/libQtDesignerComponentsE.so
WARNING:   /usr/lib/.debug/libQtTestE.so
WARNING:   /usr/lib/.debug/libQtCoreE.so
WARNING:   /usr/lib/.debug/libphononE.so
WARNING:   /usr/lib/fonts/fontdir
WARNING:   /usr/lib/fonts/README
WARNING: QA Issue: non debug package contains .debug directory: =
qt4-embedded-examples path =
/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r28.1/packages-spli=
t/qt4-embedded-examples/usr/bin/qtopia/examples/declarative/cppextensions/=
networkaccessmanagerfactory/.obj/release-shared-emb-arm/.debug/main.o


regards,

Koen=


