Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E477B719EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 23:41:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i85so2800892pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 16:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=+Krbaqqx2fBWxkahaJPthRfvu2nDO0a23brC00o5K48=;
	b=MeeekUDF/rTwLqS1cybtdkmhHQkzNGNSL1PxuR7lbkrUFiVP2wiypMLPx/j/caT6VI
	8MTTCCW/dGU6m5YM6OZX/AiZl+rlrVsixJGBxQPQsJk1kyPmlMceFhoZXBCVBiGd8opw
	9+d+vcz9Nd060pwDKTTcpN/QjJmgenV9eK/y/w7vItnf5U31hptaxYtw+RmDZSwtqHK0
	EeZksFrLmhCVtr+i4DaTq3wMnnm9MjyVNWC3vyxTUYrzeTEzYM4fe0/pxR0Zvwx2POsu
	UwZC8Du2WAjsXW+cj8H7DoYlBcABcueZP4/VI8ew2EJ5/RupP1BtXHqwjaq9i/NZ7Imw
	HERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+Krbaqqx2fBWxkahaJPthRfvu2nDO0a23brC00o5K48=;
	b=HSO5xny8Zisod5Q0ZR8FhDOgOnaap6CTVdMvAAfQRwGlc4OLZiIdrj1xPjRRnMCQdT
	Xv3sPpKPWnoRPksLwxQMb/Hl1Z7F94CnrcYWIP27hvfYx8d8vscQNQ7EBBgktdSWloF7
	8Uy/hpM7UZQGsr5r2PvyfDufGWQ7mILhYc7jP9aatTf9kuRn/VK2N/8MCZm51L28o2yk
	cCgT6wR3Ed7jxB+/mRVi39XytK35zLwuZ6w1NVZm/YNtaGCrLd33opNmbQQoNx1WQEVr
	dVfbq6KlIzFNkaegMj1muhPpbJOuyjA2HqymrONxCv/lcuFUWPFKu4NTP+xmgUTgNyRy
	QD5Q==
X-Gm-Message-State: AA6/9RnYj9CsCuRnEdhGI5pz5tImdo+ixJ8Hbcr/WZnSY6WvYIkCFmvkOFjr4Ome/VkhNQ==
X-Received: by 10.98.151.17 with SMTP id n17mr1067639pfe.73.1475538087026;
	Mon, 03 Oct 2016 16:41:27 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:902f:13d5:e6b:1cac?
	([2601:646:8882:b8c:902f:13d5:e6b:1cac])
	by smtp.gmail.com with ESMTPSA id
	v24sm49725824pfd.1.2016.10.03.16.41.24
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Oct 2016 16:41:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=XHwvTiizexmGZP73CA+CGAxbosp8OuPbPoHi9AK_cYFQ@mail.gmail.com>
Date: Mon, 3 Oct 2016 16:41:19 -0700
Message-Id: <E9B5E08A-4DAE-4FD7-870A-B6C88259F009@gmail.com>
References: <1473711245-24377-1-git-send-email-armccurdy@gmail.com>
	<C620C32B-A94F-431D-936D-B07D55673384@gmail.com>
	<CAJ86T=XHwvTiizexmGZP73CA+CGAxbosp8OuPbPoHi9AK_cYFQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] makedevs: don't restrict device node paths to 40 characters
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
X-List-Received-Date: Mon, 03 Oct 2016 23:41:26 -0000
X-Groupsio-MsgNum: 87836
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3BC18989-2B27-4ABB-98BD-B5281D873019";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3BC18989-2B27-4ABB-98BD-B5281D873019
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 2, 2016, at 11:41 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Sun, Oct 2, 2016 at 1:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Sep 12, 2016, at 1:14 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> 40 character paths work OK for device nodes in /dev but not for
>>> device nodes created in a chroot, LXC container, etc.
>>>=20
>>> Since the 'path' array is already a 4k buffer, the sscanf 40
>>> character limit seems to be a typo or historical mis-merge. Update
>>> the sscanf limit and bring the code in sync with the Buildroot
>>> version:
>>>=20
>>> =
https://git.buildroot.net/buildroot/commit/?id=3D8876b6751e0bc19a375429006=
1808f0f8420708e
>>=20
>> what is upstream worthiness of this patch ? it seems it could be
>> a good change
>=20
> Where is the upstream?

mtd-utils, but in this case it seems its a back port so we are fine.

>=20
>>>=20
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>> meta/recipes-devtools/makedevs/makedevs/makedevs.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c =
b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
>>> index 7471f3f..cba7681 100644
>>> --- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
>>> +++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
>>> @@ -360,7 +360,7 @@ static int interpret_table_entry(char *line)
>>>      unsigned long mode =3D 0755, uid =3D 0, gid =3D 0, major =3D 0, =
minor =3D 0;
>>>      unsigned long start =3D 0, increment =3D 1, count =3D 0;
>>>=20
>>> -     if (0 > sscanf(line, "%40s %c %lo %40s %40s %lu %lu %lu %lu =
%lu", path,
>>> +     if (0 > sscanf(line, "%4095s %c %lo %40s %40s %lu %lu %lu %lu =
%lu", path,
>>>                  &type, &mode, usr_buf, grp_buf, &major, &minor, =
&start,
>>>                  &increment, &count))
>>>      {
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_3BC18989-2B27-4ABB-98BD-B5281D873019
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfy7KQACgkQuwUzVZGdMxSERgCfcqj/EcWjno3NtmlCkwYVzMDR
yE8An2OYOJY86UyR651QYR6NpmHvujVv
=TzaK
-----END PGP SIGNATURE-----

--Apple-Mail=_3BC18989-2B27-4ABB-98BD-B5281D873019--
