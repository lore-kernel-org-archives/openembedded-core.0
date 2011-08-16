Received: from smtp24.4emm.com ([69.18.222.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QtCb3-00042B-Sp
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 07:53:54 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB24.4emm.local ([::1]) with mapi id 14.01.0289.001; Tue, 16 Aug 2011
	01:44:50 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: dbus: only use x11 if DISTRO_FEATURES has selected it
Thread-Index: Acxb13BhtnygMy5eTt6VnOag+yngaA==
Date: Tue, 16 Aug 2011 05:49:14 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF18472A@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: dbus: only use x11 if DISTRO_FEATURES has selected it
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
X-List-Received-Date: Tue, 16 Aug 2011 05:53:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I was trying to take advantage of the new x11 DISTRO_FEATURE and
ran into some trouble with the dbus package. When building with meta-oe,
gconf depends on dbus-x11, and just about everything depends on gconf.
So when I disable x11, I can only build my images with 'bitbake -I dbus-x11=
'.

As it turns out, the files shipped in dbus-x11 are still built even when th=
e
--without-x option is used. Perhaps it would be better to allow them to
be packaged, even without x11 support?
=A0=A0
James



