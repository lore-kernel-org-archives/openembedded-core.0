Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 897 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Mar 2017 00:04:47 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0067.outbound.protection.outlook.com [104.47.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id D17A062135
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 00:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/bfGSqmESuDWSgBVNf/yRzR0DDVVPtKhCJzLiXEvwS4=;
	b=IuiWai1P3NRaxhQy8Ne14BsWYlRQncQoBFW+oIxJf7E6sDvdkJ6q2iUtzBj9+QAu9TIwlLrvSSV4w6HHSYynXTwSURTdp6A3uby7bBYqs3Hv+pwt3IeA/U+kdBLSNjm1RaKfZgWvZnmJ15jl+EKsfaXOlsY6Ubn3y0ybeLQ9ij8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=none action=none
	header.from=xevo.com;
Received: from [10.111.61.107] (66.162.141.202) by
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Wed, 8 Mar 2017 23:49:50 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <8f9c4dbb-10b7-25b9-1f38-704645a2eab2@xevo.com>
	<20170308214636.GA17756@haswell>
	<c239faec-410b-99ff-9f0e-8b4c350b460a@xevo.com>
	<20170308222333.GA2920@haswell>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <97826fa5-1236-5811-1438-59cae184ba1e@xevo.com>
Date: Wed, 8 Mar 2017 15:44:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170308222333.GA2920@haswell>
X-Originating-IP: [66.162.141.202]
X-ClientProxiedBy: MWHPR18CA0034.namprd18.prod.outlook.com (10.175.9.148) To
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28)
X-MS-Office365-Filtering-Correlation-Id: 683f1086-75d9-4369-e73e-08d4667dcfc2
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:CY1PR01MB1406;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	3:b/XvtmXoGTWgLSE2ROWwTgC9fCucsU4vButHwnkKPniV8NKj9kT5dSKGj+Cvw0iw59afGPq3yyIbxyDvFzPLwnKxkn2XtKPcLYHZkjIRS3LrULAKs43qY07lxoZv9RYaX1nv/+ZCBpC/O21iqx/d6witfjk/G83ynMQICvBpPGU5ZG3Sg/Z1DhxQsYyKx1JTznlBLG+rWU9WFyMaf6UocZyy1IJA6+fmOYrASnO32u/Oxa8Xt00FPW49erwrI/bnky5sbV7OaZ2ZbctCjJOsog==;
	25:y/vpF09HIAAnJuT1Lb27ymHUoVR/jos3ndsu3nNfpYVZz1PvoJ3ffb1acM31cNBjkD+ZaYK0Omc0vTPA0opaIEgSME4/+SkbFkPk2A5gJKIhyCiXt4hGWPMfUsDZOrA90X31swRXhx1w0353BoUIT/+EhSn8FrQx2bvcwOEyPugXHz+v2/00HVt32aOqR/gbTEnPdpnWqHRrbTYlNFapHCzVm+mztYT5iAfypjU3Gf6uvBWUC28bqghDkQCvkuBHRBuHhQWqXQM/XoVcTLy//0nvWFRBS0MohFs3Z6D3kEtODkBk7GjVY60YhBs4FttYboYIoC42Ke1iPavnxfAP+oReXDuW9etFisxCxPHlnKE/XJjJ+NnmIBg0CHBddHBj+LKgIsZqkiGUTMvHPAnfYM3s0jdooj/QLIAR0XO2AGDr08XJ2kteS7/31C6DoFrbO2evkIkuF+8jcm0CbDhi9Q==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	31:61amc/d/5Bt8K4xmffRi6HcTBj3wM8u9ZATElCuQSCQHmn4F6Hqe/7DlGd7Iiyp9mLixjCaVIK+d2IafwGdO6KCqmwDjOKKtzkoLf7HrTG12WS4zP+hu2SKW7XgMAdqiuCxSMOtvpP4lYaxlScJVb5QgQ0F4lHZEr7UDuWZejbX1jJJ57FltNh6dFwUrN/lRDhxrMm9a0WNAz8v6AcTcNZDDNnHZTneZurLB+NMKYi1HHmyFXDzAfr2IMrmWRjLr4eHgoPvwcI8fqHDWcPbNNg==;
	20:Yz5MSQjbvVRJA3rjNg+LshlN2wbdBKBqaHPPxr8GPrwMKf8FXJb/2z69u5YmG9n1+UiriVUeNYrm8bdblQnBUHtJoH0/r3z1U/r6GJf5JScnfy46zCZ0K+SUU6L3evAHCJprZ3c6VLSWJjRnaP8ze/Rx8vryh5XeMig748Z9Q2aVh1OzeCMCJjxtONJDCvX+R75lPNyYJjZJIZIFQwBg8FyygleMPktBpGYW9x+ubu1biALOPIJujyb2F/F4M0kN72Xe+OwyVeAM0baRIZEYSaK0eNGYB0FO/V3eeWZ8FDa/gdLZm7UNomE9u2bYrv+1Bmtf1+lMb+/wkwciPN7/yw==
