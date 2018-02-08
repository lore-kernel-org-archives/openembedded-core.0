Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 922 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Feb 2018 20:41:08 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0075.outbound.protection.outlook.com [104.47.33.75])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB31784F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FfZbsOqmHkhSnLXzp2iItqngLkkl7MkmcRcjYJ/f5OQ=;
	b=NRao3WUrpckUwkFDz8KZcAJa4oP2N7FQb36Q0whQS4/snNWXJAoGtOUy1qktLOIVR5gHFraraEmVPAyYs7UV4eRDMRmUUR8GH/GjNhUCB5KblLsi9bvG2XSfcg9VRf+Ty1y8E+tNv/UEcCYFvVitFFOXgwCFe427AgsoqyFrQd8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Thu, 8 Feb 2018 20:25:45 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Feb 2018 12:25:28 -0800
Message-Id: <20180208202528.15299-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR18CA0043.namprd18.prod.outlook.com (10.173.177.29) To
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b925f988-01ff-4457-0439-08d56f32222f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	3:jsfmNLazVl9Onn5Ew5MsDSqKbnKp6jgg+cjaJv3/ELKnq2paYQqLqGHGt1OJecNP1FQ+VrxWfgBk67MIxRFpxm6OEVZ4jwz6yk/zUG1dPU0BMI+sKORX9LKOtte0Bq3f4bxmCEeI7sVrOVYYVxc/bv5Ux53dXP46YdQP3p2DMIO9xxgsKNjOvAA6uKtzmwwucglwIusvM/ijk6tL0orVMLI9FkhE06Rxe8P4WAudLhX6sWZXH1S3HNGGW8KLkMBc;
	25:OXFrjFdaWYFR5SdCzmPu8FnaO1OqJHHGSX1M9WVd5ByZJtehvlt4HdmnQyBEvbRDfseTTk2E5X1XtxHt14IYH7Hef5IzGOTDF5TuCmAO351j4NaNYhWOEvjWyWtG0YGhfBIGnvYgvXqOMJYuGTbwzG+rBShXESWMbn/4rlWQpveVjn9CnkcZsP8/Y1TclNKTBjgkgmL6uAPoD/hoOXU3TdXQek0VSCLnwMlIq1fZlY0KpvY8SR/9lgBNMUbHDdoaiKJbmS+H83Dv1UgcRSmVeJbhMk7ZlHQbPfnepmDUZnPHTnLGSJDftjSeVDvZNiSiuY46nsZO4Qfovx3i3VQOaQ==;
	31:4B2pIdNWms6tZZPfID++FIdaMlhEh7K9zn4YMohOiOxO4NReZh8qlr5zG/tMTdkPq/4Puljk5iqbmDNqSSgK8J9AIMBW6WOrZDd0QWbBlNFi3YUIzj3V+qx+m0o7pu3EEn+NdEOZCE2SF7/cm3n+IlyQJs94+fQHXgdr0fjuXNUWJHM3OMtkFv6Gjd6kFM0XO8bmWhvgFwomzOuwfMU7Hga3zTC1bHhkkKRi4TQZ+34=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2933:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	20:sbYMjnxgkYf0AT0z8pQKQ7wQ8nb27SogEIY5IQD5y/trgcaEiRHA9drX+mLgg8pdBIZX+6yfl5JYvJbUpl/wRU4vRWsBO4mhRuorHVUVOQrCI8dG8/n2WPDosheGM7FDw5IRkg2PfTJHMclH3fsm7PNueyq+Ng220imesEhcGaASs4kAp0ljy5CdO8C47DbbD6QhLdZEXXivW35rbMqwGZ+pxgsUPY3EEMYq0Kq+XL1hNJDoRgDRZqQXzS9bx42kXCr1+EvYuUoUg78cT6QnfKIduvP9cUpU4A5G3IdOcltwPaab5t7dHIQ439VBWl+fHuJNSyn1Ypy3WyUnrk+CuSxNFJtGmTVIQuj9LW4gfRR33E7P7jQJefpnVAMCDSl1PLbbm/B6ftkk+hSfyCc5ol9QCSF9kf6rOMPmo9fdJu8=;
	4:66pFIh4JzcYPjKUduJSPEK4MNwJbN+XJ8+ESMyf/GAXL9YQ37Q703wPbrExkULLYzsnnOdckivJx7vpJpwRuTFbMt7PReHtTT/qPFKF8zY7pt+WOM+Zzh0iIlT/rw5ZQH3rkdCyjYNfmFtXWbJwmm8Wow6yhbUbJxbFah66jqmd5fvFQx8UqcxMEVEeuATNyYN2lCMDWah3aqJENAQC6N3imX8MA/t4jGah+X80bc/80ntLGELFWeKaE/vceO0zi3/tyghps2WrRN/G9no4qz2TlOv92XI2HMXFbgbYFBnIXOGXWqn6SvIMP5okOMKGW
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293345D8E0CDFD295D5AFAC3ABF30@CY4PR0101MB2933.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231101)(2400082)(944501161)(6041288)(20161123560045)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0; RULEID:;
	SRVR:CY4PR0101MB2933; 
