Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7F772425
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 17:46:46 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so979991pac.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 09:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=opw7uzp9ckyCRuur0aQHp/+3SeHlmrSkXP1DWAjnc9g=;
	b=TGA4jAssvWg3C+7lKD+PdbwKz7BoiZhcaHV+b/LAdwDwgxKLqnBX5q/MBosSj+BLJG
	MdEMq78HupVZ5Dwlz3o/JRDGoh5uWICOfM9w4+GAK61fBVT1h2GUlrR0tC+mY307vA5w
	fOPtABLoxmwUZJ5iiTN+MvbGgcykihh2q83mcSpEVyaFLl0rL++EAo40FgKhnMd8jvuI
	mfek2Z5DJOHLbKlAuS2H3dbsZpbZciuxXXWFwcEONs80/NBb53u00AMSX+OWD/s/EQI6
	gGBF4CEdhbs75oF43DdCx4Z/irtAdNTYr6L4fBxf60+WDKVd7Oscf8cxpaGTE9r6UlJc
	kt3w==
X-Received: by 10.70.89.237 with SMTP id br13mr33424368pdb.78.1418147207032;
	Tue, 09 Dec 2014 09:46:47 -0800 (PST)
Received: from [192.168.0.27] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id y7sm2071150pdm.12.2014.12.09.09.46.46
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Dec 2014 09:46:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6152fe99accf1a836c3bc9b3d2c7b9dc886b16f2.1418113325.git.Chong.Lu@windriver.com>
Date: Tue, 9 Dec 2014 09:46:45 -0800
Message-Id: <7121F98F-ACC4-4194-8578-CAA336995E3E@gmail.com>
References: <cover.1418113325.git.Chong.Lu@windriver.com>
	<6152fe99accf1a836c3bc9b3d2c7b9dc886b16f2.1418113325.git.Chong.Lu@windriver.com>
To: Chong Lu <Chong.Lu@windriver.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/3] bitbake.conf: Set default value for SERIAL_CONSOLE
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
X-List-Received-Date: Tue, 09 Dec 2014 17:46:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 9, 2014, at 12:25 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
>=20
> Define a default value for SERIAL_CONSOLE, we can use it if machine =
doesn't
> configure.
>=20
> [YOCTO #6331]
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
> meta/conf/bitbake.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7902bd7..7a659a7 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -739,7 +739,7 @@ COMBINED_FEATURES =3D "\
>     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", =
"wifi", d)}"
> COMBINED_FEATURES[vardeps] +=3D "DISTRO_FEATURES MACHINE_FEATURES"
>=20
> -SERIAL_CONSOLE ??=3D ""
> +SERIAL_CONSOLE ??=3D "115200 ttyS0=E2=80=9D

I would rather prefer a warning or note.

> SERIAL_CONSOLES ??=3D "${@d.getVar('SERIAL_CONSOLE', True).replace(' =
', ';')}"
>=20
> NO_RECOMMENDATIONS ?=3D ""
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


