Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 80A34601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 19:47:13 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y134so249447pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=0aPsZ1dWjS7veFlyjJlHPXj4zti134EbVyqy/7Rsuzg=;
	b=UiHLphkunuDCbHED7ORHp/WVsVk4N0omgLftcCTs6PWvF+qqbfwUKXHBajljH8GLpK
	IZfmfxpAwbBPAtsBb6Cwrq7kazc7fjjqPu7pPgnIis1Z6+xALQ1KwbdmGbNv70srL9i0
	5rdIpiAbBsPdp2Wg83b7e+ndLmzqMywUgmx3qyZ1Rf0KKscQUZon9YgmNm4LMIngdsCc
	5F8Q7WAOPWQwJq9JQuDi4Y6gMJu5Vdt9YoyCXNVVPxFjGfqc/eB3XEs2GKv+9OSgFWMz
	UxRzFuJW7Gay6BiB+a71oMAX3B6C2DPujs0kuU9fHDP64qo1akaFsJnvYlHhYe7q4UZ8
	KsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0aPsZ1dWjS7veFlyjJlHPXj4zti134EbVyqy/7Rsuzg=;
	b=R+aDsspEtANfUyLYBhuJ5QJfEYbkn5dYKlrSStiZn2jCrgYSqZnGrU0DLurbu5sLcT
	RBIHxzNpRs9xc+28ByOquxZfDi9a2KlZB3VBCgv21ytmGVEq6GG7BrROJtaXn+0KrsxG
	jNcu2ZmVoOuQ43/XCksXGduLkUU78w4auhKhOyHop/Gw49k/D8vd5u0QF77elD5L9X8C
	rT91IFv3Uc7uX/Rh7Ycdd4NEsx01DihoU5Lo0Ef3uX+RHKuc7S7vkrf5IBKcFpl9C4Ke
	ldHInTg9A2nJQh7ZjeGtfyH+OaY1JB/L2b5sRH2daA9r38sc5cFi/wampgXabsUpNVVW
	85zA==
X-Gm-Message-State: AEkoous8rWu0DIOakRNDSzWxHd4VGzY89CiPEkL9TNd6Ybu8LXX9FineOfU7MGrKNUNgTg==
X-Received: by 10.98.64.193 with SMTP id f62mr20223963pfd.141.1470944834657;
	Thu, 11 Aug 2016 12:47:14 -0700 (PDT)
Received: from [192.168.0.5] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	184sm7249360pfg.20.2016.08.11.12.47.13
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 12:47:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6cac214c-b73f-af4d-655f-f911788cdc3e@windriver.com>
Date: Thu, 11 Aug 2016 12:47:54 -0700
Message-Id: <F7382BD1-F606-47F7-9EF2-7F347F9D06D7@gmail.com>
References: <cover.1470636212.git.Qi.Chen@windriver.com>
	<8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
	<CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
	<6cac214c-b73f-af4d-655f-f911788cdc3e@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: change localedir
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
X-List-Received-Date: Thu, 11 Aug 2016 19:47:14 -0000
X-Groupsio-MsgNum: 85681
Content-Type: multipart/signed;
	boundary="Apple-Mail=_16B70E0B-873B-4765-98A4-188AF7AF4667";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_16B70E0B-873B-4765-98A4-188AF7AF4667
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 11, 2016, at 10:11 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 8/11/16 11:26 AM, Burton, Ross wrote:
>>=20
>> On 8 August 2016 at 07:04, Chen Qi <Qi.Chen@windriver.com
>> <mailto:Qi.Chen@windriver.com>> wrote:
>>=20
>>    Previously, localedir is set to "${libdir}/locale". This would =
result
>>    in locale database installed in '/usr/lib64/locale' in some =
multilib case.
>>    For example, if we build out a multilib x86-64 self-hosted image =
and we try
>>    to build projects on this host, things broke and the following =
error appears.
>>=20
>>      Please use a locale setting which supports utf-8.
>>      Python can't change the filesystem locale after loading so we =
need a utf-8
>>    when python starts or things won't work.
>>=20
>>    This is because '/usr/lib/locale' is the default one. And actually =
the
>>    nativesdk-glibc is now set to use '/usr/lib/locale'.
>>=20
>>=20
>> This is irrelevant as nativesdk-glibc is configured to read the =
*hosts* locale
>> directory.
>>=20
>>=20
>>    Thus, we change the setting of 'localedir' to =
'${nonarch_libdir}/locale' to
>>    fix the above problem.
>>=20
>>=20
>> I see two issues here:
>> 1) should binary locales be considered shared in multilib =
environments? (libdir
>> vs nonarch_libdir)
>> 2) what packages are not respecting this variable and hard-coding =
/usr/lib/locale?
>>=20
>> I'm guessing WR think yes to (1), and is the glibc patch you also =
sent the
>> fundamental fix to (2)?
>=20
> Binary locales have an endian and alignment setting to them.  If a =
platform
> supports both big and little endian, this common locale would not =
work.  (That
> is extremely rare....)  Also if a platform supports different =
alignments in
> different libraries that could cause an impact as well.  (This is also =
extremely
> unlikely.)

Are there any practical existing usecases ?

>=20
> The not-binary locales have no such issues BTW.
>=20
> --Mark
>=20
>> Ross
>>=20
>>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_16B70E0B-873B-4765-98A4-188AF7AF4667
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAles1m4ACgkQuwUzVZGdMxRRVACfcxtcTWE+kjXgB5QXACR431zG
1cQAnj6SJuSNVOmQPRaamE1dXf0FxGr3
=1qVf
-----END PGP SIGNATURE-----

--Apple-Mail=_16B70E0B-873B-4765-98A4-188AF7AF4667--
