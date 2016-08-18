Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4C50A731C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:34:52 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y134so69669pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=YdGgKlGF3/LP5S3IV7Z+hTAyQ8f8Rcjf2V+X5kXVBIo=;
	b=NK8A/tBYi4gllU+pRuf9HsBf2rmaVeb9KPoGP/DeVRE3tb0N5wAnAACMG5hT0oWTQQ
	ce0+e5NkRVAeBT1Jdvegykjkxbv+lvBjP1+XkJ4kGsq9lFzSvRmhRFnmSIdr4jJ+/VVH
	n5QnJOgLK86lw5fEJIiEYqx0aKQjhFbYG8bmYNW+QvlNh0pBscCDuw7JaizT67iHiiBt
	tBfeAliFBk/LkPP6J4wbaugBAElRaaxrCisDr5DWl2JxI/am3XE7dcj5Q8CXjML1Q/GH
	8Utcxw+QvLb1etsq28bynpOv/anWzlNyFDUqT1Z5fCxz8exMeLl2/It4n4MSj1BilUeF
	eGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=YdGgKlGF3/LP5S3IV7Z+hTAyQ8f8Rcjf2V+X5kXVBIo=;
	b=CPm7UE4WHT7mH8VcbC09YBkkBxh1zE2RqQsSYeVaepH1T9uqTVqYPdGuP78mwkZo57
	1NfMxqF9GE/2iLr6xRgNCgzCg70PZfZ9sIPx79jli4WyLKPAbLmniydLkJZgNbFRTDCi
	dhkmtK4FgY/uA+5fvpPxUoRAuXp9rhjhsmxY9AMcqCdoG5AGm3nqBOVmazAJf4FaML+4
	fP/UjsoAfu3JPCeEUpnLjrj+eNPBlkwRo5HoUZpaU536eEAaeT+xJ8ukcSVwS6iAN1H9
	FyBOsk/LMVH0K61LHlz6CUxszFygG8LsHL2cdZIT6HSgwDX9Q1Y5Hg9PpWyzzXbP7DUX
	af0g==
X-Gm-Message-State: AEkoouvZX+QFlG4FZVkl4Ywgs2obFomBCHepV9TeLLQJfYWnmqFKpYcdQCbFQybOZCH9/w==
X-Received: by 10.98.71.140 with SMTP id p12mr6032809pfi.93.1471541693712;
	Thu, 18 Aug 2016 10:34:53 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id w64sm230435pfb.93.2016.08.18.10.34.52
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 10:34:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160818170824.lql76v2c7bbfs46t@jama>
Date: Thu, 18 Aug 2016 10:34:47 -0700
Message-Id: <2ADD064C-4C6C-4437-9A67-BB2F09534050@gmail.com>
References: <1471538461-27065-1-git-send-email-raj.khem@gmail.com>
	<20160818170824.lql76v2c7bbfs46t@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Specify extra paths
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
X-List-Received-Date: Thu, 18 Aug 2016 17:34:53 -0000
X-Groupsio-MsgNum: 85914
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BF1DE422-E22A-4488-91B0-CB0CC712CAC2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BF1DE422-E22A-4488-91B0-CB0CC712CAC2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 18, 2016, at 10:08 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Thu, Aug 18, 2016 at 04:41:01PM +0000, Khem Raj wrote:
>> Some layers have gstreamer plugin recipes which include
>> the .inc files from OE-Core but they do not get to find
>> the patch that is being forced by the .inc file and
>> ends up with errors like
>>=20
>> WARNING: =
/mnt/oe/meta-qcom/recipes-multimedia/gstreamer/gstreamer1.0-plugins-v4l2.b=
b: Unable to get checksum for gstreamer1.0-plugins-v4l2 SRC_URI entry =
0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch: file =
could not be fo
>> und
>=20
> Isn't it better to move this SRC_URI_append to the individual .bb =
files?
>=20
> Other versions of plugins might not be able to apply this .patch and
> such recipes will need to use SRC_URI_remove (or SRC_URI with =
override)
> to get rid of this.

I thought of doing that, but then this patch is needed for g-ir to work =
in cross env.
may be its better to also expose the SRCREV and SRC_URI or common repo =
in the inc file
in case where external plugins would like to override that, then they =
will automatically
remove the patch too.

>=20
>>=20
>> This path prepend fixes it
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
>> index 2dcec50..b066941 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
>> @@ -28,6 +28,7 @@ EXTRA_OECONF =3D " \
>>     --disable-examples \
>> "
>>=20
>> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>> SRC_URI_append =3D " =
file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"
>>=20
>> delete_pkg_m4_file() {
>> --
>> 1.8.3.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


--Apple-Mail=_BF1DE422-E22A-4488-91B0-CB0CC712CAC2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle18bsACgkQuwUzVZGdMxQNOACdH3+5BpsDRGiXeInSfvOO9OYk
dJEAn36f0YfA7GyY3LMu6rLS4ln/Man0
=T/sI
-----END PGP SIGNATURE-----

--Apple-Mail=_BF1DE422-E22A-4488-91B0-CB0CC712CAC2--
