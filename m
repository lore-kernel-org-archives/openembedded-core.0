Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.12593.1631112224252174627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BXPTltGj;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=488573eb99=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188EJZSP000733
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 07:43:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=YAZFtqRyYXCmNLkhbGjjcm5G43Lz9Zsf6qC3sxi1VDg=;
 b=BXPTltGj2wlpFB21UueEAlIq3lEDHHRD4qjP4w6G1E0Ea/4qzYIaooTGDzGRgzst4sZQ
 gGhuBodWUOwoU0VAzIBQyX7xNWEkoNqnfgFjEO7vdlfspvdbJ/3Hen8LcatMqFTCIZBI
 VnZR1LmFpRoyaz8jfa85xuiT723EGbXISKwZT3RnQIy6JSclV1ej6R6PODQ9uKIKDynG
 NGo7AMPguSczG4HMB3KZ2AOpphK7daCcSTaDp0bYIEhKcjlRq4MNB/K29WDYAfQko5Aq
 ZLOGJgsZDusxHolirCNOXJAk37n663XEYqBKa8A7/O0/id4A24OodSTPICYbGeistpbH dQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcmugp3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 07:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqnPbvEgmBiRYpvW9J6Sh0HwPKPc/TF1Rh+ZVJD1MLv96aqvLa1XTE9HAuBrNqdZ5iRYeEkKJXQPfUOrxge6eKHPJNt0C/CugP1aPNy3LaXP2SeivMAWSBwV1LsrWwVfgdEbwWTAolLwuyofSIS66IqYnnnmstcLfldKg/sPtSDE6J+1bD6QFqFED7+z3STOFoy2XxXOSy71Nz8rJbWm00+kkEYVMu5J7d43nxTfmP1yxrIkEvKifA1XR87hQ6Cc1aemUMm0vQGIvHL83G49ygPE9uOzRGzuP30axeHHMv1rF0MFx5SX4S52vu8O8HMqkWxWb+ssePamQUQxInqj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YAZFtqRyYXCmNLkhbGjjcm5G43Lz9Zsf6qC3sxi1VDg=;
 b=mY9Juau7Tw/EHP6ahSvpu8/EvO7XisSKcAs+TkT6idBjhn4HmirzcSh0RyCWw8HmSNdwnWXhJz5r8uzfv/lH7qPUVKxy5gp/R9zMPJV6G4FSJtxxG30PUy///HlBuRPvuniLTeM7ltcErYGkak+h0DnTTnKBo+CAGQABl7QT+xjgcPPld9IeagzWBv5jsFyOKBB8VxmZD5/WMwu4n8BVlM8YKJPV+faosxv+BngKn6+SsLRRqKwGA7/nWg9gC7uLE5jaV+ir0KvJvHV9Bwi6/HoSgDB4Yh/nRRfmVz/1hdcqrQRqOToS3tPJ9wxEV7ONnwoaGrCf8BrH1vazfoDpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 14:43:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 14:43:39 +0000
