Return-Path: <alejandro.delcastillo@ni.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0139.outbound.protection.outlook.com [65.55.169.139])
	by mail.openembedded.org (Postfix) with ESMTP id 788D86B6F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 01:04:22 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.2.33.36] (130.164.62.82) by
	BY2PR04MB845.namprd04.prod.outlook.com (10.242.38.140) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Thu, 3 Dec 2015 01:04:21 +0000
Message-ID: <565F94FF.4070503@ni.com>
Date: Wed, 2 Dec 2015 19:03:59 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1449031718-3786-1-git-send-email-vz@mleia.com>
	<CAJTo0Lbzvbwc34aXEMgfUJGnANMzaB+4ecM1=sa=8KONeTJukw@mail.gmail.com>
	<565F7BCE.2070203@ni.com>
	<CAJTo0La8P2oCEAfUeEX9w-+qab_wyRZhPM27FZ6QaORDBM92LQ@mail.gmail.com>
In-Reply-To: <CAJTo0La8P2oCEAfUeEX9w-+qab_wyRZhPM27FZ6QaORDBM92LQ@mail.gmail.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: CY1PR13CA0012.namprd13.prod.outlook.com (25.162.30.150) To
	BY2PR04MB845.namprd04.prod.outlook.com (10.242.38.140)
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB845;
	2:URD+NQCABzpBSTiYZvZ1ID8Vh+p/11+TnL8DD+KFaJfY/vp3Bn9OSetZHM4X1fTzQi3Oyu4L4zOaYUenZRSRE/wpewrrKEJ5Z/497+Ic6b5DASemW+DGnBK/hTd3oB/fZOe3h2OvS7b8f3UE6euq1g==;
	3:UVVZRFIr3rWjOcotSGsMtEd4BNOzVkkoe0iV9EY5RCVLIKJZ33kSYydRw9Ui9r9Ve6U9XxqQyIScB+6vAWFxgnE2izszLpvzlP89o6SMJ+0W9JWA/gOVDi8DxrdiyBfA;
	25:6ufq+aiBlfselqlfKTZLQq1TOam7ToDaWn2G/m223Y2HBopjIQFnpWaJO2auZqrHIqEX/7ge8qOqUYpkf0BcCHBlLAknferC6y3y72qFIPb8t+uan7ctjzikZvCIoNmTITkCrzQD6eu6rk7B3v7cznXfvdSdgVgRAetgfISTxQyZaBtWpJBrR0CREy1IOMac0E7HG42hzX2y7qYvn/NeuCdu6iu30TsJ3myUEn2aIDjJJ2N6qZI7dHZ0USIyqrVs4N32w15AE+sjzqW0j6IDpg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR04MB845;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB845;
	20:tkYm4B0ZR5c9ssccccdH8Ul2QFJy05bE09glWpzZxrCxMgGZPkZQx5sO4XJ362agV4L/qC3Kq0NBpJg0lYmSdILk0gPVEFrsucel3MdAwX8NEpVHy8X6m4SIHIz18GYrepVKwOE+IOv/56MvldykoriJtdIcHPFqBj7f7yD9TrnAQyeHBKvg1f3lA5SHXfzqpyu3kSDN+8N+ZpazcV2j7zx3MTtV+SJEo/bYUmtGrAcLZJpbjEMUGsQV+eDuUB/ca8mGpB9DpPDS/4DygReCvqWqL7RbmvIEyIyDPs4y7A458GHvW0sHMKg4bs3PYSj4SWRuxy0GPqyaboJk+ZwCRT+dPLPkd53/su8WvTOzotYNUmI+0/mdjSzO7FMjyb7U8jn5tmZm28+xYaNh7z1Or/3zv7KF/nU/3pYHRR5hz1vPYDK/Ljp/UUVM0YlVBFKhmP0qpiNVX6BISXjDv2/T1+tr5lyiT+7M+OLZmqXHO/EGVGPE+ht1dhwp9Z5QjFzwr4rliGBGOrWg5Iy0Lj9Dk20Hs4y9/tEIC3cCvHr1tvu/61/31oBZrj5RG+aNjapBLw1Om7iWfJh5+82EaIDNOawhxpSXQzGOD/YjgMvH73g=
