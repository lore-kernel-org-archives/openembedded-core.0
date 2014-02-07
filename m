Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 6875D6E706
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 14:33:04 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s17EWx8a001369
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Feb 2014 15:33:04 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Fri, 7 Feb 2014 15:32:59 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Premirrors and local VCS server
Thread-Index: Ac8kD6shFuj4vLvFRJ+liH1sEuiwVA==
Date: Fri, 7 Feb 2014 14:32:58 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B15D3EA@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: Premirrors and local VCS server
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2014 14:33:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I have added the following to my local.conf:=0A=
=0A=
-----------------------------=0A=
MY_LOCAL_MIRROR =3D "ftp://10.64.2.58/files/"=0A=
PREMIRRORS_prepend =3D "\=0A=
    ftp://.*/.* ${MY_LOCAL_MIRROR} \n \=0A=
    git://.*/.* ${MY_LOCAL_MIRROR} \n \=0A=
    http://.*/.* ${MY_LOCAL_MIRROR} \n \=0A=
    https://.*/.* ${MY_LOCAL_MIRROR} \n \=0A=
    svn://.*/.* ${MY_LOCAL_MIRROR} \n \=0A=
"=0A=
=0A=
BB_FETCH_PREMIRRORONLY =3D "1"=0A=
-----------------------------=0A=
=0A=
This works as I want for all packages that I download from external servers=
=0A=
but I also have some proprietary recipes that use the svn: fetcher to check=
=0A=
out source code from a local (LAN) Subversion server.=0A=
With BB_FETCH_PREMIRRORONLY enabled these recipes will fail since=0A=
there is no tarball available in the premirror.=0A=
=0A=
What I want to accomplish with using BB_FETCH_PREMIRRORONLY is=0A=
to make sure that my builds needs nothing from the internet but I still wan=
t=0A=
to fetch from my LAN servers.=0A=
=0A=
I have tried inserting my local svn server with "svn://.*/.* http://myserve=
r"=0A=
(http is the protocol used by svn here) in the premirror list but this does=
n't=0A=
work, the fetcher just looks for a tarball, not a subversion server checkou=
t.=0A=
=0A=
I have also tried "svn://.*/.* svn://myserver" but this just goes mayhem,=
=0A=
some recursion i guess; 9140 ERROR messages shown...=0A=
=0A=
Any help or pointers would be appreciated.=0A=
=0A=
BR // Mats=0A=

