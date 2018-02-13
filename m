Return-Path: <Martin.Hundeboll@prevas.se>
X-Greylist: delayed 21558 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Feb 2018 16:55:21 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0113.outbound.protection.outlook.com [104.47.2.113])
	by mail.openembedded.org (Postfix) with ESMTP id 83FB578267
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jFr76TjfdMT7MWAvgh4Pvq+JF+NPbu0+6+ikVFaknnY=;
	b=SoHS94CIodVsi9wCcSbRRzO+30mTLaj5V01p61QLJnJKylcUCbym1z79tt6UI4ad4PJs2/c0pv5TdMJfq0aE0y8F2Y4cgQhzANPwJunai2+fp38I3RH+C/j2vb39ADtO7RzOBHjTpYtYO4aoTco5q6lOcxI/fpHB9ttCZQJx5Gs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.16.11.15] (81.216.59.226) by
	DB5PR10MB0120.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:0:15::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.485.10;
	Tue, 13 Feb 2018 06:21:45 +0000
To: OE-core <openembedded-core@lists.openembedded.org>
References: <20180205122544.27223-1-mnhu@prevas.dk>
	<20180205122544.27223-2-mnhu@prevas.dk>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <c2ec0a5f-8e88-ba01-97e2-e802eae874b3@prevas.dk>
Date: Tue, 13 Feb 2018 07:21:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180205122544.27223-2-mnhu@prevas.dk>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: AM5PR0202CA0011.eurprd02.prod.outlook.com
	(2603:10a6:203:69::21) To DB5PR10MB0120.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:0:15::27)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c859422f-2bba-49d5-f886-08d572aa0e5a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4604075)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603307)(7153060)(7193020);
	SRVR:DB5PR10MB0120; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0120;
	3:Y0JM3mlCS2OphMyG5Bn7lxKsXkviYO/qIlO4vK0sacj6mjsV/bX4LFsau0PfevHfKYo1ACGA+cTCqmZffOrcYdhuS7dC8MHjFX1dPnmCNubTf+c4mqd0TgvG+J8NkDsBbf4EQHO4nwQZQy25GIVJsYxcMZj8DYygSPuc5fWQrN8t7qL0aOoBLAwlvJn5Wd0Q7PeN331dAxLjXhCxkOgUJDfZ/nfevJYsT+b0YoAvTHvlzorvlRGeoHwJwhM9XX9f;
	25:0USRswXRt2KEMDfPwxwbTCDz0RCHogmK3BKjJKG9NJpnnQWdE6LqeeeMOtZMR8lMbcZaMWn8qxwCUKrSpJ/SZeG1yms0v71D9R0sWUndV4Nn/yLUDiYiWJ8NKGU3q2KPEehW1ptBswaj+1K8dl8ihFQE5U0hEtEHBQG3P4iKE0qinNSB9X9u0DdUv+v/Di5r2u4tQ2xMWB8nRuL1Sn38z3pXOqtPypYHAzu/KjesxccmhvXMR9VPTpjlcvV+6gUKpELfUPwSX6us/fvuATHSxvifYUAtLGeNZb7zHoO3zFgpFBOKGoNmUFZiEtxKThKk5lFaSc4INDSYhEso9wb3qw==;
	31:mdjrwckYBWuFUpJJ6nF89I0KuqsB+uf9IWlUYPzPimWN82xcl/vuR8IfPpI32mPFuJ+Irg7T2zW98vRLuQsPT5NcQc6AOeMlmHmBZI+J4mTauhkF4JgAo2r/UhBcaHm1GqlU+zA6bvqqpTXsyjC8wt2Bg6wQ3h/Km24SSYyE/4rzsEUg1C4cjv/xtjkGCp2MyFRn6rpGl+9Kn0a4JmZWRlFYROH673f6jGZb9mlmL8g=
