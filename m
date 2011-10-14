Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REccV-000729-7F
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 09:55:55 +0200
Received: by bkat8 with SMTP id t8so1675625bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 00:50:10 -0700 (PDT)
Received: by 10.223.17.91 with SMTP id r27mr2314440faa.20.1318578610133;
	Fri, 14 Oct 2011 00:50:10 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n12sm2217890fan.9.2011.10.14.00.50.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 00:50:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrz1nVjCyBAoWA_mcVwSmG7kgCBSTn2hkLksHW6sj1U+g@mail.gmail.com>
Date: Fri, 14 Oct 2011 09:50:02 +0200
Message-Id: <B804FAA7-CDE1-40E9-B35E-2B25F6A85FD1@dominion.thruhere.net>
References: <678AE8F3-DBF3-4315-83A5-AA2CA040C5D8@dominion.thruhere.net>
	<CAP9ODKq+9Bhu9A8jZhYH-uBVSWcncsNQvAxyNxLnG133J237iA@mail.gmail.com>
	<CDD7988D-2486-484F-B1A5-347A38D64F01@dominion.thruhere.net>
	<CAP9ODKrz1nVjCyBAoWA_mcVwSmG7kgCBSTn2hkLksHW6sj1U+g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Multiple git repos in SRC_URI and/or git submodules support
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
X-List-Received-Date: Fri, 14 Oct 2011 07:55:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 10 okt. 2011, om 22:14 heeft Otavio Salvador het volgende geschreven:

> On Mon, Oct 10, 2011 at 17:01, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>=20
>> Op 10 okt. 2011, om 21:40 heeft Otavio Salvador het volgende =
geschreven:
>>=20
>>> On Mon, Oct 10, 2011 at 15:19, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>> ...
>>>> I'm not going to do 1), 3) is unlikely, so I want to ask if 2) is =
already supported. I've seen various patches that add an 'unpackdir' or =
similar, but I can't find any docs on it. Can someone enlighten me on =
the current status of that?
>>> ...
>>>=20
>>> Yes, this works. I have added support to SRCREV_FORMAT into gitpkgv =
too ;-)
>>=20
>> So what's the magic param I need to pass to the fetcher to make this =
work?
>=20
> Basic example:
>=20
> SRCREV_main =3D "..."
> SRCREV_core =3D "...."
>=20
> SRC_URI =3D " \
>  git://fooserver/git/foo.git;name=3Dmain \
>  git://fooserver/git/foo-core.git;name=3Dcore;destsuffix=3Dgit/foo-core"=

> S =3D "${WORKDIR}/git"
>=20
> SRCREV_FORMAT =3D "main-core"

Thanks, I'm going to try the following:

SRC_URI =3D "git://github.com/ajaxorg/cloud9.git;name=3Dcloud9ide \
           =
git://github.com/ajaxorg/connect.git;destsuffix=3Dsupport/connect;name=3Dc=
onnect \
           =
git://github.com/ajaxorg/async.js.git;destsuffix=3Dsupport/asyncjs;name=3D=
asyncjs \
           =
git://github.com/ajaxorg/jsDAV.git;destsuffix=3Dsupport/jsdav;name=3Djsdav=
 \
           =
git://github.com/ajaxorg/lib-v8debug.git;destsuffix=3Dsupport/lib-v8debug;=
name=3Dlib-v8debug \
           =
git://github.com/ajaxorg/ace.git;destsuffix=3Dsupport/ace;name=3Dace \
           =
git://github.com/ajaxorg/apf.git;destsuffix=3Dsupport/apf;name=3Dapf \
           =
git://github.com/ajaxorg/node-builds-v4.git;destsuffix=3Dsupport/node-buil=
ds-v4;name=3Dnode-builds-v4 \
           =
git://github.com/ajaxorg/gnu-builds.git;destsuffix=3Dsupport/gnu-builds;na=
me=3Dgnu-builds \
           =
git://github.com/ajaxorg/socket.io.git;destsuffix=3Dsupport/socket.io;name=
=3Dsocketio \
           =
git://github.com/ajaxorg/socket.io-client.git;destsuffix=3Dsupport/socket.=
io-client;name=3Dsocketio-client \
           =
git://github.com/ajaxorg/UglifyJS.git;destsuffix=3Dsupport/uglify-js;name=3D=
uglifyjs \
           file://cloud9.service \
          "

SRCREV_cloud9ide =3D "593948c9aaded845cb8f3ced49ef41428e351264"
SRCREV_connect =3D "3d1d77a113fa2f18020f562832dca3d4c2d717a2"
SRCREV_asyncjs =3D "d36ead408e2959b1e99572114ef3a1b6a48c1072"
SRCREV_jsdav =3D "f1d1f691fdb521701c1c06d158d213575e4e4e5e"
SRCREV_lib-v8debug =3D "29b20d01e6854da2173e1665ea141dab6b5a8104"
SRCREV_ace =3D "d85acd115e88e4461a04fafc6a93a801aeb057ec"
SRCREV_apf =3D "a7e0daa29573f319f22be5a6cfa275243502604b"
SRCREV_node-builds-v4 =3D "2e3ac47b7b8d506147feb08372cc36b988b6195a"
SRCREV_gnu-builds =3D "9ff133d95f9a41d749fe16220d81517dad9a2db3"
SRCREV_socketio =3D "8f82b1e4e1076a3092fed77e0dc9379425f59b9d"
SRCREV_socketio-client =3D "7b5335d1ed88564928a5d00d8a750ff9f9c627a5"
SRCREV_uglifyjs =3D "941c845c4a01e4e47a158458fe846eb36d0828ad"

SRCREV_FORMAT =3D "cloud9ide"



