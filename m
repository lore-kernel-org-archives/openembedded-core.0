Return-Path: <oobitots@cisco.com>
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
	by mail.openembedded.org (Postfix) with ESMTP id 25A917D28D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1529; q=dns/txt; s=iport;
	t=1557995575; x=1559205175;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=ehUH9nUPoa2Y6r2GbBU+ieIZEfcP0pDRnWk56epP3m0=;
	b=bGnSpBzDjUU+V+yriFE0MeFxqyTEZZXrQWwbeYlcP6v3gERs4YwfMSoq
	2VmhDFleo4BCipvi4X6GblDxMpByao7Xe7tN+7ljbc+99ybVuctuT2pos
	J7yfzmSbOYGKjUZw+gORM37L2yOQxruA0J5lrQPt1Mhxdspxm02Yqh9mP 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BdAAAtH91c/4sNJK1kHQEBBQEHBQG?=
	=?us-ascii?q?BUgcBCwGCEGlUMCgKlw6CDZhTgXsJAQEBDAEBHxABAYRAgi0jNQgOAQMBAQQ?=
	=?us-ascii?q?BAQIBBG0dC4VLAQU6EQE9AgEIGB4QMiUCBBMIgxuCCqxQg38BhjWBMwGLThe?=
	=?us-ascii?q?Bf4QjPoREhWIEp1kJAh2BbIYhjDUjghSTWow0gSKTaAIRFYEwIQE1gVdwFYM?=
	=?us-ascii?q?nCZBIQTEBj02BIQEB?=
X-IronPort-AV: E=Sophos;i="5.60,476,1549929600"; d="scan'208";a="271230194"
Received: from alln-core-6.cisco.com ([173.36.13.139])
	by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	16 May 2019 08:32:54 +0000
Received: from XCH-ALN-006.cisco.com (xch-aln-006.cisco.com [173.36.7.16])
	by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id x4G8Ws4a011093
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:32:54 GMT
Received: from xch-rcd-007.cisco.com (173.37.102.17) by XCH-ALN-006.cisco.com
	(173.36.7.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 16 May 2019 03:32:54 -0500
Received: from xch-rcd-007.cisco.com ([173.37.102.17]) by
	XCH-RCD-007.cisco.com ([173.37.102.17]) with mapi id 15.00.1473.003;
	Thu, 16 May 2019 03:32:54 -0500
From: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC@Cisco)" <oobitots@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] protobuf: Fix ptest compilation
Thread-Index: AQHU9GntQc8J3s294UGkpb5K2Wk/XA==
Date: Thu, 16 May 2019 08:32:53 +0000
Message-ID: <d0be2f64c3564298aca4a3598fb5c9d9@XCH-RCD-007.cisco.com>
References: <20190416153442.26880-1-oobitots@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.63.15.143]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.16, xch-aln-006.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
Subject: Re: [meta-oe][PATCH] protobuf: Fix ptest compilation
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
X-List-Received-Date: Thu, 16 May 2019 08:32:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any comments?=0A=
=0A=
Regards,=0A=
Oleksiy=0A=
=0A=
On 16.04.19 18:34, Oleksiy Obitotskyy wrote:=0A=
> Tests require c++11 support, so add -std=3Dc++11=0A=
> to compiler flags.=0A=
>=0A=
> Upstream-Status: Pending=0A=
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>=0A=
> ---=0A=
>  meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb | 4 ++--=0A=
>  1 file changed, 2 insertions(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-o=
e/recipes-devtools/protobuf/protobuf_3.6.1.bb=0A=
> index cf72d9ca7..4791e13ca 100644=0A=
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb=0A=
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb=0A=
> @@ -40,8 +40,8 @@ do_compile_ptest() {=0A=
>  	# which haven't been installed yet.=0A=
>  	cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"=0A=
>  	sed -e 's|libdir=3D|libdir=3D${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TES=
T_SRC_DIR}/protobuf.pc"=0A=
> -	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobu=
f.pc"=0A=
> -	sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/proto=
buf.pc"=0A=
> +	sed -e 's|Cflags:|Cflags: -std=3Dc++11 -I${S}/src|' -i "${B}/${TEST_SRC=
_DIR}/protobuf.pc"=0A=
> +	sed -e 's|Libs:|Libs: -std=3Dc++11 -L${B}/src/.libs|' -i "${B}/${TEST_S=
RC_DIR}/protobuf.pc"=0A=
>  	export PKG_CONFIG_PATH=3D"${B}/${TEST_SRC_DIR}"=0A=
>  =0A=
>  	# Save the pkgcfg sysroot variable, and update it to nothing so=0A=
=0A=

