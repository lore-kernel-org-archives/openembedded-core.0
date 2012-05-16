Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUlNw-0002xf-5h
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 23:03:56 +0200
Received: by wibhn14 with SMTP id hn14so5554745wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 13:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=UXmYuXxMiw618ZAXsVimYgoW6nNJmm/rZVcK/XLiYUo=;
	b=cddmmy/th6D7jufggT7kHWM9gx+wJUUuYEWHouHJ2VjMmk8FydsYRlBVp8qS3naWwV
	dr750SONzpAS+VoAHq2EQQkwd0JMwuHdhs3lfZXz/j4CtlKllMJ9QPym2K8S6DjyHIYP
	eVjjRymDj68QmMTWM2EX7XLpFfIkKjGnzTS50H+WRVvu59g4Iw8SaRjaV2snUCJqzbW0
	s7fhhIByDePZv4NoIvUsf+ftxjngux5xevnPl4ivc3agSXKnttd4XbsTmX3T11XI0T+P
	hrdZlVAyWLWAOmKJxe5MrQyWLLv4iTlUxPdjoIH80wHKt0kUxRDViZBeHqZB8fcMX6de
	r2rA==
Received: by 10.180.74.193 with SMTP id w1mr11616539wiv.4.1337201624495;
	Wed, 16 May 2012 13:53:44 -0700 (PDT)
Received: from [172.20.1.66] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j4sm37708362wiz.1.2012.05.16.13.53.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 13:53:41 -0700 (PDT)
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
In-Reply-To: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
Mime-Version: 1.0 (1.0)
Message-Id: <A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
X-Mailer: iPad Mail (9B206)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 16 May 2012 22:55:08 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQksiKQezw8xzktBf5/zFxTyxZeYwmbEyAbIBIQOYqHHxuxBpCPe4KFnpwxFHLAQ94Sbjbp/
Cc: Daiane Angolini <daiane.angolini@freescale.com>,
	"<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Wed, 16 May 2012 21:03:57 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 16 mei 2012 om 21:51 heeft Daiane Angolini <daiane.angolini@freescale.com=
> het volgende geschreven:

> Port recipe from Meta-OE at 4bf0e7e02544e9ffa54aa0ead966c411d7dbd0be
> and update to version 1.30 using FreeDesktop GIT as source.

Why bloat oe-core? Nothing is using it oe-core


>=20
> Signed-off-by: Daiane Angolini <daiane.angolini@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> meta/recipes-support/evtest/evtest_1.30.bb |   14 ++++++++++++++
> 1 files changed, 14 insertions(+), 0 deletions(-)
> create mode 100644 meta/recipes-support/evtest/evtest_1.30.bb
>=20
> diff --git a/meta/recipes-support/evtest/evtest_1.30.bb b/meta/recipes-sup=
port/evtest/evtest_1.30.bb
> new file mode 100644
> index 0000000..222d839
> --- /dev/null
> +++ b/meta/recipes-support/evtest/evtest_1.30.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "Simple tool for input event debugging."
> +HOMEPAGE =3D "http://people.freedesktop.org/~whot/evtest/"
> +AUTHOR =3D "Vojtech Pavlik <vojtech@suse.cz>"
> +SECTION =3D "console/utils"
> +DEPENDS =3D "libxml2"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882b=
be"
> +
> +SRCREV =3D "e7dd232287764c0533ea89247ff907f350a12016"
> +SRC_URI =3D "git://anongit.freedesktop.org/evtest;protocol=3Dgit"
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> --=20
> 1.7.5.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