X-MS-TrafficTypeDiagnostic: DB5PR10MB0120:
X-Microsoft-Antispam-PRVS: <DB5PR10MB012094E39037613C878FA3679DF60@DB5PR10MB0120.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(93006095)(3231101)(944501161)(3002001)(10201501046)(6041288)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(2016111802025)(6043046)(6072148)(201708071742011);
	SRVR:DB5PR10MB0120; BCL:0; PCL:0; RULEID:; SRVR:DB5PR10MB0120; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0120;
	4:3W69vMlZzeGttqpoiFkeYAZVzGl1r5ZFhCoaMU50LUUxjRn0+VdEYkO6/j62XSZX2aPziSrzvuwiYPT0kd7oFMCetvvMI7nIFIT6alJm0z5K8wkcZDwkNvKj8+7R//XNzLaqL1OzKgnyXV5BXAnZtnRbGyLtAhksJcN7P2nYmePgw/hAaeNydJ84dB6iq1W0RITM+vRD9KR2lh5ufXIw54hDXrtyyM7WGkbx7c2IpPYLi1kJOhdYZeGW7slgvIDD/HCbGnCcDbYQwRmZ8ZWeJA==
X-Forefront-PRVS: 0582641F53
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(346002)(39850400004)(396003)(376002)(39380400002)(366004)(377424004)(199004)(189003)(65826007)(5660300001)(53936002)(47776003)(8976002)(65956001)(65806001)(66066001)(8936002)(8676002)(81166006)(81156014)(4326008)(386003)(25786009)(229853002)(6486002)(53546011)(59450400001)(6916009)(76176011)(478600001)(77096007)(72206003)(26005)(2950100002)(6666003)(16526019)(186003)(42882006)(6246003)(97736004)(105586002)(74482002)(3846002)(305945005)(6116002)(7736002)(52146003)(23676004)(2486003)(52116002)(16576012)(58126008)(316002)(83506002)(67846002)(50466002)(64126003)(68736007)(106356001)(2906002)(31686004)(36756003)(31696002)(2870700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR10MB0120; H:[172.16.11.15];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjVQUjEwTUIwMTIwOzIzOmdkTUlsbU5wU3NvWkNVRVRzcFZadWpJKytz?=
	=?utf-8?B?UU13MW8rRVJYVlRXVm1YcWxMK1U0OEZRZ1grK3hoNzhvaEJxbU43Vjd0d21y?=
	=?utf-8?B?U3NKYzdSYnkyNGp4NmZjVHNRRUg2YUZSdENmZmhCcUkvemZQYXFYNFlIWlk1?=
	=?utf-8?B?ZXdQMDRhTkR2dWdPVWhBVUwzNENHNlFZZ1JJSVpqVUxZTkRuVnkwandtaHA2?=
	=?utf-8?B?OHd4eE80UjE1Yjd3QkM5aFZYYXFYQ1RjeGxJYXZtejRjZW93c1lrRXlqWVhh?=
	=?utf-8?B?ZmQwamtCbWpXM0FkY1ljRHFhMVd1dWJDU2RrYW51dHpDbkk1YmZxMzBxQTNa?=
	=?utf-8?B?bXVwTGRSN0h0dlRUZVFpdUNvbVE3TWRZeWk2NGFHeXZMVURKdXdBR1NuRU9u?=
	=?utf-8?B?Q1dMWUNISFpINkhaZ0FDcU1JZGY2MEZveXZCbUxkaVpuWk9tRzh1SnZsSWpI?=
	=?utf-8?B?eWxnL2VKcmR4ZCtBejJSRVJpVzIrNFZvLzAvU1BURkUxWTVwUjBPZkMxbXgy?=
	=?utf-8?B?SzFHM1hxZFg0bmtuc001MklGV0lPNFRLYkxCR3JRRmQ5L2dzN0dFbTBMeE5h?=
	=?utf-8?B?R1JaNiswdXRMMkF2U1FaVHVkSUNqaUNRTXRxNU5xKzhyU3NJdnlZQVBNckc5?=
	=?utf-8?B?WkpqN1I5dEQwb3NwYkZYU3J5Ym9YOVkybE1WV0NOeHl5ZUpEY2NzK0V3NWdx?=
	=?utf-8?B?bTYrR3dPM1ZoTHpvOGE1ZGVOWWZ6UTlZcG1oTmpxT2sxQnVtMlg3ckFkd3Jz?=
	=?utf-8?B?SXE0TkRxZUYzS0VXVTlQbHZpaVpnWm5WYlgxMndKVFJETlorWXJ2MWMzZFZ4?=
	=?utf-8?B?MjBpbDVKTGYySFJSeGp3blgzbHJYNGtaUGdYeHJ1b0tQbC9QOGgwMGNPRU1D?=
	=?utf-8?B?UHRvV3JwYjdxT0I0QkdmZkxEUkd5KytQYldvUmdVejk4eFhYZXVvQ2k3WDBS?=
	=?utf-8?B?M0FmOTYvR3NaMnlFM1VMYm5KNjAwa1hnOWc4d2JFM1Rkak82RExGSWZwMk96?=
	=?utf-8?B?MEtkMDM4cDNNYmRDN3pFOEd5UHgyNUNhSEo5MHRMbkRqcURjdkZaVHhGWmZ3?=
	=?utf-8?B?MzkzM2l2cnltci9qWG92am5YbDNTOTVSL245VjZCQzJrTjFWMkY4Zkw2cS9V?=
	=?utf-8?B?U1lHTnFkMHY1OEZENEw2SjdYcHFhOXBkREV5MUpHVkd4QnZDWmlRcnJJY2xz?=
	=?utf-8?B?M0phWUZZMUNUZFNMNU5PL1ppcEpRNTFjaTVvYllSRTd2Q1JhMEJsL3FEMWtF?=
	=?utf-8?B?Y3dhNmV4VWRQMTZ6eTNWS2lRQ1NTdDJySElua2prQmYvTDZXMEYyZnQxSC9P?=
	=?utf-8?B?UWdVWXlMZWNrNW5pa2NCY3M5emIxa1BMTFJMRUFNTG1wYkw5b0RBSHl0elBk?=
	=?utf-8?B?WDhZajFSeDNNZGFDTllRWnE0dTB4RWRLd0NBbFM1YnUxdzdnK1RFVzVpclFI?=
	=?utf-8?B?d3BaallXbUVPNndUYVZhMmlkeDNGWHozVndjZTl4Z1YwODA5TXBndHk4Vk9B?=
	=?utf-8?B?czg3UlE4ckJ6OGpWOTRESHZVZkZGa0VFa25qT3ZSVjlnOGNLVVltSGxlTXNj?=
	=?utf-8?B?R1VidjZyWXpSUHdQKytYd0RMNHByVjNxdWVlTHFUVjh4MUJwNk02MWtpc3ZY?=
	=?utf-8?B?bGhRQ3JLOEVRQVY4U2lVWlhJTVgzNFcxNGRmVldmSkFkM3dDWnFVOUxTV3dU?=
	=?utf-8?B?M2V4QmJ3R2ZGTUlkM3Iwb0tnS0hyM0lvZysrY2gzcndNVUQzQkFyYWg0VjBk?=
	=?utf-8?B?SnkyQ1J2U2xnZ0Jxc1RZQlZhN0tLUGhwRXZyWVJLY3g3SjVZSnQvV215MC9q?=
	=?utf-8?B?dHZBK2Jab3kwR3dtRE5ndlZQZ1Z6UVBHVStOVHRNaU14NXR6RzZxY3RGV3Jp?=
	=?utf-8?B?YUJ1RGw3dHJrLzJMNXpKUWlPaGNWcDMwTG94OWpyV29TVWgrKzdsNVJjTVg3?=
	=?utf-8?B?Zk5JS3Fua0p5VzR6RnNyTmEwaUxtcjJlZVRGcGp2K3hSSjBPYVVPTUdxWEhP?=
	=?utf-8?B?OWMyODVhaXdrc3Ryb0t5RUx2R3BUbWtZS2N1Zz09?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0120;
	6:/g3UdEuZ/bT1W9pvP19qT73866eeKc3D+lGKGUlXLfuiA32pdt6xFU2xx9XlaSfZOntqUHdHkFVar62TpxCJ9GUwbAAym4LrykssQyNDdG17EzPRaMLu8rn/lKIS8/Yl2Io951+pPkIsr8i3e1AJjj1zxg7druizEu/xbXfUCXIm5CyS9Wj8QxsnKf2eKm9XLusk/nbkrcmBkY7Qj5ild6Uw4u1cLA7gVBdaW7tKjRrWs+VWziSDYCSyR/MxIhBWXdYGvqS3LgJUw6ycahpZw1WsDSodmTqpLkWoehxMKYNFNoaYnM8ETDmVhqhBqYpKp+XeYbhgwGCOtLv25a+MeJWZV382s+XfeJODjj2n9TM=;
	5:Y3aJeI1l7Zup5oZsFUJ4hQhdc9RKRhBUE98s9K7to4jFQOeFyM7qU67+0Fus8zZi7LkI+TvZlQ9evQmRCsvmikrj1ys/aqmQPObfpVfkUG84OiQBAGxVtFgVgMEiqM5NS+my15uSnnpEWq8v53X9jc/Cj0RUyj99BK15517gti0=;
	24:bBDLIWMOkwScKE63UhPwY6ykCXoQbOX24pDjLMEaXnyJsoKgiMb/48H/Uy16S1wdIqMH4vOhPm+Te3+txiv6cBCSfzGvEJsYgBC9+M8FgTM=;
	7:m9WRM7gmTjzPjPSUn/q6AyaDA0V8Ixd0hoyMcTRdPh9C6+p/dhaQZM1/fTn6LBUK1RUNh/Nbi+DZTOhgw0gn5nMpU2jqAKgHboc43ShUKNCaEgRC3KdMADi3/ShuOuH2t33SJYHJ+ytWsg3gqYYGLqjh3na/Gz6TduRkXx8jTiScR/IA3+iCmmaO2ZIDRkWP1RQGrRVXRmyjVszMvq+QvD4CYDprfT+shNKw3BPDGXTqoKIqZSMPqSBZ8VZpFWfv
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2018 06:21:45.0986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c859422f-2bba-49d5-f886-08d572aa0e5a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB0120
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH] bind: add packageconfig for python-support
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
X-List-Received-Date: Tue, 13 Feb 2018 16:55:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Ping

