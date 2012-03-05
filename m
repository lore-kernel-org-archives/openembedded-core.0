Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4SLv-0007bB-Cq
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 08:29:03 +0100
Received: by wera1 with SMTP id a1so2239510wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 23:20:29 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.92.34 as permitted sender)
	client-ip=10.180.92.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.92.34 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.92.34])
	by 10.180.92.34 with SMTP id cj2mr12885340wib.20.1330932029141
	(num_hops = 1); Sun, 04 Mar 2012 23:20:29 -0800 (PST)
Received: by 10.180.92.34 with SMTP id cj2mr10230617wib.20.1330932028791;
	Sun, 04 Mar 2012 23:20:28 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cc3sm57550689wib.7.2012.03.04.23.20.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 23:20:27 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330872643-2185-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 5 Mar 2012 08:20:24 +0100
Message-Id: <BFFA1A08-780E-4F05-B62E-5E88BAB0E374@dominion.thruhere.net>
References: <1330872643-2185-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQka3gadSLo3LBrHvaHzcEOfnvOk7Qm+qMMFd5W5uPZ4H115yMmBUCihVgg5lyReg4l2TLm7
Subject: Re: [PATCH] libx11: reinstate PE=1 that got lost in the big meta-oe Xorg merge
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
X-List-Received-Date: Mon, 05 Mar 2012 07:29:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mrt. 2012, om 15:50 heeft Koen Kooi het volgende geschreven:

> This prevents package managers 'upgrading' 1.4.4 to 1:1.4.3
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-graphics/xorg-lib/libx11.inc      |    2 ++
> meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb |    2 +-
> 2 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc =
b/meta/recipes-graphics/xorg-lib/libx11.inc
> index 9057edc..a1e4386 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -8,6 +8,8 @@ require xorg-lib-common.inc
>=20
> inherit siteinfo
>=20
> +PE =3D "1"
> +
> PROVIDES =3D "virtual/libx11"
>=20
> XORG_PN =3D "libX11"

I sent it against an older version of the tree (shame on me) and git =
merged the below change away, do you want me to do an r3 and resubmit?

regards,

Koen

> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb =
b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> index ee1d919..152bd79 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
> @@ -1,7 +1,7 @@
> require libx11.inc
> inherit gettext
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> --=20
> 1.7.2.5
>=20



