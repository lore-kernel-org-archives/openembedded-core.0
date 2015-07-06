Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D5EF175796
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 09:55:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98119974"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jul 2015 17:59:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t669rrNi018092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 17:53:53 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Mon, 6 Jul 2015 17:55:34 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] perf: Modify SPDX_S directory to avoid
	do_spdx error.
Thread-Index: AQHQr+ZZ3G2UfCTIQ0+8RL7sB9wzsp3OQ+ng
Date: Mon, 6 Jul 2015 09:55:33 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87390C837@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1435305686-1665-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1435305686-1665-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [PATCH] perf: Modify SPDX_S directory to avoid do_spdx error.
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
X-List-Received-Date: Mon, 06 Jul 2015 09:55:41 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Ping...

Thanks

Li
> -----Original Message-----
> From: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Sent: Friday, June 26, 2015 4:01 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Subject: [OE-core][PATCH] perf: Modify SPDX_S directory to avoid do_spdx =
error.
>=20
> This is because S =3D "${STAGING_KERNEL_DIR}".
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index eb27374..52b9404 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -61,6 +61,7 @@ export PERL_ARCHLIB =3D
> "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
>  inherit kernelsrc
>=20
>  B =3D "${WORKDIR}/${BPN}-${PV}"
> +SPDX_S =3D "${S}/tools/perf"
>=20
>  SCRIPTING_DEFINES =3D "${@perf_feature_enabled('perf-scripting', '',
> 'NO_LIBPERL=3D1 NO_LIBPYTHON=3D1',d)}"
>  TUI_DEFINES =3D "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=3D1',d=
)}"
> --
> 1.8.4.2


