Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0136.outbound.protection.outlook.com [104.47.2.136])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACF474F9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 21:03:14 +0000 (UTC)
Received: from AM4PR1001MB1331.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:98::21) by AM4PR1001MB1331.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:98::21) with TransportReplication id Version 15.20
	(Build 1038.23); Wed, 15 Aug 2018 21:03:15 +0000
Received: from HE1PR1001MB1338.EURPRD10.PROD.OUTLOOK.COM (10.171.98.21) by
	HE1PR1001MB1339.EURPRD10.PROD.OUTLOOK.COM (10.171.98.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1017.19; Wed, 15 Aug 2018 18:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QII7+30cyMv1Ysfc2nj/O/gZ0P+eQ3pzV8KB5fImsMk=;
	b=BeRFUs76OetUdRPZyii3z1IQ6/Asz5YVZeZpKMLTjPJS/ynl1tLWMhNI8BCgLX4aAHPV6jyCKTTi5TZNbFUjd51flsoY1SAqE0Xf7mAkzVvMcObwYvCZI6k7+Sg6ldnty7pQpS2YO+nRU/L05zO5WkXCebIUtPTe+yzmZjhhlO4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from [172.16.11.40] (81.216.59.226) by
	HE1PR1001MB1338.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f5::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1017.21; Wed, 15 Aug 2018 06:59:05 +0000
To: openembedded-core@lists.openembedded.org
References: <20180711143019.30896-1-rasmus.villemoes@prevas.dk>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <518a17b5-60af-42dc-4b3b-b0dc76589fb1@prevas.dk>
Date: Wed, 15 Aug 2018 08:59:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180711143019.30896-1-rasmus.villemoes@prevas.dk>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: LO2P265CA0199.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:9e::19) To HE1PR1001MB1338.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:3:f5::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20873983-b2f9-4666-8655-08d6027c9795
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR1001MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR1001MB1338;
	3:JJHx36/aKdMPR87vtyp1TprBCZiFNCel3YTPDNP6GmMKWXJQaUFe7cNxqrPHm9XIXDlB7NjJ5bxSlKycnSYI3WJvYfl3DLcaB5Eg/2SZK0KaFoE76Jak+4mtEafBkNnIgri4Qjl9j7Hwa2PBWGsDp+SB6s+NW4I+wkypGR8y8xzn8OJoljmFTzbttslDdDoIfsHtM7V+twOp0WpJiXHVhkD9DeRiN3T+/wVpih+FckVp8SG8LApuuq55E1ehwmCg;
	25:D9+zREgjlC5vCiFvxAQZfLzdR3CeIlW+CyfNQkmEoKJRLYdGZIcr2nb+csBixOgPDGTgG7phB8/6I9kVeBel6LQNBEjZckdgsV2bgiU3peALi+Jf73QUSeCNrv257GmyHdeXYF7dLbnfpxWgtknVEvPhK3M4Ved358hjVQD35WKpnSendYOBVKYvjMfhukGMv8esVte61GHchAABPsdm65xwSiuK4vCkx35oKa4+Lz/oelkb1y5+mXijYcF2br2lWvZe9mcNLGM26QTbk4aJBywrHMCa5EI40xBohl2qjhneepf3HDaon/AuTb95+v1358yhEKPe2+ZA7s8IFNxypQ==;
	31:42ng/FEV3c4t2P+K/vUWinFwS1pRfwYdrMw/fUvsOiWgxlLtSaN9QrLtp6WGFJ+X8FkI6IDmna4WWOg3J/jC5ALY6IPv/tRYClTiGv5RiEailZ5na2T8UYyavDX3lTlqVI/GgwwUIgRkx5GzmsxJtxi0+IcNcur92ImCYpw5Fp1tsIQlO1FA0NOBh8Co4ESrUuyULVNS523T5eD4iCbYSdr+gJZU68ICVR+433meWV4=
