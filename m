Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6F53C6E668
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 21:43:51 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 206so656553pfu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 14:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=LNGX2l2En9ShFRfWHiM9RiTEN7oFo7gv3DZFBxZGSN8=;
	b=QwlHP1rfAU0LX/3zbn6XvdG1uxHEBll3Xbc09yqgjtSwvJIUveuMGvujxq5CksPhqV
	z5eeaW05QYlcwsOmjNBVcUuaJlLbpdTOHhJonY1iij/LQVLcbH5X/sd4ZDu5vJtXodw2
	1N3VVaQgET2oNNDV6d0ECZR2wedLBXQJWeDjYhK8SqOeKvXUQG1V2QhTNsnFEVMFzCUh
	wSu8nHQxzT2X29zWIF82UMmFmHfn1NyGCcergAqhuQAApMcnzMfEdS0oKzbUIlabZeiQ
	vvTGD+Vk2fdETNRa4j3N+crmLcacf4WoSz7RgL6ipcZ+5HelRyg7phtDcH99UHdd+OR2
	AS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=LNGX2l2En9ShFRfWHiM9RiTEN7oFo7gv3DZFBxZGSN8=;
	b=PSS2Km6JjG7W8iA4earbGakfiFovlcjZvm8Bta85ix/83UYavwOEAZi8EKU3rTePsw
	K3B4X6pk/UbaMWFvkyk2/jz5MM5SXvZYpKFOfRJDQcquUawuBb0NhJEf2eE4PCUuMDzs
	5y7IwsX5gGt2a3DcNaERriSUjl7f/ES07HF+UBedbSfUsztx2HOVZjmS8H62SCExxrzL
	S7jkhc3LUjIe9Ied5Zbr2wNfTMOvA39GyxCMm2E19dzOqLZClGJjyqYA2zkScCKSFvv0
	3mz482sNCz7VOfwejaz2nzlCXFg+yPk+Ipfl9eRrEycLvUIP66yhIgpxS65/RN3MCweM
	UiMw==
X-Gm-Message-State: AOPr4FWw0MVUOIAHaH/pk8G1AzwQC0zEBp0uQz51HU7nzBVZHf2V5VgfNgIiBlrcaOoL2w==
X-Received: by 10.98.52.195 with SMTP id b186mr55197153pfa.9.1462225431866;
	Mon, 02 May 2016 14:43:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:8dc7:7f44:e6aa:c692?
	([2601:646:8800:5a9a:8dc7:7f44:e6aa:c692])
	by smtp.gmail.com with ESMTPSA id 133sm171054pfw.35.2016.05.02.14.43.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 14:43:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <57272877.7000905@linux.intel.com>
Date: Mon, 2 May 2016 14:43:47 -0700
Message-Id: <1DE0A7DC-F9C7-479D-A174-F1364487DDCF@gmail.com>
References: <571E0BF3.8080408@linux.intel.com>
	<CAMKF1sq+Bk+74RQbdevy9U6QtVpJ1UB_ghq5THHf4=jNK0271A@mail.gmail.com>
	<57272877.7000905@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: moving OpenEmbedded-core to Python 3
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
X-List-Received-Date: Mon, 02 May 2016 21:43:52 -0000
X-Groupsio-MsgNum: 81484
Content-Type: multipart/signed;
	boundary="Apple-Mail=_631C95C5-8FE7-413E-96B9-F23DF917E444";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_631C95C5-8FE7-413E-96B9-F23DF917E444
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 2, 2016, at 3:14 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 04/29/2016 11:43 PM, Khem Raj wrote:
>=20
>> Can you clarify the scope, are you addressing the case where target
>> images would prefer python3
>> and you are making sure that packages that use python on target are
>> ready for using it.
>=20
> There is no way to set a 'preference' for Python 3. Either version of =
Python is pulled into images either through dependencies, or explicit =
inclusion into some package list.
>=20
> I'm going to move recipes that are dependent on Python 2 to Python 3, =
whenever possible. I'm not porting the upstream code from Python 2 from =
Python 3, just configuring the recipes to use Python 3, when the Python =
code in them has already been ported.

OK, that is a safer bet.

>=20
>> bitbake itself is a separate task but then we do write scriptlets =
that
>> are executed as part of
>> build, are you addressing those too ?
>=20
> Not sure what you mean here exactly, but if the scriptlets are =
executed by bitbake, then I'm not addressing that.

I was referring to bitbake itself needs python2 to run but if we have =
code like classes etc. or external fetchers
with assume python2 since bitbake is python2

>=20
>> Thirdly, there is general pythonic code in metadata meant to control
>> build policies
>=20
> Again, can you provide an example?

Snippets are all around in metadata where we use python snippets inside =
recipes or configuration metadata. in general we should
be using python3 more, but scoping these changes clearly would help to =
set the expectations from user point of view.

>=20
>> Which of these are you addressing specifically.
>=20
> Please start using the question mark (?), so I can see more easily =
what is a question when responding.
>=20



> Thanks,
> Alex
>=20


--Apple-Mail=_631C95C5-8FE7-413E-96B9-F23DF917E444
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcnyhYACgkQuwUzVZGdMxSK3gCfc1HSHsubX5X71ab8pmFrnjGi
ZCEAnRNeIEIykMs39eQDaHtJwhpXCLBU
=Gc05
-----END PGP SIGNATURE-----

--Apple-Mail=_631C95C5-8FE7-413E-96B9-F23DF917E444--
