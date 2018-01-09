Return-Path: <mkelly@xevo.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0050.outbound.protection.outlook.com [104.47.36.50])
	by mail.openembedded.org (Postfix) with ESMTP id 17F056010D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 18:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ghidRLeWSmaJ7c4hYWmpNm5C0becAS0BdoW+VQQsbgQ=;
	b=P0v+hbHT/f6hmHekCyDSae6T1gaTfXVolog5y1w8NwopDZDMuTo1nRiOXJdZV0WtDB1yD63EA0rKRxjHFj18w3fFoit2DhOOoJ3A2/DiqWvME4zoX4NqXqDLPpJLDDLfZMhCFU2y12Jbp4xm4E7ul0HQT1/ZXYj+Mex+PItAgfw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Tue, 9 Jan 2018 18:18:05 +0000
To: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<CADqQcK6VA46LEmCymx9OT_+JWcLPX56PmW4mzLzh_8eLgG2UAQ@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <ca64103b-54b0-b12d-bc3b-23a0b69421cf@xevo.com>
Date: Tue, 9 Jan 2018 10:17:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CADqQcK6VA46LEmCymx9OT_+JWcLPX56PmW4mzLzh_8eLgG2UAQ@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR06CA0029.namprd06.prod.outlook.com (10.173.44.15) To
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d34aa6-e80f-4572-2d1c-08d5578d53eb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	3:X3WEl5fW0/UFM5+rCMdVsRiEj/xf76L7CQEPx4aiXwznVGLoVWn96nREscgTvb+l6knskNxklyDJGnz9QxxM7C56TXPkKK/EqieK2308xRAfVFEXbJa9FyBuAZ0yDLcEG2Mabc+HhoTAqZC0/pwlyKlIj83pv1C6CGyQePGJAxDffu/I5Q5GbbUlchYDfkkg/wXpweJWl5h7x4JwiIk49OUAfvBQcbfeaxCtvb0+UbsRE0tmY2I435AFC9X0f0IV;
	25:wl0YORD9wl4nqaItOUH5oNCk9YOJf+YQCIxTwkDOrNPwHDvqFSOgfIEIdAQkRLGfHBUYF7955uBDpNN6esdIL6lD49LwNlIBD4eC1PTZSZ7ZpWR/Mw+2plC4UYMPr1NEDQ4/QVuKCGCZozq4AIg0PVVW5gBkvKP9CPXwg43R5/WLRLmTiJYgE940ZNJlS0UibCyzC32jk8LKN86zQJIB8BRhKShn6WcQso8elyYJKnIpl1wXpGemxx/HtHFdbplkn9iWIRfq2XgF4g+mWcSYouov8p8RODRXWHkxDm9nH+MAS345gHaD54vOcwq2rVwrZebkl2Dco+Ko732w739AMA==;
	31:+wSK9JfJcg8ad+Ah9jrI7H8+kPxuq9nWzxqeqvPDLvoDFBysg4+mH6RtXWfGqDuF/R80BlnDvJfLY+hmJlh2y6J4d+fVWITP0QyxbP2NtZqDufYMfWGC0FccWONYnm99wCZrTkVzYHnwX3H5+Uj52mAm2xghdoyTACocdZmJWjziDUF9LCzOX3k+c8ACn3/4/+wBV1iVcFqDxecCB4rpaSOXj+q/FDInqB5fP/KhDfQ=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2933:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	20:jarg2hJL0oAOjPi8gKvagbe4XvW3WH6LDH4qvIiL21EpFt63Z3p1USqXZwfCIaKkBdoVPsLR7bd1TseoJRTd5H6dXNx5veAWqPY2UAEfgNcigHw49Ij5df7P9LtX38MWMx3So9Fh5zZmoh6zBZmx8Z6C5X4sRtBkREYJjPs3zEdItUOTNRqP0YFivq8MbF67aPOP9sLQqYexGT8cak6na4J0VJbTZv4yYkOLAhVaytPqvQJyP/T6Bn3O41g08siRoH6R8JAb1QRfSrVcv+7GR8AAprIVmzqf1ZFF/XVRiBRL7ttwFAIl/k2fFG0/yoCjAwRfGfEj5PH+s9Nnu4LfLODDXTSezdK1HNUDFw1VBLONCcAYdCzFMWrmeiaAUeVNWO1c7B3MZVec+609SJFa6PdMCQoecK9Z+RKKbpYZUls=;
	4:s7h7rSWxdf0U8JKuFGXtSvxadmSdJ/TFIpobG4dYx+ZkvX8rJ71VxqgTc+3PH8Jech2G91VdQjSWtlGBT0RuKlam6FAHzXxLafDQO4jVojrnCASSTVbubJJiUYFeWeCp0/doZsM5PyFgKYrwhbgBf3oa01FXw0iPh+Fo9b/vEu7BbUCisiWUNY71pTbuWwFbyLODnjkysp7LPasircg+gErV/8yiYIHFSVd7T2IWr2pycveWHbvU5mZQwY2oXd02YRFHurNDItSsMWVsFbbtTjirksDdODe6/Rn/p/RY6jY12UPRu0iVJ10OJFHAKY1d
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29339F637F20D9FD283609D0AB100@CY4PR0101MB2933.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231023)(944501075)(6041268)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR0101MB2933; 
X-Forefront-PRVS: 0547116B72
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(396003)(39840400004)(376002)(39380400002)(366004)(24454002)(199004)(189003)(316002)(36756003)(68736007)(31686004)(2950100002)(97736004)(25786009)(50466002)(86362001)(47776003)(6116002)(3846002)(305945005)(54906003)(58126008)(105586002)(6666003)(53936002)(16576012)(6916009)(7736002)(77096006)(6486002)(23676004)(52116002)(2486003)(67846002)(52146003)(229853002)(16526018)(83506002)(39060400002)(478600001)(76176011)(53546011)(4326008)(230700001)(8936002)(81166006)(2906002)(64126003)(6246003)(31696002)(65826007)(5660300001)(8676002)(65806001)(65956001)(90366009)(66066001)(59450400001)(81156014)(386003)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzM7MjM6UjJGUlhjTTkxbTZaZndSMVNjQkVDN3dy?=
	=?utf-8?B?UXAvSUtIalp0VlFUblk2TmZWY0ZNb2EzNVhKbFpqQ1VOTXJsWjRMZUNCRFVj?=
	=?utf-8?B?U3J0alo0RU1HUTZpS3FzcG1TR1RyYjJiN3FXZmg4RkFGdzFyd1pOOXpLc09F?=
	=?utf-8?B?Z2NlNzh2ZVJ3L1lPdUVybnd3QlBWa3NURFd1aE9MYU9HKy9ISGtlNk1HZEpP?=
	=?utf-8?B?SlZRL1dTa1p5T0NhNWlXZFY4d1FBSjY4STRwUEliM0ZreTAxZGE3Ylhpb21k?=
	=?utf-8?B?UGV2SWpVdmtiaStjSHF2citNZDJGNGVMQlJLbXNXWmp2VlppOEpnTGNJeHBo?=
	=?utf-8?B?K2RnOGdtbjFpY3JjUlVNTTZ6amU2LytnU0lDdE1LT0NvdUpmaWxwd0d2V2l0?=
	=?utf-8?B?b00vZkpMUnZDeFJXdlNrOTBlTlgwamtnVk9kaXgzZ3UwWERreE1TTzlwVmV1?=
	=?utf-8?B?YnRZU2I3N0I2cFBhSEJuS25sK0I5bVFaN1FKUVR0VVNzWkpIN09EL3hYbGtm?=
	=?utf-8?B?RHVxeXZjYXN5S1hSR05wZVU4K2pmWGF0MUJYbFNKZDZjWXFOQXUzTEtGL2Uv?=
	=?utf-8?B?UWUvMXZaWWQ4OWVVcHBiV2pPNlZMT2VCTjNIV2tNNERlUDBJcjlhbjI3bm9B?=
	=?utf-8?B?Nm9pMENCK2xwdjl3Nkt6bVV5emRjTEpJZXRUYnQ4eUxlVXhaR1h1dEx5QXdL?=
	=?utf-8?B?YmFnUVFyUEhwbGNEZHNYU0FFZ3M4Tmw3cjg4NmFudG5aRlpXTVpQYmRxcTAr?=
	=?utf-8?B?ampXb0Q1R3IrWnZad2VNSzNZT0FDclFKSUlLNmFNdHJ3MFl1c3dXNFFuemVU?=
	=?utf-8?B?bEo5cFVRd2p6RlljMkJlNTM3MUw0bk4rU0FlWVd0dnpIWVljczUxcEsvZ0Nt?=
	=?utf-8?B?dS82ZU9VYkJKcTNWTWF6d1dHbjd2RTJLcm50YkdPQzZwZVJ4ek9HN3NEaEJD?=
	=?utf-8?B?clloK1NEK3IxbjBTL2kydFk4SHNKS1VwWEJGcVpJSnZ5VHZYNzF1QWwxWUh1?=
	=?utf-8?B?cXRJcDJ2K2h3bkNRZm84Ny9LKzg4UTd5NUpZajE5QjZMbnllbUdQYThhQmtv?=
	=?utf-8?B?bHBaRkFFNUJidXpXampQOElnVjJZcUNZMGlOd1FQSG81dWNhY0s3QjJsWmVZ?=
	=?utf-8?B?aFZ1aWl6NzJSUjA1UVRHbmNTc3ZybUZDR1BTSkR5UWVVYXppLzdCQ3lKU0J6?=
	=?utf-8?B?cFBXVTRkMDZMM1lBMHdqZ01UQ1dmSHAxWFV1Vmw0eXpQMHFkbXdZQVYrNGpR?=
	=?utf-8?B?aVYrSUhOY1lhMi9CMG5WU1ZYNkk1djRBQmo2RDlPbitXNDlNeEI5endZbmJw?=
	=?utf-8?B?RDhDdndvQ3MzYXNodHNCblZLZXNhRUV5TGw3dW1YTGVsY2R1enFUQXplMHlL?=
	=?utf-8?B?bTJUT0tQMzRkM2tCRUZRdkhHZXo0WGZCei9ZYmNXZ1NpOUxUMVlxcnNNYnBt?=
	=?utf-8?B?RkVTbTNZMStZbWZhejV6Vll5dW5aalpDNGNJVURYM0Q2YkU4NlFTUHpUL1VM?=
	=?utf-8?B?aTN5ckhtWDkrS0hlTzhHU0t3cTRPTkVUL2UwVWozR083NkZoZDN0QVNOUTMy?=
	=?utf-8?B?T1MybkNFUGpIbzJ4a3RhNFBBNlorMGsxWGMrZTVlb3Bld1J4Tkg4M1IzNTRB?=
	=?utf-8?B?Z3dCWUdDc2VqamtjOUhVNm9CUDlVOFVoTWdTOGF6TllreWxxZ3VYZnF6WlA5?=
	=?utf-8?B?MlVpUlYra2ozVHdtTE9ncnNmYjRucVJOQXRWNnlkaitMNllhaHJFQy9pem5v?=
	=?utf-8?B?OWpJZyt6aEIwcUUyV2lxSHRGdmZuL0JaYkY1TVRvY3pyVlZacHJWVHhPYlli?=
	=?utf-8?B?dGNhVGRzQ2h2SW9jbGhteDJxWjJocDFJbW9EcnhpQ1NsNFhhWklMaVU0T053?=
	=?utf-8?B?cDVzbHhQOGJQK3M2ZER4NWlCZ1ZuRHQ3bk9Oam9nN0VXR0pjWXBFZFdrR2xY?=
	=?utf-8?B?UGZBbTZPOXlabEVIMEJaN2xjNE14MENiQzcxYlM5dEpUa1djem5VQVlEOEFF?=
	=?utf-8?Q?gws96Mfw?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	6:82Oiw/Kkf+OZy+cUPVTSnoNdtiSmRnTtzuxbjeWUdEWPZ1r20Ct3u3D4xN7/ahR6xjJCyQg9wZ9Q/idanhghkfVS9AxxM2xeceFhHXxGXglH5WlImVMNuslzS/IKocjSnDOPuEi5S/GcviXDChVz9FC79xdAFawO+9U95zjXTvwRDg+EuwQWBNpZX66PfELBWC79u8pRjQf90Ed4d1d61t5xin2MG2QY32HR9tlzrm/hpYwHEt6LWCefDOTJn26lrj94ezr+vsKpf4T8sKKqNyrtaPlwbDNlRA+Q9EyAiNkiA/hZpqitdGx4UYzlPvaqEMWxBqA7uh3/0OPO4IUb//OwilpbUvJKHiCvQW5cGn8=;
	5:J6PJEvUkMT7xiGwlMbjBnFg9p0DEHKEn1tbVdgE8phRf20Bik3s1j4dxkuKlomGL9IjJg/ZdnO/QhVd+H2cmkkbJuvu4R2E1/ku32NYI44H/kd1vnvSH2tycpJ9WYdy2qFxCuHW2WpJuuVhE+NhQa2V2e1H5twLoEAhjtbgESMw=;
	24:iH38omFKXrhxld7C9g0keNoilHrH3FFHn81kCuKkd8uF6b7rJW5jRMStZl8wHsI0rNHBwHz+LOIPSixanq1jjDcjo38bCgF9aJrPcyUvqOE=;
	7:xgJe/P0Z22CZQwbJh6q/3uBnphZUnPcUrwAycL+35W+UUtE+yakmjdXrthhZT6LARn890QlrKZIxXD2JjAWOaNUpUE00VIyWzfHb9OEG36DrORBRtzjKBmD8VfS1xsPsXVVYK/HhRYN6TKggCdn6YbKRxvTz/KC/o5yDwPSYSKQZBvmf+j5um2jWG0Vblk48jsuJOGWhUYOUz5N1fujPyR9LmRfMFL4v7pB0ZarPmiNo8S/LDn1KyN9iN6Aj0OQ8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2018 18:18:05.0844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d34aa6-e80f-4572-2d1c-08d5578d53eb
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Tue, 09 Jan 2018 18:51:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/09/2018 02:06 AM, Nirbheek Chauhan wrote:
> On Tue, Jan 9, 2018 at 3:20 PM, Nirbheek Chauhan
> <nirbheek.chauhan@gmail.com> wrote:
>>> If we want to setup a cross-file to use these arguments, we would have to
>>> generate the cross-file on-the-fly (not good).
>>
>> Out of interest, why is that not good? That is precisely what Gentoo
>> does and it has to solve the same problems here that Yocto is facing.
>>
> 
> To expand on this, the reason why meson requires a cross file for
> cross-compilation is because we allow build files to use both native
> and cross compilers within the same build. This is quite useful when
> you want to build a tool (or generator) as part of the project that
> you then use to build/generate other things that are used in the cross
> build.
> 

To be clear, I think the cross-file is extremely important for correct 
cross-compilation, and I'm fully sold on its benefits. I believe OE sets 
CC, CXX, LD not because it's the best way to do cross compilation but 
because it needs to support all possible tools, including straight 
Makefiles with no wrappers.

