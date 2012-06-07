Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Scdw3-0006OK-WE
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 16:43:40 +0200
Received: by eaal1 with SMTP id l1so246729eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 07:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rM+KkFrbJ7G8Xi8IxVAjSVX3rmQhekIeIZpmTf7tqR0=;
	b=nykrV05UWRFV1o2DN00De2BDonZexPqpq8C7UiZsAgelHKlh8uz+QgeW5/cvmr8iim
	tAAbj67kqRZ1KvmN5PM0uLFkKvuDRUOUgoBuXpVUa5mvF+MEuoqD5ya8PKICjQftZ/UL
	o0jnSQsCV0d+zxS6fxt3bpI9iKEKeYMwKXbkMihfqysUOGEP6ec7LunjoRa/XiiGiNj7
	mj8L3CXgaNAzv5SeI9Z+m+xrEEIPTKOdWjZMv4QUHk7wqbeOebCs5AzZMucrYN5EuL3u
	SbsSbpEm5YKgQXBrK27VVmYQVMz2oZz9n+FkBPZQ3xQH26Jdwx9pBV5Iy5FENo1XX5aj
	WPFw==
Received: by 10.14.99.206 with SMTP id x54mr1350221eef.94.1339079591403;
	Thu, 07 Jun 2012 07:33:11 -0700 (PDT)
Received: from ?IPv6:2001:610:612::dc6b:d8a1:fa4:7eca?
	([2001:610:612:0:dc6b:d8a1:fa4:7eca])
	by mx.google.com with ESMTPS id t3sm11503074eeb.15.2012.06.07.07.33.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 07:33:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
Date: Thu, 7 Jun 2012 16:33:06 +0200
Message-Id: <A2F8EA1D-12C9-4B15-854B-88D2EE83ED35@dominion.thruhere.net>
References: <cover.1339078729.git.ross.burton@intel.com>
	<5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlKWVli+PDPTB8nm4rVFilNhxkIlBuv8IHo472foEwNIXDF5KF0Rbz+rCVmwQQ+kLhdAWse
Subject: Re: [PATCH 1/3] connman: respect the 3g feature and enable/disable ofono support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jun 2012 14:43:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 jun. 2012, om 16:19 heeft Ross Burton het volgende geschreven:

> [YOCTO #2357]
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-connectivity/connman/connman.inc |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc =
b/meta/recipes-connectivity/connman/connman.inc
> index f2da8d9..58e3f56 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', =
'', d)} \
>             ${@base_contains('DISTRO_FEATURES', =
'wifi','wpa-supplicant', '', d)} \
> -            ofono \
> +            ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} =
\
>             "
>=20
> TIST =3D "--enable-tist"
> @@ -34,7 +34,7 @@ EXTRA_OECONF +=3D "\
>     ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi =
${TIST}', '--disable-wifi', d)} \
>     ${@base_contains('DISTRO_FEATURES', =
'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
>     --enable-dnsproxy \
> -    --enable-ofono \
> +    ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', =
d)} \
>     --enable-tools \
>     --enable-test \
>     --disable-polkit \

This one is missing a PR bump=


