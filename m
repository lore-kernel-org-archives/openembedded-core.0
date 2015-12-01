Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id A2888606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 07:55:18 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so213826341pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 23:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=WoVCSMR5DdO3oD50K0+tVovSirBxmC1R3OIieG4GVyY=;
	b=tFtY3rcieI/aqIU+p8Blzw8blGiRkd5WS8/eW4UYK7SkdatavhSCELXnoT/U6Zzf+O
	J2mwiMaF0HwiksK2vXbb6mxc6B6pls+2871eowSuwAW6WpUTjJAtY2Zc+AzvQkkh767X
	1ZDk3dc+W7Ka9ZHcweVvcqL/zq4apf2i0O2gNiJv2Enmq3Pe7ZNBMB+8iRf7UiTCVziI
	/lXnfmBsnt88PZnG/rOJ9h/HUerwNLDS6HB5ZcfIVEx7GKZCLsbB/vWQzgFE69rI5DYl
	j+dWl7yPNsnzvAjZuC7FsgeBqq77xUcXerGjrZgpBOt5g0C7rrAs27N62Er7rvGlCJ5v
	OtvA==
X-Received: by 10.98.66.80 with SMTP id p77mr77567966pfa.100.1448956519631;
	Mon, 30 Nov 2015 23:55:19 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:1d08:52b6:b188:1466?
	([2601:646:8802:5d5c:1d08:52b6:b188:1466])
	by smtp.gmail.com with ESMTPSA id
	f76sm55834740pfd.49.2015.11.30.23.55.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Nov 2015 23:55:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=Ui+0AJ_OJ_w_hJgKk-ofM7KjnEpZ6LUbZ2o3J1c7_VGw@mail.gmail.com>
Date: Mon, 30 Nov 2015 23:55:19 -0800
Message-Id: <64717C6B-4EE7-420A-B87E-EF6D9298173D@gmail.com>
References: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
	<CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
	<CAJ86T=X_r_OU1RfN8nYJAJSYXwqEgvK17Hn87_+AfoGQAn2ocw@mail.gmail.com>
	<CAJTo0LbLQ51w5+MDkXKyFvDzzz=8UFjDi-s=JyHy2WoFFx2y2Q@mail.gmail.com>
	<AB05D454-7DF8-45A1-9222-AC42E74CAD2A@gmail.com>
	<CAJ86T=Ui+0AJ_OJ_w_hJgKk-ofM7KjnEpZ6LUbZ2o3J1c7_VGw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: vmdk images with musl libc
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
X-List-Received-Date: Tue, 01 Dec 2015 07:55:21 -0000
X-Groupsio-MsgNum: 74160
Content-Type: multipart/signed;
	boundary="Apple-Mail=_677E2FDD-64D7-4CD7-8B43-95ABC461EEE6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_677E2FDD-64D7-4CD7-8B43-95ABC461EEE6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 25, 2015, at 5:31 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Wed, Nov 25, 2015 at 4:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> On Nov 25, 2015, at 1:56 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>>=20
>> On 25 November 2015 at 21:40, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> So would it be correct to add exactly those lines to the oe-core =
mtools
>>> recipe?
>>=20
>> Yes.  Pretty much every dependency on glibc-gconv* should be guarded =
with a
>> libc override of some sort.  There's an open bug to give locale =
packages
>> virtual names so this isn't a problem anymore, I should do something =
about
>> it!
>>=20
>> I have already posted this as a patch along with my musl patchset for
>> OE-Core ( which I need to send v2 addressing Phil=E2=80=99s feedback =
on the series )
>> here is particular patch
>> =
https://github.com/kraj/openembedded-core/commit/11c054232722c6a96fd54f40f=
664da4a754fd342
>=20
> Yes, sorry I missed that!
>=20
> It looks like you only updated one of the mtools recipes though. Could
> you update both in v2?

I planned to do a separate patchset for GPL-2.0 recipes after main musl =
support is merged.
but this one I can include in v2 series.

>=20
>> Ross
>>=20
>>=20


--Apple-Mail=_677E2FDD-64D7-4CD7-8B43-95ABC461EEE6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZdUmcACgkQuwUzVZGdMxQ+jACcCbNhcNBaDHDMquShooJE+D36
mDEAnjd0k2j1EUb8GOoas2DPzvfwaVSM
=qxS4
-----END PGP SIGNATURE-----

--Apple-Mail=_677E2FDD-64D7-4CD7-8B43-95ABC461EEE6--
