Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 4B10A7867F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:16:20 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vADJFp17007315; Mon, 13 Nov 2017 13:16:20 -0600
Received: from nam03-co1-obe.outbound.protection.outlook.com
	(mail-co1nam03lp0021.outbound.protection.outlook.com [216.32.181.21])
	by mx0b-00010702.pphosted.com with ESMTP id 2e66em5uys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2017 13:16:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2CHnSsCgpWlRNrgQnlrxg06Fz9oCSsbWLnrQltE1LrA=;
	b=CXywJ4MHXZiUXRywWZMEaJpFZL85eynMzENnvN1YM/ptMfaroDBRHrSqN4kFGTNnsyaIq0U3hGOE4sVGxA5rot5aruLN7DrRI7Kbs/jSlQgCPcZ3Oz31oa9vAQYRB2tlicnB38EHvWDOy/XrmcGC92uPsH9xs0AHXXNqA6UWQHU=
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	MWHPR04MB0704.namprd04.prod.outlook.com (10.172.167.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Mon, 13 Nov 2017 19:16:16 +0000
To: "Wold, Saul" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1500479806.27323.202.camel@intel.com>
	<20171107184039.31164-1-haris.okanovic@ni.com>
	<1510179606.1903.92.camel@intel.com>
	<f65277d0-e056-5181-9cc9-1e78e4e97c6b@ni.com>
	<1510351234.1903.159.camel@intel.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <610ad2b1-c05b-12ce-08d0-35adfd9ba123@ni.com>
Date: Mon, 13 Nov 2017 13:16:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1510351234.1903.159.camel@intel.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: SN4PR0601CA0014.namprd06.prod.outlook.com (10.162.115.152)
	To MWHPR04MB0704.namprd04.prod.outlook.com (10.172.167.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4d63c64-725e-43c0-c8d8-08d52acb039c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR04MB0704; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0704;
	3:aW8feMJTNQtXVkFFvx35032VLGe0QCwrrLPyLsxGLbHds1bXZxu7+OOI8R3khUhOsJfv7fiwjyuPhj85uEeW44+pGeakuialXVeOKYKNbcI4vAXUdJvt88rL2J8Kfv6+2LT9DWkQR2QXDDh5Cr39pTxbnjbW/tCRWbF4FQwuGfFYotn4vLfute7ndxm0fooeP+e2dOU9tKdA0AZjM8POEMvdzAhYwfF8qy6uomb8QyDG2PWnRMcGAyfo6DdGM/9F;
	25:A4kXdXL0DSuDWbgIUQrwr1Y6HdnvZ61V5AUKAVevNEKRwPWnTodUJw9JkK346vZkZv4CsowUR2buLwHZEzcw5W+faWZkCdipWrahc+05DadFDRbfPAAJ2PuK0yzoNlLQLl1pvSAwdMHMzYH03CBiqUWSTjo7CGAwlTswVIJoTz4hir/fHDrSgt/PiahcWRugWbSBxgWRJuPo/PTIGeZPxI82gYx0VGFgWhJc6ZZ90oFEpa1SNKDs7+qiwWrfnPaNoOjb5o9LPgkvE5umcrkWcMuAFja2Jrg7FVCWREL2sC37ATbpsuMSN4RPewX7ErNlsIhsRHKN65yc5hQjkkXHmQ==;
	31:RyGp1enPvionkYfGIJjex5vSyx3SXSXakvv6SjpS57HKb2YPYWjVAk8v+hVGosyVDXEvSRASzFFUok6SllzmVJt8cNPvaDy8dYcUNsiZzoe2GVs0ykyh+5Hs4/RIc5gYvYtuwm8vtyxN2PEc20mAn+9eJYAd1repfGuxoL/LZB3IOq2PtRvShIFpho1Iy8iJaB4gjxq/71gx1V49Tta4C94d0F46eH8GSIFqw2oX7Sc=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0704:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0704;
	20:v6BxamVn3RScDGLCgjsBd/Cn5y+cmNVQceaVWouDZ9tAo73NxVmMMuNwVdMAlxAOPuHjOnWH4ijEy62PPc87zhzSk8BnFi+cYYRwnxUe8Ktwp5/oxGOinZJyFbLECdPkbkRXaLw5Fy4QOxKqfOZu1qyDz4uhaNgYlJgcuB0Cqy5PmNyJWbncOje5WAy/glT0yFoVJfeXuiubtNg6ZsD2cB9IiI1HWVGldScyBTRqc/xIqcR4bgVWzZUoXP11U0RGr9Lu14x/SQr/PEP7tL+VIqOwCd5DhWPeZHfh2N4UwpWwpQeLzb55bEiPesGJRkrDLaCj8VJaVIC45V1/30TcIxSSDbEiZ/aXFcHtRx0jOXjE2FF3kpZaXNANlvZoetpT9sVDhQ9T1RsijSKHIwYO78keg5D1TvdGG7SQXXTs+G9X2bZch2BAVj4l+s2wzgKl7+XJaKGgdyXhdEXl6dXYfSBUPu//iZ2CVdv1/DPY20sRBn+WHyUO3yW/bVhyB36AmeWi17PcIEfwhUTFAqXudAiy59rku9neYwjW0buS8ZliX94KL/OSoL020VnLGv7hN7ExeGH4qvbt5Lnps2HbChQufHdlUMnx9zNAVWOHIko=
X-Microsoft-Antispam-PRVS: <MWHPR04MB0704F20CF73B16C15D1840D7E52B0@MWHPR04MB0704.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(788757137089)(228905959029699)(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(3002001)(10201501046)(3231022)(6041248)(20161123564025)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR04MB0704; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR04MB0704; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0704;
	4:fut3mTN8LZMGhNzDljb/lu25d/laz3OD+r3+apY44tihj1EH2JQ2Ht8zv+icVC4c8JatMbEKFonXp0lunsCx+/nu9ZAyK0CVoz4Hovh+uBBcIrID+oU6voy4v3U6+U6yR2PzwzIMfHCotOL7WjEQsiAVljKeYhYfrb8x8XtUl/q/youLTU7ieCqwpV9RncpxcPzEWh0KQiCXg+rlYfkDoFLzkPbJJKxUzvvti9cuKoB0uGJ/FWGlm+c+dxJhc5PkoGfXp8r6bdtNrUGN0k1eorGBVDSFuK0/h2rOgbWgHYNzg00fwvQ7rWXll0Pr/I2LQ29jqPvyjlcBkbBsD7LvUlaWg8+lRRaclFs5aNpSFkbMtILqSwurl8Ry4L0r0f906RLN9meaKk2y8XlNjRi3eO7SYEl7RnU0BHkxWg4GtLs=
X-Forefront-PRVS: 0490BBA1F0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(346002)(189002)(377424004)(24454002)(199003)(69224002)(43784003)(110136005)(33646002)(58126008)(5660300001)(54906003)(68736007)(53546010)(76176999)(54356999)(93886005)(50986999)(65826007)(6486002)(6506006)(6666003)(6116002)(2950100002)(316002)(229853002)(3846002)(230700001)(66066001)(31686004)(81156014)(8676002)(2501003)(81166006)(101416001)(50466002)(8936002)(575784001)(4326008)(2906002)(97736004)(53946003)(86362001)(53936002)(305945005)(478600001)(36756003)(65956001)(65806001)(189998001)(106356001)(6512007)(105586002)(6306002)(47776003)(7736002)(4001150100001)(966005)(83506002)(23676003)(64126003)(16526018)(25786009)(67846002)(31696002)(6246003)(21314002)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0704;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA0OzIzOnZjZHVoM2RSWGl4TVpEN3k1aDFhTE9Dc2Ny?=
	=?utf-8?B?M0QxQ0FUQkU3OTJSRHRIOEtXSWpRYkNsUndIbnU3NktueEg3UmhKYXM1REJF?=
	=?utf-8?B?S0grOWpRL2U3TldIY2g4SUxvbE4zdTNrUE5help0TGppcm0vbkdCYVE3MXlZ?=
	=?utf-8?B?amNxVk4vZ2FBZDNhaTcyczlLU2JrR2NKU2tqWUswSkZQbm5SQ1ZJNHJiNG5m?=
	=?utf-8?B?ZC9CSjdGRlJUcTlZdVlkbGg5Sis0UlIwa0d6T2lheFBJQWV2aUFLd3RkY05H?=
	=?utf-8?B?ZWtIMjdFUkZ5N3RTRkw4RWQxbUtjMDVSOEV4WmtuVDBLeFVrdVUvT0xiRlUx?=
	=?utf-8?B?VHlBejVUSVl2SmIxUUtzbHFpdnhnWGpORHFKaHVPekZNUDVNMUQ4d1NtcHlk?=
	=?utf-8?B?UGdESGhhRTgyNE9oRnhPVm9GYlowdUN2TUc1aTNYdlh5YW1KSHprTDRCTDdX?=
	=?utf-8?B?N3llQS9XdE9YS2xZSFFpTHFJcHpXRGpHOUtlT3RObTVIeFcvWVFTQkV4T2ZG?=
	=?utf-8?B?aUVtbEVaTklMeElBeEV0RUc5VmVVbWExTHBScFBSczN2eHFEaXBqd2txSERv?=
	=?utf-8?B?WG1QNHd6LzNZMnQ5QlpIc0EzSTlZNVBiVjJaQnIvb1E0NkY5YzVVK0MraXFT?=
	=?utf-8?B?OU12Sk9ncDVhS3RrdVFTM2NFbGJ0bUVZS0NmSjZUUC9NaHBaQkxocmxoU3hr?=
	=?utf-8?B?V0VLWUwrMEliaTcrNWFMV1R4d0ZuYnErWTlWaWtCTVVJSko1S1hCbGNQOVpB?=
	=?utf-8?B?cXRDYTBDQ04vMlp4eFQ5UUhZa0MxYVptbEl5bjFWa1VkbVBDZW03MTI4WlA4?=
	=?utf-8?B?VnpxWFJRcFB3MXpTc1h3aEpGVmpva0tPSlc5cXNVbUVIY1VyNndndHVMYVQ4?=
	=?utf-8?B?VFIwK0U3TDRYMTQwTkR2UE5UbGhJd3hYM1U1MDhvQXFEeHRzTklsemxwbzdr?=
	=?utf-8?B?QVlWd29NNzI5YjJTU05ybzFQNGhHYzRmckEvemhGaUxmWksreXMrZkRoL0VG?=
	=?utf-8?B?V1B2QWFNei9uL1J5MG1KdnlJQ3FZSkJMSGV3eU0zcEV5N1VseVhqQXlmWWY5?=
	=?utf-8?B?bzZMZUppQklNYTFvT3JPY0ZWbytkMDNNTVRGV3FNVjNBS1BKczdNTkFvU0gy?=
	=?utf-8?B?SksvRlhnaDVwWSswWUZpMTdJblJjUW1IeGhaRk9GVXk0ZnNjYXh6Rzg5V1Fj?=
	=?utf-8?B?SXJDdG1TaW4yZGRTRTRmcjF5WXdlZ1JnNGRiR2h4ZWJVYnJpeUROajNyOVdl?=
	=?utf-8?B?VHhGMG5hZmtlTWhEQjhLSTRpdFFocFlUZTE1V3RlRGdjSVljTW5TamtXNXFH?=
	=?utf-8?B?K3VsSi9iZW5VZytPeXNZUWhHOTFSUWczT1g5VDFCSllja2k0MHdTVEtFcFhH?=
	=?utf-8?B?b2xheG5iQlRXSUZVQWhPMnNFeHB6bXhwMmMvL3RQN2o5c0FvK1ZtRG9VR0t3?=
	=?utf-8?B?NzRzVTE5dVFpUzYzcWdWaGR3V3dRRkh0V2J5VjdnVmtUd01hekxVWmtKaHZL?=
	=?utf-8?B?QkhoSlBWWTdnWTIxMWIxTXQwR3hJZm9lWHVIRThha0VaM20vdkVvU3BtL1Jx?=
	=?utf-8?B?T0tpQzVONWpQNjA2cEY5KzRRTkVheUZJTjUvUXZlcXg5Z0Q2blBCQzdOaWtG?=
	=?utf-8?B?YnZRbWMzckxxTFVJay83bnZiblE3ZlRPYnI2eU9ZaWc0M3hFTEFML2Q1cUpU?=
	=?utf-8?B?VkRUM2tBSmRuSCs3RHlHSzZJTjYzRTFaT0J4U1NvSVkwdEVuengwWkI0NDRX?=
	=?utf-8?B?VE9md2JPbkFnZ2ZnNWhNMEZlb2tPUGVRWW1pL2FRUXNZcnJIajJ5Y2xYNndj?=
	=?utf-8?B?VUlXTlBkekxaK2RNOU95TUQ2RCt1N29GeWRrMndadzBLeHVrbEhUSXJQR0dM?=
	=?utf-8?B?ZGh0TDRHRnQwSUdNWmVrNXFtcWkwOC9NTTNoTHduWko4SlJhMnRQMkpCQnVQ?=
	=?utf-8?B?YVNUTGVQUlVUdFhMbjVRQTU0ZWJZQ2J4aGtHeTkwSkpoanRydm5CQWYxTkg3?=
	=?utf-8?B?RFQ1cGdNaHIvUkMxWUt0VzhTNmNhZ3lBcXoybWV3UVFFTGNqS1h2M3BhOW00?=
	=?utf-8?B?TUI1c3pTMzhhTmF5eGFzZVdmMTFBeVdacUNsSGpieGZOZjlMTkhyeVZaMVkz?=
	=?utf-8?B?enVsTHAyaVlVMEU2cXY0R1lFU1lnaUh1ekNHR3RtM1QvekdIT0JaNHZMZGNu?=
	=?utf-8?B?OXV3VmRvUVpuQnltcFpESWszNWd3PT0=?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0704;
	6:jrTwlLLlvj0NiMidpsem3aqS+cFKH/jX8paWblYaveDIoG+BhseUGRXR4AIDOOBkeR+RgWHInZ4cy+GmZsaGWCXSknBZuTfy+lhjqUQI9yIBlgsRbLhxx6g4reXOwGeASEvvZVp2vxn+BNSnp7aQ2Rc3Yl7++CZIBxHF43p05wRi4EpA1s1KOwVrK3lE05vWh1KqNBxBKG3m3eu3FVRtXgr6+0hv8mdPZXrbyyhJR9NtpzDAPX7xNfM0kCMRpcSbV5vzgYoPzsWrhJZ4WLF3CD+GUJljNUNfUc8kzw5c70a9eLdfM1Mdpc/MBaMeir75Aqdh5NWK+OoU058M/aPgK8UsxTQu4WVNYBZhmuICpqk=;
	5:dGYEnzQAi6rOJ05xkD4Zr+szR3fYLSF5Li2nGhegOdN3BUxmRYuzf3VzA/FPEwmzvv9VtG3W0MtViT0qMJZiX8u9XLHh2O7rkrgDM9wfckGt4uW59yvxg92LP9gmtnZb1QYqnPbR0IWrx5a0XxdARL8tfzksl6kd2UWikTV+wTI=;
	24:w2rDLB01a85ySdzpDqdov5IvsQWC7gvprKD8Babf+S+WyhoTlcVAemkRj+evLG01ofs91GsvklS/wh5u9QBMnWh2BD8qkyAEZdya8KpFQ28=;
	7:CKZ/A/FbSUFPwM9SXhYpQfILflW8SaPU+cTDZZm3Oaq+Vgv0AwB+dbA2dnX3ZHPXCWomL36Hyf5t9jQZ84ZnRpazxpfaBsIsYcJM0ofki7toKLjsLE2GYStzT1LaCjP6nWINg1NN47ViGR3FXchEZFtOUP5iKZn8/3XNaGAqMx+nejDCpXB7PiYkcLE6VuI4POSYl907DcXzM5v2syVKtRQEpt7gdiKekBTC/lisyFDps8PY5mSzxabvxOno0yIw
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 19:16:16.5440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d63c64-725e-43c0-c8d8-08d52acb039c
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0704
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-11-13_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1711130265
Cc: "Ashfield, Bruce \(Wind River\)" <bruce.ashfield@windriver.com>, "Orling,
	Timothy T" <timothy.t.orling@intel.com>,
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
X-List-Received-Date: Mon, 13 Nov 2017 19:16:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/10/2017 04:00 PM, Wold, Saul wrote:
> On Fri, 2017-11-10 at 15:51 -0600, Haris Okanovic wrote:
>> No problem! Thanks for all the good feedback. I think we shook out
>> most
>> of the gremlins in the last few months.
>>
> Thanks again for your patience !
> 
>> Let me know if you need help with boot loader integration.
>>
> Funny you should mention that, there is another bug recently opened
> about supporting multiple kernels for at least grub* and systemd-boot.
> 
> I have some ideas about using the existing bbclasses and extending the
> LABELS variable automagically.  We also have some plans for make the
> bootfs be created in a more generic install fashion, rather then the
> additional do_deploy() function, this is an early WIP.
> 
> If you have any ideas or work already, we would be happy to use it.
> 

Unfortunately, we don't have any good selection mechanism just yet. Our 
main use case is to aid in debugging driver issues, mostly aimed at 
kernel developers. We provide an image + modules in our feed that's 
compiled with debug options, and require the user to select a preferred 
boot kernel via symlink on the file system.

I envisioned using update-alternatives in the future to facilitate 
selection. The call from postinst would give preference to OE's 
preferred provider while a call from users could override that, if desired.

I'm not familiar with the <bootloader>.bbclass-es and the LABELS 
variable. We use a static boot loader config on our systems. How would 
this work if a kernel is installed from feed -- I.e. after image build? 
Is there a mechanism to rebuild the boot loader config dynamically?

-- Haris


> Sau!
> 
> 
>> -- Haris
>>
>>
>> On 11/08/2017 04:20 PM, Wold, Saul wrote:
>>>
>>> Haris,
>>>
>>> Thanks for your patience on this process.  This version works well,
>>> now
>>> I have the extra work of getting these kernel known to systemd-
>>> boot!
>>>
>>> Acked-by below!
>>>
>>> Sau!
>>>
>>> On Tue, 2017-11-07 at 12:40 -0600, Haris Okanovic wrote:
>>>> Some distros may want to provide alternate kernel "flavors" via
>>>> feeds
>>>> or
>>>> within bootable images. For example, readily available builds
>>>> which
>>>> provide certain diagnostic features can enable developers and
>>>> testers
>>>> to
>>>> more quickly resolve issues by avoiding lengthy kernel builds.
>>>>
>>>> This change allows for building multiple flavors of the kernel
>>>> and
>>>> module packages by templatizing kernel package names via a new
>>>> KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to
>>>> the
>>>> old
>>>> name of "kernel", but can be overridden by certain recipes
>>>> providing
>>>> alternate kernel flavors.
>>>>
>>>> To maintain compatibility, recipes providing alternate kernel
>>>> flavors
>>>> cannot be the "preferred provider" for virtual/kernel. This is
>>>> because
>>>> OE puts the preferred provider's build and source at
>>>> "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
>>>> "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
>>>> "tmp-glibc/work/*/$PN/" like other recipes. Therefore, recipes
>>>> using
>>>> the
>>>> default KERNEL_PACKAGE_NAME="kernel" follows the old semantics --
>>>> build
>>>> in the old location and may be preferred provider -- while
>>>> recipes
>>>> using
>>>> all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR and
>>>> don't
>>>> provide "virtual/kernel".
>>>>
>>>> Testing:
>>>>    1. Add `KERNEL_PACKAGE_NAME_pn-linux-yocto-tiny = "tiny-linux"`
>>>>       to local.conf so that linux-yocto-tiny may build alongside
>>>>       the main kernel (linux-yocto).
>>>>    2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel
>>>> flavors.
>>>>    3. Verified image and modules IPKs exist for both:
>>>>       tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>>>>       tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-yocto-
>>>> tiny
>>>>    4. Verified linux-yocto is the "preferred provider", and was
>>>> built
>>>> in
>>>>       shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>>>>    5. Add `CORE_IMAGE_BASE_INSTALL_append_pn-core-image-base =
>>>> "tiny-
>>>> linux"`
>>>>       to local.conf to install both kernel flavors in core-image-
>>>> base.
>>>>    6. `bitbake core-image-base` to build an image.
>>>>    7. Verified image contains two bzImage's under /boot/, with
>>>>       "yocto-standard" (linux-yocto recipe) selected to boot via
>>>> symlink.
>>>>
>>>> Discussion threads:
>>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openemb
>>>> edded.org_pipermail_openembedded-2Dcore_2015-
>>>> 2DDecemb&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r
>>>> =8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-
>>>> ZaBXenlH_4CQklz7Csmi7u70A&s=cJkppECRP9FwMwrmn-
>>>> tbJfRpffqbPbeRXS1uCu5JsB0&e=
>>>> er/thread.html#114122
>>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openemb
>>>> edded.org_pipermail_openembedded-2Dcore_2017-
>>>> 2DJuly_t&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r
>>>> =8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-
>>>> ZaBXenlH_4CQklz7Csmi7u70A&s=B73w8-
>>>> RIOKqgiEjZMC2ra49Q1594cWVJp9c6Yx6u34w&e=
>>>> hread.html#139130
>>>>
>>>> [YOCTO #11363]
>>>>
>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>>>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>>>> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
>>>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>>>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>>>
>>> Acked-by: Saul Wold <sgw@linux.intel.com>
>>>
>>> Sau!
>>>
>>>> ---
>>>> [PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR
>>>> to
>>>> the
>>>> "work" directory in alternate kernel builds, instead of "work-
>>>> shared",
>>>> so
>>>> that the two builds don't clobber each other.
>>>>
>>>> [PATCH v3] An updated version of this change rebased onto the
>>>> current
>>>> OE-core master. Changes:
>>>>    - Remove PREFERRED_PROVIDER check in linux-yocto.inc in
>>>> alternate
>>>>      kernel builds, since alternate kernels aren't the
>>>>      PREFERRED_PROVIDER for virtual/kernel by definition.
>>>>    - Remove "virtual/kernel" from PROVIDES in alternate kernel
>>>> builds.
>>>>
>>>> [PATCH v4] Another rebase onto master; no functional change.
>>>> Improved description and testing steps.
>>>>
>>>> [PATCH v5]
>>>>    - Warn when PN == KERNEL_PACKAGE_NAME (bug # 11905)
>>>>    - Add KERNEL_DEPLOYSUBDIR to avoid DEPLOYDIR collisions
>>>>
>>>> [PATCH v6] Add KERNEL_PACKAGE_NAME to kernel-module-split.bbclass
>>>> for
>>>> module recipes; fixes lttng-modules build.
>>>>
>>>> [PATCH v7] Remove second definition of KERNEL_PACKAGE_NAME from
>>>> kernel-module-split.bbclass; apply a default in two places where
>>>> KERNEL_PACKAGE_NAME is referenced.
>>>>
>>>> [PATCH v8] Rebase onto current master and more fixups.
>>>>    - kernel-devicetree.bbclass: Fixup package names
>>>>    - depmodwrapper-cross: don't error when called from alt kernel
>>>> recipes
>>>>    - kernel.bbclass: Don't install /boot/image symlink in alt
>>>> recipes
>>>>
>>>> [PATCH v9]
>>>>    - Add feature tracking tag
>>>>    - Update testing section to define vars in local.conf
>>>>    - Add KERNEL_PACKAGE_NAME check to *-rt recipes
>>>>
>>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_h
>>>> arisokanovic_openembedded-
>>>> 2Dcore_tree_dev_hokanovi_&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1
>>>> jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-
>>>> srUYwL9U_Ms&m=Po_g6d_nUSqHTshbn-
>>>> ZaBXenlH_4CQklz7Csmi7u70A&s=g1DTbKMM_NmbTwVK6ABKrg7v5Qst-
>>>> DAX8wovpBEZiQQ&e=
>>>> multi-kernel-packages-v9
>>>> ---
>>>>    meta/classes/kernel-devicetree.bbclass             |   8 +-
>>>>    meta/classes/kernel-module-split.bbclass           |   9 +-
>>>>    meta/classes/kernel.bbclass                        | 114
>>>> +++++++++++++--------
>>>>    meta/conf/documentation.conf                       |   1 +
>>>>    .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  14 +--
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |   2 +-
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |   2 +-
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   2 +-
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |   2 +-
>>>>    meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>>>>    10 files changed, 94 insertions(+), 62 deletions(-)
>>>>
>>>> diff --git a/meta/classes/kernel-devicetree.bbclass
>>>> b/meta/classes/kernel-devicetree.bbclass
>>>> index 6e08be4b70..4f80cc62eb 100644
>>>> --- a/meta/classes/kernel-devicetree.bbclass
>>>> +++ b/meta/classes/kernel-devicetree.bbclass
>>>> @@ -1,10 +1,10 @@
>>>>    # Support for device tree generation
>>>>    PACKAGES_append = " \
>>>> -    kernel-devicetree \
>>>> -    ${@['kernel-image-zimage-bundle',
>>>> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>>>> +    ${KERNEL_PACKAGE_NAME}-devicetree \
>>>> +    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-
>>>> bundle',
>>>> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>>>>    "
>>>> -FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
>>>> /${KERNEL_IMAGEDEST}/*.dtbo"
>>>> -FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
>>>> *.dtb.bin"
>>>> +FILES_${KERNEL_PACKAGE_NAME}-devicetree =
>>>> "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>>>> +FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle =
>>>> "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>>>>    
>>>>    # Generate kernel+devicetree bundle
>>>>    KERNEL_DEVICETREE_BUNDLE ?= "0"
>>>> diff --git a/meta/classes/kernel-module-split.bbclass
>>>> b/meta/classes/kernel-module-split.bbclass
>>>> index 1035525dac..73c7f18c78 100644
>>>> --- a/meta/classes/kernel-module-split.bbclass
>>>> +++ b/meta/classes/kernel-module-split.bbclass
>>>> @@ -30,7 +30,7 @@ do_install_append() {
>>>>    
>>>>    PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>>>    
>>>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>>>> +KERNEL_MODULES_META_PACKAGE ?= "${@
>>>> d.getVar("KERNEL_PACKAGE_NAME",
>>>> True) or "kernel" }-modules"
>>>>    
>>>>    KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>>>    KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>>>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>>>>               postfix = format.split('%s')[1]
>>>>               d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix,
>>>> ''))
>>>>    
>>>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
>>>> or
>>>> "kernel"
>>>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>>>> +
>>>>        module_regex = '^(.*)\.k?o$'
>>>>    
>>>>        module_pattern_prefix =
>>>> d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>>>>        module_pattern_suffix =
>>>> d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>>>> -    module_pattern = module_pattern_prefix + 'kernel-module-%s'
>>>> +
>>>> module_pattern_suffix
>>>> +    module_pattern = module_pattern_prefix + kernel_package_name
>>>> +
>>>> '-module-%s' + module_pattern_suffix
>>>>    
>>>>        postinst = d.getVar('pkg_postinst_modules')
>>>>        postrm = d.getVar('pkg_postrm_modules')
>>>>    
>>>> -    modules = do_split_packages(d,
>>>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>>>> output_pattern=module_pattern, description='%s kernel module',
>>>> postinst=postinst, postrm=postrm, recursive=True,
>>>> hook=frob_metadata,
>>>> extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>>>> +    modules = do_split_packages(d,
>>>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>>>> output_pattern=module_pattern, description='%s kernel module',
>>>> postinst=postinst, postrm=postrm, recursive=True,
>>>> hook=frob_metadata,
>>>> extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>>>        if modules:
>>>>            metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>>>            d.appendVar('RDEPENDS_' + metapkg, ' '+'
>>>> '.join(modules))
>>>> diff --git a/meta/classes/kernel.bbclass
>>>> b/meta/classes/kernel.bbclass
>>>> index 756707a3c2..48b718d777 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -1,6 +1,9 @@
>>>>    inherit linux-kernel-base kernel-module-split
>>>>    
>>>> -PROVIDES += "virtual/kernel"
>>>> +KERNEL_PACKAGE_NAME ??= "kernel"
>>>> +KERNEL_DEPLOYSUBDIR ??= "${@ "" if
>>>> (d.getVar("KERNEL_PACKAGE_NAME",
>>>> True) == "kernel") else d.getVar("KERNEL_PACKAGE_NAME", True) }"
>>>> +
>>>> +PROVIDES += "${@ "virtual/kernel" if
>>>> (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>>>>    DEPENDS += "virtual/${TARGET_PREFIX}binutils
>>>> virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>>>>    PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>>>>    
>>>> @@ -34,11 +37,32 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_pack
>>>> age_
>>>> name(d.getVar('KERNEL_VERSION')
>>>>    KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>>>    
>>>>    python __anonymous () {
>>>> +    pn = d.getVar("PN", True)
>>>> +    kpn = d.getVar("KERNEL_PACKAGE_NAME", True)
>>>> +
>>>> +    # XXX Remove this after bug 11905 is resolved
>>>> +    #  FILES_${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>>>> +    if kpn == pn:
>>>> +        bb.warn("Some packages (E.g. *-dev) might be missing due
>>>> to
>>>> "
>>>> +                "bug 11905 (variable KERNEL_PACKAGE_NAME ==
>>>> PN)")
>>>> +
>>>> +    # The default kernel recipe builds in a shared location
>>>> defined
>>>> by
>>>> +    # bitbake/distro confs: STAGING_KERNEL_DIR and
>>>> STAGING_KERNEL_BUILDDIR.
>>>> +    # Set these variables to directories under ${WORKDIR} in
>>>> alternate
>>>> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel)
>>>> so
>>>> that they
>>>> +    # may build in parallel with the default kernel without
>>>> clobbering.
>>>> +    if kpn != "kernel":
>>>> +        workdir = d.getVar("WORKDIR", True)
>>>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>>>> +        artifactsDir = os.path.join(workdir, 'kernel-build-
>>>> artifacts')
>>>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>>>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>>>>    
>>>>        # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>>>> KERNEL_IMAGETYPES
>>>>        type = d.getVar('KERNEL_IMAGETYPE') or ""
>>>>        alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>>>        types = d.getVar('KERNEL_IMAGETYPES') or ""
>>>> +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>>>>        if type not in types.split():
>>>>            types = (type + ' ' + types).strip()
>>>>        if alttype not in types.split():
>>>> @@ -55,15 +79,15 @@ python __anonymous () {
>>>>            typelower = type.lower()
>>>>            imagedest = d.getVar('KERNEL_IMAGEDEST')
>>>>    
>>>> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' +
>>>> typelower)
>>>> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname,
>>>> typelower))
>>>>    
>>>> -        d.setVar('FILES_kernel-image-' + typelower, '/' +
>>>> imagedest
>>>> + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/'
>>>> +
>>>> type)
>>>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' +
>>>> imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' +
>>>> imagedest
>>>> + '/' + type)
>>>>    
>>>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-
>>>> image-' +
>>>> typelower)
>>>> +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s'
>>>> %
>>>> (kname, typelower))
>>>>    
>>>> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-
>>>> ' +
>>>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>>>> +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-
>>>> image-
>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>>>    
>>>> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>>>> +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower),
>>>> '1')
>>>>    
>>>>        image = d.getVar('INITRAMFS_IMAGE')
>>>>        if image:
>>>> @@ -121,9 +145,9 @@ base_do_unpack_append () {
>>>>    
>>>>    inherit kernel-arch deploy
>>>>    
>>>> -PACKAGES_DYNAMIC += "^kernel-module-.*"
>>>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>>>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>>>    
>>>>    export OS = "${TARGET_OS}"
>>>>    export CROSS_COMPILE = "${TARGET_PREFIX}"
>>>> @@ -339,7 +363,9 @@ kernel_do_install() {
>>>>    	install -d ${D}/boot
>>>>    	for type in ${KERNEL_IMAGETYPES} ; do
>>>>    		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>>>> ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
>>>> -		ln -sf ${type}-${KERNEL_VERSION}
>>>> ${D}/${KERNEL_IMAGEDEST}/${type}
>>>> +		if [ "${KERNEL_PACKAGE_NAME}" == "kernel" ];
>>>> then
>>>> +			ln -sf ${type}-${KERNEL_VERSION}
>>>> ${D}/${KERNEL_IMAGEDEST}/${type}
>>>> +		fi
>>>>    	done
>>>>    	install -m 0644 System.map ${D}/boot/System.map-
>>>> ${KERNEL_VERSION}
>>>>    	install -m 0644 .config ${D}/boot/config-
>>>> ${KERNEL_VERSION}
>>>> @@ -393,9 +419,9 @@ do_shared_workdir_setscene () {
>>>>    
>>>>    emit_depmod_pkgdata() {
>>>>    	# Stash data for depmod
>>>> -	install -d ${PKGDESTWORK}/kernel-depmod/
>>>> -	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-
>>>> depmod/kernel-abiversion
>>>> -	cp ${B}/System.map ${PKGDESTWORK}/kernel-
>>>> depmod/System.map-
>>>> ${KERNEL_VERSION}
>>>> +	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>>>> +	echo "${KERNEL_VERSION}" >
>>>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>>>> depmod/${KERNEL_PACKAGE_NAME}-
>>>> abiversion
>>>> +	cp ${B}/System.map
>>>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>>>> depmod/System.map-${KERNEL_VERSION}
>>>>    }
>>>>    
>>>>    PACKAGEFUNCS += "emit_depmod_pkgdata"
>>>> @@ -410,7 +436,7 @@ do_shared_workdir () {
>>>>    	# Store the kernel version in sysroots for module-
>>>> base.bbclass
>>>>    	#
>>>>    
>>>> -	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>>>> +	echo "${KERNEL_VERSION}" >
>>>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>>>    
>>>>    	# Copy files required for module builds
>>>>    	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>>>> @@ -508,28 +534,28 @@ EXPORT_FUNCTIONS do_compile do_install
>>>> do_configure
>>>>    
>>>>    # kernel-base becomes kernel-${KERNEL_VERSION}
>>>>    # kernel-image becomes kernel-image-${KERNEL_VERSION}
>>>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image
>>>> kernel-
>>>> dev kernel-modules"
>>>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>>>> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>>>> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>>>    FILES_${PN} = ""
>>>> -FILES_kernel-base =
>>>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>>>> -FILES_kernel-image = ""
>>>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>>>> /boot/config* ${KERNEL_SRC_PATH}
>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>>> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>>> -FILES_kernel-modules = ""
>>>> -RDEPENDS_kernel = "kernel-base"
>>>> +FILES_${KERNEL_PACKAGE_NAME}-base =
>>>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>>>> +FILES_${KERNEL_PACKAGE_NAME}-image = ""
>>>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>>>> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-
>>>> ${KERNEL_VERSION_NAME}"
>>>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>>>    # Allow machines to override this dependency if kernel image
>>>> files
>>>> are
>>>>    # not wanted in images as standard
>>>> -RDEPENDS_kernel-base ?= "kernel-image"
>>>> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${K
>>>> ERNE
>>>> L_VERSION}')}"
>>>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE'
>>>> ,
>>>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>>>> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_V
>>>> ERSI
>>>> ON}')}"
>>>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>>>> -ALLOW_EMPTY_kernel = "1"
>>>> -ALLOW_EMPTY_kernel-base = "1"
>>>> -ALLOW_EMPTY_kernel-image = "1"
>>>> -ALLOW_EMPTY_kernel-modules = "1"
>>>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>>>> -
>>>> -pkg_postinst_kernel-base () {
>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-
>>>> image"
>>>> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-
>>>> image-${@
>>>> legitimize_package_name('${KERNEL_VERSION}')}"
>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('K
>>>> ERNE
>>>> L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '',
>>>> d)}"
>>>> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@leg
>>>> itim
>>>> ize_package_name('${KERNEL_VERSION}')}"
>>>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=
>>>> "${KERNEL_PACKAGE_NAME}-
>>>> ${KERNEL_VERSION}"
>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>>>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules
>>>> meta
>>>> package"
>>>> +
>>>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>>>    	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>>>    		mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>>>    	fi
>>>> @@ -543,7 +569,7 @@ pkg_postinst_kernel-base () {
>>>>    PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>>>    
>>>>    python split_kernel_packages () {
>>>> -    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>>>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>>>> output_pattern='kernel-
>>>> firmware-%s', description='Firmware for %s', recursive=True,
>>>> extra_depends='')
>>>> +    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>>>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>>>> output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s',
>>>> description='Firmware for %s', recursive=True, extra_depends='')
>>>>    }
>>>>    
>>>>    # Many scripts want to look in arch/$arch/boot for the bootable
>>>> @@ -626,21 +652,27 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-
>>>> ${MACHINE}.tgz"
>>>>    MODULE_TARBALL_DEPLOY ?= "1"
>>>>    
>>>>    kernel_do_deploy() {
>>>> +	deployDir="${DEPLOYDIR}"
>>>> +	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
>>>> +		deployDir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
>>>> +		mkdir "$deployDir"
>>>> +	fi
>>>> +
>>>>    	for type in ${KERNEL_IMAGETYPES} ; do
>>>>    		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>>>> -		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>>>> ${DEPLOYDIR}/${base_name}.bin
>>>> +		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>>>> $deployDir/${base_name}.bin
>>>>    	done
>>>>    	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
>>>> '^CONFIG_MODULES=y$' .config); then
>>>>    		mkdir -p ${D}/lib
>>>> -		tar -cvzf
>>>> ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME}
>>>> -C ${D} lib
>>>> -		ln -sf ${MODULE_TARBALL_BASE_NAME}
>>>> ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
>>>> +		tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME}
>>>> -C
>>>> ${D} lib
>>>> +		ln -sf ${MODULE_TARBALL_BASE_NAME}
>>>> $deployDir/${MODULE_TARBALL_SYMLINK_NAME}
>>>>    	fi
>>>>    
>>>>    	for type in ${KERNEL_IMAGETYPES} ; do
>>>>    		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>>>>    		symlink_name=${type}-
>>>> ${KERNEL_IMAGE_SYMLINK_NAME}
>>>> -		ln -sf ${base_name}.bin
>>>> ${DEPLOYDIR}/${symlink_name}.bin
>>>> -		ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
>>>> +		ln -sf ${base_name}.bin
>>>> $deployDir/${symlink_name}.bin
>>>> +		ln -sf ${base_name}.bin $deployDir/${type}
>>>>    	done
>>>>    
>>>>    	cd ${B}
>>>> @@ -650,8 +682,8 @@ kernel_do_deploy() {
>>>>    			echo "Copying deploy ${type} kernel-
>>>> initramfs image and setting up links..."
>>>>    			initramfs_base_name=${type}-
>>>> ${INITRAMFS_BASE_NAME}
>>>>    			initramfs_symlink_name=${type}-
>>>> initramfs-
>>>> ${MACHINE}
>>>> -			install -m 0644
>>>> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>>>> ${DEPLOYDIR}/${initramfs_base_name}.bin
>>>> -			ln -sf ${initramfs_base_name}.bin
>>>> ${DEPLOYDIR}/${initramfs_symlink_name}.bin
>>>> +			install -m 0644
>>>> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>>>> $deployDir/${initramfs_base_name}.bin
>>>> +			ln -sf ${initramfs_base_name}.bin
>>>> $deployDir/${initramfs_symlink_name}.bin
>>>>    		fi
>>>>    	done
>>>>    }
>>>> diff --git a/meta/conf/documentation.conf
>>>> b/meta/conf/documentation.conf
>>>> index a55e2836b5..2c88504fb9 100644
>>>> --- a/meta/conf/documentation.conf
>>>> +++ b/meta/conf/documentation.conf
>>>> @@ -247,6 +247,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel
>>>> to
>>>> build for a device, usually set b
>>>>    KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build
>>>> for a
>>>> device, usually set by the machine configuration files and
>>>> defaults
>>>> to KERNEL_IMAGETYPE."
>>>>    KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need
>>>> to be
>>>> auto-loaded during boot"
>>>>    KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which
>>>> the
>>>> build system expects to find module_conf_* values that specify
>>>> configuration for each of the modules"
>>>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages.
>>>> Defaults to 'kernel'."
>>>>    KERNEL_PATH[doc] = "The location of the kernel sources. This
>>>> variable is set to the value of the STAGING_KERNEL_DIR within the
>>>> module class (module.bbclass)."
>>>>    KERNEL_SRC[doc] = "The location of the kernel sources. This
>>>> variable
>>>> is set to the value of the STAGING_KERNEL_DIR within the module
>>>> class
>>>> (module.bbclass)."
>>>>    KFEATURE_DESCRIPTION[doc] = "Provides a short description of a
>>>> configuration fragment. You use this variable in the .scc file
>>>> that
>>>> describes a configuration fragment file."
>>>> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>>>> b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>>>> index 44d013f29d..2eec921728 100644
>>>> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>>>> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>>>> @@ -23,17 +23,13 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
>>>>        echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
>>>>        exit 1
>>>>    fi
>>>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ]; then
>>>> -    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-
>>>> abiversion" >&2
>>>> -else
>>>> -    kernelabi=\$(cat ${PKGDATA_DIR}/kernel-depmod/kernel-
>>>> abiversion)
>>>> -    if [ "\$kernelabi" != "\$4" ]; then
>>>> -        echo "Error: Kernel version \$4 does not match kernel-
>>>> abiversion (\$kernelabi)" >&2
>>>> -        exit 1
>>>> -    fi
>>>> +
>>>> +kernelabi=""
>>>> +if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
>>>> +    kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-
>>>> abiversion")
>>>>    fi
>>>>    
>>>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ]; then
>>>> +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [
>>>> "\$kernelabi" != "\$4" ]; then
>>>>        echo "Unable to read: ${PKGDATA_DIR}/kernel-
>>>> depmod/System.map-
>>>> \$4" >&2
>>>>        exec env depmod "\$1" "\$2" "\$3" "\$4"
>>>>    else
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>>>> index f93d9530eb..894e2ffbf6 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>>>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>>    # to build multiple virtual/kernel providers, e.g. as
>>>> dependency of
>>>>    # core-image-rt-sdk, core-image-rt.
>>>>    python () {
>>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>>>> yocto-rt":
>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-
>>>> rt":
>>>>            raise bb.parse.SkipPackage("Set
>>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable
>>>> it")
>>>>    }
>>>>    
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>>>> index c49a9340f8..be4d163ff1 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>>>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>>    # to build multiple virtual/kernel providers, e.g. as
>>>> dependency of
>>>>    # core-image-rt-sdk, core-image-rt.
>>>>    python () {
>>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>>>> yocto-rt":
>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-
>>>> rt":
>>>>            raise bb.parse.SkipPackage("Set
>>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable
>>>> it")
>>>>    }
>>>>    
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>>>> index 25d88833a9..e489bbb9f2 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>>>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>>    # to build multiple virtual/kernel providers, e.g. as
>>>> dependency of
>>>>    # core-image-rt-sdk, core-image-rt.
>>>>    python () {
>>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>>>> yocto-rt":
>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-
>>>> rt":
>>>>            raise bb.parse.SkipPackage("Set
>>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable
>>>> it")
>>>>    }
>>>>    
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>>>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>>>> index 6734dc0d05..8212b1445c 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>>>> @@ -7,7 +7,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>>>    # to build multiple virtual/kernel providers, e.g. as
>>>> dependency of
>>>>    # core-image-rt-sdk, core-image-rt.
>>>>    python () {
>>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-
>>>> yocto-rt":
>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-
>>>> rt":
>>>>            raise bb.parse.SkipPackage("Set
>>>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable
>>>> it")
>>>>    }
>>>>    
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>>>> index 9c1f61be75..8a70eb5018 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>>> @@ -12,7 +12,7 @@ INC_PR = "r4"
>>>>    # PREFERRED_PROVIDER for virtual/kernel. This avoids network
>>>> access
>>>> required
>>>>    # by the use of AUTOREV SRCREVs, which are the default for this
>>>> recipe.
>>>>    python () {
>>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>>>> d.getVar("PN"):
>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=
>>>> d.getVar("PN",
>>>> True):
>>>>            d.delVar("BB_DONT_CACHE")
>>>>            raise bb.parse.SkipPackage("Set
>>>> PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
>>>> (d.getVar("PN")))
>>>>    }
>>>> -- 
>>>> 2.14.2

