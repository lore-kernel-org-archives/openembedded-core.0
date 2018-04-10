Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0109.outbound.protection.outlook.com [104.47.2.109])
	by mail.openembedded.org (Postfix) with ESMTP id 062CF74666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/JIyiXZCqj02c8ZlkJ9aKs8g/xx8ZFzs68FV1R8Sev8=;
	b=akHv3YOSBLerGlpBVPQCe/wfq1ZvuwPaqn9KRXIAm52SSNtDzQ80qYr1vGz8xkQxJqyd5HkT/+1OETkbhZMBCSsgLh6z1FWLF0fHcY7lrtwAUdzkj6Vr/4xx0vEJKstDTxp/T/T4lTJGwik3/8wfpj3cuL6rMXXL7mOQXOKE/Ho=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from [172.16.11.29] (81.216.59.226) by
	AM5PR10MB0435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:25::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.675.9; Tue, 10 Apr 2018 12:11:50 +0000
References: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <9a9f8fd3-8730-f537-dc35-391db9b3ff28@prevas.dk>
Date: Tue, 10 Apr 2018 14:11:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: DB6PR07CA0194.eurprd07.prod.outlook.com
	(2603:10a6:6:42::24) To AM5PR10MB0435.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:203:25::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3283349a-4fac-4422-619a-08d59edc3dee
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR10MB0435; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0435;
	3:3PJw5kFW+I7mq+AL0tyTsY1mdoK3YUeIVpRgzZT8pkeP5uwmkKf+dNnoVJNkdBUi9Pe48vj6AtSKA26ff9ztcstwRHmZ5QF4pjtO5qnPIAR8KL4E5mnGSORkO/SZsogOtTY0JVRH9LFl3GmHBIzjdaQTKHeN48WC/w1DqBHV2Yj0PBsPkcYX799OdDbbHqWMn8eaWbdT130Mev8Z5TpEo1wKvhhbnmn52sS0zLYLfRflOu/eU/FxdnA7mYcoYopn;
	25:b2KQUn0araEwd2zXhc/2bHfUqxohvW2kBKo7v2vbxIaXUXMDIBfxEMCTefptgL9m0KV434EUJbRIpdj5QQoNcbuQACXkWQcwq30Ia58oS/VqAQV5y/whI7XDkWJi5wg5dBHTQ5un4a6gMHbxLQPKrze5iaNzfoGvUl3rQ9kxzzlxL2y+C1vGRB4ZemjDrsbg/fTsBbDwwhlnGZIVCbSOVoq93+oNu3osleG0l2D+VOvFqu2wSFHlRO4IhiJg9rmSuyEFZ+TGwD3FUu9t1GFMIzKEhKP3CznmuMOjCOdK+FeG3TGq2dmJj+0iNeLuPMPHF7MDAMY15gc5QS70JY6Tew==;
	31:nO1MCsJcKscWcIkLg2s3t5UYnV9G9uTi6j/NulMA4ccmJIYJfXl3HdOvBZknDTn1vFqVMEdqZ+3HrKpm7o0LHPJ+gJ2KMwxH2T/zgjxM7Q577PBNIJobUYPfi7GqKps7N3zkX7w/oG6ASf1vt8FGDuGVNZtPKO9eFNc89LuUdeg9+8PWIyRhaOuNVZgWLIPc8RR13ikLCPSmO1IX4r7P1m4K/g4datze4RhrijeZ6T8=
