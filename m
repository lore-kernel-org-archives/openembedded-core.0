Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3832C601A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 17:07:13 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so1375934pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 10:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=+CNvxfPYDiVKARCsvhnKnqg+yBV52bHLJiaQuntPd0o=;
	b=MgXgRLk5F2qdRtLhTvEM6qd2HA9rm0FxeyjIyW6DluYRiJ6txXILB4fYnBtzleJ4IU
	K+xqWXv1aB/7wKhjnX9xISjZvXHFn9sfee08EoXCHmaIeiRq2JUavC+742LK7maKSy1h
	X+4LLDhAW441npbr+PUxEi+eiw+QWmehHe/mCYh4X46m0eYRcOB1U56/Pxyl9DJbd+UE
	D/XLNxFLGDmxRAo8CAEUHosgm7XjnPPQNUhXMo50aoAxX0pIVSeDhu7BePmHX1BbMNAk
	WNfPKQa4b+oewVVWmvE+P5BTwfynAobAzshU1EQYCrEkRo5ZKQjUW19kfNraVFG4TVVd
	sPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+CNvxfPYDiVKARCsvhnKnqg+yBV52bHLJiaQuntPd0o=;
	b=bNtM+F+bVI0no9b7Jo9NBHP+BjEaUtnULTxO0mhDGITO6tnY5qPByGHB/ELNjwbxUe
	1owtwzw09419nguR8lnp8/bC0ip4aQyXMgyKm/8gmdhRpxg1ud0KLWBUUYt0sr/22VYw
	lM3fIpfNc7euOzKm+D8mg9tF0NZ/gs9dDB82l+HYCtJ4Jb42wfBzYfdljdqNYQU2XODO
	0iLNlAJt1VFe8kqI/xZEw4Cmd0eehXeE9FsgDC37SiUicjaYTVCyxXFxIXl87YTpUKwz
	SohLmNP2fYc+yxTy2IuRHlnINmNNDUHBHQHXSTUKfqxJR6rKKckBPTT5E58LINFesvqI
	xAVQ==
X-Gm-Message-State: AA6/9RnCcn8iuXQsabbF/Mto0mUTYw4QULIjWfCZB6wvXTmWbsTaKj65ddhPRIciEyGnVQ==
X-Received: by 10.66.51.129 with SMTP id k1mr23456875pao.5.1475773635164;
	Thu, 06 Oct 2016 10:07:15 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:d4a2:778a:22df:ef?
	([2601:646:8882:b8c:d4a2:778a:22df:ef])
	by smtp.gmail.com with ESMTPSA id
	a137sm7156697pfa.72.2016.10.06.10.07.14
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 10:07:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1475746035.30475.515.camel@linuxfoundation.org>
Date: Thu, 6 Oct 2016 10:07:09 -0700
Message-Id: <20DFBC70-C0AA-4422-8E40-CAA4AB2E3AA0@gmail.com>
References: <20161006085422.GA2921@jama>
	<1475746035.30475.515.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: linux-yocto and linux-libc-headers are again going backwards
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
X-List-Received-Date: Thu, 06 Oct 2016 17:07:14 -0000
X-Groupsio-MsgNum: 87972
Content-Type: multipart/signed;
	boundary="Apple-Mail=_76E51225-1663-4CA6-8587-B4C28AD76E63";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_76E51225-1663-4CA6-8587-B4C28AD76E63
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 6, 2016, at 2:27 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Thu, 2016-10-06 at 10:54 +0200, Martin Jansa wrote:
>> Either use 4.7.99+4.8-rc4 like most other recipes do or at least
>> "4.8~rc4"
>> which might sort lower than "4.8" (but needs to be verified for all
>> packaging backends first).
>>=20
>> Ignoring all this completely results with what we can see in oe-core
>> now:
>>=20
>> ERROR: linux-libc-headers-4.8-r0 do_packagedata: QA Issue: Package
>> version for package linux-libc-headers-dbg went backwards which would
>> break package feeds from (0:4.8-rc4-r0.0 to 0:4.8-r0.0)
>> [version-going-backwards]
>=20
> Sorry, we did screw up there :(. Lots of moving pieces and its hard to
> catch/remember everything.
>=20
> I wish we knew for certain whether ~ works properly everywhere. A good
> case for some unittests I guess=E2=80=A6

I always wished there was a magic wand ( a sanity test) sort of which
was able to catch the package feed upgradability

>=20
> Cheers,
>=20
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_76E51225-1663-4CA6-8587-B4C28AD76E63
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlf2hMEACgkQuwUzVZGdMxSSrACfSg6lc4v9EDWuSPLvNCMEB+gQ
xfsAnReczebkY+mQn9YFj5DsQw7MWs5V
=LZJx
-----END PGP SIGNATURE-----

--Apple-Mail=_76E51225-1663-4CA6-8587-B4C28AD76E63--