X-Microsoft-Antispam-PRVS: <CY1PR01MB140660531015D358D1DD0F79AB2E0@CY1PR01MB1406.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123558025)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(6072148);
	SRVR:CY1PR01MB1406; BCL:0; PCL:0; RULEID:; SRVR:CY1PR01MB1406; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	4:Ls1WzSlGfHsr0ZgHObz1juYKqFwG8VFzMOJdb9YMHxs6P5GnRYiec/ubYy6ZKDYdOCWkH+dyS4tO+L0cgDatX4p6j4VQpXDsptWHmqn1GPTDxhc+PTujVa2L0UyAg0331Los1f5aDcM82rLjIMM6IPPqSYcfhOtzTW86St9BGiN9XgAXkAZF7Ma57dE8IhBghyKL05PJvMcxbWZcjAutFh9A0Jfi7HYtIc1ONU3V3L+jz5nNROMeI/0+199i3XUV3dxIcVSfypi4sSg3Hs7xkyiKrwoLTjJKqOyK8FcNMuHcrTDLIgymuh7Gn7s3mu/G7WXXuaExnSL2QXOLKQBE2+Dsa13XBamskUrwBQMmGh73lvkNzFU3iJcbD2Oen6+4Z4eWbkAQPwktqMEmkhX/HH6kTX8MQ1xWWQrzFe+wLdAhmS2Q4mZKqwD752qiQO6v+oeU2/Pr+VDJ7Rk/oFTL+C+SZ3MZTkgOY8DdYZ/+t76d2vP25yWoeMH3Bkm1NODbwLdP+o/ZO97Ja59SIMZDMDYQXMK4b0d0OW9CmL1dpcgeNl7IwSNJgKOdh1iBXEkFnsGMBNYUqFYEzTAm2mtHMVhZlszdXKDniwuBNUO47fUnh1KQX8UO/0m8KOSH1ppU
