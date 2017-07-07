Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id AAD906FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 21:42:11 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v67LfFvR012973; Fri, 7 Jul 2017 16:42:12 -0500
Received: from nam03-by2-obe.outbound.protection.outlook.com
	(mail-by2nam03lp0047.outbound.protection.outlook.com [216.32.180.47])
	by mx0a-00010702.pphosted.com with ESMTP id 2be7rvnj5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2017 16:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=s2eSyYx99+KGL/JcmM3m3Za/JLX7z89PM731JGtu5+0=;
	b=Ol/ZwQo2M6BZeQ0/rcWoSw1O8MzW5PAsbR8/+s9GFq/ckVf+rdvgCbSuQhvEPre1iI+QQwa7ej80N50PdYmP4YZqgemigCesb9bA8yVC7qILDjwV7n4cQBVsdxlCHoPe+8qpZtWntxfjb8zellhbAl9Qq5BonKp1Lz+fgnWpiIY=
Authentication-Results: ni.com; dkim=none (message not signed)
	header.d=none;ni.com; dmarc=none action=none header.from=ni.com;
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BN6PR04MB0692.namprd04.prod.outlook.com (10.172.198.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Fri, 7 Jul 2017 21:42:09 +0000
To: Christopher Larson <kergoth@gmail.com>
References: <20170707193623.7679-1-haris.okanovic@ni.com>
	<CABcZANkyksLoPhEzVe_sgUnW5Vmbj51_qmqsAVVTkBP6CuPojg@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <0081024e-768e-bf6f-768f-d425e800d43f@ni.com>
Date: Fri, 7 Jul 2017 16:42:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CABcZANkyksLoPhEzVe_sgUnW5Vmbj51_qmqsAVVTkBP6CuPojg@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: BN6PR1701CA0011.namprd17.prod.outlook.com (10.172.26.149)
	To BN6PR04MB0692.namprd04.prod.outlook.com (10.172.198.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2098660-e280-4c43-1019-08d4c5810526
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR04MB0692; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0692;
	3:kqaFU2eg4ulxvBNE2wOHx/0702qR+IMnDKAPOqz+vadLejNe3paCy0/qT2yzh5Zs7vavQwk94LXSLbS3lu+p3/+TDr/F3CKsO0xTSZee7471ZaesNrlbo/1yZ9CcCcXKhqyWJu58X7FvHpalnyYK4jTZHFrTvLIHAPcy4M6Qc/VNCiOVCAp/v9K+AkKHAK79GLh8uwWLl5VRc/QUFXqR+duYh5TQBj8HSzbGMJjwzFsIqmYY7AXgnRHm7+D7EBqsfGCI2nOiYwiuvtRWfVTDrvc2lT/bGOwe5G3KI3SXTBOUOiu57oJnrvS2Nxr80VgfvrjStpVibseLnR8Fy8KXojDgEtN75YS4aMETTmice1TAFNMF9HiHm8Uk50TkY6j01/hpshc/5oYwyOTteyimUyxvIZj0ur8LPF8702tsp+QJDCD+sJjR+ssByVbCuTGqRB+L/vdmaw+m7crUGGgs/BlbZfEgnUNSemFe6qZi4XkpHGe/NaTm4utKvPNpCzeouwif0ckGkCV1jw6R3Cy54xi6eJUTgo1u0SAR/dPATGHayJraUqmmbl+yzKIVUfFri4F3+dLNt5cTxOqVO/RqqtsT7CEmzMK2JJs5MQjyqYPlsl8gS7y1nc/SNXeLHt/28Z9338SjHkqtQMA8h1NnQDjQQkYTyGTlexGqA67wu6n7Y3EwkGwz7aS/pDFCgyZh1StYqHX4F93yr8ZLcEmd4A3v2IkilnaCS6EOcshr+Ot7qSwdQYC5I8GR02GKFdEs
X-MS-TrafficTypeDiagnostic: BN6PR04MB0692:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0692;
	25:KzEjeXtqLx9MfOe1/RuzZb7+7DYqKVIavDgNvrDqPF3HnrO9eoeNsserDuNhwALoI4x/yAOuahkY7t4LEPupaX81ZG4/i2QZ2bF8lWyIVep9hAwWHrgUE/THe6cgQDVN4q0CDati64lPKiQkkyuRHdnLsSTtDxmTIe8pgd3O9pkNErj548uulneRTBrcudecwlXV78+B+PKOmLggznJLBE3zf6dkj4592+Qehh7pHeJKpbWT9BtZqGWJ0FazCI8zZgJ5O2nAPV/GZ0t/DPFNxLncvqNQO9u/rz7ibcUzZu9Lp5lWJh4HweJ+257MbTbQqj5tkMSfU6e0WlRh7Gd/4DtcYvCaudyfazKG5no0R1p+v5jz9V6sOi4mqO+Y6+CnQJ2WecD2Oxhz469S5NqIsJYkTsM0ADlP0erZoJwqVw3bawnELGHueEkYuV8X9CKoy4PuGH9Ar2Cvk0MYWm6P5lb0IgGJ+MAj+nUqx4Ib6nh0UcjhAr/bhnvLEfJGGIAVYmqACZpyvIjaujkmB+blnW3Muq37y5+KX51oB4sKKckq4TD+ddBbME65TN9m/dsSEd+/4xeUC7S1KqdjWco+ZI/U6DIBLz7vMP6z65VCjS4jVp6IXMCDvt4Xj+tSb2DB4ioaaMc6f8YToWkB+nvJA/F5oT/ntv/bpVHMYWL6r5rTCbYuxhZDNDbHYv+HUr6db9QtgAwWydJMdeqZu3Z0wfI6OB3mBGAyJ6zxcMfLyxKJTL1O+rvvSEPGWg4BypjzrkvmKebF3Z+l0WjHgRQUB2XfD1lC7wXhFrdSJmD20kH5UJFJmDseEGYOnEJ22yfuvvUKx9JQFGJnvgSFfMrbmwZBooQRqkqC33gZw8czh4YKFt7KUR300QmaIHCFwHq5vSbINPjv0zdXYsBtxlLTbkifwqjI6UR3fNtOstbwUTU=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0692;
	31:jZx6rtr7iyOp/Ai/cZFV6NXX83gHOKIz6FGgWyajLytNeXiQh/eTRqCvovrpEYVfoyt4L4u7mEfSiW4nXa/mcWazv2GwJZ1Hf52C2I23j12iYhxVZQPDkJKzb+DjCjxgvr/PPnHFykZADh00mzSIPECwaad7HHQ6Hn/5O7hQGVXhP83XSF4uN8AxLj0ISxCX4A9p+LqGq4ufwKvdjRkGDmpQHiXpra33AEwJ0lEkmb5GdFtfBuv2jlXGtcSvHeL01KzuvIJvkCYG1jXWfQqeBW4QUpVdUDNj/mlaNDgwc1HW4pR6bOgvwZi4yh5yVOiENpKlt2z2wf/29jtNIK4iO1TmugpfeJlDln69YInwjqv4guwQ/Qo9RfiSWX7kxZXWitnjsAWJ+12LIgDASskc+kbQIZ9eiiynLmDnjjTDOOE0uCCufpY6WgDFaegOsAiiTCzHxToCTRr3t+P0vMlkjFRgT0mDkq0JkW//EAMIEYjW7/Br5aPQYFd7jdvmLwr1/MCZbZJ1A3vCMx3mGYqjj34sFhNbj5+HaIs7h4paW+7RS5Li7LfDANf/2yGyrzCHrTMq9wgL7q697t31LHRYs0mgh52X3ghy3YowlHarpMbwu3biphfhq+4oBSjsp01WVawtzzlJiur0/K8tZvo91pA+x7FWVSOMV1gVRS85InQ=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0692;
	20:ZStiHuIN1+bUqTPOKOFyiJPHRvGXibTP+QFLbTUia/4Vgyb7Xl/KA2M5Tequ80d+2JdA2bWCpEcV91z+/1U9sAzG6XF+75Acd8/bioaLSPR+yQCETQ13k/9Nq0dqeEad9vTnDqlkqQXdubl6VOaLARSGQkbg9jSxiM35dpOKdRE1IHQ1QN7wfZedTlyD0sXII6jwRW2lNKVwOCs+D6tYrQXM+3jTzY7OWtlaJt6jhBbdr2t5oiKdvCPc37wRQrloH3b8Y5nD7FTChGJ9E8C+DLS7RsMhupHt+mKUCuY746VTf+ZAdutyKepVMqVkhOZoWFafnSO749uz+F7bMNXAOmhg6725SLNY1s9Lc5fAd0sXykBC+xvfPJKKdzuL83tktBzuX5ZlQi5R2ZTWszup52ZqPdHxnGVjWAbMkv2q5TzAgvK9rLmyoD+ATY4KD8PIeoBT/65+MZ2kBQ/SfP7li4gnpuCGQ/UGEE7CAoNVabzg3EGQiHex1zn2ToU/hRS1XfYFEFjMlbI5Qjam60RZ7u8y/hM+Yg04eRburg3xvTDKMiAQcmo6e75cUO+BOGg+c4xq2+Zkflb+gkzKpEUtdp17Q3usQ6MTY+oxJ1oABtY=
X-Microsoft-Antispam-PRVS: <BN6PR04MB069242A13F51D3D25441C2F9E5AA0@BN6PR04MB0692.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(60795455431006)(166708455590820)(236129657087228)(264703809997249)(148574349560750)(145744241990776)(247924648384137);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(2017060910069)(5005006)(3002001)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(20161123560025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR04MB0692; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR04MB0692; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjA0TUIwNjkyOzQ6bEVJWFpCMW5wQllNOHFWMVdJZHV0THJmQitE?=
	=?utf-8?B?QWZKZmdiRUg0UFBRV0RPUWlaSXJMS293V2FRdTdJWkp3bUNQcS9hUGhLUmZI?=
	=?utf-8?B?T3lGb1VYQjZITG9HK0YySVFxM2E3UnFoL3pUbUVSc1AvSlhNTEZIaFlDWE1I?=
	=?utf-8?B?R2dDeHlLcEtzT3NueDljYktFdmJPdW0wUUVKYUdNWVVsbEh1c3RWRlA0NUhL?=
	=?utf-8?B?M0g2RVp4MW04WlkvOXk5cnYzenFtVDlhVEJaTnJDcGRXQTNaQWwySnVXaDE0?=
	=?utf-8?B?OTBJNTMyYkl1OUFQMmp6ZGVCdTl6a2dQVlFGejVFZUNLM0xnTzQ4eGIzajNB?=
	=?utf-8?B?bnd2QitFMUNaYTVkbGJzdXRuVkYzK2FnT1V0bnVBSktMaTRRb0JWVDZYbUlx?=
	=?utf-8?B?SDdMNmRtZU5VQVJnWVlNRy8yOEVYZlNvQkJ0Q0ZaS1V6SzJVQ05mWm1WdWdn?=
	=?utf-8?B?aUZsY2ZUNldzSlJKN2dXZHN3L2Z3K0svaTFRMWdUbGdjc3ltMGZZRHU2N1FB?=
	=?utf-8?B?dGZodHlLRU9CaC9ENWxmTGhZaTVaQzl3VUUxd0NaWHZYQTRUTXZTNjBCVUpW?=
	=?utf-8?B?YUUxNjlQMStzMVVTc3JtcVRrZGxLZFdjMmFzZ0NSeklUVmRJZWNmZUk0R1J4?=
	=?utf-8?B?SEtXZ2ROZW9abGEvTjBsZGRxWDlPd21qWkpxanRsQ0s5eGN5eFI3MVVsUlBu?=
	=?utf-8?B?Tk1oZDVQMWxrK1d5ZnBYN1FVS3FkVzlka3JQRjFGdk9nd1dGZ1JSTG9rZUtu?=
	=?utf-8?B?cTcwNFBJbjZVNVFvQjVGWG45YVNCZXdpT050R2QrQUlWeTFoUVIxSjB3NEJ4?=
	=?utf-8?B?QmQ0R05taEdFQXplRjBCeFQvVVVUU01WMSt3RXBkYURNK0RwVW5CREpjcTRP?=
	=?utf-8?B?QmxFVEV4Z0hzbDBySUNQeHVzV2NnUnBqNXBqaWxXMUErTlM5RkNLeVZ3aHhX?=
	=?utf-8?B?Q3Z6SzV1VkljaU1SNmpsL0hGM1J6cWkrRWdvQ3lCTDIvYjhwVWVra3k1SDNU?=
	=?utf-8?B?NzJwS2JWVGJid3laMm5BaE1IdllVUWxUVWJkZ1R2Qk9qb0MrbC9uUjM2dW1Z?=
	=?utf-8?B?d0ZLanZIeHJoVGtBb1RCK1JkTGdYQUNIRGZkSklIb0lLZmFXdk03MnR6S0Ey?=
	=?utf-8?B?emZ1V2JNcnc1a0ExVE96WWoyMVFqWUI4Y1NMNXNTMU9hYWoxbzB1TGYvSXVJ?=
	=?utf-8?B?aXRSY2tSdFZhQU1hYXZON2lIOVdYRUVYMTlVbk04ajFyL3ZaYWVSQjV3b0h4?=
	=?utf-8?B?czNEblNacU9iNDJ5SFdqUUFCYTh3UUYyTWl4dlppNmlseUQ5MmZTTmthZGJD?=
	=?utf-8?B?VzNnNDRrUXhGYW1DZFduT2VwNmVHZlA3WmpoT3BRcmtta2diVmRhV2RhVmtX?=
	=?utf-8?B?dUhFZDlKQ2tIQXkrbEYxL091V002UllRU21hUFFoQmJKY21QUE43ejNBSHg3?=
	=?utf-8?B?T0R0Uy9tZXlQMFRLNjh4TGJObitYNEorYVVUOTRwK0VCMFpmNjR1bDhpNUw3?=
	=?utf-8?B?anNWOGRVUHI0U3h2NlJUUGNJWXdpODBZN2IrNnFkQ1RTUDhaRDFQYWM1QUZw?=
	=?utf-8?B?T1JFWGFmRi9UbEo5ZkxZcHlJUEppM0luM01KOGNKR3dnK012cko2V3ZwVk0y?=
	=?utf-8?B?bHpoZlJJekdrRytjbGRMVkJzS0kwTEZLWGJZMnVFMGp1K21ZWTVlU0tWMHhC?=
	=?utf-8?B?UmR1dTBUb0FnSDJzY0ZSaElRYWoxeHNodThSQUV0c1FEOCtMV2V0VnJmSDRl?=
	=?utf-8?B?N09uSFczeno0Umk1KzVMM2tPNE9EZC9HUmdzUzY1QnVzWC9NNmg5ZlNaSjZx?=
	=?utf-8?B?MlRxaVhKRXJxalIyTDN0c1J0VHc0WlFoSno0cnBvNFBlbm1WTVJpWmNHS1Vq?=
	=?utf-8?B?a2djb3YrME5wOXV4ZTFTWVhGbGF0d2FMWU1kdkhJYm9SWmdNVlhheXFyZTdi?=
	=?utf-8?Q?KZ3OyxqcMK/EKGMq10pDZkR/cihV8=3D?=
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39850400002)(39840400002)(39400400002)(39410400002)(39450400003)(24454002)(377454003)(551544002)(25786009)(76176999)(5660300001)(7736002)(36756003)(6246003)(50986999)(2906002)(54356999)(8676002)(305945005)(38730400002)(6306002)(110136004)(86362001)(2950100002)(31696002)(81166006)(53936002)(3846002)(1720100001)(33646002)(6116002)(4326008)(2870700001)(31686004)(6506006)(66066001)(83506001)(65956001)(6512007)(47776003)(64126003)(50466002)(478600001)(6486002)(229853002)(23676002)(6916009)(42186005)(189998001)(53546010)(4001350100001)(966005)(6666003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0692;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjA0TUIwNjkyOzIzOk5FaFY5Mi9BUkpxdUtNQUhvdVRldDd0ckha?=
	=?utf-8?B?VWVNb1luVG9pZWlJcEpUdldxQmtLV0ExUGZJUDRMWm9LWVNRc052OG9mREFX?=
	=?utf-8?B?YnZ4Tm8zYVh5RWZEcjk1cWFWN1MvWTI5bklLTVhreUwxbmRnUExFNXE5Zjdj?=
	=?utf-8?B?MWtEcWErMitYZ3U1T2JCdVRQTmZwbkVGa1FJdmpaTmdIbXBicU11YlhqczBx?=
	=?utf-8?B?VVlPd2RtWkN3L1NvMFFUbVNNT0FnY1VjOWZPUTdSZ1FRQ0VrTE0yQ3ZqSnVQ?=
	=?utf-8?B?YllIeFluSVlibHhKalkvRUpmNDBCRHZnN1Q3NUZCeitidjNCdzJSOVVQSXUz?=
	=?utf-8?B?SlpkZjF2d01xc29uY0VYL3hHWU9RZlQxYURMbFVLL3NTbitBQUJEckJNM0Jr?=
	=?utf-8?B?WFN3aDhUWUVtajBCMEQ1ejdycmdrWVlYd1huWE1kZDB6UGx4V3dNNGh2TmNM?=
	=?utf-8?B?NWR0cE4wOVYzWWFUeDZ5d0Q2bFpqMDUxcmhtRG5kTmVJT2FxelRjQ0MvSEFG?=
	=?utf-8?B?eFkyc000bFJodDBVc0pHLzhSb3dhRkMvZmtxSmFaOWsxS0ZrUjhjOXlHdUVI?=
	=?utf-8?B?eHRDaFhiRWJqUjNvN01sS0syZzV1RGJTc0lWWHlYeXpxNnlwcG5aZUlPTGZo?=
	=?utf-8?B?YjZnSFQ2ZVZQM3lYbjFiK2Rkb29tRDBISExSM2JBYW5KMVRZaUQyb1dPQi9M?=
	=?utf-8?B?bzBNVGg1N2ZMc2xpdUpHbWlSYk1lN2MrQUljemtjQkljQmdxbDVsYVNCWkFl?=
	=?utf-8?B?akZXS1hCYW10bjNPcUFJTG9Gai83RHFVWFY5cVB1UTBUMHAyd3VZU1NzaXNF?=
	=?utf-8?B?U0Z1WDVCS3g0dDFPSmwyRUppUFpoNTZTUktQb0c2QmE4WnZRa0s2QUFPTk5B?=
	=?utf-8?B?NTl4Wm90bG5Gb1dqc0J3bEZOczBEeDY3ZUFMNmtPeVp5MGtScXIvcnk2M3lQ?=
	=?utf-8?B?R2xLalRXN2cwb29SUFNqVGRmTjlOWWtqT2NmaE9rV1hWODhyY2VOVXh6ZDRJ?=
	=?utf-8?B?QWU3c2ErdE04WEN3Y04xenZCR2NQWGxMZ1hpSGF6ZThrZUFNY21jTnRSeVlZ?=
	=?utf-8?B?Z3dnbjFmM3Erd1FGUHpZcHNqLzNQdzUvS1BGWWJSUE9LRmNyemFBa2ovK2wv?=
	=?utf-8?B?UFoyZFZQWjF1SVJHYTF2elpTZDAzUFpSZFlhR2FFOS9QOWhYSkFkZGQvOS8v?=
	=?utf-8?B?MW9jOEsyZXB3ZkFIM3QyT2RYbVZudW5VYlRLMFBhcGFDd3N4YUxxN3UvQVJN?=
	=?utf-8?B?aWExM1Nhcmd3RnF0aksrclhCdXR5and1RlFubUxLZHROSHJuYXAyQ3NzakhT?=
	=?utf-8?B?ZVFBNWF3UEFzSENTUWpxOGFWSEV4QTBZT2hBOFpERnBaQkkvZlFvU0c1Vm5M?=
	=?utf-8?B?bnI1TEZ2M3RjRTkvc01GYUJva1p6ZHlHZHp3MUNZanhMMjVtQXlMWUkyZFBt?=
	=?utf-8?B?SlYrWWgvMTZzckh3ejdpQkxzZ2hXL011Wk5KOXB2VUNJUlRkMWVBRXpBeXFZ?=
	=?utf-8?B?N2lPeU5ESzFvYVRGYlVISWNyekdCMG1DaWJvS0xIVS9na3AxQWUrUlVhSzJv?=
	=?utf-8?B?VjBpN3JWbDdCM3JOOWVmd000a3pXd0FMeEtEZ09ra0tuaU9vUlNCYWNYSlpv?=
	=?utf-8?B?cWxaaGVyL0dTcEhGdnpsZkZ1YlVrZG11VngrQ0JwNjAwZnU4STg0NHFNQ0w3?=
	=?utf-8?B?dUdtb0RrUDBGTFV3WVVlR3FXQUxEUzNEZlZDc0FJWHlvVktlTjNCd2pMdTU3?=
	=?utf-8?B?MDZ4VklsVE11aHZKeFUzQmJWVkcyUGc1bDZMNnRpamZPTFIyR1M5eEp1N1A4?=
	=?utf-8?B?Qm4veTlib2VKRithK0V4c2V2aEJETUdvMERpaC9sSDR6ekE9PQ==?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjA0TUIwNjkyOzY6NVBtK3BnVmg5RjRYYk02eWdVekMyNkVsaHo0?=
	=?utf-8?B?UFdvSGhPaDQwa0NtdHFzby9KRFh4VjlNRDc1RDV4Ry9DWW53M1huWGJSNXAw?=
	=?utf-8?B?WnZDNldHb29GYmRadE1KSHJ3aDFjSjVOeXM4ZWRVOXo5SStxL2NOeGxCNXZv?=
	=?utf-8?B?bnRCYVlWMGh5YmpNVmNEaWVOOGo2MVkvRDMvSHdhRHgrVUNycHVPQ25rTHcz?=
	=?utf-8?B?bWxpbUhjRDh1VHFWRGJEeDRXMVh5SHRleEc1WGN0ZDZPOTkyTzJ0Z0xqL282?=
	=?utf-8?B?S29EenZOdnlxbFpVMXZDTDdrMkozdDRHZHNIczB6eHdENnZXdS81dVJQKy9I?=
	=?utf-8?B?V0pYRzZzY1c5SXd5aGpvVXI4L3NaWm9lams4K20xVDBsY3QyRUhxblRTdVhh?=
	=?utf-8?B?c083cGJLSUFVVmRjOUx2SlhETFpkSnM0Yjl0MmttcEZVVnNERFZjaldnOWw1?=
	=?utf-8?B?U3RkODZNaUc3L2sxTTV6MFNYWlZZUEREZnpaU0lkVDNyaHp0c2FzTlgwTUo2?=
	=?utf-8?B?SFdSY2dnL2Z1NXMzMzlVZGUydVN5S3NVS0E4bCtRNlZ0eVB4cytkVVZoRVA2?=
	=?utf-8?B?bm1kdXhLWG9uQXpCYzBSb2pNZjBJNjNSSURwWUlpMGh1RWxGaTFxUVRFMFQz?=
	=?utf-8?B?Tkk5bEM1YlQ5eHJCZ0JCTlRLR0ZqYjE3ZzcyS2xyRWhkUnN2UVFUdzRmR2Z3?=
	=?utf-8?B?L1RlVkQvaWMrL2hyZHMydk1wVVJSUFBuT3ZUaHVIdjgvVHg5UldUams2YWRV?=
	=?utf-8?B?VlV1elJKNFR1WGFtbkpHSVkzV29ZQlJuMUhWYk5veTZsekl1bzNSNU9zbmZ5?=
	=?utf-8?B?UnQwWGRFamVzcmZzdHp4aEIxb003Zno3TGM1cGlreVMvM25OdnAyRTYrWG0x?=
	=?utf-8?B?VTNQYm0yeU5KZGpFZ2dFR1E0MHdSZU5PSjFqNGdCZ2dHZ1QyMUZZODVvT3Fw?=
	=?utf-8?B?MWRBaGVjL2JVZUx1UGJtSzBlVkRiNWpueEE0K1JkWTlzeWxFOWRNYVVBZm5k?=
	=?utf-8?B?ckt4T3pvZjlsc1J5T2tiSXhFS2tYWlVQZjNzbWVLKzJyVU9aSm5kbHVycDhy?=
	=?utf-8?B?N3Y4NkQ1STQ1MXVKbStkS1R5d2t6dFArb1gyajVVaHJLcW1xOGQ2UTJqRUxt?=
	=?utf-8?B?RkFsamkyWG5kcm9iMUhRZ0FXb3U2Y1RPa1ZlT3FjRGViVlowKzZlUnlFQzQ4?=
	=?utf-8?B?OHZtMXBySHB0S0Zac293RmZmcDJ3dDZYaEdRRUVxbFJZTWJMWFMrZ0psYmt0?=
	=?utf-8?B?aTZ3TXFIVlZ6cXZDaDBrK2JXdytTbmVMMVNsaDFFQlo2eHVtcG10c1duVWk1?=
	=?utf-8?Q?2nODcOA9UhMCjGVnhOqILUu0Ig0vs/U=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0692;
	5:05aFWymhfQ9ZRBGVfp6r6knE1eIw0bgNT5PfbDfFGAZueeny9TycarE73kK+wdngUdEgrmX10eOZd7QLpFQVjgASbMMPXbyu2FSu9Aseqv/qtEN2efjvbXf3SKB/CP0HDfgnEdqYiCP9T2ACDh6J3UlTDKiDYn7ApQpmHCEnKAEAX1Tli4M7LkRqJYKF9FoQ5JutzQ0z3vM80J3pYARUcsz53jwqj9y6vmikiuSZFm6s8FRQBlzlZXtfoyEadQJzML8DgTReg1m+/WvhFCKQK85ccm616R5pUMgIo05ZMS42TT6/xYIAh71NDygHcybIv00Xqi11EESzo8819sOwlXAF/pVIJiWY3ksbNCT3s+yMkwzEYbdfjCwXa8PT4MXD+GKWegtUNr1rdPOYqBUb1OCA45+Q3mLLoAmgGrQazC+s9QaWOgSROioCDizmAyj6m2x2vbaKZbIlRPhQFTOVY9DfFO5ivKjl2GfzT85h1nfP+LFiDeOfkFVT2VsNFaoP;
	24:fCGGnQCCP2KNai2K8SrOiAIEjt4DgdR1LEMG3UOR0vAzLbmGmiUQDri4oChf0is96FVgxA0y8T5oa+n74olnTYZrkWfOLc/O/hCZySpKrec=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0692;
	7:t5511boP32W16YD8hjo1hZBtKGWTRxvDd4MTrX176fItsnkDWlqAuah+JogS2l99F/Rb7rw+dTa8wTHlYhRvcDl+qhJGq1MJN1pbf1eEh2DImksFOfppaxq0qnb921XVEGPaQLyO6Hl05ZXMvyPT2q/k+hTVzqbJ6uq7xCi2S1fPYI/xxrOi3QE/F1zJx1IcV5nvvA4OrKmveWvWKKFkobiQ/rcQ1QLwDHtE6a5klqXClU6Fks+FSH8nmv5kBrzPSUzXskNEV4kzVcRrN+rDJgcp0Dci80rZOmx+kVExTRfRojVytlmoqVkIYm+Op6kK5qvhU3FjSWLU6QghCTrURw8v6cmFdDHqlOiKP93m1HZx+ttrUzA+WlFGmnSn+Q+tCI/eSZ0teOdMUsY0vOJwCgyQ4yaQ3RSJfqLr7PQ2NbSVEGQDUEsDB7vTQZYJhe3Pgf0t1MZxFFhfJSwhZpoJfCafZgUSFvPYPNrqNkeTVzk5vgUbimzFR7VjT2yQznN3CmBSRoFgNfpcZ6qV+drPqpoDg5rtUUQL2tkvIqOGR1l2gsGTCIGjVMdvE4k2uZWDAQ6q87JBW+pTswzjii2lM+Qe+5VUBe1/T6G7BVgMPA08DRVHvyBo//q7ohhKLejqBjF0FdnN9YXvkAoVsKpvIwCipW1/hr5UmYZ8FG0h1n6r7id0qxil55vwdTuEbhcMMno8AmUaqHvjPoVrntGMT/lxbq055nI29FN7RVY1aTm9Vw//WBX31NYmQh9lSR6Q46pZ6qwmQp/Na66sK4NAMRBh/d6FNNOHoP8UV44eyBc=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2017 21:42:09.1884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0692
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-07-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1707070361
Cc: ken.sharp@ni.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] image.bbclass & image.py: Add check_image_file_ownership()
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
X-List-Received-Date: Fri, 07 Jul 2017 21:42:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

> Why not just check the permissions on disk, from a rootfs postprocess 
> command? That wouldn’t be specific to tar, but would be just as 
> effective, since those run under pseudo.

I disagree that it "would be just as effective", since this approach 
relies on pseudo, tar, and OE's scripting (all of which are big, 
complicated, codebases) working correctly to create a fake sysroot 
representative of the booted system. OE sysroots are kinda leaky in my 
experience. I want to insulate this test from such bugs. Moreover, the 
current approach also implicitly verify the fake sysroot! If it were to 
fail in a way that assigns bad id or name attributes to files, say ones 
leaked from the host system, this test would catch it as presently written.

-- Haris


On 07/07/2017 03:28 PM, Christopher Larson wrote:
> Why not just check the permissions on disk, from a rootfs postprocess 
> command? That wouldn’t be specific to tar, but would be just as 
> effective, since those run under pseudo.
> 
> On Fri, Jul 7, 2017 at 12:36 PM, Haris Okanovic <haris.okanovic@ni.com 
> <mailto:haris.okanovic@ni.com>> wrote:
> 
>     An IMAGE_POSTPROCESS_COMMAND verifying image tarballs have symbolic and
>     numeric ownership attributes which match the enclosed shadow database:
>       * uid and uname of each file is present in /etc/passwd
>       * gid and gname of each file is present in /etc/group
>       * ids and names are consistent between tar metadata and shadow
>     database
> 
>     In other words, this test ensure there aren't any ownership surprises
>     when a filesystem created from tarball is booted. It's particularly
>     useful in cases where artifacts built outside of OE are included in
>     images -- E.g. packages from an external feed.
> 
>     Testing: Verified core-image-base still builds
> 
>     Patch:
>     https://github.com/harisokanovic/openembedded-core/commits/dev/hokanovi/image-ownership-sanity-check
>     <https://github.com/harisokanovic/openembedded-core/commits/dev/hokanovi/image-ownership-sanity-check>
> 
>     Signed-off-by: Haris Okanovic <haris.okanovic@ni.com
>     <mailto:haris.okanovic@ni.com>>
>     ---
>       meta/classes/image.bbclass |  25 +++++++++-
>       meta/lib/oe/image.py       | 114
>     +++++++++++++++++++++++++++++++++++++++++++++
>       2 files changed, 138 insertions(+), 1 deletion(-)
>       create mode 100644 meta/lib/oe/image.py
> 
>     diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>     index 6e30b96745..7b11291a82 100644
>     --- a/meta/classes/image.bbclass
>     +++ b/meta/classes/image.bbclass
>     @@ -192,7 +192,30 @@ python () {
>       IMAGE_CLASSES += "image_types"
>       inherit ${IMAGE_CLASSES}
> 
>     -IMAGE_POSTPROCESS_COMMAND ?= ""
>     +python check_image_file_ownership () {
>     +    import sys, os, oe.image
>     +
>     +    imgTypes = d.getVar("IMAGE_FSTYPES", True).split()
>     +    tarImgTypes = [ x for x in imgTypes if "tar" in x ]
>     +
>     +    # bail if there isn't a tar image in this build
>     +    # TODO: Maybe add other image types
>     +    if len(tarImgTypes) == 0:
>     +        bb.debug(1, "Skipping check, no 'tar' image specified")
>     +        return
>     +
>     +    imgDeployDir = d.getVar("IMGDEPLOYDIR", True)
>     +    imgName = d.getVar("IMAGE_NAME", True)
>     +    imgNameSuffix = d.getVar("IMAGE_NAME_SUFFIX", True)
>     +
>     +    for tarFileExt in tarImgTypes:
>     +        archiveFilename = (imgName + imgNameSuffix + "." + tarFileExt)
>     +        archiveFilePath = os.path.join(imgDeployDir, archiveFilename)
>     +
>     +        oe.image.check_file_ownership_tar(d, archiveFilePath)
>     +}
>     +
>     +IMAGE_POSTPROCESS_COMMAND ?= " check_image_file_ownership "
> 
>       # some default locales
>       IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>     diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
>     new file mode 100644
>     index 0000000000..f1ba6f2613
>     --- /dev/null
>     +++ b/meta/lib/oe/image.py
>     @@ -0,0 +1,114 @@
>     +# Helper function for image building
>     +
>     +def check_file_ownership_tar(d, archiveFilePath):
>     +    """
>     +    Verifies file ownership meta-data in image tarball matches users
>     +    and groups in shadow database (/etc/passwd and /etc/group files).
>     +    """
>     +    import sys, os, tarfile
>     +    bb.debug(1, "Running check_file_ownership() on image
>     '{0!s}'".format(archiveFilePath))
>     +
>     +    try:
>     +        archiveName = os.path.basename(archiveFilePath)
>     +        if not archiveName:
>     +            archiveName = archiveFilePath
>     +
>     +        # maps
>     +        unameMap = {}  # username -> passwd file entry array
>     +        gnameMap = {}  # groupname -> group file entry array
>     +        uidMap = {}  # uid -> passwd file entry array
>     +        gidMap   = {}  # gid -> group file entry array
>     +        fileMap = {}  # filepath -> TarInfo object
>     +
>     +        def read_shadow_file(fdName, fd, colCount, mapsList):
>     +            """ Reads a colon (:) delimited shadow database file
>     into mapsList """
>     +            for mapObj,_ in mapsList:
>     +                if len(mapObj) != 0:
>     +                    raise Exception("Already read '{0!s}'
>     file.".format(fdName))
>     +
>     +            for line in fd:
>     +                line = line.decode("utf-8").strip()
>     +                words = line.split(":")
>     +
>     +                if len(words) != colCount:
>     +                    raise Exception("Malformed '{0!s}' file.
>     Expected {1!s} cols.".format(fdName, colCount))
>     +
>     +                for mapObj,mapKeyCol in mapsList:
>     +                    mapKey = words[mapKeyCol]
>     +                    if len(mapKey) < 1:
>     +                        raise Exception("Map key in '{0!s}' must be
>     at least one char long.".format(fdName))
>     +
>     +                    if mapKey in mapObj:
>     +                        raise Exception("Malformed '{0!s}' file.
>     Did not expect to find '{0!s}' in map.".format(fdName, mapKey))
>     +
>     +                    mapObj[mapKey] = words
>     +
>     +            for mapObj,_ in mapsList:
>     +                if len(mapObj) == 0:
>     +                    raise Exception("'{0!s}' is empty.".format(fdName))
>     +
>     +        bb.debug(1, "Read the archive and populate maps")
>     +        with tarfile.open(name=archiveFilePath, mode='r:*') as tar:
>     +            for info in tar:
>     +                if info.name <http://info.name> in fileMap:
>     +                    raise Exception("Duplicate entry for '{0!s}'
>     found.".format(info.name <http://info.name>))
>     +
>     +                fileMap[info.name <http://info.name>] = info
>     +
>     +                # populate shadow db maps
>     +                if info.name <http://info.name> == './etc/passwd': 
>     read_shadow_file(fdName=info.name <http://info.name>,
>     fd=tar.extractfile(info), colCount=7, mapsList=[(unameMap, 0),
>     (uidMap, 2), ])
>     +                elif info.name <http://info.name> ==
>     './etc/group':   read_shadow_file(fdName=info.name
>     <http://info.name>, fd=tar.extractfile(info), colCount=4,
>     mapsList=[(gnameMap, 0), (gidMap, 2), ])
>     +
>     +        bb.debug(1, "Check for no shadow db")
>     +        shadowItemCount = 0
>     +        for mapObj in [unameMap, gnameMap, uidMap, gidMap]:
>     +            shadowItemCount = shadowItemCount + len(mapObj)
>     +        if shadowItemCount == 0:
>     +            bb.warn(1, "check_file_ownership(): Skip; no shadow
>     database in image '{0!s}'".format(archiveName))
>     +            return
>     +
>     +        bb.debug(1, "Map sanity check")
>     +        for mapObj in [unameMap, gnameMap, uidMap, gidMap, fileMap]:
>     +            if len(mapObj) < 1:
>     +                raise Exception("Uh oh. Empty map found.")
>     +
>     +        def badFileError(errorMessage, info, shadowEntry=None):
>     +            linkname = ""
>     +            if info.linkname:
>     +                linkname = " -> {0!s}".format(info.linkname)
>     +
>     +            bb.error("BAD FILE '{0!s}': {1!s}".format(info.name
>     <http://info.name>, errorMessage))
>     +            bb.error("## {info.uid!s}:{info.gid!s}
>     ({info.uname!s}:{info.gname!s}) 0{info.mode:o} {info.name
>     <http://info.name>!s}{linkname!s}".format(info=info, linkname=linkname))
>     +            if shadowEntry:
>     +                bb.error("## {0!s}".format(shadowEntry))
>     +
>     +        bb.debug(1, "Check for bad files")
>     +        for filepath,info in fileMap.items():
>     +            if not info.uname in unameMap:
>     +                badFileError("uname not in unameMap", info)
>     +                continue
>     +
>     +            if not info.gname in gnameMap:
>     +                badFileError("gname not in gnameMap", info)
>     +                continue
>     +
>     +            if not str(info.uid) in uidMap:
>     +                badFileError("Uid '{0!s}' not
>     found".format(info.uid), info)
>     +
>     +            if not str(info.gid) in gidMap:
>     +                badFileError("Gid '{0!s}' not
>     found".format(info.gid), info)
>     +
>     +            unameEntry = unameMap[info.uname]
>     +            gnameEntry = gnameMap[info.gname]
>     +
>     +            if str(info.uid) != unameEntry[2]:
>     +                badFileError("uid mismatch, expecting '{0!s}' for
>     uname '{1!s}'".format(unameEntry[2], info.uname), info, unameEntry)
>     +
>     +            if str(info.gid) != gnameEntry[2]:
>     +                badFileError("gid mismatch, expecting '{0!s}' for
>     gname '{1!s}'".format(gnameEntry[2], info.gname), info, gnameEntry)
>     +
>     +        bb.debug(1, "Successfully verified image
>     '{0!s}'".format(archiveName))
>     +
>     +    # Error on any exceptions
>     +    except Exception as e:
>     +        bb.error("check_file_ownership() exception: {0!s}".format(e))
>     --
>     2.13.2
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
> 
> 
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics

