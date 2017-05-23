Return-Path: <carol.zhu@nxp.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0064.outbound.protection.outlook.com [104.47.42.64])
	by mail.openembedded.org (Postfix) with ESMTP id 3628271D97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:24:22 +0000 (UTC)
Received: from MWHPR03CA0016.namprd03.prod.outlook.com (10.175.133.154) by
	BN1PR03MB172.namprd03.prod.outlook.com (10.255.200.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 14:09:43 +0000
Received: from BN1AFFO11FD015.protection.gbl (2a01:111:f400:7c10::148) by
	MWHPR03CA0016.outlook.office365.com (2603:10b6:300:117::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Tue, 23 May 2017 14:09:42 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD015.mail.protection.outlook.com (10.58.52.75) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 14:09:42 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4NE9YgU029059; Tue, 23 May 2017 07:09:40 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 22:08:04 +0800
Message-ID: <1495548488-12280-3-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400221828148580;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39840400002)(39860400002)(39380400002)(39850400002)(39450400003)(39400400002)(39410400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(47776003)(104016004)(54906002)(305945005)(77096006)(6306002)(105606002)(110136004)(5003940100001)(2351001)(8676002)(36756003)(189998001)(81166006)(356003)(230783001)(8656002)(53936002)(8936002)(5660300001)(50466002)(38730400002)(76176999)(48376002)(33646002)(85426001)(50226002)(4326008)(106466001)(575784001)(86362001)(6666003)(6916009)(2906002)(2950100002)(498600001)(50986999);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB172;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD015;
	1:vaxugUN/dzyArxvw4HQs8GSDXO6MQN6bJHDeOrHOiu2GGuCoPqONUf7x7ekHRk6bvg3GwcY4H6fKqt+32wLpHfOBVJC2lTuQo3+GddELFoG+57UzD6uIMkeF5tYeUcmRpraiS2tEAkerSehgMU4JKHPPQHXXmOAfxMVH1jX6B7HqEutWmuVw4xYLKfn3HSeQAMC3ElZxBoxYDtD6kdfGTPmuoVzFF7RQSVYkbfkmgkaHecaFirDgxKQ/pXv/1stH86tH0M9AC/JPY0F5CJgJD2JT48Moy5MR9WuqQpvyhe0EkNiFNEQW1CS3fzQBO1e4Fi90fcz3s3FeHkXVVIym+jlGXy7s9tlX+RPdpXV7goZgnVdC4fmNqxgL99fqOCG6mRSkKPUblQrf71FIIjZcE00MG9AixShTDJ/CoZ+HEK+V/5UZXbJZHFntPcmXpn6qBDk0Q0RuNeSQcIqX8DazwHfNeLz3mM7wDjlgaDTv4RYmtlzwi/QdmUl1dyoKXIjBkGHyfu2rtbxGkWEQYEoRo0WG6OwHCOGSf8Nsh+s4Co1sp1gri7g7ip6havD0QCmTwHIe/ZpnTFFe/QYYhWY9EUV1CgCJhAXBw1tEQTYgKe036rhIoeohPEUG8figTFMG0jIrLaGl1MIYZNgnqEGJCqxEUvbQ/t6zlBNE++LC7IeOEsM/o7Ekw6rPfAPRz2q0lBevAFJWL6dWgmrN1VoL5eGYboLgrA0sREXL9nxY4PRC6a+UhZmF7GVwwhDtaAjQvlpJcm1FV4geptVKgvCZDg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PR03MB172:
X-MS-Office365-Filtering-Correlation-Id: 41a50438-11fb-4e7f-0c06-08d4a1e55bee
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BN1PR03MB172; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB172;
	3:3bkHfZH8DAaBV/Z/b8cT0OUPR8g2gzAW2b6GjU2WBWy9Fyyur8A9uuzZaQZjId3YPHi4EGGw9Vji3HvVxtYnnNpTVgPuXlJHjeg99BtO+XrCpHb93dSurImYglZ1TseCmqNNy2Bwu+WfF+dZ6DvEuJBzEChHaGPxPS8x58pdn6hFSoxCD5fvcZoCiPynCilHE3Q/OfHelkwQ5UnC9iZFg94A9raO8KZvEzStzBgDgw0P6OboTH63e6DXcb3RmIGC8djOLGiL3Hqh1RZZ6r5lr1qQBi8aAq8FjU3jZnrFsSW5RejWefWyJp5hf5UDD/J1LYgxQt6suSsLztwS031aeyzRnp1UVcLfd5NAacJOnN1js2faRWT4dOek8J70IUYp6MoUia3hBq05T4MSSzWRYeXMBdXjEBqErdrzo4J8AxONnxrEZ/GiIRHAiU7VPMu9;
	25:wERtjqD2Q5566nYkxA0PsBQhCdkCsX6gDIWgy0k3LS+nkTnT2jYt0IZi2Lq1BMKhNPOZAeps9nY/Gkz93LkL73yhoDvMPikNAD6QMSXL6NGbL0Vgf0u6Cd7bJrYF11n82fYrOPl5h4/gpdZ74cscNx0CQxu2iBb9PAG2GsjYcLvRWvc/iGSQKQhxakaJq3mVTD4zlSqpwDjmSyddXAJ1bSqbbMJ4Q2nU5rVXD8BoYc0l5UXXJjokzSWrQVvhGOFo3TRD2JpddvW8rG217pw2pvhOGvjM78dNXShb/YQXsQdx9XDe0CiUdT5LJqwHYfpjgixccgEIJE32TeIuKjWElo5PQXo/kPGt3sRSHGabdIYYiOETGanUgBUgK1b9HT7Jk23Qur0kAYzZSKoqHKZo3B+rBpiTLGQP7mxygSLUnmjXtk2L6MaS2ZIo6s27HKsmaQEUJgef0/UBwjqj29QGezCeJgUpBxbdgMhvI7jXhpI=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB172;
	31:RVAmUsmaBqlRI548RQEynZRtsW4AYw8Wf937M99DISDmsTtyvv1viUZmX+jC8Fne67j7CT2gKGenYngE+94dGD84UU+DsCq/ZgfO0UiLjqXFggAtgnWnrDnKctdHOvX1a6tTnQMrrmp4ZDsaqh9KtI2XJuZFnixHpDVUIApWKM1WaaFgV1lF2D4ooiB3jJfdxEdOiTQUnFuM92y8dD9Rfzs889NWnZC52iki4xDB6f8KSS7Tjgne6aNqfxoXLUuR09ytu1Wa7H5VtqbV6T8oAw==
X-Microsoft-Antispam-PRVS: <BN1PR03MB17293B729148CF47C2E71ADE9F90@BN1PR03MB172.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(131327999870524)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(8121501046)(13024025)(13018025)(13015025)(5005006)(13017025)(13023025)(10201501046)(93006095)(93001095)(3002001)(6055026)(6096035)(201703131430075)(201703131441075)(201703131448075)(201703131433075)(201703161259150)(20161123563025)(20161123561025)(20161123565025)(20161123559100)(20161123556025);
	SRVR:BN1PR03MB172; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN1PR03MB172; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB172;
	4:Y1NcMWZNlr6JzrWHlEV2Ltd5Q1rHGLjwiaTVs1UzN0w?=
	=?us-ascii?Q?CaOyiKlz2EbIkMTnsymdWdE2ntGErPYXGtUns5myBhx1WyDJZxYzJG1gyO6C?=
	=?us-ascii?Q?LxkAkCBKRZHlkaqkEQgJ+LK+By6ewAsDk5LiMOzRbPaslgdChSqWHcd2sP8i?=
	=?us-ascii?Q?krzNcoe+Am/cciO52a8IcRJ95tn89xtZffsBNIlYajUrPmOTVaB13VfWLYRg?=
	=?us-ascii?Q?NE9HRLoIKQ9vx+eLKM2NFFrXckHzsqrcgmF0wRYy7z32IFOjq+44PlxcOh8I?=
	=?us-ascii?Q?sFAl4pVt9QyP01y7WrBnmF/JQ0QxBawl9IeRitwUxt2MHnkkv0ia4pgGo2mK?=
	=?us-ascii?Q?kUpJ2TuIAVPR8CJmfqmt2ypS8Wev7VcRRQ1Y9zCqHebs8m+bvLL0HwuwTKv1?=
	=?us-ascii?Q?Cr9Yqq+PCbVd0qOjUBYXU8yo+oO4FY3vrScRraVsIn8pivcyfxKmDqwWqD2G?=
	=?us-ascii?Q?IViEqA1d4eUkIVKpJZmm9HReG1fW9zaHhXX+jZOOO1Wio1T5pS/BlgJdMVSB?=
	=?us-ascii?Q?HYor/3+TUoB6l7ZuemkRTQcCceBihEhiSLbE+H5rrdL8Xf+6iYoe5FHUfinz?=
	=?us-ascii?Q?uN5drazCT+QaSioiD4SGZnb5PkZBfZSXZr04lELSegqgCePxPCPFnwBgfWpm?=
	=?us-ascii?Q?q/G59OiOjS6bJHgfaBaKIv41MGfmpDkt90p+2MIcIWiYnAknwGikwajjwAY+?=
	=?us-ascii?Q?VDQY+o9DOdT4EQm9baMLGX7wei9jIUZ6261c6H6kug/tqVCXRGm/MIZrG+by?=
	=?us-ascii?Q?Lx7/ovoYH1ERIel85yjgF6ORZKWELAbOCb04QeY1KZO9FTUg3DIO8mPMLcDo?=
	=?us-ascii?Q?vE1oPEcwf2J86DcychC7+JdvxMupf2K0D+rTmSW6s4JnIO3331Q9OR5x9j6h?=
	=?us-ascii?Q?Celq0i9oqXWIMXhyyTPrWj+zqinJUE+gaohf0VcvtAGamBdDPlj312zZ1TER?=
	=?us-ascii?Q?38ol2V41LZ/cnbwADCxGopPqDLQVa1XESBW0WXktxtGprMVjWE/83XBpAo1Y?=
	=?us-ascii?Q?=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB172;
	23:I3yrlR+asRMRE4+U/hytXPWzYS9F7LBNSph/chYviR?=
	=?us-ascii?Q?Sa/rxEDBxVYJOLlEMWuAwTqy6ohYH+C/qeT/2nLjcwf3cVWBX2pCMhFqEmrC?=
	=?us-ascii?Q?FpQDkutWrvnO+bE9RSEyCdO42oNzW0w0DIojM20h5jU/rAGWVjyko8/ETnU4?=
	=?us-ascii?Q?8H7hZOUwdtV0h3/wNDtrI5l1GmBxgsP9Wm/N+XfWnUoneV5zSBIxxh/rqYDl?=
	=?us-ascii?Q?/QAPcW+Uj+wG3V+tBf8QV6lr9+Pls+nQlty0XvrBsKlltnBnngFIfmctEdna?=
	=?us-ascii?Q?Kl6HUTzT/iL1O5qsq7W3R/wr7ULqcZ62rpQf14gZzzv77vTHtN+SlzEXRuHa?=
	=?us-ascii?Q?fyVVUMR9j4id8yejh5KMbYtlTj9L6dB0lGTxwL3LOQdgm0HCNqNXsglJOQoL?=
	=?us-ascii?Q?nnF3Uv3KTc0+gOxaXUWlBXgHK2K030/zLC02VDcNJEl0ZLzng5B5gDOp0tq2?=
	=?us-ascii?Q?gG58hAIT5C9C90IUqLLSQrzJxFN0odXCqiO+9m3Xy++4ImKiOksZ87X6+iJ4?=
	=?us-ascii?Q?QqoknIjR3sTGgkUOcvY3eGm1O+UtyWpb965kaQlNP9SM6N94NbO1Fy7yqh8p?=
	=?us-ascii?Q?k4Qc39g7AJLHFu5CDbeHUVxnedKWsaXBVTZyaruWmJ+nU5R42QSTD6Aq7seb?=
	=?us-ascii?Q?07LTMqdtR+kYGokTgBNu5puLvhfDbllXS0t0W/DnC53N2u3uNHSnwabfHae0?=
	=?us-ascii?Q?xxOX/2nc7nx5M1yfMOlgDgiVluqgPFMRCUsM5vwI7AxhjYBHKYRUfsa6hTJZ?=
	=?us-ascii?Q?exnCZSxHgvyyqYEEeNUKbl/aL+jI24UgHGKYAazU2r8QkdrQON1Lxy7tm4wN?=
	=?us-ascii?Q?c7JuXFgXowegCRfX/LCJ0x6Qqs5K0oHCrcoqDkA0XKKr/+Vo9Gg3XG0e3SIm?=
	=?us-ascii?Q?XFUTsbSSgVoLl5NwTReDW3etb90xJ8tA6xrPDzKicXXPFjXiM8Y6N8Kufjpt?=
	=?us-ascii?Q?EnefJpSn2Lt/ZtQnRFp5MEVyZHeLPL0W2ggJuopzhx5ErkKXjz53X2F8mHYS?=
	=?us-ascii?Q?+R4LSIH2kcQzK1oDrh2+OJL7Sv8Po6Ebr4NwWtuLKVOmBuS7JYt9QU2QK/Ya?=
	=?us-ascii?Q?hfTR/+5fspfK9v37a8UbBYqKtu6On5DJir3f/h5yKRd1SwI2XwBi8g4Hcc6L?=
	=?us-ascii?Q?DVfQVvrJTZFIbpwi1oaLCvk+O6+Le3akXMyU4Z5XfYX8uFlO7AsPQnodpNGx?=
	=?us-ascii?Q?4cxF8mU9KTLp7FmowfmOtBUJQBf3ozyFRFvC7yRw9nyqVCFdKWxaQtpUrOKP?=
	=?us-ascii?Q?TL8dlvf7Ow8SC/Qym4GulYYp5Dmg9bJINvAUCepKg8NWAvdpb6RORkLBpi6h?=
	=?us-ascii?Q?x3uCPVpHiFJsxF4NgeIuI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB172;
	6:yqPfgAbjVgScIGPLFTKE4ebHhWB2khk76TxjCsVbcvOyepMW7nLnFxJlXDTe2Nvt+zgYQgYuvINb6TxrS+2F8VQcdEcicxy3BvAxrkwSo6LzGp14oUBBtHaSUfHi5Odqi/o12wVqzD5X8rIalkCocHo31YDIwRHAXdv7CRx1MK62ftiXP16xdtZzy461bDbzoqkXrHCErpQMfkhakgjyJUE2xRIL78TXMEz8gPGPe1HM1hF+0OlfeipBPscB4/cP040Wd506cFUkllzWfDWwcg/owLfpvi0nQTMWCT8cf3OaMTPqlr0NIGyIaMBtSdgOAKjZFz7tOMkhBQYDtseqfJFaXatRBViCcxAtl2mcGhVUu6vT7N3wdDu8I4cSEJ1CoqWB240pqT5CjVkCmzh/oyWh1MQcM18WGK4XyoX2ebu2e/U8fc8C0uApEPUSV/NofS5WSSqJoYc1OLV8/kpHm2brp+3X93xe+7bN5rjNCCSHsOB2t6UzJP9j0NSUSP7knTN/LJgPDGDKwy4BdtsOig==;
	5:Cy7o/4lR0DjhYfHjBaQnD8GTlu6fJuH54gF7NuaUg8B6k0Zmil6B22duwZXHIfKyq7EbvLROVNhmJ2zzxQACedYdJo+e5Vo6J001Y45T+7RsIF3TIXvcTrUfDXuiApiVlyJdacRcILv/UK4Jo9QZJ73j1rhk8uO8crW3y29Y8OqA3ekmcqnuvir+OnESD1y6;
	24:zTjHbEKOhfesWAshC4zfARbwvyk/s44Ctw5ClrtrB0FNSJVWlBDI+1DG4Agi8DmKfjczZ3GneH5j8okWCmsuiyccjHEi1C0qmj8q/HUZqKU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB172;
	7:OxADwmTxoFgx53FIl9NFL+KegscaBS9+dhIPOJrLEOzXC5okJLfibxqwSq94xRJXMB2KgPkHpsq1LgS+X9+k21B8MKg648e05vesKvPtRxE5C3bz+MhD3k3INv3m95il/SfL5/c2+W90qjq6gzoCT9J9sj+5TohYdAjvR383f2XZWQ40w5nxDdHxzDCdNKliX6fOO7VQlG7I6OMqeSAW0MxcwiujYvNqJRkX+uZOTK4VN6blzOytaumOhTGq+pSXk/5QGJEH/OSiSmzP/QrPY0enMTcNC/Rp6NpKX4CZvBJZPQGK0oPiL2bg/pGAzJFmnn5AYsPWhBwk5+ppQHS17w==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 14:09:42.6432 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR03MB172
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [pyro][PATCH 2/6] gstreamer1.0-plugins-bad: Add configuration for enabling accurate seeks
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
X-List-Received-Date: Tue, 23 May 2017 14:24:23 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...configuration-for-enabling-accurate-seeks.patch | 148 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 149 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
new file mode 100755
index 0000000..46d602c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
@@ -0,0 +1,148 @@
+From 698fbfbf955af2fb9b79f9e6e8091b8750c886c4 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Wed, 26 Oct 2016 16:28:10 +0800
+Subject: [PATCH 1/5] player: Add configuration for enabling accurate seeks
+
+Upstream-Status: Backport [1.11.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=773521
+
+---
+ docs/libs/gst-plugins-bad-libs-sections.txt |  3 ++
+ gst-libs/gst/player/gstplayer.c             | 60 +++++++++++++++++++++++++++++
+ gst-libs/gst/player/gstplayer.h             |  3 ++
+ 3 files changed, 66 insertions(+)
+
+diff --git a/docs/libs/gst-plugins-bad-libs-sections.txt b/docs/libs/gst-plugins-bad-libs-sections.txt
+index dbab6f7..77092f9 100644
+--- a/docs/libs/gst-plugins-bad-libs-sections.txt
++++ b/docs/libs/gst-plugins-bad-libs-sections.txt
+@@ -1953,6 +1953,9 @@ gst_player_config_get_position_update_interval
+ gst_player_config_set_user_agent
+ gst_player_config_get_user_agent
+ 
++gst_player_config_set_seek_accurate
++gst_player_config_get_seek_accurate
++
+ <SUBSECTION Standard>
+ GST_IS_PLAYER
+ GST_IS_PLAYER_CLASS
+diff --git a/gst-libs/gst/player/gstplayer.c b/gst-libs/gst/player/gstplayer.c
+index 313bca5..d9ff524 100644
+--- a/gst-libs/gst/player/gstplayer.c
++++ b/gst-libs/gst/player/gstplayer.c
+@@ -85,6 +85,7 @@ typedef enum
+ {
+   CONFIG_QUARK_USER_AGENT = 0,
+   CONFIG_QUARK_POSITION_INTERVAL_UPDATE,
++  CONFIG_QUARK_ACCURATE_SEEK,
+ 
+   CONFIG_QUARK_MAX
+ } ConfigQuarkId;
+@@ -92,6 +93,7 @@ typedef enum
+ static const gchar *_config_quark_strings[] = {
+   "user-agent",
+   "position-interval-update",
++  "accurate-seek",
+ };
+ 
+ GQuark _config_quark_table[CONFIG_QUARK_MAX];
+@@ -266,6 +268,7 @@ gst_player_init (GstPlayer * self)
+   /* *INDENT-OFF* */
+   self->config = gst_structure_new_id (QUARK_CONFIG,
+       CONFIG_QUARK (POSITION_INTERVAL_UPDATE), G_TYPE_UINT, DEFAULT_POSITION_UPDATE_INTERVAL_MS,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, FALSE,
+       NULL);
+   /* *INDENT-ON* */
+ 
+@@ -2967,6 +2970,7 @@ gst_player_seek_internal_locked (GstPlayer * self)
+   GstStateChangeReturn state_ret;
+   GstEvent *s_event;
+   GstSeekFlags flags = 0;
++  gboolean accurate = FALSE;
+ 
+   if (self->seek_source) {
+     g_source_destroy (self->seek_source);
+@@ -3002,6 +3006,14 @@ gst_player_seek_internal_locked (GstPlayer * self)
+ 
+   flags |= GST_SEEK_FLAG_FLUSH;
+ 
++  accurate = gst_player_config_get_seek_accurate (self->config);
++
++  if (accurate) {
++    flags |= GST_SEEK_FLAG_ACCURATE;
++  } else {
++    flags &= ~GST_SEEK_FLAG_ACCURATE;
++  }
++
+   if (rate != 1.0) {
+     flags |= GST_SEEK_FLAG_TRICKMODE;
+   }
+@@ -4199,3 +4211,51 @@ gst_player_config_get_position_update_interval (const GstStructure * config)
+ 
+   return interval;
+ }
++
++/**
++ * gst_player_config_set_seek_accurate:
++ * @player: #GstPlayer instance
++ * @accurate: accurate seek or not
++ *
++ * Enable or disable accurate seeking. When enabled, elements will try harder
++ * to seek as accurately as possible to the requested seek position. Generally
++ * it will be slower especially for formats that don't have any indexes or
++ * timestamp markers in the stream.
++ *
++ * If accurate seeking is disabled, elements will seek as close as the request
++ * position without slowing down seeking too much.
++ *
++ * Accurate seeking is disabled by default.
++ *
++ * Since: 1.12
++ */
++void
++gst_player_config_set_seek_accurate (GstPlayer * self, gboolean accurate)
++{
++  GstStructure *config = self->config;
++  g_return_if_fail (config != NULL);
++
++  gst_structure_id_set (config,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, accurate, NULL);
++}
++
++/**
++ * gst_player_config_get_seek_accurate:
++ * @config: a #GstPlayer configuration
++ *
++ * Returns: %TRUE if accurate seeking is enabled
++ *
++ * Since 1.12
++ */
++gboolean
++gst_player_config_get_seek_accurate (const GstStructure * config)
++{
++  gboolean accurate = FALSE;
++
++  g_return_val_if_fail (config != NULL, FALSE);
++
++  gst_structure_id_get (config,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, &accurate, NULL);
++
++  return accurate;
++}
+diff --git a/gst-libs/gst/player/gstplayer.h b/gst-libs/gst/player/gstplayer.h
+index 0ac66be..8426be5 100644
+--- a/gst-libs/gst/player/gstplayer.h
++++ b/gst-libs/gst/player/gstplayer.h
+@@ -202,6 +202,9 @@ void           gst_player_config_set_position_update_interval  (GstStructure * c
+                                                                 guint          interval);
+ guint          gst_player_config_get_position_update_interval  (const GstStructure * config);
+ 
++void           gst_player_config_set_seek_accurate (GstPlayer * player, gboolean accurate);
++gboolean       gst_player_config_get_seek_accurate (const GstStructure * config);
++
+ G_END_DECLS
+ 
+ #endif /* __GST_PLAYER_H__ */
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index a5fc913..6655a86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
+    file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


