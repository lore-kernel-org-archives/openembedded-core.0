Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 8239 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jul 2016 08:53:58 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0078.outbound.protection.outlook.com [104.47.38.78])
	by mail.openembedded.org (Postfix) with ESMTP id 5006B60119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 08:53:58 +0000 (UTC)
Received: from BLUPR0301CA0020.namprd03.prod.outlook.com (10.162.113.158) by
	CY1PR0301MB1308.namprd03.prod.outlook.com (10.161.212.18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.528.16; Tue, 5 Jul 2016 06:21:06 +0000
Received: from BN1AFFO11FD035.protection.gbl (2a01:111:f400:7c10::130) by
	BLUPR0301CA0020.outlook.office365.com (2a01:111:e400:5259::30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Tue, 5 Jul 2016 06:21:06 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD035.mail.protection.outlook.com (10.58.52.159) with
	Microsoft SMTP Server (TLS) id 15.1.534.7 via Frontend Transport;
	Tue, 5 Jul 2016 06:21:05 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.66])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	u656L10M031780; Mon, 4 Jul 2016 23:21:02 -0700
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2016 14:20:58 +0800
Message-ID: <1467699658-4985-1-git-send-email-zhenhua.luo@nxp.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131121732661370949;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(81156014)(81166006)(33646002)(69596002)(11100500001)(6806005)(87936001)(189998001)(97736004)(4326007)(2351001)(50226002)(106466001)(105606002)(8936002)(8676002)(104016004)(19580395003)(19580405001)(2906002)(86362001)(36756003)(229853001)(586003)(50986999)(68736007)(48376002)(7846002)(50466002)(85426001)(47776003)(5003940100001)(77096005)(356003)(8666005)(92566002)(305945005)(110136002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB1308;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD035;
	1:Ijq+7jwGZ8DlhDoJEs82Qo2v5NCjbQmh8NIJwlYIFx8GEkSNaSHvKBDdegthVWsRjpOq2zpgFEyhyEZJulGHwpsBNPObfRV0x9KVefJiLzfRQHgPWL1DKrYL+dKbm1t6Bu5cIpytdOSqQDSGq259WBQOj5JyHtEUjXjeR9Ck0IEnXnN4/cVFCO8IyDw/PaujRxCiw7tPNyxl3qW+2rzkLpuSTukgL0eHZGea45pbBy6rlmEh6AqyFRW5yeMenSzlpOwV/bZxwYdZQ8RmHnFYsVnCrVSzLLY05up6qddNV1Gq9lb3WxPAfGCyOihxHuE6Ghy+J0OcodFgaGnuOh9AGnGT0pU+zu5aSJNQrphiu22xBozhz6BKBkZwwvLoqeTRI+X9UG4cIZVUha3T1K2U8UQJp6L6VOh7zkO1RchsE0khjFN2tX+ZrnwmjgWt5jB6vYFfgRO+8NMktizUyCtab/BpuI9NSA9UP7l9aj4gulo+kX/hQAjErf/irYyXX5V5z8flcWXgFrcuyRdZ2PakzJN6yqEsavJzTaA1BVJN9bGw659ZQxyFlZXF2bEvACQIZo1R/WysfL3xqGzFJbF85x84jezmnvpSOnsYudaK9BH8CuniiEyc2+xeDvJ+GrDMl2nay6XKk6t2+qi7C37TIRoHGIvW5FAphyWLR8wh+Yg4nWikydNC1IbWg+weBYePOQnteoTBtT8IO7NID/03BCgDdZM5HfIqUvr10ujf2tk=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 64f9389a-fe89-469d-6045-08d3a49c8c14
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1308;
	2:tTy95IpGuqrh2aSWkThu8Aw5h7DDQe/ceGVw770k14GpOoFRSf6kJbscd5o3QvRw4AidwRkOpYKrCQbReq4jJP56G4XbM28+ghc2f9ZSac7JK6stQ9HKLxulo1J3cieuVjA/pZkbd4ozsY8rF33yAik0FqkuaRXC5x8V44PzGOFblz5zEuZ03iJ2L7iEjz/8;
	3:gnVgHjQ606mLo2lBLgye7vuwSl3CUdcT/EW0VUvBK4wONtP8gkd9TEc5xcdvin4ZgMzF7edvzhBdk6AXq9IiTRVFfIlpq/p3Qoccs3n+1+WCDWw0l04WdeB3i3RF9dWfHpxOYQ5L5ynWhQy8BqUXoWZvZGGvwVJ7et77+ue7qFwcNDFEnmmXx7QKtbbg29epfZyiKGoPP0FtbemgfNFnYAl8jelSTk1GvTZrnUa7HxE=;
	25:iIqnWbfeVOvXd1vqtQOMPyKyEOTFgjEibI2BvwBh4uoFyi5Nsnrw1HKmsilcpfpDy1zy9+LXJ0rnX+M7a7Lo3CXseSh/WQ2wvDhUH9ZkMPRXWgAqSxtznbHqBhBOHqJzgTncoat7JwDfPNnn+BiwXC8JhcycsIW3CCgiMWpTA+h3+fIObXmIQkOLdXHq6n/g9JyC4JxA6hEI3V1wuxXzON+6G+K0pWvP9xd3kUAEwrNIM4hVpPRTp4OTIBP2Clch+w89PRlxtnK5e5hhSjimkWGyvyJfx5l3FCeJcKgY6gbrLubjj/AIWd8Q0okPnPGaVL95jEdWFODeEskwnD1BjuAw8BhProHEWzW2Zex8sgbQNWU1O8pJe6jziMm46tTgWJuqwCYrU459NHVPpQ2zWo1Sub879GmBM86Rdo+2IKM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1308;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1308;
	31:0QFcVuWR7OzIX8Xo9yOH+AUzaKR14Kr12BeNnnDBeSCaiREq2K+YnuMNtGrTYvPuHzx94SYFt23vO/ydS578EoXmf7FMcMlUg3zqL67TxiMf4NtJsqg7YNLxTrz/qhTkqNxKyR31gExqlG6wGDKHl3XOHzx6EJwG3xnrqk6/2o1VT2zaRt8SzXFAASCcfsWh/3oZ9ypluoWr877AC+zCKg==;
	4:dvT1vmrJiB76ktSXwM7ot8jDNb3qPYejYJwex1aJi+IvSrynB03hPIa7oB2/h78e+I3w4R8FKEZTQqBYxHUCvLSxrExtHGAe0ExLpUD0px03R7fsvDLyVFjRy3/oy9e69jJ0f2gpakE1oA+UtXuyuQFyxKvo4lrs6QWBV6+7lWIJrKaMaggClUyDdRt3wO0EWaX/PjmRL+dBI/kpUvlUCXMA2fzE1+E9YHdVZBIh/5m8ES57JMYb+TU92SG/BVLN3KXe1JL40yr0rZpew8chKIU0SysTcOI/LWw579GGgqs1DZblo/gYK6KeY1MCLLIjaL1VOXTx9Y8qCwU9uhJIdmR174roHn234+fTsJ4wnvEHOsSOZUCu0gPMraS+Z2qO5csrPwJlgA8d2QJu4xZvsfZKB44+TZ+8wrJ4JfLWx+ibQjR9jbwXJpSRQgu01wOO6wEqi98ARiZLHreC0cAxrdTSsjJ8QutxvFqmC2/IQUyPK8RnMRjm9yEEvYQ1eUCyx3J+6r0lM8WQ85+fG/Y2Lw==
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1308F73DF57F1AD4496CC205EE390@CY1PR0301MB1308.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(13024025)(13018025)(13015025)(13017025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:CY1PR0301MB1308; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB1308; 
X-Forefront-PRVS: 0994F5E0C5
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1308;
	23:SeoQvNTWykdrmYtpEkj0tWSCtJeOJoDIRQ3FCi/?=
	=?us-ascii?Q?dB3XHneGhws3VLSgc4GL0EMIap+fFHllncRszkx5BPR7qegpCwmSk/pIi8hH?=
	=?us-ascii?Q?nOKwUkFEJb4/yMlILS2hOkJZjEjACRSCC/rYY2iwJv+O+j86Yn1GLBAKPw6/?=
	=?us-ascii?Q?DZYKhk9aftQ1vaCdYyJdAZd8FIIzHDZ20id/5PrUemrZvD57gq7K1BF3NM+g?=
	=?us-ascii?Q?O8ncnWMs/3ZwParVlXzOFCYoVUnHDZLEaG39ut/uooKyhhf9CLLcfq01U1nm?=
	=?us-ascii?Q?H6TQBICn3E4Uzw5CJmypsAYzq3Qta63bxr+Dk9s8tM9kJTRXSBzT5MAXQoJh?=
	=?us-ascii?Q?btXkni80WC189mmvMlix7uFOsJY4TxKcwY54DDJHFR4/FHaHvtN0BfrL+8BP?=
	=?us-ascii?Q?VGV4qmBt0zG7oygohPn3d75dvwKzLQZiSNGuJyCJRASnXyKLbPgyBZdfdeg+?=
	=?us-ascii?Q?l7vVV99pzOhNQUQBCtNNMXnfGj2iv7OT1+FrKtDjLgGulnaVFFJPGTpcDRnB?=
	=?us-ascii?Q?B7Av0WhNUs0MqUcZ4jS2O3uH0uYO8p6MH3U02mOvCv2CwlrCtBVJLy3+Hl99?=
	=?us-ascii?Q?MEX4nLlR1FzTjixEj+WnzoKa29sQjytX2QjMmeT66g9fbxpSlxiinkDc7RVd?=
	=?us-ascii?Q?vVaQekafpa9KlsmS2YdsNFRw2CCayfQkikN4ySTyRUwWbc5vw+xFqRhM5uIm?=
	=?us-ascii?Q?qmQZ61jTwn2pbut5RqaIavFNALQUE81awXK9z+kOgqFaqDz3yoal14zgWQQj?=
	=?us-ascii?Q?h0bCbgrdL7n/GdUiqDunYLS/DLlw1gWFnBQpz4AYnDB5dWuSgSyOfgWobCgA?=
	=?us-ascii?Q?qORq5dnPudQSk8toex4wfyrvghbR3RVZfVLdpdMj4D4Vm/IA17UIxIMhQL+e?=
	=?us-ascii?Q?03WbLjsD+K3mvNIhuCBbAFFoUppQrfK7f4kpmM1KodQVNST5obEAAczhLjOd?=
	=?us-ascii?Q?f044R84pbtDmxU5GZHKZSgIYY711+ZinzMqJcSwb0WUK6t+62kVOk25pK04a?=
	=?us-ascii?Q?YuIpSwvbqrX1dmiat76kE+B27qDJIbvp0YNEpYyp5zrAfVJ967OuyhVS6axO?=
	=?us-ascii?Q?wlyqOGC9W/PyDKc3MMVb5o2D1GInhYfYrRFMiG7xo85BMOEmELkJVwFyqnBV?=
	=?us-ascii?Q?g+g/Q2GYzvUY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1308;
	6:JOAacWvV25MHDRlDkTJyg/VIGN9Dww2Ma1LxsJKciD3T/a56VInXQhJRVHfhLoMlfYgK0LO0VGdVivBd04DVMoFxq+acRBQHx6EnFce+2spHJBElkNf66ky69o/owiT+hIulpqKjfYxVzwd/vLRTCbxFomydRkB4u0dZFdpbZ5s7oBAhLpM/Xz3qWKKyZ+iLKh42SWCgoHA5i6lWOCgXFf9uixh5XUOD9pbgfWMm587BvOAk2rCfDnI2rcnCMrc6l1adgGYMKGC0e+//KvskN38uKtyzAPo/LQbYwMNxtRA=;
	5:WcNZg8mk1jljTZVuzy2HEBSUBqi+UlI3ybaLmWjeqvGxYJQe7Djt2sqV5FOFfcmM87cpO5CgT78H6caLQ2YCxsKcpj/RwZpF86Shh3YB4XusO7EB1rl5gM5es7xKjyXjeKoLCRQD7r2Qt35wfS8Xo8hWMjbn2oxNW6VuU7ZH6Xw=;
	24:gSzyEAKZTjBhn6/OWDTLlPwQ0SBASiTybbAyXfMb4372TgcrG0jfbvNaLkiEelZcuO7QgTi0bM84eCIKjkJ3nD8fzk8psq8q/qCYZa9rTKA=;
	7:pxo8IG6j/wPUf7unbxE+h/2rysO3gstN5IEnHtNGoCk1Ngd3TJCENYhcxdyukO+PLxSUssOpT3GnDXj/YwAhDs5BQO61xYswM0bCO89QnxMCsgZ+H7wB5WsElu5/mvEGyyLUrtFLiptGAfZgvS8vLVj/Nd9Q+2RIyOhtIGcPL0nSe5teqZ8cl8TDhk8yed1vqaJ+QIUHIzXovJ+XjFspRTlKdmKiACQH4VS31uf5QupgqBsPxP0muZIFdlEjMtl7
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2016 06:21:05.7782 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1308
Subject: [PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
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
X-List-Received-Date: Tue, 05 Jul 2016 08:54:00 -0000
Content-Type: text/plain

TCL_INCLUDE_SPEC -I+<includedir> and TCL_LIB_SPEC -L+${libdir} break
the cross-compile of packages which require tcl headers and libraries.

One example is that postgresql configure failed at the following error:
| checking for tcl.h... no
| configure: error: header file <tcl.h> is required for Tcl

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
index 46fc8a7..d75232b 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
@@ -56,8 +56,6 @@ do_install() {
 	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
 	sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
-	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
-	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
-- 
2.7.4


