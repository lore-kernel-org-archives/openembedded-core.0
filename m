Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S50At-0007IZ-74
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 20:35:55 +0100
Received: by wgbdr12 with SMTP id dr12so4310315wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 11:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.145.209 as permitted sender)
	client-ip=10.216.145.209; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.145.209 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.145.209])
	by 10.216.145.209 with SMTP id p59mr8920797wej.50.1331062039477
	(num_hops = 1); Tue, 06 Mar 2012 11:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=BYboLxyC3dm8cRK5t3t0mLNYyCd+YXYouTf9oZkHg/s=;
	b=OJA4gv1byTjxJIAL0pFtTVO0qf40tchYp2+byCZmlSLSZ9GnzQzbHwYAmtQ2Qzi5FB
	KypG+HM4dLEBnWU6DDa7Qrd1dbGxc89YKmwo+id6LoKyj1O8xZNKkmiUmV82mi+urIwj
	YblBhqDXwbMiYJT9UaWA1iRTqVOFjDxhro9WvfzAx+p/w1ZyBSKDR4dB/RxWdlb+EIVm
	1epVWzddPH+q/haLhIfeasUeWW9MfnmXj6jFwGyCsaa/uaYMEXx0dCOP/oOO5ruM9I9Z
	8LyWPLszcJJ1Cw+mixgD4oloNiAsrFWFels8GlgliRZwY4c1PRTwuKjQ4RobN32eXVjP
	mI+w==
Received: by 10.216.145.209 with SMTP id p59mr7124714wej.50.1331062039208;
	Tue, 06 Mar 2012 11:27:19 -0800 (PST)
Received: from [172.20.1.20] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm83089067wib.4.2012.03.06.11.27.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 11:27:17 -0800 (PST)
References: <1331060564-7425-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1331060564-7425-1-git-send-email-Chase.Maupin@ti.com>
Mime-Version: 1.0 (1.0)
Message-Id: <BB247454-2C90-4DFB-A9C6-8F729C8E6E62@dominion.thruhere.net>
X-Mailer: iPhone Mail (9A405)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 6 Mar 2012 20:27:14 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkViJPpOPcMtZfocTe77SvOJRBSZpm6XgI0CVBvkGwhwmS4UBJZY1Tc/jARl2C1/pfsFycc
Cc: Chase Maupin <Chase.Maupin@ti.com>,
	"<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez4: add dependency on libcheck to enable test modules
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
X-List-Received-Date: Tue, 06 Mar 2012 19:35:55 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 6 mrt. 2012 om 20:02 heeft Chase Maupin <Chase.Maupin@ti.com> het volgend=
e geschreven:

> * The later versions of bluez such as 4.98 require libcheck
>  in order to build the test packages as enabled by the
>  --enable-test option passed in EXTRA_OECONF.
> * Failure to have the libcheck package availalbe results in the
>  configure script ignoring the --enable-test option and not
>  building the test modules.
> * Adding libcheck, which is greater than the minimum required
>  version of the check library of 0.9.6 allows building the
>  test modules.
> * Build tested for am335x-evm MACHINE type and run time tested
>  by back porting this fix to the oe-classic and arago setup
>  and booting on am335x-evm.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> meta/recipes-connectivity/bluez/bluez4.inc |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-con=
nectivity/bluez/bluez4.inc
> index 9158687..fbbe0bf 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87=
c09e5b7ccc2c4ca7e \
>                     file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90fb0=
e09 \
>                     file://src/main.c;beginline=3D1;endline=3D24;md5=3D9bc=
54b93cd7e17bf03f52513f39f926e \
>                     file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a40=
781ed30d50d8639323a184aeb191"
> -DEPENDS =3D "udev alsa-lib libusb dbus-glib glib-2.0"
> +DEPENDS =3D "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
> RDEPENDS_${PN}-dev =3D "bluez-hcidump"
>=20
> ASNEEDED =3D ""

Missing PR bump :)




> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


