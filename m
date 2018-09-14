Return-Path: <alejandr@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0059.outbound.protection.outlook.com [104.47.40.59])
	by mail.openembedded.org (Postfix) with ESMTP id 27A8C799E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VppvkL7OkIos98ELJFJb9UQqm8CmH/57vf3CHr9FFl8=;
	b=3aloD5QMMG99S1nM2qNqbsdhfZAmvvE8eXD1uaTRFOiiKRztmMe1MkkERKS9onOejA7xOGOvBi2pzMzNgV/ND/O144hGztQLHxavJw82SmN3mnjB47zQk9AVEMYVEidm+NBA/QHlF7n9Q2ZRp7UmoUBUmpgZP++khyb2xl/jEmc=
Received: from BYAPR02CA0015.namprd02.prod.outlook.com (2603:10b6:a02:ee::28)
	by DM6PR02MB5115.namprd02.prod.outlook.com (2603:10b6:5:51::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.16;
	Fri, 14 Sep 2018 16:57:13 +0000
Received: from SN1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by BYAPR02CA0015.outlook.office365.com
	(2603:10b6:a02:ee::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1122.18 via
	Frontend Transport; Fri, 14 Sep 2018 16:57:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT031.mail.protection.outlook.com (10.152.72.116) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1143.14
	via Frontend Transport; Fri, 14 Sep 2018 16:57:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45244
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0rP6-0000Lc-0l; Fri, 14 Sep 2018 09:57:12 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0rP0-0006p5-Sr; Fri, 14 Sep 2018 09:57:06 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8EGuuND003358; Fri, 14 Sep 2018 09:56:57 -0700
Received: from [10.23.119.150] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g0rOq-0006i8-LG; Fri, 14 Sep 2018 09:56:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Andrew Geissler
	<geissonator@gmail.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
	<CALLMt=pHOQHswPeLF-rWpA2QXmtkL8Hc9RKav_j6tF1MuozVoA@mail.gmail.com>
	<CAJTo0LZqrgAeRbsJtW=G1f58CNSRYS8r_9Nm-4K2G1KstvA4Kg@mail.gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <42a1cfa6-9c0d-71a8-900e-5a7260469676@xilinx.com>
Date: Fri, 14 Sep 2018 09:56:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZqrgAeRbsJtW=G1f58CNSRYS8r_9Nm-4K2G1KstvA4Kg@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(438002)(3190300001)(189003)(199004)(58126008)(63266004)(478600001)(305945005)(26005)(65956001)(476003)(47776003)(186003)(67846002)(2616005)(446003)(356003)(31686004)(336012)(81156014)(8676002)(2906002)(106002)(316002)(65806001)(126002)(54906003)(81166006)(50466002)(486006)(9786002)(77096007)(4326008)(11346002)(8936002)(53546011)(36386004)(426003)(36756003)(65826007)(106466001)(64126003)(76176011)(3260700006)(31696002)(2486003)(23676004)(6246003)(5660300001)(229853002)(110136005)(107886003)(93886005)(39060400002)(14444005)(230700001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5115; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT031;
	1:PpxzuoM3NmDecrS640S4O4uu3x6b2PE10dwYGH1M+SAG9keft9D4Y/Z8HMlDJ2nprC35+UimULj+Qu8sj35GyTUgdSnPvizBPG5oUf0GcyFfefCgiC1pMgaVS3Hw0od4
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd00bd2b-3357-4e2c-a942-08d61a631df5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM6PR02MB5115; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB5115;
	3:IuWy8tcKEBEoSh1AHknOjW8ERXkOKXB52nReVqhXXUML9XEcVsi8aQn65G1PkWtG30M4bZBcpPARrYq41eWwIPngCmeJcwW/nnJtG1RuhYA3eKc4AnexOmHFLrZdH+AtaEqA0skgRxYQ+zkUCu3yuvU4Dszqe89jtTwMCEHhFKd5Mir0fzfIn4QjpcvSkC+IF4EiXrWB6elmVWFQl67WX55OuMWcBHEvFcOjE9pFTi8UipN3jPMq0T6nfBvoQNWGTSe+luYI+Brww3rTk6iM2dyBkjKG6R/6V8LHSgECOreK9f6MyqMxlaYY8jxLZRoSnz2lfa8PVpeWfDmgVjlFeLTnEGbmsXp6QvSUIBWl8A4=;
	25:g61yMUmTaCRGmqbpeJ1jhD+xVYkq+lbEFGm6MCwGcQioDC3tXeW3jmwEvB1ScguCfu4Tov4/SrdI5TjHjq0LmaSYKqwyOHM3gYC3rlLmsL3mzYgP1WisUWRXZugcCL72OwB6c2ggDS1yJ/TFrJI/pWXXNDt5xyRVFjTAeS9eDABcjz4jtSdNhOI0aZ6YZj69+3opSotnoDsB5+5NCedQIDOYKIza0xb3ZhKPFg4T5YeMmbiIht5vojufJ6UMhCRE1K/UOLk9aI1hVnobx6NmBW4G3Uq7BKd4A0E/dmmqEExBJ50TLd4X3AqD3+HcuVsp3Zbbyov1/Xqz/N5lWwSgIg==
X-MS-TrafficTypeDiagnostic: DM6PR02MB5115:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB5115;
	31:Jp9cxB6GwpEWeJy9C0AB1Wpf33ZuYU0ug99TbFerMkyh71IX1Zs/dA4PsoXZBUri6CD1SXPwfrz6N4m3izzTfLmkRVXUbW6+X/s9Y1VdBCggM2AkpPADLYtQlwu6Hjn+nng0xh+5g7ifbl2J65WjETI/b6FDCd/1tWO9XhWXvh9oIc9s504VKfZakNR5HdVmesotz0M9fnUV+Qi60esVF4JUH9pL9CqlpfXAOo+z03A=;
	20:/Y1cO9O/6pJrP3S22DhhP9ZerAAf9HgPn8R3oBJpamICwzzi0eWpOQUIF8Zg3Xr+ziIIy0IGNniEbSmhJtLZVLZKMynVHtZOZoG9TrfNUUojhJt3XRV8M0B7SRF3zrZbf/VZFsaOXlGTe9lyEhPNRvrYDbrad3IYwg3dD5AAHgM3MLfv5UuiEY/StM2sj1QTBZ7iuHlr49oF0DmbQO77WCmOylRf3kd+pEguXaEqFprqR2cpdOv6othoHhOccXAv6UgnL2Znp2fR5C4z9S2PYRxlw/TyLjQ6FITGGTdX0ppYmJHQ0K9uDBbsePLHJkJS9sKrtx7HYGT5zK7G42yl6rXbJqdwtsSp9E9oXGgPR6P7fPKMRqu/+PcjQGcbhcXiBw0ZUI1n/sc8TaOkDI/DDK84B+x7blMqZvIb+IOHh6qUUO1RllOnMVSO8wCHQLrgxekhIO9z79XRUIi74ZM1f81iFUN4SkfuvWYf4JAux5ueLS6qnohNCCZvZ0nu8gkP
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB5115C963B9BBD801D460AE4FAC190@DM6PR02MB5115.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(201708071742011)(7699050);
	SRVR:DM6PR02MB5115; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB5115; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB5115;
	4:BmsoQdrAVaA5jH9TcFDbnspg6HRGx9p9N7hAB44ZnP+3ix36qafbmeCoPzTJZki5DlcfKKfPq/VWK44Ajx/QCtG/dQUzkErWUFnb55TZlXndRT4HlytYUBjz3/YfCxS0Q70QIkdzCcngxJN038Zn3j8A690c6TsUDv+79nmf+PTTy7HXQBXmwLoRYMLOPcDgBkriF/CvxwxUi4BFTCcgb3wOZQXav/1J6t1tIiEueEuS6AZAk/lnXX5P1MDHzFpV2IMLtaTdsq9su/PCh+5Ogdxw7H2bfwZ/e1Zn0o7N9wOp+QjDocBh8SGBi/zWF/wu
X-Forefront-PRVS: 07954CC105
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTZQUjAyTUI1MTE1OzIzOmtLalhGQWRhbGwxemVsRlJvek5WdnNKL0lr?=
	=?utf-8?B?eExaY1ZQRFZtdnMrRUhIOHIwOU5tYU5sVzQyNXA1R2xXM1lNL0w2YzMwZXJH?=
	=?utf-8?B?NEp6U1lrbGpka0x1WFhDekYzK2IyN0sxRGthSGhnTkE4cW9pa3lkZER0V3R4?=
	=?utf-8?B?aklHUnN4S1VSYlhOd0FYR2Q3N2dTVjdFcHlRTFV6VTBZTkpRS1BNdjNRSDBL?=
	=?utf-8?B?OTBZZzE3ZEFWSlpjNkxDazhyNkJPM09qVVFNdDk4bnZlMElqek1aVm5OeFFD?=
	=?utf-8?B?WHQvNHNGUGJBclZLbUM1ZDlyN09PanZuQkw0R1RUYkFtWnRObmkrYk9GQ09J?=
	=?utf-8?B?Tkd6RU0zOHpaWTdoRFkzT1BIQitFc3lPNVJHbFJ4Y3Q2OXd2Q3VDNVhuVHRY?=
	=?utf-8?B?R0hKOXVNdXMwZWFXa2QxYU1MK2IyQ2VmbVdHejFhVDJwTTErajNPZnR5Wnln?=
	=?utf-8?B?cC9YcWZHYi9ZS1pkV21JeC9BMzIwNHUvQjZIMGQybys3UWhXSUtxRGRjdTIr?=
	=?utf-8?B?SjF2YUZ2WHpNTVNBc20xelNVQW56QUw5b1ZNcUZVVURGSTA0cXlqTERoR01R?=
	=?utf-8?B?RnRzdXJBenFOM0swc2lyNkhJVm12ZytRMzhPYkNLdXA3elR1NWV2S1g4em5Y?=
	=?utf-8?B?Y095VG5mZEJQWVRCVWpiUkRzR2x2QXYwWTB4UmZsaU5WOENuVFBxZWs2ZjdD?=
	=?utf-8?B?Y3BSc0ozWGdOYko2eUFERW1QWTVOS1c0Z2RtZkhyOGNUVmF1NXM0MmJkUWxF?=
	=?utf-8?B?bXc1T1F1SGtMUEswUnBDTHZ1cTdLV2VhNXdCZDVFS2orOW8vSmhpY0h0YmMy?=
	=?utf-8?B?Qm9QbHhQS3owTytUOWlXUG9XTDBvRGJKVmZmbE0wYWRrajkyYmlCNGtuUVp4?=
	=?utf-8?B?d2krUWZ4NUNtODV3UGc5Ylc3UVYzYnJlU09TcmQ5M2VZQzJYM0FUdmRib2tq?=
	=?utf-8?B?aFo5Y0x3ZGtkNFlxV0o3T0VQL2Qrc2lablZ6THYxT3pSZU1KRGdDR3pHOXVD?=
	=?utf-8?B?THhBTzJiVnBhL083MEVGYWw1NkFFOG5vRG5kNFhOVlhXSUs3c2xicnFxTnM2?=
	=?utf-8?B?M3Q5NVVFbnNDem92a2Nzb2dqZ1NRUXBkRitRN2tVTy9DYXJxWUVFQVN2dVhy?=
	=?utf-8?B?WWpQQ0p2MHJ0eElmZm1kQ0VRMEF6aGY4VnpENlZQR3NtUTVpRVhQK2tJUTFI?=
	=?utf-8?B?cXYyQ3pMRlJKRHVIRVE2SGZUWC9aNlIrR3F2dDNrT0JIQjJLcWtvemJGbVJS?=
	=?utf-8?B?Z2JwYk1GRWxtSiszQ1RqNmxHdWgvZUVWV2pXZlYydU40Q2ZHU2ZFd3ZERWRN?=
	=?utf-8?B?SjREbVFWYTc2RmpscVNabzgzZlFObzc4NFFKUTZ2dk1oclR6Nkd4d2M5dzFx?=
	=?utf-8?B?KzdlR0hScEVRSFhEZjNDclRLeTAxemhTOWxXQnE5WnlVL2k3VFAxREJFLy9I?=
	=?utf-8?B?aGhvSTBPbGZPbENOTzU1aHFlR0Z5OTZtb0xlcXlyMHJwbjExMWFScDZKQmNQ?=
	=?utf-8?B?Z3Q4cjZWNFpkckk5YytrcjlXUjBrUnhXU2NFSEJEQkJMdjdGVUdCSi9qZE5X?=
	=?utf-8?B?NG1DT3QzN3JUVWZCcmc2NmhiNWx4MDlvMzJVTnZ6RHZPQitzVVlZMUFxM3J1?=
	=?utf-8?B?cTB6MXpkWnBRRFVYK0E0Z2dPNlRYUE5TUG1pYk56eVlnbDBuRW15UUdqaFYr?=
	=?utf-8?B?cUxDVVlaVHdZek1SSGVoTjBSQWJUUklnRnpUWHVxUTJGYWFQSm53dmNaNEZI?=
	=?utf-8?B?RGtUaVJyZjhmcnJPMW9NUW9sR1hBcHhxWXRQMWZoakNXak5samhmc2NPR3BK?=
	=?utf-8?B?aS8yc1g4blJzYVJCZmorSElrWUJDeDluNGJIQUlaN2lDK29LUE8ra1Q4WTNw?=
	=?utf-8?B?bG4yZlkzemp4KzFEOGpjZmhMRGg4Vk50TE1CTFJoWHh1a0g5Um1pSUtYSm5v?=
	=?utf-8?B?RGxyZHpUdzVnPT0=?=
X-Microsoft-Antispam-Message-Info: I6JKlixR9MmkLuCHZejyH7Z41zUbu1VzsWjjBvChIUps2s3aSbiZY8rVxAxHiS9Znux/sV6TMR+RVhGDkabIcXW05FgUNg4qNiPsKJNU5NFG7WT2lYJy4k2OWO3xxJ1T1oUJhP88QPK81tC6iak0+TnGBwEZhbjQaOJpAistdPy9b5WeknvweYoE3Dvcm2ZOkRttrhU41LKAlaBjI/2tdA7sSb+2iivwiMecjM0j705ZHazl2jCPHJyywfgeMTRZ/eg2TNZsPd2A7NwlIffiDvDI3Der2PnO7Oj4i1QE36L2DiFjurB1363OnNyv2WGUK2XDPJ4tneWBY7cd6Xsd6KksKpKlBbUu4r+Kcv9bN1M=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB5115;
	6:4AfqZxDIAs3Kx9Ae3bFluC/FA6FYoed86Q28/TiKQOKaXnBfTi4I36PpMCiQj0oZC7Fkaq/w5UOw+TT5sJbBGWKX819ZM4FGQr7NVYlIWR2JCz/etnIpNQbCZjbleplL4lXz3ERiFex74QM9PsyHya7rKklCrU7Tq/Mkd827vcq2GawvFRRGGf9dvKyDsAKY8s1Z1YqVuKAW69a195jZPQIIXs0JtnyL5iXSN/ho22Nb91NJmaFIyMownNPOq5tmOSIIEN1M5WcvspAoytn626oehKS+qlx47Ew/GSFk6jCnBXyOJffY2XXYYoYIhYBM0aG8AUjYvAsMZc7Z9bSR3vpKvo+D5osxllgimBczgz0smi/F2UcbBX9lAutWOMizobukwCNxu88K1X3stNCQ9hadlC7U7hd8lHkbHx4rpLQG91DuYIGu7xNgP02W1wMWrQ1Q8Uen1nDrdxFZyywqZw==;
	5:8uEY2sC6PAiuLZjy9HI3LuTdk3il9FKeKRhEY2101oy1LGrUxzc2fpF8fFDS3DY4OruMNdyq9mWsbPOJebRalchEa6dDsj6lzzfUY5KBw38uarEreATvjst7GCkl3nGvdrPW6kFU4g7DPmtx8PE7Dsc+sOy2g1ArFd4tEaYeBRI=;
	7:XPtUUu71Z5nknyuZqzNDbY9O+ZTtCrI9kG3dNuEYN/DXWb5jUvV2rhDwXi/1jAjfcfPIT0eMzJk7tHwRL0dmBBYZA8iNMCKO6Xrml0ky8Lfhko5h23DDuTGcGUq4y1LaVLCkodA2SqqbSzD1td821VbO8Wepb3O4s8M/H8VYqY5F6c3dIiUS6pG3nFGczvWpR770ZB3s6V7OIt8/+V3F6FGCEGOMP3AlhEt7MGyhdHr+X+vMvG+H35hSE3Be9G31
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2018 16:57:12.4664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd00bd2b-3357-4e2c-a942-08d61a631df5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5115
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 16:57:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

To be fair, I have also not had a chance to update the py2 manifest 
script with the latest changes I made to py3 either, but I think 
applying these to create_manifest2 should be trivial.


Alejandro

On 9/14/2018 9:05 AM, Burton, Ross wrote:

> On 14 September 2018 at 16:13, Andrew Geissler <geissonator@gmail.com> wrote:
>> Nice, thanks Ross!  Looks good to me. Will you be back-porting to
>> python2 as well?
> Struggling to be motivated for Py2 to be honest.  Do you fancy
> duplicating the changes for Py2?  Alternatively I'll get around to
> doing it next week.
>
> Ross

