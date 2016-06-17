Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id CEFA862135
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 14:26:41 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 66so6369285pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=sMVTQR1h4GuPPcUAVJvPLq5M5kOEaZeaz/msQZ0GAfU=;
	b=r11a8Ea3owS45BeB9PJ/xhpav/Q9GoT49lkp9Udxj7w9ocVJBKskimUKvXjDJvYQiW
	i9GcSnUCrBSRYBbwAvxSDhWna4AUg/3Lx7Su5yaRoz1mAKb9rChhXaxTOwV8eT6OAtym
	rUeyR36TNPXIVHNwaCkzCMCLHEucKvikXpPDyxj2qzmkSNetd4rAeauNGgOoneBFE+yE
	oRfISOhI0+qC5QOCtsRI77dvN1RV5sFlHEFCP4Qt58Fn4G5XkwnMF+8QwhWACkhImIdF
	QgHd3MEt3EMNfeXuBxlicc6Vt9GePG4LqsKWhQDh2Ss0V9iiHOKGMmhuc3N9we/rIG5z
	IawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=sMVTQR1h4GuPPcUAVJvPLq5M5kOEaZeaz/msQZ0GAfU=;
	b=KYShneOWk/8O4baCEhf43DXrSN62rcmecuu40lNuU0USE8zmaJ2XvZsZQtuENIYt27
	43eTZI6qZojLTqrZz+UrnJaT92o94sAAKbW6anhkm8xpQkcwXPwaqz3oTSeQOgP1eX9I
	19macxBuI/K/MURjSUR/UtX7G98t7uc/QjBUkp0tzISH8xZsZMTGiu/RpcO4ya56N0vA
	w7Qh80GlxxWJ6iAmZvXFo51OE2coaNtv7SIzdmsba8+1cM2JDY5eCYY4T9oKMKQRntLp
	M71HjJNmGqTenm+M0aubBQSjr5HkC1rHnlWoJ9pNruNNyIxJAuFrTm8EyZHfYRMWzwMf
	jCVA==
X-Gm-Message-State: ALyK8tKNc98bc9/1uOXISIJokOLc64eBxwAPo6er8HetEE+n+hZEVdub5E+RhgT5VtlzTA==
X-Received: by 10.98.70.144 with SMTP id o16mr2721982pfi.126.1466173602488;
	Fri, 17 Jun 2016 07:26:42 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	um1sm31070240pac.41.2016.06.17.07.26.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2016 07:26:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5763C392.7070502@pengutronix.de>
Date: Fri, 17 Jun 2016 07:26:34 -0700
Message-Id: <892E0421-5237-4B37-AA3E-350AA901FD54@gmail.com>
References: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
	<85edcbf217242f13d1fa76bcf8258c153fc89db9.1463546289.git.raj.khem@gmail.com>
	<1463643393.4578.90.camel@linuxfoundation.org>
	<1463644963.4578.91.camel@linuxfoundation.org>
	<5763C392.7070502@pengutronix.de>
To: Enrico Joerns <ejo@pengutronix.de>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] systemd: Create missing sysusers offline
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
X-List-Received-Date: Fri, 17 Jun 2016 14:26:41 -0000
X-Groupsio-MsgNum: 83573
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DE7C3E7F-BCFF-43B3-8D1C-8174D171B221";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DE7C3E7F-BCFF-43B3-8D1C-8174D171B221
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Jun 17, 2016, at 2:32 AM, Enrico Joerns <ejo@pengutronix.de> wrote:
>=20
> Hi,
>=20
> On 05/19/2016 10:02 AM, Richard Purdie wrote:
>> On Thu, 2016-05-19 at 08:36 +0100, Richard Purdie wrote:
>>> On Tue, 2016-05-17 at 21:40 -0700, Khem Raj wrote:
>>>> Some system users which are needed by systemd components were
>>>> missing
>>>> create these users knobbed with relevant packageconfig
>>>>=20
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>=20
>>> This looks better but there do appear to still be problems:
>>>=20
>>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd
>>> /b
>>> uilds/776/steps/Running%20Sanity%20Tests/logs/stdio
>>>=20
>>> and
>>>=20
>>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd
>>> /b
>>> uilds/776/steps/Running%20Sanity%20Tests_2/logs/stdio
>>=20
>=20
> I just stumbled over this issue when building systemd with networkd =
enabled in krogoth release.
> Shouldn't this patch be backported to krogoth as well?


I think yes. Feel free to send a request to krogoth maintainer.

--Apple-Mail=_DE7C3E7F-BCFF-43B3-8D1C-8174D171B221
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldkCJ4ACgkQuwUzVZGdMxTmxQCfV3MGZe+xSHZn5JVMK+H54MpW
CEsAn1EeaGfFyNnaO/yhWFWLXOGseFzI
=7tJ5
-----END PGP SIGNATURE-----

--Apple-Mail=_DE7C3E7F-BCFF-43B3-8D1C-8174D171B221--
