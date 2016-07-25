Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0009A7017B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 20:56:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 25 Jul 2016 13:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,420,1464678000"; 
	d="asc'?scan'208";a="1028914141"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2016 13:56:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1468358990-14377-1-git-send-email-anibal.limon@linux.intel.com>
	<1468358990-14377-3-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LZ_jV7BoyhGAn_xjydZMCFsbcdp_5dvaGTgbNy5MDsfqg@mail.gmail.com>
	<57964A92.1070204@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57967D3F.6020408@linux.intel.com>
Date: Mon, 25 Jul 2016 15:57:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <57964A92.1070204@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] classes/testimage: When image is systemd enable debug log level
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
X-List-Received-Date: Mon, 25 Jul 2016 20:57:01 -0000
X-Groupsio-MsgNum: 84879
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="1l56WKuOH2KF1k9FQ8UMrRPFvknai8jhl"

--1l56WKuOH2KF1k9FQ8UMrRPFvknai8jhl
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 07/25/2016 12:21 PM, An=EDbal Lim=F3n wrote:
>=20
>=20
> On 07/15/2016 02:34 PM, Burton, Ross wrote:
>> On 12 July 2016 at 22:29, An=EDbal Lim=F3n <anibal.limon@linux.intel.c=
om> wrote:
>>
>>> +            bootparams =3D 'systemd.log_level=3Ddebug systemd
>>> .log_target=3Dconsole'
>>>
>>
>> The problem with this is that it appears that logger output then goes
>> *only* to the console and not the journal or syslog, which breaks self=
test
>> (and expected behaviour).
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/=
builds/851
>> for example, which goes green if I revert this patch.
>>
>> If this is the case then it would be great if there was a
>> journal-and-console log_target I guess.
>=20
> I'll review the issue i guess the journal test is failing for something=

> else but if we change the backend to journalctl systemd starts to fail
> with timeout, seems that create a log of I/O writing in the journal
> database.
>=20
> 	alimon

Reviewing the master branch without my patch seems that the issue for
don't exist /var/log/messages is an old one because the file isn't
created. The timeout issue was caused for the reasons that we now (I/O
load) but the syslog failure occurs without my patch also.

	alimon

>=20
>>
>> Ross
>>
>=20
>=20
>=20


--1l56WKuOH2KF1k9FQ8UMrRPFvknai8jhl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXln1BAAoJEGJqcE9h3glgZ+UP/2gWoV4eGkKjLYO8RkZJXq5h
TphyXERRVAFBXjJ7wVyMA9ZiH10Wu5jBNXPhR+ywW9wJzjJ/jyejNlcv5UiB7BvH
qCPog79klETRXyKfvucdEO2UsLSYozKQwdJEcjGTQdTtkn8Yxsz3N6Ngi1wXgTfQ
Ok3vQs43N+mGzUYi+jU3LkC62blmoCjizJon7EtwtGtsK8PLziCBPoVhu6Wrw7ao
mXytFgjxGrAU4ZTJOTdMhGmyMToyN+RW9rymeZ/Siya8IF2fb7M7D93taDei7Q4h
EkKpQMoGN3qq1fYCD16RTUOPWF3TPwCdZZl6oFHI7hJ9/vd67yMPbp6RRSqQMoh6
lfPdRcYHFepxAa9UAa8y8s/c3em7gfhyTBygMGBKz+9Ny0gGkQpehjp1DavesUSR
M9WWJg8p1jUBmW/l1K3IIAWAE59i1Z91Wzlnthz3R/XxBrso7ePcMHI9m5ZBq6u6
KMWri9qjYllVdVyXQ5woujpcxRRk8bC9icZq8dVysysjSwcGHYVwy1pmFrx91ywy
WSh4R6fLJeIQUAtPs/HBztPg9mKVE7VzNF+60PdUcGdqC5AQwvBgu0/xjtDeyCCO
rJG9pVrF+NbLhdWEnih3z1VarsJ0OJKrAKfgfDH6MvbuuQOJKUfw2AaeLRniN9kb
ieZFazXn7xlqENAmmjIT
=OoQ4
-----END PGP SIGNATURE-----

--1l56WKuOH2KF1k9FQ8UMrRPFvknai8jhl--
