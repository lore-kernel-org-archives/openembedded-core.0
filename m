Return-Path: <urs.fassler@bbv.ch>
X-Greylist: delayed 28849 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Aug 2018 07:42:19 UTC
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30079.outbound.protection.outlook.com [40.107.3.79])
	by mail.openembedded.org (Postfix) with ESMTP id 66BCF745D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 07:42:19 +0000 (UTC)
Received: from AM6PR03MB3832.eurprd03.prod.outlook.com (20.176.243.26) by
	AM6PR03MB3829.eurprd03.prod.outlook.com (20.176.243.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1038.23; Thu, 9 Aug 2018 06:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+B48E3xPEfYz6YDZMF8d6cBq7eSWg3ooQGvKkjXVF8c=;
	b=iDsXV8IfCdyUoaJRC9Lb3xNMUECcScImfrvq3W2l4Xzhi7LHpwBdhdjSUeOJJ1ogH4bdcsmdJPhh7jtB2KdMgsConr58lXsbDcqDeLtkqm9WQewXY3EpiwL3H9Afn+D/i5OKGh9M58xBoHpjuQ/5Ok4Q77kR7qy3qq4FWpGMJgU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
Received: from localhost.localdomain (83.173.245.202) by
	AM6PR03MB3832.eurprd03.prod.outlook.com (2603:10a6:20b:24::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1017.18; Wed, 8 Aug 2018 07:34:15 +0000
From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 09:33:52 +0200
Message-Id: <20180808073352.20891-1-urs.fassler@bbv.ch>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Originating-IP: [83.173.245.202]
X-ClientProxiedBy: AM3PR03CA0059.eurprd03.prod.outlook.com
	(2603:10a6:207:5::17) To AM6PR03MB3832.eurprd03.prod.outlook.com
	(2603:10a6:20b:24::26)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da53c27b-f11d-4264-7193-08d5fd015842
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR03MB3832; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR03MB3832;
	3:gTWkf3xoA7zbO+sZ2aywicorLmBxc6KGZ5xTp0c/r2tdSbuAd1gVaNHdbwWhe/ARbeekkG/XMgcbM+B+iIn40bslMgLApXKZUfYhBdHcoxEYWge4mVBhzu4DsvO6VHfq0C7jTLg/3/mFdGQDAmMMRKDYht66ZesodhTm8i2JbIYZKKhcj8LqwwSeEaRFqQRHU9NPcbqEHusfu3LNce+HgKkvoPfT3R3rHYUKJLhOLPz07sEZjjSh0eUEk7iOKNuA;
	25:A0A9HUMz3MJdi85ut8IV0cE0OpBlhz27c6zzjsfsTq9m+uOjTimzaamfb6OimZEsTKXT3Ad/tCWUQWTU0Rtx8CQhCJQgYlN0gS2IcjsijZdN82oGmM8PxvCdo/vuat+XPzpge/8w91Zl6f8gYkBG2LLFzIx2VRjsItjVdTMKw1cLl8mdWjnMaR59tQk9aAHOx04qVuONNFkKvEt/wUf7wNxY72DLUCbHgbkZcgyCRFX5gfFIPkFBaMufOrDXabw5EELyBUNqQ32/KsucKsMYwpqRUHunXwRenVanBdiYb9oPGkrhZVsmB6MSp758ve9SrxFIquiM+1a9PCviuEcwzw==;
	31:oLOs8ub/ZQPV4z9/d++2tAFR1nwhLV2bYOXXVSnBgZ9BMCdFvnSmxZc8A7vO14SPnlbat3NEPAB9swjCzpmnFzV/tOkG5iCt2ibJlE0fsV7x5hhzgLaUqh2ynhAi8F4zMWsDXxVUNp3ifVStrX4n97yN6y0tzoxoS5hH0Qhs2tDO6ICTowHYoQtzYj9nd8muZMa3GDq50jx+Wk28LsPhepNcDT4ds7GG1lCOI/DcxEc=
X-MS-TrafficTypeDiagnostic: AM6PR03MB3832:|AM6PR03MB3832:|AM6PR03MB3832:|AM6PR03MB3832:|AM6PR03MB3829:
X-Microsoft-Antispam-PRVS: <AM6PR03MB38322E4721DB852654BF8AE58F260@AM6PR03MB3832.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(181554191321653)(126837547833334)(5213294742642)(33711482430040);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231311)(944501410)(52105095)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:AM6PR03MB3832; BCL:0; PCL:0; RULEID:; SRVR:AM6PR03MB3832; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR03MB3832;
	4:kW9n2I/HEFByqBw6v/ZJ1VIgbLNnop4YChBA8GNgqiN5GXRLuntr+mDFWoPuOXfSZ5EOtaRO4OmwDItZkO6UYShlFllqjIsvhCKv+dsxuUw/ZBhSg/Wh0FrFr1P8oEHctH+SEbCMZth2es/I1q2q88vnmanepiRNwQ7tSOh12RHoIH/8pOERm87O8E86qDDL5eBK1Q0JHnpgrGSFbSV9bwB5qujUZZlHg7W33KS8B+jHXrWBHvqeR+LWJFW89YrBJP/1t/oFlX3XG4OSMCOVaZdZFfFWMw8vRQrn2p7uABxY5q26sJIgUyD+gEzer4TmbNI+597lY1nj6jAXrKVAFcFjFWWFYXtZZTsZfxF+tb1mu2BDPTmb6bYdg9uqdbeshvuVAyqdBd7RgMs4Avvka4jc7qUHEsvyj/k+v8yb9qo=
X-Forefront-PRVS: 07584EDBCD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6069001)(376002)(366004)(136003)(346002)(39830400003)(396003)(199004)(189003)(6512007)(316002)(53936002)(54906003)(2351001)(26005)(16526019)(8676002)(105586002)(81156014)(6486002)(81166006)(186003)(52116002)(2361001)(6666003)(23676004)(106356001)(7736002)(25786009)(6916009)(47776003)(66066001)(6506007)(386003)(305945005)(4326008)(6116002)(74482002)(33896004)(3846002)(97736004)(956004)(5660300001)(2616005)(478600001)(476003)(68736007)(86362001)(2906002)(575784001)(2870700001)(486006)(36756003)(50466002)(50226002)(8936002)(1076002)(1857600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB3832;
	H:localhost.localdomain; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTZQUjAzTUIzODMyOzIzOnNIQVBDTTJVdGxWV3RQWWZXRHg2V2x3TEk5?=
	=?utf-8?B?cFN3VUVtNmFCT20zT2RkaWxWbkVidE0xeTkrdGlWaS9TbHpsUHR0cTlsTHdG?=
	=?utf-8?B?TEROSjlQY0NOTFFFUnp3TkJ1TUk0R1J4K2VzMHZ1eG11WlltWmY2bCt6MGoz?=
	=?utf-8?B?TFdWczlaVk5Ka0FQcnB1bUw3VlVyYlRFN3lwNUdiYVlHSndsUGIwY3o4c3hz?=
	=?utf-8?B?Vit6YU5qejZtRGQvbG5IWXhGbWxCOEhZbmowa3lTOU1lVXg2Y09rT3BKT1pW?=
	=?utf-8?B?dlZYV3VDMHAxOFIvR2ZGTDQyMHVnQXBqQ1N4enBTNTZ1UmpJR2RvTTFzbXRJ?=
	=?utf-8?B?d0N2NmNqVHJqMGFneE1WMEVncmdHK25SdFdkRW5XNU1idXBYbkx3QWVnTGFB?=
	=?utf-8?B?SGlrMkUvVTlxWU9FZVJudXJWaHpHYmo4SUNhY21PT3NTMTBBU3JDcU55Q2Vy?=
	=?utf-8?B?aGV5ek92VDV5YnIwa1J6L0gzb0E1ak43SFJQaUc0U0FtUW5nMXU2dWU4NGpr?=
	=?utf-8?B?TktBbkN0NVp6bEpVbDNMK01ZL0FjYlU4N1VxazJXNk5tNGZheStTbHZXMHR1?=
	=?utf-8?B?WUFoM3hMY3JsMXFsWnlMR2VESUxJaFVzczl1QXlPMGF1WUpFaFA0cmw2T2Fm?=
	=?utf-8?B?OXZwUFdFWDJoT2YrcHlNaEN6NUFxZkpZbmdKaFRERmU0WTVmSTZ4VE1MclBL?=
	=?utf-8?B?M3NiSXM5ZkRBK2NnQ2hNdFZSbjU4TEFFc2tlTENMUktEVW1PRjJVYkl6NmFU?=
	=?utf-8?B?SEdyTzEzVEtWYzlGamVacVhtdVF0QlJGNEtaYUJvU1Z0VDhrbmFPaG4wblpt?=
	=?utf-8?B?Y3UrVGhuc1o1UzRTYTlxSktqRE9QVXlsdDA2Yk0rTEYrQ2VIc0tNWnZqTGtK?=
	=?utf-8?B?bTBVdmg0TURNMlpZNm5lZUtOWFg2NVhXb0YvREcyMXdnQ3IxRmMzNFFQV01q?=
	=?utf-8?B?VGhRRmRuMFRYR0FtMS9FQ3VNYzJYdWpmU3JyajExUlhlb1dTSnhSQ3FQdm4x?=
	=?utf-8?B?dEFYTUU4cHp3blBYVUJjZGI5VGdBMk9BSDhYWDFzV1grLzBicmtpWEx2UkFt?=
	=?utf-8?B?VDNVTXQzY2J3QVdmWUwwLzRGVmhlT2FxejB3TDJjaWdqOVltSjIycGpYQW5G?=
	=?utf-8?B?Sm8yZi9GM3NwUGZGc0NMODdZbllVSTgvUFFnSkRMNWZMK0Y4eXJsV0NIQ0hk?=
	=?utf-8?B?bzgzY05iU1JGV1JjeHV1YzVJVDdRMk9HM1RFck1BdXBHRmJiNjVuNkZHSkhR?=
	=?utf-8?B?MXN3V3o4dU5qNitrdktKdlYyWFY1TUQ3R1l1cndkU09vY0w3UEhzTFN1SGFa?=
	=?utf-8?B?bnQvcnhOS0JLZzhVcnhRRHVzUXlrcnhzc2NpcGVGUVUram1QRmR0UkdQMGtP?=
	=?utf-8?B?WnJRTFNhUVYzWGtOdXcrK2JDaVhpcjlmSEdzMmdkZjdZVEhPc2NXL2FQNEdK?=
	=?utf-8?B?amc5ZmJSUFJ0YXUzM1ExQzVFUW5USVFTVzg5clV1dHlQdStxME0wemNXbjVh?=
	=?utf-8?B?cnhJMnJhNjdQQml2TjhlQStvYng0cW5FTklRRXlGSGt2YkRDRjV5K050MDM4?=
	=?utf-8?B?UkU5WDVMR05HWGxWSkhDMS81Uk1iYWxIdE9VWlpIZThWM29wUnM4U09LZ01N?=
	=?utf-8?B?ZWUzakQxSm0zcTFMUDY1ZFB0VXZuY0tYUXE3SkVaSXUrajFsUHpuSXgvbHYy?=
	=?utf-8?B?ODY1anlHdFNQL2ZzYWkyK3owQzkzU0dWWk1ONURXQ1R3Q0hzLzQ3a3RlTDBW?=
	=?utf-8?B?aS9MR1NGVFFDbUd6dTlLZz09?=
X-Microsoft-Antispam-Message-Info: KWblDhd/wOqlsx26b+xyOboS/TpSTaCfqX4u7gwhoDdTRpO+b/OhaqL1ULm9J4Ee1sRbwJC8NWeUjgLM/55lIfirmN/e0g/+e+oEoETaZIlv/JJuJNXBv+1wKhwS8Jg9UnvARQO/sLjbPWenCWe3in8R0+YL/Ud6K5ZRsTTGW6Eb7Mk4pN1XtZZSdyS7aDqLx/Rhe4+uMvz73nw1BNPoLntc1kovTpHPwHwesTJN1139aSgss9GHVMasikK8mMGMmrTML7FWDNwlpvtT6y2dM34/GQxKXrH6dAxGspxBGEkF+Yo6WUJzCiO9oW3BidhKKJi91EeZ1SYC6xA8uPXAh/YKiI3WDeSyMviHn/6bSb8=
X-Microsoft-Exchange-Diagnostics: 1; AM6PR03MB3832;
	6:Lql7swAM6elmbX3w9E6eZFYJ/BqFrW9RqxDnBMVO1BB2K+4/ZrS6W6uGMORfbBLeXcWmqrpaIIlOcHPUE7r1V32rtFGyKXFLy/GJVvSD7ZS2WaVzt+FXAJ5Dyc481S0pR3hJEbgLezwI2M6falqsRUZOVrdLodxuP8Z56y+oSwH0rjd8FInqk9VuygEDKRfr/z95rJ3pxcsGlBilkMnKkhl7A2EkYF1KkPVshHYZuEwi/WeTh+r19CbZFvQDQstb3k43MGCV9WYgJYJ5Ws2iDhU46eIIe2Pi5yYitDggKx3IhA78z9txYKC65Mgfm58jVOPjlYzY1qTdZr+iNNK9yJGnv8Z9rug4oF/WdNGpjouqyvZwS19NV/Or4XDE5W/bq/+0X22nd2PNti1GdOmrsDfNeOhTMLWrUmnAjO89yJ49A/UpokoD+fZTj15/lpB9Zl4kGRuZC8Fs2Ce4VkhvtQ==;
	5:gg4PaI7YK3YwO7vkQ+J/65ShzkAaYz2uTaQaTdcP8ljTAgCuHe6GL7ff37BhKjEUmsMHW+rO6lZM59oana5uTBYqAkEQ08sOhAUi3UEnSD42PkOO8jpZWsXTRs6YjI0c0bnu0Tu2+SVN02nvl39t8nQMfHpCbOv1p/prcl3MHQQ=;
	7:S5Zk9zw3HXk9exZExqfEBs+k25gPecDmM81RdALruDyBWi1w/LSTpZ6kX1Dgx24kAgpMjgeg19MbK2toNYNt2T7l/q1VteK52qlwSPV34V4ZzUpijx+NcBQkWetUm5MaVjcD2SkNHt1qULkxy2D24AcPp3X89dRTOLQCu3XIAdiLhM8iyC8bXa0uK8QQjXzGQccB2W8//p1tf9rTeYwkRw6zWaNAZMRmDcnpAHy9ZuJRIRSyRpHYQG8+NvZxH3d1
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2018 07:34:15.9087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da53c27b-f11d-4264-7193-08d5fd015842
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 279985bd-2077-4d9d-9797-42238cfc06e2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3832
X-Microsoft-Exchange-Diagnostics: 1; AM6PR03MB3832;
	23:NqertMJCIhaQ4d9/EhOeZdiLW377e2538jK7UX3woqncfRHblrFx8CxZEWZn3J+QwTeRmogWOTWH9eAE3K9pZ6HDRPNtzOFTOiS3nA2N9PlBUcDG/XHgDdSkNMHpdRdhldk3zYcjIpxH8oEaF0WLzA==;
	23:cPSdyn/0+y18a/jGLohjxaASmJWDuL3CEDGrOgJ7lIoOsY9ipHAshWZIib7VXzU2yP/bUZFx2e8DistMt/Ph24C6SUl/W3lK0IQJSU2iQ3HZzeudKY/gAyWhXbRCkGILay7DGNvzIfX6S+xviuslaQ==
X-Microsoft-Exchange-Diagnostics: 1; AM6PR03MB3829;
	23:2qcmRaY0j8a/R2pv4X3B1DOYLDpqEiULrEtw3d/ng8q1jKg/xlgAvsYD+JAl/O4aCLyKeyq4aMAbopzJIFEOSFhzYqZjwmFVZ7cPN/3gQYQKvQn5E1ul37jLkJdNeymjKCqKhLu06UHJGDeELGqTyA==
X-OriginatorOrg: bbv.ch
Subject: [PATCH] cmake: fix compiling some C++ projects with Yocto SDK and GCC
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
X-List-Received-Date: Thu, 09 Aug 2018 07:42:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting CMAKE_SYSROOT in the toolchain file allows CMake to correctly
remove user-provided system include directories pointing to
<sysroot>/usr/include. The mentioned projects failed with "stdlib.h:
No such file or directory #include_next <stdlib.h>".

Signed-off-by: Urs Fässler <urs.fassler@bbv.ch>
Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index d52c29e5a1..8a0fb4cb12 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -3,6 +3,7 @@ set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
 set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
+set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
 
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT} )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
-- 
2.18.0


