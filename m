Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RH7Un-0004SG-N1
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 07:18:17 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB23.4emm.local ([::1]) with mapi id 14.01.0289.001; Fri, 21 Oct 2011
	01:12:26 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to
	correct	location
Thread-Index: AQHMj67FIso0sy+L/k2y8guTqQ0WoZWGQSGQ
Date: Fri, 21 Oct 2011 05:12:24 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF1A8929@MBX20.4emm.local>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
	<1319173361-11527-3-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1319173361-11527-3-git-send-email-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] gcc-configure-sdk: Point sysroot to correct	location
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
X-List-Received-Date: Fri, 21 Oct 2011 05:18:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Friday, 21 October 2011 1:03 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to correc=
t
> location
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-sdk.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recip=
es-
> devtools/gcc/gcc-configure-sdk.inc
> index de80870..98fd4c1 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> @@ -7,7 +7,7 @@ USE_NLS =3D '${@base_conditional( "TARGET_OS", "linux-
> uclibceabi", "no", "", d )}'
>  EXTRA_OECONF_PATHS =3D "--with-local-
> prefix=3D${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
>                        --with-gxx-include-dir=3D${target_includedir}/c++ =
\
>                        --with-build-time-
> tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
> -                      --with-sysroot=3D${SDKPATH}/sysroots/${TARGET_SYS}=
 \
> +                      --with-
> sysroot=3D${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-
> ${TARGET_OS} \
>                        --with-build-sysroot=3D${STAGING_DIR_TARGET}"
>=20
>  #
> --
> 1.7.5.4
>=20

Shouldn't --with-local-prefix be changed too? I am testing with both ${TARG=
ET_SYS}'s replaced. Will post results shortly.

James



