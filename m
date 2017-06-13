Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0044.outbound.protection.outlook.com
	[104.47.37.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5C2782E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ct3jUbK1KI7NX4Ps+opiWrUuPMDU6MBBc9iPibKCrWY=;
	b=xx0ZL4mLtvfmJE0MY9KJSRbVbC8ILluOfnRiIDR/PTLsymPeUmwkXBwzpijhqH78upnN3Lgc5FlUfp6F9WuH9I2Cc4i2IqfQjgDsqrEPzpkZTRA7bPZzREx0009vna0CMbrWrjBcOfXtxSLsFXVQLA6nf1WqeuJCaS4jJjqBeZE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Tue, 13 Jun 2017 16:44:48 +0000
To: Randy Witt <randy.e.witt@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<816f658a-cb3c-2312-99ad-d7e5e3fd2bce@xevo.com>
	<9d51bbc6-08ed-16aa-5f05-e6bdd6d3af12@linux.intel.com>
	<6a20ee75-f84e-508c-578f-af03fcc3df2a@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <bf6a34ad-2f9f-59cf-2b29-8deb3aca7268@xevo.com>
Date: Tue, 13 Jun 2017 09:44:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <6a20ee75-f84e-508c-578f-af03fcc3df2a@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR20CA0017.namprd20.prod.outlook.com (10.173.116.155) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-MS-Office365-Filtering-Correlation-Id: 450834c8-bc89-48ef-b5b8-08d4b27b8138
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:ED6kpr52uH9bYm+79lwlEraXIvJG/hqcM/N1fdxRowpaBswrT7G1qUBuGua70vaD9Hlr3yC4QnzsXLODvtjfgNpS3ja1pnQRvz49b3/CI0WVzX7aXOPmYhktzvzsYo/i93TWbS8DeZndH9EpoXjF1yLnKB7jLZEsGKWeiZVl3bXpVVcXrkIuR94KrftQskFUMx22L9XTKrraJnnMiK8VVyTqnYWqy4PFDM2vfuW8Zq8r/mjoxWs8/RjnaGAZx/iD6fUi6RQlHQqmxV6thf/XT1aOF4hEsdmRPpfgYXSWozLSPkMiDSfKZrVSNFcLDwPdPnIj6uUkqvtfV6etrKEeng==;
	25:IqbxKjBkto1yZNGRq+0K1ila0BG0fbZskH+3meHySdReNuJgAFq4agiNItjtfz5BIFPc3gCvpIy9qQJ9E/6LcbYt99opjCagM5UgxSxQCccGRDuO7bPSN73GFTqKOXZ+8D7wcJjVFlk1m/K0QYH00IHWo3+3R69bJay3n1cqQC0w4rLXlIkrSIf4aQ169cpMS/tn6CcfsS/SQDX+jGLzcoHuH+ueyTKV8JvI0UhRPCo5s+nxoy1k3/uK57072Bk2b8d514eH2OnaLVlEOfzu0L8vj7m8c99v91BEFJ2tbuT3Vcg5s+3a9ztH3GPbImtNYMYhc1tfjcVKpYGqagDacXEMvFH3hEooW1IiIEYP+fgQHKusMH8VWDgy7MRuxQbf+6DhOosIut/IrZbWRNo/awEHA/Qwg/oQsBK3eoio2Qp9io3ksW58QWLZLsFdnUyq2OiyOmBYN90dj64qAFcFG8h9+1mxrpMHBesTn+SmJ0U=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:qAHSEp+MJfI+W9vpraIuZvzZ+5iRNQq5rALahF4y8aSlyfM0F18muAG3ayV0Hy1CrUaDfNP3hOUURwgZMCuoLuO3Rpq2Gq72LdKhgkYy++1XWmvHpAKf8k/goBCITBLMlZU1EhhBK/eaI6pmkCC20/3bhBgqCrlrC6q6Kj3K7+Wo7m/nfQ6HFYkO2agcJYg6PhLzQ8sl8tyGukz9sgkAmK3PJ9svZTxfMQD4N4DdSXVmbrhJ2ch36dNM01EPSpsXNTT3o+4oKKi0nyJr8faYrl94RBwARcTZwrT3w2bJ4wc=;
	20:YZNDWtyYYT7641Jmo8MFp1qAJg73N3xgKqEmLfIsYvRZcs+CDjqz28cWsihFua+MUxFM92ZFU+i6AqfYbymYD1AWZDqKSt/eS+L+BC8H/ozoauS3+q+I9feaeR8S/KudLfwZpaHdo5+k3OWY5p0OMw1XcvSvlBW7nB+aNnQ2FUX6bjcVWisPPApPOjgsxWAMHPoiJ8iAHPOpMFnLzeBEqDwWRAW3G48nZHcznv00Mk+47L45pbIEIgmR49642vgMPPPDJzdr5WSb/0WgYnW1e3LKp496kHeIry6WsoCUW3MBS69eG62t/B+C4+ZecLigPOY0CbIKcz8yeFjBh0hOyg==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293545161D359194A6F42647ABC20@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123560025)(20161123562025)(20161123555025)(20161123558100)(201703131423075)(201703061421075)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7NDpGZG1RVjFaNzJNVDluNlNRcCs5aGoxTTNF?=
	=?utf-8?B?Y1E3VUNoWVprZEJvWTRUQWEydlo0TC9FcUVXOGdBMlFLMU5rYlY4cGI5Z0FQ?=
	=?utf-8?B?UTh5RDIzNzFneUVaTFZkeUNBSUJMNHRaZ1hCSHl5cTZrWWpaM2I0bVEyU21x?=
	=?utf-8?B?MmY5Q0xtRXlhYmQ4d0t0R1lWU2cvUVNmM3d2dHVsS3FMYm9HbkNrOG1LbHh6?=
	=?utf-8?B?bW5kZkFWaW0xMmlOTjFXVkQ4N0p6Szd6bjhpRHNNSEJWUzhhRjNxSUQ2SUZV?=
	=?utf-8?B?MGdhVEpyWHBKUmlqNkNRamFmUURaQUQzdGNDWkZXZmw1SU9ndUpEOVR1akJk?=
	=?utf-8?B?OThzZU9JQy9qb3gyM3lyMS84Nng2V1BvNVJZajJGUWlkS2NKY1ZiU3ZzNWFn?=
	=?utf-8?B?Y2hCQ2xUcFl6aExPbWlHbjIyNGYxV05GYXpmWVJKYXFkei9Qa091QjNpWEZz?=
	=?utf-8?B?UG9uMzRUdnNKQ01WK2Y3QUY0VGh3dUNsSmt0RllqWngvZzdobE9MZHlsV1Fs?=
	=?utf-8?B?THA1ZWp5N0tSaE84eTJGcS84Nm4zV0xhdVdpSTk2Nmx2WUJuaVEzbkIvT1pC?=
	=?utf-8?B?dWlUZDh6b1FxODhSOWNoa21vN3djbW52N21JL21BM29qWWVuRzN6UHk2L3JN?=
	=?utf-8?B?MFdOU1lZbFp3aVlNajBSelp1T2hkTWEvN29oSVBOVEhoZXB5Ynd0dDdNWXpi?=
	=?utf-8?B?L3ovVHJTYmMvdU55dEJ4clRYTG1INldDNzBRU3pSdHMvMGFISjR3cGVqUG1T?=
	=?utf-8?B?WlVvd0psaUF1bkxPVldLQkowd0NuUWptNm55MFFMSmNIbm82Ym9tZmVZT1Vp?=
	=?utf-8?B?anJLMFpEWmZRNjAxZTlWcFgxQi83czFiaWZsdlgvSExpR2s1cDJ0NHo0bEhT?=
	=?utf-8?B?OVpRS09zbm5mQlQ0bTJlQkV3YVZGWTk0OXd4MlQzVVFsRzlOTm9UVi91Uk1w?=
	=?utf-8?B?SEFJSXpLRlJyNDdleWhybWhKVGVFSnZTL3ZWQU1qN210aXcyMVZ2eWsvY2ZJ?=
	=?utf-8?B?TWNUVldYbUc2UXJqTGl1aXRRQXVmZERzN01BNlVsYTFNeklmSURRMjJoNTg5?=
	=?utf-8?B?ZGZUVjRsd0U4U1duZzhtQTQxZEhHNUh4c0xSKzg1MWRBb0ZJdWZKSUkyRE9y?=
	=?utf-8?B?azJDVzZkemMvUVFSenpEdStqYmxReUZOUUpKSkIxZlNQVndibC9LV0hoMk5Y?=
	=?utf-8?B?VWVlSmJQV0ZVTjNkUVlwOU5DVTFzL3B2Wis0eHB1cW5ZRXpkK1B4RTgxNTJT?=
	=?utf-8?B?THpHb0c2QmcxbHFvNnlMcUVkTXkvS0JWdnVkWDRMQjFtcUUxMzJpa20rNWFF?=
	=?utf-8?B?WFY1a3BqODUwT3Bpa0kvd0ZDU0lFQnVTVUNTYllTSzNDbnRUL21iN1RKWGpG?=
	=?utf-8?B?OEpNSEcwaGdCVUZ5aVVwWUp4WEQrNzBCMGVyV0pGMXYyRUNKbENSQW9LNXJK?=
	=?utf-8?Q?jIn2IIo=3D?=
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39450400003)(52314003)(189002)(377454003)(24454002)(199003)(25786009)(42186005)(31686004)(229853002)(2906002)(50466002)(4326008)(5660300001)(50986999)(65806001)(106356001)(65956001)(76176999)(53546009)(105586002)(33646002)(64126003)(86362001)(54356999)(31696002)(66066001)(65826007)(83506001)(81156014)(81166006)(8676002)(110136004)(189998001)(77096006)(6486002)(93886004)(6116002)(53936002)(966005)(23676002)(2950100002)(7736002)(6306002)(6666003)(38730400002)(305945005)(36756003)(508600001)(230700001)(6246003)(101416001)(97736004)(4001350100001)(47776003)(68736007)(3846002)(90366009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935; H:[10.0.1.79];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7MjM6dFN0UUQyQ3BrZG9qUnZ3Q0xKVjdjNUVE?=
	=?utf-8?B?UFBVNDhIaE9CQlJxQVdmMjlnZEhPMnRyNHpNdDdXa0JIUjEwZDQ0bUphWmxP?=
	=?utf-8?B?ZlduQTZTZThpaGxPK2V4SVdLYUFLMU9yQU44VzNDS0x6UXBJMS9LSnhrbTRQ?=
	=?utf-8?B?YmhJQjYzM3pWTEUzbWUwVW43anMwOHNWRTdDY3VHS3hvNFF6NU5EaDNJamxS?=
	=?utf-8?B?K0hFOHFaYWRkWmFaSHFlU29lRzhOZkZZMVNYZkorWGttTXVuUUlzd215LzRO?=
	=?utf-8?B?WkxnUU9kdytMUWh0ZTJuUVpuekY0KzA3YmZlb3BxdW8rNGVweksveGNSRXUw?=
	=?utf-8?B?Y0oySVgwM2tIZDVxa05KTVkvczRRQ1JCMkRSSUNzdzErSWtkWTZzcExBbUJ0?=
	=?utf-8?B?dGg5U3p5ZFd5QTBTN1kwQVlsRkZoMU4rZzYrV2pBbnVaRmtkY1ZIOGFEamVm?=
	=?utf-8?B?WWtCa2paeDVoa3Z0Z1ZnUDZSTGJ3V3lSZFZsZE15VldIY2swZm43WWRhbzYz?=
	=?utf-8?B?WGtHSExLV1NqYURKM0hmc0xmNGt5cUl2aGJoZXp6VWRibHpYU0Z6VVFDV2dn?=
	=?utf-8?B?Y1pGTGlKWDRhMXVScnFlVmRZUlZ5OXY4MGtkM1N3TlZqbE8xdkZJRUxEZGFK?=
	=?utf-8?B?VjBWanc1djJCYmhNRzZRcE1wWkNTY1ZRNm01OGd0YWZrWVNuME9keHpQUkZu?=
	=?utf-8?B?WFBFOFZrbExxdDN2OXlIUFp3VTY5cVF4L1RGUEI4dENjOXRZRFpLcnlmNE9q?=
	=?utf-8?B?SmVTLytmdTNEZWZGeGhyNmRabDRHN2JVTEE0R20xOXBEbGtYYkdFUmdMd08x?=
	=?utf-8?B?bE52RDZsWWwyOWtTMldlRWY5TlZrL0pnTGNWeGhRSkNFTHhuUnoxUXNwY24y?=
	=?utf-8?B?LzByTENXRWs3WjJQcnplWkE2N2FTYUFJc0xISE1RbkJ0Z3ZnNFd3dGxkMit3?=
	=?utf-8?B?clBnWTVpaG13d0QwNnVTMnI2NzlrQ1RTR1pMS09vdlZ6QnJITWNCSjFRdzdK?=
	=?utf-8?B?VkNOVituVnFCazhQNWI1eHp2YTZEYjNsVndGdFBmcCtpb1FmU0ZaUzNCaGJG?=
	=?utf-8?B?OHRaNTlVVGZLTE5TNm9XQ3l4aThrL3RtVkd5aDlWTWZ5dzJid1h4VW5tMEpt?=
	=?utf-8?B?VUhHVDdvamxRMjE3bXpHSHRoV3ZpUUxBM1RLZDZtNEJSNVJEUm03WG5jTlNF?=
	=?utf-8?B?dXVKb2JGWWt2OHhSRUVkc1hUWS9paWdod0tnZEZjZThNbVo1NzlYTzN4NkZP?=
	=?utf-8?B?S1dUZU5GYWViREs0ejA2UUEvTGk0K1IvSjdFWVR1TFJQa0RIc0hlY0NmNkhP?=
	=?utf-8?B?b2FEMVprdzlnTi9Qd1o4TE50QnlvNGVpVjVEanNINzk2VFhTcDZvcTZTRjdO?=
	=?utf-8?B?VU9kdmlBTG5Ma21VRkhqZGFHRlJTMVRLQkdkL3QvSU10ei91UENOSTVOY0RD?=
	=?utf-8?B?TEVra1JIemlhbUZYaHpNZGJhS0lUeVU4TUJ4UkFpUEhwbFFSQyt4WUNTMXk2?=
	=?utf-8?B?SUZ4aWRwTW82YWo5aTR3U0VsdzhMRGtFaVozaE5NZVIrWGJLdUdtSElIQkFG?=
	=?utf-8?B?R2J5UVJTcTRrVVBwU2NSYXg5WHVJc2ZvNnBEeEY2ekVMb3QxWWhwSWRYU2pZ?=
	=?utf-8?B?OTBUMjltV1NPZ0IwOEZwTndLL0JwRVlvNURPU1hTOXZDN2lyaS9xNFYybG1S?=
	=?utf-8?B?L3ZaOS80OUptVlFXcVFRRTBuSDIyUzlKc3VVYmNmT0dEbWh6Y0xLSm05TjMr?=
	=?utf-8?B?dGRpQzFHQWUrKzNqQnNDS1BuVG9DSXZkdExZUSttR1lxWkNxSHErTTNsRjRS?=
	=?utf-8?B?aGhOelZESDNsNE1iNWFyT3VSTkpkQ2J1Z2x6Z0VwSUw5NmIxSlR3b05vQlEz?=
	=?utf-8?B?eGVaQzdFSHlJSzZRUDdOdzQxWGl4eUEvVUlDQ1JuY0I5OGsrSVhqL21LVGR1?=
	=?utf-8?B?bkNPZmF1ZFNPUDk4RkVEOU14Zm5ld0ZrQ1ZlWUdoYUdHQ3U2TG9STTRrWmZs?=
	=?utf-8?Q?BeEve5GM?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	6:BcdrV5kmjVKHKIDFqXAqbnc6rt1jBNOFNxeHM6ZPHhudeXPb8A6s6CTEyg4BcJ7+sp3+NXCI0bLJrSfD3sI1xhdvOwKQHsKpWyiD0XtKr+L2Mx8Pei8KNHEPHkFtVM8jnJcnhSEvwiTUqMXdaAWjQ5A/gW8CFgToZYIB+reLuXFkM33dXlmPcT/mvQUHVqbQ+m5rD8CsPdy5YuYVyQ4KWBJHoZ6DTDhOq4529u48ZRiKttNC+VOPbX7iGdoaA2ZLpLzsh9VpK7/izJaji8F2K8+eGh7gqW4JaBOAkRmCoueyDBHNthnMOGJK5cNasAhrpTJa+AL28XIPUMCro75r65Wnlsdyhaf3qR7zby8X86ImpppSexvLxFI5pplNSh7lvBTaczvCW+SB33A8MH0VGiJxiH8NX1s7CcgeZEryr/qv8Nhj0xhOnjakO+udEaXMlFRlkoHzdIyVasSjI/0q9wSxdVtBUPG3+zLB7Gmm/yZz6FROyBWJldZ+DWJv0r3ErpzrnZVZFbbiNP1cjo9EVg==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:XeqvOdCRawMFudviqpF503QHj/VvS9Ifte0n6y7ag1/II/C8hvT2LCOuFfmhO9rtEvMCcIMY/JBzs1dS3oRd9Mp7K/zGy9Ke7LmVHNo9DS72CYCkaY9l3ShZy+9TDRfx6YrVzuL5Ek5xpFUoaHni/a81GvAjq7FiOCcn57b7seLlx1R4hS2+d0X+q3p8fonRNlVuucNLpNdTi/Hzau+gaT/bA8i1SQJeegwAKo62enA7Ss23gMQO3/o0gjMFDfBv4xf4ApCKkmttPZl3pbEwGNXanKKMlMBitERVtg5/q6DjbrLXfr5CuJ+qQWuypYYzt10yVkJlaWy0phKxH8r8cPv9DlzBbJd14VTqRV6GH1uxZjnoRFZ6IT5Odvm90uNOSLrvJR4BUMNtXmnCO5bm0+ex5tJnFKzp2rhZKWY1j1s5DB6kD+CyhOqlVGCrUVWNZTaDe4VFAVDLlHmiK39fbWHEBSvgNIHdGDEZeLIiRICaNOHWY/Mkzw1QwD5uul5W;
	24:DZtK0a8QeA0KPmYOAj5X2ehZ03cdyfbO1pIfmmX5IaCGOxXL/QUOBB593hLjsD40eCd5sysAwPVo7Ohclv5Gl1Kc82n9/wlKdsUSGSvnhaY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:KzuX4r4N8J9Ty4k8HkWjS+Zt71h35/XUHxKkALeCPY3+KH2NuVk5JLF5KukjqVQ9N1fcLOYBloQdvmZIB/TsQmbtM6pOkBBqjoIdwz4ULbN98nsvbEY4MGFz6cmPwz5Ryj1fMaKN2aWr1XLFJk/AoBnW/IasVEO1wN+m29BQKd5tQbIkB5rBCmJj3Zf/cGeLdS5KCusd9n35C2FCsxTngfqYumKeqWjUrcJ4xBmd8Fn/1Sc3O6iVDhcokkgju4ZHsd8ER7bBKYAOiVZCCop1YWVz+Of/g28LLT1TxeIvyaJ9lBGEiUkzoZ/Ejr+2jekErZvDxXocvmMQ/TvBNkIPYA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2017 16:44:48.3062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Joshua G Lock <joshua.g.lock@intel.com>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Tue, 13 Jun 2017 18:17:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2017 11:09 AM, Martin Kelly wrote:
> On 05/22/2017 10:53 AM, Randy Witt wrote:
>> On 05/22/2017 10:29 AM, Martin Kelly wrote:
>>> (friendly ping)
>>>
>>> On 05/02/2017 12:20 PM, Martin Kelly wrote:
>>>> Currently, the qemu CPUs for are specified as generic, but the built
>>>> artifacts are not. For example, we build x86-64 artifacts targeting
>>>> core2duo but run them in qemu with generic qemu/kvm CPUs. This causes
>>>> some packages that take advantage of the host architecture to crash
>>>> because they try to use CPU features not advertised by qemu. As an
>>>> example, Qt uses ssse3. When artifacts linked against Qt and built
>>>> targeting core2duo attempt to run on a generic qemu/kvm CPU, we get
>>>> the following crash:
>>>>
>>>> Incompatible processor. This Qt build requires the following features:
>>>>      ssse3
>>>>
>>>> We could fix this by making packages like Qt not take advantage of CPU
>>>> features. However, we will probably keep facing similar issues over
>>>> time, so it's better to resolve them in a more enduring way.
>>
>> If the MACHINE is a generic qemu, it seems more correct to build without
>> the extensions. For instance, what happens when core2duo doesn't have
>> all the necessary instructions that some package decided to use?
>>
>> I like the idea of being able to exercise the code, but I only see this
>> fix as pushing the maintenance until the problem appears again later.
>>
>
> Currently, I believe we're passing in all the right flags (e.g. -march)
> to specify a core2duo build, so GCC should not issue any instructions
> that a core2duo wouldn't support. By passing in these flags, we're
> allowing recipes to issue core2duo instructions and then creating a
> runtime environment that doesn't support those same instructions (bug).
>
> I don't think we're deferring any maintenance; unless we change the
> -march and similar flags to be something other than core2duo, I think
> the problems should go away. If we make that change, we should update
> the qemu CPUs at the same time.
>
> We can solve the problem in one of two ways:
>
> - Make qemu run as core2duo
> - Make recipes build as something even more basic
>
> The second change is much more involved than the first. I don't which
> -march (and similar) flags are the closest match to the generic qemu
> 32/qemu64 CPUs. However, I suspect there may not be a perfect match.
> And, core2duo is already quite old and basic by today's standards
> anyway, so I think bringing the qemu CPUs up to match is the simplest
> and best way to fix the issue.
>

(ping)

>>>>
>>>> Fix this by making the qemu -cpu arguments match the built artifacts.
>>>>
>>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>>> ---
>>>>
>>>> I sent this to poky@yoctoproject.org but it should have gone to
>>>> OE-core,
>>>> so I'm resending it now to restart the discussion on the right mailing
>>>> list. There were some comments about it in a previous mail thread on
>>>> the
>>>> poky mailing list:
>>>>
>>>> https://lists.yoctoproject.org/pipermail/poky/2017-April/010956.html
>>>>
>>>>  meta/conf/machine/include/qemuboot-x86.inc | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/conf/machine/include/qemuboot-x86.inc
>>>> b/meta/conf/machine/include/qemuboot-x86.inc
>>>> index 06ac983..acd03a1 100644
>>>> --- a/meta/conf/machine/include/qemuboot-x86.inc
>>>> +++ b/meta/conf/machine/include/qemuboot-x86.inc
>>>> @@ -1,12 +1,12 @@
>>>>  # For runqemu
>>>>  IMAGE_CLASSES += "qemuboot"
>>>>  QB_SYSTEM_NAME_x86 = "qemu-system-i386"
>>>> -QB_CPU_x86 = "-cpu qemu32"
>>>> -QB_CPU_KVM_x86 = "-cpu kvm32"
>>>> +QB_CPU_x86 = "-cpu pentium2"
>>>> +QB_CPU_KVM_x86 = "-cpu pentium2"
>>>>
>>>>  QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
>>>>  QB_CPU_x86-64 = "-cpu core2duo"
>>>> -QB_CPU_KVM_x86-64 = "-cpu kvm64"
>>>> +QB_CPU_KVM_x86-64 = "-cpu core2duo"
>>>>
>>>>  QB_AUDIO_DRV = "alsa"
>>>>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>>>>
>>

