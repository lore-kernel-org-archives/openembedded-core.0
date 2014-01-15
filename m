Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0676BE62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:04:20 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y10so1542000wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=uzFZ1pf9MMOYXumPPxVt8kmJSKgrfB9/+nbhyYPTFCw=;
	b=IUexIiOMxBqHva3CpVmiKNyp2tgXfo6or7Nd0MRF1yt9sv5L3NOQwbdopDEzoO7YmU
	eKBI3o3BbI4hoTUG/aj4m4kiP8396j+qZ6LSxH9o0XF+tQsCSE+C1T5eSrQPKWsp4BSw
	mz8bBi8m8OJaPdiLGwKUXvZAo+cTfCAIqHLVe71+s6+LDxD8wJZO74/4Xlj06g49pOW4
	YxIthja9rFL8NIZEEmBwqtUCHLQHHLWiKrdQKjpvCo7ODHbx/gQek4jPHgXqufBq5Ylo
	Pwmy8aExhGBhIy6O6l7I5C9IgMCvbxh8DXszJHOn0VtklKhRVi9h7NYDJnXAEoe/kAYc
	BD4g==
X-Gm-Message-State: ALoCoQke2HdQdbKGfoop6pOANQHM3nGy3UituTJVS1cSEWVpfzaXU5zf5W1H2BZbF/aSI/iV+rQU
X-Received: by 10.194.82.68 with SMTP id g4mr556265wjy.85.1389780261066;
	Wed, 15 Jan 2014 02:04:21 -0800 (PST)
Received: from ?IPv6:2001:610:612::2076:f88f:7a13:7ab2?
	([2001:610:612:0:2076:f88f:7a13:7ab2])
	by mx.google.com with ESMTPSA id
	kr10sm2790517wjc.22.2014.01.15.02.04.19 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 Jan 2014 02:04:20 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1389752246-4296-2-git-send-email-paul@paulbarker.me.uk>
Date: Wed, 15 Jan 2014 11:04:20 +0100
Message-Id: <39BBD84D-0924-4FD9-8585-3C7C231A1CC2@dominion.thruhere.net>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
	<1389752246-4296-2-git-send-email-paul@paulbarker.me.uk>
To: Paul Barker <paul@paulbarker.me.uk>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] opkg-utils: Upgrade to latest git HEAD
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
X-List-Received-Date: Wed, 15 Jan 2014 10:04:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jan. 2014, om 03:17 heeft Paul Barker <paul@paulbarker.me.uk> het =
volgende geschreven:

> The latest version of opkg-utils PROVIDES virtual/update-alternatives =
via a
> script copied from opkg.
>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
> meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb =
b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 714fc51..4ae6970 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -4,8 +4,10 @@ HOMEPAGE =3D "http://code.google.com/p/opkg/"
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
>                     =
file://opkg.py;beginline=3D1;endline=3D18;md5=3D15917491ad6bf7acc666ca5f7c=
c1e083"
> +PROVIDES +=3D "virtual/update-alternatives"
> +RPROVIDES_update-alternatives-opkg =3D "update-alternatives"

R* variables do below do_install since they deal with packaging

>=20
> -SRCREV =3D "757a1664a440c60e8126443bf984e4bdf374c327"
> +SRCREV =3D "fd4a3a4c20ada47b19e89849ddb6ff87904f01d2"
> PV =3D "0.1.8+git${SRCPV}"
>=20
> SRC_URI =3D "git://git.yoctoproject.org/opkg-utils"
> @@ -21,6 +23,9 @@ do_install() {
> # Avoid circular dependencies from package_ipk.bbclass
> PACKAGES_class-native =3D ""
>=20
> +PACKAGES =3D+ "update-alternatives-opkg"
> +FILES_update-alternatives-opkg =3D "${bindir}/update-alternatives"
> +
> RDEPENDS_${PN} =3D "python python-shell python-io python-math =
python-crypt python-logging python-fcntl python-subprocess python-pickle =
python-compression python-textutils python-stringold"
> RDEPENDS_${PN}_class-native =3D ""
>=20
> --=20
> 1.8.5.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


