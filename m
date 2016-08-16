Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0040.outbound.protection.outlook.com [104.47.36.40])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1BA70018
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 21:31:46 +0000 (UTC)
Received: from SN1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(10.152.72.53) by SN1NAM02HT111.eop-nam02.prod.protection.outlook.com
	(10.152.73.52) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.567.7;
	Tue, 16 Aug 2016 21:31:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; ossystems.com.br;
	dkim=none (message not signed)
	header.d=none;ossystems.com.br; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT004.mail.protection.outlook.com (10.152.72.175) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.567.7
	via Frontend Transport; Tue, 16 Aug 2016 21:31:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36408
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZlxa-0001J6-4G; Tue, 16 Aug 2016 14:31:46 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZlxY-0000Hn-K9; Tue, 16 Aug 2016 14:31:45 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7GLVhsr016887; Tue, 16 Aug 2016 14:31:44 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZlxX-0000HY-PK; Tue, 16 Aug 2016 14:31:43 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAP9ODKrzOHomALoD28h7nJ6xT5puNkrzbd1FZVr=xij_wYUsxg@mail.gmail.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <00da7e65-bfa1-0ffc-a2bb-1b44e0978864@xilinx.com>
Date: Tue, 16 Aug 2016 14:28:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrzOHomALoD28h7nJ6xT5puNkrzbd1FZVr=xij_wYUsxg@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22516.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(377454003)(24454002)(199003)(106466001)(19580395003)(31686004)(33646002)(4326007)(63266004)(86362001)(92566002)(76176999)(87936001)(2906002)(19580405001)(31696002)(7846002)(305945005)(356003)(54356999)(50986999)(230783001)(50466002)(586003)(4001350100001)(64126003)(110136002)(83506001)(36756003)(230700001)(77096005)(626004)(8676002)(65806001)(23676002)(8936002)(65956001)(2950100001)(9786002)(81156014)(81166006)(47776003)(189998001)(65826006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT111; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT004;
	1:6Mj9fYn+fyyjZFGW6NxtvW+Toi6izMEkPLPePT3/57Na4EvciOxvCo+eOMVIkDx+SfAv/edHxWgWGifyUPkIpRV1O+NUYUT+GKUZpJ/iDPNkrX8c7SBAm2uu+/VF/5Z1OYczmcOlbWlpXkg9LevHriqxsmOsy56kIgM7MVRlhOs1Y2cdiF3EOLpBPVyrdTxUbQnt8coKf1N+DTYvgbfZsIkKMR3Z/7pml8ClIAJu1Gxgx/wnmvqoOvmcxcmASIVqaiigMBku9CChingx7uyzqr2CqkZsVXHYhndF77N2/vnn29VW3uywFOmCDFWgnqiYSFCcTAMhUsU1pT53SQs19dTkXyhn8TpCXU0mzH3EKfkdYeZHpxEZTIVk1ZuqjsyDd0Fim9g35QzdVv53lmq0CR/+1dgUGxezwjSvYmarxm3QMMu98tH9D8ZHipE4NBo360IjoTQ/630MGUrdxr88tcBoVp+hDuxjo8ulZwyD9jkWneGBxiw+5RLIWVbUSZS46IHb4PJAeJBcKwrZvZFkOnTgJ2sIs+AzMJ8w1Hg5iDQO5rEWxVEtHi6deMLxix6e
X-MS-Office365-Filtering-Correlation-Id: 2f155613-1bc6-4034-a72b-08d3c61cb958
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT111;
	2:0F6l+ySC9uldvks2j+g8uxuk696DnZU23pPMNcYPwbVYZEsMZSBYThHfHKZr4Qxx+/wgQZJ4YWBXnc4bTPJ/eJLUUuQoe/o5O4GiEvxw0m4aYvV4q3go4tzexJP3fb+rcax/O2ofUmgzxcq1Wp8ZoklcQVOgSiEILN7wHcrdwQUBkKaoYxo1Hju8WFDsyTfN;
	3:xYF9xzNeUVn3G+3/SoiTmqQ7IM2VXbUsZmrsMEMQJFKwQouO8Y/OBy5orNYla4K2BD80OqFm8SwxZZ0UFaMo5ZP0a8zEtlrJFAchvXbljBCOEeG30aLSwnTL5TZxw6AIM9ZSNgx2Y4f+N8JU9X69awBwZf8RWKeUrXVkSBnvCLrEYRHqYj9HyC4Zt6mVCfnJHQqKRyH8KqaHgs+LJByeY0/hQzThwTj6HMkGtZB4QyRv7j0y8dDo5mW0DBzsmaUgqDAFh0OwdZd7WmPj/+VzLw==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1NAM02HT111; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT111;
	25:Oqv0HTNSNl1wL38Pze0iO8cw+/TctDYtWQ973KB64L+P0XZTBnjRt2q8REZCiQ1fC3YCI7G9e7SPdKFSQO7Y20AjqnxclQ7TeYf2BXIZ0QbeZ6pSsdDo8pGkoaLGG1U75DsoQARQ7PqzfijjQbyRIuxaHLA/gGVMXv5VM8n+K+MMP1ptpaDvX+k9Py+mvU4EPbAB0/JxmTREiZkIfFyDWdaUDmwCNF7jR9Q/6hYgm0V7OyqQZOKoHDx14UHzJDrWir1g7gwR/eo636zkK+VCoJg1DbE46o5Vx5YN+hp2KQ7ReV84KoNRILmX5Ispx1sEGil6vlvEXojWSelNtC4X1yrbh4xbPVAyXhGXCRZU7KOsqp2NiF6UHC6nS8ySnt8AM+KWBa12MLyRXpTClDphzA3VMqwXRj6FjPVyWGHUZpi+KurrzTlYXD0ihO2QMv+dJ84kJAOKNOSmhxqXSI4Y3sXPn82OZ1DwG4bM4NVwrISFNerAPfBvAHav8BCOYRKm0ak82mvsvHcOj634Vox1tphdsYIVXZtrYuij3gvXQRtcpG0wDosOap7dHZDfDN6TQ2LnfF2QuNq0Tid7eXx2JYtBgokEuBmoJoYtDin51eWdph8oiBb+tGS5MUtgCFZ2edO2jbcOopZRxavnZxgV4bXv6XHc2YmNc/dxAWMZNxr2D3FtO4OhLh4uTST4k/ihHEQfUYhTJvGl6WGfrQWaVXi+RzKhCm5zqhX0sp+An5RISfE6KvxlMytty2jYJO2iK8aC27i/DnZtmY7ccJYtmg==
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT111;
	31:BEwfumXBPhl9fftHRivpRGV8TwXYpPJ8vHzUbvBbqFJFQO4l1FKlEIMJ3M2Z4+WOmuQRJCpk2Kpw1rVzqrVW3ixWAgQZe7e30c3j87FFJRPrjyCcErFQ0ZafncqaPaJKBECmaWBtwaCw+DnD57qbCZ3T59ahdqfDzx7R36QD6fVK5DvHOjPPUWj6ZDNpeP8dQ1PB/C1As/l4pSfO5dWRToJr5TUmsIz56CaLgx+cnzQ=;
	20:5noClh0hxwo7basNxyBO23dz9KQmWDNCRQZE2CPQhmGTynC0PFuFFrbPHwF3WLYRMm4hGa0HF0hIlFLI0RhI7cMfcLAqJbwbc/ahueQRpi0zSFFeWRvCNisXNY4kEnksfpAdialFW5kTZK9O306lhI/C22Bau42W0sLNa8fbZR9QbsWHAYRQYtAoEUYphRf5DGo9eK0fo/tlPaEhrovu0i3Sy4PKZl6z7YKnsRiK2ePIYeFSWlb7RpvhY6+drarwZeVeaYgdUlousa02p76UGmkYsclIY4w9RPHLEwtCvc7kjDu4JnXQik9SQceDsWsb3aka0hZN6wDw0O6DpflvUyzrKYNuOyNiLIhIFmSvBVcEMaZK4q81lX3fphMwdGDs91IlGhR7iMPA2HODT4/NwEeBASdg5BkKzma7/MrCDebF1NZCZa/NcoHIdKTK8SWTT/GZ760LTPsOswTOg/EwMPxuB+EvUd+bpw6+4vwRE5kaOAPyzdG2GwVeRQG/QvFo
X-Microsoft-Antispam-PRVS: <74cd8b67e69c4e4e8cfa6fd5a0e9019e@SN1NAM02HT111.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(13015025)(13018025)(5005006)(13023025)(8121501046)(13024025)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT111; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT111; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT111;
	4:AJk0S9bUYwy5YxNN4yLSboX5QGV/4c6MdvNcl444LdtoesNdUdfqqq71Abj5VqZOrflt56iJXiJhFajONcY2BUuoLJDCOmakRRwAqFUH1v9yYx1lo+vDZCkWYM6MMS4nMU8XCh9BWDd/Sg7mGy8YahlFPwiH4j+eBzK/HorTYna96R4m0wzGuAFqiBLOsCZJV79KJKNUUVe3T+LbUR2kbzGX959axGTegMWiNZLVsEJstV463osBD+eoUWB0TjWlqe70y5rxhiGtrbnLFMD8Yl5bnP+IJK4uf9M6Kp0lAVcQMDixsHkBjvCBjNeG26KG0Qm77A4/nDCFxOucG7b6CDmv9yLPl0LUHZg5nMHsGFfPVTAzXyzb7ekQSUFT7eiiKb4d3I0+2fr+bzk8JuAwnYI76QqaXeD+ER2l8uZgtw282m3eEwo/1hc98MSVAuVZaDFdSpceABK6odZQZmpuNp0CS6xYf51bI/8tAg4ZIRMyeGchuehYphMWHaLooAv0ViXV0dkwAxWJ8d+o4TgwaaT3xE+0XVQidUO5i3+34zI=
X-Forefront-PRVS: 0036736630
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjFOQU0wMkhUMTExOzIzOnhRN040SzZOR3dmVmhpZjFVN3krV0xGQitE?=
	=?utf-8?B?M3VpWXJnemp5RWJCOVd5bnNibThDVWFENUppZTl4YnJ4YjVlU0hZeTkxTHZ6?=
	=?utf-8?B?R2p2VW9heURaK3VwTVQrK0IxU3hEZy9ZMVNFNW9jdE5KVEM1YTlUS1BUT1lZ?=
	=?utf-8?B?c3RMRWRWL2dNMWRFRjFJcjk3VURDMitkV0l1UUt0R1pMcUh6dE5FVndzY2ZB?=
	=?utf-8?B?YUZOeFFJOTFsZVp4SndyNzZyQ1RKMXFGMFAwN0ZqL3czekZFQm5VZVFielcv?=
	=?utf-8?B?SmhuR3FKTUlIWU50S0JTdXZXQjJDY0xWaVczV1Z4WGxaaENsWGNsM2k0U2tO?=
	=?utf-8?B?d1dYM2d0YXNNRityZ0lqMGZBclcrNUtjdTBBcHZ2WWdYdjRZdU9EK0tkZVlP?=
	=?utf-8?B?QmJvaXZmTHk0QnZic2lqQ3dua000MUgxWGpTT1JnZzhuL3N2a0ljRTUzVmFy?=
	=?utf-8?B?OU92MVlDZzlKMWhkNWpHRVJuT0lGUWliZVAxdjJQbGk0K1NJc3JyUkJ0RTBl?=
	=?utf-8?B?TU9lSFliR050c1c4VE5KT0dnYVVSMFFEUDZxZGpOWXVJT2tVRTBqQWxCWHh3?=
	=?utf-8?B?eU5PaSswaE91MEdDL3hDaTRYNjRPWnNHYTgzT3hwVWc2Mkd4bHVKd0huOGgz?=
	=?utf-8?B?dXAxVnNGODZaZmhZYXFnSVRGRXBZaXY1cm5pQVpjUXVFMHdIUm0rek8rZjhO?=
	=?utf-8?B?Yk1vZjRXUFluQmF1VzBJalhsM1UvVUd3eFRkbUJEdEZFZ3IrNTk2eDM3TVdn?=
	=?utf-8?B?VGhLbFk5QmFDOFl6VTBVUEkyNE11MmxLc3E2aUlucG9NdmNIMHQ4cVhIVjBw?=
	=?utf-8?B?S1N3L3RzaTFjVk1JR3NzQ3dabXQvd1pXV3VNWndEWUk2TGlHdDNRNFE3eHlW?=
	=?utf-8?B?ZDRRWW93bHdQMDBoNUJTMjFIanBlbUxSUFV4NE8vejZjUnBKUDZlSkRwL1ZT?=
	=?utf-8?B?U283dUhaaERiVTdGQlNNTzV0NmZWUElLdGErZTEyeExGbklxZ2VIamFSWndR?=
	=?utf-8?B?Rjhob2FOYTNOVUhCS3N2d1RnTWJmZkt1MmkwZy8vTGlmcjM5UWUrSXAzM2E5?=
	=?utf-8?B?anZrK2Y5a1c5ZnVpejZFa0hTNDhPNVViZzVDOUFqZExkS1JWNkUwRy94UXNx?=
	=?utf-8?B?QUV4cWEwcEZnK0pzd3J2RDI0Qjh2NnVhQzMzaFNhUzNXL1R4MFc3NC8rMDJH?=
	=?utf-8?B?cUFpRlFOekNlQzJjQ1FCbUhldVVIbERKTEpvNnBqSjdvakszRS9xU3B5Qkpk?=
	=?utf-8?B?YlhVMUFhR1RuejVBMGtISlVYNk41VXBERzAxenQxbE5KeC8yWFFWRlI4Mjlu?=
	=?utf-8?B?N3ZxSmlta1VrbFE5RDJvQlBFUVBNbTZvUFM2dG1yUGpCOUIzaERTTW5yZXFZ?=
	=?utf-8?B?UnkxU3pCSEw5SjByeHpJVGpjU3NEQm9zd3htZ1dFWG1qY1c4SU55NnVEQlZu?=
	=?utf-8?B?djVTTUE4UE53KzlScTA5NzRuWXZKNXQ4RGFPUFVmWGZraytIOUxRTlBCaWxt?=
	=?utf-8?B?SjIwWXE3ZjQvc3l5cFFzWUVXaFZQd0hvU1BNSGs5NXAzZGhSVHg0Qk9TNVVv?=
	=?utf-8?B?OEZsWUgySkNSWUhOQk5qNWllM2RoNzcyVXBsTzRsRXZ4Q0xkTlNKK2Y4K2xj?=
	=?utf-8?B?Mk9nUTd0MEpRcDcvd09DTkFXL3NHU3N1YmJveVR2eUFCZXVOQnVXUmdFczYr?=
	=?utf-8?Q?fXC8iD7sxS402ugACItZADUbO94/zCAciqFZPfR?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT111;
	6:On5W63OTeTYqdtsaDL5Jd1WNHMJzbmUYHwiHzQ55mO1rVztV0a0tEWXuotej2eYOKhFnrE1LU/1B8OS6HaHwJdJDf+67nFZPpfuC0riz0dPSFJ6VztvkidXK+Nc5Ss8XQH/1fZyueA5KLzHwc7C8hQ9p923FMmuuQRfEldajJk51ieznS9LrgAEAgjiWhGU3UiJlc0kNBR5+tqHu0FhL1GeAD2E6wMNUBwBkdV6qLxc/hKdTqU48u1g/ytnRionMNDdJWdqa5wp3NOmjKaQesrhCu9w2XIf3erJmaDeVqWwOCinUtmE0mWEzZrPLgBHuHSO8spCT56DYSRax4kbXvQ==;
	5:SKeofazkZH6mP9YPOxyQoUKze7bnpRABiu1JKo87PoyOnjMreqsnx+oy0yBzZuSxn4An1EmBimhT0hqDG8rNJnOO736RlaFEFRJ8fNfbI3xsyhRDZ9AOaRuwwtE1SIY/9UPkejHX/v12hG5Xzm/VYw==;
	24:YVxHNUUzfIbyystFbg8G08vWhfsgV5XXVr/DsWrwqcFkPyUhSLjIz1uCS0uoTnfdzTbJLNiSTYS9kOJJUX839W5DTzvg7QVSwD3HqfPz5Jw=;
	7:Cp+Vc9TLaEIx2SbKP67P8XLIvNFyu4q/39sCAJDoQ5qY0YJ8umFrlGZX5jqCgpr9Rf8E9NHDC5e79kO/PNo3O5I8gT12puRAvTVGF13maYn35HqnRA5l3amV3C6JVE4WOfLZwBURA3GTnaIdR5cjf9+8KrbvPZZrGWB24Omm5LwCspyvmsiwFWgIosT9vn5AWpjHOsbCpbMqfHKdUQ5NvZUjOThcTYgp9ELb5wiOW/tAuE4H+bgYsy7xAvZUHvhk
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2016 21:31:45.8475 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT111
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Enable out-of-tree builds
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
X-List-Received-Date: Tue, 16 Aug 2016 21:31:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Otavio,

On 08/16/2016 05:48 AM, Otavio Salvador wrote:
> On Tue, Aug 9, 2016 at 2:15 PM, Manjukumar Matha
> <manjukumar.harthikote-matha@xilinx.com> wrote:
>> This patch enabled out-of-tree builds for u-boot. This also helps building
>> u-boot using EXTERNALSRC flow
>>
>> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
>
> It seems to have mixed changes; why you are changing the install behavior?
>
Previously all the build fragments were available at ${S}. With this 
patch the build fragments are now at ${B}. So changing do_install to get 
the fetch the build fragments from ${B}

Thanks
Manju

