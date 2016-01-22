Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 755657316D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 21:06:12 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q63so49320193pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=e44VP9faiPWTR0SMlOobL3upqT1nYGsY1t5RACxS5J4=;
	b=sxF9vjyKY4HX7wsVYfdaG+NtguBmnwrce8EUpe77QkkZeCn7K2GF6Djl7h5yowrUXg
	iH4R5S3BztOK4F8bLoOtFkI7fvwI3SN0GjFJq1mb7WLxf1SMqn7JOVcTfXdZIl7wuTSA
	fhdep+l9di9wNOE8hl863OysfUrjIgRy2q/T6icSVlu9mZAVFIMwk/z+au0AzYk0MVxk
	LQKQFuqlJg9zDqQcZ7BK3dyQfanBkKvQacpfdaoYCNupy5ETWgl+jlXlHJ9DOMlx8Cdt
	pPp27/+xRNSf3R/3TRo5dwCSwiDrzNMZ4eUzFuFvQiUBSm5+vCM9sI8/6HOujylrcjCN
	EpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=e44VP9faiPWTR0SMlOobL3upqT1nYGsY1t5RACxS5J4=;
	b=bMhqCTqvmBRhpUV2OzzV7agRSgynKiV70EH+1lExjjU4ZBeJLTN87yqVXCs4NJMjnN
	j2C0gX1hh2NNyorHssfNpx5r3iDQZBvU9nKx5E7I8zcB/+kitlz9DM+EJc+FLOUoLkY9
	qumPXiN8GqkeiwVyLx1aULa06wDLZ6kHHsHUQgDoolHQpzJ/zOjQzYGSBwt9xWTUQnAI
	+zElmRm4DcDTXmPtU8ZekwMZ5wJR1sq5A+zx/Msk4uZyMx4Je8dnb7on1/AnGy30wsOr
	pc4oA3SCG85yYvzEY9dbmOaf7c21zAC3BmuIB2qUU8K1kFd9OwZp/HoWxZq0bNS+Z2dx
	v7xA==
X-Gm-Message-State: AG10YOTV5x5cq8iO6ZWlAlyMOfLNp3cjax3TuE4HQIdq+AG09dy067EGl0lULwziialo8Q==
X-Received: by 10.98.16.72 with SMTP id y69mr7400308pfi.95.1453496773693;
	Fri, 22 Jan 2016 13:06:13 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:e5eb:ae30:b4f8:4402?
	([2601:646:8802:5d5c:e5eb:ae30:b4f8:4402])
	by smtp.gmail.com with ESMTPSA id
	72sm11742697pfk.28.2016.01.22.13.06.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jan 2016 13:06:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453496277.10444.78.camel@iki.fi>
Date: Fri, 22 Jan 2016 13:06:04 -0800
Message-Id: <1F3F5607-7430-45DF-BD68-9AB746D030EC@gmail.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<1453495750-104494-2-git-send-email-raj.khem@gmail.com>
	<1453496277.10444.78.camel@iki.fi>
To: Tanu Kaskinen <tanuk@iki.fi>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] local.conf.sample: Document HOW-TO enable systemd or busbox to replace sysvinit
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
X-List-Received-Date: Fri, 22 Jan 2016 21:06:13 -0000
X-Groupsio-MsgNum: 76729
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5601002D-41DA-48A2-AC71-55DDFC45BDF0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5601002D-41DA-48A2-AC71-55DDFC45BDF0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 22, 2016, at 12:57 PM, Tanu Kaskinen <tanuk@iki.fi> wrote:
>=20
> On Fri, 2016-01-22 at 20:49 +0000, Khem Raj wrote:
>> OE core provides systemd,busybox as options for system init system =
along
>> with sysvinit being the default. Document the needed settings to =
enable
>> systemd and busybox as options if user wishes.
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/conf/local.conf.sample | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>=20
>> diff --git a/meta/conf/local.conf.sample =
b/meta/conf/local.conf.sample
>> index a662f4d..b760546 100644
>> --- a/meta/conf/local.conf.sample
>> +++ b/meta/conf/local.conf.sample
>> @@ -209,6 +209,23 @@ PACKAGECONFIG_append_pn-qemu-native =3D " sdl"
>>  PACKAGECONFIG_append_pn-nativesdk-qemu =3D " sdl"
>>  #ASSUME_PROVIDED +=3D "libsdl-native"
>>=20
>> +#
>> +# Use busybox/mdev for system initialization
>> +#
>> +#VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
>> +#VIRTUAL-RUNTIME_login_manager =3D "busybox"
>> +#VIRTUAL-RUNTIME_init_manager =3D "busybox"
>> +#VIRTUAL-RUNTIME_initscripts =3D "initscripts"
>> +#VIRTUAL-RUNTIME_keymaps =3D "keymaps"
>> +#DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
>> +
>> +#
>> +# Use systemd for system initialization
>> +#
>> +#DISTRO_FEATURES_append =3D " systemd sysvinit"
>> +#DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
>=20
> Why is sysvinit included in both DISTRO_FEATURES and
> DISTRO_FEATURES_BACKFILL_CONSIDERED? My understanding is that
> BACKFILL_CONSIDERED only makes sense when the value is not included in
> DISTRO_FEATURES.

There are two possibilities. one where its pure systemd no sysvinit, in =
this case
we should have DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D =E2=80=9Csysvinit=E2=
=80=9D and remove
DISTRO_FEATURES_append.

In case where we want sysvinit scripts also be there and systemd can =
execute on them
then above setting is needed as it is. Option 2 is what I have tried to =
put in there

>=20
> --
> Tanu


--Apple-Mail=_5601002D-41DA-48A2-AC71-55DDFC45BDF0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaimcIACgkQuwUzVZGdMxSSLwCfQPrIEH8CF7uT2apIIjZpmpPl
Z3AAn3zxwlG3j6Fr7MBUZ5uKfHW0QSps
=+xAw
-----END PGP SIGNATURE-----

--Apple-Mail=_5601002D-41DA-48A2-AC71-55DDFC45BDF0--
