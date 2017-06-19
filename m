Return-Path: <Sean_Hudson@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4F07808D;
	Mon, 19 Jun 2017 15:31:23 +0000 (UTC)
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
	by relay1.mentorg.com with esmtp 
	id 1dMyeC-00061j-8d from Sean_Hudson@mentor.com ;
	Mon, 19 Jun 2017 08:31:24 -0700
Received: from [172.30.88.228] (147.34.91.1) by svr-orw-mbx-01.mgc.mentorg.com
	(147.34.90.201) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 19 Jun 2017 08:31:21 -0700
To: Mark Hatle <mark.hatle@windriver.com>, Philip Balister
	<philip@balister.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<cbc4d73d-be96-309d-a749-0ad344572a22@balister.org>
	<a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>
From: Sean Hudson <sean_hudson@mentor.com>
Organization: Mentor Graphics - Embedded Software Division
Message-ID: <491966d0-a64f-3f51-250c-3d08a8140dec@mentor.com>
Date: Mon, 19 Jun 2017 10:31:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
	svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Mon, 19 Jun 2017 15:31:24 -0000
X-Groupsio-MsgNum: 99087
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ipj3M44RvM3RtBAQ06qAqDWEL3rbDbWBP"

--ipj3M44RvM3RtBAQ06qAqDWEL3rbDbWBP
Content-Type: multipart/mixed; boundary="C2g23832t9Dl9K0hL1nd4pUEhkpratq3P";
 protected-headers="v1"
From: Sean Hudson <sean_hudson@mentor.com>
To: Mark Hatle <mark.hatle@windriver.com>,
 Philip Balister <philip@balister.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <491966d0-a64f-3f51-250c-3d08a8140dec@mentor.com>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE
 (CVE-2017-9731)
References: <1497868738.24449.41.camel@linuxfoundation.org>
 <cbc4d73d-be96-309d-a749-0ad344572a22@balister.org>
 <a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>
In-Reply-To: <a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>

--C2g23832t9Dl9K0hL1nd4pUEhkpratq3P
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 2017-06-19 09:05 AM, Mark Hatle wrote:
> On 6/19/17 8:20 AM, Philip Balister wrote:
>> On 06/19/2017 06:38 AM, Richard Purdie wrote:
>>> I suspect this has been missed by some people so I want to spell it
>>> out. We have our first CVE in OE-Core itself.
>>>
>>> The issue is limited to binary ipks potentially exposing sensitive
>>> information through the "Source:" field which contained the full
>>> SRC_URI. Those urls could potentially contain sensitive information
>>> about servers and credentials.
>>
>> So the issue is leaking credentials, not build system paths? I mention=

>> this because we do leak build system paths into images in other places=
=2E
>=20
> Build systems paths would be unrelated to this, assuming I understand i=
t properly.
>=20
> Information leak of the build user, time of build, and build system pat=
hs can
> all occur.  (This is part of the overall binary reproducible stuff as w=
ell.)
>=20
> When it comes to information leaks, specifically build system leaks.  A=
s long as
> they don't contain credential information then it is a point of mitigat=
ion vs a
> 'bug' in my opinion.  We clearly want to move toward a binary reproduci=
ble build
> -- doing so will further limit the leaks (or at least make them underst=
ood.)
>=20
> For build user, hostname, directories and build time/date issues -- we'=
ve
> already mitigated many of them.  Directory structure was done when we s=
tarted to
> use the compilers path replacement operations.  (It's probably not 100%=

> effective, but I'd say any items that are left are reasonable bug candi=
dates.)
> We've also made passes to remove many of the other items, but I'd simpl=
y
> consider them regular bugs at this point...  but information leaks like=
 this are
> something people often don't think about and probably should be made aw=
are of.
>=20
> It would be reasonable to write up a 'best practices' type document.  E=
xplaining
> that simply due to the nature of building many of these things will be =
'leaked'
> and where some of them are leaked through.  (Package generation, compil=
ation,
> etc for instance.)

