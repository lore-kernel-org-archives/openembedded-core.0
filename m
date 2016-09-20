Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3481D60248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 00:50:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K0oMDd018566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 17:50:22 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.129]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Mon, 19 Sep 2016 17:50:22 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] default-distrovars.inc: remove libidn from
	LGPLv2_WHITELIST_GPL-3.0
Thread-Index: AQHSA/2qsgEd6tqW1U+FJ7Skz7tx8aCBqdmg
Date: Tue, 20 Sep 2016 00:50:21 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2D2400@ALA-MBA.corp.ad.wrs.com>
References: <20160901024821.28166-1-jackie.huang@windriver.com>
In-Reply-To: <20160901024821.28166-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [PATCH] default-distrovars.inc: remove libidn from	LGPLv2_WHITELIST_GPL-3.0
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
X-List-Received-Date: Tue, 20 Sep 2016 00:50:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Thursday, September 01, 2016 10:48 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] default-distrovars.inc: remove libidn from LGP=
Lv2_WHITELIST_GPL-3.0
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The libidn recipe is now buildable in distros which blacklist
> GPL-3.0 without needing to be explicitly whitelisted (since it
> provides at least one non GPLv3 package).
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-
> distrovars.inc
> index fac4deb..f7ed943 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -23,7 +23,7 @@ DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}
> ${DISTRO_FEATURES_LIBC}"
>  IMAGE_FEATURES ?=3D ""
>=20
>  WHITELIST_GPL-3.0 ?=3D ""
> -LGPLv2_WHITELIST_GPL-3.0 ?=3D "libidn"
> +LGPLv2_WHITELIST_GPL-3.0 ?=3D ""
>=20
>  COMMERCIAL_AUDIO_PLUGINS ?=3D ""
>  # COMMERCIAL_AUDIO_PLUGINS ?=3D "gst-plugins-ugly-mad gst-plugins-ugly-m=
pegaudioparse"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

