Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id D555E78681
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 21:52:00 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vAALoio6003318; Fri, 10 Nov 2017 15:52:00 -0600
Received: from nam01-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam01lp0115.outbound.protection.outlook.com
	[207.46.163.115])
	by mx0b-00010702.pphosted.com with ESMTP id 2e5knk86ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2017 15:51:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QHlkUMN3LGDPfgiVdCo4XNTt+rv8nAQuNPmpNAJqYVw=;
	b=EX5iLBnzQCvh1JfTdprHdOU7m0oZAu/sHZIYO/EFCuXEo9JEzyL6rJo/KvHd0Vs6NeNmEKDdOX30Lz9l/yBOeLI9OLcFONYkI0wUauDTq5n/N8xJa/zgB5tKs2YyC/phKIuQGKMd/2HAKNPy5egLi7k1y6xWshIwcvALYs8beWo=
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	DM5PR04MB0701.namprd04.prod.outlook.com (10.172.187.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.218.12; Fri, 10 Nov 2017 21:51:56 +0000
To: "Wold, Saul" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1500479806.27323.202.camel@intel.com>
	<20171107184039.31164-1-haris.okanovic@ni.com>
	<1510179606.1903.92.camel@intel.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <f65277d0-e056-5181-9cc9-1e78e4e97c6b@ni.com>
Date: Fri, 10 Nov 2017 15:51:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1510179606.1903.92.camel@intel.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: MWHPR21CA0062.namprd21.prod.outlook.com (10.172.93.152) To
	DM5PR04MB0701.namprd04.prod.outlook.com (10.172.187.143)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25c5a6ae-bbfb-4e33-e227-08d5288543ae
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:DM5PR04MB0701; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	3:jzqgqC176BvFgkXYKDfe4VJ72DZJaCMHkQZ886ACYXrqYHMIbaT8eOGN5wLhspIP00ukerosoWbP3IgGnC0Hc22RgpkE2cpyvZruWvD8rwvGHIUPBMGTSJcHwx8kH4GO1c3WEUpLzyb+8J2TSfuGVBMJxqjJSrGR3H9EOW4xQflFb1Ze3LEI9NWNgmVvcB4tPY64ilLbFlalBte93O4I8WPGh5FGM3p0+GXNcwQ89a9KsUT2yyR6OP9nRqFH3mNv;
	25:F5hHhxh3+wcjuK3Z9Erp2ZC93y/wOvXhCsnKupF8tGY11gEzDPHcWHLpw4gtzs0loehSz+u0u4ndjk69FNsUmXflKXeSsEGQTWtVmVgR4rYxtotiurHqzPC0tOVFL7/V/i87cpY+m+Xc6Ej2jzKR2getxek3c8j5BWWEmzU5C8D3y8Oe8nkxv3mHIXZWqRCxSWfIoCwTGfJqu7301qNPYVkIzVotzZ9jJsVzEhHcEy4dlv1+VOKVqvhG77IA1/NSGCDAGfdiCGPLh50p/Pc55i/hUNI6Dzuy7ywR5JIBtiDq1pv8nWXuVkRaiXYOdl8G6OpjF0nsCjw/vvZ1lSvrmA==;
	31:MtOjX3uQZ6Xj7cm7N9YM8P5yQxYen1l0c90Fa2k0hAWIuDQH3RqQ/GnJLTWtmuJB12M/7xtUNewgS5tcEL8mzfsJjnmPDE8GdN2tE3FH8Yv1E3HtCeTQqWWHgjaSp8Z74TbISpdrzJzCy6xhBJ6mKbOM7HDspHt7Oh+ChyUV0vj3GimpW26quvk03nK4428VwW7Qg1TSxkTOt9oiTir3SVoV0Aokt1g5lERPvov1POk=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0701:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	20:TnMMSQWLD/CvRcK2BXo1lg0US4WsyV4lz001uVg1IX8kFGoGPw1fYilEVQBIU/YCfB23F8RBsWGBFLx6tFXpbJ2mhvqqY1q3imuiia7zMK+0OTf2qOIYCP8te77iCubsKOBSewYXPEpn2P4RyPEM1Z12s23mD012kPkB7QV78tNTjAvRv6oGoyyns9CkXwdNiNCWYIi35v8vcLRXF5l9qe/MMV/rO1Jp/bgfa+rn2uns0I9nu3e/u72bxIzany7x3yutwCJGcvvNK9DcvW6qvCC1B/y0j9Lw58oVmCf8m1WrWpac08LSYNPxfwiKfVPKmR+Hq1PgniNd049+PuInNWZI3bmjmahcNGSiWPWuQ9KmSCsdpH2fdW4WWihFt4LQ93sfEBpM05Ce4DPUE8p+itV8C5Ep1z4liisGiBbrJp34oqtb+2TKAvjtUgGBRZkbs5JZy2tlC4HP6eneJmndY3MXCLDscw1ZDJ2Tedrcuzc7IE7VAXUBbZ90g5KJLZaF5xSHUP1mkwB0p2PAOhTYmUEphFqbGpCioFGSbPxIhkh91jMVr2veRI+jxcZ7SPepkVrJr9Gpa9cS0kguEedRn6O4gizbB0LfngBq2U5iDOM=
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(788757137089)(228905959029699)(145744241990776);
X-Microsoft-Antispam-PRVS: <DM5PR04MB070195914441DDE0C1E38295E5540@DM5PR04MB0701.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231022)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR04MB0701; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR04MB0701; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	4:baFv+0T1FCM89fjKh9TDaCDNYTobst5Pigkwaf7mK1Hnv85NmHiS0DYgvYv6Uj52IoYLA6N506H1C7Y6C7BHa6y9YLNjc5+nahkOhrSaYjViIZ18NY9H4Oe668VdT5kmi1RtR9QfKgMwI6UpH0NG1qbv9jlyEFJDEPeVrhgHQNuRkwFWH7WF2/EoSwpKW/RoyhRzls+IgiQKCiMEdksDMORpV6qjnvt2zdtv2u5qOeYnzNCT4q2yp+PgsrlFxh2Irv3H4+FFkY0s+Ovr21/wjh5q7GWKJBtHlS6TLGWyuuEIVt0WViU0icFT8khpPXk6SBBj7h7dMevsT4UWMQDhin+dVYBzOcne5MMEuetUzDKsYdIvYyXOu2XZppmrdQ3jPpMGrKZOWNuyRhhYbWoCMiGu2axoE4tVUpHk0SFU/m0=
X-Forefront-PRVS: 0487C0DB7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(346002)(189002)(377424004)(69224002)(24454002)(199003)(6116002)(16526018)(3846002)(33646002)(305945005)(7736002)(6506006)(8676002)(81156014)(54356999)(81166006)(50986999)(83506002)(47776003)(76176999)(36756003)(97736004)(229853002)(65826007)(65956001)(6486002)(53546010)(65806001)(66066001)(966005)(5660300001)(106356001)(105586002)(31696002)(53936002)(86362001)(575784001)(110136005)(25786009)(31686004)(230700001)(316002)(58126008)(6246003)(8936002)(54906003)(64126003)(68736007)(4326008)(2950100002)(2501003)(101416001)(6512007)(50466002)(23676003)(6666003)(189998001)(6306002)(67846002)(2906002)(478600001)(21314002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0701;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA0TUIwNzAxOzIzOkFITnVjbGVkNTc5RVMvZktiSUpFcVQ3K1Rt?=
	=?utf-8?B?by9JUU1VMG1LNjZHaEtYTEYybVBtNVZJRkcrM2JzLy9ISG1RYzYrWEFhUmp0?=
	=?utf-8?B?TWFjOU5MdDN6Rk1VSnR6VXZNMzFuTWlCamVNUjI4NEhwTDRzbWN2VmljTkJX?=
	=?utf-8?B?U3NSVlljUnlQSFZPcWthVTZHcDVISUp6SkJIZGhBTGR6QVhLMVNzQU40Z3B2?=
	=?utf-8?B?akw3alpaQ2pxbUNjVkpOODVaNnptZ1lBdE90UGJFV0N0MDZ2VTZOZm5DQUx1?=
	=?utf-8?B?VDZpaEV5MGVDcDhyZnh1Z1ZLTEFPMFJGYXp1VjlqbU1EbTZoNXRpVWt2L0ZV?=
	=?utf-8?B?OVpmZlhoMEgvWWFNc0J3aWcrYlZSNFB4c3lRU2xyVDVWU2NJSU9ZUjBxK1c1?=
	=?utf-8?B?dUIwVzlaMFBZTUlObUczQWZYUStPNkdIb0pXSHh2ZmFsRlNER0UwcHFNVHMx?=
	=?utf-8?B?bGhjWjBraEM5cm9VS2k2Y04vRVVRa2hZdEdLWjNwTm5LbWNnZGZGVUhEVHQ3?=
	=?utf-8?B?bWxGU0VrenFja29pUG0rUG5YOTR0OSt4UFBIdXpIVStYcjJCSWtCV3k4Uzhi?=
	=?utf-8?B?YjJodm1zZE8wT21EZXRTc3BiMjRsZnpnZUNjeU1BSDRkN2pJSElOU2l4OWZ5?=
	=?utf-8?B?UXBrYXRnVVNlcEZpU1lhOFhrVk9ueFpCWFlLaXJ6V2xXcWF1U1RUdWZ0KzFa?=
	=?utf-8?B?c2xPZlM4Ny9PYjBzLzdJYjYzMloyOFhWZFMvcGVubkFqK0o3M2twR3JMWnJV?=
	=?utf-8?B?SUxuUWJRdDQ3cEh6ak02eHhzZ2kxenVGcjgxSlE1djA0OHpCdFl0aWt2NzI4?=
	=?utf-8?B?NDA3T1l2K3A4dlhWOVc5dW1yQy9QRTNRenRXL29pL3FmQlI3RXFndTBpWVJT?=
	=?utf-8?B?V0FBTis0UWhJTEhnUUZGd25YbXkvL05NcFgybkRXbldJWlkwVnFOVGxrMWdQ?=
	=?utf-8?B?Vk9GYnZSNzRJNDJlYXRmVXpuZFhxOG1OSWdhUGlMelFGTEVvaXAvSGhPT2dv?=
	=?utf-8?B?MUNMU2xtN3lJT3lJWFZPQVduTXFHVjNyd1BxajJ2TlZMeDBlclB0RTUvN21U?=
	=?utf-8?B?Rk5FMjdrMXE1ZXh0MWsyRk10SkxvU1ViVjlEK29sZ0JncENlZWhIeWw4bHZM?=
	=?utf-8?B?eGl5L2VNZHBGQmIxVXBOdXFJUTNFbEJlZGRQNUF0RDZ0VnUvSUVXczYweXB2?=
	=?utf-8?B?dzFGZkFna0h2WWtCSlBKbkg5ZDFJek1YdzU0N3k4WXlJakhvSDQvMktsQkM3?=
	=?utf-8?B?dVl3Wml6M0hkVW92REZET2RaOGUrZFpLa2ZGYTVjK3h2TzdUU2U4MkVFekxU?=
	=?utf-8?B?M0xoZXlMbEJjSU9LcXV4Tk1uYlhmMVgvS0hFWUJLYzJxeFVNcW1qd25Rd1Zy?=
	=?utf-8?B?Y2UrQzZHUjNqNDEydEZZT00yNjZ2d1FXUVBXd0xYRm5GZzAvVFhzTi8yMlBN?=
	=?utf-8?B?QTZaR25NUXJ2d2ZNRGpjVGdacTdQWHRTamgzd05OaWlTQUdXRXR0VFZ4clhM?=
	=?utf-8?B?aEFGZEpoKzdQeFpva3lWaUNXUjdVTkV6Z3o4NmlJa0xSQjVXa3dEUmk1YUZk?=
	=?utf-8?B?aFBHSVRPWlFKNXdlZm5Canp1MWZiQm9KTTlOdW52emdqRHc2emlWVENpWVgz?=
	=?utf-8?B?OXBlaEFaVG5IMnJ3TEdrTzNSaFh3Tm85NnpyeDVoMTRxYTR4N3VkL044Y0Jv?=
	=?utf-8?B?OWJ5VXl4UFl3RmJLRnJyUDF2SkZzS1hhZW5XaXpmQWlrc0xuNlJ5OWFJUE91?=
	=?utf-8?B?aUc2Wmw4NW1XdTB5eXRQa01oMXdIRE1wNS93ODVCcmFMOUo5TERsRVdpMVRS?=
	=?utf-8?B?WUd3U1JwQkVia1hzTWtwY3NwbGswdGg1Y0xXR1lkdmtCTW50VEt0SElza1ky?=
	=?utf-8?B?Mm1qWlF5T0pCUWVNMDF6ejhQSWZEWEZuSkRmaHd0UGxQVURKS0dzdU5hUVhr?=
	=?utf-8?B?dFlBcHYxYzNnaEhsZ21COE54aUtGY1BTRjVQUW8zMTdRL0UzOWpFNTYyMWFZ?=
	=?utf-8?B?QUJGcDJnTWNTQ2tyK1RUbmZ4TkRIZDM4U3orQT09?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	6:utDdI1zKmJUbOWgOEcdHjvvwsv4PCKKWjHa1IxjqwwkD0fzPzjWp4Mzt/Os6X0AbVDhq4Ypkkc1ho3I/ACRIGcvKjpsWCVFzUBgiCz7Y3W7XLKm+j0+oWFP9E3q6vyyAjxD9HsQL+/QM9JIT1A+piTdTZ3b+MUhy3mbtMtQbf9q9oKJOIXlXVmqON2XEhViyiMnqPYUWjD3SjW2SlzQS1HQw5KTGAhGcYcBpav+vTt8/7xOypeb+jfTZccHmxdxMxFhzNdrcITTelk5MU4Aiqpcj1O4d6iAXB9feohMQwPmeEYP/w2vvoejWybSnm5YydYbVrzG0fcYIu8EBczAZLQzXzytUFPFKE2r0qZPpoxk=;
	5:8fVDRXCRi2SZ3xghYoBODVSnPMCCechgIFpMMQ1OAPuY77YBkHCZ7oNMG4h1/EVSpxPqPHsrtw1VbBed5pSgfQVrLTuXF922tHaP/urgQgupnLjmLoYcLM/uNfuz5zVm90ew75wivXsbz7mfgfM97hjEzP6aUEFrVwSyYFefAos=;
	24:IFfITFNHOIAPMqLNnzZRr78ypr+sUMygf+RmeSdurs2jXbhsFLW9rr3xVhS2nRtOd6R6W4ntzV8f0I/iWKZHr/pujGeheozyjkBbbb+pHF0=;
	7:ubHe11qeG43coTCoVqWoWpHHauqY/HNheK07sSCGiqz9bzgsGXSG8q+Gx5zswB5nesJZpmk8KI4yaFVnRMq7IBOjqmAiG5ZLpJoJgMs+SbwZoK6G2YjmnYCatlNIq/5CTrNtlJc4kKGNd85jpb5mPshZZg/01IVbfsngCt4Udvyl303pOp55l83ahVsi0rqu9naX3LC1H2vFnHUv5AiW/OBE+6vuxDRZ6ZBIz2EXm9cIBMVIRdCekb2aXr0MNzQ7
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2017 21:51:56.5071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c5a6ae-bbfb-4e33-e227-08d5288543ae
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0701
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-11-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1711100301
Cc: "Ashfield, Bruce \(Wind River\)" <bruce.ashfield@windriver.com>,
	"josh.hernstrom@ni.com" <josh.hernstrom@ni.com>
Subject: Re: [PATCH v9] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Fri, 10 Nov 2017 21:52:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

No problem! Thanks for all the good feedback. I think we shook out most 
of the gremlins in the last few months.

Let me know if you need help with boot loader integration.

-- Haris


On 11/08/2017 04:20 PM, Wold, Saul wrote:
> 
> Haris,
> 
> Thanks for your patience on this process.  This version works well, now
> I have the extra work of getting these kernel known to systemd-boot!
> 
> Acked-by below!
> 
> Sau!
> 
> On Tue, 2017-11-07 at 12:40 -0600, Haris Okanovic wrote:
>> Some distros may want to provide alternate kernel "flavors" via feeds
>> or
>> within bootable images. For example, readily available builds which
>> provide certain diagnostic features can enable developers and testers
>> to
>> more quickly resolve issues by avoiding lengthy kernel builds.
>>
>> This change allows for building multiple flavors of the kernel and
>> module packages by templatizing kernel package names via a new
>> KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to the
>> old
>> name of "kernel", but can be overridden by certain recipes providing
>> alternate kernel flavors.
>>
>> To maintain compatibility, recipes providing alternate kernel flavors
>> cannot be the "preferred provider" for virtual/kernel. This is
>> because
>> OE puts the preferred provider's build and source at
>> "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
>> "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
>> "tmp-glibc/work/*/$PN/" like other recipes. Therefore, recipes using
>> the
>> default KERNEL_PACKAGE_NAME="kernel" follows the old semantics --
>> build
>> in the old location and may be preferred provider -- while recipes
>> using
>> all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR and
>> don't
>> provide "virtual/kernel".
>>
>> Testing:
>>   1. Add `KERNEL_PACKAGE_NAME_pn-linux-yocto-tiny = "tiny-linux"`
>>      to local.conf so that linux-yocto-tiny may build alongside
>>      the main kernel (linux-yocto).
>>   2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel
>> flavors.
>>   3. Verified image and modules IPKs exist for both:
>>      tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>>      tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-yocto-tiny
>>   4. Verified linux-yocto is the "preferred provider", and was built
>> in
>>      shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>>   5. Add `CORE_IMAGE_BASE_INSTALL_append_pn-core-image-base = "tiny-
>> linux"`
>>      to local.conf to install both kernel flavors in core-image-base.
>>   6. `bitbake core-image-base` to build an image.
>>   7. Verified image contains two bzImage's under /boot/, with
>>      "yocto-standard" (linux-yocto recipe) selected to boot via
>> symlink.
>>
>> Discussion threads:
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDecemb&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=cJkppECRP9FwMwrmn-tbJfRpffqbPbeRXS1uCu5JsB0&e=
>> er/thread.html#114122
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2017-2DJuly_t&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=B73w8-RIOKqgiEjZMC2ra49Q1594cWVJp9c6Yx6u34w&e=
>> hread.html#139130
>>
>> [YOCTO #11363]
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
> 
> Acked-by: Saul Wold <sgw@linux.intel.com>
> 
> Sau!
> 
>> ---
>> [PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR to
>> the
>> "work" directory in alternate kernel builds, instead of "work-
>> shared",
>> so
>> that the two builds don't clobber each other.
>>
>> [PATCH v3] An updated version of this change rebased onto the current
>> OE-core master. Changes:
>>   - Remove PREFERRED_PROVIDER check in linux-yocto.inc in alternate
>>     kernel builds, since alternate kernels aren't the
>>     PREFERRED_PROVIDER for virtual/kernel by definition.
>>   - Remove "virtual/kernel" from PROVIDES in alternate kernel builds.
>>
>> [PATCH v4] Another rebase onto master; no functional change.
>> Improved description and testing steps.
>>
>> [PATCH v5]
>>   - Warn when PN == KERNEL_PACKAGE_NAME (bug # 11905)
>>   - Add KERNEL_DEPLOYSUBDIR to avoid DEPLOYDIR collisions
>>
>> [PATCH v6] Add KERNEL_PACKAGE_NAME to kernel-module-split.bbclass for
>> module recipes; fixes lttng-modules build.
>>
>> [PATCH v7] Remove second definition of KERNEL_PACKAGE_NAME from
>> kernel-module-split.bbclass; apply a default in two places where
>> KERNEL_PACKAGE_NAME is referenced.
>>
>> [PATCH v8] Rebase onto current master and more fixups.
>>   - kernel-devicetree.bbclass: Fixup package names
>>   - depmodwrapper-cross: don't error when called from alt kernel
>> recipes
>>   - kernel.bbclass: Don't install /boot/image symlink in alt recipes
>>
>> [PATCH v9]
>>   - Add feature tracking tag
>>   - Update testing section to define vars in local.conf
>>   - Add KERNEL_PACKAGE_NAME check to *-rt recipes
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-ZaBXenlH_4CQklz7Csmi7u70A&s=g1DTbKMM_NmbTwVK6ABKrg7v5Qst-DAX8wovpBEZiQQ&e=
>> multi-kernel-packages-v9
>> ---
>>   meta/classes/kernel-devicetree.bbclass             |   8 +-
>>   meta/classes/kernel-module-split.bbclass           |   9 +-
>>   meta/classes/kernel.bbclass                        | 114
>> +++++++++++++--------
>>   meta/conf/documentation.conf                       |   1 +
>>   .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  14 +--
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |   2 +-
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |   2 +-
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   2 +-
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |   2 +-
>>   meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>>   10 files changed, 94 insertions(+), 62 deletions(-)
>>
>> diff --git a/meta/classes/kernel-devicetree.bbclass
>> b/meta/classes/kernel-devicetree.bbclass
>> index 6e08be4b70..4f80cc62eb 100644
>> --- a/meta/classes/kernel-devicetree.bbclass
>> +++ b/meta/classes/kernel-devicetree.bbclass
>> @@ -1,10 +1,10 @@
>>   # Support for device tree generation
>>   PACKAGES_append = " \
>> -    kernel-devicetree \
>> -    ${@['kernel-image-zimage-bundle',
>> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>> +    ${KERNEL_PACKAGE_NAME}-devicetree \
>> +    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle',
>> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>>   "
>> -FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
>> /${KERNEL_IMAGEDEST}/*.dtbo"
>> -FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
>> *.dtb.bin"
>> +FILES_${KERNEL_PACKAGE_NAME}-devicetree =
>> "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>> +FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle =
>> "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>>   
>>   # Generate kernel+devicetree bundle
>>   KERNEL_DEVICETREE_BUNDLE ?= "0"
>> diff --git a/meta/classes/kernel-module-split.bbclass
>> b/meta/classes/kernel-module-split.bbclass
>> index 1035525dac..73c7f18c78 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -30,7 +30,7 @@ do_install_append() {
>>   
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>   
>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>> +KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME",
>> True) or "kernel" }-modules"
>>   
>>   KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>   KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>>              postfix = format.split('%s')[1]
>>              d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
>>   
>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True) or
>> "kernel"
>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>> +
>>       module_regex = '^(.*)\.k?o$'
>>   
>>       module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>>       module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>> -    module_pattern = module_pattern_prefix + 'kernel-module-%s' +
>> module_pattern_suffix
>> +    module_pattern = module_pattern_prefix + kernel_package_name +
>> '-module-%s' + module_pattern_suffix
>>   
>>       postinst = d.getVar('pkg_postinst_modules')
>>       postrm = d.getVar('pkg_postrm_modules')
>>   
>> -    modules = do_split_packages(d,
>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>> output_pattern=module_pattern, description='%s kernel module',
>> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
>> extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>> +    modules = do_split_packages(d,
>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>> output_pattern=module_pattern, description='%s kernel module',
>> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
>> extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>       if modules:
>>           metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>           d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>> diff --git a/meta/classes/kernel.bbclass
>> b/meta/classes/kernel.bbclass
>> index 756707a3c2..48b718d777 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,6 +1,9 @@
>>   inherit linux-kernel-base kernel-module-split
>>   
>> -PROVIDES += "virtual/kernel"
>> +KERNEL_PACKAGE_NAME ??= "kernel"
>> +KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME",
>> True) == "kernel") else d.getVar("KERNEL_PACKAGE_NAME", True) }"
>> +
>> +PROVIDES += "${@ "virtual/kernel" if
>> (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>>   DEPENDS += "virtual/${TARGET_PREFIX}binutils
>> virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>>   
>> @@ -34,11 +37,32 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_
>> name(d.getVar('KERNEL_VERSION')
>>   KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>   
>>   python __anonymous () {
>> +    pn = d.getVar("PN", True)
>> +    kpn = d.getVar("KERNEL_PACKAGE_NAME", True)
>> +
>> +    # XXX Remove this after bug 11905 is resolved
>> +    #  FILES_${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>> +    if kpn == pn:
>> +        bb.warn("Some packages (E.g. *-dev) might be missing due to
>> "
>> +                "bug 11905 (variable KERNEL_PACKAGE_NAME == PN)")
>> +
>> +    # The default kernel recipe builds in a shared location defined
>> by
>> +    # bitbake/distro confs: STAGING_KERNEL_DIR and
>> STAGING_KERNEL_BUILDDIR.
>> +    # Set these variables to directories under ${WORKDIR} in
>> alternate
>> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so
>> that they
>> +    # may build in parallel with the default kernel without
>> clobbering.
>> +    if kpn != "kernel":
>> +        workdir = d.getVar("WORKDIR", True)
>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>> +        artifactsDir = os.path.join(workdir, 'kernel-build-
>> artifacts')
>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>>   
>>       # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>> KERNEL_IMAGETYPES
>>       type = d.getVar('KERNEL_IMAGETYPE') or ""
>>       alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>       types = d.getVar('KERNEL_IMAGETYPES') or ""
>> +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>>       if type not in types.split():
>>           types = (type + ' ' + types).strip()
>>       if alttype not in types.split():
>> @@ -55,15 +79,15 @@ python __anonymous () {
>>           typelower = type.lower()
>>           imagedest = d.getVar('KERNEL_IMAGEDEST')
>>   
>> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
>> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>>   
>> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest
>> + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' +
>> type)
>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' +
>> imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest
>> + '/' + type)
>>   
>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>> typelower)
>> +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' %
>> (kname, typelower))
>>   
>> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>> +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-
>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>   
>> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>> +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower),
>> '1')
>>   
>>       image = d.getVar('INITRAMFS_IMAGE')
>>       if image:
>> @@ -121,9 +145,9 @@ base_do_unpack_append () {
>>   
>>   inherit kernel-arch deploy
>>   
>> -PACKAGES_DYNAMIC += "^kernel-module-.*"
>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>   
>>   export OS = "${TARGET_OS}"
>>   export CROSS_COMPILE = "${TARGET_PREFIX}"
>> @@ -339,7 +363,9 @@ kernel_do_install() {
>>   	install -d ${D}/boot
>>   	for type in ${KERNEL_IMAGETYPES} ; do
>>   		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>> ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
>> -		ln -sf ${type}-${KERNEL_VERSION}
>> ${D}/${KERNEL_IMAGEDEST}/${type}
>> +		if [ "${KERNEL_PACKAGE_NAME}" == "kernel" ]; then
>> +			ln -sf ${type}-${KERNEL_VERSION}
>> ${D}/${KERNEL_IMAGEDEST}/${type}
>> +		fi
>>   	done
>>   	install -m 0644 System.map ${D}/boot/System.map-
>> ${KERNEL_VERSION}
>>   	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>> @@ -393,9 +419,9 @@ do_shared_workdir_setscene () {
>>   
>>   emit_depmod_pkgdata() {
>>   	# Stash data for depmod
>> -	install -d ${PKGDESTWORK}/kernel-depmod/
>> -	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-
>> depmod/kernel-abiversion
>> -	cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-
>> ${KERNEL_VERSION}
>> +	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>> +	echo "${KERNEL_VERSION}" >
>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-
>> abiversion
>> +	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>> depmod/System.map-${KERNEL_VERSION}
>>   }
>>   
>>   PACKAGEFUNCS += "emit_depmod_pkgdata"
>> @@ -410,7 +436,7 @@ do_shared_workdir () {
>>   	# Store the kernel version in sysroots for module-
>> base.bbclass
>>   	#
>>   
>> -	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>> +	echo "${KERNEL_VERSION}" >
>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>   
>>   	# Copy files required for module builds
>>   	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>> @@ -508,28 +534,28 @@ EXPORT_FUNCTIONS do_compile do_install
>> do_configure
>>   
>>   # kernel-base becomes kernel-${KERNEL_VERSION}
>>   # kernel-image becomes kernel-image-${KERNEL_VERSION}
>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-
>> dev kernel-modules"
>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>   FILES_${PN} = ""
>> -FILES_kernel-base =
>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> -FILES_kernel-image = ""
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>> /boot/config* ${KERNEL_SRC_PATH}
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>> -FILES_kernel-modules = ""
>> -RDEPENDS_kernel = "kernel-base"
>> +FILES_${KERNEL_PACKAGE_NAME}-base =
>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> +FILES_${KERNEL_PACKAGE_NAME}-image = ""
>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-
>> ${KERNEL_VERSION_NAME}"
>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>   # Allow machines to override this dependency if kernel image files
>> are
>>   # not wanted in images as standard
>> -RDEPENDS_kernel-base ?= "kernel-image"
>> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNE
>> L_VERSION}')}"
>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSI
>> ON}')}"
>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>> -ALLOW_EMPTY_kernel = "1"
>> -ALLOW_EMPTY_kernel-base = "1"
>> -ALLOW_EMPTY_kernel-image = "1"
>> -ALLOW_EMPTY_kernel-modules = "1"
>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>> -
>> -pkg_postinst_kernel-base () {
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-
>> image"
>> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@
>> legitimize_package_name('${KERNEL_VERSION}')}"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNE
>> L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitim
>> ize_package_name('${KERNEL_VERSION}')}"
>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-
>> ${KERNEL_VERSION}"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta
>> package"
>> +
>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>   	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>   		mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>   	fi
>> @@ -543,7 +569,7 @@ pkg_postinst_kernel-base () {
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>   
>>   python split_kernel_packages () {
>> -    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-
>> firmware-%s', description='Firmware for %s', recursive=True,
>> extra_depends='')
>> +    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>> output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s',
>> description='Firmware for %s', recursive=True, extra_depends='')
>>   }
>>   
>>   # Many scripts want to look in arch/$arch/boot for the bootable
>> @@ -626,21 +652,27 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-
>> ${MACHINE}.tgz"
>>   MODULE_TARBALL_DEPLOY ?= "1"
>>   
>>   kernel_do_deploy() {
>> +	deployDir="${DEPLOYDIR}"
>> +	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
>> +		deployDir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
>> +		mkdir "$deployDir"
>> +	fi
>> +
>>   	for type in ${KERNEL_IMAGETYPES} ; do
>>   		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>> -		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>> ${DEPLOYDIR}/${base_name}.bin
>> +		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>> $deployDir/${base_name}.bin
>>   	done
>>   	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
>> '^CONFIG_MODULES=y$' .config); then
>>   		mkdir -p ${D}/lib
>> -		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME}
>> -C ${D} lib
>> -		ln -sf ${MODULE_TARBALL_BASE_NAME}
>> ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
>> +		tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME} -C
>> ${D} lib
>> +		ln -sf ${MODULE_TARBALL_BASE_NAME}
>> $deployDir/${MODULE_TARBALL_SYMLINK_NAME}
>>   	fi
>>   
>>   	for type in ${KERNEL_IMAGETYPES} ; do
>>   		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>>   		symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
>> -		ln -sf ${base_name}.bin
>> ${DEPLOYDIR}/${symlink_name}.bin
>> -		ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
>> +		ln -sf ${base_name}.bin
>> $deployDir/${symlink_name}.bin
>> +		ln -sf ${base_name}.bin $deployDir/${type}
>>   	done
>>   
>>   	cd ${B}
>> @@ -650,8 +682,8 @@ kernel_do_deploy() {
>>   			echo "Copying deploy ${type} kernel-
>> initramfs image and setting up links..."
>>   			initramfs_base_name=${type}-
>> ${INITRAMFS_BASE_NAME}
>>   			initramfs_symlink_name=${type}-initramfs-
>> ${MACHINE}
>> -			install -m 0644
>> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>> ${DEPLOYDIR}/${initramfs_base_name}.bin
>> -			ln -sf ${initramfs_base_name}.bin
>> ${DEPLOYDIR}/${initramfs_symlink_name}.bin
>> +			install -m 0644
>> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>> $deployDir/${initramfs_base_name}.bin
>> +			ln -sf ${initramfs_base_name}.bin
>> $deployDir/${initramfs_symlink_name}.bin
>>   		fi
>>   	done
>>   }
>> diff --git a/meta/conf/documentation.conf
>> b/meta/conf/documentation.conf
>> index a55e2836b5..2c88504fb9 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -247,6 +247,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel to
>> build for a device, usually set b
>>   KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a
>> device, usually set by the machine configuration files and defaults
>> to KERNEL_IMAGETYPE."
>>   KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
>> auto-loaded during boot"
>>   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the
>> build system expects to find module_conf_* values that specify
>> configuration for each of the modules"
>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages.
>> Defaults to 'kernel'."
>>   KERNEL_PATH[doc] = "The location of the kernel sources. This
>> variable is set to the value of the STAGING_KERNEL_DIR within the
>> module class (module.bbclass)."
>>   KERNEL_SRC[doc] = "The location of the kernel sources. This variable
>> is set to the value of the STAGING_KERNEL_DIR within the module class
>> (module.bbclass)."
>>   KFEATURE_DESCRIPTION[doc] = "Provides a short description of a
>> configuration fragment. You use this variable in the .scc file that
>> describes a configuration fragment file."
>> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> index 44d013f29d..2eec921728 100644
>> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> @@ -23,17 +23,13 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
>>       echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
>>       exit 1
>>   fi
>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ]; then
>> -    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-
>> abiversion" >&2
>> -else
>> -    kernelabi=\$(cat ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion)
>> -    if [ "\$kernelabi" != "\$4" ]; then
>> -        echo "Error: Kernel version \$4 does not match kernel-
>> abiversion (\$kernelabi)" >&2
>> -        exit 1
>> -    fi
>> +
>> +kernelabi=""
>> +if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
>> +    kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-
>> abiversion")
>>   fi
>>   
>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ]; then
>> +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [
>> "\$kernelabi" != "\$4" ]; then
>>       echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-
>> \$4" >&2
>>       exec env depmod "\$1" "\$2" "\$3" "\$4"
>>   else
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>> index f93d9530eb..894e2ffbf6 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>   # to build multiple virtual/kernel providers, e.g. as dependency of
>>   # core-image-rt-sdk, core-image-rt.
>>   python () {
>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>> yocto-rt":
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>           raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>   }
>>   
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>> index c49a9340f8..be4d163ff1 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>   # to build multiple virtual/kernel providers, e.g. as dependency of
>>   # core-image-rt-sdk, core-image-rt.
>>   python () {
>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>> yocto-rt":
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>           raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>   }
>>   
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> index 25d88833a9..e489bbb9f2 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>   # to build multiple virtual/kernel providers, e.g. as dependency of
>>   # core-image-rt-sdk, core-image-rt.
>>   python () {
>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>> yocto-rt":
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>           raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>   }
>>   
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>> index 6734dc0d05..8212b1445c 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>   # to build multiple virtual/kernel providers, e.g. as dependency of
>>   # core-image-rt-sdk, core-image-rt.
>>   python () {
>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>> yocto-rt":
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>           raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>   }
>>   
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 9c1f61be75..8a70eb5018 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -12,7 +12,7 @@ INC_PR = "r4"
>>   # PREFERRED_PROVIDER for virtual/kernel. This avoids network access
>> required
>>   # by the use of AUTOREV SRCREVs, which are the default for this
>> recipe.
>>   python () {
>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>> d.getVar("PN"):
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>> d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN",
>> True):
>>           d.delVar("BB_DONT_CACHE")
>>           raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
>> (d.getVar("PN")))
>>   }
>> -- 
>> 2.14.2

