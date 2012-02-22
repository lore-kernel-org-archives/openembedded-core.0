Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0Bsl-0008L6-Iu
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 14:05:19 +0100
Received: by wibhq7 with SMTP id hq7so5975wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 04:56:59 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.101.165 as permitted sender)
	client-ip=10.180.101.165; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.101.165 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.101.165])
	by 10.180.101.165 with SMTP id fh5mr34994332wib.10.1329915419677
	(num_hops = 1); Wed, 22 Feb 2012 04:56:59 -0800 (PST)
Received: by 10.180.101.165 with SMTP id fh5mr28946971wib.10.1329915419582;
	Wed, 22 Feb 2012 04:56:59 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hs6sm36631245wib.2.2012.02.22.04.56.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 04:56:58 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1329910007-8441-2-git-send-email-obi@opendreambox.org>
Date: Wed, 22 Feb 2012 13:56:55 +0100
Message-Id: <CFE738D1-7A44-4F57-BB18-818DD5474E01@dominion.thruhere.net>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329910007-8441-2-git-send-email-obi@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkmTN3Mem1XmrtzwPkV1HZhNzWyb+al59QpA7uHIagznfW1Ptf5Ox+k44JAHHvOEQ2NkpQI
Subject: Re: [PATCH 1/5] libsoup-2.4: don't depend on libgnome-keyring unless x11 is defined
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
X-List-Received-Date: Wed, 22 Feb 2012 13:05:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2012, om 12:26 heeft Andreas Oberritter het volgende =
geschreven:

> * Drop dependency on GNOME if x11 is disabled.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb =
b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> index 8e6ef26..861a1aa 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> @@ -6,9 +6,9 @@ LICENSE =3D "LGPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2"
>=20
> SECTION =3D "x11/gnome/libs"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> -DEPENDS =3D "glib-2.0 gnutls libxml2 libproxy sqlite3 =
libgnome-keyring"
> +DEPENDS =3D "glib-2.0 gnutls libxml2 libproxy sqlite3 =
${@base_contains('DISTRO_FEATURES', 'x11', 'libgnome-keyring', '', d)}"

that one likely needs a --disable-something to be deterministic.

regards,

Koen=