X-Forefront-PRVS: 02408926C4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39450400003)(377424004)(24454002)(377454003)(81166006)(50986999)(76176999)(54356999)(8676002)(25786008)(305945005)(54906002)(110136004)(230700001)(77096006)(93886004)(7736002)(83506001)(6486002)(229853002)(23676002)(6116002)(3846002)(66066001)(36756003)(31696002)(86362001)(47776003)(42186005)(4326008)(38730400002)(33646002)(6916009)(2950100002)(53546006)(53936002)(189998001)(50466002)(31686004)(6246003)(2906002)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR01MB1406; H:[10.111.61.107];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAxTUIxNDA2OzIzOkZaaUZXZFBwUjNlVzhROHlVMUFjT2wzZlA5?=
	=?utf-8?B?TnVtODJFTzZNRVFhV09RN2dtcjJPeEc2dlQ3VDdSdHkwSHlOTW5LMmRZT2xX?=
	=?utf-8?B?WGZQb1d1K2thSXJXYURhSVlHVmVMbXEzU1JFWjk2akZNYWRONUlkZnZELzE2?=
	=?utf-8?B?dENrSExBeHZFa2dlaHhKY3p5RlNuVCt5MWU3UkEvcU9CcVM3c1NkaXYvWDA4?=
	=?utf-8?B?Q3h4TnYyUC81cVNycm41enVvZExnTHJTQnVYdmZyRm42R2gzQ3JiaWVTalo4?=
	=?utf-8?B?ZXRlSHdQVnlXb0FFZVZyNmtHRGpyZnhQZ0FVK3NSMVNKUVY2TkdwVGRINTg4?=
	=?utf-8?B?bjVTMzF4NHpIdXBucHQrV3hYWlJtaUpzekE5V001dCtZS1h0N2ZQNVJNRzJT?=
	=?utf-8?B?ZEM5ODJhTHpMT1pHYzZnOW1Ta1pDcFRoUGozRXgxYU5LMVdQMUVMVnVHeXJJ?=
	=?utf-8?B?VTlmVS9TZGlHUzlnMitJcnpha0N0cS8vMXFYcWNVRWM1QWJ2akpyM1NycU4v?=
	=?utf-8?B?b3U3My9GTjFWaXVvdWZwSWxDNkIwZTBEcE1tNlZUL3o3Y2NnRGdLZWdld0Zp?=
	=?utf-8?B?UmlSOXJrazk5L0VUQXhRWk5keUd5ODhqY0wxNk9LOERWcWJLOGFERzZvSkdi?=
	=?utf-8?B?ZFRwS0Jobnd3Unl0TzhXUWI4TWkzMW5pYjhZejA5VEhJcHdBQ0x4bVhiL0Vx?=
	=?utf-8?B?UTErM2lSY0RFemJqOVVEUlZxbVFpQ1Z6YlZWTFJmalJCaTVVTEFnaWZZMWlp?=
	=?utf-8?B?MGV0R2RaSyt1SkR4SlBZV1FUN1pZc0lPMWdJTlJxc2pvTnJLdFZmM21aaE1O?=
	=?utf-8?B?TkZSbkdFU2hublQ0YjI1ZVB4MmlmOWJydUJzY2htYTFtdzZXVkNTUWhOQXBl?=
	=?utf-8?B?aDFqcnNjTGJ6UkFhU0kwSXJtZFErVjZMdFFQYy9ZVUFRVlc2QWNKY2l2Qlcy?=
	=?utf-8?B?eXU1eWQ2U2h4NEtmOXNyVXRqSzhHV3dUQ3kvU3BYcktoNHZuUEZhTVFLYkdK?=
	=?utf-8?B?dTJyRWEvRWZLWUlaWWx0WHJwMEdkaU1peEJyOTFMbDg2WEsrU2FhRVJlaEJl?=
	=?utf-8?B?TmVpWGJEWXJwbFVYRXdCQ0lhdWg1VzhmNk1BUHVtek9Lek5YZjNEdTBqaDlI?=
	=?utf-8?B?VWJwZzI5MHM4MGtOQUdYazZGdVNqbmp1VDJNQzJxL2U3Qk1NR0h4MlRTU1A2?=
	=?utf-8?B?SmZiNDN1ajF3cUFtVUlRMC8vd2JLdTc4Tk9zenRxN3JURllhdVdDMTZoSlNa?=
	=?utf-8?B?My90UWZRYXNIU1ZDaWZ3THJaMCtTSS9uQ3FudXNLbjN3NnUxK012SGZ1bXJh?=
	=?utf-8?B?a1lYTG9BdlNwSG1aZUxUMENnQ3phRW8yZ1drSGFBQ1ZQd3dvQVdIbEdtQ3dM?=
	=?utf-8?B?eEJLNlNudGxNdCtEZW1tTWloa3F4WEFIRUsrenUvSFF4ZU0rSG5yb0VhS3VZ?=
	=?utf-8?B?RjdCamJPWVY2N2xvWmcxUHRzZG1vaGlGSDF6aVhRblRtdmJ6T1FBV0dFaXd2?=
	=?utf-8?B?eWVsdz09?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	6:INgRDbLYI2qLd9kq2LLLNNpinriRnKXbPfzZoL8U1SFhWLVjOWP6KUurb7JkU8K3ERgqhh/3PS3Zd9E7vTibqHzN8T4xtomDW+DHMOdr+KuM3dr7C9npZFKUjSe/svycQ5YDkFUS2g7hy65XhLE4RynLovn+GOXRwFB/EQMzxBMbzFwMaTUlGXfArDM6YRG5y/KDaVzyQgPzoJfaKgW5Wj10a/G1QCm3pctbA7gATdsqw80Bhl0pRlpBTNdtZcvFM02bqKg5HYhiF7PzJZHlMK+/khXAG0qSR5kZd4TD9m9ZYEajLUP8Oh1wFcUftkwXeGRviPrB9eUqwBBLTxU5fVexe/EMyJVo01wVT1MTaNqs+F/St1rVa0R+9xUsJh/WQ2knqBJJdO9eVOjMFe/+uA==;
	5:t6KjtV1AowI+0L7As4c5EfPl0XwFhlVRokpHIK9Wp85pQ08/FLA8J1z2kADlfzxsQhvkV1yIYgpV7G7vZIEmg9y+MD/xC3Vz1i4LILmf3rgHBJXRsE/coyT+8HdvKbNzyB56Q1afRlTgXkx3Br3cLTIF42t5Ezs/PP+C6F2Tbjo=;
	24:FhTBxk78VSV3glGug/EiyLZfJCRAsUE0ftaAbr+qkXw6nWKhsDx5ZpcDXlHfI9SLbm3918FqIsorgM8Sy+szPp4nZPMFgqdGIc0yNFzPw50=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	7:2QHJLQmboE6QeEE4VagQaYiUxsCMjMOpUM1qaBIWLJUMTgWRo4zPfOG3Bdh1FfLPkQgiYlHiACBnH5o94JDo135+R7Fgtvx10m6atDI79ufTFnDfdj1t3cNJ1Z7X/2vYheTOS7EVXq8VOi+Mzx7H9YlrkfomPA3pHOtvbPlPQiS8cLnk5iE0G/Eu51Xv9J80f2bQlMIqTQ79Fm4BMjx35YSoJgvgLk1vtj2uQpIzIR6LHoTIVOo9EBFHEuF8g5nDb9Q4EhmX5CuEt9cmL4AwpvCjzeuJRzN1nNxqqKKjooPlZGb7BbLKYOvbaEWpvF4PJkol+yQqnNG6prSC50/XYA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2017 23:49:50.6184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1406
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default rpaths in BUILD_LDFLAGS
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
X-List-Received-Date: Thu, 09 Mar 2017 00:04:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2017 02:23 PM, Khem Raj wrote:
> On 17-03-08 13:56:12, Martin Kelly wrote:
>> On 03/08/2017 01:46 PM, Khem Raj wrote:
>>
>> I agree we should not need them. Of course I can run a sed line to remove
>> the rpaths from LLVM_LDFLAGS from tools/llvm-config/BuildVariables.inc (and
>> this works just fine). However, I think there's a deeper issue here: All the
>> build-time flags that llvm-config spits out (--cppflags, --cflags,
>> --cxxflags) probably need to be replaced with target versions of those
>> variables.
>
> Its fine to sed it out, we are trying to use llvm-confing in a cross env
> and this seems to be less treaded path for it, it assumes you would use
> it for building packages natively generally.
>
>>
>> Do you agree with replacing all of those, or do you think we should replace
>> only the rpaths?
>
> yes please
>

Sorry, just to clarify, do you mean "yes, replace all of them", or "yes, 
replace only the rpaths" ? :).

