Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Jun 2017 16:50:05 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0076.outbound.protection.outlook.com [104.47.42.76])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6FA719F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=kuS4ejW273K+oyjV06q2JH28fZsAzcKvELEIYdg8glM=;
	b=CMAdn4wPqYyj09p1vqrlJ7nvfQ6YgaHFWU1yG8dDWDDJb9DTnkZK7XHNdltJ77SN9/F8qw5D0Q2KQVv4nCbj5lxd9XPKERuthXUcXL/jC59/aW4t1XjHlgatrVLI+N+04Bk0jnzh5u+Y8kaM6VupLQf7krZ3QIuM60H5IS/933w=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Tue, 13 Jun 2017 16:35:35 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
	<f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
	<CAJTo0LbpaXG07FouMMN5qa7zVUqkgxAG5OciFXQmhCzoSxrrEQ@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <55c25692-acb4-01d7-5c6d-c180508b8729@xevo.com>
Date: Tue, 13 Jun 2017 09:35:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbpaXG07FouMMN5qa7zVUqkgxAG5OciFXQmhCzoSxrrEQ@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR18CA0029.namprd18.prod.outlook.com (10.173.208.15) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-MS-Office365-Filtering-Correlation-Id: c90c8d12-4609-4839-d661-08d4b27a37f7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:QCwLTOnvDSWIRR2oAdTTE0mQxLQqS7+Ol7uYJrMiQaI5c7e8zl+nzWKnAjyG2UT+a6ioAIfIglfdWI5l7EhNLQ8I+rHD4nt+NHnWORaI9A7qbYQaH26wJguIzToRYTqJ6QAIxVZqeweOBXKKx3pTy7fsA7J7InF/7zBWfrR/8zCS51lHuccRCBWdgUJ+P0REEn+oLpLgYWqw2X0TYq3CAZd6Yw4DUmfro9tjKdfWP93RqXGTzkvTynCc2Hk8J3p+9wN+PndxhoHMJvNKu96MrTI5GzB1hNVDtJqMyk17inEBC1HpXMgerEf4T8O0GWLXMXdBBX9U4jVehvfXbs0cvg==;
	25:3xNBBEl/yS6sSUTdWJ5DamnNO5iAizXRjoUZvsig9f7z07/q4TF2mnb300YF8kWhA1ZxNfe16hSyoV2WsIJuAaLFihRu/NZpeXHGUykyc2AOZZ7JOm/TmpHavc/7IR+xuco6zbIfAuw9vSpCfuyDCQzpbkrlEukePRleebYAFYZiGLSlVbML3PfLD66JaFW9+KoOQug7gmDGaUm5178bP8Px5e450BlCd8DO7ZdopOkFQNBIFrPdh6r5JOEUpTXrJwovpL7pZfISoVDlTuVLFa18oHqAcUYa9EFWHLmHpSXh96IaExe2htoVu7lfkQmHUgcS4sVxM19zeKgpm1cWUf7wSzahdHHMLALCrWhFafCaKNtQB970VBGdNlfY/aKxBDAu0RIq0DqExeYdWnh2Wqphf4ojpRIAoWfSqvpPDThqkkppYgNJw8JpWOHZpgi8tH8boOyqM3Isx7qfAZTmyYgtVF4engdw1dC92Zitm4g=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:eoOxZgvB31daW1BR0bc1MY/bujdZbLJTINsO73avwbVCtsi8FouyDQerwnlZp9WajdBe77COjeU34yZh247mHfMGCJsk0fOP5XlmMZ+pXgA61UOMjlpRNsw5KOzzWJ05cusbJUiRP8eXck5ekWqJewl1yu5lP+dGkFABH5UFeldXPpXsQnIEYdh6WGzKU4zNVGCu+YN1MSd5o4ylP6AoUSHJMjppWIM3CcW3CTxT8qu1/YQ0Awwm6iB5asi09Wb9;
	20:NohxA+FRL6NJBZ35lo+0LkK8YIwhd0J+Gb+2MMS2JW8IjnR4AAUw0LnDv+dbvPlax2b1tG6ZtQuft7nNPhIAGaMh4qupnBjB1Se+n+vzFXUnNm9ARjMOMisLt5pNEdUiXSgY0slZJe5Wr2rYW2E7k7BfDJ3uDgSFQLjGaTrgRo3/63vos3W45puGKpjr3pbviDLlOOHDy3ueEuDGYI8oAAuV9esN9Q3MQmKPp0KoXugsporfeF+Rh8Ay5WX0eBgJVFCpHrTM67A1dVI+UqwFh0pcDjR1RmI+a64H/5X/YibXTk6xGPIWMB49rbkzZBYFbgmpCSxAxdjmJSoDWaBwmg==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293572BB4BB1D55225816EA3ABC20@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123560025)(20161123562025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7NDppd3R3TjVIRmVWUHArWWtreFl1ZmNCYU5l?=
	=?utf-8?B?dkRFa0xad1hBdnlaZ0kraStjQlh4Y3VKV29kcitDNnhXVXpNTHFNUjFEWnVD?=
	=?utf-8?B?Vm9nMnd4NDFLaTFpT0srdWU4cGkyYjFCSFNmbG5idXp3emtRV0ZZeVcxV0hU?=
	=?utf-8?B?UlBvNjNZSkZJNXRCS08zeXlBTnR2SWRKeDEzN1N3UEpwMEFORG1Camgvay9F?=
	=?utf-8?B?WC9RZkY4OWNWSHRvYmlZS1NKZTBoYWloLzJYUEhWODBRY0FUaWRqRzFJdjU3?=
	=?utf-8?B?SDB5bW8yZjV3My9weWdPOXRORjM4aStyUWhRUTJ3bVBoQ3kwZENjbVlqdzRn?=
	=?utf-8?B?Q0JTV3ZqVXNtRnRQNThrc2pnT0tBMU9mT2FmeVB0bkdhOUhxZW0rU1RPejRY?=
	=?utf-8?B?eGZNQzRaQXpXdEVjK0E1M0ZJSmRKcUJDWjd3c0NzZ0xyM25XWTVVTlE5NHJ5?=
	=?utf-8?B?RmpmRThLSi9ZUjg0RUdkTVlia1VKR29zQVlCa3lXK3VDWlppNWd1RS9sMnpz?=
	=?utf-8?B?bkEzYVJ6b1lXV0FmUkh1V0tORk90TUMrdWNZS3M1NUpYMlBkRkxPcHJkcGNP?=
	=?utf-8?B?bW8rb2tqdUJuU2Erb01OaG9HLzM1YkppTVc1eXljWlhnZ2VHaUtUWEo0bzdn?=
	=?utf-8?B?REVBSStPN2lvT0U4aFlaMGRhMURGMTI5bllHckpaejNoTTl1SWtCOThIK1BD?=
	=?utf-8?B?czFvVHA5QVJCQXhhSFFvWi91cjMybDN0VERrdjIyOGdMa2Npak5oNU5RM1Mr?=
	=?utf-8?B?ZTN0NU9CNGZnQmY1L3Q0TklYNk8rMEJxaERNdVNiZ0xTbUZ4SmEzRUdIUzJX?=
	=?utf-8?B?WXlEUzZreE90blZCK1pOR0g0MXZpV2RNS1hZQ1hPZ1prYzU0UlhDY0poNnB6?=
	=?utf-8?B?dTljZUV5R0xtNXd0ZnVCRm04RllibVlzU1dCNVZ2Yy9IMXFGMlVPZ2ZmcUVP?=
	=?utf-8?B?dThyV2dqcnpwQXlrNys3T2xwUEdBOFA5MDN3T05Ndy90MFVFSFRydUNaOUZj?=
	=?utf-8?B?eThYTXhST243ckdoVDFqelJNOUh3YjNzcmtCdEUrSHpGeU1tMHJKVVRTVEFx?=
	=?utf-8?B?MVdTb2NmUXVlYmgyeDVuaURiZ1pGZjM1aXhoQmdycG9nTTZFeGpETDlncmV5?=
	=?utf-8?B?bjQrOEdycUs3OHo4aGNkancvbG82SGNTYkovWGxIN1UyMjVNRlJYTXUyUHhH?=
	=?utf-8?B?OXBXYnA1ZjRDRXFoVlR1VlJVTzFnVEdHSk9VSUkvRGlBT1NjT2xIZytaaEJP?=
	=?utf-8?B?U095R2VkekFMYzFEdHJwTlNCeGtWOXJmNmUvWHRlbDRneHE4eFdKWm4rbi9u?=
	=?utf-8?B?ZWlrVHIrVEd2djRtcGJVenRhQzBFRGp1RFNTTzQ2VGVoQWd5VlY0bEJmMVlv?=
	=?utf-8?B?OFBHWkk1N1pNTXMzRXZla0lKNVB4bGFlUnBYWVMycVpyV0gwRWxTRkxRTUV0?=
	=?utf-8?B?ei9zTnpkcFYzQURsUURyMFkrSEptNGQwanNoZzRSaHBHdUlHZnZpZHpFUk90?=
	=?utf-8?Q?eOtqx5c5ZYsInF/46fcjSUWHes=3D?=
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(979002)(6049001)(6009001)(39450400003)(39830400002)(39400400002)(39410400002)(199003)(189002)(24454002)(377454003)(54906002)(7736002)(38730400002)(6666003)(23676002)(6916009)(2950100002)(189998001)(77096006)(6486002)(8676002)(110136004)(53936002)(93886004)(6116002)(101416001)(4001350100001)(97736004)(68736007)(3846002)(90366009)(47776003)(478600001)(305945005)(36756003)(230700001)(6246003)(31686004)(50466002)(5660300001)(4326008)(229853002)(2906002)(42186005)(25786009)(31696002)(66066001)(81166006)(81156014)(65826007)(83506001)(53546009)(65956001)(50986999)(65806001)(106356001)(76176999)(54356999)(105586002)(64126003)(86362001)(33646002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935; H:[10.0.1.79];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7MjM6WjZXSnc4SkNhWmlSVnBra05ybnNTNUFC?=
	=?utf-8?B?WUs5d3QwZzhENFFsczZiMHRCREVvM2pzUzFmUnRocGlmMGt1WkUxbVdxTUxK?=
	=?utf-8?B?cks4eW5iclVIbUpVUzlWSVpZREpvSnR4VXlZcUhqVG1tbGF3UmNJM3pRVjhV?=
	=?utf-8?B?MENmMHZKbzZIR2p6R0tnN1NzRHgzYWFnTHpIWXZscWZaT2F6bDZIelhKYURM?=
	=?utf-8?B?RCtMNFhwcXpxajhaU2x1OGdmNkxxU3BMZkVUZkhpaGd3NW5LdGZWOCs5UGpw?=
	=?utf-8?B?cHdOWk91NXo5M1BwNnYwdWtKN01FbC9kOXlPN2cxd0FHaVJ5Q0ptRlNESlpQ?=
	=?utf-8?B?ZGhVdzNPY3RnVVhEVFphRnVoNXBiMUxMc3RMWWdwNVNpY1N0MnVGOHd4eDlR?=
	=?utf-8?B?cjREcmtLVkZPU2h3VzlINk5yTUlnM1I4M1lTUkNRdlFrUktuc3FsaEM2VE01?=
	=?utf-8?B?MUdMSFVzTEFONmFqekU4KzFGdUZ3V1UzSzYraEFuS0kzeGlRZzcwbXB6bkJO?=
	=?utf-8?B?d2hVaEhiODFuQ1ovUzNtNnJOR3R4eEliYU5zVUx0RDArYXdnZFpnV3hoZjNC?=
	=?utf-8?B?aWE1UjlKT0hpbDZ4M0YrQ1dPbjVJVm9TaVJ2T2NLVWxlbzFTZnFmbFBuV3RO?=
	=?utf-8?B?UVNEOWRmcjJGdGVaUVlsdldKSWpsYnJrZjRDSGJSMzZaSVZZWmFrZUc4dXdk?=
	=?utf-8?B?M3ZmY1VKMDZtR2xhbGtBejlHZE9mMEJLL3B1UWNrZGFDa3FiTnJEdUV6TEZ0?=
	=?utf-8?B?OGp4b1pOSklCc3dMbWRydCsyUXF4Zk9FTVl3MjFRNlBvaWxkWUV2b1BWUjdk?=
	=?utf-8?B?V3lhb3h5a2hBMDU3N0lpQ2pISU52bGY2bUZJUW43U1dkRGVqOGVic1R2QVh1?=
	=?utf-8?B?RVJGTHFpV1IwOWFmT2lFQWFNWHpFeHFCZHFxQjhFM1hQSXdFeXdYMnQ3MEJa?=
	=?utf-8?B?aFlFdkZ3QVZWTHd4YlpWZkFGSzNTZzk2QjFKZENCYmdMMmNOZzVrYzJaai9D?=
	=?utf-8?B?MmxWeWdoeVJ1UW9iYjVqRXUzMUxsdFVReWZpODdTQ0JJbmYyMGJveml5QXlw?=
	=?utf-8?B?NjdOV09SWnB4UGlNa242aHNjaDl1cWZJUG9tbGRMdG01MUxJVjdVeW5icFJ2?=
	=?utf-8?B?blhmT3F0SzBRT2twVkNmemdwazhYZW9hMkEzdVRRVWU1dlRwYnBzTlVNS04w?=
	=?utf-8?B?NVdWeFlkdjk0N2lQSzZrd0JiZVMxdDJwbUJPb3NSVWttSWtBaDd6Zlg1cXdl?=
	=?utf-8?B?TjBvdUdYMkI2U2VlNC96MWhSYlNucXFZaGQwQ3UxcjQ1OW5BQzVVZ0xoQmdU?=
	=?utf-8?B?eGxLLzFBeldYcDR4VkFhOXhGbXBWTEtybW9Za2tZOERUZ0MvaUVEcmg2QjZ6?=
	=?utf-8?B?YnJWcTJwdXlJdFhKVnRYMGQxNElzekFCS3ExdCtvcmg5L3VDZDBNalVpVmpm?=
	=?utf-8?B?YU9XZlpkRFpaOHBsc1pPZEhXejA1TzFSUlpRUkprZGdWVlRPYmd4NFkzbjVn?=
	=?utf-8?B?MEYzVkZwb1F2U1hXN0JiVXdlMXBzZUZwbmVwd1d1akpFRVkyU0R6cUx0a2oz?=
	=?utf-8?B?R0g4R0FLVzM1VlRKSEhuUEhwa0FKczFBYk1rWkpBRWJuT1NNREdTc3VNcEVo?=
	=?utf-8?B?NU1iM2IwcjRwOEtYVjJaSlRVejBPYXRaeVFadmh4aS9EK1F1Q3NJSHVIT3Nx?=
	=?utf-8?B?eFQrR2tkYm9kVXVraDYwSTZFbmdTcUdmL1RDT3lwdlZKb3BlaGgxWThMYjRo?=
	=?utf-8?B?WmRzb3Q2VXQreU9XZ1pNNzkwUWI5akE2Sjk1bmx6U2ltS214dDU1eHJjQncv?=
	=?utf-8?B?Z0toYTZjMjBSREhGemtsb2poZEJsNFVrSnU3cGgzVnhnODNUMTE0bFh2K3VI?=
	=?utf-8?B?QU9hRXoxWldKRkZ5Q25SODRSU2g2TmYzYy9BcTVwUG5KZXI5MXRtSTVLNFdH?=
	=?utf-8?B?YmU5UUpwbHJ1QmJpWG1iazF6ajVyOHJLK1Jrem9VdEhQQTBZbjkydEM0KzVQ?=
	=?utf-8?B?cm85UFM0Si84YkdQd3dZVUprVUk1S0RtMHowbmFvMUJ6VFErdnpqRWhwbEha?=
	=?utf-8?B?UWNyOG1LRzhpc2NHQ3EyZi9FMFJEMktQaWhWOW90RW1tQU15MUR5UFFmWkth?=
	=?utf-8?B?WE0rbHhIWVM2TFlvWUREc1I3bVdpdncrNjc1NU9Kd2p3dWM4bG9zUCtmSmNY?=
	=?utf-8?B?MnN5QUxibXk4WjFrbFlhS3hPWlV6VFE9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	6:Ul7PsVgXXQ7PuIkY3H2sDZvmMxF9FqdRj2lojhkAinq516ECu9aG6/qNfJdV3AvwhKGTGMHe9C5JSS10zcbRIDcMHEdxWoGwfiPJPMduBYCTB8VICG9smEZ/QlgqT2yO6UC0/GiiE6LJFBZ4bbT5n3hR5RiQeFWX6MdB7upLkHsYYCD1H3VEJ+W0BKiVUmNIHyOF1v0jLYKCVCipCqTSIY2NvxocT9b70I23LFCuSBzxu+6Ryg6ACXCjSJ8NTT8ZaTdcp0xcxFbSCyqDUmIKXZdPxMThGzifoGO9F8eqjN0wj1ePmztA6aCP6jISikh13B7w8DvSR/Uo/A5bmR1j6Dpjebs9A67u95mkiAPU2kEnFuj4TGz7L6CNSObAewcT1H+7e60WGS+08dDUDydNUO2zWdrUWoJPQ1bJGM9WszRu9f9znAFl+EPvyRTmoVeMRhp6qFdYbjuuuGpf8hOqJ2c7/loQQJWO9UdM67vVFd1DG955NTKq12sb3mwnEZVf4QRML9Y2IgjhY1+q9Erc4A==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:zrMmfsR08vfgbfg7wqAvvcsqaotbpCVAMJHRJw3adED/2Gm4Oiq18sPTCs9xBhcD+iB8buTJeu4LyUecQx8q5Y8L4KezNH5Xi0u/aV80HWTPo2EMqZKjtEh8bG+yIFaBHtQGyRYz6XjkyBCSdz1OGbK1/VqooQusLWvnFNHqP9mcZrkZK4+JmnQQVzCfZ7L84ulyfHB+p9rjnxE0l8EFEiSHE/fyEqNu8dYpJ/GppOhfRC6FO70nxc4r8a9ag8DiBHZm9JB1Ubb+EuBhRD5TdiUcQ4ciAuuUPVZjRgbShcCNgzuiOSVDf6c+L7+/VzKs249CVl6xmZLCuA9Dj+nmcQpweV2oUWnULNGlIiOG+/2pcptmORZlxim4GB0FuJ8bMoEwxVBQrk87IDoW9Dt5bKNB4DcfCZqv2uYkbEl91X1mAY7zF7XQQfZLlCHDmAwIcveqRG8KvswSBSPTJEHn7VNJVZDf7LLHdNmWQ6p12pyERQZFVeu3DcqZmFBftpls;
	24:2QX3aU3KkGGx0dQzpu+JhOAr0ytCfPf4dbuabfI9JKWKEBx6uuqjDUEGoU/DE46s/fAOya9JJttDXCBFn8AFy0T4drpzmSk4rTpSKuo8neU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:UCLrQS3LRwPsK87NYJqUQC1OvqCQ/qKHf+4Xw7aWPhujUrJv4/tOA+espM5o/gVNdPWdnhh2dnRDG4HKY1am+TWXF4nV+y5U6QlSo5mA2/hDJGNNovBcCxYGKjxCKmJHJqRm2Tj1cpJGMICEwmcgGsqqEfhJi5+dFytyUXV8wopeZFzbp/DhaCm8i0TvE6EkMDsvZY31TocdRyI6+qFErEYrfKk7KDK9XmH1n6e48JqN64js2y6wrMDAdHdB6qv96Uu5+UbU5H2PgGFg9osLmXfeCLL2c4E0DPnZW4L1NNA0cSBNOfqH05a7z6uE5tZ+/I3SVnETB3OeFjai8QpHSA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2017 16:35:35.7388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Tue, 13 Jun 2017 16:50:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2017 12:09 PM, Burton, Ross wrote:
>
> On 7 June 2017 at 17:33, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     Which patch are you referring to? I used git send-email for the
>     systemd patch, and it applies just fine for me on OE-core master
>     (using patch -p1).
>
>
> Sorry, forgot to trim recipients.  Yes, it was Jan's patch.
>

Alright, makes sense. Do the patches look OK to you?

