Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0061.outbound.protection.outlook.com [104.47.34.61])
	by mail.openembedded.org (Postfix) with ESMTP id 748BC71CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=um0ofEHZ46kpWoxiUhpD23HBQzl57Zm2bFWuWnaMW4I=;
	b=cH/Avd2PUX0mtixqHw3TflQmecQgQdVbP123dviY1Ibn+oI/feojDgkJAQdcyhu7mxlGOM+JGoaNPM7PLhP+cHNqsF+DtMLn63cnMaXsauNLw3/8JI4AodFRYGoOMRLBch6MEk35Vw4JyBrLJZFZ/FJ3bNhZxMf4V2AEly+Hw5E=
Received: from BN6PR02CA0031.namprd02.prod.outlook.com (10.173.146.145) by
	BN1PR0201MB0753.namprd02.prod.outlook.com (10.160.169.28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Wed, 8 Mar 2017 20:40:39 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by BN6PR02CA0031.outlook.office365.com
	(2603:10b6:404:5f::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.961.14 via
	Frontend Transport; Wed, 8 Mar 2017 20:40:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.947.7
	via Frontend Transport; Wed, 8 Mar 2017 20:40:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60421
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cliNy-0007kE-4p; Wed, 08 Mar 2017 12:40:38 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cliNy-0002xZ-0n; Wed, 08 Mar 2017 12:40:38 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v28KeaaW027271; Wed, 8 Mar 2017 12:40:36 -0800
Received: from [172.19.2.216] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cliNw-0002xO-FX; Wed, 08 Mar 2017 12:40:36 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <1488527950-10906-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJ86T=VqHM=cCyJGg9=MWLtBMFPoqhbAxpwsd=GuK5wdE0cWtw@mail.gmail.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <c1259e9d-239d-60b9-e26b-2fb831146db0@xilinx.com>
Date: Wed, 8 Mar 2017 12:36:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VqHM=cCyJGg9=MWLtBMFPoqhbAxpwsd=GuK5wdE0cWtw@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-22928.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39850400002)(39450400003)(39840400002)(2980300002)(438002)(377454003)(189002)(199003)(24454002)(9170700003)(305945005)(2950100002)(6916009)(229853002)(1411001)(50466002)(8676002)(6246003)(6306002)(31686004)(54356999)(33646002)(65826007)(966004)(81166006)(77096006)(8936002)(31696002)(1720100001)(9786002)(356003)(64126003)(36756003)(5660300001)(63266004)(110136004)(39060400002)(53546006)(6666003)(230700001)(4001350100001)(76176999)(50986999)(4326008)(2906002)(189998001)(23676002)(65956001)(106466001)(65806001)(83506001)(47776003)(38730400002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR0201MB0753;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; MLV:ovrnspm; MX:1; A:1;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT057;
	1:5N+uhFA6tklO4qc1kBtUzuE0jORII52JZw1GR/VSFH1j5aLig6ZxAlNfOZwnJyug3v39+JUWMRF/Xy0CS1Uzw3LjQX64U+PfZ1fh5GtVU361gvW6GWQ5C8AAC6UiNoQUaoWdpwqWewIX3RFgZoRt8AfR+4OmT4GmHwkh/xX1NrgM0kUrusTs0+l0W3j3SVFsX7ncYR7355uCQnAwRgQUQItUzVX4tef3vC6VBTtVmQZuLKwZyT6cO37AR5KWYJ9k/xBHZCA/nowlhx5/ZlAiB5+lOg2B6fc4NcD62xJu27MfDh2LIjfa7pP6g3XojmVegtsy8KVU/f8fDYzjEZ6XOCLQRRRfLOK+DSHUzOJqufSnkP4D9nTIw2S002CGbdMOdcOTzfOzcqgTX3PSZBvCQYyz96n2lq0lwUZ7mZ1h5hRcMoUQRpIZIEIUfGYlCWHWywq+jWDWiXIxDoz00bv7ZPzq8aB8xU2slztHcw08pkVDwhVVWZU2du6g5u+kL49KDKC+qUKOZHXtfcHVq6CUL7W+4/Dt23bH3l4hGjmLeXI=
X-MS-Office365-Filtering-Correlation-Id: 0f1c0ee1-dcfc-4e03-910f-08d466636191
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BN1PR0201MB0753; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0753;
	3:UkjwndNVpwMps3ifqpuKhAcY98HOUQuzf/as6iDtGzsq0TzJqAalJx/mJ4BTgm2kBjB2d7zkaYzw8AvL4bgM/cDcKWXqaGEIWRNCiu5HNR72gp4NWdL3yai0J2ELG7yitP+ljR6khqbMVOPK/JP53BerOr7rlka2M5gVCHnaPHzOA083mMjoX2oJDra9tssht0VmMCc7ehXYfSYjg1Bavy1kN63hnNUmXR2LXGon1R0ns+nxOKGs/GmZu3aOVdSDThARMZ4BnCkeo0gfKDvBKDhAt2RsmvaajGbG+cb01hX5y9gn+CRBdoUW1J8jJ157re2+XhKgq/iPCP8gMRdhqqMOxsCTDwCINkEi5owYdXIrvLd5z028clej21MxA/0i/+NuzHhvgb54L7DB6vZWSg==;
	25:kpB4GbpokRl/uyVdSssCOks0vOQ2Hkhtw62M7I0GFrd9F4lK6M7QaCS92bgYHrtaM3S0nSRMiIgEY5KUfiJhqbTCerzopkChHD4prbl+Gdobi4+LxDzOZkvKC7Ayksz4kdvvEZfth9Fw2JvZOBcifRk7O8pNTXxigRe88Hm6u3E5gFIT0cG/75ij7bNgYuUqwulz75D0MUOfyecIOaqYI8UOY9a74CN1Dh+CCLJgCGFErwpX+SRtJMgi3l7UKzq0XoxEYU2lc6q5rgZ1DbAInrHDLSYf4KHP9cVrjEiMvqUfpFuU+4e75QTNbU4bfnHrm6QFrc0wEN5C5Dozqy9W6eAGmdFVbnAe+DCyIc3ue8UgMESOYLTYtdnbu0Zy5ztIxrfKSry5OLB6dpvfF0uxkZd4MW8Wg7k+6y+tYcuE8RBcmE9F2+NBrQXTuBNfDuxtUF9SVQNDvIO0mUUpm7emjw==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0753;
	31:fvmO3ZRZadoBsGOOpW3w9RdP+Gkbazd72+Hn/BdQ7IqOHY9G3OFdzAxp+BUgHUzBFw9dx6ebl0VY5chrpIOe+ZffwlmSy7b5YiioYcQolvXN+NLPC6ScMSJ7faqT6g615TJGppmnVJos1pdWOdMCKOI3EBmf4qJtZ/TnST4f/15KddEiLMZJqCN0J+glHGPzrY0QQl6PDQXNhMkiRdwHDxrEbupwUrI6n8Vvp125KsgCiwbhHanKSmhzCbvh4WRKL2B/h91+Y48KoUh4a6ykWG/NAjKQEFCLqqN6ZyUxrCo=;
	20:8iWW7/q0DDTGOjon215lCFZ8WoKGv55VDWp4Q194iDfqeCqS9QzfuJbMbl15Lk7PIUNwesp/VvY46MatQDupHo5npKnSQ0LlB4VZHJqaOjaQEjE5/YwBMPd4zxH/BwXfzV2M3MtxcoEnBqmJSS/LKunyd15EPJuT9NdBX1nnsTINutT3JweZ/oiOcTqany/ournBDXQ72iNOhLAQfpzIjbN86DRHbrV/EsUul6U02X0Y3VcbGc2pAwrngC3qSole3hTG0opWkVnW6cIT8dtNZregfiJzQE5S/LghXvZt+YPgS7dWc3yObRVRUlzlLWUX+EEN0uSBPvPHH4OgjCwjXCg6++txFKnBQmLtLOGH5+OdieLECxdd/i6ziMbqpxKPLchS5xebzghgzw1UojQa0XVRtLYAMbnNWkCr3MUYa+3fy3xR5+uOn7XbMruwJmJYOJ/AG3mXosDAUYpVKG7RdNuHztmrJusbXmqbz5eQUlrxHTHxL4lJszntDuSCLTEL
X-Microsoft-Antispam-PRVS: <BN1PR0201MB0753A401C6DCF9708CC5DE3AB92E0@BN1PR0201MB0753.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(13024025)(13018025)(13017025)(13015025)(13023025)(10201501046)(3002001)(6055026)(6041248)(20161123558025)(20161123562025)(20161123564025)(20161123560025)(20161123555025)(6072148);
	SRVR:BN1PR0201MB0753; BCL:0; PCL:0; RULEID:;
	SRVR:BN1PR0201MB0753; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0753;
	4:fG85ynRiGhkVW7PtQ5dT8v7w/JAaythMEcXmJ8QsB1GjMG0kSFkw9UfLFaiTViYhBcXkEtBQ2RpAs4VeIjxjXA8U62lWmYDnF7FvEqox/s9eh3LmxGH95S+tGG6yM9V/pFfSMRg992AHn4tSG3JyQ+7cbbn+d/4ZhKZy4dFE37pBETKASGPQgVZRR76e+YFsP1diiqV0L2hmTPfhmL6zrGOp3aae+afr2ziONpLoLgN7d1/nbGPQJS9IJ8jRIpiLPV82VGVnp8oTtPf36wRP9g2UmUc2RdoaJP0l1xGccRT8CX45V07X8x/JNtOidtuugN7tilscjFOXK9Rhwoxi5auJ85FG27M93FLpAmIE6dbeTxhY4HIkFqIH7Z747pewZXMXTIxF6teo8u6ZpceLNEL4/H8Wolj9Y9D9my39zVNq63Avweu0k/8beYuauq77L8jErcMZNTMbk/Q/YhMA/9u9im/yxXa6J3rg3qviBD+bjgCGS78jeA0XOTdIYKuwi8lZgi8uEJtQ6w7bkHpezRWiT/2JaAGd6W+zZ8OYFtrvNO+JE4k9MIJ9FHrk1/gCpnKhfdvGRfkc0gsVAamBP3rJGaC+NctYvwL8sY14/C4nzBtANr0Ub5aebDQXjqmsuMX5vn6yVkLJGUi2WCBks6+l7CX7OGNpkk3tIqTffh0YHYDtxSQantWe3vO7emT+uS1Z/qztssjj7BNuOBMpB2HdTAnGmFvabqNTc33VrsniFQekQwZsQj7Wt97+JhVHoVuQyDTx9T28CgQhg/XeTrc08SWdx86+L64nG0OyfnE=
X-Forefront-PRVS: 02408926C4
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFQUjAyMDFNQjA3NTM7MjM6VjVoNkw5T295b0p5OFBxZmVWY0N4WnVV?=
	=?utf-8?B?Y3h6RGRibzJQSUdUZG1QNjFFcVc0WEJoRFZmOGIwTmh1QXFuZlFWSjQyN3dR?=
	=?utf-8?B?dTdzTG5ZVHU5U1B1Nkt3NmVyRXpCZXhqSTg5ZUoxelpvQjZPNGpNZ04vdTIz?=
	=?utf-8?B?dWEzaVBzSFVYalFTSjFPakJRbmI1UEZHQndlQklTQ3AxNytGRlR3eU9acU1Y?=
	=?utf-8?B?ckxqOFRhN3dva2NJSXV5Vm5EOTFaQkZiS01aTGpNN1M4WG85VWJla2NXY2JQ?=
	=?utf-8?B?L3pVQXRwcXM2M0ZhTUNGZFlGS2ViWmdKYXQrSXNvRWxjOUpXYnlTZi85Z3l1?=
	=?utf-8?B?cGg0dHFneUt4ajlCUDM3aWFxNXpSUW40Y2UvNDhsN0RPQVJVbklWb1RVZHYw?=
	=?utf-8?B?UGpLZWcvbTJTTkRDT3Vmam55UVVtNmQ3c1ZWdVBKeFB6d2tvRTdTUzdkQXVE?=
	=?utf-8?B?bDdQZ0t5YU5GRHdMY25MK0ZMeWZOQWF4ZVFUYUdoWkRObVhmYTA0UG91ZE1m?=
	=?utf-8?B?TDV3RFRZbThienhIcVFQR1pXc1o4dnVLVVA0UnkvZnVHdVFpUytxYTk0Mkhx?=
	=?utf-8?B?d3JlbmNGRXE2ZW0yblBoa0s4dGo4NjRSZEp5VUFTakNSWWNMcHZKamZlVXdX?=
	=?utf-8?B?bUc5bDcvOTZBbWxNRXpmRmt4Tm52bFo5Wkd1S2IxSmtmcUljQlptQWFGSWxL?=
	=?utf-8?B?Qy8rSmFEeE1IZXhKMktJcFBTWVNKMStUSEtoWjBEai9IQnFxcDluajkweU9M?=
	=?utf-8?B?ZGMwY0tDK2Q2YjZQQXhjcnVuMEUxcHY3bjB3Z0FaTWllNUE1U2ZzZFFlRUMy?=
	=?utf-8?B?ekxOcWphb2hEU1ZiTnFDVmVjNWx6NEdUWXp2a1FYdXVLMzQ5a25Xa0JTRHJs?=
	=?utf-8?B?cnRQYU02WUtHZDdCUHkxUGxhc1orWmJ1bzhJOHo3c2p3NEM3dDczWnlwekVn?=
	=?utf-8?B?OTlGM3dsb1Q1TnoxRGVpZFZjM1ZScFkxNnNrbURKNGhPNy9NeTF6QWduelJN?=
	=?utf-8?B?azhha3EvZ2hSaGhIa2tFNUo1K09mY2lxUmlJOW80SW9EOGs0WThSdkl2YlFZ?=
	=?utf-8?B?VmN3eURVWHFXc1RxSWsxSTR1Mm1VTkc1TVVLcUdoK2NMbDBBRWNrTk4rOEdh?=
	=?utf-8?B?a2FkQU8zaUVMa2hhdy9EbHhTMncxR3BNcmJHa1NpWktaeUN6NGU2QWk4SXJG?=
	=?utf-8?B?TkJIWGszQWFVZERUQ2JEbHhGN0NqWkkvRzFOdm1LTEZ1RHRqNm1YU3AzeVll?=
	=?utf-8?B?Q082ZDFSYnNyeWlseEZKM2krZ1RBaVo5eTlzQkxaSG16b3RxQTAvbDRmb1lu?=
	=?utf-8?B?dHdwV3E1cmRka3R1VGpCMHFHMjQ0NVFVVjFvYkhMK2hCd3RoMjJKd3luNlZi?=
	=?utf-8?B?TnZ5QmVIWTRidlAwNXBBa0FhOTFWQXVVcnpEYlRHTXRZMFZJL21hUkU1V2Zx?=
	=?utf-8?B?THUraytCNzZrMEdZTHMxbm1CSmRYak1PSFA1S0hVcTMybkZvd0RnL0ppTm5V?=
	=?utf-8?B?VXJaV1RlaFJvUXNHM2Zvc3lpK1d1cHQ1L05KUEdiVC9NZ1liM09hZFkrQ1o5?=
	=?utf-8?B?ZXpzTm1taERLcmVkamIrZUFpUDdhSVZtTVZ3NkRQMTEySktRdG10RlJYeFAw?=
	=?utf-8?B?Si8vNU5xRWMwZ21BTlloVU02KzQxZC80cHpYdm9oVUtiVC9CMTN6UXZkVENr?=
	=?utf-8?B?MUNpWXA1K08zTHVhUktDaUJzVDMrU3dqa0JSRWs0K2ZDNXdHeDFCVWJ3MkRw?=
	=?utf-8?B?eCthNjdybDhUUWZhRnVxbzdGclZ2RUQ0WDlOM2I2MGNCWk9KeTdmTFZVS2Ns?=
	=?utf-8?B?YkdQcEdsZnJCcjFDWm54bzF1c21TRCtZVnE2bVRZaDlxVW1nSm5yYUpPYURG?=
	=?utf-8?Q?JWPtxZ8i4cLaA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0753;
	6:mLuc0WwUKDQDeNnB7RxCirxoM8EPc3/jFotdZAMtjYEPI55TK8LYxUyZzXh1UsElAzieoOgnWCVUxa4qV1BecrP8u2uSb2/4sFypq+ya8MKWSB+eBq3I+Qsgyk3vaRvBULemsjcMfCOAl43y3CDH3iS/7NzUjm5BnXAfBlqTM3uK2a486nijFyqXtcgkix6Q8OlEPblYaAtU0KhzZrbn5n714pEsegQ9ELdL8rzUWD0GIEaHGthkATGNhe5x5lQwx786YeuqdnhpG2VvYXfvAdmrClTZ6kS795eG6C3tfcx8s6wVnvoyhc0+CA+33OwscY0DBX3qB7JSubqYU0XGC29Tticw80BQsoTUKY3guno7cGfRzchOMyMJhQB5DOLtgU6Bbb28BxJI9yjimHbNnXZPvwZn2XrHFWDr7RqnQT0=;
	5:7QrlSs07KspPVJ1LAB3/yEjxcmHokNUSKQyTDkWwCfSvSVCGVg8cF5ItNf7Z8g/FArYS76IPG63GvMax7xJ/80vXaA5vSTDMcND95WAHT1JS0/r0wJPkPf+LJYUqaBQ2t3lg1QgCX7qFz4oL3HO7q6tPZhTdqOXqO/XzIjV0DL8=;
	24:QFx/Ya5Oo1gD0HtfC/b68SrdDTIU1vjaLeqUUctkDxqsp/oZmbRdn9ymCMkxP4Q6HlM0pzXgGsWoTnjNVyYOpkXXjVpehZCCmIonrn023kY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0753;
	7:jwjc0vfkARcgyGff3ghMlExVAgTSKTviRczsHc1HcH/HMcAcjZQ7sCG3ZxO8LH4Tb37RhLU5BtTguoNR0+cdq9QwxvUvUtbilQpmT95BOfyLh7cfG0FAFBID2IL/CXW/9b9UwfO2dIsVdVBAS1nNaS4Hpb2ap9q//JxjDef/5Rsci18dZ+XLY3oshclyABg6p1VhgwJ8f+7KwtR52HJ/SlCg7D15xIrkgD3eyOz5nmFcX8+xySp0oJelDPInZGHnYe3k6OFCssjkJrxyoLAm++Bf2i1hyGi0GGzo0v3RmjygPh5HpLe9YFNKfVCyMMAlhk78Noju/VcPR9hIdleGMw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2017 20:40:38.9557 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0201MB0753
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf.bb: Fix dependency while building kernel using externalsrc
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
X-List-Received-Date: Wed, 08 Mar 2017 20:40:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

On 03/08/2017 12:23 PM, Andre McCurdy wrote:
> On Thu, Mar 2, 2017 at 11:59 PM, Manjukumar Matha
> <manjukumar.harthikote-matha@xilinx.com> wrote:
>> Having dependency on do_patch will fail while building kernel using
>> externalsrc. Depend on do_configure instead of do_patch to bypass the
>> compilation error.
>
> I think the change to kernelsrc.bbclass is perhaps more significant
> than the change to perf.bb, so the commit message prefix should
> probably be kernelsrc.bbclass: rather than perf:
>
> Maybe even spilt into two commits.
>
Sure will send a v2

Thanks
Manju

>> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
>> ---
>>  meta/classes/kernelsrc.bbclass   | 2 +-
>>  meta/recipes-kernel/perf/perf.bb | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
>> index 675d40e..35cf49e 100644
>> --- a/meta/classes/kernelsrc.bbclass
>> +++ b/meta/classes/kernelsrc.bbclass
>> @@ -1,7 +1,7 @@
>>  S = "${STAGING_KERNEL_DIR}"
>>  deltask do_fetch
>>  deltask do_unpack
>> -do_patch[depends] += "virtual/kernel:do_patch"
>> +do_patch[depends] += "virtual/kernel:do_configure"
>>  do_patch[noexec] = "1"
>>  do_package[depends] += "virtual/kernel:do_populate_sysroot"
>>  KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index ffaa5f6..b13f8e4 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -45,7 +45,7 @@ export PYTHON_SITEPACKAGES_DIR
>>  #kernel 3.1+ supports WERROR to disable warnings as errors
>>  export WERROR = "0"
>>
>> -do_populate_lic[depends] += "virtual/kernel:do_patch"
>> +do_populate_lic[depends] += "virtual/kernel:do_configure"
>>
>>  # needed for building the tools/perf Perl binding
>>  inherit perlnative cpan-base
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

