Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED82EC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 17:32:18 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.138.1645723934928038410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 09:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=aBilEqNI;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645723936;
  x=1677259936;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Afsfsoetl1uScY22s6jmGOTxv1S2xSmFR59GpzwmHuA=;
  b=aBilEqNIx0Mps94fKqUcy1ljGV7JZt71CaimeX6ZS21Y1mu9WsOPAA0m
   HnELbcFkhiBIi+aMmfpcwv3FbC4a9ZiCKVeO/CzwFHWcNTWhcQl3p/FJE
   vqnXASK1JYY6lU4lJiol5U7DvkvOu649vfWvv3Qcuc5gYaYIJ1kTbch0G
   jkxgOdXbJ+0OWWzBOztGwbm9x5HbfnxOIZZdAr4v5HMUxRKUqoTKGaqTh
   v3YvZFj145IvZEm6T3nGhUBnhNn1TkgHafeOUbANYwU7nSshunJ492xKE
   vzuV8qynhCeZ3AjHoDnQWRKhw3WzgVn6U9nwHXUoYPh4XV4uxAHYSFVMD
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Saul Wold <Saul.Wold@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] license.py: rename variables
Thread-Topic: [OE-core] [PATCH] license.py: rename variables
Thread-Index: AQHYKZMUWnmrtxOwaECDFXJDIMszzayi7aaw
Date: Thu, 24 Feb 2022 17:32:08 +0000
Message-ID: <a124dee50efd4d6bab57c31f0aeef9bc@axis.com>
References: <20220224152659.134461-1-saul.wold@windriver.com>
In-Reply-To: <20220224152659.134461-1-saul.wold@windriver.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 17:32:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162328

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Saul Wold
> Sent: den 24 februari 2022 16:27
> To: openembedded-core@lists.openembedded.org
> Cc: Saul Wold <saul.wold@windriver.com>
> Subject: [OE-core] [PATCH] license.py: rename variables
>=20
> Update the comment to reflect new variable names
>=20
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/lib/oe/license.py | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index b5d378a549b..4cd382b4fd7 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -99,20 +99,22 @@ def flattened_licenses(licensestr, choose_licenses):
>          raise LicenseSyntaxError(licensestr, exc)
>      return flatten.licenses
>=20
> -def is_included(licensestr, whitelist=3DNone, blacklist=3DNone):
> -    """Given a license string and whitelist and blacklist, determine if =
the
> -    license string matches the whitelist and does not match the blacklis=
t.
> -
> -    Returns a tuple holding the boolean state and a list of the applicab=
le
> -    licenses that were excluded if state is False, or the licenses that =
were
> -    included if the state is True.
> +def is_included(licensestr, include=3DNone, exclude=3DNone):

I suggest calling the renamed arguments "include_licenses" and=20
"exclude_licenses" instead. "include" and "exclude" are very=20
generic.

> +    """Given a license string and include list and exclude list,
> +        determine if the license string matches the an included
> +        license and does dont match an excluded license.

Change to:

    """Given a license string, a list of licenses to include and
        a list of licenses to exclude, determine if the license
        string matches the include list and that it does not
        match the exclude list.

> +
> +        Returns a tuple holding the boolean state and a list of
> +        the applicable licenses that were excluded if state is
> +        False, or the licenses that were included if the state
> +        is True.
>      """
>=20
>      def include_license(license):
> -        return any(fnmatch(license, pattern) for pattern in whitelist)
> +        return any(fnmatch(license, pattern) for pattern in include)
>=20
>      def exclude_license(license):
> -        return any(fnmatch(license, pattern) for pattern in blacklist)
> +        return any(fnmatch(license, pattern) for pattern in exclude)
>=20
>      def choose_licenses(alpha, beta):
>          """Select the option in an OR which is the 'best' (has the most

A few lines below the above is a comment line that starts "that=20
the number". Can you change it to "than the number" while here?

> @@ -131,11 +133,11 @@ def is_included(licensestr, whitelist=3DNone, black=
list=3DNone):
>          else:
>              return beta
>=20
> -    if not whitelist:
> -        whitelist =3D ['*']
> +    if not include:
> +        include =3D ['*']
>=20
> -    if not blacklist:
> -        blacklist =3D []
> +    if not exclude:
> +        exclude =3D []
>=20
>      licenses =3D flattened_licenses(licensestr, choose_licenses)
>      excluded =3D [lic for lic in licenses if exclude_license(lic)]
> --
> 2.31.1

//Peter