On 2018-02-05 13:25, Martin Hundebøll wrote:
> Break the hard runtime dependency on python3-core by adding a
> (default-on) packageconfig option for python.
> 
> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
> ---
>   meta/recipes-connectivity/bind/bind_9.10.6.bb | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
> index 8b8835ba80..2ec7ab44f0 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
> @@ -38,16 +38,19 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
>                    --with-openssl=${STAGING_LIBDIR}/.. \
>                  "
>   
> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
> +inherit autotools update-rc.d systemd useradd pkgconfig
>   
>   export PYTHON_SITEPACKAGES_DIR
>   
>   # PACKAGECONFIGs readline and libedit should NOT be set at same time
> -PACKAGECONFIG ?= "readline"
> +PACKAGECONFIG ?= "readline python"
>   PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
>   PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>   PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>   PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
> +PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3-core,python3-core"
> +
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
>   
>   USERADD_PACKAGES = "${PN}"
>   USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
> @@ -60,7 +63,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
>   
>   PARALLEL_MAKE = ""
>   
> -RDEPENDS_${PN} = "python3-core"
>   RDEPENDS_${PN}-dev = ""
>   
>   PACKAGE_BEFORE_PN += "${PN}-utils"
> @@ -88,7 +90,11 @@ do_install_append() {
>   	install -d "${D}${sysconfdir}/init.d"
>   	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>   	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
> -	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
> +
> +	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
> +		sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
> +			${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
> +	fi
>   
>   	# Install systemd related files
>   	install -d ${D}${sbindir}
> 

