Return-Path: <Martin.Hundeboll@prevas.se>
X-Greylist: delayed 21413 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Feb 2018 03:10:25 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0137.outbound.protection.outlook.com [104.47.1.137])
	by mail.openembedded.org (Postfix) with ESMTP id D16D177FF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=57UeLjff9WwpZ8kuNW5loa3eCafdh7Obc4EvwQFl+wU=;
	b=FNWXIcmXkfHevF5soUAqfOwXjEs4D8Dem74EmU8m8yiofDUEcwV2w0i2YMSmTc4vLZBYZ9KUAtlzsD7uvuO8bvGK1Uipz83RKq2fslNpv+qNrz2qBjT9qBDHzw8kYeN/icCjTym9NuNP9uvAUOq6+t/0FjKWrQra65tf8fUvaXE=
Received: from mnhu.prevas.se (81.216.59.226) by
	VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM (2a01:111:e400:c54a::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.527.15;
	Thu, 22 Feb 2018 13:40:44 +0000
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 14:40:35 +0100
Message-Id: <20180222134035.27833-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <CAJTo0LaHEzyaQJQzqK+cxPBqrXMqcJ+YO=DS17Yrp8w-jN6-aQ@mail.gmail.com>
References: <CAJTo0LaHEzyaQJQzqK+cxPBqrXMqcJ+YO=DS17Yrp8w-jN6-aQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: HE1PR05CA0193.eurprd05.prod.outlook.com
	(2603:10a6:3:f9::17) To VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM
	(2a01:111:e400:c54a::23)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ba3eff7-91e7-4e63-67ed-08d579f9df6f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:VI1PR10MB0125; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	3:+dPOlXBSpqRd6LjZaj5GVxIFSDf/bXqAHdLLlKqOUAdNjmsqFTooKgjst4lSdIu8JcwKlcQ5u+AU4COjJ6FrdoNfj58Nf4UJN4fSiwg0otckjoEUX30qw1Jl6v4hiwupLDvY0QmC5Yt1+EX5rx5pb+639zv/byLswIBLJnaL9480jt/WlEBfpkO2crEHehVUI15oOV4+gTvAPtb3Wq1CIn/cOtrZ28OvQ2Oj4i6+uiEMU2N+/zWfPccR16yiA9w5;
	25:xGxuEAEga9dpAVeuhGbhbA2lJgQQU5Uj4V+cI6WNRUJ7fSdarNEqdJIuVFOu3mC7QjFNQyANRIiZolJg0F/6BsrEKucB+ns9gLDMZKSz2Y8ZPtZeraQbGZzmlx+rj7NRcxh0YlbL0qp2awsVwFCdD8QsduBt331uEAh9F3Jo6tBx4MtpsjYXWRjvnXM8U+GfXVapmadIMEmfAvW40e7Sb0oLlEnQwJNFlWEgAgVKUS1N1yBL1btsrloOxTkre69sE+aAFHTtO0qbCgt7QxUovSNPOzRAQeavoSJQ5hNS2EdJYGtEDu6ppn2lmyRNA/vkMxCZ79BCPvhYOwkp5d1eMA==;
	31:tM1m05KXQwkxX0mg5+UTAsHNEBE8E1ovaHGXA8+8IuBxErx6rsFj/yxOSLd+7X32ivADua7QtmWw+O/gaiS/FV1Y1sii5XP9ne3BlcpQ3ahWpQ6wml6qF1y6pEuJ3qHCYoe4+Hk5kMNmDsXLfc11qmHJ7Rc0lHjUa3xfjlVArmrRnKVhAzmY1YKlkJSWYkeH7mPJUr6wuhA4ngwxOqZvTnHgo3LkWS6wZeSF8f+cY8M=
X-MS-TrafficTypeDiagnostic: VI1PR10MB0125:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
X-Microsoft-Antispam-PRVS: <VI1PR10MB0125DACC6B88E1C0003D600E9DCD0@VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(3231162)(944501161)(52105095)(6041288)(20161123564045)(2016111802025)(20161123560045)(20161123562045)(20161123558120)(6043046)(6072148)(201708071742011);
	SRVR:VI1PR10MB0125; BCL:0; PCL:0; RULEID:; SRVR:VI1PR10MB0125; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	4:E5iqgZ1VaBg53QS0LwfVJktyk2ktjobKEa836OzJje5NpgKujUlIRDLNAO9Om4Xn0udmIesUoRQrho41MT9RyX+TLRNd0uQuTDbJSEQxZ5RFrM86L/oUW2XWEBVZqQTjp92gxUn2XGfhTL/5G4H05GoMwKNZTE7VCCDhtWg02vx76ERrH4gHWg5lZZjmfW4XqnDhlqVhxC/hr2R2CxUE1t1sqVMcASk+Qt0Chhr46Xg1VZsDvwN49JTChEvvP+MgMF0157Dzjb19GzVzDl7pdw==
X-Forefront-PRVS: 059185FE08
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(366004)(346002)(396003)(39840400004)(376002)(39380400002)(189003)(199004)(8936002)(53936002)(4326008)(478600001)(50226002)(305945005)(36756003)(7736002)(2906002)(69596002)(2870700001)(54906003)(6512007)(316002)(5660300001)(6486002)(25786009)(53416004)(47776003)(76176011)(6506007)(106356001)(6116002)(1076002)(3846002)(26005)(16526019)(386003)(8676002)(52116002)(186003)(81166006)(81156014)(97736004)(74482002)(66066001)(2950100002)(42882006)(8976002)(59450400001)(68736007)(6666003)(23676004)(6916009)(72206003)(105586002)(50466002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0125; H:mnhu.prevas.se;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjEwTUIwMTI1OzIzOllYTWxpSjZTR0dmS2QrSEd2cFI3U0FXWldN?=
	=?utf-8?B?NkFZRGxCNGY0LzNWR1JQaWwxZ3FYMGpMWUg5bmpaaHkyWEpmZ0NuVzF4ZEg2?=
	=?utf-8?B?OU5LaERHU2hLakN6SFRJdWxDMkJkdGJRUWpaL0VBR1J1VHpMdUJCYlg3Mmt3?=
	=?utf-8?B?aGt3ZmFZR3hObWRGSWtFRitHOC9qeUNiVStrTXJleHJ2VDloUzViN2hQbjFM?=
	=?utf-8?B?cTdON0IrcngyYlpOdVZoSnJWVC94VmI4MVI1Wi90WUNVT0NiSWgxUzVwK0do?=
	=?utf-8?B?MEFHTHRlZkJmUEZTTllXc0hUTXZhUFBrcGRvZ3lSL2JnWUxvOEllN0VGTzBW?=
	=?utf-8?B?QXZTZDRINXFhY2lwMnBPMDF2MkJxQXcrKzNRVmsvYlhQR3RXM0NCajZRZVFx?=
	=?utf-8?B?ZFhjUlVaMTNZanE5VjAxd2tvdUJhdTF0cFFBTVpEcWJsRjBCTnNkbmQ4MmY3?=
	=?utf-8?B?QlFIdmZiOHhBSTdMMU8vZTFNdGN1WUZ5NElldHhkUVFTT1JZUXJaMUo2bDVD?=
	=?utf-8?B?TjhPVFE4ZG1uR0gzODNWcEVuVExoNkpOd3JkQmg2dXFxeVA4bUk5ODVySVlt?=
	=?utf-8?B?YVFmaHI0TzhUSmlabXZhT0pkRkF3M1cwcWVxMXl5Qy9HKzJmVlNTMVljNjE2?=
	=?utf-8?B?dW9UMHAzY1ZTNzZWSVF4eDlRM2U1dnRXeVMvdjkwd3dyQzhLa0k4MnVlSWd6?=
	=?utf-8?B?L0dnQXp3R1EyVTJyZkpWMzd4VzNoUm1rSmRZbDdyZnZkNi8rc1d4NVBRRFJz?=
	=?utf-8?B?dnhZa2pjQ3JhdUxQRFlCbnZaOUxPOE55Nm9VdUM0WThycWtMYkZzTU9zd3Fu?=
	=?utf-8?B?b0VVQ2wzdzVkblV5UkdjQjNxTXdPTndlcG5ha2FZejMvMXc0K2wwVythc21I?=
	=?utf-8?B?SmZqNzdEM0lnYnJ4R1VVdElFei9pOFlyOFdKaU8wVElSSG16VnJ4YTRNZmY4?=
	=?utf-8?B?OGZSWlJ2LzgreWtOeE9ZNnQ2TUdicXo4Qk80akkybjRVMWZ0RHZEUFlocmtu?=
	=?utf-8?B?czUrRTBGZjhmNTMrUEh3TFNjK2NSd0VhdkRvL1NzRmRMZXhMc2ZLZFBiejNj?=
	=?utf-8?B?Wkg2TkhBM0RQenRHRjE1Qy9oa1FBeHhuRzBBdXVycU1YcTBCMGNSbnJSWUpm?=
	=?utf-8?B?OWhRc2hiUGE5eUFTcVdsWHBqRmhEQis0OHFsRC9zeGhFejYzVDN1S1MzWm80?=
	=?utf-8?B?K0c4bGFlbXlReCtFaTlpeXdSQm0zbE4yelhNTDJ4OGdVQnpCUTV6Vkd3RXl6?=
	=?utf-8?B?Sk5GYnlhUXBMSksyR2s5SUVvc0M2UWh5WlpqTFY0SENVYXJQU3l3Nmw4dFl6?=
	=?utf-8?B?UmNMWXR0c2hab08zZGdPaFlWcG5uTUVxRS9uSzJsTkI2Mm1tWmk1MmxyYkZ3?=
	=?utf-8?B?Ynd3aHJoaVRhTTNBV2xOMUM0TVdUT0x0dEw5TTJIYmJKb25CVXUxVXBMTE9q?=
	=?utf-8?B?QXQ5WVNUdHBERXYzSWkvVDV3UXlNTzZQdy9SS2VMVnhQN2puMGZXOHE4WlFH?=
	=?utf-8?B?RXRISCtXNzBUaCtRTGFkL0M5andJTnk3Y1lJMFMxeDFpTWtReEI2aGJOTGRD?=
	=?utf-8?B?VzBZbmpxT09yVERoUmlNLzN4Zzh5VVRhbGdUd3lxOERXM3VuanhHTFBhYzVS?=
	=?utf-8?B?aWRqRjI4TWRmMDR4K2JxYzNCcTJ0QlZQWjl1NmRRMklPWEI4YXk3VFVzOGxM?=
	=?utf-8?Q?hgba5Rh2+nCO5P7pQo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	6:MpZ1sYrEQd8eeM5KhOlYv+F2gsObiTovkkQcekgoRnKVl6h83lmHxJ5SzwDHx2AcX967THefgI+nKWYnStSNi/O1E03t04Z2lT2DkToJ94GYAwwp8Bkab0/JhW5EBFHX0/Et3+8YybgtwCiT/ViBskUJSATuelq0ulRthImIXQ83L0T7pCWtafliVzeRGBVzvOWbjnRVF901foVcTcRYXVNJk6pgFjNlZnYUmSbck8+jtK0+BZrhRLjWmbkK+ISGWr8IaAujDHVOY18qnonKBKQxbhyP+bT9qvj2pgMhzVGLM/8wt8yYGCnKuKgFTiOnrKzgtv4pGpyLnNe9HK7AwI9W/NujqqMnTT2ncUKCFa4=;
	5:kKdeJK2f3tCbCC1RTMEGrezRiE78iOYJMHgdD+xc2RKbwSr89rzGzP+ZjFSwjWcZv2AfuP8ANVoEGcA2s/wYJHKoj68cpGsaex4FEIQ+sVklDDGSTuRw0ybI3VutVpgyz4QeclFTAU0banH5VxALlGJSf/fpkRPzv/HuicaDe0M=;
	24:PkK+Yue5P86EiX1Xjx/s7HASrCIFMJrxRqFD452vf9ktaCbb5FaMiT1/eaDv5KCSr3p0pkpwgbgyqDQnJlvwtfQKxJSyqy6P6stYO+ObZWk=;
	7:9+jVHFw0VP3yVGyC0IMXp1368IwKRDANVERQkPY4wxZw2x1sILTDXk55kVRjyK/BgLmKUybwlnyqZHgPbwJ4FuTo1JwtdlTV4mXJTyMoLn8MpYpNNqBxvrztm7xAQ4Wk9D52zLyEnl1SE09l6HQAheaYx4llIgYQJcrxpTkIj7pE9xzwKKFTJDSXMTk9YwUNN1EfJ77X5wdk+mb4js5d4taYUzkaN/ZpUBAoqPlI5uDi5JHHDpTeUA7tG24CSRqT
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2018 13:40:44.1012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba3eff7-91e7-4e63-67ed-08d579f9df6f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0125
Subject: [PATCH v2] bind: add packageconfig for python-support
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
X-List-Received-Date: Fri, 23 Feb 2018 03:10:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Hundeboll <mnhu@prevas.dk>

Break the hard runtime dependency on python3-core by adding a
(default-on) packageconfig option for python.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>

---
Changes in v2:

- Remove broken and unneeded build-dependency on python3(-core)

 meta/recipes-connectivity/bind/bind_9.10.6.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
index 8b8835ba803..7af92a4fdab 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
@@ -38,16 +38,19 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --with-openssl=${STAGING_LIBDIR}/.. \
                "
 
-inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
+inherit autotools update-rc.d systemd useradd pkgconfig
 
 export PYTHON_SITEPACKAGES_DIR
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
-PACKAGECONFIG ?= "readline"
+PACKAGECONFIG ?= "readline python"
 PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
 PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
 PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
+PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,,python3-core"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
@@ -60,7 +63,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
 
 PARALLEL_MAKE = ""
 
-RDEPENDS_${PN} = "python3-core"
 RDEPENDS_${PN}-dev = ""
 
 PACKAGE_BEFORE_PN += "${PN}-utils"
@@ -88,7 +90,11 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+
+	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
+		sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
+			${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+	fi
 
 	# Install systemd related files
 	install -d ${D}${sbindir}
-- 
2.16.2