X-MS-TrafficTypeDiagnostic: HE1PR1001MB1338:|HE1PR1001MB1338:|AM4PR1001MB1331:
X-Microsoft-Antispam-PRVS: <HE1PR1001MB13380C9A0A4E0358B057848D8A3F0@HE1PR1001MB1338.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:HE1PR1001MB1338; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR1001MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR1001MB1338;
	4:O91psa0qOlEQRNoIiTLhYjZHyTEJeLyeawo1478YHqzak+9zEsmQKYCWZDCMwTmk8SBbJUndMU8fQBf1IpZZTU2838pLQSphN2B0a6vaqjS0lUUePUY3oE8rkOoxg1xqYdqFETC/ZJ4+jsb1hMwLWG9lWfIVg8uqhXKYPDuBezzpAj1Iwawu1dbNqJG5dK1kF64Q5xve/oweai1t/ZOehNQtaT1MAllvbv5e6nvcr+RNZV+zQQ1CmXq1lcqD1AvjsRZwxe7InzxBmSCaW+KRqz5gK8IcVCT8i9r4l7z3lu0XZqoQbLQelz0et2dYpO67
X-Forefront-PRVS: 07658B8EA3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(136003)(376002)(366004)(396003)(39850400004)(346002)(189003)(199004)(316002)(6116002)(72206003)(64126003)(6486002)(25786009)(106356001)(97736004)(16576012)(105586002)(58126008)(53936002)(3846002)(26005)(77096007)(36756003)(305945005)(76176011)(4326008)(65956001)(6246003)(65806001)(66066001)(8936002)(5660300001)(478600001)(8976002)(16526019)(65826007)(52116002)(31686004)(47776003)(53546011)(7736002)(386003)(23676004)(52146003)(186003)(2486003)(44832011)(68736007)(8676002)(81166006)(81156014)(14444005)(2351001)(2906002)(74482002)(31696002)(229853002)(6916009)(6666003)(50466002)(230700001)(2616005)(42882007)(476003)(956004)(486006)(446003)(2361001)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR1001MB1338; H:[172.16.11.40];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjEwMDFNQjEzMzg7MjM6UDhqZEZZQkY0dnRGa2JET3M5aE4vc29i?=
	=?utf-8?B?L1FHR3pVTzBYUW5jV1MweHdMSmRkTktMVDdJRmVYUzRQMGliRzlBUmtRVjI5?=
	=?utf-8?B?c0lMYXZWUzV5VVJZVVgvc2IyMno5OTNMMFRDYnpncGJ3L25SejFsKzI0WGUy?=
	=?utf-8?B?SzdaaGJGRlpRbUtpOTN3SklFZk1aY2xyWWVsWkxxTi9DWWpxTFZNODVJNC9O?=
	=?utf-8?B?WXNVUHVyNnExbGwyUVRWVVVXcXJwTzQzN04vK1d6Tm1FSEkxVHVuU3V2RTE4?=
	=?utf-8?B?cnVNalZ1M1BWSEIwNGt0R1c3akNIaGc5WGgyNWYrc0JWZUE1Tmp2YktuNGhD?=
	=?utf-8?B?cXExSGg0YVI2emg5WllXRGRJdXM5QWplVDFoODNUQlBqRmhQenlmUlk1Y0gr?=
	=?utf-8?B?K2hJQkx0dERHOFhJRjR1eW9UaU52L0s3QmVHRWhRU3lxL1MwOUFBUDBnSmEy?=
	=?utf-8?B?dVNVdjlLR25oT1o3U2YxbUllRlNiNWp3QldpOC9jNitRWWdDTXg0bWdUUUVS?=
	=?utf-8?B?UXV2SDNVKzZ2cVBvTlR2TW4zeEdUZ2ZBSE4yTzYzNUtDMHFLV3Qwa2h5L1Nx?=
	=?utf-8?B?L3hKV3pPQVViams3RlpPQm5KK0krZWFHNWtXKzN4YnVOaHYxZ0VlS05ETmU4?=
	=?utf-8?B?MUJoVitqNzZjN0VJRkhGby9zdlpja1JJM2xHVGFDS1U4QWNEeHZWc0FTb0x5?=
	=?utf-8?B?bGQvelNDUmczcUttYzM5RnY4aWhBdER1Z3diSVpZSXlWM2tJQWF6S0h4d0Ev?=
	=?utf-8?B?NlFJa0o0R0p2MTZwMlZiTm9ISkx1K2FhZklzOTl2L0FjTEJqT01VL1NxOEpp?=
	=?utf-8?B?YnkxM2o2UmFBYURETkZpb3B2ZFM1a0xaMWZERllWd0xiUUJYUkFBSkpBVFly?=
	=?utf-8?B?VStDbGs5bTd0UkdnT0dPQzliWlBpNHF5ZDQ0V2pQS2kvbUF1aUlsdlM0clZo?=
	=?utf-8?B?L1Iyc09UejRvNDErSGcrU1EwejExZ1VyMzE1NDREVzVBYkRmNm9QWjUvejRw?=
	=?utf-8?B?UGRVM1poV1htYWUvS2g5UU81UVduY1FOSlNBWktaTSt0ZVF0VUNHNTJZSXpv?=
	=?utf-8?B?enRLdmh4a004WWRTbjRtemdCajdUKzI4M1dtMmxhUThiSUxtY3R0MVp0bXFj?=
	=?utf-8?B?T21iV0lMbHJkYnpXQ2pWeTg1Vnl0Und0YVFqWkhWK1huUEZGV0ZtZ2JJaDYv?=
	=?utf-8?B?MnY1T1pDZmJJMHZMWGZsckdIYkE0Z0VWVXl5SHdxYkx6UndNV2dJc1VYRFl2?=
	=?utf-8?B?em1sM25NUE0vN2tMTFFnNXl1VmdTTnU2Umw0c21TeDAvMC9RdnRDcGpPVDls?=
	=?utf-8?B?d2VMTFArZnp6SU1xeUhraGpyUFUrZ2sxcU1QTEtWc081T1kxUCtHVkZjY1Ni?=
	=?utf-8?B?cWg5UDZMd1NCSUFHLzJwVVhuYTB6MXlHVnFCL0YvVWlnZzdiVTdsa2pRMVdu?=
	=?utf-8?B?YVRNYUpuWFhhTTBySlB3SVpSMDZSZHB4Mzk4ekFxaFBoRm9TMFdNMHFzeXZT?=
	=?utf-8?B?bU1hRThrK2hKekVuR3ErdDF5VEU4RmRORmhRUDBleXVVbDdqbE1BdXNGUjFU?=
	=?utf-8?B?U0NLMzF4bWZWeGkwQStxUHh2c0pzMWpMRWg0QzR0N0NZQ0tsY1M2SGJRbG13?=
	=?utf-8?B?V2JoNC91TEhLbzRYMkJ5YjFWWFFHejZOSWg2YXpjL2dZek9TZFBOcDFKTTg1?=
	=?utf-8?B?Tjc0TUNnUituQm9RYkpyV0hsRmh0U1NNUkF4b2xvYythQ2tENzIrMVVZc2hu?=
	=?utf-8?B?dENHTUUzOXp5YVJHOW1pT1V5RDl1dEU5ZDJEYSt5QlhYV2lXS0RFbTBMSWVj?=
	=?utf-8?B?eEMrWGFGY1JoVTU3UzJBcnl0NVExd0NQdXNZVGplYjlPaEVKRjVLQzUwcGNy?=
	=?utf-8?B?OHU3R3dFR3Jmb00vU3JSQVVlTWo4a2dMVVJwNk9USjRCc3drMGdFTW9MZHJl?=
	=?utf-8?B?NDdKOEQxS2FEeHY3K2oycE1SbG44eDYrbXM0bVUrN2MwZkpJSGdzQ0E5QzI2?=
	=?utf-8?B?MmxwNTdpV0IrN1U2VitTT0p6UWxqZnVUOTBZQjQ0eDNnaVpqS3ZkNlhNQitp?=
	=?utf-8?B?MlcraTRJVGlqMDR4bExReGtaMXdKbDBGOWIvd0ZpK0NkaERIRzhDNnkxTTFh?=
	=?utf-8?B?dDM0UT09?=
