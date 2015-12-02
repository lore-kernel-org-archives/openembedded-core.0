Return-Path: <alejandro.delcastillo@ni.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0114.outbound.protection.outlook.com [65.55.169.114])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC5B60589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 23:16:54 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.2.33.36] (130.164.62.82) by
	BN1PR04MB841.namprd04.prod.outlook.com (10.255.203.141) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Wed, 2 Dec 2015 23:16:53 +0000
Message-ID: <565F7BCE.2070203@ni.com>
Date: Wed, 2 Dec 2015 17:16:30 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Vladimir Zapolskiy <vz@mleia.com>
References: <1449031718-3786-1-git-send-email-vz@mleia.com>
	<CAJTo0Lbzvbwc34aXEMgfUJGnANMzaB+4ecM1=sa=8KONeTJukw@mail.gmail.com>
In-Reply-To: <CAJTo0Lbzvbwc34aXEMgfUJGnANMzaB+4ecM1=sa=8KONeTJukw@mail.gmail.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: BY1PR15CA0010.namprd15.prod.outlook.com (25.162.17.148) To
	BN1PR04MB841.namprd04.prod.outlook.com (10.255.203.141)
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB841;
	2:BSUgzRk59OOYPeT0jPQJnq6K3SLbviy1tl6lCWa6ak055Vebiw+6dNuQBYBXE54J81sR5Pgpq2TMswKkJ6CfdReQcJjNqpfb0ra/GwF5wJBwno3EE1gy84ha/Bh8vDfdxBYuZ1dPjzlVVv0+ssiBhA==;
	3:0KrLgm3IRLRBrKHWopcqK2Fvv2jMHTCz7hYqW3TY+UYSHmv+LjkAymMY2nILYJeaOp9ONufO9LrjeoW/XD6ZpoMNhtwa+0i3TL8uBd22XadT5Met318fDo7mBscS3vby;
	25:0oy84j4QF5ELsi3bNRHUoiSrkaTqWIoEFkF6L3UOLaDxWFlZUer9sBdFN9UM5fvVEken2sMCaclMSksPmn3AjFUu2pdsUTGs0dp8DpdF5nSxmrGXdjgAnBahpEWXu8MXnpQTXMJ4HQ7eOoLUiDT/7Qj0GqXORPsntgNAtVacfwt5KcV1wMJvSB5QgVtWtvEPtXfBlar2emmFsHV5rmgt6OYiKkV+U1tUOlbGY9To00/XvZlE5Km1+w79jgwt6dlE
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR04MB841;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB841;
	20:/KBYTl0WH8WI9l1PRRufzI22HMURXyKBSzeBTU/FAi40xtCy7QMEU1pjE7GWGNLD3HeuFGL+oqKAKS+dHxqMm7KYWk/thlYDhfwsamlpJw1t5+Syq6Aj4YSt26FxM6zS+uiPjmIf5tDqP4YaoOA0iQ4c+RztHOFS2kRa+Nysx8jKRwvtXIFMhpBhpxfn5BUi99Yln6h2qqDtB3/oKAhpW+2Yr066bs5cbN+Pnq0xJizsjGshUQ9oRPFmfOEsqaAlzB3eJ6AnoV+wnoDqFb5JUzECl0I/b38XgyUBY0mVVyhaY9e3Sa14ogGrjgm/s/Nl03thji6p+X24Jg8XSx5KqtJ2I1FonOhInl98zAQT+xZuNrBdAxWZfrxDONX3i+g+guebLMTBwUJQAh+NK2OjgF07L4e9BolZBr1qkAUhqSifxM38RxNS1Yq3BDick812CWsHX82t2BOHNkztFBcCmDIUvnvNLa0ToyL2fmmeLLhEUzIs3kFPpPuupwE161ooPguR9lYx+0gnB9qyrRZ2TtXsraCdRlVxUGYjh0ykmzRsVrqEqBfqJKW2TEaSQ6Peir79EqtTaRJ+fpQ9Nr8zBXRfTbatO8sjJdoVEdtT6Vs=
