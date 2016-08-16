Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0088.outbound.protection.outlook.com
	[104.47.37.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0B170018
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 21:33:26 +0000 (UTC)
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
	(10.152.74.51) by CY1NAM02HT158.eop-nam02.prod.protection.outlook.com
	(10.152.74.166) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.567.7;
	Tue, 16 Aug 2016 21:33:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.577.8
	via Frontend Transport; Tue, 16 Aug 2016 21:33:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39440
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZlz2-0001M1-EM; Tue, 16 Aug 2016 14:33:16 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZlz1-0000vL-Dk; Tue, 16 Aug 2016 14:33:15 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7GLXEXx005370; Tue, 16 Aug 2016 14:33:14 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bZlz0-0000vF-Oh; Tue, 16 Aug 2016 14:33:14 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<edcd29bb-7b7f-f8e1-88ae-ae33bc1413c0@xilinx.com>
	<CAJTo0LafPs_QCN6BjzM7Sskb9v9MXW1g21Y__BTuVJT6Fcgmig@mail.gmail.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <b93ae966-e0d9-f94f-4d2d-4256d9296983@xilinx.com>
Date: Tue, 16 Aug 2016 14:30:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LafPs_QCN6BjzM7Sskb9v9MXW1g21Y__BTuVJT6Fcgmig@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22516.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(3190300001)(199003)(24454002)(377454003)(189002)(11100500001)(586003)(8936002)(50466002)(31686004)(64126003)(63266004)(9786002)(626004)(36756003)(356003)(110136002)(86362001)(8676002)(4001350100001)(189998001)(33646002)(7846002)(2906002)(106466001)(81156014)(305945005)(2950100001)(230700001)(4326007)(81166006)(87936001)(230783001)(23676002)(77096005)(65806001)(47776003)(31696002)(19580395003)(83506001)(92566002)(65956001)(54356999)(76176999)(19580405001)(50986999)(65826006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT158; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT014;
	1:4WUgYpTTn4lcs4Sad6v6sRwAV1lhh0LpIKck8K7PNRLAETYu19oAVTl8WbyGAtSCBLNjDML8QBaN8mGclg2PQJAyVhhFjHyE9jIGHVl/Ddtic+vqnTRTFrmng6uACcDpVfXHlXHDbldhLepbpyBykcWcPhbGqXAlyGVex3kLw7WBBzER33O6E7i6TIWON71gTsw+FBamyURigZzfdBGzemXoFHmXyPoUjKpkvZFGbuyTqMOMKrVLX06h6OVgDc89BgdiF9K+V8bgAy4TdB7I0zVXnoK4bVU3Lxog0Vm/lNDiE6YoRAKrr8O7BLKMp8KhKqZCja032KBVCxUGdv7dM9PK5Nm5VhfZqQ9kvHWZGNbGnEKmPlg96aRYRTKgFkEYpLCuCpY+gc5W4E7dHDl10dqNPZKayhduSAp6N5RAu80LoWOH/RpODziEnyObKdsWOSvHcYwyAMbg94SmimrEknEkCl86QOVN+IQcYffehXT9p/poweAuytfZW0R1IRaeijX/PBhP5ak6lgigmQujDV1rFBkc8FWU8IHVyBtnHr1QoEjiIOjr6r1FPBsjFPnR2N2odRya9bN1jwNJY4bykmLlAJs7l3Qb1O3XpLqr+tIyuZkSneK8lNf8re98E6bE
X-MS-Office365-Filtering-Correlation-Id: 5fe5ba4b-4cb7-49d0-938b-08d3c61cef3b
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT158;
	2:zxSDAEAEi6Oodr0BwMxV+P1bf7y4WE13wsUs8E2obU9gCTEww5+uG5rUm6fx7V5qwH/s9abtOkljB/4K4tY2+rhjpBZU4nC+C/qVnWUNfiUX5KubIq3kl5g/kHYTmldd/gW3rx1fu8igcPRBHvKgjfVHaW0Wiwyt9N10kcJHmZfy+H2enajOv5BrSJ8uzBDD;
	3:LB9EhUY8l13ztXv1eJ+bwbxOcLGeU57RfsEKkhbr9PMKlUHY89agXRFiPc4EKT4ciqLxKrEGJclzKX6yd2Abkfnlt6zeHtCG+Ij3MzS4lN9U5dZVr/PV43ZtD1yzpUw7W6sE7c/PM2kKcoD8/5KCSIKEZxO6C9xPCMgxzAprN0DAxSLjBJImkkACpl4XfmStUH2vCop6lE/GSSy8XMUKwIlipyJEXDhXs9T/L2Lo4sOSUfvVcw/GrbZeRxiM2qNQR9FcljyxOTDLIy/caqByNw==;
	25:9EkTD5r8quhP3mzh4ZkOwdSKdwrLHwT5wbPyz2ijnkE1N07yW33aJe29CWOCtvGwgFICJhiQqBjG6/QsfqWuhZh3FGN1Jxw0yX0rRanyBMG4/F0Mr3wi1hl3sIlydtYypxDnLGHV5Bm9oE5VkLdVJ0l1CbaUaR3nBteJVCYoXQAV0fsOIoPxvpxGJ2bu8ILzDxBhBrMewK9kTMV0LNJ1j/9Cbm/ya6pps861GXFvciS9RueD3+9DsTSMqEnePiaR635NxLV60yBrcTuCxVlKrHnbOWO7yVer1RcqFVf9NGBycbS0Mc635pyVZwuMJEvqnnolDw2th7O+6GjMNYAu7lCe2m43l/bZcuWwj1jHQNEGa3shUiud0I0f8Aoohgnm5xCdXG9R3W3kSu18MtkPhXqiPGvKBgWhb//EvyVygnE=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CY1NAM02HT158; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT158;
	31:JNNrOrjI4Twae7vmnpZJKwDLQLDGgZ/bSmu4GDO9Cl4C15qbnx0kjSa/+i5IgE/QbL5Va3h4O1qtNIHm/ETYFrleJCh1VGAu6VO37prD+nHdIJp4nEuC2OUx/ZWzm0r4P7BkoXaGZ7UaabhkOmPv1k5l4Zz4TLILK7SZ6fKai6Axv8CwP+UL3s0NRDQrULM+fRM+mK/+YST9BFdL1BQle5QhUr6wR56VWk1a1SbeQYY=;
	20:c1GsP6KQwE2dcFMqBkZc/qKEyguyl9IrKq4qUP3a1OBvCSiS3rT6o8aUHUIznZtkw3fzhQ0XFDjMSbn0sw3+Z+fTKHreiPXIWa8lfTyFzwj6rZ4OWPdP6FlYkHD1NxIhvJAHU81Yw3Cv/IenZPsWVoHMlUMynB0VgAOivDDStTFqw2RvURoMQ+1mDi4jCzlwVBmGig1xszjsaB4VFXMgOV0EUgB36I1jXX94x2qCnMs0t1XZkymiyPmBJkexJqm9i7FKRHhqbr9FRX0UTF5sRY3QJO4NAxJPozytQBPr9sQURZi5TceZrcP4aDgZ6x5jVp50wOKDj3rRyH3nMYDlE8pLrrGuU/p5S58FDszGzHuiCxSmk9MWCJGl01LI9IXDd9C7YMYvcByAbfEyD94IBicymRQjJllZvbZ6RPpvQN4Wsnfc5WEAmYXQGViK+gYJi1UYFHPAlJqyzqGBk0JTBrcshDctsuifE1PBS6LN+m6V88JU8D95XoX1r0sInFEB
X-Microsoft-Antispam-PRVS: <8ff9276f74f2450684e9a23083d12ee5@CY1NAM02HT158.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13024025)(13023025)(13018025)(13017025)(13015025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT158; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT158; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT158;
	4:aum5aAC1UNte/4L/dGtyvMFbhuFzLr9YM3Rq7gEe2MWZq0LtmW+884/A6/1SYg+WPsUxMDi8diYjdm2P4xMQwPoyHn4qJAGk9+Si3UrknJBqEkKDugPlNaG3lptWcFvEQ1yBatWE8LdTyEdV2HxKe33X/7Rw5TVCym4KpoTh9DYMH4iQ0I/onCLpSuGTY00K6MJJvHdXS7wCChKM5IccoixPsZqwjYdtUjCDMJ4Y1bm5rrO+Z2YM9IpDJGLvnmGUFQSVwB7QBeMov7I+Wo/AXcSipKJ71v19+Lbn1RbQt+5UptGsc8lLF18OIvEmdMHzFszzLBTVONFyBgGXCE9I+u+pWSZddL4gjgZpqgLcocVBRBjZiwuXdeFiWrXE9j/RKpjR53wzIA/5dfva4zFAnK/x0DJ9WTtArVGDjkjHf+E7PJ5sfpHI6QvOWqfLO3FeZLPjYNDR9TGDwVupd21UCciA8UJAlKkEx6D3JPdVkeEvC3DY4YGeAmZcviRxJYovq/Rd/nVcs+VssKpPPsAhu1XCAkQiCHb72/I5RFYml3A=
X-Forefront-PRVS: 0036736630
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFOQU0wMkhUMTU4OzIzOlFLZXlYb0paSE1VOVpZYjNEVVVNeXFpSW9K?=
	=?utf-8?B?d2QwR2FoanhlSWM2T0VSMG02ZDdORW5TN0pMOXNnaUwxdURBZXB3S1B4dWZx?=
	=?utf-8?B?YWF1eElmYm1hTndCZjZHUWY5YUxtalMyR0YyY1NaVFFoSitOTnhML0FXU0Nr?=
	=?utf-8?B?NUMxd2dSRlU0WHdGRzNva0lRMWl3SXBLM2h1elZzVTNVWE5LWEoybi9GK3hm?=
	=?utf-8?B?VGw3dkp1bEFmOXRuRXc5RlZ5NlFUMUhaRnEzZThLV2N5U1lDWjJucmRLTDBV?=
	=?utf-8?B?K3lDZVRIbWplalo5UndLNk0wYnlwZkd2WEE5TXdWT3JZckdJazE1VDFzUDRR?=
	=?utf-8?B?aENNbU8vVVFVQmltRTF6SlJGV0liRkx1YXpaMDhvWjd4eElTZWJkMkVGb0kz?=
	=?utf-8?B?REtFN2tmUHdBMUtMNEUrSlVKSVZ6ckYyR28xc0VOeFQ4WExpOTZRUlFSdTBZ?=
	=?utf-8?B?MlFzengxVnAzR0pMblR5d2pBM0draVIwb3AwZXpRT2p2OW1nUnV6eDF3NjJa?=
	=?utf-8?B?dk1SMUZWanVubDV0WnZhOFd5b0gxZitIMGh5NDFjK2lrc0hIUVhWQlY0M0Jq?=
	=?utf-8?B?M0pjT3ZHdkhRMHhIYjdNQUpIQ1Q2M0s3R0pmMHZxUUx2ajRVelhaRWV0bTdm?=
	=?utf-8?B?eTd2UDNmZE5vZ0lvc0szZUV0cjBPdlBIbUsvZzdQU3lLZXFXeXZtQ21CUWlV?=
	=?utf-8?B?SGhPVVdOazJuVEZoNGN2bWRSTlRjZWF0eEpiU0lwNUE4UUpBZ0JrSVM1cjFq?=
	=?utf-8?B?TWtnQ1BZbkNsNUFKY3E1VC9iR1NMMytiaXhYVEtKZ3JUSXRBbE9wRFVxbjFS?=
	=?utf-8?B?UndsZngvWk8zYy9HN3g4UUNvRzRKd2p2YklNU1I0a2VkbXZsT29kc0F5eklw?=
	=?utf-8?B?cXl0WXZRQ1NpNkhtNmYxWE05ektUb3dPNEtMUVFDcDFDRkgwS1QxSGtUOXo0?=
	=?utf-8?B?TXdZQnVzdmNqd3lmdWs3cHpoNFdSNkNpYnpDRGJMZEQ1bWYxcDRTSi9JdnZm?=
	=?utf-8?B?MFRvbWNUTU5oeU9lcUllREx4Qm8zaERENit3ZnZUZmdtUk01TGs0bkRiRERs?=
	=?utf-8?B?bzN1dzAxWXNwOHpGamszWnRwVzFUWnMyMXQ3bFArZjhXSVhXNDB0R045dWhE?=
	=?utf-8?B?a0FjdHV1OGRzVGZVa0h5eVp4cDQ1cDJ4QmhXcmliU05qSWtEb0JpSnh4MUtM?=
	=?utf-8?B?SzRwWVNiOW5qZEtUeXVxOSszRGorOHBKVEQ3UGVKbk5Sd2NNdE9QL29tZ0JV?=
	=?utf-8?B?Y3V0ald2cUsxSFVOUTh1SEJLT0RhTUVEN3Y4dTRkam5jbWhaNFZkUUI5OVU0?=
	=?utf-8?B?NTZTRFBGZG1PbzBpNEduYktLbFY4U0VzSERaZDExTS9sWjIzTnFLbmozRWRJ?=
	=?utf-8?B?Q2ovUGliMGdzWk9EQ1htVERud3RKdEZubkVnMjYzNGZJblZYM0N1c3JTZVZT?=
	=?utf-8?B?UVk5REFYdVltcTdTNGh6cmtsTUg3Wm9KbEp2NjBpekdKZzlUS2NUb0FsVUU2?=
	=?utf-8?B?MzZnNWVzbkEwQnJNQXFzT2pNRXlRZXVOM1gvUjBwNDdtcDZKRFZ2WEZMYXJl?=
	=?utf-8?B?U1VjTUh5Z3psdmtrcTc4aHBvSmF0VXNwMGhjRGI5dGN0blU4ODlBR055WTVS?=
	=?utf-8?B?Mno5NngyMkZweEFGTTBzVzJlRUxiWFVxcG94MzBWVVJvbDFpbzdaME81K0t6?=
	=?utf-8?B?K2tPMVFoRVBHeWhMenQ2OGJteHZKbHJ5R2NYVWc4NnVrd1MvZFU2YVBmVEFu?=
	=?utf-8?Q?mZNvzHffYjnxFeReJqjHX6ZW4FImdY/JXzbks=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT158;
	6:uFUWjaLXL90qkRKekl9vCPInpNcfVWs7j1qmM4NMFD+CsLg4Hm9S8V0VeHIoAv0TNTxvCMqlnzHoezJ0P61EwVOXIk+QLmEY2OgAYbeJMpRUQw81aSqy3rlwM/R3scYyNk2/qu6n1l5yUlQqIziZuFreF1yWTUmK5c28wZ1AAUxK5y97+BbyIkb13miRBiIGEeGIMj+zbg9THcrvGwLQcVZPT/rGMQgyw/ZP4kuu9iVzQH87SPNSZP1sOpmNROU7g/FsvoozrCNfIA6KiiP20Lzqtb6mqp1YgtayCh2A5MG83HXP3RMnHntIacasMHLocflaM7TsUOL57TMYCuEWbw==;
	5:mUNoA/5sqwtunlXHcIZ/BKsWjp9qKbt/Cdl117dRGfQj4N/VdXYoKvH1OQZtl3dyq9LBBmdoy7vs4dUGfpye1ULpmmYhUBUenl8vWC7qVp3IztXo4d5tG0FTlMGA4JLcezj5RaGUyWVXHff3g3aJmg==;
	24:82JB1zMP9HUTSw4c1FsAa5uBeoFsfHl1x9H3eVtNiR6LZ38ar9DUZZruzAT7pNFKXykHUuSzRyc4WmhyqIHQQVGNk0u0f95MW3JGevti1bs=;
	7:iqHMxh4+ihqjgWyPfcfriuiFaogPezeifhpkAq748YMAW+hNRBVTnpKpiyqPam9PeZ5iZYge+F1SRdp8i0vwdPGfMxl/xPpYVzXcqmzPq8cjExMLdNJnel37ML9DF2HYP+dyM99jo3+/1DgrvJ+a1I9qMDSPj1aykr5KhuRUT4bao/QKHZPhoe7yznhxxQeoIAULM6C3S7Y7a5Lwvww3Vs50oeoM2LeI7BAkVSFVK5c4D3I0ydb07gVmdxIaxRgK
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2016 21:33:16.2383 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT158
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 16 Aug 2016 21:33:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/16/2016 03:27 AM, Burton, Ross wrote:
>
> On 16 August 2016 at 01:50, Manjukumar Harthikote Matha
> <manjukumar.harthikote-matha@xilinx.com
> <mailto:manjukumar.harthikote-matha@xilinx.com>> wrote:
>
>     Is there something fundamentally broken with this patch? It just
>     enables out of tree build for u-boot source.
>
>
> No, it's in my staging branch and appears to work.  Should be in master
> soon.
>

Thank You

Thanks
Manju