X-Microsoft-Antispam-Message-Info: wFPq05o3hYhr1tNCkS0IWdlsHybivCPm8ucZPolqZTqUfIBoJaiVhSO4qTDIcgMIpQ0+ZxjnWvVcsKld4mdk3D6x7Pii7IyOD3EQjtSZ/n+3Ky94iGlnohiTnlhhaMWF9EFhfJB1y7j47NRkIHnft4sHiQtxBi5WZRgFuL9SDHxDXJ2xE8uUfECqR9iTKtCuVCKEBcvwUaQbMMCIQnD2wnariCadfDL80V9l0274BgOpFAsPWB3ND40jV4Ap9rDZfdjVXY+CNue5qLVQQZPRhvIztbP7oUwj0hCsnhxIbZg68nQ+u4rMt0bGSr/SqX5vsszE4XyOmJnlYa2dmAboxN2yquy7HH1tCM6A5cCiu3w=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR1001MB1338;
	6:1HLhTVG2JNupwtuqpgkULI++VZ228Z6+m5e6UDIq4R/FU7tWJIJuLl4mvvnOpzispn3Fpi3yF2YT+YIj0TQLqrUQ3L+XnuUQ1JCz9WvsJmpOqNWByUckjboOGPSR0BdgqgaeU+co8ME9Si2BD+lfiWuKr9sP7bOXiy6XAYz//890Sjjv6LWoiHPN/6UO60mHq4ddv3j2HVV4wcAqCXCo9A3RTI6wKtUiiSJDZNy8yuNj7pGjbfoDHuSbIipQan+z2mYx1B/ybmjTLoj5LTT3ej4OHcBrsA4+qVFzmkZABpkUwMVIriLnmnMHZcYaHUT81SQhqwZgWIttlZ3JAdhcuh7SWpnmNetSuA6U4HYKFNStGuJsSjVf8uCM2aWZTvSOdtQjokPs6wgFAbvbHNRUUDKBor6xrMUabts4x3wsf/nK4wMb2Z8v6KBiP7qYNIZWiwdfL8fHBWH8ckSBzmZncw==;
	5:Twsm6OZLOxCyQXmic4Fpngx5sI6YZBNEUb0Xz3FrOSVZDUH/+FYOYuuD58/OrfD8+oGsaL4i0AGMVCqTGgc275hTcCS9FvHcoTSrIEovBvs2noREHm2Ili/GWuG7TXP8OG90HusqS7nrrU4UYYLGTy95ZbQCO1lL0sAfab5xB9k=;
	7:R7Q8wHmrCVel3VjuGollUxTAZqstnoK1aTV6KYdzhFfTb2GpcugSbwMm7RRddYP4Y1GDffNqQz1XjZHuNFE3PEEcNUnHzwGUM5AeQ6Zx4YE/0+MpwwKf8+hq17AWFvyveF1B58BrGhPtfUXy8gt1nPIafwdb2A2jv1MbZ3gEaC2ae2lKItxnGZslxYJzYQcHM1EQSacDSC5BULtyIP9LwjqPjvPc0y7E953G6JpcwuKf8IBmtk2ncSP68wSM7GTA
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2018 06:59:05.6698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20873983-b2f9-4666-8655-08d6027c9795
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR1001MB1338
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1331;
	23:m4QVYGkhMURSji6lJM6x7j3yyR1U5d5WEtQswWKrjCtDlB/2J3TVG7yYVtOmL2cBX/ZJ37qLE8JezeU5ydS0sPJ0DMjFAmAghmfYeMp+Nqk6ZAoOGUJcP8p7CEiyjP1bKEW8/dTSxvn7C5gAHm0a+g==
X-OriginatorOrg: prevas.dk
Subject: Re: [pseudo] [RFC 1/2] pseudo_ipc.c: Use MSG_NOSIGNAL if available
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
X-List-Received-Date: Wed, 15 Aug 2018 21:03:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-07-11 16:30, Rasmus Villemoes wrote:
> MSG_NOSIGNAL has been in Linux since 2.2, and has been standardized in
> POSIX 2008. Using that when available avoids the overhead of the two
> syscalls to set and restore the SIGPIPE handler. Moreover, we can
> eliminate one write() call by making use of sendmsg() to do
> scatter-gather I/O.

Ping. The README in the pseudo repo says to use the openembedded-core
list for pseudo patches, so I assume this is the right place. I have
other ideas for improving pseudo's performance on both client and server
side, but there's no point sending patches to /dev/null.

Rasmus

