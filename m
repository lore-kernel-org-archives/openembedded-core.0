Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQZ53-0000c6-Kf
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 09:07:01 +0200
Received: by wgbdr1 with SMTP id dr1so2902243wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 23:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=prHTndVIjhpsUDJCvffyOO8Qh8rIi9DoT6r/2RbDsZE=;
	b=hE8kDuC4F8nTkr4Cqq0YmO6s9ybIQd4yxWE3fJUq582X+6bKs313Waj86J5867Wvw+
	aCzjQGgk3XmjIiuALBnWaxBEDlCBUqZ7YxbQDLMxTvZJ4CUbUfdMEaMVxh1Eh/lx3B3w
	VHtr3jSMDzpCds2TGe5JoB9DKJFiYMjpnMDo70ZEEp0XHOFM85lSGygH9L+XWoimXGNh
	kIS1GqzABmtrT8Th2QYvHSRewjLJmiASPMCXNwpi9rfyRI7aV+pFvTYWF+qIRq6PlMwR
	nWaawDrU3+LuaDgoksU9QXAdELhATwu6kwwynG+WVkzYHmbaYg0lC40GmJGvU8oyymrx
	8kPg==
Received: by 10.180.97.228 with SMTP id ed4mr22403186wib.0.1336201034013;
	Fri, 04 May 2012 23:57:14 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm5368194wib.0.2012.05.04.23.57.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 23:57:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336176824-5954-1-git-send-email-sgw@linux.intel.com>
Date: Sat, 5 May 2012 08:57:12 +0200
Message-Id: <5B2F5D0A-BEEF-47BE-85DD-F9FCC7E290DC@dominion.thruhere.net>
References: <1336176824-5954-1-git-send-email-sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlRzy7Tz6QTYd7a3ljkWdoHjzJulUGGT4R79043mICwYzdSArw9kt2hPvmgQeijcj+4Kx28
Subject: Re: [PATCH] libpcap: Move pcap-config to -dev package
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
X-List-Received-Date: Sat, 05 May 2012 07:07:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mei 2012, om 02:13 heeft Saul Wold het volgende geschreven:

> pcap-config is a tool used for getting the cflags and ln flags for =
development
>=20
> [YOCTO #2367]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-connectivity/libpcap/libpcap.inc |    7 ++++++-
> 1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc =
b/meta/recipes-connectivity/libpcap/libpcap.inc
> index 427078f..7950b2a 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> @@ -13,7 +13,7 @@ DEPENDS =3D "flex-native bison-native"
> PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'bluetooth', =
'bluetooth', '', d)}"
> PACKAGECONFIG[bluetooth] =3D =
"--enable-bluetooth,--disable-bluetooth,bluez4"
>=20
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
>=20
> SRC_URI =3D "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
>=20
> @@ -30,3 +30,8 @@ do_configure_prepend () {
>         cat aclocal.m4 > acinclude.m4
>     fi
> }
> +
> +# pcap-config is a dev tool and should not be packaged in the=20
> +# core package.
> +FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> +FILES_${PN}-dev +=3D "${bindir}"

Change that go ${bindir}/pcap-config to avoid being too greedy during =
upgrades. Or just inherit 'binconfig' :)=


