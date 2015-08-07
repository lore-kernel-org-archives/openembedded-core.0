Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 80243767D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 19:22:16 +0000 (UTC)
Received: by pdco4 with SMTP id o4so48391259pdc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 12:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=mvbT8UfWMgqXjcyLSlbz7te36gqAInH9GX7+gnl3jYY=;
	b=Bj/i1c091D+jAHKK13eoM0tm8scsWe9EEG1mhc8xPQYSyrk+ivFuWNCNEw0pX9xpjA
	KCfSpIbbTGrvBSGJ9hbO62dYEUC+1uEWf0o4oVUlFwzOA+4cG9pKTv/O34AynVCj5b22
	CUPyFky9boljRdOS7c7LBaTTxYg2WcyoWrnIJQM9MbWj9bF+Pj/bvybzHavAN6syLJYP
	WUTYgryX4+tZX4t7mqhMOoCTR38+MTUyeQztMk47Kg0t+LTanNGu16BZlPrAjhRtxDOV
	qWSfv/hU4eNnX6v2kmxR+LGI1bU7yHf00nJczzHF1Ob8dtXt1wm0+5NIlKPQkxmx314g
	mzyw==
X-Received: by 10.70.38.136 with SMTP id g8mr17625175pdk.156.1438975336433;
	Fri, 07 Aug 2015 12:22:16 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	oc2sm10995172pdb.45.2015.08.07.12.22.15
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Aug 2015 12:22:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55C49FFC.4010006@linux.intel.com>
Date: Fri, 7 Aug 2015 12:22:14 -0700
Message-Id: <2D1774A7-EAD3-4A1E-ACEA-3CF23A09747F@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<e5437695391e1dd4fe0ecad10dec483cb0e3a8bc.1438262915.git.alexander.kanavin@linux.intel.com>
	<120CC689-4105-4DE2-8602-96A9BF548DEE@gmail.com>
	<55C49FFC.4010006@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/26] lsb: set PV to 1.4 to match upstream tarball version
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
X-List-Received-Date: Fri, 07 Aug 2015 19:22:18 -0000
X-Groupsio-MsgNum: 69147
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DFA56611-6169-49BF-A276-97BFDEEE32E7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DFA56611-6169-49BF-A276-97BFDEEE32E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 7, 2015, at 5:09 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 08/07/2015 10:21 AM, Khem Raj wrote:
>=20
>>> This allows upstream version check to work
>>>=20
>>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>>> ---
>>> meta/recipes-extended/lsb/lsb_4.1.bb | 1 +
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb =
b/meta/recipes-extended/lsb/lsb_4.1.bb
>>> index 6215b62..171a6c8 100644
>>> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
>>> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
>>> @@ -21,6 +21,7 @@ SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
>>>            file://lsb_pidofproc \
>>>            file://lsb_start_daemon \
>>>            "
>>> +PV =3D =E2=80=9C1.4=E2=80=9D
>>>=20
>>=20
>> it will send version backwards, why is this needed ?
>=20
> See above - "This allows upstream version check to work=E2=80=9D.

it seems a futile cause in front of regressing on upgrade policy

>=20
> Alex
>=20
>=20


--Apple-Mail=_DFA56611-6169-49BF-A276-97BFDEEE32E7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXFBWYACgkQuwUzVZGdMxRSHQCfcNqqyiTR3wuXk9fIib8+Kv7P
jVgAmQFvZnHFawJ1PA0GuXkvo50PCD9U
=UwO4
-----END PGP SIGNATURE-----

--Apple-Mail=_DFA56611-6169-49BF-A276-97BFDEEE32E7--
