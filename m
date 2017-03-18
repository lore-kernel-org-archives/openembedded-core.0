Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA6977B33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 02:17:44 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 81so4028668pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 19:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=s7c0niihJGVFKuIksCHQroXTyCAKwyTSTD+W2KCKH5M=;
	b=UxmJk0dIvOqLORy1wwVHft4RVeADsO5HFIFHangsJBpA/pETJbPQ7w+BJtBEHt89c6
	vb07b9JCzF53MprJWSTPCibrVA7CoWmeymhfwiBz6qFXFwC72N+aawyHg8SHj21DP8CO
	DsXfrUM7baf5wIwMYUMzLun0Bw2/TMdn8ETaa5ZM8HnzYi0JKRgObc5PWzHJwEblIqMw
	HKDN23YvO7/PvJ44bE9FCELnWUSC9EdWYqO9/yZVglqcoIk4trU2L108YeTRdRRLmdIv
	Vgijfs3QUQUm8cAt5Rhnt4MHPzLVcaMYIrbgq1Pdgw1udX1SE9i9KhPabneCnpnoVt80
	bJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=s7c0niihJGVFKuIksCHQroXTyCAKwyTSTD+W2KCKH5M=;
	b=o+RK2EKuXicUoKCLep7qyWnftmoijlE+d1dTBPLr8PFZLGxmkmb/1Jjiay4Fq+RRDi
	XUMjCUXlksg/ViKMLuU4iODgT/BsVcHO0hczwU2eGRTsRJ0ASg0vsN8UhwF/JNdI89wC
	zKuTuumpv1cgifY24/jfDpB4n7ghdZkJNWGLjpDLZ2cN+4KD8Riz2gQkysGm9OhN9FvF
	0bnBeBA9pqyEjrU4UlHAnZY5hVwE9ojf7ARCCOAjVPPoCmu0CMDFYjIkBbVymlTP0J8q
	WPaikwL3sD3IqDSKF6LUvqXcqrl+CAsljwP+aVBZOZMzl7guTZW51Ct9wLmbgX3RkHF+
	MNAg==
X-Gm-Message-State: AFeK/H1htkIY5bE8plSOU+eRCSMJo67lqwTHkvE0wqowe+YKZBSGJbL4+v/Sd76aL8JDvw==
X-Received: by 10.84.217.2 with SMTP id o2mr24136820pli.51.1489803465897;
	Fri, 17 Mar 2017 19:17:45 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:103a:47be:7409:ad60])
	by smtp.gmail.com with ESMTPSA id
	w28sm1504262pge.25.2017.03.17.19.17.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Mar 2017 19:17:44 -0700 (PDT)
To: Daniel Dickinson <cshored@cshore.thecshore.com>,
	Gary Thomas <gary@mlbassoc.com>
References: <20170317195515.35729bb7@danielf.thecshore.com>
	<3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
	<20170317213807.377236b9@danielf.thecshore.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c72438d4-adb6-0c1c-136c-eeae2ef3b8a8@gmail.com>
Date: Fri, 17 Mar 2017 19:17:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170317213807.377236b9@danielf.thecshore.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Hints on submitting to OE-Core
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
X-List-Received-Date: Sat, 18 Mar 2017 02:17:45 -0000
X-Groupsio-MsgNum: 94906
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="g9Ag9thFJcdOsmFrr01jH4gB38uiDruUA"

--g9Ag9thFJcdOsmFrr01jH4gB38uiDruUA
Content-Type: multipart/mixed; boundary="qSAvv1UaEeVNt2To7aXf0hMcq1pUEHlRA";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Daniel Dickinson <cshored@cshore.thecshore.com>,
 Gary Thomas <gary@mlbassoc.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <c72438d4-adb6-0c1c-136c-eeae2ef3b8a8@gmail.com>
Subject: Re: [OE-core] Hints on submitting to OE-Core
References: <20170317195515.35729bb7@danielf.thecshore.com>
 <3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
 <20170317213807.377236b9@danielf.thecshore.com>
In-Reply-To: <20170317213807.377236b9@danielf.thecshore.com>

--qSAvv1UaEeVNt2To7aXf0hMcq1pUEHlRA
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/17/17 6:38 PM, Daniel Dickinson wrote:
> On Sat, 18 Mar 2017 02:21:30 +0100
> Gary Thomas <gary@mlbassoc.com> wrote:
>=20
>>
>> Have you read this?
>>    http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbed=
ded
>=20
> I hadn't read in detail yet (I've seen similar before and from
> skimming, it's about mechanics of the process), but I was looking more
> in terms of coding and/or style guidelines for the meat of the patch,
> and/or hints/tips on getting things accepted from the point of view of
> things other than mechanics of patch submission.

If you read through that link Gary pointed, there are links to two other
documents one of style and other one patch message guidelines

there is styling scripts for metadata files, you could use that
https://github.com/openembedded/meta-openembedded/blob/master/contrib/oe-=
stylize.py

As of meat of patch, if its fixing something and you are articulate to
explain it in your commit message and in general review cycle, you have
a better chance of getting it accepted, but you have to start submitting

> =20
>>>
>>> Also, in the layers list I'll be asking about some build issues
>>> that I don't see with a manual bitbake, that look like missing
>>> preqs on a build server, unless the layer should be requesting
>>> installation of host files somewhere. =20
>>
>> Some tools required by ${HOSTTOOLS} are missing:
>>    cpio chrpath gawk diffstat makeinfo
>=20
> As mentioned these are openembedded.org autobuilds of submitted layers,=

> so I was kind of hoping there were something I could change in the
> layer to make it work.  I guess the build host or chroot is missing
> packges.
>=20
> Regards,
>=20
> Daniel
>=20


--qSAvv1UaEeVNt2To7aXf0hMcq1pUEHlRA--

--g9Ag9thFJcdOsmFrr01jH4gB38uiDruUA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljMmMcACgkQuwUzVZGdMxToBgCfYyu/i8/lNIM7ab4C4jAGABzO
eFAAn37RRs4GDaR5fgCj4lvMPx21iL/g
=lqLI
-----END PGP SIGNATURE-----

--g9Ag9thFJcdOsmFrr01jH4gB38uiDruUA--