X-Forefront-PRVS: 0577AD41D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(39380400002)(366004)(39840400004)(346002)(376002)(189003)(199004)(50226002)(105586002)(8936002)(16586007)(86362001)(1857600001)(1076002)(2906002)(478600001)(54906003)(7696005)(5660300001)(106356001)(186003)(51416003)(52116002)(16526019)(36756003)(26005)(4326008)(6116002)(3846002)(6916009)(316002)(2361001)(6666003)(66066001)(7736002)(6486002)(97736004)(2351001)(575784001)(25786009)(107886003)(68736007)(47776003)(8676002)(81166006)(81156014)(48376002)(305945005)(53936002)(386003)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2933;
	23:E8Y/+O/nGCRc/Cl1rQyDfV4+jNaWkGFJe1shMa/?=
	=?us-ascii?Q?o3ulqGVYqPG2eYoMGyuXe8pKMo0AH9U0BJiwM8JPLC/1nte4avaYh+i63LS7?=
	=?us-ascii?Q?9mAqU+YQGXzVG0V/UyQDeowlCleZs4+evbUYbCm5boqPcCU5lH2oKvVG9+QE?=
	=?us-ascii?Q?tgji2OgCe1riiK5mf8HbvNv/mh8HP0bMU6pCQrL9o1vk3o/6duI2SpqJS3S8?=
	=?us-ascii?Q?sOlz3eJHT4aPGZ9B5d3TxTWfPCGA05sS9oncwkPMVJHH0m7LG4rtG804xGDd?=
	=?us-ascii?Q?fPfQNYEmw1oBM4y5FAssL7WmH7EmN6JQmrZqdAZpzEewRs30Of4CuDvaHrCj?=
	=?us-ascii?Q?3XnEDQDYmlM1mU1J6+SGjUW/Tx7IszZILgLxGnxiDI9ezfX01a1VmVEu3pVG?=
	=?us-ascii?Q?BR2ELbMUKLBVYbAnT5Il6sydQhi6mHYAdtDT/e7Oi+ZhMDB4OXWb6i8hFPk3?=
	=?us-ascii?Q?TGoSnXDJysZysL0zz7LKlex2nXas87Mk3+RYCs+PB8QrCxBAX/CpvzdC6gOW?=
	=?us-ascii?Q?/2AcVuhlh+9gbNiPKkhxWA/4Bc3Q6+mwcdG6JFk9VwwKWE4yG6NqPTEwaITN?=
	=?us-ascii?Q?HCf/js4duK3Z5YX6zQKt7Grmz9Mtaw3O7Yomjydv5jR3blyommV1NQtlMxW8?=
	=?us-ascii?Q?Sq5roo7B+W0e5BfSSDZ5rLZd4UwNyd6jNXi9+i81j6c4FGUy45IBzMjpNA2W?=
	=?us-ascii?Q?OBk7FnBdFIuzXDNB2rNNs4X7LSgjJGulItCBEmvfinqyZroDVhs6Jq9PByxf?=
	=?us-ascii?Q?Xw2zCzO9gzt9SFmpVHsNRqnbgjT+RYGXErdlcvZizSlTWxIYi7uAkPLJ9iI5?=
	=?us-ascii?Q?JO4zWZy/KJdVrb6lyEg9pG0icPS/gfbTvaonji058y6qSDog+98fVwyMPri1?=
	=?us-ascii?Q?N/I9rro+0nF/t4y8EdrugXXJA4BRa8mw8dOr28A3c3dv6B/6vzRoxAj18Zuo?=
	=?us-ascii?Q?6Obznmuo+eRrTYGjS/wvteaEN4fxoOOGFpgUBSlQs5XIfbj/IAgo4XnVyBxX?=
	=?us-ascii?Q?3MDLiUX1O/i6TzTN6UDQfnpgrU0felmfGmj6r9P+4r8t31n1K9+IGHG63fXz?=
	=?us-ascii?Q?ehc+HXpz0C0hQB8z9DchIeFPEEPISHaCOGfPVgVuEi4ReKF6WFrWnDPmbxwo?=
	=?us-ascii?Q?zxLbENPlH97qF5r+Mto4BQUU9vSPvDa3oOpu6YK4++cXK88h00oPwRVLxhE7?=
	=?us-ascii?Q?+vIXucJskE2wVV2E=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	6:4cD4sbAh6rw4UxhshfcCvcaTK0eRJGaUW9ry1UjA2b02xbjvAVsjdP26Hv+UeP1C/FCO6CBIed1ak3G6qiJMluYTT72VFLYQiDufy13cuyFQemzcGPLtext1XEgqFqfbj7GdLq9ZeOMSEgdBXWGDyHpxkL5D8t6AV8KYVtKzwaugSKNIwLGip6fIm17cZ+E2FUrGJURMhaYC6hvPapsGJVx1qDuRSHH3cpOw1HLTPNW84Ha8mgi5L88Kmdc5+nUwrU2yf/9G2mpV2ARZCkZ9WIRZuXjW8AXF3EgwzUtcW6tQrZ2RwWPC5aJgYt81rQEThjFXitPLgy1d/ZhU4ZmFQkR31mk94vnHOxlYz+jtnnY=;
	5:RfM/2pyaRNiWxXGdMu3KZyj7nB/142QdMVZjd5TYTm2Z8EWgn7HWBQae3FEpyft/ZgQ4SBvvjTKxvtv7FVLwosBJD0TDBCqrOKQ1lAerCSssbWUxR0K7VVQ4KrLy7qiVcjVaqdXf2I0SkNwuD+paLX9s5ndEW5SuPkfPxo1J+MQ=;
	24:Sxm1gPX4UEtJfoJYowkmIEtvoMUFIWcdwu0kT2IykYUUjwdwqhSE0ddI/bm4EQ/0GODUzJ6RZ3Y8pFcGolGg99GKyH0Wpa1Ao083v2EN3mE=;
	7:nrizQMNp7t4TZybDbJNqPWSXhwwwqsra8xVqNaRji08hGaSgwXm4okjfGFuJXvWUJVs1MqPO8yUrz/xEgxP9a/P9f4zyeLt+meF2clh6XGmkcyEdwWql/uPdO4CsH8Bqg/5EyKJQdjwKE2A82Ok/Vaox6orYmtY+qsiLSdvuxa3fYRwE69O16IG6MQK2igzisF72kZQuVjYOjSkMDaDIe3q1lI+HjBHKToQUxQsuDomAak+sl0h8A3Yq+59aCebe
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2018 20:25:45.3472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b925f988-01ff-4457-0439-08d56f32222f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Subject: [pyro][PATCH] python3-setuptools: extend to nativesdk
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
X-List-Received-Date: Thu, 08 Feb 2018 20:41:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Extend python3-setuptools to nativesdk because nativesdk-python3-pip needs
it.

Also, adjust RDEPENDS variable setting to keep the runtime dependencies
for nativesdk package the same with the target one. The native package and
the target package's dependencies remain the same as before.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-devtools/python/python3-setuptools_32.1.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
index 65af6f0dad..63f241809e 100644
--- a/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
@@ -2,6 +2,7 @@ require python-setuptools.inc
 
 DEPENDS += "python3"
 DEPENDS_class-native += "python3-native"
+DEPENDS_class-nativesdk += "nativesdk-python3"
 
 inherit distutils3
 
@@ -14,11 +15,11 @@ do_install_append() {
     echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
 }
 
-RDEPENDS_${PN} = "\
+RDEPENDS_${PN}_class-native = "\
   python3-distutils \
   python3-compression \
 "
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS_${PN} = "\
   python3-ctypes \
   python3-distutils \
   python3-email \
@@ -34,4 +35,4 @@ RDEPENDS_${PN}_class-target = "\
   python3-unittest \
   python3-xml \
 "
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