Subject: Re: [OE-core][hardknott][PATCH] bluez5: fix CVE-2021-3658
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16A0C74572815139.29772@lists.openembedded.org>
Message-ID: <01abbd21-3985-2014-7799-8b538bafc376@windriver.com>
Date: Wed, 8 Sep 2021 10:43:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <16A0C74572815139.29772@lists.openembedded.org>
X-ClientProxiedBy: BL1P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc] (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by BL1P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 14:43:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c565e248-f734-432a-0499-08d972d70bb3
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4942:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB494282D752B69928E3162BEB9FD49@SJ0PR11MB4942.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zP7QyxKupIT+bn7wTLysHpfOlYRZoguUXE7ppalA0vKFXeBtevmAflMm4n5sjSom5I9jYMuaEknuppu/+vDXBtkDaYqe89YN59WOGn1cvgMIGnXtonBDRdimZSmKP05upk78Yxk2bakIG0Ov7bcmuYfI6z1C6cu3Hcb8rvSEBsm30WpX9jWVquPfXeyd53CIxspfX4DuYVWnR6zbCfY/M+LdQ3RqensGcPbA7tGb8Ao6GzaUFNggXmHyUcn1KbDgGO08HaR264Au0Il22FkMfD/1xIs2CZA1hAVz/uJPoP9CMh9qTDlj/0cxa6FQvGo0lJJyFOLcR9JpOspkIjAcR/YxpRLvLD2LWCpauC9OkwmsGSO5CQFPfXJX1m27M2KuYulRNpE0h/uUFpNAHCWmfsd89CRFJ8Dgor+5ET0KvHROqpOSe8UIlmhPu3WldXXguR7XKLh1Xw+1qiXm91IXB09SX7L8Yn20OqI9oX6bPnAHOkLWXkIgaqiJ446WlxMdglV47YdNYx3Pi1Dw/9rcTzSBf7BsYiVxrvvzLWD3H/yRqX0EPdwTZ++rsr2EpESwhLx0T71zxygqqwP62uyWXEiiymqHkI60zR3Ppsue58iT1Uopdp9pC8dbnSZF9xgGo0V7p5Mevr93owkBcJW2GoGMqtEsKlWss6GoVHwNM+qqIBKYBHnneglQTdSzpXsC/fji0bsJLATNXwdt14huVK5x2xGdlgIe4pTR+aI9IhRARBbmRT0zIbYWt4zh3F4KdmT/FvyYEZaoTwfRLWHq+1kutjMM5Tvg1iicvitwzDgUNZel9/rIDx7eEBdy2qT72i0/9IkXXJDSVjC5I8BmG6/qfccSxnMoudjUc5Wa9PI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(366004)(376002)(396003)(8936002)(30864003)(44832011)(2906002)(316002)(2616005)(966005)(166002)(53546011)(86362001)(5660300002)(478600001)(31686004)(33964004)(66476007)(66946007)(66556008)(8676002)(6486002)(6916009)(186003)(83380400001)(36756003)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWtNenc4U2NRNG5oRHJrQ1Q2cGtSWk1SdHhNS1pMbkpLZXh1RExweXNvbnRo?=
 =?utf-8?B?akJQTEg2L1NDSVZUUHBVS2ZaRFpGTUxkQlRvV0Rta1MvNEl6YUdYVFpRSVFV?=
 =?utf-8?B?RTFrOTJwclZoOXFJcTlmS05aZWRja0xVOTd0L0RkeU01clpjR1VZTEEzbC83?=
 =?utf-8?B?bkN5YllMZ0UxRWFJbVJySnA5NHVZUnRHa2RLVVVxY1pQcG1MMktYbE9ZZ0RS?=
 =?utf-8?B?YmpmYmlKNGtEVHE5MUpGYzRsT2ZOVVNycmVRM3YxT244ZjRGcEVtYm5hV1FW?=
 =?utf-8?B?TVltUk1hT0pMRS85N0QrNUM0Zi91eWRpZHUyK2JTcXI3US9TeTJMS2tSdE5B?=
 =?utf-8?B?M2svR0l2SG03VVJRQms5SFVvS2tQM2VvOVR3WWhod3V3UFY1SklkWHhsWXFz?=
 =?utf-8?B?c01PTlJrOGhqdnZ4bHlWS21LL05VMkZERHlJekFqMFRxR25zdlk4aU1FbkFh?=
 =?utf-8?B?VkFZSk9abmVnWUlrQ3IwaU9oU2xWcHVkcWZuVDBYU0VDWnJpWC90bnlQa2Jt?=
 =?utf-8?B?KzJrTDJPNkVUVi9yT3lMVFV0WVVlcmxqWlFsaDBLODhWdG9yY0tuYmJpRzFE?=
 =?utf-8?B?MnlTYlJCMndCcnVmRElYVmU4NUpQT1FpWWplMXRjVCtKcGpZM3ppekNvVVdZ?=
 =?utf-8?B?cURJUmNlbTgyV0RQdkdCR0NpdUllY3lPSm9nTkorNHJjL0h5b2pmR2ZTQ0ht?=
 =?utf-8?B?SmFDZXQxUFIybm1JMHpPdUN1SlBTcEJHekJFL3Rmb1VXN29EM2xTWWhoNkJL?=
 =?utf-8?B?YXhCc2x0L21BM1hNN2tvaDBvYVhaTXQrWWNIdjd2NTBibHpPV1hsZjJsZk10?=
 =?utf-8?B?YjJ5Q3FRWGxrRThIOFV6MHBDcmhBdUdYYkpwRHNTZXlCV1hkOTNMNU4zS1BN?=
 =?utf-8?B?S1B2eHp1ZVhZQmlmblZxeFlHclIrRm9OVXFFTlF5Q1I2Y2pOUEcrcHhoTWVz?=
 =?utf-8?B?eG96YTErbzY5QzJWeHZYR0tPOEZEMm10RCtFTCt6Ti9PVnl6ekNTQUlYZGtH?=
 =?utf-8?B?M0poSDM3ZWhXMUhFM1V0ck0rbXFOZDBqSTlRYTE2SktuVHQ3SUdYR0pwLzR5?=
 =?utf-8?B?aUZOT002YlorZ0xTT3FKVy9mSm9UUXFIUWJsMWZsbC9uWkpxMlhqbHNRT3NX?=
 =?utf-8?B?elU1bEJSekFoWTFDREJUVzFXM3M5TXdHWkNlUEZ1TkZyaktOS1gzSVhLY1FZ?=
 =?utf-8?B?WllGcys5N3M2WlhTaGtHQjBDTm8vN0J0SE12M0phQ0V0Y0dsZUhqcHBYUW03?=
 =?utf-8?B?MXJINnd4NWh2bEFZblNkR2hpK2ZlTmtudzhiRXRZaEFmZDJMVHM4ZGJiTzk1?=
 =?utf-8?B?TS9xQ25ZZ1VFaEdBZ1JSc2VuU1d6aFhsSGx4cmUrRUpVTWE0cTM4bzE0NGpH?=
 =?utf-8?B?dUNDN2VPdUp0MVNBeHJyT1BaaC82UHpmMUNPUGFKZHJod0Z6elE1L1JQbnVp?=
 =?utf-8?B?Y2hDamhKN2luRWZUbk5YZFAyQW1pS201dXJzTHRiOWQyMiswWnNoeU5VRFho?=
 =?utf-8?B?dVlMTVhNZCtobWN0SmFSMEI1d1hISVFqVVNMbk5Hd1pmVytYTUMwZTNGMEFp?=
 =?utf-8?B?L3MzQXVUdC9WZzlTTjlrMU1USTQ0bFlGa0p5Q1pvenVDdmVFRVFqOVdWODFZ?=
 =?utf-8?B?WkkwWHVra3Y1ZlkxcE5IWTRHc1hKNlZWT3JNY0tFMzhTOVl2TndVU2wwc1RW?=
 =?utf-8?B?QlpsQUhEN1FuQ2JLS2pPclQ1N08rUEIvTVJLakFGbEJZYWFGQWN6b2JwTTNF?=
 =?utf-8?B?cmpMSkdLMU9iTzdaUWYzTytDb0hXeWhFdmlHMU9ZN2lZTTlQRXZHS1U1eTQ2?=
 =?utf-8?B?TThUK082OVZzWjdIQzRORmwvM3BMM1YweUs1MzIyMEYySGJPaFo1ZUlWNVVh?=
 =?utf-8?Q?EOoIAyLgEcQpF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c565e248-f734-432a-0499-08d972d70bb3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:43:39.3000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gtTQZkj7+YadOnPMd4dntoq1kEDUMPSNkGGg5sHzavg3ObMIaaUv43xpyWL+u+WkJXFvvr62XH3hJax+kUX/R9WmALed8Bf5FYMP88qvFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
X-Proofpoint-ORIG-GUID: ZNJ8aI_NtFi195N466juMJzk0oAsxnUt
X-Proofpoint-GUID: ZNJ8aI_NtFi195N466juMJzk0oAsxnUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109080093
Content-Type: multipart/alternative;
 boundary="------------3F2EB96756260E58E49A64AC"
Content-Language: en-US

--------------3F2EB96756260E58E49A64AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-09-01 2:45 p.m., Trevor Gamblin wrote:
> Backporting upstream fix since the uprev from 5.60 -> 5.61 does include
> some minor functionality changes.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Ping. Just wanna make sure this is picked up.
> ---
>   meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
>   ...ter-Fix-storing-discoverable-setting.patch | 100 ++++++++++++++++++
>   2 files changed, 101 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index a7b628ce1b..0d30b1a3f5 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>              file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
>              file://0001-test-gatt-Fix-hung-issue.patch \
> +           file://0001-adapter-Fix-storing-discoverable-setting.patch \
>              "
>   S = "${WORKDIR}/bluez-${PV}"
>   
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
> new file mode 100644
> index 0000000000..c2a5edd226
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
> @@ -0,0 +1,100 @@
> +From b497b5942a8beb8f89ca1c359c54ad67ec843055 Mon Sep 17 00:00:00 2001
> +From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> +Date: Thu, 24 Jun 2021 16:32:04 -0700
> +Subject: [PATCH] adapter: Fix storing discoverable setting
> +
> +discoverable setting shall only be store when changed via Discoverable
> +property and not when discovery client set it as that be considered
> +temporary just for the lifetime of the discovery.
> +
> +Upstream-Status: Backport
> +(https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b497b5942a8beb8f89ca1c359c54ad67ec843055)
> +
> +CVE: CVE-2021-3658
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +---
> + src/adapter.c | 35 ++++++++++++++++++++++-------------
> + 1 file changed, 22 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/adapter.c b/src/adapter.c
> +index 12e4ff5c0..663b778e4 100644
> +--- a/src/adapter.c
> ++++ b/src/adapter.c
> +@@ -560,7 +560,11 @@ static void settings_changed(struct btd_adapter *adapter, uint32_t settings)
> + 	if (changed_mask & MGMT_SETTING_DISCOVERABLE) {
> + 		g_dbus_emit_property_changed(dbus_conn, adapter->path,
> + 					ADAPTER_INTERFACE, "Discoverable");
> +-		store_adapter_info(adapter);
> ++		/* Only persist discoverable setting if it was not set
> ++		 * temporarily by discovery.
> ++		 */
> ++		if (!adapter->discovery_discoverable)
> ++			store_adapter_info(adapter);
> + 		btd_adv_manager_refresh(adapter->adv_manager);
> + 	}
> +
> +@@ -2162,8 +2166,6 @@ static bool filters_equal(struct mgmt_cp_start_service_discovery *a,
> + static int update_discovery_filter(struct btd_adapter *adapter)
> + {
> + 	struct mgmt_cp_start_service_discovery *sd_cp;
> +-	GSList *l;
> +-
> +
> + 	DBG("");
> +
> +@@ -2173,17 +2175,24 @@ static int update_discovery_filter(struct btd_adapter *adapter)
> + 		return -ENOMEM;
> + 	}
> +
> +-	for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
> +-		struct discovery_client *client = l->data;
> ++	/* Only attempt to overwrite current discoverable setting when not
> ++	 * discoverable.
> ++	 */
> ++	if (!(adapter->current_settings & MGMT_OP_SET_DISCOVERABLE)) {
> ++		GSList *l;
> +
> +-		if (!client->discovery_filter)
> +-			continue;
> ++		for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
> ++			struct discovery_client *client = l->data;
> +
> +-		if (client->discovery_filter->discoverable)
> +-			break;
> +-	}
> ++			if (!client->discovery_filter)
> ++				continue;
> +
> +-	set_discovery_discoverable(adapter, l ? true : false);
> ++			if (client->discovery_filter->discoverable) {
> ++				set_discovery_discoverable(adapter, true);
> ++				break;
> ++			}
> ++		}
> ++	}
> +
> + 	/*
> + 	 * If filters are equal, then don't update scan, except for when
> +@@ -2216,8 +2225,7 @@ static int discovery_stop(struct discovery_client *client)
> + 		return 0;
> + 	}
> +
> +-	if (adapter->discovery_discoverable)
> +-		set_discovery_discoverable(adapter, false);
> ++	set_discovery_discoverable(adapter, false);
> +
> + 	/*
> + 	 * In the idle phase of a discovery, there is no need to stop it
> +@@ -6913,6 +6921,7 @@ static void adapter_stop(struct btd_adapter *adapter)
> + 	g_free(adapter->current_discovery_filter);
> + 	adapter->current_discovery_filter = NULL;
> +
> ++	set_discovery_discoverable(adapter, false);
> + 	adapter->discovering = false;
> +
> + 	while (adapter->connections) {
> +--
> +2.33.0
> +
>
> 
>

--------------3F2EB96756260E58E49A64AC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-09-01 2:45 p.m., Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16A0C74572815139.29772@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Backporting upstream fix since the uprev from 5.60 -&gt; 5.61 does include
some minor functionality changes.

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a></pre>
    </blockquote>
    Ping. Just wanna make sure this is picked up.<br>
    <blockquote type="cite" cite="mid:16A0C74572815139.29772@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...ter-Fix-storing-discoverable-setting.patch | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a7b628ce1b..0d30b1a3f5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = &quot;${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '<a class="moz-txt-link-freetext" href="file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch">file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch</a>', d)} \
            <a class="moz-txt-link-freetext" href="file://0001-tests-add-a-target-for-building-tests-without-runnin.patch">file://0001-tests-add-a-target-for-building-tests-without-runnin.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-test-gatt-Fix-hung-issue.patch">file://0001-test-gatt-Fix-hung-issue.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-adapter-Fix-storing-discoverable-setting.patch">file://0001-adapter-Fix-storing-discoverable-setting.patch</a> \
            &quot;
 S = &quot;${WORKDIR}/bluez-${PV}&quot;
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
new file mode 100644
index 0000000000..c2a5edd226
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
@@ -0,0 +1,100 @@
+From b497b5942a8beb8f89ca1c359c54ad67ec843055 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <a class="moz-txt-link-rfc2396E" href="mailto:luiz.von.dentz@intel.com">&lt;luiz.von.dentz@intel.com&gt;</a>
+Date: Thu, 24 Jun 2021 16:32:04 -0700
+Subject: [PATCH] adapter: Fix storing discoverable setting
+
+discoverable setting shall only be store when changed via Discoverable
+property and not when discovery client set it as that be considered
+temporary just for the lifetime of the discovery.
+
+Upstream-Status: Backport
+(<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b497b5942a8beb8f89ca1c359c54ad67ec843055">https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b497b5942a8beb8f89ca1c359c54ad67ec843055</a>)
+
+CVE: CVE-2021-3658
+
+Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
+
+---
+ src/adapter.c | 35 ++++++++++++++++++++++-------------
+ 1 file changed, 22 insertions(+), 13 deletions(-)
+
+diff --git a/src/adapter.c b/src/adapter.c
+index 12e4ff5c0..663b778e4 100644
+--- a/src/adapter.c
++++ b/src/adapter.c
+@@ -560,7 +560,11 @@ static void settings_changed(struct btd_adapter *adapter, uint32_t settings)
+ 	if (changed_mask &amp; MGMT_SETTING_DISCOVERABLE) {
+ 		g_dbus_emit_property_changed(dbus_conn, adapter-&gt;path,
+ 					ADAPTER_INTERFACE, &quot;Discoverable&quot;);
+-		store_adapter_info(adapter);
++		/* Only persist discoverable setting if it was not set
++		 * temporarily by discovery.
++		 */
++		if (!adapter-&gt;discovery_discoverable)
++			store_adapter_info(adapter);
+ 		btd_adv_manager_refresh(adapter-&gt;adv_manager);
+ 	}
+ 
+@@ -2162,8 +2166,6 @@ static bool filters_equal(struct mgmt_cp_start_service_discovery *a,
+ static int update_discovery_filter(struct btd_adapter *adapter)
+ {
+ 	struct mgmt_cp_start_service_discovery *sd_cp;
+-	GSList *l;
+-
+ 
+ 	DBG(&quot;&quot;);
+ 
+@@ -2173,17 +2175,24 @@ static int update_discovery_filter(struct btd_adapter *adapter)
+ 		return -ENOMEM;
+ 	}
+ 
+-	for (l = adapter-&gt;discovery_list; l; l = g_slist_next(l)) {
+-		struct discovery_client *client = l-&gt;data;
++	/* Only attempt to overwrite current discoverable setting when not
++	 * discoverable.
++	 */
++	if (!(adapter-&gt;current_settings &amp; MGMT_OP_SET_DISCOVERABLE)) {
++		GSList *l;
+ 
+-		if (!client-&gt;discovery_filter)
+-			continue;
++		for (l = adapter-&gt;discovery_list; l; l = g_slist_next(l)) {
++			struct discovery_client *client = l-&gt;data;
+ 
+-		if (client-&gt;discovery_filter-&gt;discoverable)
+-			break;
+-	}
++			if (!client-&gt;discovery_filter)
++				continue;
+ 
+-	set_discovery_discoverable(adapter, l ? true : false);
++			if (client-&gt;discovery_filter-&gt;discoverable) {
++				set_discovery_discoverable(adapter, true);
++				break;
++			}
++		}
++	}
+ 
+ 	/*
+ 	 * If filters are equal, then don't update scan, except for when
+@@ -2216,8 +2225,7 @@ static int discovery_stop(struct discovery_client *client)
+ 		return 0;
+ 	}
+ 
+-	if (adapter-&gt;discovery_discoverable)
+-		set_discovery_discoverable(adapter, false);
++	set_discovery_discoverable(adapter, false);
+ 
+ 	/*
+ 	 * In the idle phase of a discovery, there is no need to stop it
+@@ -6913,6 +6921,7 @@ static void adapter_stop(struct btd_adapter *adapter)
+ 	g_free(adapter-&gt;current_discovery_filter);
+ 	adapter-&gt;current_discovery_filter = NULL;
+ 
++	set_discovery_discoverable(adapter, false);
+ 	adapter-&gt;discovering = false;
+ 
+ 	while (adapter-&gt;connections) {
+-- 
+2.33.0
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3F2EB96756260E58E49A64AC--
