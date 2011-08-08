Received: from [69.18.222.101] (helo=smtp20.4emm.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QqI4g-0007mj-OG
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 07:08:26 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB20.4emm.local ([fe80::b039:47b9:6dd0:b630%19]) with mapi id
	14.01.0289.001; Mon, 8 Aug 2011 00:58:43 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: gcc version mismatch in sdk generation
Thread-Index: AcxVh4NoKLp76tIfSD+wmifiadjyEw==
Date: Mon, 8 Aug 2011 05:02:52 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF183257@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: gcc version mismatch in sdk generation
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
X-List-Received-Date: Mon, 08 Aug 2011 05:08:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

In oe-core, with Angstrom 2010.x, generating an sdk with:

bitbake meta-toolchain-qte

is giving me a toolchain with gcc-4.6.1 binaries in the i686 sysroot, but
gcc-4.5.4 runtime libraries in the arm (target) sysroot. The sdk can't
link until a symlink is installed to trick it into using the 4.5.4 librarie=
s.

I've checked the preferred versions, but they seem to be set consistently
in the disto's conf file, at least as far as I can see.

'bitbake -s | grep gcc' gives:
gcc                                     :4.5-r39.1+svnr176640              =
           =20
gcc-cross                               :4.5-r39.2+svnr176640              =
           =20
gcc-cross-canadian-arm                  :4.5-r39.0+svnr176640              =
           =20
gcc-cross-initial                       :4.5-r39.0+svnr176640              =
           =20
gcc-cross-intermediate                  :4.5-r39.0+svnr176640              =
           =20
gcc-crosssdk                            :4.5-r39.0+svnr176640              =
           =20
gcc-crosssdk-initial                    :4.5-r39.0+svnr176640              =
           =20
gcc-crosssdk-intermediate               :4.5-r39.0+svnr176640              =
           =20
gcc-runtime                             :4.5-r39.1+svnr176640              =
           =20
gcc-runtime-nativesdk                    :4.6.1+svnr175454-r5     :4.5-r39.=
1+svnr176640
gccmakedep                                         1:1.0.2-r3              =
           =20
libgcc                                  :4.5-r39.1+svnr176640              =
           =20
libgcc-nativesdk                         :4.6.1+svnr175454-r3     :4.5-r39.=
1+svnr176640

Regards
James Limbouris



