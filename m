Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mx.groups.io with SMTP id smtpd.web12.5107.1631250226684806607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 22:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@samsung.com header.s=mail20170921 header.b=s/BTBifg;
 spf=pass (domain: samsung.com, ip: 203.254.224.34, mailfrom: chanho61.park@samsung.com)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210910050344epoutp0456432e8ae85ba59669181b83c5830449~jXW-IYAID0737807378epoutp04g
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 05:03:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210910050344epoutp0456432e8ae85ba59669181b83c5830449~jXW-IYAID0737807378epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1631250224;
	bh=hLLKHYYpwssRkXLDFf2IkS0+OMWYeMKf/xYLdWeXCQc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=s/BTBifgUKEijehiQA3NRs8J7/BZQW9M0yGbJL8/pFeVdtmOoqY/7+qqk3+oV+iVh
	 XYjdV1LQEmOiMbeBguZcpTdm5NSZULvNv5mf42TPGWD10EGnwVU78utAIfdqC3j9qt
	 EdL/WuomNF7RRRhf4qqAMbyoT6q5UfckCl1Az8S0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20210910050344epcas2p458e7ece43466f090a7a285b558b04918~jXW_lQVHd3001430014epcas2p41;
	Fri, 10 Sep 2021 05:03:44 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.191]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4H5P0X6Qgmz4x9Q3; Fri, 10 Sep
	2021 05:03:40 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	10.45.09816.B27EA316; Fri, 10 Sep 2021 14:03:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20210910050339epcas2p19673fc9c3fa2e7e5c27bbe3588ca8c23~jXW5-E2Dn0098600986epcas2p1K;
	Fri, 10 Sep 2021 05:03:39 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20210910050339epsmtrp244c626536541cfdb74dba0b54fb3127d~jXW5_YxcV2546025460epsmtrp20;
	Fri, 10 Sep 2021 05:03:39 +0000 (GMT)
X-AuditID: b6c32a46-625ff70000002658-99-613ae72b7c14
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	4E.C3.08750.B27EA316; Fri, 10 Sep 2021 14:03:39 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20210910050338epsmtip2c6e1ac6f77980075131411cd39827f71~jXW5y9QRl1313213132epsmtip2r;
	Fri, 10 Sep 2021 05:03:38 +0000 (GMT)
From: "Chanho Park" <chanho61.park@samsung.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Chanho Park
	<chanho61.park@samsung.com>
