Return-Path: <alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 9527C78219
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 20:55:13 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5JKp1FR004789; Mon, 19 Jun 2017 15:55:14 -0500
Received: from nam02-bl2-obe.outbound.protection.outlook.com
	(mail-bl2nam02lp0082.outbound.protection.outlook.com [207.46.163.82])
	by mx0a-00010702.pphosted.com with ESMTP id 2b51xpjw54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2017 15:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7Gj7X6pRBYL+Fwqg1jS1NxEPdUlMWpuxa2OKFPrXTv8=;
	b=KIgDEusPhwX+iiuGaQJaLgvbrKpgl11jCZcYiTMW3wLE+WnMXheJmaCrUMYC9RV1y1MpuiW+luGms4jDIPhsERtmYnv7dH7Z0Uz02vJIv5k5HDRHe/ggqCxGuowDYqYWNEy75JMG212YTzZtbiDaT1fL7EXubXIKgR2iRtGVppE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=ni.com;
Received: from [10.0.62.53] (130.164.62.126) by
	CY1PR0401MB1324.namprd04.prod.outlook.com (10.161.213.16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Mon, 19 Jun 2017 20:55:10 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1497602780-1744-1-git-send-email-richard.purdie@linuxfoundation.org>
	<3a189ae0-064c-299c-84ad-55f9c1ce1331@ni.com>
	<1497651065.24449.25.camel@linuxfoundation.org>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <723ef899-ac84-359f-ff8b-dd18b77e06bd@ni.com>
Date: Mon, 19 Jun 2017 15:55:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1497651065.24449.25.camel@linuxfoundation.org>
X-Originating-IP: [130.164.62.126]
X-ClientProxiedBy: CY4PR06CA0028.namprd06.prod.outlook.com (10.173.44.14) To
	CY1PR0401MB1324.namprd04.prod.outlook.com (10.161.213.16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10060805-6be2-4313-c121-08d4b755799c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY1PR0401MB1324; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1324;
	3:eea0bE4R9uXHmemytXI1GxLxgFa+gUAwioEcQz3l2PJopTlpV6gfzXCNr5FOw0630Qobhiai4Pfrf7QoxGzqTQSg+QRlrUZjv1lnuYhXno1rOZtMrRlfapwKNeq16/0RlQKcZFQmPzsRAGffqZ3IY6YDx41yv0IAoFXAMIE1/NmrjGr/vzLW97BB/3ktwbpjb7nvhwpgRqK/NRuEbTZjGv148F/lEJatfJj4RuFIEpduoxlsEi0s6sL4Uke5uvoB/WF2/+OTNhXiNN9Pg4za2BabYG977UFeZNv6sEUbMjU2CMRTtNIoMLUDFWseSF4aK5MKvelliPT6y6bweozjbw==;
	25:1mO9f1SyO8I984OMZ7jW0KqYJ/t/duqwLZzcsLHKGNWstFHysYuzHJTW5u+dz2ww2cjZutTE+U+EBcZeKpO8m8h0/jSEsyYmdUBZJQNCWLoY/1QGvCGP6Can0NDXeVFE5TKOUwp8NZyG9MvT8qfAd4emowUdqrdcbrfVZPDmPkErw9FHVJYvG8XhAv2svRnBrGzRa8+PyiTTL2Ccs/3kxfVc9VZh0YUvR3xltIPGTqFxBAWgzgSw7WSVe+q1h48jIDn5K+IafmFsbE4zfxicP5MoOy71p8ylJhcnNm8oNvTpedZf2zatYxmRxYRE9l5EgW6ZdaYUaGA66Jn9JP4IDJ0TiGOuBnD1X//hoPwmwKIxCmG5cczPGLs1WZZXc6OfBhUaHQtebl5PLuRtFjvztPJXqmdgxFEdcRO4x0OyEwdzBvQGFI0XT1kPUCnJSSCzGyHuY+zGj2d1A3e1tbpG7gPFGyidR6CimbfYVQwnQzU=
X-MS-TrafficTypeDiagnostic: CY1PR0401MB1324:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1324;
	31:iln0qgs6okzJ3zOWPZ7l3JEHnNGFitt9/W2s1fB9iaxpkVzdMo0DFBZQVl5WEqJO4aqylkNesfeBaKjGlR3Kwg/dYbZQbKhgEjrlMq4TDREbH24T/lPRvECnximZ1/CaUSys7uK9UL4UgA36V06Jajp1QXJgRo0lKFFm1LlAwO9viudE8/42KNwb4cJi+QVtXShMFdV5Egp2WITC5JBr+E7YB6hU45+HDFUSUKgjoJ0XTvg1tpR1oIt2hmpqSlOd;
	20:8bQaku9ztp+NFX0QIwgEonmFNbjRcx7F+hv/KkFkJsZpbSeWc1NBie/1rHYVsI6IFkDI9hwH7tAr9Iw3cBKee1FoBVKPvZ613RrAiTMqRqknZZ8F5GG9zsrlFXsTKgj0qq9Ki7KHCuE4075cDT+WZO5VgseIi4im0IUSJvbwuOh0oHWdrO+TEl0IocOb/e6BJOMOEh9gHuv+V2hSRd8+ngu3HY/GRa4Fq+OPzvTOAcE2P4j9JAh0ig4c1bsFb+5L0VBmC97ejix3k6wpxhScSHO6e5w7b1rdpWjRihsqpmks09BP6xBJHSORHd+4iZmlxoK7tYnrUPhnolPICJbEOxwlcsp2gsTfsX33GLI0KEa9vuvJAi56NGDSJsmWlT3OaAyqSapFJ6xQqnZHb+rftxCqErNkrLJauFe6EV+xbK6gMrtzEj8IAd9HON7LVMci6WgiRxDOH9lGrA9g2vTiRFb18Kk08KNhtwdlxcAMyk5ZRjrub3k65uy/SyUFv/KUk9FsLOG6BHyMUb4IVZDpVqrWz9swNNXpY44pNl72zguiGauPpRMJHee6/7flpEPzXGUhvqSLfI9Z9SGlznHbri+6q5t4NqSa41tgR0dGBlw=
X-Microsoft-Antispam-PRVS: <CY1PR0401MB1324F84F6C5C4F0D98828B7A86C40@CY1PR0401MB1324.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6041248)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0401MB1324; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0401MB1324; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjA0MDFNQjEzMjQ7NDp1Mm82eHh6NUM2Nmxvb3haSVArenJNZW0r?=
	=?utf-8?B?NjhxeEhRcGdHT1lYOGRIcDRpMnRuUWFhbGI4TGV2cXhyY0FXVzZqOWdVUlBB?=
	=?utf-8?B?RUg2OVM3NWxwSy91VkdHdytWcit6Q0IxaXROY29LclBFeGJKSUU4NGRkVWNR?=
	=?utf-8?B?aUdPWHZaQWxKeW1pKzQvdXR5UlJmSU1HWldQOUVmenJMci8vWnYyTTRpaDVC?=
	=?utf-8?B?SXdkSU5kb3lLQjFWTVlWSWtQYy9NMjY5UDZmSk9QbXIrZjBYRjRqMEpFeWZa?=
	=?utf-8?B?cHorWGpQYS92MUJUQ1Y0aFNMRndjMU0ySzVkd1UyZzZaNnMvVDM2ZG9od1VX?=
	=?utf-8?B?cGUwTVYyZzQwSFI4TEsrV1BuaXZScURuaHlvRHBXbW5DWlRRVnpSSTJxUmRm?=
	=?utf-8?B?Y3pvbFVnQmVQYmJSejRScjZMUG5xL3dIS1pZRVVQbnJmd0MvY1VnNEhhYnVs?=
	=?utf-8?B?d1BOaUFMS1pTTE11Mkd2MERnbVZlRlhTT215cXJxODFVVWdvdmoxa1hTZFp0?=
	=?utf-8?B?KzVRdC9tbzdIeHFiRjJML2x2dk9YaGE4VkVmbyttMXd4RmVyVUZQdXYwQmJ5?=
	=?utf-8?B?WjFJckcxdW9panFhNkFxWGJoT3R6WXRSdVMrbUxwV1h3b012VFA4cmdnQXls?=
	=?utf-8?B?aldESFdNdEhtZENiVnFFSW5FTGMzZmYvVDQzNmtqMzZFSGVadkVDOFg0RTZY?=
	=?utf-8?B?ajB4L215MGs1blh3TTAzWVFGbi9RYlozK3pMeG5hY3hxa1gzWWUrNmo5Z1dP?=
	=?utf-8?B?aG5sd3I0WnhzditSM2ZCZjZjV1UwTkdyNUE4UzlUcHJ6cDZiLzlnZERVOEhr?=
	=?utf-8?B?YnVQK2VhT2FxcHlZSGpsWGg0a0ZuUUtlVElYUmQxeUpIREhyc1dVbnRjQ3ho?=
	=?utf-8?B?OVRSU21vV1FubVFjamllVitXdVZ0S3hzN0RHdU1TWHZtMllLTmlRdzZYSkQ4?=
	=?utf-8?B?QUxuWW1BWTk2UUZlaWV4TFlMclR2UDFVWjB5QlU1R2tLY1hrdjNSYWZmQ2oz?=
	=?utf-8?B?VU9zUEZkeWVtS2hjQUg4K0ZXUkhnY3ZwUCswQ0hHTW11dGg5WTBVSDR4d3Vz?=
	=?utf-8?B?YmpKTmg3Ukl5bEwxOHQ2djFMbWRRSi80QkFvb1o2UkVmNGp5dDFEMmZaQklB?=
	=?utf-8?B?NFNkZDNveFVnY2hNUDMzL09zQWszK3ZHVFowSldmSmNRYzY1YzJ3dWlYUWpP?=
	=?utf-8?B?RG81NUIxaWxmNWp1MlRWeTdVZHBicHpWZEpkVmVzY1UxdThZNEx1alJFUUox?=
	=?utf-8?B?dysycVhXYStDOEtEbzVKamZ6ZlFORkZic1NKM0RBNVBGQUNjd2tuK2VUdDdl?=
	=?utf-8?B?WGdEL3BVU0VHMWp2S3ErS05TNWFaSG9iK05zMkpiNXNiSWtIMlBxdE41NzAv?=
	=?utf-8?B?anhtOGdackg2QnVjK04wdFlqTXVWaU9oU2dDakFZL0NKRUxFbGIzUndFY3FE?=
	=?utf-8?B?bnB2dzFtR2NJZWNsMUpQdWRkSTRHOFI4aUZiWk8wUUYzNkVydW5FdXZyaDM4?=
	=?utf-8?Q?BaEqC8ehz4bBmsx7QtQrqJqOvmQJ19acJqbNY19qYtSn3m3?=
X-Forefront-PRVS: 0343AC1D30
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(39850400002)(39450400003)(39840400002)(39410400002)(39400400002)(377454003)(377424004)(288314003)(24454002)(31686004)(23676002)(33646002)(4001350100001)(50986999)(6666003)(305945005)(2950100002)(76176999)(6486002)(5660300001)(77096006)(65826007)(54356999)(7736002)(8676002)(42186005)(50466002)(64126003)(229853002)(2906002)(81166006)(110136004)(65806001)(83506001)(25786009)(478600001)(189998001)(66066001)(47776003)(36756003)(3846002)(65956001)(230700001)(31696002)(38730400002)(90366009)(53936002)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0401MB1324; H:[10.0.62.53];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjA0MDFNQjEzMjQ7MjM6YUJROUZxME5BN1JzekNDZ1IvVmJrazlw?=
	=?utf-8?B?R0VCQ2grMWRyaXFmU1pyUlJ0V04wL1ZtOWJuaEZEN1M1RGIvZGx0d09yM3Rw?=
	=?utf-8?B?OVZjYWpCRDZFcTRrSFFmcWxKUmNjYmlZWU01WXVVc2dCMGc2dHdRSlVsRlFn?=
	=?utf-8?B?QWltVnMrSmJaMUhiWVNUNWxCVHl1cmFQZ0ZSQnFRb1o3T053TjVCOStlaVdF?=
	=?utf-8?B?RnRQMWppREE3KzhsTnpYKzRlUzNMWmlqaXB5MmNjaUlaNkZXREZXb1lCRVNh?=
	=?utf-8?B?a2xKb1Z5Q1dJV0xvcHFZUytKb3lsYUkrUGhqR1BVREJLbVI3TE9RY21yQzQ3?=
	=?utf-8?B?MGJzSTBSTW5zbWlqd1hTcm0xUXFER1luUkRnc3JLeHVZVEV1M3UvRGFlT3lv?=
	=?utf-8?B?UzJiTlFleml4bUZwSng0OFVUNThlbjArWDBYVU15YjB0SjRkajJFd1NKYkJW?=
	=?utf-8?B?eUd0WWxlZ1hYMFo4ZmJiM25iek5LbjR3UDJwN1lwVllrMStYZ21pNUxJc1l2?=
	=?utf-8?B?VEN0UE5MbXE2ZnVFR0pHUnpmZTR4QXErSzVTcUUzVlpKUVgySFJLK2JrM3Nu?=
	=?utf-8?B?a2ttUzlhbktxNW9CYW94M1VxTWNacUlZM1MwR1RRa21PMnpVM0xTL3dxaWdD?=
	=?utf-8?B?a0tpbXgyWTdoOUVKRnd0U2svOXlySWIybCthczJLL20zVWtBSmxkeVBUMWd4?=
	=?utf-8?B?SEIvbVQ1REZqM2ZmbTZmUk1VT2Rtbkw0dGs0WGhMb1ZNY1FZaXdldUZaeC9m?=
	=?utf-8?B?ZkZkVEFBTFJnWThBZVNaSmdjZGQ4M0h6bUtjYzhGNUJDcytXM0FkSXArWmQv?=
	=?utf-8?B?T1IwYS95QzQzTGgwV3ZCN0pMcHBheWxEZ0VtSk8zOGI1TnQramhsTjRtL00v?=
	=?utf-8?B?TzNVNHNXc0VhUHVHNDdpZSs1eXhDUHZySXl3dUFDNFhXcU1YRTROQUlvOUw1?=
	=?utf-8?B?bm85dVpIeko0blBjOHNJQzB3YjhmNmZCSGhhTjlQYXhCTHVFYjRIYm95WnZW?=
	=?utf-8?B?Y3pCUExFSUsya2p1NExLMWZEbVg1TzV4SmdOcjFla2YrcEtzWFRtdW5NUnNE?=
	=?utf-8?B?ZVcwYXg5ZStXN01vM1J2bFpjZXppZkkvcGxLMVFWc2ozK2FNL3hwKzJzZlk2?=
	=?utf-8?B?cDQ1WVdoZUdqNzV4Skd4bEljaXBmV0N6TURMelk3V085YmljWUdhWE5FUnMw?=
	=?utf-8?B?MW05a2dxMXJYaVQ2d2hURFowYWVLUjg4U3FjK2ptbDBaWE53YS82L2pTWVlE?=
	=?utf-8?B?RUE4VTJGdXF3Q0lQcE9HU000dW42cUZYUkZBOWNwRWRtYWZBZHM1bjJ0QnFy?=
	=?utf-8?B?RUtWVVlIUmMwaGJESm8yMWlsdHRNTWtMU3JwaDJtbTBySzJGNkw1ZkxweGt2?=
	=?utf-8?B?VVZRTnoxRE9nQ093bXBvNEM4L1c1K2l6U0NCRnhXeUp4S0wzSzBpNW5YUGZG?=
	=?utf-8?B?d0h6VlVPK3BQVnpEQ2tJUWlaaEsxWjBYVTVlZDJvRktqTy80b0kxU0ZWTEJm?=
	=?utf-8?B?Zm5NTUdwU0FVcjVnbXRPR3U1a1dtUEVRU0xPeEViQW1mNWl4Y3pQM3hJWWNY?=
	=?utf-8?B?R0JoS2RENUFsajhoOTQ2WWVIK2hjVUROTW5sMkV4aVVFTW9McUJjclNReTBF?=
	=?utf-8?B?RXMrRlVmYmxhVzdIVk5vYXFBWjduSG5VM3UvV21qalpxSThSREtMeVNFZ1FG?=
	=?utf-8?B?TmhEMmtpaFZkWlB4a1h3MlJKUk9taEJpOFJpMWk1UWpIQW9STHBkME84cTJD?=
	=?utf-8?B?ZFlOSERzT0ppVFpBck1jRU53PT0=?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjA0MDFNQjEzMjQ7NjpvYTlVM1JZTWJWR3NraXplQUNNck9mL2Zj?=
	=?utf-8?B?OGgrTUpNMHF2MlM5Ri9FeGJ6TW1lZ1BpZldMQ1FURm44UEM3L1pldjlPeDNz?=
	=?utf-8?B?VFlWTzVGNmNyQ0s1MEo1SThoRWtEL2lXQ3E3b0xSTnFKdHJFeUwyWVd2cVAz?=
	=?utf-8?B?MWplb3BKNDl0Z3JtKzhob1h1b3JFcU41QkNiZGFCMGZmQzRBdnVGVE5hSGVj?=
	=?utf-8?B?NkZXWE83UWQyRlVTa280QzEyU2diSlRndDVHM1NhbUVtSVVkKzRtK3ZScm16?=
	=?utf-8?B?Y0VEVVBZWFBESHJPNGZjM0VQZE4rcDROZjZ4cHpPbHdoTkZTVlVBOUMzNC9x?=
	=?utf-8?B?MGxSYnFsMW55S1VSZG9aK3FHSTNpVktyVnZncUlBNFZlbFZ4NGwrWk0yZFFQ?=
	=?utf-8?B?SDdHWlVtM3FGVmdTa1dLSDJpTm43UE5WQjU4S0laQjdSNXhnZjc1ZmlkWHhF?=
	=?utf-8?B?Zi9JelArNWlJa3dBb2dGeU9YTjlQdzhsd2hLL3o5SkdYZWtqQ3ZIL0hCR3hi?=
	=?utf-8?B?cVU3NWZiNU02MVZIOGlYVGpmb1hSQjM1UUdMaVRnUDg5UkVkb0RFZDU4NC9Y?=
	=?utf-8?B?SnVFbGxlNUtiOEQ3WldKSG5NelJZUi9oeWdlSzQzSkVPWmFsd1N2MGFiQUNj?=
	=?utf-8?B?dnZJYkZiZXVWUEZMUzBaZHZWYmRpQWxvZjUxdlRDRXFrSHJTdytXNEJvTlVP?=
	=?utf-8?B?a1hlM2F5S1dFUHMvR1UxeGdQbExQeWUvbzlvMTNGYVpGV2xqbzJiWGZSNVdy?=
	=?utf-8?B?N1VudllGUU80bkxRUzdObmI5MHh6VHBwQ0tNRTBDL3l3b2JwaWtGNVBWQXZT?=
	=?utf-8?B?Y3hRWi9vVU9wM2pvVUNqVGpiU0JCZlh0UmJCbGpPQnhkVmVybld0NjNIY0R3?=
	=?utf-8?B?RDFBOTdyejVjNG9xaVVEK2Nza1JmQUpWNUN5ejlOeEhnYkRsQWhyU1dqNmJS?=
	=?utf-8?B?dG4wL0RoZ0M3WXdmcDk5b2NrWk05dlU5dHRyTXFVRTZKaGVuWEQ5cm1pUXo1?=
	=?utf-8?B?MXFrUHVxSjYvUjJVYzFsKzczL28xNDBFU0g5R1dVbXpvaWhHcGpTakFoSjlx?=
	=?utf-8?B?TE5LTVpZL2NrWU0vZ1pvL0pZSTBYbE9TdmIwaXlaS3dXRXZXaWJxN0lMM2Fl?=
	=?utf-8?B?TXR4cUF1ZXBhVm5TV3RCNUxBRC9iMDIyOTltNWJVQkhITDhxOEhHZS9mSkQy?=
	=?utf-8?B?MUxsSk14UzV5ZzY1NWFtN1FsZkdQVVJ3VTBjUHAvbGgzeHhLK2hoTzFKTENt?=
	=?utf-8?B?SG5heDFBZVFvL1k2UFRwd2hNNTFOcWZVbjMwbHZVakh2WWNjQ1VDS2dJcUR0?=
	=?utf-8?Q?x02P6fVQ3OMhsMPLQ7VmUJwNFO5QfBnBw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1324;
	5:8U1U/VKzaRohM66FtbSwWr8J5XMk6xavT3oDTeGqbf60B/2g8bppHU4GRTaQW6dreeUmjab5l+pfunin9zaL0A2t76l5XYCda4DAGeQc1mtqWpZ6/m+plRx2PQlyfrUAucsijr2OPtwzHQ6P/TH7bBzasIqb9/IthTEplA8pDgNi8fBJtygOaw5Z690GqlYVcA0alJrdQXNfe3Bpx52MNxe/Sq+bOSMD7V0XlVfzO3VhxTTypniuyFIG+Rn5goYBa7xvxjyMYKhfyqcSTNpkzV51v5ht2LuPht7lmF8hVr/L+Oz0LrJyizLElUETmFEiGQVGwi+p+OLdxQTjDZ23Mjikcqhmi+y4+yUScYcc3AUPRFFN0/PGmLsbN62KKoAPgQLzl/uoWKt/V07XCvn9nWnNd9UX/8AkHyXQBvALX51JJ+6Q1fqmZCiYT/hRm+7WNLimFd5xgVpT3GCRzaqjGMmF3nGTlptUAVcX3Nz9GErrN+xionMwijzMujN3hgDs;
	24:/xpPcyWwEgthdtBe/rn4tUiRGs80R+X0HY+3DRjkIgaPWtH0wLS8PEojxBjhRgIJ6BVzwrcdYtCvRYLQUqQz/7mJYTu8hszuvsmhLR/yY84=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1324;
	7:QbaUB+2H5Gavefa9gGMmr+OQbqUCemg1eGp5HF5ltTr8H+puNSimIwLZe+HTUqQrRDntRlgQFs0reWohY2Hu2Uieto9XGAsE8Ta/VyqBWNYEApyVseKnR9+PhDn/hLnqBs1/PtipmVawTA6YId4b4i7GccIaDE27F5hxWFXfaR4UeDR7mXNux49xEFPeBmcQZ4mgutzCpEwRWs49IjEjYJmqd2GhuxmYoxfZI0HO0gbhm0mAbCjd3Lqs5hWcAUHzgFBh4IsgsZvuivtyYPFNmMqjY9R1I+WjMDk74+bYbMFxPLx2Cab4bCsR40yzHFuNePbj+w7ZCqkEFTyA2LkwVvy+UZztz5uZb3vAR++zqQh1qKj27fkd5fzXyz+zatgiPoDZt6vH0+phN+UjNw//d6PM2COadAAF4BEl1mNKo1E71PKIAEROwHoQ/ZARRISv1D8g1LN2JuaPfNg/P1nI5unXerQ67u2yoFQNsqaZVJx6QkAbUxfFK1hVaPW7wWUkV98Uj9SNIOkwv0+mIySmhMmxP3VaelLW4kP+E/OXJpHMeRzpZvjz3jTK0zW2gPWPlvgp15lQJbc9C9FOR82T1+f3iPCbAQmHVx29gx4WWCtuwa86weXPO5172WdQn3653yI5mMuBjklx0XSyRQuIuBUQA032lYo4/H2aaIt45o7TcRoGq+bHpSVx6NZlrqmxx51FanUudwoLFvdgz6uNgosKk7zQUuqeS4LdBVsdAvZqaw2JRZ0f2Tnt91s77ZV46kjR0A0OBr83lVTkHOaDWl5AivnN6jqUbI78YNBjJBk=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2017 20:55:10.5251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0401MB1324
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-19_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706190343
Subject: Re: [PATCH] package_ipk: Clean up Source entry in ipk packages
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
X-List-Received-Date: Mon, 19 Jun 2017 20:55:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 06/16/2017 05:11 PM, Richard Purdie wrote:
> On Fri, 2017-06-16 at 13:43 -0500, Alejandro del Castillo wrote:
>>
>> On 06/16/2017 03:46 AM, Richard Purdie wrote:
>>>
>>> There is the potential for sensitive information to leak through
>>> the urls
>>> there and removing it brings this into the behavior of the other
>>> package
>>> backends since filtering it is likely error prone.
>>>
>>> Since ipks don't appear to be generated at all if we don't set
>>> this, set
>>> the field to the recipe name used (basename only, no paths). This
>>> avoids
>>> information leaking. We may want to drop the field if opkg can
>>> allow that
>>> at a future point but the recipe name is a suitable identifier for
>>> now.
>> Looking at opkg-build, opkg requires:
>>
>> 	Package, Version, Architecture, Maintainer, Section, Priority,
>> Source
>>
>> while deb requires:
>>
>> 	Package, Version, Maintainer, Description
>>
>> It does makes sense to require Architecture, but doesn't make sense
>> to me to make Section, Priority and Source mandatory. Opkg does
>> process packages that lack those fields.
>>
>> This should be a trivial change to opkg-build, which I can submit
>> into opkg-utils. Including that patch in the opkg-utils recipe may
>> simplify things here.
> 
> I agree, I think that may be a worthwhile change. I was a little
> surprised it didn't do that already and appears to silently fail if
> Source: isn't set (or we fail to check the exit code).

FWIW the opkg-utils patch is already on the opkg mailing list, in case
you think it's worth pulling it nevertheless.

-- 
Cheers,

Alejandro