X-MS-TrafficTypeDiagnostic: AM5PR10MB0435:
X-Microsoft-Antispam-PRVS: <AM5PR10MB04356408284D932CBB7D34EB8ABE0@AM5PR10MB0435.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231221)(944501327)(52105095)(93006095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(6072148)(201708071742011);
	SRVR:AM5PR10MB0435; BCL:0; PCL:0; RULEID:; SRVR:AM5PR10MB0435; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0435;
	4:65NkLPMSl3GMdc4fG1zcWUXYvf0/6j7caFpW7WQH1Wn7zeVDILocqakH2vwNsjuxx/7UilyxiarHjIhBSj5Jz7gQOzYDbPePQA4yGhjkpHzHm3RMPQiOW687kJOm6XTSLxRaZ/F57dV9/5j8DTQLIuvWALTPJF3vTzcE6pXs1vWgIcenU3iQ1I1ruyYIImxGS+TDTda4dE9geaHQ/jUYgkHf0x028CreWhyaS37V0/fis9sj7+Xf3h9gkrFtu+l29mX5ucQtb4d2bWCjUzysyw==
X-Forefront-PRVS: 0638FD5066
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(346002)(39380400002)(376002)(39850400004)(396003)(366004)(189003)(199004)(377424004)(6486002)(8976002)(23676004)(68736007)(74482002)(52146003)(2486003)(81156014)(81166006)(229853002)(66066001)(52116002)(65806001)(65956001)(47776003)(97736004)(64126003)(105586002)(8676002)(50466002)(2906002)(31686004)(6116002)(186003)(486006)(6246003)(53546011)(2361001)(16526019)(2351001)(6666003)(6916009)(36756003)(58126008)(478600001)(106356001)(72206003)(5660300001)(65826007)(77096007)(26005)(31696002)(16576012)(230700001)(316002)(11346002)(53936002)(76176011)(2616005)(446003)(956004)(305945005)(3846002)(8936002)(25786009)(42882007)(386003)(476003)(7736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR10MB0435; H:[172.16.11.29];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTVQUjEwTUIwNDM1OzIzOk4xTkUxalhrUzNjc0VSUDNrUWJWSkE2N0Fs?=
	=?utf-8?B?YjJSOUJZOWFnYnZUY1hmamhXSkxTWlkwbVhTS2F2NHI4Wmx3KzRtTlJVNlFC?=
	=?utf-8?B?QnRSRllrWnNlOVhmQzBxREFRNCtQUUdqc01CR1FsWDV5ZzFCMU9QTnhNeG9B?=
	=?utf-8?B?NWhHbmRlY2tUZkNCblNUZ0ZpNWtaNnQ4VjZnRks5VjhoMWhSc2g0N0Vpck5m?=
	=?utf-8?B?REhrNnBJektNVjlielhvKzZZRkVZaEczT0RKakdMSmgxd0NzS3dPUTN0aWpy?=
	=?utf-8?B?SnlpbjZjL0RBUzE5TEJDbW5EYVEvenVwVVFtN0x2dHgydjl5MXZKa2VZMm54?=
	=?utf-8?B?dkdOaUxEbC9xRlIxYkdWMVVYYitqZ2wrd2g0U1pGUlBIV2lpS1pBQW5NbDVC?=
	=?utf-8?B?MmFRN1VBSFFXaTgrdFpGWWlGZk94ZmdPNUxpUGcrbC9WRnQzYjhaSC9JWXM3?=
	=?utf-8?B?aDd3OVlEbG1YMjZQVCsyYTFsVTZQZnBodjBCY0FuaW9FYlJKOXRNQ0ZrL1d6?=
	=?utf-8?B?K2YveEE3Ync2SFB0elVYUXZqdDdoUlA0RXZjWW1BVHo5aWlVY2lPNHJFU2Zn?=
	=?utf-8?B?WG5peGZYL0todDlDLzlMc1N5YzE3MjNTMXdHQWsya2ZVVnpNeDhHY3ZOZk1J?=
	=?utf-8?B?L2tUeFU5TndsUVp4dWRKZEF2S2tqVmNWNUNaL3BQbmU0T3VCWENLaENsRHNI?=
	=?utf-8?B?N1lIc0lZa25DcGM5MHZWeUU0Y1Z5QVQxZjRWSWVlWk83WUYvNm11UGVoNmtM?=
	=?utf-8?B?WkhiaHlkd3VpdmJlSFhjNmhzQUZCMmhoV29zT3ZxanMwS1crZFArRWRvK3VL?=
	=?utf-8?B?WXl5dWJQVWxFd1JtZ3dHV0IvTk11b2k3WDZ2dmNmVW85bU14QTF4YmIrY3k0?=
	=?utf-8?B?TnU5ejh2emp2Z3hsaXJpTUVyVWpBampHYmYveFdwSzFTcDNFb2UzemlFa2k4?=
	=?utf-8?B?OFNBUnE3RXVQbHBRUndKN0QzcXJWUUxPNU9nTCszbTV4VUJkK2I5dXVEczJP?=
	=?utf-8?B?L1M0NmhhN2ZIVDlsUGZWUHl4RklPWkN5bDBlbERQN2NNTU42Wmx5ZCsrYkFn?=
	=?utf-8?B?UElZMDkxbW43bXpDbHBIbDh3UEFTVkNzZ3ZwTGFoRWdwOFlmQ3NMNWsvRjBp?=
	=?utf-8?B?bFMzSkpxNDdwQXFaSUFXajdNcWdBdlhIay9oOFZteEtyaTVlQzl1cDV0RTVm?=
	=?utf-8?B?LzIrWFMwREhSWTYvNURUU3dldzg3aTNXQUlZSjdPTGJGVEl5UTFvTE5CU2tS?=
	=?utf-8?B?OUpsR2s4R2VyMUpZSi9uN2lqaUZHcDNLR2lSUHlkZGhXNDJydlhZNG9Hai9E?=
	=?utf-8?B?OGlhTGdxcTl2TDR1ZXBxMkdGTEZMNjlHYWxZTmlaS0M4TXZxV3BrRWVRcmtH?=
	=?utf-8?B?STQzL0hIY3plZHp6TFA4WWxTSkRnUmQ2Z2xlMzNJNG02ak12RnZCWi9STE5I?=
	=?utf-8?B?T29ObkNzZHViU2hrVlc3RmZHSStNY3c5OVRJUnh5QU4ybStoUVZpSDF3WjlE?=
	=?utf-8?B?Z1BieXpkeU5lRE1SdVB2Y3JjRmw5bXp6djExRURHbVYrMVNQN2FnTVFnQUQ1?=
	=?utf-8?B?TndkRGZ4TmFNZ3FtcXFtNVRMMlVMUi9kOUJBTElDbDdzVFp3MDgzemdlaFlV?=
	=?utf-8?B?VmhYS0JtN0gxWEFJSWF3OEcxMlFrUEdOTWpLUzZsSkM4MWRHMmVsS3JRbFNZ?=
	=?utf-8?B?bUZjOTViVXZiT01oU1E1dHhUVUo5dVFXeUwyNGtncXdmU0YzM0NvYmt5Nnlm?=
	=?utf-8?B?UXBMcnNGQ2RZZXRkVk5FQ0Y0NENLRGFkdUh4YzdGSkxMbDFNczNFeXNSY1Vz?=
	=?utf-8?B?U3UzTURuWnprWXlrWE5BMitRc3N0K2RXYW1ubzU3WncyWDVaNmxyNzVyVGN2?=
	=?utf-8?B?dGRuSU9vMGF5d1JFL2JUd2E2TTZ6R2ZtR2g3Rm5UY1VOSHBsZ2ppYXF1bzBr?=
	=?utf-8?B?bzNRQXN1QkFRM2hRMFZvSCtobEplVDdCZHAzdXg3d2dPVWd4b2RYc0JiRmMv?=
	=?utf-8?B?MnlKZXNiRFdLK0FVdFhIcmx2ME90OElnOFcwVmZtYXNyWnNSYVJ5c2V4UzZU?=
	=?utf-8?Q?l7CHUE4H03qQb0q+hJ2Oso750?=
X-Microsoft-Antispam-Message-Info: j2nZUIcEGZ3Q12RR49Pmkr9qFYMkbIE010Q8ehYzkEoCVtq8hY8OOZUPSRFjqASqhMBDJfbFE/BSDxCh9ChwgTO/Rpu0mQwcFIi/pbSDw/DGBaFMcehGmJw4qhDYp6SwCxfYX9mju4oivj+lles8hvENEW4EO9wmhcc44Vs2XwNngITQlROXrvEymIY49IRt
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0435;
	6:iNalnkFKko3ddN4qU0DXzF2E2dHwab1ug07S3B0CEdwohaaLDtfA36Rq4p1ZvO+52O22hR22/yF/r6s0dcm16aWrK8Ut2QspFMmvM10ccXQUIyHO0l5ETWuOK9Zp9sVO+Qar8yjgzYtCEo1YwMLSOfkk3atbiAzxNb8639gsQ4ceMk+WIJfe8KI3YOh9t/E7aTAi6Y2JFXaX4mN5PJwjtdjPhdKPMD7tJe2gvhFjVfQNKzigqsANM6tv3lBIb9ltTvnVGpa+cx2wRdFzASOntPrCrUjhYSvFfekv+PEfsUnH1Wy19ctW/tH3d/VmwfXwgZCJYZuzWrg4maQSFGLDJ/lor6y/cj1lSlbYaZ2pFIglE/kG/fCCigCOhZbZcQKnkvvRzBjepxNhop7WzwIbSbUhurYwnzhLkA4rXc9qyIgS6YQSqnt+ch3oQ0OOCV9uscTQiEnTHqDQOJ9sb/C0nw==;
	5:J8yzTvazwca3vWyFm9zAAin2ILNs2M2tL9I/7s3KdZl0DnLLWuSj02UC/Cc5aRMl5yFcqNm8VmANnEk9oUdie4wHNQ70UXFiWu6eh+XxI6zrZkZ/BGNPzoG1IUaJhZAKutHn19LfHtf3/AFa+YQPFYZs4mMikLHGD6j3iyNKsb8=;
	24:mWRr4x4d/J8ikdIfgJbHpssIFngO8AaZnVS3YFheypAYeQTHRvY5wqivI9dF2Yfnq8i7/C17yVEnNIs/a+foMC9/9KvuFkDH3cBDKchoT9w=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0435;
	7:AlITvAUGYXCN0Sp3qZhySe+H+6FKyjEt+hs7w0w5Z2OMXQZad8m3LHHTUk8RFArunH/WpZUf0yK1EaIIOIOycgflBbaCTFQKCasqebRT8n1rklGF4lVa66qgdwY/x+eLQqWuzpil+4SGRlypmD7aDRqdJoa7GLYAXWiarBgoEJ+dc9K1YyOWO5E81ZQxxr2G4mst+eYbltIWcQs7w4HtaUwmcYKCXTRItBsHggHF0Uz6FdDNRTre2qfaWs+Ktb/A
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2018 12:11:50.9427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3283349a-4fac-4422-619a-08d59edc3dee
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB0435
Subject: Re: [PATCH] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Tue, 10 Apr 2018 12:27:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-03-22 14:44, Rasmus Villemoes wrote:
> image_types_wic.bbclass has a mechanism for doing variable substitution
> on .wks files by simply letting the input file be called
> .wks.in. However, that doesn't allow using variables in files included
> via the include directive.
> 
> This adds (somewhat naive) support for variable substitution in all
> files parsed by wic. The user should add all required variables to
> WICVARS to get them exported appropriately.

ping.

