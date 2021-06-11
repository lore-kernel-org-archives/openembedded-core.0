Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.5338.1623396566955296078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 00:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Fle722zP;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179608fda6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15B7GT8h025968
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:29:26 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3941pxg26h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:29:26 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15B7TQqd011771
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 00:29:26 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 3941pxg26g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jun 2021 00:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwgyVuOAww4TWLfQ1AWs4rJKKAUfl78+DSSiS68ckANM715T9p9HtfGqwAkucnqgnfyg6nCPbGo3OoOWClCzFX8ul+iIfqv8zRUbz5sfVVamIhdvM/bveVORgdIPpXDRjHZueFd/Yn4jIK/XsdRqX/PE5WmNFKyb8dUtij1bDq/I0SxjJIQAhW+vpM3B8fzexlMaeT1VdMkueKZJehErqJJMH2btLkUf7SgQH/WeIJTzbHkVmzz74KqV8cxBRz3x8vS7N0NQkhW1Oj7EwA8Mxas8zhxF16iAT4CMwMkQtNJfEHZL2z5V48dtrtXRr4MMyVaQlwPTyeNz/Syb5/O4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCR3q+QuCZS/JR1WHxRnBjiaQ7gjoZvupcHewOFKoUQ=;
 b=bhUeslNqG0uuFzo1P75KpFwDdBwmjtg02shTcgYlOXDMguaIHHIlW2/OU2+tlyLCgQ/6YArzugJoHqddSUNyQE6orWJH7xeKM6WF47mqZj4MoO+tKyGRV4qZRvg8fZ/NW2+DTxAxQtw8G9k3aHC88Ii+iUKdCw56AnfQGj57h/9A9gsfbR794rsD7wRGpFdtLlwpDhdGY6LFjppCDXmlsZTTCwZVIhv9ytFEkTb/z1jqk/ynKpP7tZ8Zdx+t4YCU8eM21mI4oKizcDOtEExfvyr2S39b+FCKOr2lJPoBNlYwrwdVEB2jbrfeaT6OX/uM9fENfyUEb4nogc+2JGcJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCR3q+QuCZS/JR1WHxRnBjiaQ7gjoZvupcHewOFKoUQ=;
 b=Fle722zPtM7IEFM1qlB+A2hyylwMT6RNUmZZmUae6msL+xh1u+/y0njKB3tEJcnEc0N4hexOZ0RqanVRcO/PoUOUrpCsseMmfxubpyCprBMgIqlD/C3oXyp9yKx+c9jI91z9vbra9hybi1MHlGzR+zlT6jV+oYG1Kc2DgdJspKw=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 07:29:23 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127%7]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:29:22 +0000
Subject: Re: [oe-core][PATCH 2/4] util-linux: fix calling uuidd failed with /run/uuidd not found
To: hongxu <hongxu.jia@windriver.com>,
        openembedded-core@lists.openembedded.org,
        richard.purdie@linuxfoundation.org
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
 <20200925070535.59518-3-hongxu.jia@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <179b64a6-18df-ec18-fc0f-a0e393d94ad1@windriver.com>
