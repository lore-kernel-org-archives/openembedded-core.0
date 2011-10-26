Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RIsU7-0006cQ-FG
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 03:40:51 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB23.4emm.local ([::1]) with mapi id 14.01.0289.001; Tue, 25 Oct 2011
	21:34:54 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: useradd changes to dbus, base-passwd
Thread-Index: AcyTffR7oe+bqeWKRRipl7TOziFjKQ==
Date: Wed, 26 Oct 2011 01:34:52 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: useradd changes to dbus, base-passwd
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
X-List-Received-Date: Wed, 26 Oct 2011 01:40:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Recent changes to dbus have broken some sdk building:

Missing or unbuildable dependency chain was: ['meta-toolchain-qte', 'task-q=
te-toolchain-host-nativesdk', 'qt4-tools-nativesdk', 'dbus-nativesdk', 'bas=
e-passwd-nativesdk']

I think the commit introducing the base-passed dependency is 46e6c3fa8034b1=
2d178d605f3f5d7efe69671a13 (dbus: use useradd class to allow use in read-on=
ly filesystems).
I'm not too clear on how useradd works, so I can't tell if simply adding BB=
CLASSEXTEND =3D "native nativesdk" to base-passwd is sufficient. I'd expect=
 that this would cause dbus to add itself to the sdk sysroot's passwd (whic=
h previously didn't exist?). Seems harmless enough... I'm giving it a try n=
ow, but any advice or opinions would be appreciated.
=A0=A0
Regards,
James Limbouris



