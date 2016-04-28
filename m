Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE8E731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 16:42:06 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id y69so35771743pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=QpihlIt/WjqAp3Y9rF3EmNZN2mxSnxHoxfZOf8nRjJ0=;
	b=EUqC9zbLxbahu55GKTCNktT/n8dRY9M08OgaNqemcj1zSBOb4apXPjzBesUWtJ5Itu
	6PYfLntnIF5X2hekwlzoeequNQsrhXvn15yB8iljQKB+Jz4bljJbTUECKn0WIoT7DaM3
	FIVVhOslKHuRQ3cmdJfAsjyWhaoyIIREFwuVjMpnBtTSGI0Pi5maGGiSeMPFnOdLwpOv
	wnfVVOzeaFqqxWMtALU9IZbzf4VBuwZDuJ+DUvGtu+b5E8Qki4u19l+2Bo/7AXyvBBZ1
	02RZLpi6+CMZTTsteeONM3T3oYV+v/5H85HEnUvSWfvjhZjRLEA9Vk5yJIQp0Vz5WrCO
	kinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QpihlIt/WjqAp3Y9rF3EmNZN2mxSnxHoxfZOf8nRjJ0=;
	b=mmqeh6sIjuMC9EGu+QPMRKlLlY9IY33Jm2H3QVr7eRcVDFTVjsnBE1nZCd5RuNQUmZ
	M53cTQ2nlDrckACC/kjArb2oJrRHBnB4lTixy0rKmfz01PXsjbtjWU49cCX7ggpwxOFw
	ZCh9fRR/pgBbukUNLSrF4grBZt+2WxapgdNIjMID85mLovw23WJfMKsdwoIJiq8j+3BH
	5AxIE228Z8ZAYYq7Dhp2O4k0k7n85Auqbx2qOK2Dxq0m7mNSTFUtR8Ob12qK7Vxabtta
	etHcR4pPZ7b8Z59hkKdMSZwdLK84+olz9tOsn9VCafVZ/tc21HGs/QtW8gXTO1S5pJMd
	/0tQ==
X-Gm-Message-State: AOPr4FXH3IN3qViJH1nI1TilHdzDsESUW/qkI8Ma0UKe2wK1DbAl7w5D9v+LiwGcx5W61g==
X-Received: by 10.98.76.216 with SMTP id e85mr21971876pfj.121.1461861727392;
	Thu, 28 Apr 2016 09:42:07 -0700 (PDT)
Received: from 10.25.118.171-ra01.pleasanton.ca.sfba.comcast.net
	([69.241.124.150]) by smtp.gmail.com with ESMTPSA id
	yl5sm16592572pac.38.2016.04.28.09.42.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2016 09:42:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461861583.5465.61.camel@linuxfoundation.org>
Date: Thu, 28 Apr 2016 09:42:01 -0700
Message-Id: <5B66CFA9-28BD-4CC9-9876-1469B8C893A6@gmail.com>
References: <1461850065-8839-1-git-send-email-joshua.g.lock@intel.com>
	<996BAFC5-CEC6-4296-A8BD-E7EA383A754F@gmail.com>
	<1461860536.5465.59.camel@linuxfoundation.org>
	<E9C7C73B-7E2E-4330-B65C-8D9B555A2C57@gmail.com>
	<1461861583.5465.61.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] security_flags: turn potential string format security issues into an error
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
X-List-Received-Date: Thu, 28 Apr 2016 16:42:08 -0000
X-Groupsio-MsgNum: 81377
Content-Type: multipart/signed;
	boundary="Apple-Mail=_38872483-30C3-43F9-B0AC-19617506CB53";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_38872483-30C3-43F9-B0AC-19617506CB53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 28, 2016, at 9:39 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Thu, 2016-04-28 at 09:35 -0700, Khem Raj wrote:
>>> On Apr 28, 2016, at 9:22 AM, Richard Purdie <
>>> richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> On Thu, 2016-04-28 at 08:58 -0700, Khem Raj wrote:
>=20
>>>> Can we use _remove operation instead of introducing a new
>>>> variable
>>>> and emptying it out here.
>>>=20
>>> I actually suggested we do the above. The reason is that this way,
>>> the
>>> user can configure which flags they actually want to use. "remove"
>>> also
>>> has the problem that its near impossible for the user to override
>>> further.
>>>=20
>>=20
>> Thats right, and I was of the view that security flags should be one
>> set
>> and not offered at combination of multiple options, we just end up
>> increasing
>> the test matrix.
>=20
> OE-Core will continue to test with all of them, I think its better
> thantpeople can disable part of this, than have to disable everything
> for their layer though?
>=20

I see your viewpoint. Mine was to not offer that option at all.


--Apple-Mail=_38872483-30C3-43F9-B0AC-19617506CB53
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlciPV0ACgkQuwUzVZGdMxSO3ACff+8xnOtMhx5gSthpmliJjc3W
ju4AoILW3XmE3OqXc7nICfGg4cXYwYXq
=j3/C
-----END PGP SIGNATURE-----

--Apple-Mail=_38872483-30C3-43F9-B0AC-19617506CB53--
