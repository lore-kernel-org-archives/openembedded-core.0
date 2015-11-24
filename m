Return-Path: <jonathan.david@ni.com>
X-Greylist: delayed 3633 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Nov 2015 19:04:53 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0145.outbound.protection.outlook.com [157.56.111.145])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6FF6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 19:04:53 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jonathan.david@ni.com; 
Received: from [10.2.106.95] (130.164.62.214) by
	DM2PR0401MB1261.namprd04.prod.outlook.com (10.160.218.141) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Tue, 24 Nov 2015 17:29:52 +0000
References: <565498D8.4050103@ni.com>
To: <openembedded-core@lists.openembedded.org>
From: Jonathan David <jonathan.david@ni.com>
X-Forwarded-Message-Id: <565498D8.4050103@ni.com>
Message-ID: <56549E8B.9070401@ni.com>
Date: Tue, 24 Nov 2015 11:29:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <565498D8.4050103@ni.com>
X-Originating-IP: [130.164.62.214]
X-ClientProxiedBy: BY2PR04CA0008.namprd04.prod.outlook.com (10.255.247.18) To
	DM2PR0401MB1261.namprd04.prod.outlook.com (25.160.218.141)
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB1261;
	2:zclzZGMCs8vAM/sr0sY4FZabVVLL0pPJHIYdbYTIPyYfTydUYf7odCjErHaE1kg1YMn4osKY4nsyE9xARLBXbX9oxFO4BZdjxtYOHP8Lq0XnvWksPhN31il/93RfyK49EtQKNrkoVi8WLGE8VhQSDw==;
	3:uXsqvgPCpmjK6VZ7e92ODPMoCzCbV2s2iLzbhfujBIeXtIkb9uoM/c5GbX6sW8WJ9Y1aNYB1gTwlWbnaWG+aBGXcesBXWXQShn24Da+4lx6h7dqlcnja10ZF32Ad5KYL;
	25:f7NYo3rn7bn/1DH7eaF0z35i72rq/D5ZVf8NFk+VTMbjS2LvyFM8aYJWXk6c27wGEXNSaWv6LorKOTWTW+MgQ4zYZgIEoBTSNRXdJ8F8OpDCLRMjp6/8Yp32I6CFE4+Vgrq3AKp28CSanEO4V9nNOIM4821c5ldthdAbo/oCB3yzKhxA0DOWY72ioX2GWit6Gr6bj/mugwVZt2gAWySivCCTc9JijpigXvb977VEZe47cXUsIsIb4vdFiCMasnUuCpsOPW97ji0afcgwXSAtnA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0401MB1261;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB1261;
	20:tKDKzCEn5QaFbHJgqeyZOJEMWyUl6Q4hticRV4wL4/SQD+MfLV5n2Nt377onvYjxu6Qb+mBixXB/YLSyJ0rATMknQW2ReOzw49fJ02WQ1enDa9C7txpq5YkJE6ICCvXElueLFah82ubPvjdeB69OuKIZp43mF0XbU6TgkapqST6X4hMuZELP64XgofO7sR0ZA+Gq0UlLvvzzFmUXFKjTPBSrgqO500KQBl2AjKwPN/PINlUvRH7O5H43m68qGqz0shM86xO+wUBAecZRuUyqJr/vsZdo/Vrhl9M+1YRdoVsfWjzg5NGS1e71BlJlmybl/z48dpoZFUbLS/vIr68BWbRHyNA0KufT3wy+YQSMMj51nPjBRaE60epL7MDgr07cb2k5cpQimpLlLFiM4sPfAtsOk66XaEGspIE09Fczzgu/rXuFjVsf2pLz1jNd5AWcXsfljL0UTE7vEayJmee9b4V9QISB2KeLDAS2RWpIAXM8OKXdUPLN60niCJttnxRgzLXglPIAopmpLgEjTQfWOnl1QbgCreBlspMHA598WAlrqUcLszpibMfiPEQgpFcEJAQfa3rBvA0nEI/OYsqlvysQzJfYHM0i5VZcGxDrGA4=
