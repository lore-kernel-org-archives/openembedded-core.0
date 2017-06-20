Return-Path: <Sean_Hudson@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3908871996;
	Tue, 20 Jun 2017 13:27:22 +0000 (UTC)
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
	by relay1.mentorg.com with esmtp 
	id 1dNJBj-0006tp-Q9 from Sean_Hudson@mentor.com ;
	Tue, 20 Jun 2017 06:27:23 -0700
Received: from [172.30.88.228] (147.34.91.1) by svr-orw-mbx-01.mgc.mentorg.com
	(147.34.90.201) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 20 Jun 2017 06:27:20 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-architecture@lists.openembedded.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>
	<491966d0-a64f-3f51-250c-3d08a8140dec@mentor.com>
	<1682970.JZPvjNPrtm@peggleto-mobl.ger.corp.intel.com>
From: Sean Hudson <sean_hudson@mentor.com>
Organization: Mentor Graphics - Embedded Software Division
Message-ID: <4358098a-6b7b-c5ae-66b2-da2beb052595@mentor.com>
Date: Tue, 20 Jun 2017 08:27:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1682970.JZPvjNPrtm@peggleto-mobl.ger.corp.intel.com>
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 20 Jun 2017 13:27:23 -0000
X-Groupsio-MsgNum: 99114
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="wNLIOBaN4Q9cn8lnCmBGCdTbnNdGFc9h4"

--wNLIOBaN4Q9cn8lnCmBGCdTbnNdGFc9h4
Content-Type: multipart/mixed; boundary="6kR1xtvJKFArqGTp2PIrUlW9VxJC217IP";
 protected-headers="v1"
From: Sean Hudson <sean_hudson@mentor.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
 openembedded-architecture@lists.openembedded.org
Cc: Mark Hatle <mark.hatle@windriver.com>,
 Philip Balister <philip@balister.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <4358098a-6b7b-c5ae-66b2-da2beb052595@mentor.com>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE
 (CVE-2017-9731)
References: <1497868738.24449.41.camel@linuxfoundation.org>
 <a34e53ad-edce-faf4-0d4f-f7621f05d57a@windriver.com>
 <491966d0-a64f-3f51-250c-3d08a8140dec@mentor.com>
 <1682970.JZPvjNPrtm@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1682970.JZPvjNPrtm@peggleto-mobl.ger.corp.intel.com>

--6kR1xtvJKFArqGTp2PIrUlW9VxJC217IP
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 2017-06-20 04:30 AM, Paul Eggleton wrote:
> On Monday, 19 June 2017 5:31:10 PM CEST Sean Hudson wrote:
>> On 2017-06-19 09:05 AM, Mark Hatle wrote:
>>> It would be reasonable to write up a 'best practices' type document. =

>>> Explaining that simply due to the nature of building many of these th=
ings
>>> will be 'leaked' and where some of them are leaked through.  (Package=

>>> generation, compilation, etc for instance.)
>>
>> That sounds reasonable, although, TBH, if someone is adding credential=
s
>> to their SRC_URIs, I would expect that a best practice would be ignore=
d.
>>  Perhaps adding a detection routine that emitted a warning during
>> parsing for credentials in the SRC_URI might be warranted?  Thoughts?
>=20
> This might be useful yes. I think the stumbling block is that at the mo=
ment we
> would have to have it off by default and then the user is almost certai=
nly not
> going to know to turn it on. Perhaps this is another thing that we migh=
t check=20
> in a "production" vs. "development" mode where the user can easily swit=
ch to
> the former to enable a set of more stringent checks.

I'm not sure I follow.  What would prevent us from turning on a warning
that detected credentials in a SRC_URI by default?  Even with Richard's
change to prevent the information from propagating into the .ipk, it
seems useful to notify the user.  Personally, I'd like to know if one of
the recipes I'm using has such information in it regardless of whether
I'm generating a development or a production image.


--=20
Sean


--6kR1xtvJKFArqGTp2PIrUlW9VxJC217IP--

--wNLIOBaN4Q9cn8lnCmBGCdTbnNdGFc9h4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZSSK3AAoJEC2KalNZVFwRqdgP/0daF8cMMKedT1HlZiMUyHl2
adAlOJfkIn6qXWJ/YnmO+LjXybb/+yo1bKI0MaHZSev7OpFcgow2tsGNym5HqF8o
+boazhkqBz767jrjR7A3WERU3wiIDgPU9kJoD38EgtWupiUP3/3JxdCcaj/ApsN4
Pb16VB9XiSxgIbhDK0CTTpxA037Vo2K3KsrqOOQAaGEy/eNZOMPpTvROeG93pzaT
/IJXcTKgSpVo9t3Hf1Idw+KzEeS0s2GX2APzr6+eQCsS65Mz25KRgbyqOxkFwIYC
d0IraQQrLNqYfoHvo5NTvkU5YPZxrNapLSEJeaL67Nju8SF2CSqDYE2ng4l7uxF5
Xk7n3hW1J/eYIdIzYcU5JhT+x1Vp0T9rBTBstz20RUnhi/hypxi6MPiiozJEbLM0
pT7G/tu1tsS91V/CAtmK1nnFto7ArIkmKKeO07fSrb7u4Cgmn/ciQu2LyoghAfPy
lgH1M72e9Kj6Nbf/DXHWWNPrC6p9nmZRzXYulAItL9jU84ZWCZVVDrI9nESUiI15
4H0u0Om73WuCnVZOqEBdL3VBtexPXfgyJ9QxXjHjM5ncLqyDa6KEiUJq5qYA/PRu
VSpDQLbcASsXHFB7ITvo0lBDJ7D2VQRe6iQpbLlgbi5otDduljCYXLRI7fuPnEZu
cccwPK3uo5mKIuBLR/6l
=zLbS
-----END PGP SIGNATURE-----

--wNLIOBaN4Q9cn8lnCmBGCdTbnNdGFc9h4--