Date: Fri, 11 Jun 2021 15:35:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200925070535.59518-3-hongxu.jia@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0057.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::21) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK0PR01CA0057.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 07:29:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1affd31-d839-4eb6-cb83-08d92caaa229
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB203160BAC3417193878D3ED1F1349@MWHPR11MB2031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KEBm3BRt/q1NkwIpbqQGD2D8B4XaOAMs+Gd5F3FHm70c1buu/zycSAP1AjqC7QTzwjspHO5ZNgxQecIuuemVdt1NfIsL9jFr48zrxVW01GsXDLsKH+1OZ7z7gQbX++rYzO3bPD+JZ/JhmB1XzZV0v9oRAZPMVD6aUXwsd5Qg5ejMwuKU4FueEv7jwtqP05nprFcADvDs7YhGGLx0t0d6Hz51Qmfm20rCBz3msJGkubWPw/16OPLqh7M8/tbUlJcspj/hzIfsN5fxmZg6vT45Qwu4Jxl+3BB1sWKOw0kh2rq+WmIAQ2+1XjWT37/rneJPFxKWKA0WM9OoE7ctmwFVKQT+y5ytZh65LI1KLWJHDD9tJEp7ZJL2eBed3eHqpPLIzcxFrOF93LaJ6NFG0NoirCIEv2rwyIJBcpMQqX4T44jLafOaiFUn1feUS5zGvSvH4DkId3yig5nLqqovuUMNh02gr4Ohw+aCJ74nBC6hAfuAXE+Paxo3C+adn63r7kwERuF81HWLd0lpZsNev/WXWO7UP05B2z7aczKsygkSkSAntNhPhgCYsF89+cmw96kIYeP7Qm4ihC0jXct0DIxyOy1HoLB2ZPMo7gmo88Ym9S6uSi5PHyM+LgYywrJSvt4pSM8KRB/uf0OVP1yQ/weX0e2Zc7XdzyfCrKtiCAQ9IsQ7fvZaCxxDX8FLWhzWZgp1GwjhFLz7/0/km/po0l1+ji16FT8/6VwAiNj/Hr6Syf0MQpaX/RB1CDJL20/YqAOGp2Z2dTUC9+bG7fnILR42lHpBeXGR8fiKV2sFl9t9pFCaAz+LKKUDK24W5SSVJKYAj4Aiq1fYcUfdljylwhGbhblJd10ys1iyxvgTI17EXxaTcsmMO7S4qu5lk4Z105fn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(956004)(2616005)(16526019)(31696002)(53546011)(316002)(186003)(38100700002)(86362001)(38350700002)(8676002)(2906002)(26005)(8936002)(83380400001)(31686004)(6486002)(6706004)(36756003)(66476007)(52116002)(478600001)(966005)(66556008)(66946007)(5660300002)(6666004)(16576012)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVcvYjdPTjAveUhUNlBzQ0RNUDVJK1VJQTh2ZWEyaW9mVmVHWmlLM3hEbHEw?=
 =?utf-8?B?NzRRS3loQm5VTDF4K3grQy8vc203S2RHOVlBcE8yREJtV0Y1RjdYSHBlZ1Fx?=
 =?utf-8?B?QmtPdW84aXRJZ2NIK2gralIvVEdIeXgreGQ3cXRFaVcyS0xuTERPWXdSZW1v?=
 =?utf-8?B?NkNVSjU2NGxvMDNmblNhRi9ITUZUSWZZT3RqSll6VkpqUE5rby9sci80dVZC?=
 =?utf-8?B?OUxROXlsRG1jazk2R00wazU3anBPS1BDbENXZ2NGZTlFOUJ3VXErUlYxMVA2?=
 =?utf-8?B?M1hZMkEyd3ByU1ozQS8zWjdNOHRaWHdkWHhDZTJRRFFRUmhvWVllQmlpYTZN?=
 =?utf-8?B?c1pGaTB3aVB3ODlVcWlxRzV6bnFWSEs4VzA2ZldDVmxYRHhlNFcxTDBGNHlt?=
 =?utf-8?B?Ym5PRlQ0VDBjOEVTbTE3bk5zcmlQdEdxb2tUM3VkN1JEVUNndjhUQk8rc3ps?=
 =?utf-8?B?aVR4aVpRMDVJbWlqTVdWV09lTHUyazhlVUdCU2VKQmV5M0s4S0p3ZXZjTjZQ?=
 =?utf-8?B?SWpSUklaS2t6VUwrTzJ1MnBzc1REU1hKV3dMOEVrNWdlMDJnOURtSGpiVlR3?=
 =?utf-8?B?bWhjZzdpbXd6TWNWTG16UFM1M2haUmxES05sTmNUT0FqbUdpZjNtWWcwcUxW?=
 =?utf-8?B?RTdBd2R6bExVVFlhZ3FiQWVNdnR5UGRJZjdUcy9kVDA4OFVtZmEzamgxbzVX?=
 =?utf-8?B?cDYrQUwrSmtQd2M1OFVvVEpDbU1BT3hHMW1DSjJGMjU0QlhhWGt4bkthbHEy?=
 =?utf-8?B?WXM5L0huMXNYcFR1K01SRTUzYklTN2NjVGh2YzNEVVNORUhhUzJmaFRxc05V?=
 =?utf-8?B?aFhjSzdWWUM0UjFuN3E3RTMrL0NlNCs4YUNUQUNvZVZaNUtKWHp0V3RjSkw1?=
 =?utf-8?B?TG1BdVlDbVRYTC9jWFN3TUNaNHU3M2MrOTBxRStLdE5qL0M4ZmtaZXNuVjRi?=
 =?utf-8?B?TTluampGT25QcXRkWUpEYy95V1pkVTBlYU5tT2hDVG1VaThMaWUyVWg4OXVG?=
 =?utf-8?B?cVNVdHAxc3FMZTAxWmRrQUhwU0F5S3dRTFQ4VzFjalMwdUF2TzdQU1NhTHN5?=
 =?utf-8?B?MUhtRFlmQncrYnpWZ1dxT3dCZldCZEsvdXExVlpONys5YUp6U2l1ODlrZHlt?=
 =?utf-8?B?bnlwQStaVDRld2VzdFJzQkpQYklFaHZnVFpGWDJqcUNWeGUrcmQzRkVsUVd2?=
 =?utf-8?B?QWdOOWRSbC9GbjJ0dXRaRjJqR3Z6d0Q0bzhqVlc0TDJCQWUwM28rNnExOHZB?=
 =?utf-8?B?NGhHTjM2bVNGdllFRHdGU0tIWkNXN2IyZmJPUlFLUW05T0tiR2hwUGZFT2VG?=
 =?utf-8?B?akFYQzd3MFJjcDBxT2xsbWhJNktxV3lScXcvT0lyNnZkRW5WNmRERk9IUVhE?=
 =?utf-8?B?OURYUjFJV21kbGVuci9nVGkxNktpM2xnR0RtYzdZVHJBODl4eW0vWVRZcS9W?=
 =?utf-8?B?QzRyUENkRExSN0o0bDNlVDcva1pka1VoaU9YdklHQjdJSWoyVTNWMUVCaUl4?=
 =?utf-8?B?NmZDTW9SaHQvMkVsWS95M2IranNtSnNuL0xJQUtWNndNaU9WYUdnSDZoWnVH?=
 =?utf-8?B?WWs4WENYbTdyYktETGFhT2JZK0xoN25FN05JWk1pdDFaclRIM0FtV2ZaSVEy?=
 =?utf-8?B?UGlYT29Jd3U1ZVVydHV4V0VLSDRnUkNiS3NXUi91RzluekJuOXlLU3ZKNC9K?=
 =?utf-8?B?clhndkNZVmV6Q2t0ckhFcGs5YjhRWVRTbDI1Q2twWXVDaTRqUEM5T05lVWd6?=
 =?utf-8?Q?lesN+lu6zkBFtqoIUbVhZB7fcEfMMaiqGBN27O+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1affd31-d839-4eb6-cb83-08d92caaa229
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:29:22.7441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdgOHHpIp1YsCOi+1Q/lWWhUWMrjdWdrTQz06+QSF0oHLi0eyVwvEjiansaag3TnYGNEWjd+opsSEareCXcsoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
X-Proofpoint-GUID: Oo0nYrMuhn5I4o3QktGwbqpFWuT0U9C9
X-Proofpoint-ORIG-GUID: zL8x1Bqdj82idIea7tgLr72HY0gnd-vb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-11_01:2021-06-11,2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110047
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 9/25/20 3:05 PM, hongxu wrote:
> It failed to call uuidd
> ...
> root@qemux86-64:~# uuidd
> uuidd: cannot open /run/uuidd/uuidd.pid: No such file or directory
> ...
> 
> Create volatile dir /run/uuidd for both of systemd and sysvinit system
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../util-linux/util-linux_2.36.bb             | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
> index 2ad00ff0a5..3762308c38 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.36.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
> @@ -151,6 +151,11 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
>   FILES_${PN}-mount = "${sysconfdir}/default/mountall"
>   FILES_${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
>   FILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
> +FILES_${PN}-uuidd = " \
> +    /etc/tmpfiles.d/uuidd.conf \
> +    /etc/default/volatiles/99_uuidd \
> +"
> +
>   CONFFILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
>   FILES_${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
>                             ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
> @@ -179,6 +184,12 @@ SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
>   SYSTEMD_SERVICE_${PN}-fstrim = "fstrim.timer fstrim.service"
>   SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
>   
> +pkg_postinst_${PN}-uuidd() {
> +	if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
> +		${sysconfdir}/init.d/populate-volatile.sh update
> +	fi
> +}
> +
>   do_install () {
>   	# with ccache the timestamps on compiled files may
>   	# end up earlier than on their inputs, this allows
> @@ -226,6 +237,16 @@ do_install_append_class-target () {
>   		# and thus prevents the operation.
>   		ln -s su ${D}${sysconfdir}/pam.d/su-l
>   	fi
> +
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +		install -d ${D}${sysconfdir}/tmpfiles.d
> +		echo "d /run/uuidd 0755 root root - -" > ${D}${sysconfdir}/tmpfiles.d/uuidd.conf
> +	fi
> +
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +		install -d ${D}${sysconfdir}/default/volatiles
> +		echo "d root root 0755 /run/uuidd none" > ${D}${sysconfdir}/default/volatiles/99_uuidd
> +	fi
>   }
>   # nologin causes a conflict with shadow-native
>   # kill causes a conflict with coreutils-native (if ${bindir}==${base_bindir})
> 
> 
> 
> 
> 