Subject: [PATCH] binutils: inherit pkgconfig to address libdebuginfod depdency
Date: Fri, 10 Sep 2021 14:03:51 +0900
Message-Id: <20210910050351.72932-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7bCmma72c6tEg+mdGhbbvmxmsbi8X9vi
	zs937BY/nk1kdWDx2DnrLrvH/rlr2D3ObVzB6NG3ZRVjAEtUjk1GamJKapFCal5yfkpmXrqt
	kndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0EolhbLEnFKgUEBicbGSvp1NUX5pSapC
	Rn5xia1SakFKToGhYYFecWJucWleul5yfq6VoYGBkSlQZUJOxpIny1kLnnFWHN+2mLGBcRdH
	FyMHh4SAicT9LpEuRi4OIYEdjBIHjs9igXA+MUrsXXacHcL5zCjRu+QOYxcjJ1jH7qmPoKp2
	MUosX/udDcL5yCixadZKVpAqNgFdiS3PXzGC7BAR0JF489ELpIZZYAKjxO2WN2wgNcICARJ/
	vvwFs1kEVCWaTzWwgdTzCthJTL5VBLFMXuLIr05mEJtXQFDi5MwnLCA2M1C8eetsZpCZEgLb
	2CUenNvPDNHgIjHxI8R8CQFhiVfHt7BD2FISn9/tZYNo6GaUaH30HyqxmlGis9EHwraX+DV9
	CyvIEcwCmhLrd+lDwkhZ4sgtqL18Eh2H/7JDhHklOtqEIBrVJQ5sn84CYctKdM/5zAphe0g0
	TDrKBFIuJBArsWYC8wRG+VlInpmF5JlZCGsXMDKvYhRLLSjOTU8tNiowQo7STYzgRKfltoNx
	ytsPeocYmTgYDzFKcDArifCe2GCZKMSbklhZlVqUH19UmpNafIjRFBi6E5mlRJPzgak2ryTe
	0NTIzMzA0tTC1MzIQkmc9/xroCaB9MSS1OzU1ILUIpg+Jg5OqQam+Kbja2M5Jdfmm6/ZUDzD
	zeSU6jzzEOMPmh9/L2UI3+ATLbzR72whs2/E6o+GBrPytWJuvdif+DrWOpNndoLlSn93DjXB
	+0ay3PWmk6oVPk8+tCKco9jnX1PsxOjSJS/N8tn+lT7b0Wa+QO1t/z29+TIlpbqTM85l//oa
	59vzekVy/tQLzse+t/x6ZOGy8PqGgCdmaV2vRB5U5S+4zRjIspFv/8FW9dpZOl7X9l827mX+
	5fFyJnPYq/ZF18T8TIwW8f8XPCv3mv3gDoltK6UfCf1ybXD93bOq2E1cabpo+8afz1+1OaR6
	fJLr5RI3u6SyYaEXp9WmfY4CTA6Pv1zMCmXSWlGm2/77/8fWp0xKLMUZiYZazEXFiQDWMLLP
	/QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsWy7bCSvK72c6tEgyWT2C22fdnMYnF5v7bF
	nZ/v2C1+PJvI6sDisXPWXXaP/XPXsHuc27iC0aNvyyrGAJYoLpuU1JzMstQifbsErowlT5az
	FjzjrDi+bTFjA+Muji5GTg4JAROJ3VMfsXQxcnEICexglFh3ZDsLREJW4tm7HewQtrDE/ZYj
	rBBF7xklps1sBStiE9CV2PL8FWMXIweHiICOxJuPXiA1zAITGCWeXpgK1iws4CdxafkUsHoW
	AVWJ5lMNbCD1vAJ2EpNvFUHMl5c48quTGcTmFRCUODnzCVg5M1C8eets5gmMfLOQpGYhSS1g
	ZFrFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcfFpaOxj3rPqgd4iRiYPxEKMEB7OS
	CO+JDZaJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTBF
	PrgWqzNjS51/7Mzz5/xfbFqvv919w3oTh/BK56ZN2ZqNyjoOj7rcnUqsWYT6Nf4tY8w6uN6L
	+feC/KIay4QdS3JcLh1JWft9y6Ipd3+vY5p2wLCKt/1+d/m38z3mpa6Jx844H5xz7mRsFssU
	xjlPY1fxsFm89r3/RuueuUvTJQV7gw/lWb8/fU5euLt5o9gcoZsH3s42/fmk+pRh4iSpjTec
	74W9Cr9rWtP3T55f4dVnn209yqH1gWV94SYfrjW9XnjP5953ve2V7a3L/1lEVt6aunbq6sV/
	JuSGMapbrPR52ll8xNzp5VJDwz9cC6R13GdMDElTvdK57VNIUnjouYIbOZ9+vbidev3n7Q43
	JZbijERDLeai4kQAoqHu2K0CAAA=
X-CMS-MailID: 20210910050339epcas2p19673fc9c3fa2e7e5c27bbe3588ca8c23
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210910050339epcas2p19673fc9c3fa2e7e5c27bbe3588ca8c23
References: <CGME20210910050339epcas2p19673fc9c3fa2e7e5c27bbe3588ca8c23@epcas2p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Since libdebuginfo was default distro feature[1], cross build of binutils
has been broken due to absence of pkg-config. To find the dependency
properly, we should inherit pkgconfig bbclass.

checking for aarch64-poky-linux-pkg-config... no
checking for pkg-config... no
checking whether to use debuginfod... yes
checking for libdebuginfod >=3D 0.179... no
configure: error: "--with-debuginfod was given, but libdebuginfod is miss=
ing or unusable."

[1]: https://lists.openembedded.org/g/openembedded-core/message/150666

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
index 7d5149fa16ea..2f65ae54741c 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -13,7 +13,7 @@ LICENSE =3D "GPLv3"
=20
 DEPENDS =3D "flex-native bison-native zlib-native gnu-config-native auto=
conf-native"
=20
-inherit autotools gettext multilib_header texinfo
+inherit autotools gettext multilib_header pkgconfig texinfo
=20
 FILES:${PN} =3D " \
 	${bindir}/${TARGET_PREFIX}* \
--=20
2.33.0