That sounds reasonable, although, TBH, if someone is adding credentials
to their SRC_URIs, I would expect that a best practice would be ignored.
 Perhaps adding a detection routine that emitted a warning during
parsing for credentials in the SRC_URI might be warranted?  Thoughts?

>=20
> Controlling your 'production' build environment can mitigate many of th=
e
> potential issues here.  By using non-confidential path names (i.e. don'=
t include
> confidential 'customer', code-name, etc in build paths), changing or ot=
herwise
> managing the host name on your build system (i.e. instead of
> my-product.my-company.internal.com... something like 'build-1' as a hos=
tname can
> help hide many of these things.)  Using a 'build user' who doesn't have=
 any
> network credentials, other then on the build system itself...
>=20
> --Mark
>=20
>> Philip
>>
>>
>>>
>>> After discussion, I ended up changing the field to contain the recipe=

>>> filename (no path). There was talk of filtering the urls however if y=
ou
>>> try, it becomes clear that sensitive elements can remain and no
>>> solution is likely 100% effective. The other package backends don't d=
o
>>> this at all so this brings ipk more into line with them. Simply
>>> clearing the field doesn't work with the current opkg-utils. It can b=
e
>>> changed but the change becomes more invasive.
>>>
>>> This fix has been merged to master.
>>>
>>> I also did take the decision to backport this change back to
>>> pyro/morty/krogoth too. I appreciate this can cause some disruption t=
o
>>> people who rely on SRC_URI being in the Source: field however I
>>> couldn't see any other realistic way forward.
>>>
>>> Cheers,
>>>
>>> Richard
>>> _______________________________________________
>>> Openembedded-architecture mailing list
>>> Openembedded-architecture@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-architect=
ure
>>>
>> _______________________________________________
>> Openembedded-architecture mailing list
>> Openembedded-architecture@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-architectu=
re
>>
>=20
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architectur=
e
>=20


--=20
Sean


--C2g23832t9Dl9K0hL1nd4pUEhkpratq3P--

--ipj3M44RvM3RtBAQ06qAqDWEL3rbDbWBP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZR+5IAAoJEC2KalNZVFwRicYQAJyH5Y05usVPyhg2Q+Oj9k66
aRNGW5VHohPOh9dQQlg6f+6ZBoO8hhT53bEr66Td5Qzr9KwHqORQpmuLEMmhYQyh
CQb/G6ETpU1JBM9KeQ8s9ge9IeORjKqEE2zJNsrwLLbA2ZPSAc2abjiuYx5JajCj
DR177WBfWtXcVIPbVflpeGAFUJ18P501zaiurQO6mVG7izgDXZXhzraQXOTQvYpD
w/Qj0gpEhIISzQYIp8go4ocKUXxWcs2pH5wJXONuYjE5/C72J0Qu4WmQ1Exjsucg
mabdB9EDVaEl05HM2TQw8n+NJNPaM5eSZBGGUHt69hECSLI3/0ODZUhRbrMUoDoy
VU5fIxX9s2Ephdhm4Uf1mZMRu1a1a6adNW8jG2Mo9LjXYMiZuGWJ88l2spFavjOj
x3JxiyB/RisrZSqSCtFQKmE5QnqnypSAqpdDYUnZmZWUxQpHU95gOgGfX7CvCGAX
auNGXeQd8/sKk5FSpL0euCzHnlTGUj+jegk0Pz8Ns6SZvk3RwG5MMrojqeOlDvTi
spvSDF36Z/uBzBXmwnouefh+GJ0Qtkt/SV6XBuyGUe7X3km/YhSf+Spg8ts4LL8E
LRFinJl/C8/820BzGMDO8BuEI6ctjDx34qiBq6EApUF7S/mq+sIfQpnpeol8nmwP
ljdNmsoYk1tqAFwY8Ugy
=Z7aE
-----END PGP SIGNATURE-----

--ipj3M44RvM3RtBAQ06qAqDWEL3rbDbWBP--
