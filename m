Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id D4EFF6059B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 14:45:06 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so5598801wib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 07:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=fDj5KpTfArYmjIFmBWDzZz8EhgTOi4iGkrpv+lJwNNM=;
	b=jPABfbyzEkTc/IN27XyzRpa6Jonb7yiYtY13osEMb8n5w/QIyt9AZMgtfev6Tq/0Ao
	lMXUWQrzwmibsYCD7hG3DSJs8jrfNPUjCSWIck9+m5f6R0aqXSHnsYAqhvuY4CLOuXKT
	Ti9y3RW3M8QdpOZfqcc4pbxtEIIbEHrm2X4IL55fTrlHC63o3HV3MUL1gBXhQIms2M5d
	Qs7q6bSdXuUQ+URo9J02WNX7bjCjoADGw+SZWzugwHog2kqI8zps1/jFUyDPlIQPB7TM
	u3fEaxYVYRL0Q8yBzzQDAM8CWloG2z7znYHhlx8xZtDpMpbsUz+S4ReLY06CHhbkJs0j
	SoLg==
X-Gm-Message-State: ALoCoQk79UZw3rJOCldvpmWEzqowA5apJB1NPiiAZsVG6InGOmf6ZbapzaUJCI+U1r/PF7vpJSyZ
X-Received: by 10.194.58.79 with SMTP id o15mr2166970wjq.62.1398696307105;
	Mon, 28 Apr 2014 07:45:07 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	pm5sm26364049wjc.11.2014.04.28.07.45.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 07:45:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CEA2F51@IRSMSX105.ger.corp.intel.com>
Date: Mon, 28 Apr 2014 16:45:06 +0200
Message-Id: <1A02AEF1-091C-4766-9C84-34DDC0AC5FBD@dominion.thruhere.net>
References: <1373547110-11539-1-git-send-email-cristian.iorga@intel.com>
	<4087F39D-2252-47C8-B596-81648E6C08FD@dominion.thruhere.net>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA2F51@IRSMSX105.ger.corp.intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xdg-utils: upgrade to 1.1.0-rc1
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
X-List-Received-Date: Mon, 28 Apr 2014 14:45:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 apr. 2014, om 16:40 heeft Iorga, Cristian =
<cristian.iorga@intel.com> het volgende geschreven:

> Hello Koen,
>=20
> Care to go into details why exactly the version is wrong?

http://www.openembedded.org/wiki/Versioning_Policy

> In YP Dev Manual, my recipe is given as an example of correct naming:
> =
http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#new-re=
cipe-storing-and-naming-the-recipe
> Quote:
> "Naming Your Recipe: When you name your recipe, you need to follow =
this naming convention:
>=20
>     <basename>_<version>.bb
>=20
>=20
> Use lower-cased characters and do not include the reserved suffixes =
-native, -cross, -initial, or -dev casually (i.e. do not use them as =
part of your recipe name unless the string applies). Here are some =
examples:
>=20
>     cups_1.7.0.bb
>     gawk_4.0.2.bb
>     xdg-utils_1.1.0-rc1.bb"

And that's why I only read OE policy docs when working on OE.

> Also, in meta-openembedded, I found several recipes following the same =
pattern, i.e. fim and irssi packages.

koen@beast:/build/v2014.06/sources/meta-openembedded$ grep PV =
./meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
REALPV =3D "0.8.16-rc1"
PV =3D "0.8.15+${REALPV}"
SRC_URI =3D "http://irssi.org/files/irssi-${REALPV}.tar.gz"
S =3D "${WORKDIR}/irssi-${REALPV}"

But 'fim' violates versioning policy as well.


>=20
> Regards,
> Cristian
> YP
> Intel Corporation
>=20
> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]=20
> Sent: Monday, April 28, 2014 5:26 PM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] xdg-utils: upgrade to 1.1.0-rc1
>=20
>=20
> Op 11 jul. 2013, om 14:51 heeft Cristian Iorga =
<cristian.iorga@intel.com> het volgende geschreven:
>=20
>> This version of xdg-utils is needed by BA in order to associate=20
>> correctly types of files with PCManFM file manager.
>> The release cycle of xdg-utils is very slow, so this is the best shot=20=

>> of a stable version available for YP 1.5 release.
>> As a reference, the previous stable version was released in 2007.
>> Also, desktop Linux distros use this release candidate as a stable=20
>> version, for example, Ubuntu 12.04.
>>=20
>> Part of the implementation of [YOCTO #2370].
>>=20
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>> .../xdg-utils/{xdg-utils_1.0.2.bb =3D> xdg-utils_1.1.0-rc1.bb}  |    =
9 ++++-----
>> 1 file changed, 4 insertions(+), 5 deletions(-) rename=20
>> meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb =3D>=20
>> xdg-utils_1.1.0-rc1.bb} (80%)
>=20
> This has been in OE-core for a while, but I do have to point out that =
it violates the version policy, it should be: 1.0.2+1.1.0-rc1
>=20