X-Microsoft-Antispam-PRVS: <BY2PR04MB84545A942479D445D34C253860D0@BY2PR04MB845.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BY2PR04MB845; BCL:0; PCL:0; RULEID:; SRVR:BY2PR04MB845; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB845;
	4:jilb0CkR/sh1pkXwombFLxmPJ4k8F1vpimPO9QTp4FpS1Qd1Wk4bDeI8hvr2lMzs/BsdhRY+KdI/NYDxj6ulqXsXK0hPvZyHRostuOcGh28WIB7l3EmD8j41N3ibq2s18jXarlvUTVKEkP88OAX5Nc0h3bqE91O6oCQ2J3a2rZv7hGB8NSA/G0INOGuNTcBCQPh4vJ01zb+KN01WxnTa1cKvP32oJXVa9xkm6aMB9OBqxGuwX7q70fk9GRkaxUdlx1sB8fmorx40AoiSxiofPyuOSHHzTREDJz56BW63WRxGuIqahN0iCUWTXHrrDc8qCyrO9y3r7zS9xOJlBKN4RrQ3hwsOuha18h5LX8eTQTbgvGfg2OFx8mj/EEtdfYZY
X-Forefront-PRVS: 077929D941
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(377454003)(189002)(479174004)(24454002)(199003)(86362001)(47776003)(23676002)(50466002)(66066001)(65956001)(65806001)(77096005)(92566002)(3846002)(230700001)(2950100001)(40100003)(122386002)(6116002)(586003)(1096002)(110136002)(5001960100002)(97736004)(4001350100001)(81156007)(189998001)(5008740100001)(54356999)(87266999)(76176999)(50986999)(106356001)(105586002)(65816999)(93886004)(59896002)(33656002)(101416001)(5004730100002)(42186005)(83506001)(80316001)(19580395003)(19580405001)(36756003)(64126003)(87976001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR04MB845; H:[10.2.33.36];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjA0TUI4NDU7MjM6ZE9GNnVsM1dtK0N3TEUyOEs1QUdxYzZlNmUw?=
	=?utf-8?B?UlpNdXVaNy81SGMrend6UVhVSkZsaHYzVHVxU2JGdDc2OHNYSEkzYkl0c2M3?=
	=?utf-8?B?Zm5pUUt6dmxmNHRMNTdyb005Y1JHclh6WUtlRDNmdHlkSEgrUUhkUWw3MVc2?=
	=?utf-8?B?L3l5WHVnOEJzMmpBemhsTUtTbGlKeXpXaDJXem5tZDh4UnBFRzlFc3ViRGw4?=
	=?utf-8?B?UU90eWw4SCtaVVg2VHRiT1YzclBpWWIzZVVhcE9pTXViR3NMU001QWFndU1C?=
	=?utf-8?B?VVdkdnpiSzBwbi9IWXdCcktCSFpVM3JXUm9SZ3ludE1qbG1tSVRKU3dMUnZJ?=
	=?utf-8?B?Vm0xZ1dsZHpjVUY0eG8rekQySy9xRE9xcWw3SVZRNXN3WjVTdFJlOXNYcWlZ?=
	=?utf-8?B?MGxHdG51QUc4NzFkd3N4cXQrbG1xRDNEbHFGWXQ3ZjEvdDBCdzRLWWxQZXVn?=
	=?utf-8?B?WTZ3NVlHclkvaHQ2bzVKOC9tR0JjaDhFZlZoeTdUbTlncFdObmNJS1RyYmZk?=
	=?utf-8?B?Tnd6aytuZ2tlUVM0MHZ6ODNwRnhYeVNQakdzbUZvdGJWTHdCUFZ6OE9CaFBa?=
	=?utf-8?B?Y2ZaNVRHc24yMUF6SFNCT1dDVWF1Rzlzak55SjQwVTNSQkRLUFdRRVZ1eDE0?=
	=?utf-8?B?M2xFcVVkdDRtOEF1Y0lvWFFGZGpBajEvSEI2aFdscWdqTktqQmZxYnR2TGQv?=
	=?utf-8?B?Y1YxVHc4VHZacWxaR3RLMTlSMHZHQ0xuRkpjcVJpcTBrcXIzSElRODNpTkw0?=
	=?utf-8?B?RG9tZUN2V0NmM0JnN0NwSWFlMFJsZkRkV3FreG1xdVJNN0VjRUp2d2l6cjE1?=
	=?utf-8?B?b1JlYjVDcmhnUmhNakN1a3gyak9PSm5qZEtKUXZ5Yi9lQ0FLRHBpa0RTTlEw?=
	=?utf-8?B?dmdiUEVYdlpzOUZQN0ZUcVl5WmVjdXpjWlFQWmNoY1hUdW1FR2J6V2tIRWg5?=
	=?utf-8?B?M0xWOUZJR3NQcW1sWVpRT2ZnaDJxQTVFZTJoYUlqNXBNRzF0RlJrUkVwaFIv?=
	=?utf-8?B?ZDNJaFB4RDFjVWtJRGN0Z2U1S201NVIyc1VLWWhhc09uYlMzOXdmUExQVnl5?=
	=?utf-8?B?WEpmc3pxR3RPdUJrMlRkUG1raGI4NnhZZUxZVEptZG5WcE1XTXNjU3UzR3c1?=
	=?utf-8?B?MUtzemMvK0VWK2JTc2RUaWdKZVBoQURQYkhHalp2UFR1cndWRFFFSGEwVEV6?=
	=?utf-8?B?YklpS1FCQ1cyZDU5V1JhMjB0SWc0Z1RwNzNDa1J2M0FEWnhsNUg1Q2t5UzZ3?=
	=?utf-8?B?RDJVNFp2YjM5SHhrblUzdHhmU2htOVF3a3JPYjJZbUVWb3RkZ0ZNOWtOZzRp?=
	=?utf-8?B?T3NQSXg0b3NlZ2xuaS9xQ2MvV0xhZmhiZkpKMXJ5VlJ4RE56bHBlZ0NDcnZt?=
	=?utf-8?B?Ri93WEphUkdyNXNIREpTK0FWMzBRWllMaGlibGFkRGNJWkQvMjBvT3dQaDI4?=
	=?utf-8?B?ck4vS0FMWlpvenVLRWhlamZHdEI5K1RyZUJJWDVmQUV4RzFGMTNJWkdzOWE2?=
	=?utf-8?B?UVRiRXAwRFQwd3JDVmYzQmRkbG05WWRIYWFIaEhnWHp2MzZUaUlVd2NRcmtw?=
	=?utf-8?B?VTZJRGR6cFBHRWVsTHhuVzFmcG9xZGc2UTVhZEtpdVlVQWtLOEFCTE45Q0xq?=
	=?utf-8?B?TzBCMmNpOWVsc1g0dDZ1dUZzVVE0RjRTWWNCaDNsUUVxcTRrOCtNT2U3OWlY?=
	=?utf-8?B?Rnc0T2l1aVk1OUovRTQvRUxXanFCZzI5RVEzWERmbXZZejEzZmdyK05hWDJ1?=
	=?utf-8?Q?fGS2OtA8t1EUmshmTTASDm5rIfQrAGQ7zobY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB845;
	5:NgE0xIEhPM/GfSB9h8rqz6vYEkhuCtSuAhD8z/Jq91qmQYuo+46WTLDwti3K6rgoefOjLr/tNAan+5Vt2IeoDXum7019HVSFlTk60/AwDAYjWFRf5lMxlqNB93p6IA+ee/Cinaojx2+jTA4LzoLJcA==;
	24:P6cKnzumaTnb/3DHGQ4sNxSNjEzg/D96oP1CKQwQH04s94bTzdlBM1aWKRG/P+J55o64gUg0NAWwLZvP3eRR7G4ihnxUuxqS8Tes6WaaH9U=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2015 01:04:21.5048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR04MB845
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Vladimir Zapolskiy <vz@mleia.com>
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
X-List-Received-Date: Thu, 03 Dec 2015 01:04:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 12/02/2015 05:19 PM, Burton, Ross wrote:
> 
> On 2 December 2015 at 23:16, Alejandro del Castillo
> <alejandro.delcastillo@ni.com <mailto:alejandro.delcastillo@ni.com>> wrote:
> 
>     > Whilst the patch is fine, this is worrying as noexec /tmp shouldn't break opkg.
>     > Maybe opkg should be changed to use something in /var for the scripts?
> 
>     Could you expand on why it's better to use /var instead of /tmp as the default
>     sandbox location for opkg? I believe dpkg uses /var/lib/ and would like to
>     understand why that's better (to change opkg, if it makes sense)
> 
> 
> Well in this case it's fairly common to mount /tmp as noexec on security
> grounds, and to be limited in size (say a small tmpfs), whereas /var generally
> has less restrictions.

I see, common attacks rely on being able to execute commands in /tmp. Do you
mind opening an issue for opkg on bugzilla?

-- 
Cheers,

Alejandro

