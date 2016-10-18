Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id EA7EF65CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 14:42:01 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 128so15343936pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=A7mIwSjvP9HRsxtDyHm9FKas6ERrMe15PT/3QWVbiwA=;
	b=bCrPWgoHxKBRHNDdQ1UOlrG1gLqzMKb3+cSqqE1lZYllY2JMizhtW/hjWiOQtpC20V
	3uir2xnsEOoewxtkUhuhPOY9kwC5lxLHEPJ4FkKRYErucGTdUI/nBevDv0Ug7y5KFUws
	pbzOAFerr0OMbuEQPakbm+u+RZ7pLhOHpLZgVpyfeGY6Q9Z4TBDG9Ok6R1vOi5fOnadO
	mMoUvg/cupoeND6nfFD5XjcCmko+5IDhgkd7A+oSR2eu2kjIguUaByBTLIZI9u9nI3Wx
	4D8KHF/OdtyBcQIltvJoe6sErcLG0e3k+EXcyeZApqLBfpIxhzg4uOaG0Mb4npTjUN8h
	Z9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=A7mIwSjvP9HRsxtDyHm9FKas6ERrMe15PT/3QWVbiwA=;
	b=XV41ZmGOt561UY3l7hySedj+Ff0Z5VMwIYQHh3r4QvYoa90GQEV996wBBudAjpN7Pc
	HgvxKDQRTKADHpDQlpuZ9HuM4P20TkIWFebMpkIxTPiES1SgSzcOsNUIMvg+oTecFkpq
	MfJ9gVhCUWz3SefPrZ9fCi+DWVlyAP1LVEaFC9Ut/pBtm4GyOMIXgoPftujQQ4B31Dtz
	hwPycjXynjNVpBH8Ipmcpo5dqvrpVU/c04tVmyJfEMldSysKLz3mHQuVS/AuX2vfBYGO
	Q9/IO6LNxZ1Sq7YGn3zPe7pYgkLqy4+9C11ruNlXkYKAtbR6pOhFseI1mgkMUX9Tm44/
	l5cQ==
X-Gm-Message-State: AA6/9RmDGxH5oLBCcKs2hA8L0C5JTAUMegdu3XTOcczrITXJ1HmIfARBy6PKbXfBOLMuxA==
X-Received: by 10.98.29.131 with SMTP id d125mr1284134pfd.111.1476801723441;
	Tue, 18 Oct 2016 07:42:03 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:10af:7454:ca4e:95f6?
	([2601:646:8882:b8c:10af:7454:ca4e:95f6])
	by smtp.gmail.com with ESMTPSA id
	z11sm42550710pfd.49.2016.10.18.07.42.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 07:42:02 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Khem Raj <raj.khem@gmail.com>
X-Mailer: iPad Mail (14B71)
In-Reply-To: <e6c381fc-a7e3-a1ae-399b-636bb1208130@qt.io>
Date: Tue, 18 Oct 2016 07:42:02 -0700
Message-Id: <4ED46338-2099-43DE-AD2B-137012EB420F@gmail.com>
References: <1476198850-1529-1-git-send-email-samuli.piippo@qt.io>
	<64ADE2BA-C5CE-47C5-975F-05C11DE145D2@gmail.com>
	<e6c381fc-a7e3-a1ae-399b-636bb1208130@qt.io>
To: Samuli Piippo <samuli.piippo@qt.io>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] systemd-serialgetty: add dependency to agetty
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
X-List-Received-Date: Tue, 18 Oct 2016 14:42:04 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Oct 18, 2016, at 3:00 AM, Samuli Piippo <samuli.piippo@qt.io> wrote:
>=20
>> On 18.10.2016 02:36, Khem Raj wrote:
>>=20
>>> On Oct 11, 2016, at 8:14 AM, Samuli Piippo <samuli.piippo@qt.io> wrote:
>>>=20
>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>> ---
>>> meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/rec=
ipes-core/systemd/systemd-serialgetty.bb
>>> index 768b130..c4e5310 100644
>>> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
>>> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
>>> @@ -38,7 +38,7 @@ do_install() {
>>>    fi
>>> }
>>>=20
>>> -RDEPENDS_${PN} =3D "systemd"
>>> +RDEPENDS_${PN} =3D "systemd util-linux-agetty=E2=80=9D
>>=20
>> Does it need agetty specifically ? since there are other providers of get=
ty as well.
>> I wonder if its possible to use those too
>=20
> serial-getty@.service is using /sbin/agetty, so currently it's the one.
> systemd also has util-linux-agetty in RECOMMENDS, but that could perhaps b=
e removed.

Hmm recommends is probably appropriate for this recipe too so it can be adde=
d to bad recommendations if needed
>=20
>>=20
>>>=20
>>> # This is a machine specific file
>>> FILES_${PN} =3D "${systemd_unitdir}/system/*.service ${sysconfdir}"
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20

