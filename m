Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0082.outbound.protection.outlook.com [104.47.38.82])
	by mail.openembedded.org (Postfix) with ESMTP id 5B66D78545
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 01:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XteKX64OhhTdclJkNrBP1JJduc/mNgIfy7MQDU0uJxs=;
	b=Gc6Sn/fu62X3KMTQncO0EuUoDEWVH+/BRtXxz9OGc6swRgm0N29kAkS/nOjdKQi+jubUgwPkVt1jLtmr54U0qLANLwRgRSbQ+TC1s2GrTJMZGnx9Kglx+AO9TtpHQzzBizHSGxC1XkJ7NfEi86aSjA4Oy3p21CMzBX+Jfyknx/0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Fri, 10 Nov 2017 01:01:13 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171016163143.22844-1-mkelly@xevo.com>
	<2eb1113b-b6c7-d4a4-5908-bf9ea2684513@xevo.com>
	<CAJTo0LanJvP1g4SgKmh8dx-z4Y0qRJ9O6dk92OSJCoF_wLreiQ@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <1848f713-8adf-1075-aa9c-db549bb89b33@xevo.com>
Date: Thu, 9 Nov 2017 17:01:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LanJvP1g4SgKmh8dx-z4Y0qRJ9O6dk92OSJCoF_wLreiQ@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR1001CA0011.namprd10.prod.outlook.com (10.174.165.24)
	To MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb2f51d0-7706-484d-3009-08d527d68a2a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR0101MB2943; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	3:VVpWnSq0zL2Mc5dmUO0/Y7I7zUTODxvtp7UaI9yoa/t35p8sh/sfyL+Rtagyrv/msb//k7tnipsVcCk9nMrc4H2dTpyFewde+WRA8jcepnHLnqKxu6qlKOhF0s3xPmPpPSICYhwZuU60zgs3v5BveBiO4wQpyrN1wh9f0LtB/pTHXZBex/5hvN5NY+88Wi8R3BAfDrjBLoBGCRHXHsJ5hSlOrwkWfSOPB1uwDe5r9FXawd4emMnAf1NbWX8Qh7dg;
	25:kH2lpUZw5LlAkhFStTOPhQ/o0gabEhNVieWDjpHq09YangjuNehgOkeYcXioEtjBX7pi56EME6HbZ+z1OeqkLlPxnsbVZasEi7nZr9fg6hKCXUQZg44Wn6jYcdIE+7RSrpZlWkqr8sDEflOFrSF2fKmZQHYMY11OywWDEdGP2QH+j90C1z46htM9yIIRxaR9resJr/L+2eRaD+L4HWc9j58wdYJJkPDGXsjfyJVJmMEhO0rHljJ4wCawH87v5234QOF+GCDnjtSt8nHM/963PY31+bTkexGLbfwagl4lsYYOQFu2COwdGgUwXnkey8yp2fveOzguCDF/2o5hgYPAWg==;
	31:mRxun1Td6hzFxPz3Yt1AoySER/z5x9WkRrqqraxWzGbJcZ4FNST/pKHie/icTLyqCvNt3KYXGajwFS62zYKLlZaojUmb7t5zX1jeNbDQunJMWvm1X/t9U6J+5vg57GJel2vtLNl2d6tr3gWkT3mBm+uh/uZSjMEvnpZg0s5WMpSLh/TYZ1OogZmultH6jv5sxIneW4LmMNq620Ef9Em3M1E4QD3MhyRcx+mFb+PDmhA=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2943:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	20:1g6ljuMGWzZFpi7M1ZlvcfONsCStShy8jOJ7TBV8WpEQHUzSFEP34dhSUaDoTOznl7PBufDMnSM0NIeYzFQCzgMvycClh/lt612iJJuDV4Y7ZJA3DdkUfASafW6/tdSogFY5wFEp1Zo0TGwIcvKPoKtMGsxgG/Rpj4S6JRC9Z2h6ThydZxreXwTTy7w7mgt5QCVkUGEAPVZ1DDj4QSINZq4BtM487+vRu3C0bfv1JTaa6G+gLSHIDGsKqffEkOwYSo6e3l8wA8Wur7Gspz1bFxpUncuG/bSDc1vcgHECaeMVgs0YNP9tJNKSQ499lkha2IZHcoEpEmSz+mFKW/DBPnmyvCCddAves3HDKvt4scZY6jsYAj1QfvVNCTQEY4HbagwNhqTiPdOHhGHiZGXQrgVTa50xsyQpemkumdeG/Vg=;
	4:YcRZySiHhN/er0dXSfKb6ATzd5RFQESsG02wdN32YxJDzK2F7p0YRk+nYvBYztGikvKacjnT55kLsYe3HSTZuGUvXOO4CvOEnajIysS0dMAsBPkJ0Jcq/GHx2BJwCmJa9PhTCCll89jpxxW7xC3QHVBwS/qDE8xrmYkUot9TEoojK+CGAVZiMgoXJGh6ltMEtnt8zLWsOcZB/4Qfb67gcTVXvjJ1VlGgdPgcn9bDzZPw8ZUzGP21yDTtMbkRNw2mlFdsL7lD5UZ1OQDY5UgfJ3DcrjuYlp7oCS6umj7sTn9aLBpq6O7kU38MYnabuWys
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2943B3FB830BF000BCA9D698AB540@MWHPR0101MB2943.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3231021)(6041248)(20161123558100)(20161123562025)(20161123564025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2943; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2943; 
X-Forefront-PRVS: 0487C0DB7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(376002)(346002)(39830400002)(189002)(199003)(24454002)(2906002)(316002)(50466002)(64126003)(6306002)(81166006)(81156014)(90366009)(8936002)(53546010)(105586002)(8676002)(101416001)(6486002)(77096006)(106356001)(2870700001)(33646002)(305945005)(25786009)(7736002)(1720100001)(36756003)(478600001)(53936002)(76176999)(4326008)(68736007)(966005)(67846002)(23676003)(54356999)(50986999)(6116002)(83506002)(31686004)(16526018)(97736004)(3846002)(65826007)(6666003)(47776003)(65806001)(86362001)(58126008)(31696002)(2950100002)(65956001)(189998001)(16576012)(6246003)(66066001)(5660300001)(229853002)(6916009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2943; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDM7MjM6NWhRYnRuNS91NkNJSXR4Nk44dmhRUWQ3?=
	=?utf-8?B?YlcrWmxwZW1JY2taRTY4QXFmK21LcTlZbmNKcXAzZWxSbFY2TGoyYWpsNXVH?=
	=?utf-8?B?ZFRQa1U3TmtCS0IwRit2KzNWcHRVRVF5STM0SVYzTE5IOHlOSWk2OVoyVEdk?=
	=?utf-8?B?N0dMbmtkbVB1UGlQU1ZPeWRPb1dtZ2x6NVdNRndZRjd6eERBeU9ONlNwRjFS?=
	=?utf-8?B?T0RQWURRbnhoNjBoZFV1Wmh6UzZOWnFFMEs0dk53bUFPY09KWnJveDZra28v?=
	=?utf-8?B?NUZ1ZmZqeFB2Sko5ejJHcG9jOHM1U3Rxd0xaNUt6ZFlGd2FNSnY4UjY2RWtN?=
	=?utf-8?B?SXVpMmhubU1halh4UWZ6WElicFBmRlQ3SjFPd2FBbUx0YXU0RzByVktVL2FW?=
	=?utf-8?B?M0VRNmtxUHc3TS81bmF3b2hQRHR4Lzg2S0NBd1V0ZXhrSGdralF3QU1mL2NH?=
	=?utf-8?B?dFVYY09DT3dpWnQwMjl6bm0vV0IwSURYL3dheGlkVFM0TlBZK2tuVEcyKzZu?=
	=?utf-8?B?WGYwNDBwSlhCb0UvWXVVZGFmY0lpcXBsUllBODBlek5ia1hEdHJYbmVKRm9s?=
	=?utf-8?B?c0pPakhSWkdrRmM1NXlMSUdIUmF3VXVySmhLcURibmN3SnJmZnRzOTR0UUc5?=
	=?utf-8?B?bzE1cHJCUmJSVU1qQ2xXdWczTzB4MDdLSmJLbmxXUnZGOEc5RVVWNDZsT0pk?=
	=?utf-8?B?TXIrTE9sS1lpZG1vclRZa2RlSXJXODBmc1RJakRWcDlsY3ByeDJra3NCRGxJ?=
	=?utf-8?B?TkxLdHF2TWpSQS9YNUhFYlovLzRYdGhVM3BBQlg1ZWdsNGJzZEJSdVgyRHZi?=
	=?utf-8?B?WjNrTW9TTlhSM1I5OTZpOVVQbmIvaHVzNUs5eVZOZHlLZWJ1U2FCbFdIQ09j?=
	=?utf-8?B?aW8xbTlGUlpoQ1VvTWdiNW1hT25KNXcxN0JJY2xlLzNoSWMxdEpKNXJ1RUNq?=
	=?utf-8?B?NnI3ZkE0OGlpRzVQd21ucVZnSXFtRTRVb2owa3I4NVN5Y3AxcTc0c3NQa0Na?=
	=?utf-8?B?R0xRdHF0N3U0dWdHRTlxSkRmNjVIcm8vdVRkYjNURHN6VDc4bDF6T2JJQWpY?=
	=?utf-8?B?cEptcFVRSk5CTTZ3RXZQR1ZrWTFaY2tRS0ppNXRwbjNtMTcxaUQxUjlWR1hM?=
	=?utf-8?B?VndDRlE0TXYrdnNxT0FyMmNvM0RtNXd5L3VpOTdYaU9aTE0xS0pST20xK2dO?=
	=?utf-8?B?M1VyQ21JblBtQ2NYT2h5NlNCb2toYzhmcitXZGtZWWQrR2JpeGswQndUYmVy?=
	=?utf-8?B?eG1EN2Y0OFJ1MTV4VTQ1a0ZuNlA3QW14QkJ5OUhrbFdSK09wcHh6RXI2aGlx?=
	=?utf-8?B?ZGJYdlVOYWpROEd5c2Y4Z2xQRnVBcVM3VFluS094TWMvUTdTZDJFMFE1N0ov?=
	=?utf-8?B?TDdyTzQydDUxZ1hjY0lXOGZra3ZEbk52bmZZM0Rsb2ZsUVFLdXdTSlZHcUJE?=
	=?utf-8?B?eGxIK1JNU1ZqVEUvNm9uczgxaCtkcmJnQ1pEcmFxVk00WFNZV1gyK1ZuT29n?=
	=?utf-8?B?aFRhbDNRMWxiL3d6bUpQN243YktTdUNCU0ljcmZmY3BZMmZIbkpmZkZOWCtt?=
	=?utf-8?B?OVRiN0FsMFlRc3llbEdtQWJ5dFVSK2xIM3VCR21xMWh0Vno2V1Rua3BPdlhR?=
	=?utf-8?B?dHZZc0svcjVseFo4VUhkMFVVZDRyZXg2cnhNMVdxVExZaEZEeUZEOXpubGlh?=
	=?utf-8?B?RFVjeGszWm5QM0V1djU1YnJOdUpwLzZYckFUQ0dBN3dYMFBDMDUyMzZxbEx0?=
	=?utf-8?B?bWdMcHEzOXY1UmpqaGNaUWExZFUwSktWY2xvTStxRkRzUFMvbFhVdEtyaHVa?=
	=?utf-8?B?QWNtVGgzZVlUc2R5YS8za0c5WFVyREpVaG52ekc5UmtKajhTeUprZnZuWDBO?=
	=?utf-8?B?OGlvbE9MWG81SGpVeExPbmFWVzVlT3pHWUhtdE5Cc2dyVXVtWTMxMnFNc1dp?=
	=?utf-8?Q?h1osKW8NqPXMGxsyrPyPoTXUq0oJ7Aos=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	6:QUC2ylPxqv4isfmKY6tbl2QVK3F3/oKkeDksadgTL/a3692YAqVQWF7FDOrVdRjoYNT75dM1DIsfJla1t6IPZjZtrFjn7KRDX3Dps51uGZPcb+S/1biYlsClQ+bhrFLWSXrwEIA4m4H0/3ujtReLx/JZWTqBh+wqUAbDXIynQ9AeVDTB4KkJTg1mM//GIwV340lUGEo2vnMvntNuf9aoEK7O/ovXAqJzSwFPuCrPN04nzu4UvIkQIbCnM3d66DflCVx33AY/8xKLuRMOvw3kAKLHifTA1be3RmHPzDC/IENk5zNAgrlAjj1RMjV5hfzaRPxl3JXI60sdbj3htHcBU1CRiSeAvNelg+STsjxA2+0=;
	5:rP746DyQuz0fbvzRP8GLbngCvQnn7JxuUGBn9mA7owv2SZ+xgaM6cekDhxJR6PKXgpTREpS2GsPnmP/Qtm8WwwlGJMs39yGHl5c99Cjd16Qh22+MMRpWBj6qd6B1StULdbWtIDYqum+MvQ2Znsp2XvurIMbZL0YSnKgKuxXyluc=;
	24:+4NOF5nROHpQhk1IoyV+zRuob90NvKu1anS/paRuWA9C2cEj/ucxI3ZklDoYCjo9AvnHmGjoRfMbsrXNdqud5TDIVXUSasB6mWdgNun6S2A=;
	7:ywkfy6dqehzKdSyGVc3ofM3eA6Ul8Vm992I0Ae2jq5SHT/td5j0Z5IuPdOXhMUEecDCFlghkqyLk4V3a62l5Ypy10g9JxXV6ONQqoJ1vyKL7Rt14jVZydxYjPiHzRbvEm+GZYNgFNWruvpip2P6wo2Intach15UIKYPskZx3XuLrTMeGQPS63CzARJxmiQJrukRpNDDUfC/GFlVdSCoP5DVdsQ+7h8eZYj47OTeX1sftLroJRDJf75upndBDZAvS
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2017 01:01:13.6985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2f51d0-7706-484d-3009-08d527d68a2a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2943
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemctl-native: add target.wants to target regex
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
X-List-Received-Date: Fri, 10 Nov 2017 01:01:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Got it, thanks. My patch *should* just convert runtime failures into 
compile-time failures, but it looks like we're seeing actual runtime 
failures, so I'll try to figure out what happened.

On 11/08/2017 12:31 PM, Burton, Ross wrote:
> Thanks for reminding me.  :)
> 
> 1/2 is queued but 2/2 was implicated in a number of systemd-related boot 
> failures on the autobuilder 
> (https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/553).
> 
> I've not yet got around to looking at exactly what sanity test 5 and 7 
> do to trigger this.
> 
> Ross
> 
> On 8 November 2017 at 17:40, Martin Kelly <mkelly@xevo.com 
> <mailto:mkelly@xevo.com>> wrote:
> 
>     (ping) for this patch series.
> 
>     On 10/16/2017 09:31 AM, Martin Kelly wrote:
> 
>         The regex for acceptable systemd WantedBy/RequiredBy targets
>         does not include
>         target.wants, so a line like this:
> 
>         WantedBy=multi-user.target.wants
> 
>         gets silently ignored, even though it works fine on a real system.
> 
>         Signed-off-by: Martin Kelly <mkelly@xevo.com
>         <mailto:mkelly@xevo.com>>
>         ---
>            meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
>            1 file changed, 1 insertion(+), 1 deletion(-)
> 
>         diff --git
>         a/meta/recipes-core/systemd/systemd-systemctl/systemctl
>         b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>         index efad14ce17..6e5a1b7181 100755
>         --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
>         +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>         @@ -108,7 +108,7 @@ for service in $services; do
>                  # If any new unit types are added to systemd they
>         should be added
>                  # to this regular expression.
>         -     
>           unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|path\|timer\|snapshot\)\s*$'
>         +     
>           unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|target\.wants\|path\|timer\|snapshot\)\s*$'
>                  if [ "$action" = "preset" ]; then
>                          action=`egrep -sh  $service
>         $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
>                          if [ -z "$action" ]; then
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 

