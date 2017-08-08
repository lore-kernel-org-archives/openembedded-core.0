Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 491ED7199D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:54:40 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v78FQ5w9029776; Tue, 8 Aug 2017 10:26:57 -0500
Received: from nam02-cy1-obe.outbound.protection.outlook.com
	(mail-cys01nam02lp0054.outbound.protection.outlook.com
	[207.46.163.54])
	by mx0b-00010702.pphosted.com with ESMTP id 2c5ayvje4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2017 10:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=17ICLVH7o0ey1S22F+pcTTy6LuMzXmKfbNhSx+29FJg=;
	b=LSvtbGfGykIqSQ988AjdQtCcFlFwT4IK4vfgHX+kDEQsuok8ClIOns2RerOA4j6AvLm8lOqOLqxckab47TqZvuC8kJQ6Ig7i6/759rGJMLvUf5sXJN+v3/RhiMv9pZAKKAjDbZ26kctlgPkSM/P/Eb2KLGF+z+Eu/dB04lMXY8w=
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	MWHPR04MB0705.namprd04.prod.outlook.com (10.172.167.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1282.10; Tue, 8 Aug 2017 15:26:51 +0000
To: "Wold, Saul" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170705173334.25041-1-haris.okanovic@ni.com>
	<1500323515.27323.139.camel@intel.com>
	<0f5ef046-a46c-b24d-8572-775d1fa1b1cf@ni.com>
	<1500479806.27323.202.camel@intel.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <99d35d32-6c53-dbc9-2ca8-553e01911d1d@ni.com>
Date: Tue, 8 Aug 2017 10:26:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500479806.27323.202.camel@intel.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: DM5PR20CA0034.namprd20.prod.outlook.com (10.171.161.148) To
	MWHPR04MB0705.namprd04.prod.outlook.com (10.172.167.142)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55dfe180-e773-4297-aae8-08d4de71e5aa
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:MWHPR04MB0705; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	3:+KjYQcDP2aY4VNM3M0nzADPzFz9MWubM5y8rzkWZ0Yv5p0XoWZUTkoSPF5KX0JgpsnHul7W2DQWIX4Hd5pIeKtlyLHj4+K29BZPdEFvjphT9nCFxkDY5R23Y/HBGkrdyjHee9xPiA1LSPH3eKNyacuKPJsGQ0ijFsqD1SpV7ey7hPtTUyLCpZOPbi50fgvYlb2JxXqBlrpx0WRdBzyx/fF8iiJ0CO1B6QVYbXkBXN9CEZIMWizWGExvUHyARtwZ5M+VSZkHXR4/tqS8Pi9BMRNVUJ6wRZg0Cu+zzX5+pMuT7dBEaoBQvNzekkgDi5ZLuAtOHmoDFLfIGt3vfyGiJ70B8NzgNhC3OamnLsFHyOGc4n6Sctp5xScXMN8Icr5q966ji9+6OV/bTFRJivPr3PI+XRqUSHBKZqNPm1a2jrKFCvA3lswav5zIFAmcO9hZOAezmus2/epkc2KSQTfB/o/asChdGHNP91cFEUi25zqtMsteHUuXIF4cUfzO7+OpR9FnB1bf1aQV2EB59A6QUSzPlhemFf0eUpxb6sQPlge3y7AK27XootSvlYjfJqS+Wr7P7eaALemtbaduFcd5BLJdSPUNEhOM2UBqz3Ap459sGqk3U+IGIWcPKBNk0OyfaiN0awoHZVFM4JqtbX+I4tPFfKEOi/QwQpSGo8ofXItSpAeLkZTegyAE/UmlKMQf/g7CGJJK3gbQECNphD3nTSuRrpAO8+NzUcPbmS26VjBXELFXo4w7EY3GOvLMlNYW/8HswK9r9j6N6QzJWPb7Gg1ZrbgwLJsi0gsUat3qbGsmUzki7IGRNEevgtG6aZ1/w
X-MS-TrafficTypeDiagnostic: MWHPR04MB0705:
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzI1OllWS1YwK0IyL2E3WVhYNUF2aE5aMDVwTkV4?=
	=?utf-8?B?dVFaYnk2SzQwVDhzZi9RWkZwNXNINFRFaWZOUWVIQllhNjVtSXQrdVp0S2JP?=
	=?utf-8?B?OXpyZlJ1RHRhVW9nSURWakhQZ3dWeU1NY2cwK1V6MGNTQUdKdlluYVpLMFVD?=
	=?utf-8?B?RWNvWGhWU2trL3hOSzVibUVWNlZ3YVpKcEI4aXhIeDEvREZzVjhKbkhaaldG?=
	=?utf-8?B?YUVQOC85bnZWenpzTmdEMkZRemNHSEh2dGVaYzl3bnZvWElRTWZ0UGZBakxR?=
	=?utf-8?B?WExaYkpKZjU4eXlKZnh4TmdoUk9Vamdtc1VYUi82bjRpMVUxaitQL0lvanhJ?=
	=?utf-8?B?dWZGZTlrcjJRR3VMWUkzdFQrdjdEbUR4bzhNL2oyNXp1bk10SDVmUDNCbXZk?=
	=?utf-8?B?YkVlOGhCYUhyWnBrTGUxWGVINVZJdWdDeVNxTGVaTTR5V3pHWEx0THJ5TUFz?=
	=?utf-8?B?WUk2R2FRQzhiUG5JMko3VWZ2UzkrQTUrRGo2ajE0MGZOaG0rU3VIMFR4UzVn?=
	=?utf-8?B?YUNrbFpTSWlVUVBhOXNlOE9ONlVrOHczeDhiaU9FWUh0Tm1DQm5wd004SFpy?=
	=?utf-8?B?Z1ovakZjRitONCswTzFaMFRISHNHREdrWnpncmVhY3J6OE5ZcG5oWUFTazZV?=
	=?utf-8?B?eU9PbS9JZ1pyS2ZKeVpFNXM1NU9aUTVDNlM5a0ZPS3ZLa2tQSXQvUkdXYmlU?=
	=?utf-8?B?R1BmWkdLVk1VMWZ0NStIU3BQb2FpVnhjT0s1eFF6UjZjZDVYekFad0xyeW5l?=
	=?utf-8?B?MEdVekVETWRZa2trNndNek1kNFR2enEwU1E1OEhSdnV5RUpDY1EzSDFTN2pJ?=
	=?utf-8?B?U2E2Tm1zUFlnMHNiN1ZnaTJIY2ZQM1VuRkQzeWxaRHdkQzBlMUVTazEybnpV?=
	=?utf-8?B?V3ZjZVoxQ3FEdHhNZUdTZ0NoaXh0cDlMNVNJOUVBOTd2Y1ErZk1jdDhOVm9P?=
	=?utf-8?B?UE5rdEJYd0FPTE55ckYzaXMvenVhYmE2QlJrbG1waWVCSHRLTWxLWDlhbDRR?=
	=?utf-8?B?eVFnWlJqaU1pWVljbitucTRSNnBxRVY5SDUzK2hFUGNqSk9hL3FDSitGaXdF?=
	=?utf-8?B?MWZZTTNkQ0ROOGcwaVFGaEZNNkNFekROS3VNY3J1UkxWeEFqT3ZyU3dRYkUz?=
	=?utf-8?B?ZG9tQ1kxWm1uSUIzcWwyOWNnSmhubjR1RnJoWmdHQUw0bXBDYUY1QXplb2kz?=
	=?utf-8?B?cGhSME5xMHBWTkcwZC9mSGRDeDN5bVF0R1ppOHJHZjF3cEVnSnFBbVBCS3Fp?=
	=?utf-8?B?NVBRRjFNdnc3WXlQN21ZaE1QUzhqZEcvdlh5RlF1amZlbFoyanQ3QzFuekR1?=
	=?utf-8?B?eVRtNlhndlBoaUE9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	31:77640awlcEZndwwi8a54jmFsPhlp2UBqPQj/1V0NeZv91qB7Unr+9NaWvSCkOJ1sl9+pt7y4+ggYSsV6koEBY8SViN23lRgfHH+1fSlV685vm8zTBHRf+/jGtwAOuwQ+zWnMVeWjICcrkOvuj5PBse4VWu3G53NTjpC/Dv8M2HoR7ko3BoC/uStjzfhyDDiPL8R2mR06MNTlmZZdvu1EEDyoJ/xJyg40BAlMTKezWJ5bryAXF/NyyhWFAzay9LX++LLUQl5x+LNYTI63iq2acf9DuDQAq0BvlWtUyC1izRe9ZRUSpj/ofG0A00tMP5q9DBuHC3gbj8ygkVqKha0EkUK38FQxEprp0MdCiJTGadfWDQdaSYOOKULQprPj2eDUELteSEBZb64lCORe5mBhRYb9XKu8Ue6oWQ1J5rvZyflULHu2gbeAaoEfKDb7xywu0E2gtvTALeuXlKaDqwYRxUlFNwR8XCJLn3bc2UZVqByfIpcBuPLP+Wjk/7Gs//w9AQtKpv5vC8iYPIyzNKSrK5e546SMmeVnuxkHaK/8ngpKuwmCVStnn4QQunGVvEHXgKkCg1jQCsS2tTWtg4H/ZOvUpPblaJInZd7aJRfXSFQ39nP+rOAcYits0WBXzzuqYJ1Ak3u7jXBkYrWUSPxgi6Srkf8deCPKZ/nTyqQSZ4U=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	20:iz+F+dusIDcHpAnvquIWnbxztj/+jd0FozfkHXggqZEX1T7tk+7PisxkKb7GNKpEim6Mkn+vM9G03GkStxSOfiufHB398cRJwlCiG1WpWz7KrUSd5lTYFiOVpVlyNYo5uEJXQv74kgJaYpDT+zOdzjfs73oYMl2lhJ1yk4udppxndgQRRfgqVTltV6ZPPXaC5AYSnIF5b6lmkc9bXKAOL2NzVkdZtHuxFF+KerfcO3L614zHhPizTXdRKKCiTmuEo2CrE5FP5+AWZvza1dIHCzCX/7i6kNOs1l4h+Aub8m//6/H3dvLyohASJoHoG70OWRVPTCPDafBU1mWC8efJylA6VS7UHP2ikK0xQfZvhNQhDsg0JuwWcOkchAviOXR+vmKYFX3AM2JJii+Y/pfVN29C43nyhNLDl0xyvGYTjmpxki10lDMN3ejqB38zhINLGl+/L8hH5DEjzmmo4sRwRUvTTbhf/nIerStELv5v872SuRoPPEwkZrZUMDkzMqlQQ3pny6aZJrRyR5ddEFoUS6uH7rgavoQdxhZacqSu9od4UnXI0es2NKvsnxkumSS077FVNhtKrsIbzstSMKejNjFAMT1aFqgFhQ70XGHEvjs=
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(264703809997249)(145744241990776); 
X-Microsoft-Antispam-PRVS: <MWHPR04MB07050B8542089A50E49355D1E58A0@MWHPR04MB0705.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(20161123564025)(20161123562025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR04MB0705; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR04MB0705; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzQ6L0lKM2hNaDIxRm5BS1R0ZTBWWkxJaXBGNmJt?=
	=?utf-8?B?clVUSERlSnNoYjEvb2d6L0I4cUZ2akdKMU5ISDlGS002ZW1SalRxSTl2L29s?=
	=?utf-8?B?SDJ3cWtFRHVQY3NiOGthd2M4Y0VYRkV0NjFiK0NpK2VjTFYyNTQ2WkJ3YU5M?=
	=?utf-8?B?d3dwNDVaY3ZtN2ZUL3M4dGhTckVFaTVtL1NBajE1VWQ5VEV3TmQ0bkptK05S?=
	=?utf-8?B?cEx0YVpoaFhKMW5PRTh1VDNUNzlubndMUEJ3QVN5N3dhdDl3VlNBWEJZMTdC?=
	=?utf-8?B?UkRQWTZYMmp3WDY3WHcvQU1KcjZtWDhweXJBVWp5d0VqbENrMGRhWWZBcVQz?=
	=?utf-8?B?TFNXTk8rRmx6S2tBNnVyWTJlT0VSNXRESlZIYmY5Y011b09xWDE3QmF5Z0pV?=
	=?utf-8?B?NTd2UXBIREFZeFpJV2s5bkNZNGZudjlEaEllWXk0ZFB0MXdkR1NacU16YXNW?=
	=?utf-8?B?UGJ0R2puNVc2MmprY0xQaUdDOFFxUkwwaHl0KzcyZnZqZFpQTzFTeVJrSFNi?=
	=?utf-8?B?OTJiN3VrRmlpMFlzVmx0SU5rOTM1RUthenRmNEZuMlVOZEtpbWZ3OENjLytG?=
	=?utf-8?B?Q0JUdUpSZ3JXSloraGhOQUExTSs3dzRwc2R2Z1Jzek1WMVIrOHZRdkU0WFda?=
	=?utf-8?B?dTZZSVRtL0J5SlhFMXc4UTN3eGFBNzk3VDRFT0kwWlhURVc5N0ltVU9YSjA4?=
	=?utf-8?B?TnBhQXAxVlBOVm95MU85bndHMFZBZGRucE1lMnhSdk9EWWtqN1l2MURjNHMr?=
	=?utf-8?B?VFNXNEQvdDhyOVVSM2xJRVZ4VXE5dWdKRVJNaGtjeCt2enZNR29NZ0Z4R0ov?=
	=?utf-8?B?RmZFaGdCTnlYUUxtdGQ2K1Q5SlpGM1pCcytOQXhmaVdqZ3Qyanlyd09PSHVC?=
	=?utf-8?B?MjZNS0RrM0xiSHFKdTZFbVZ2bEt0ZnhxRldsNkRDN0FUV3p6RUZkUzZvZ1Zk?=
	=?utf-8?B?K1dHRWZSZHRaVXdMOWMwNVgrdkNDOFdpL1JMUUFSbTBrSFE1T29wWkNQNm9B?=
	=?utf-8?B?V2hKa0dzTkFYb213di9DVTV2MEdvRlZuc0RmQXVNU2UzekdOZENHUnp2eE8v?=
	=?utf-8?B?RzY2RC9CeGFuSm5rSnRmSFpjWUh5b1ZZREd5NVhlL2dXTVAxOEw0MUczMHZN?=
	=?utf-8?B?RFY2cVJRUzRHWTVBQ3VvRDJEaHIrU2dhU3Zrc1ZmS2JkQytkWFYyVmFHYnZ2?=
	=?utf-8?B?c2RlaHJ6N2tBYzdyRWIwMXBXTzRsVVU4N2VCNlBha3lWSHZCRVFpOXVRR1pJ?=
	=?utf-8?B?dXBIWnBBOFAvK1J2ODZHMEFNUkZvaXZlQzZqZGdmUnJGV2Z0RXNLQi8wU0pm?=
	=?utf-8?B?TC9NdjcrRVJGeDI1cysvSG1LK05Kb21Mcm14MnNlS00vWi9WZmx2dUdBWlJI?=
	=?utf-8?B?NFlMeHpJcmtJQVlQc0dHckJ0RnlVZExlSlNsVVB6Vkt1cUQzZzVUM1ZkYzdD?=
	=?utf-8?B?amw0VjJpSlJ3cENYb21XMGFObGQ2ZWRDZk1rM2dQQjFTNkdDY3BzalUrcHFk?=
	=?utf-8?B?SGRZcFdjQjRpaEsvRGlrK2h3RjZXYlo0N0lZWjVPeGFSZ21lSWhYVkJ1bWJh?=
	=?utf-8?B?WXZtTG9xcGF1QWc5YVE5M29WMVJsWWxoUmJlS25SMXd1RFYra3ZIbzlmMWxU?=
	=?utf-8?B?SDRQamdFTmVHbjNjY1BQSGtqdU4xV0VLdUtxMlpaVUx6RHd6a28rN1RPQlBB?=
	=?utf-8?B?d2trMDZpSjFNZzJTOHZsVlo1dmYzMHhBWDMxbmZlS0daQjhIZFVrTnp1RFNV?=
	=?utf-8?B?aGRGZ2RHd0t4dGIvZ3JRPT0=?=
X-Forefront-PRVS: 03932714EB
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(7370300001)(4630300001)(6009001)(39840400002)(39410400002)(39850400002)(39450400003)(39400400002)(377454003)(199003)(189002)(24454002)(377424004)(31696002)(6306002)(65826007)(65806001)(83506001)(2950100002)(106356001)(65956001)(33646002)(6116002)(3846002)(66066001)(68736007)(97736004)(23676002)(966005)(6246003)(81166006)(81156014)(189998001)(54906002)(6666003)(4326008)(6486002)(38730400002)(2906002)(25786009)(53546010)(54356999)(93886004)(7736002)(53936002)(101416001)(229853002)(42186005)(50986999)(105586002)(5660300001)(6506006)(76176999)(1720100001)(50466002)(230700001)(305945005)(7350300001)(4001350100001)(31686004)(2501003)(575784001)(86362001)(47776003)(478600001)(6512007)(8676002)(36756003)(64126003)(19625735003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0705;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzIzOm5KaDBpMnJXN0lyRG5yNzA0YjRtdjJHMHY2?=
	=?utf-8?B?b1JoeUdNQ1ZlalhGcjZOaGw1NlVwNXVoMENPWmlONFNkekxNV21zbk81YTNv?=
	=?utf-8?B?TjVnaWNia0pSRVFBT2p2eEFMN21hbXlhKzNIaXQrb1dqS3NKOHBkcVlCTTdJ?=
	=?utf-8?B?TUFhb1VBck9oclQyZ3QyNUhDamFXTFNuY2pPS3hCTm5oOWN3T3hiZEg0YUNp?=
	=?utf-8?B?RVJ1WlB6ODA1YnFhT1pWZ0lSOE40dnRyYXpMMDUrejMxQWpjSGpWZ2JzZDZN?=
	=?utf-8?B?cWN6UERFa1ljdHh5NjlKejhnbG05Y3pTaWtmMjZkeHdXSXJsdU16NldYbmFw?=
	=?utf-8?B?clRtTGRoODJyakNsUjh4U1lXMnNWdW1SNlRoeUIwZnFIbHhUeHFUdkVZeHdt?=
	=?utf-8?B?dElVV293NmR2V21CRUt1cUk0ZnNsU2FhL3FXVW16SFA4VkV1N0E2RUNDSnpi?=
	=?utf-8?B?VDZqc2VKVW8wV2V6UFhkdFJHdml0SWc5ZnFvK0phK0g1M0FKYUxZcjM3M01G?=
	=?utf-8?B?dkpmL0hIT3IzcVdDZ1VVQ29OS1FYWHdOWTlTeDcvTmlQWFNSRWRzNTczeU4v?=
	=?utf-8?B?Y2FXSElIUlR2b2JIdmVBb3FpTTc0RlByUzQydzFqZDFjOTJSZXZmRXR3SzY2?=
	=?utf-8?B?Rmw2a1BObXEvZlFrY3Zid2RrbTRuNVRjbmg2Y2ZhUEhIQXpzN2hrV3Z2d21F?=
	=?utf-8?B?TFM3cW4weWtGSFh0dDc0TmlsWVFlUlJqa1FuNnY0bXR6dWdNVjJlRytmdzkr?=
	=?utf-8?B?YWtEYlQ0VDZzS1RRTlRjT0QrdzhqVmV2aWh2M0tWdDhMNHBLb1MrVUZXQWRL?=
	=?utf-8?B?eVZ3bTRBMVJRR3RsOTNBaXBkcTVYWFlRbFZLMXNnWnpxTmVuaUFLYjFyQU1q?=
	=?utf-8?B?aW9HdmtuUStVZTBod2dnbVU2QjBRRWw1bmhJWHFIYWN2L2hVWHBvd24wdlRL?=
	=?utf-8?B?bnlLOG9rMzFRQ2tjMktodW50VE9TNFFubnZyUFMyR21VaCtTckIvODRtR2Rz?=
	=?utf-8?B?bFhKQVVXalJUSXNIVUxqRkZIMW5jdDdMeUlNdlRZOGVBMkdvd1lUenV1dTNX?=
	=?utf-8?B?djk3dDJlRjRaVjFWMnhKWFI3bTgyTmxIVmhiN0lqcEVZWk5pUHoyc2hqU1NK?=
	=?utf-8?B?eWJwbXhqcHRGLzBYeUFaNE04TUVjeDV0U0xHQ0V4RjFaRlNYY0lJM1V6YStU?=
	=?utf-8?B?Vm04SnJmNEMxb1N1OWYwbWFkUy9vdEZoZ3ZOM1dvWGp4aDAwZjU4b0daWkcw?=
	=?utf-8?B?a3U2NFJMZ3RhN3I5d0d5Q3JSOXlFZ0ZqR0FFRm9wcGZHSW9vM2FSV2kxemtI?=
	=?utf-8?B?SFJKLzU5VjJ1cE0zRXJUTDlNNTdxc2swZ005QThvYnlWU3J4Y3hZMlpNL2po?=
	=?utf-8?B?cnJ3Y3FFL1VlTkpFVU53bCsvbmpOTDJqeDN2VHBIM1FkVXBaS3J1amFVd3Fy?=
	=?utf-8?B?dERBcStnalBqamh3L01nUVNaQVdvNU5mYmIwMTM5aUxVRVdQdG5lbWZTSUow?=
	=?utf-8?B?bGxwZVBnMEY3VkNaSjc3WkZrWi9YYURHTmFHVnVnWlJESjV3Ny9rWmZibmYr?=
	=?utf-8?B?ejF0UGtPZkZqQ1ZzdTdiNlRneVUrWHhydC9QUFk3aGozbGRHbXJoelRZRTVa?=
	=?utf-8?B?MUtZYmF5T1NRMUI4VTFhNkN6cll3NzVic0tuQmh5MGk5ZEZtZ25KcGdtQk0w?=
	=?utf-8?B?WVljeWRBZlgwem9KclNWSkczcmRUVk13VHRlS0paSzlNZ3RUSmdianN3ZlBY?=
	=?utf-8?B?OWtEMS9pTWRmaTg4NXhGMTJ0dzNUNFAyUVdTRVJjS05Wb2I1TXRuN1FURFBL?=
	=?utf-8?B?R2ZJSVFEc1FjRDM5LzRUc016T3FxWm8vaE5EVURVZms5d1dTdlEzd3RLRldi?=
	=?utf-8?B?NlRPZDBLaDhrK0phOStCUTNRYnRxcDNIbTJZUWFqSUZQRmk4YzlVRmRpSjk4?=
	=?utf-8?B?VTBvM25xR2NpbG9jbldnRzFtNVErbVRZai9HNnpybFFValkvRmhKa3JTM1M3?=
	=?utf-8?B?c2lYa0R2UnJ6cWxxTzNXSk40aFliTFNVK2pSOXJadUJMVUU2VXMrdm0vUlhR?=
	=?utf-8?B?VUFaYm5RK1NzaDN2YkIxalVQbXgybGd3cTE1RHpScHVsSXYwcUw2d1VmcC9p?=
	=?utf-8?B?ek5rYnFQRUxYdkwwQTUzTjZ1WGlyc3FISkg4WHNkcm5JYjJBUzdHVkx5NlJG?=
	=?utf-8?B?WWptUldSYWZqZFIxanRZMjlqUTZsaXI4aW5YcjFReUVpNEdRL09xSk1ncXpt?=
	=?utf-8?B?WTBiVjZiY3ZWUG12TXdpNFcvY1pPU3hWUnZ6aGgwQ1diK0xBaGF4QT09?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzA1OzY6WG9FZ2JpWDIrejNJUHZNc3JsK0pnTjJKNEgr?=
	=?utf-8?B?azNvYU1zMmpOVzUrRnRaUTcxRDRCQzNONUVJVmdheHpvQlZWNVFldU9EY3RU?=
	=?utf-8?B?YWdUV3BESVFadGUrcUl5QWRVMTdGZmJhQUtPOE9DTExjRFBsa3FqTDVDQnNN?=
	=?utf-8?B?UGFUL1NzQjBsbjdjYlAyMmdQWWxrUCtIRUhrMmVkaDQ3RlY2dDdZd21kQTZO?=
	=?utf-8?B?cU0zTjRhOVg5Z25MNlhJS0RBZno0S3NZbURPZWFKWWQrQkJWMjBOUG93a1Nq?=
	=?utf-8?B?Yk1zei8ydkxSSjlDY000NElGOEtLWkRuY3hYVXh0OHRuaVp6TE1aZytRMmIr?=
	=?utf-8?B?Mmw2WnZsZ3V3RFpYdFFiZThNbWF1WmpqanBrUmNaZjlBMlNlRHlSVTNibEpw?=
	=?utf-8?B?T0pSU1VpWE8vcmFqV2kyZVBZYUVwSTdJdEpjaVFweFF5d2ZYRUNOcDVmaTNh?=
	=?utf-8?B?NWFLaUVmRTVJRkdJMUw3TWtOZ3pvTzhQUkRCd0pJd2ZJTmtmUXlraXB0M2lG?=
	=?utf-8?B?Skw0SzVndlFZUnA5WlNtVE43cmJRUTNUems0R3BFL3pVcEU1QUdRMW50MkpD?=
	=?utf-8?B?TysvZUh3NGxHZXJobjUzOFlVcTR2NmE3ZjkzVWNwZm9TVkk3dk83U2hSOW9m?=
	=?utf-8?B?YWhrTTFldHVhYlFmQ2dyaW9RMkJDQW9pbG5XWDdQaURGa25GRmhPYVpYQlJJ?=
	=?utf-8?B?ZnZDMFB5c2cvaklxVmRZQVRwZWxma0pBZ2tDa3hRbmgzOE1CZkdYWVh2cll3?=
	=?utf-8?B?Ull1UmRMYitMSWxvNjNWTVprM3ZqdGlWRHFYeUFRTUQzaGttT1NwUW1QUWRF?=
	=?utf-8?B?bWdtV29UYmZKd242VFhoNnBNcXZvYTI1akNHRk5UbWlyK1RlNHRPWTJRMU5i?=
	=?utf-8?B?b0tJSjFsNUtyS0Q0ajAzc3o5bXhCY01GZ0w4MnE5NTR0M0lVNmRJNjdBUFZD?=
	=?utf-8?B?LzVlVkpNMEhBQXhCdDZDcW8vVWRSZXNoQUtDc2VGeG8rWjZYTGNoTEVuOWhY?=
	=?utf-8?B?ek5SZDV5V0QwN2RoS2l5VTIzQWtqcjZHRDJVN0E5c2dxa0VEcnJud2UrUzdk?=
	=?utf-8?B?OEVFdTFLWHdaQkljREJxTXVBVXBMUmhuKzZZelJYSlRBWUlDVkJMYUlEZmtH?=
	=?utf-8?B?S3B5UlNpL1NURk9KNXJFbmpkWTFpNTNLdFRSRkZaRTR3dTB6VS9kMGs3S1NG?=
	=?utf-8?B?dEhFR2wzazZmTUFKZkR0K0xlM1Q5NmNtT2cwL21YVG5ld3ExdS9TR0NQYWcw?=
	=?utf-8?B?eE9vOUJsR25sMk5hbEJHQUJ2TlRFUEs4OU1wcy9KdUd4ckFneCs3U3VnWSsv?=
	=?utf-8?Q?5/SNYkwwYmSw29KmjJCVWxFIexT50TE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	5:iw6BFCA0pCuc5N9QVa2CBjxOtbFg2vxeIK43cqKAgZJK2rszLieQVlxAouGL8bkwazfG5Jn6ch2rqkUJDdQMBhqId7UKMidD6SB3p+tSHzcTIylE653peG/Jzb6gOQsPidKwL+4Yq4GkkNXzQjkJL6rJtTHHiErDyas1+RYabuQYmA2acZito5h8tljQ23tYKVHKPUWiXEd3dD9SEvg0cwTKHYM1OQKX4okNpKzBWDcUWBIV2jo839RpIB0PIdnEBm2RX4LAOltCsNEeFDmuJIlCVGZCpMnPcEocNCuqUCTbXCTc6Zb4KSI3nFqC8Ga+eMwJETqeF74DeDwPFFo8aaH+UGBq/ENcZq7/hS4kGroS+vt6rb2eeEwXYXQLJ5h+rj4OZZ/jyCSjrt9uHyABwdUFb2sUq01CFLfWWVgChDtG8C2K1ihk/xARlyPd6CmaHjwxuzpaba338R+JdagSVnFmmGaW4HabpCWGi+8fXolIIjkMoV2IPQ72Mk+EWrQi;
	24:VoF2DxrKi8sObRQ1aF3qFFNciI5RYRUpxdMvKpKRZlJTQDKOSwub0D61coT4ixC+ymTrSRc+flsexz85nmv3Sdm8VmO9PV8B03HKU5uL6bA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0705;
	7:/rYh4VVjMBCVWlADHXxIl+Xe1HJun0G7nK821+jIYV36z9CkHik2UsOGTf0CFKTVH476VP1NRR8jjqh/KBmnmfQU+bvRts/0nkt9Dy/9tYqYd21evuC34HBm6cLa/Y6yOcePaqaG4bpWGjQQUGV128hwYua4DDpx3jwHm0qwsMuTdbDcufMouQ598bFAC7RzuGgcd2OYg5dZyoLVDLZN7+XM3JamtFuPQUm8k9emeJZmJ+o8TlLYSxjPe4O9V2EKB599v3aYx5FH7vxPwI3BeJWahulfI0da0U3ioPlME6mhj6ysMpSQegDWMhnrHBknlo/k968GuTmm4nYyTTuIJ3muOQ5ByPn/oMSIOyMJ0LwFeb54f+MhSIoFVAm8HzyJuO2cFN0xh/ICP11plp/tWWLFZo0lGG8qDqNEpcuF24zaPpiDJE7PxIxVrUoYYl+n6B17w1tkuJcwCz9ulUIhsrOBgQ9jElX3AmQDQLBcLXRU82h3qozsWcGoGVUpditRNaN1Z6FkOEDf0f2lcw4DoupghHZsg/NKRzodBwXKAcd3JN5QsFd11BzCLS4V14Ipp5itBZ1Ywe2RtEafEZD1+MKWkV2dH3MMHIRW/Sym2nRSjfEDBKD+WFcQOjZPxYGr9fsjsbh5MdP2PVhNRmuQTnR36kGe02A0Jp571vmf6bacnPt0Vbusvmzsob86aa3pMyeQHB2ET3CgT0shBC2Hdqvyy3w6pmdnH4lAul7HrDpSfi9/LHQV2EYRgi/Ge1PxW/H6XjE180ir4wJljZGORLq8Otm8r2DM9sbK1P0WbhI=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2017 15:26:51.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0705
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1706020000 definitions=main-1708080252
Cc: "josh.hernstrom@ni.com" <josh.hernstrom@ni.com>
Subject: Re: [PATCH v4] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 08 Aug 2017 15:54:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/19/2017 10:56 AM, Wold, Saul wrote:
> On Tue, 2017-07-18 at 08:34 -0500, Haris Okanovic wrote:
>>
>> On 07/17/2017 03:31 PM, Wold, Saul wrote:
>>>
>>> On Wed, 2017-07-05 at 12:33 -0500, Haris Okanovic wrote:
>>>>
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
>>>>    1. Prepended `KERNEL_PACKAGE_NAME = "tiny-linux"` to
>>>>       linux-yocto-tiny_4.9.bb so that it may build alongside
>>>>       the main kernel.
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
>>>>    5. Appended `CORE_IMAGE_BASE_INSTALL += "tiny-linux"` to
>>>>       core-image-base.bb to include both kernel flavors.
>>>>    6. `bitbake core-image-base` to build an image.
>>>>    7. Verified image contains two bzImage's under /boot/, with
>>>>       "yocto-standard" selected to boot via symlink.
>>>>
>>>> Discussion thread:
>>>> http://lists.openembedded.org/pipermail/openembedded-core/2015-De
>>>> cemb
>>>> er/thread.html#114122
>>>>
>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>>>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>>>> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
>>>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>>>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
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
>>>>    * Remove PREFERRED_PROVIDER check in linux-yocto.inc in
>>>> alternate
>>>>      kernel builds, since alternate kernels aren't the
>>>>      PREFERRED_PROVIDER for virtual/kernel by definition.
>>>>    * Remove "virtual/kernel" from PROVIDES in alternate kernel
>>>> builds.
>>>>
>>>> [PATCH v4] Another rebase onto master; no functional change.
>>>> Improved description and testing steps.
>>>
>>> So I finally had a chance to get back to this and test build with
>>> it, I
>>> saw the following WARNING, which lead to the ERROR:
>>>
>>> WARNING: Variable key FILES_${PN}-dev (${includedir}
>>> ${FILES_SOLIBSDEV}
>>> ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig
>>> ${datadir}/pkgconfig
>>> ${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la
>>> ${base_libdir}/*.la) replaces original key FILES_linux-yocto-dev
>>> (/boot/System.map* /boot/Module.symvers* /boot/config*
>>> ${KERNEL_SRC_PATH}
>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build).
>>> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
>>> do_package: QA Issue: linux-yocto: Files/directories were installed
>>> but
>>> not shipped in any package:
>>>     /boot/System.map-4.10.17-yocto-standard
>>>     /boot/Module.symvers-4.10.17-yocto-standard
>>>     /boot/config-4.10.17-yocto-standard
>>> Please set FILES such that these items are packaged. Alternatively
>>> if
>>> they are unneeded, avoid installing them or delete them within
>>> do_install.
>>> linux-yocto: 3 installed and not shipped files. [installed-vs-
>>> shipped]
>>> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
>>> do_package: Fatal QA errors found, failing task.
>>> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
>>> do_package: Function failed: do_package
>>>
>>> Something seems to be causing the FILES_linux-yocto-dev info to be
>>> overridden, I have not tracked down the culprit yet.
>>>
>>
>> `FILES_linux-yocto-dev` is set to the default value from OE's
>> bitbake.conf. `FILES_kernel-dev` on the other hand is set by
>> kernel.bbclass; when `KERNEL_PACKAGE_NAME` expands to `kernel`.
>>
>> I think the real issue here is that QA checks care about
>> `FILES_${PN}-dev` at all even though that particular package name
>> isn't
>> listed in `PACKAGES` variable. I.e. `FILES_${PN}-dev` should be
>> disregarded since the `linux-yocto` recipe doesn't create package
>> `${PN}-dev`.
>>
>> Thoughts?
>>
> It's hard to special case this. After you sent this, I realized what I
> did was set the KERNEL_PACKAGE_NAME to linux-yocto and because the
> KERNEL_PACKAGE_NAME matched the actual recipe name we got the strange
> ${PN} interaction, we might be able to add a test to flag that as an
> error or warning in the kernel.bbclass.
> 

Ah, I see what you mean now. There appears to be a bug in 
lib.bb.data.expandKeys(), where variables name are expanded 
alphabetically instead of definition order. Filed bug 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11905 for the issue; 
see example.

Unfortunately, I've not been able to workaround it yet. Adding a warning 
when `KERNEL_PACKAGE_NAME == PN` until bug # 11905 is resolved.

Posting a PATCH v5 shortly.

> I am also seeing an issue when I build a 4.9 kernel and then set-up a
> 4.10 kernel with the kernel-abiversion getting mis-matched from the
> depmodwrapper.  Have you tested with different versions?  I know it
> should work with a old kernel/userspace -> new kernel, but not from a
> new kernel/userspace -> old kernel.
>
I built linux-yocto-tiny version 4.9 and linux-yocto version 4.10 in 
parallel in the aforementioned test procedure. I'm not sure what you 
mean by "old kernel/userspace -> new kernel, but not from a
 > new kernel/userspace -> old kernel". Can you send me your build 
procedure -- I.e. sequence of bitbake commands?

> Sau!
> 
> 
>>>
>>> Sau!
>>>
>>>>
>>>> ---
>>>>    meta/classes/kernel-module-split.bbclass  |  9 ++--
>>>>    meta/classes/kernel.bbclass               | 85
>>>> ++++++++++++++++++---
>>>> ----------
>>>>    meta/conf/documentation.conf              |  1 +
>>>>    meta/recipes-kernel/linux/linux-dtb.inc   |  2 +-
>>>>    meta/recipes-kernel/linux/linux-yocto.inc |  2 +-
>>>>    5 files changed, 59 insertions(+), 40 deletions(-)
>>>>
>>>> diff --git a/meta/classes/kernel-module-split.bbclass
>>>> b/meta/classes/kernel-module-split.bbclass
>>>> index 1035525dac..9716c5937b 100644
>>>> --- a/meta/classes/kernel-module-split.bbclass
>>>> +++ b/meta/classes/kernel-module-split.bbclass
>>>> @@ -30,7 +30,7 @@ do_install_append() {
>>>>    
>>>>    PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>>>    
>>>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>>>> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>>>>    
>>>>    KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>>>    KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>>>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>>>>               postfix = format.split('%s')[1]
>>>>               d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix,
>>>> ''))
>>>>    
>>>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
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
>>>> index 7670c7107a..7fa4509961 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -1,6 +1,8 @@
>>>>    inherit linux-kernel-base kernel-module-split
>>>>    
>>>> -PROVIDES += "virtual/kernel"
>>>> +KERNEL_PACKAGE_NAME ??= "kernel"
>>>> +
>>>> +PROVIDES += "${@ "virtual/kernel" if
>>>> (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>>>>    DEPENDS += "virtual/${TARGET_PREFIX}binutils
>>>> virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>>>>    PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-
>>>> alternatives-native"
>>>>    
>>>> @@ -33,10 +35,23 @@ KERNEL_VERSION_PKG_NAME[vardepvalue] =
>>>> "${LINUX_VERSION}"
>>>>    
>>>>    python __anonymous () {
>>>>    
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
>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) != "kernel":
>>>> +        workdir = d.getVar("WORKDIR", True)
>>>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>>>> +        artifactsDir = os.path.join(workdir, 'kernel-build-
>>>> artifacts')
>>>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>>>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>>>> +
>>>>        # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>>>> KERNEL_IMAGETYPES
>>>>        type = d.getVar('KERNEL_IMAGETYPE') or ""
>>>>        alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>>>        types = d.getVar('KERNEL_IMAGETYPES') or ""
>>>> +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>>>>        if type not in types.split():
>>>>            types = (type + ' ' + types).strip()
>>>>        if alttype not in types.split():
>>>> @@ -53,22 +68,22 @@ python __anonymous () {
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
>>>> + '/' + type + '-${KERNEL_VERSION_NAME}')
>>>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' +
>>>> imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
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
>>>>            priority = d.getVar('KERNEL_PRIORITY')
>>>>            postinst = '#!/bin/sh\n' + 'update-alternatives --
>>>> install /'
>>>> + imagedest + '/' + type + ' ' + type + ' ' + type + '-
>>>> ${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
>>>> -        d.setVar('pkg_postinst_kernel-image-' + typelower,
>>>> postinst)
>>>> +        d.setVar('pkg_postinst_' + kname + '-image-' +
>>>> typelower,
>>>> postinst)
>>>>    
>>>>            postrm = '#!/bin/sh\n' + 'update-alternatives --remove'
>>>> + '
>>>> ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
>>>> -        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
>>>> +        d.setVar('pkg_postrm_%s-image-%s' % (kname, typelower),
>>>> postrm)
>>>>    
>>>>        image = d.getVar('INITRAMFS_IMAGE')
>>>>        if image:
>>>> @@ -126,9 +141,9 @@ base_do_unpack_append () {
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
>>>> @@ -371,9 +386,9 @@ do_shared_workdir_setscene () {
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
>>>> @@ -388,7 +403,7 @@ do_shared_workdir () {
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
>>>> @@ -486,28 +501,28 @@ EXPORT_FUNCTIONS do_compile do_install
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
>>>> @@ -521,7 +536,7 @@ pkg_postinst_kernel-base () {
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
>>>> diff --git a/meta/conf/documentation.conf
>>>> b/meta/conf/documentation.conf
>>>> index 35b9103b4a..e061b98de3 100644
>>>> --- a/meta/conf/documentation.conf
>>>> +++ b/meta/conf/documentation.conf
>>>> @@ -248,6 +248,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel
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
>>>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>>>> b/meta/recipes-
>>>> kernel/linux/linux-dtb.inc
>>>> index 0174c80d85..da6467bf9f 100644
>>>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>>>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>>>> @@ -4,7 +4,7 @@ FILES_kernel-devicetree =
>>>> "/${KERNEL_IMAGEDEST}/devicetree*"
>>>>    PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
>>>>    
>>>>    python __anonymous () {
>>>> -    d.appendVar("PACKAGES", " kernel-devicetree")
>>>> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-
>>>> devicetree")
>>>>    }
>>>>    
>>>>    normalize_dtb () {
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>>>> index 637506a2a8..4e0ce029da 100644
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

