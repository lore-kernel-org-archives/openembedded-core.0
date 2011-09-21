Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6MZF-00067K-IO
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 15:10:25 +0200
Received: by fxi1 with SMTP id 1so1631064fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 06:05:07 -0700 (PDT)
Received: by 10.223.37.215 with SMTP id y23mr1055430fad.12.1316610307330;
	Wed, 21 Sep 2011 06:05:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h16sm4203074fab.19.2011.09.21.06.05.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 06:05:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E79DE1D.5000303@eukrea.com>
Date: Wed, 21 Sep 2011 15:05:04 +0200
Message-Id: <D9F00ABD-04FA-4A75-BB1C-13B9BBDC4C54@dominion.thruhere.net>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
	<DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
	<CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
	<49A59D49-5FF1-4F8D-A259-F6F8CA42ADC9@dominion.thruhere.net>
	<CAP9ODKpbVD-2AyXEMQG9D=6=F1n2kC-J=jOU7EPc2hWa_bjq6A@mail.gmail.com>
	<1316437421.14488.13.camel@ted> <4E77990A.5080504@eukrea.com>
	<4E790328.2010604@eukrea.com>
	<CFEB0FCC-7E86-49A1-87AB-E9E43FBAA094@dominion.thruhere.net>
	<4E79DE1D.5000303@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Wed, 21 Sep 2011 13:10:25 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 14:52 heeft Eric B=E9nard het volgende geschreven:

> Hi Koen,
>=20
> Le 21/09/2011 12:44, Koen Kooi a =E9crit :
>> Op 20 sep. 2011, om 23:18 heeft Eric B=E9nard het volgende =
geschreven:
>>> ok 2 branches are available here : =
git://github.com/eukrea/oe-core.git
>>> - qt4_improve for improvement to existing qt 4.7.3,
>>> - qt4_upgrade for adding qt 4.7.4 (with DEFAULT_PREFERENCE=3D-1 as =
suggested by Koen.
>>>=20
>>> Please test them so that we can fix potential failures and send the =
pull request (I have compile test actually running with the latest =
changes in qt4_upgrade branch so this one is not yet fully tested).
>>=20
>> I'm building the qt4_upgrade branch + =
http://patches.openembedded.org/patch/11289/ + PREFERRED_VERSION change =
in angstrom. If you don't hear anything the test went OK :)
>=20
> in angstrom you also need to add :
> +PREFERRED_VERSION_qt4-native =3D "${ANGSTROM_QT_VERSION}"
> else qt4-native 4.7.3 will be used.

I already have that :)

So far the only bug with 4.7.4 is this:

WARNING: For recipe qt4-x11-free, the following files were installed but =
not shipped in any package:
WARNING:   /usr/share/qt4/phrasebooks/swedish.qph
WARNING:   /usr/share/qt4/phrasebooks/dutch.qph
WARNING:   /usr/share/qt4/phrasebooks/german.qph
WARNING:   /usr/share/qt4/phrasebooks/polish.qph
WARNING:   /usr/share/qt4/phrasebooks/danish.qph
WARNING:   /usr/share/qt4/phrasebooks/japanese.qph
WARNING:   /usr/share/qt4/phrasebooks/finnish.qph
WARNING:   /usr/share/qt4/phrasebooks/norwegian.qph
WARNING:   /usr/share/qt4/phrasebooks/french.qph
WARNING:   /usr/share/qt4/phrasebooks/russian.qph
WARNING:   /usr/share/qt4/phrasebooks/spanish.qph
WARNING:   /usr/share/qt4/phrasebooks/hungarian.qph
WARNING:   /usr/share/qt4/phrasebooks/italian.qph
WARNING:   /usr/lib/.debug/libQtSql.so
WARNING:   /usr/lib/.debug/libQtNetwork.so
WARNING:   /usr/lib/.debug/libQtTest.so
WARNING:   /usr/lib/.debug/libQtXml.so
WARNING:   /usr/lib/.debug/libQtDesignerComponents.so
WARNING:   /usr/lib/.debug/libQtXmlPatterns.so
WARNING:   /usr/lib/.debug/libQtCLucene.so
WARNING:   /usr/lib/.debug/libphonon.so
WARNING:   /usr/lib/.debug/libQtSvg.so
WARNING:   /usr/lib/.debug/libQtMultimedia.so
WARNING:   /usr/lib/.debug/libQtDBus.so
WARNING:   /usr/lib/.debug/libQtScriptTools.so
WARNING:   /usr/lib/.debug/libQtDeclarative.so
WARNING:   /usr/lib/.debug/libQtCore.so
WARNING:   /usr/lib/.debug/libQtWebKit.so
WARNING:   /usr/lib/.debug/libQtDesigner.so
WARNING:   /usr/lib/.debug/libQtGui.so
WARNING:   /usr/lib/.debug/libQt3Support.so
WARNING:   /usr/lib/.debug/libQtHelp.so
WARNING:   /usr/lib/.debug/libQtScript.so
WARNING:   /usr/lib/fonts/fontdir
WARNING:   /usr/lib/qt4/plugins/qmltooling/.debug/libqmldbg_tcp.so





