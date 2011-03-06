Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PwIoO-00088N-3N
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Mar 2011 19:36:12 +0100
Received: by wyb38 with SMTP id 38so3466830wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Mar 2011 10:34:40 -0800 (PST)
Received: by 10.216.123.66 with SMTP id u44mr2498906weh.109.1299436479953;
	Sun, 06 Mar 2011 10:34:39 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f52sm861723wes.35.2011.03.06.10.34.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Mar 2011 10:34:39 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c6b0c5720fa0fc2ba7a6792b7f52faad38dd47dc.1299431945.git.sgw@linux.intel.com>
Date: Sun, 6 Mar 2011 19:34:38 +0100
Message-Id: <EC897C7E-B45E-415F-A788-9F160A0A60E8@dominion.thruhere.net>
References: <cover.1299431945.git.sgw@linux.intel.com>
	<c6b0c5720fa0fc2ba7a6792b7f52faad38dd47dc.1299431945.git.sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1082)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/2] gst-plugins: Added hal to DEPENDS
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
X-List-Received-Date: Sun, 06 Mar 2011 18:36:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mrt 2011, om 18:19 heeft Saul Wold het volgende geschreven:

> From: Saul Wold <sgw@linux.intel.com>
>=20
> Fixes [YOCTO #810]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-multimedia/gstreamer/gst-plugins.inc |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc =
b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> index 4edca95..d1abd36 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
> BUGTRACKER =3D =
"https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstreamer"
> SECTION =3D "multimedia"
> PRIORITY =3D "optional"
> -DEPENDS =3D "gstreamer"
> +DEPENDS =3D "gstreamer hal"

Since hal is being deprecated in favour of udev, do we really want to =
introduce it as a dependency instead of disabled it?

regards,

Koen=