X-Microsoft-Antispam-PRVS: <BN1PR04MB841A6A1538364E2137CB542860E0@BN1PR04MB841.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046);
	SRVR:BN1PR04MB841; BCL:0; PCL:0; RULEID:; SRVR:BN1PR04MB841; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB841;
	4:CHRK/KnazDHq+ay5TvI7Bo+YUHqFxp7aUMiNKrmVgaXTjsDvJCRyVDwW5ebkhW5Wj2nqSZ8IepzmD8DNyrX4KyHxzmTYdo4dgPMLN251aC3MP5U2Uc72rik9krTvGskSxzlFej4w8+XfbvebMXu8pCeo1EqLPy1kwOSpCcF6CgOWd6VYCuVFHcxMNb7GROFGtBKBXqgjvPL1W+RIq3baYvQ886NLTCpr0KrHjCKLv5e9FDvZ5KXW3I/gp5Xc8VNE/TWDv4pnzaTcXmX0DWcml3gv8owlLDlTIPk3EKnNDEzJP/m4QE7GsKc0mC+/+UzRj0+4Zpreaurd5T1GVHiNpP9h7SPAGaVQCU90DPrN5j2yeEC8C1K+QTCGJ83Ms6x6
X-Forefront-PRVS: 077884B8B5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(6009001)(189002)(199003)(24454002)(377454003)(479174004)(122386002)(586003)(87976001)(3846002)(65956001)(50466002)(66066001)(65806001)(47776003)(83506001)(59896002)(40100003)(6116002)(5008740100001)(50986999)(2950100001)(92566002)(42186005)(77096005)(230700001)(1096002)(5001960100002)(19580405001)(86362001)(80316001)(19580395003)(5004730100002)(189998001)(4001350100001)(36756003)(33656002)(101416001)(81156007)(106356001)(97736004)(5001770100001)(105586002)(76176999)(54356999)(65816999)(23746002)(87266999)(64126003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR04MB841; H:[10.2.33.36];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN1PR04MB841;
	23:HPWgGgdnD3jFADnf0Fr1IZAynELzRBwK+ERGdK?=
	=?Windows-1252?Q?XV7HwHRuLUd8kZsZBC1tNq/kT2meQM0Qe8u1vnS5M1TwH7a351kSx9my?=
	=?Windows-1252?Q?EzdzS4byWuQ9JwOOkRyTChQgHMTyWbxEdOvpC0mt9/P/HCoHe8yODj0l?=
	=?Windows-1252?Q?lbfftxvuym/yGJ4JEGdhFruKcWGVKHjhVmWXnk2wvzqNi+tixjT3hEvd?=
	=?Windows-1252?Q?F9b0H1FcZnK7Fbd46vmCUCHiXiFb3Zd2MDRGfhi4GDUs6o0kK3d0qj0f?=
	=?Windows-1252?Q?mHKoUVvjyvJ0YqkYJKL0uHyAfmrYac6TdIlmlH6D8zlWDT635aKhvx5F?=
	=?Windows-1252?Q?muuxpdhm76GxCFAnVQfJsCUTrQZXaNnBfkO47GV2VuxiW8VCHpjscf/Q?=
	=?Windows-1252?Q?zOL/G1/Xe7f9NgLz9iNpYCIen0bkEAQXgWdPZsuhXO/Gj2pJJZho1UNy?=
	=?Windows-1252?Q?NShn2bi0Ruy+wG9xwM0ab55JC2pLcKLjTrhuwrKo1MwSLTSRUerLf7aT?=
	=?Windows-1252?Q?8W2fcmrZ1lmFzay+2nsOdXL1KVW00Y5vwYbsMCGi83o/HOGF5u+2H5Hh?=
	=?Windows-1252?Q?31rI6HJS7UZmz93o3TjTiEFVsmqwfcnyFMjj5Cyfa237WTFQjFhPMd6M?=
	=?Windows-1252?Q?OzgIC7umqmazo3pa2yq87QKkOr5zQtZ8chG745VZmjVvpdW5QbAOXFO8?=
	=?Windows-1252?Q?a4WWEM19YR5Npiesvn1FScOwxtvsiwM1DwT13c7E7Yk18+o8OKYLqnTT?=
	=?Windows-1252?Q?pvtC1xe+CYylfEKWV0+1dz19M756ekxCzRfBQr+de4YNIi+LbQsyceId?=
	=?Windows-1252?Q?AEDQEyOAYoaIImb59WQajCQL4YjwL1vSRWndZdkjMeT6ivkQ7AHeTQjd?=
	=?Windows-1252?Q?XH+4cwq4WQmI7D7GAASw9C4k/StK8UDSn5eaR+6sEvyqIQco/aG+jDzH?=
	=?Windows-1252?Q?dAzNQXohwh2/KSypq19MHjlQUJeKL9s7AApjCUkoVmjVQ1ehgsqz3kU4?=
	=?Windows-1252?Q?K1LlOMvF6hGt3WrRhqYKHfB98zOnANDb8GiQdzVZfG66kyQwAab1tWo4?=
	=?Windows-1252?Q?7sn24bIxRAZx6ifgDjOUzxDFSp039SnAlUn+DC1Tv1RrwZ+EHAX2PzcH?=
	=?Windows-1252?Q?TNQUoEZ8gxXs9fpkZjdtdYPZ9gYv1OwA0v+NsRsG0Euvge6WhvlGVl70?=
	=?Windows-1252?Q?FGxkM06siJ+Lpg1fdjm3faPg5AlLwobwi9xn6Yn+OQgmaxObhmpzcyu0?=
	=?Windows-1252?Q?kteQVYCMAIr57zsldPeAy6yW86r2Nku6ZoDwF+ip+nM3k4W8Rs5GlLBO?=
	=?Windows-1252?Q?CpJbcR6RnxMZ7jORPXWDQIWG52o0vmKXG07Re+CB2fsqIaiVheJrP6se?=
	=?Windows-1252?Q?kR8IMGGYo0NRB4i3ieYK6R0RpyOGmJhw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB841;
	5:cHdwazUy03rKlcoT1roodmnYjoVdE6UT0o/RoZQ09lvVE5QZleyQ/D26ZL+9wUMB6Ij56D3e0wcZVlUZfl3IMKykJr6RTCOeg6K0kB8719280OqqOgrqJ0Tn9eylEWLIQul7M/nAQ0/0gOBuDiV3yw==;
	24:Qbg20S3eRrUUZzZ1dj/F4QzXT4O6ITKnTo90fSF9csBLbqx9fyl1rfc2ex3exLIgoKzD+wgIesSzLPOiCAXbjQxw63MIrWCKHEIpjPDp00k=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2015 23:16:53.1856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR04MB841
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_ipk: allow to specify OPKG_ARGS in local.conf
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
X-List-Received-Date: Wed, 02 Dec 2015 23:16:55 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 12/02/2015 03:48 AM, Burton, Ross wrote:
> 
> On 2 December 2015 at 04:48, Vladimir Zapolskiy <vz@mleia.com
> <mailto:vz@mleia.com>> wrote:
> 
>       sh: /tmp/opkg-5jPLag/run-postinsts-UsUtaI/preinst: /bin/sh: bad
>     interpreter: Permission denied
> 
> 
> Whilst the patch is fine, this is worrying as noexec /tmp shouldn't break opkg. 
> Maybe opkg should be changed to use something in /var for the scripts?

Could you expand on why it's better to use /var instead of /tmp as the default
sandbox location for opkg? I believe dpkg uses /var/lib/ and would like to
understand why that's better (to change opkg, if it makes sense)

-- 
Cheers,

Alejandro

