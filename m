Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 8A7476FF97;
	Wed, 16 Dec 2015 09:03:08 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0224.002; Wed, 16 Dec 2015 10:03:05 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] Mark of upstream CVE patches
Thread-Index: AQHRN1JnqZ9MaZXTHkqXkkSwzLRjlJ7NMyfg
Date: Wed, 16 Dec 2015 09:03:06 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48ABABDD6C@SESTOEX04.enea.se>
References: <567039E1.5000205@linux.intel.com>
In-Reply-To: <567039E1.5000205@linux.intel.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Subject: Re: [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Wed, 16 Dec 2015 09:03:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mariano, all,

See my comments regarding "Bug 8119 - Define a format to mark Upstream CVE =
patches" below.


> There is an initiative to track vulnerable software being built (see bugs=
 8119
> and 7515). The idea is to have a testing tool that would check the recipe
> versions against CVEs. In order to accomplish such task there is need to
> reliable mark the patches from upstream that solve CVEs.
>=20
> There have been two options to mark the patches that solve CVEs:
>=20
> 1. Have  "CVE" and the CVE number as the patch filename.
>    Pros:
>      Doesn't require a new tag.
>    Cons:
>      It is not flexible to add more information, for example two CVEs in =
the same
> patch
> 2. Add a new tag in the patch that have the CVE information.
>    Pros:
>      It is flexible and can add more information.
>    Cons:
>      Require a change in the patch metadata.
>=20
> What I would recommend is to add a new tag in the patch, it must contain =
the
> CVE ID. With this it would be possible to look for the CVE information ea=
sily in
> the testing tool or in NIST, MITRE, or another web page. For example, thi=
s
> would be part of the patch for CVE-2013-6435, currently in OE-Core:
>=20
> -- snip --
>=20
> Upstream-Status: Backport
> CVE: CVE-2013-6435
>=20
> Reference:
> https://bugzilla.redhat.com/show_bug.cgi?id=3DCVE-2013-6435
>=20
> -- snip --
>=20
> The expected output of this discussion is a standard format for CVE patch=
es
> that most, if not all, of community members agree on.
>=20
> Please let me know your comments.

We are supposed to have reference to the CVE identifier both in the patch f=
ile/s
 and the commit message(e.g.  xxx- CVE-2013-6435.pacth) according to the gu=
idelines=20
for "Patch name convention and commit message" in the Yocto=20
Wiki https://wiki.yoctoproject.org/wiki/Security.

If a patch address multiple CVEs, perhaps we should name the patch:
Fix-for-multiple-CVEs.patch and list all CVEs in the patch file.

Will this not solve the problem? Do you think there is still need for a new=
 tag "CVE"?

Adding RedHat reference is ok for me along with Mitre & NVD or other useful=
=20
& reliable references.

I have updated Yocto security wiki. Please feel free to update the page if =
you have=20
some improvement or send your text/suggestion to me or Michael and we will =
help you.

Thanks
//Sona