X-Microsoft-Antispam-PRVS: <DM2PR0401MB1261C1F819DAADC23AAFBD0CFB060@DM2PR0401MB1261.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046);
	SRVR:DM2PR0401MB1261; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0401MB1261; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB1261;
	4:hMXIJa736m29T0IE+VfLRuWVwbo+NnYkfhfs8nzKEqGEhehWCVqRGCfWNomAyUvBNM8UcL2vf5fyXAjx3khOloAHiwtesB9YRjeaukaEInoLmedUBxaIfmNBQhxNwxoJQQpydYCzKH2lRTfxCHOg9O3tAT1iscY4upbJzcXH8rxxuTWGaxqLAS7i8AV2XqKmNu3cagrWJ3ZMhT1uSeHtkeQYZMkkcGxhRZtiDCXbcRAmBO7Kkbrsv+UHpTJnzv9jrmzMVUO5VwvYH+v8IOLCq2p65fWZxvSlaB9Fe2+78S2YV5ivwW7BtMaj5QOI5X06UhZLWHg4SEga+MBogNmNLpv3Ceg9Jo1Dlrn100UK8sqYB+byVoVsbXYix6zs9gQ1
X-Forefront-PRVS: 0770F75EA9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(6009001)(189002)(199003)(42186005)(86362001)(575784001)(87266999)(65816999)(54356999)(5004730100002)(65806001)(189998001)(33656002)(65956001)(92566002)(64126003)(80316001)(77096005)(66066001)(19580395003)(4001350100001)(81156007)(36756003)(2950100001)(5008740100001)(110136002)(450100001)(107886002)(83506001)(97736004)(5001960100002)(101416001)(122386002)(230700001)(23676002)(229853001)(87976001)(2351001)(47776003)(59896002)(586003)(3846002)(6116002)(99136001)(5007970100001)(105586002)(106356001)(40100003)(50466002)(50986999)(76176999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0401MB1261; H:[10.2.106.95];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTJQUjA0MDFNQjEyNjE7MjM6aWVqSTZ3aW1sb1pBL05POHJwUWhuNVYy?=
	=?utf-8?B?bURiYVpoeWc2OUh1aG54OXNBdUFiVWhjVWxMNjlGODJhNUxPZzgvbVUzTWhD?=
	=?utf-8?B?UGxFU1VQSkRQWEJ0S3BrV1poYWVQNU5JdlJmbnR4dDRSdzh6SUFudXJHMFhs?=
	=?utf-8?B?OWF3Yyt4ZmxwUnBQWVNSeFR4c2xYMUJZWGtjTGZyWXdwQS9EbHVkaUlaMEtC?=
	=?utf-8?B?RUV1Qko0ei9RakVEZmpLSHVpQlk5aEJBQXF2MHhmZk9VZDBNUjZzdXpuTEp5?=
	=?utf-8?B?dVIrOUVNQmNnV3A3dXA2UnoraDVLWUh1ZGRmK3JyMmg2Z21NNHV4T0VpTGYv?=
	=?utf-8?B?RW96SGVHNHFBWmtMOEJFRHBKQWV5K0VaazdRUXZxTFFIWnpGNXBsRTdRanRu?=
	=?utf-8?B?UjFXZTZQYkh1aXo2bkxOWEVIbWZQWkVnVXQxcVgvMkNVN2x5R2tXTThMSUhL?=
	=?utf-8?B?ZitaeXIrN0VONGdxT25JN1lIVnZ3ZHN1TFhmZnhDd2NrcW9va05UYXFLclBS?=
	=?utf-8?B?QlM0bzFmZFNIZGpmQ25CUWo5dXZjSTZTK1YwOEp5elJMZ1drTmVYN2crUFIv?=
	=?utf-8?B?VEEwRzZEUWQ4R3RRR2hSMW80bHY0NUo0cHVoZ0lEUkFaQVBvaW9aR042QzUx?=
	=?utf-8?B?dUxTS1l1aXB1OFd1czVnTVpFTVR4UU5mZVExczVQVEI3OGJjN1daWVZJeml2?=
	=?utf-8?B?YkwvZk10TXU3TFpwRy9remMrZ2hMQVZrQTlJcit0ZGcrSGo0T1FLWDd6UDZD?=
	=?utf-8?B?d1NFbVM1alU2TXIvZ3FrYzdWZEFiOGIwaHFZV0x0ZkdUN3lnTiswVXdjTUlV?=
	=?utf-8?B?allGNlNwQzVmN0RaUy8ydjZtaVVNbnZyUWZzaFNPNExUNXJpaVhKNHFKVGtU?=
	=?utf-8?B?ajl2bERDSFh6YjlkWXIzWnZIaXB4SlErQklaQnJ4TlZjUUloa2ZHcDRjczJZ?=
	=?utf-8?B?TytCZEZxYXd3RVF5VWkrV0Q0d3ZNRkRvTDJvWWIxcmFpU2FRWmQ3WTEyY2M3?=
	=?utf-8?B?R2pESm9xOHFuMjNWSzU4MWJ6YnJWRmxmempZNEpjMkd5azd2L3lidlRKbWMz?=
	=?utf-8?B?YkRNcjBMeUVLSy9TMzFSejY2cituOUVsYzZ3RUxNdDNuQklHRkwrRTJlRkdW?=
	=?utf-8?B?NElnbk5GQnVRL0czdHR0Kzdkb3BwVHU5VFR4dVBqNFJMbWNJdlZaWTM0bDRu?=
	=?utf-8?B?U0N5TU5LYXBORGE1eWRYK3lVR2tmeFk2M2lFbENocFlWa0R5SkxseTJvZGxD?=
	=?utf-8?B?elNFdnBCZ0tBeW43V3JzSHArMElyWmtQbjBLeXhrd0x0YTdEcklPck9rRWQ1?=
	=?utf-8?B?UEVkT1paSzcvUEFwOCtKVGpzTDB3Ynl2NUFvQysvbW40enNuYW0xRXdQY2Yr?=
	=?utf-8?B?a0Z6V0k5Ly9UK3hRYmg0aEVwdW9lZklMTnVjMzlzNzFIUXc2bldRQ0RuN1dh?=
	=?utf-8?B?ekhVblRtVmF4UHlETGtVTS9PR092RGJzKzhvZTRTSkJReTFKd3l2UVI4d1ow?=
	=?utf-8?B?Z29oTkQ4TE9nSm1CZktSNjVONHhLV1FRVE81QzMrdDFLSkkvZWJScGdGMHM0?=
	=?utf-8?B?cHJralUxRklocWs3MEZPSE5qSnlwNTJScTZSTGxtQ0pDM0ZseDFrYXVYcFNj?=
	=?utf-8?B?eEJZYWx4d3RZL0NEOFkzRVlJb2lxZ2U2Zlk4S3p0V0M0MHpOSDJkVTNld2l4?=
	=?utf-8?B?NmJwTHpJbVFtWGxjZTBmSSt5bmF0YTJYa2NtbU1XN3c2ZmI0ZmRYQ3A5ckt6?=
	=?utf-8?B?SVlRaWtodlg0bW04bWxEUFFxbWxBdDlXTEM2Z0NOZnlLeWRGSEh4KzVCbnJo?=
	=?utf-8?Q?Vlb33xN1D+hkeZr?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB1261;
	5:uOvR8mq1OOiBOJX/6KsfFT3FrnHHVkiiOvxDO0GW+9WKdTbVaxP1BmxL5SAiYWpB+WuDm9Ys6PV+9euXRswBxND6QLhs8vksDKirTCYUsO5nLP4ehbhY5IITh3yOgNAnlig5V3QmPpSbYSd4ffv0sQ==;
	24:HObkw07p3CvnJUsPPngF8GhJYfz1oDQzpmW7xeiF4xqoMk8loo6grkOQcquilgrPexLy8MCBOZrJPXuBYISrsXCF6HYZoxJyzYhFKEhsl/k=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2015 17:29:52.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0401MB1261
Subject: [RFC] glibc kernel version
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
X-List-Received-Date: Tue, 24 Nov 2015 19:04:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

The change below only replaces the kernel version checked by the shar
file, so that machines running on the 2.6 kernel can unpack an SDK
archive; however, the SDK will be unusable if the bundled glibc requires 
a later kernel than what is installed. glibc's minimal kernel version is 
determined by OLDEST_KERNEL, which from testing does not appear to be 
influenced by SDK_OLDEST_KERNEL.

For example, setting OLDEST_KERNEL=3.14 and SDK_OLDEST_KERNEL=2.6 still 
results in an unusable SDK on systems running [2.6, 3.14) kernels.

Is this a problem that many can expect to encounter, or is bumping the 
version of glibc beyond 2.6 uncommon?


commit: 522ba4c51fff53566678b2689d0d63c393e417b3
populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues

--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -81,6 +81,11 @@ python write_host_sdk_manifest () {
POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "

+# Some archs override this, we need the nativesdk version
+# turns out this is hard to get from the datastore due to
TRANSLATED_TARGET_ARCH
+# manipulation.
+SDK_OLDEST_KERNEL = "2.6.32"
+
fakeroot python do_populate_sdk() {
from oe.sdk import populate_sdk
from oe.manifest import create_manifest, Manifest
@@ -156,7 +161,7 @@ EOF
sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
-e 's#@SDKPATH@#${SDKPATH}#g' \
-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
- -e 's#@OLDEST_KERNEL@#${OLDEST_KERNEL}#g' \
+ -e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
-e 's#@SDK_TITLE@#${SDK_TITLE}#g' \
-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \



