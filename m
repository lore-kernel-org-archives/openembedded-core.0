Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0076.outbound.protection.outlook.com [104.47.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 2851F7716D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 00:45:41 +0000 (UTC)
Received: from CY1NAM02FT057.eop-nam02.prod.protection.outlook.com
	(10.152.74.51) by CY1NAM02HT060.eop-nam02.prod.protection.outlook.com
	(10.152.75.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.567.7;
	Tue, 9 Aug 2016 00:45:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT057.mail.protection.outlook.com (10.152.75.110) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.567.7
	via Frontend Transport; Tue, 9 Aug 2016 00:45:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:37111
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bWvAq-00057L-Dd; Mon, 08 Aug 2016 17:45:40 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bWvAp-0000C5-PP; Mon, 08 Aug 2016 17:45:39 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u790jdnk014211; Mon, 8 Aug 2016 17:45:39 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bWvAp-0000Bs-1s; Mon, 08 Aug 2016 17:45:39 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
	<20160728132014.GH5926@bill-the-cat>
	<CAJTo0Lbdc8tOYB9u3ybdFwCXoOZU_M6x+tg_wUSbydnwtXbs+A@mail.gmail.com>
	<20160728134732.GM5926@bill-the-cat>
	<b4c92879-346c-5b0c-e678-fe2eb922259b@xilinx.com>
	<CAJTo0LbFsd_ZNawVNHU5cQo8gb=6UupiYd5jFnVzrJ5Ci4smbg@mail.gmail.com>
	<36d6bd7a-5f02-5990-c669-87abebd50f60@xilinx.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <2440058a-4078-d631-c50a-e4b53cb7de1a@xilinx.com>
Date: Mon, 8 Aug 2016 17:42:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <36d6bd7a-5f02-5990-c669-87abebd50f60@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22500.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(3190300001)(377454003)(199003)(24454002)(189002)(2906002)(87936001)(83506001)(189998001)(33646002)(86362001)(31686004)(47776003)(2950100001)(77096005)(50466002)(36756003)(230700001)(31696002)(65956001)(76176999)(65806001)(92566002)(4001350100001)(50986999)(54356999)(110136002)(4326007)(586003)(81166006)(64126003)(356003)(305945005)(8676002)(93886004)(81156014)(9786002)(106466001)(7846002)(11100500001)(19580395003)(23676002)(8936002)(63266004)(65826006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT060; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT057;
	1:9reA3m5xU1B8noiEPVYV2q61J3eCG6b8elcE/3a2jcQNnhrNsVMmB5GJ59y9Lc7/Hj38oYX67SfUXWgYE0u/cjn68iZYX4GZWsUMouSDnDHAndUjcR8hrh6XNJk6aIqGoUCHqJGGx1LCX062qkYE1aeBzCKBVtMg2shsHO7TM48okFjLo6+s9HttjMx/RgQxwo2t19p9zAY66o6pZuRFxVrriFyG2PV9WShW3u1R1OyYD6z/UcnRolycKlRW5ItBRbLj6I2pxFkzC1UilVLMUHXbbR9b6Wqor6VqzWHWKloeglMYOXZpvPTTBtS1I7O4kvzhPwCoPNCzm+yCLkP5Juxk0aXJ25VWkCczr0HWNXNLnaOReDYD0tWxxWXE+FK0CtlpjB3TWWXJrGX8d+puPRwoHkl7bBNVzAnJIolqb8ZelvFL7Cxikg0HiJtKiPR2PbPmsxX820HTZCjB21ujEFQgJtX82cxV91gT9JNTrDQmWRIFiAhJDy9ie0eMV4VoZa1STMxezwQPUTtwSm6QoVr4tv5A21sKJB8HglfAPMZAkuHbmB9rq8xRMVyLyHl5LelWOZcHORBA0AuZnoUhkuC6htkOYKEhAaYxwTEPR8nKX8OB8cV4lwIfSuWyeg/K
X-MS-Office365-Filtering-Correlation-Id: e2aa9d2c-8e65-463f-adee-08d3bfee7ccf
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT060;
	2:dSgF8qfgVKXb7LeDDyaRcvRBqtrgnw+gIyEFhFsufG03ssVvhuTi6/xfeMAQI+YmZNtHC0BGdzMPjgMUmsqIMpImC9A82gNiqfRMFc0R8gSS1rLTX91xnUEoODYsLDallFZB+kPQHhP8YtxUw361HXvmXiXgxUqOWhr2bBN0ti7R/dMXR1THHTYHEOEwlWjc;
	3:CmjDLstkrobp66gPPcgmkASTA6w4/KpR2UnrEcthA5VHDfIGTRXMF+htEeulXX5jnlWL2Ya/FElr9jAIz7MkwTGW9GUceomnvmus8E8rIXf3SRK6ZMKtEnksPrlZHw6qMyGsAb80FCZJg8dYvkyKtWHbUD+Ef7mbCbQmyVQsakglLhLYBZtu+mr6OjUDjyImwkL4ZD8E8RTjRRHXHxVWZDyg+sbfuW8zP5oaUWD9raVI7mIcfSJEIhLGotWYpy4GvJk/KMTrIiA4ATub6EFQHA==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CY1NAM02HT060; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT060;
	25:VvhSsiyIHBQjlvdgrKZDhAUZY2AfWd4EiSrrKbaX8vIJLk52VLe0PHZ51wkbLFtQd1bw/W6sd10roaOWRTIPXu641DcKjGrwrrwMBOJkrhAQ2pAx+vn05ISQYCE9CO/b5SDnLarDt703My9gf9b516FNz10euZ2WLBaFlpCde7mtJmMBJ7ou+QSCL+KWpwhA9XhMlemL9hRuVnUA9Z0kM7cDKUcoXZZbegToey9JURAzAK8zJ0TucGKgo80zjXCql5sLfIAgcQxZFCi6j9RLuKnJ+WkNOI8TyyhS4+MJ3c/yEI5cOzqr0Ba3K3cFJIZo4gohNZPsc/BccYLCYURHs7QEk95bDkcwfltq0YHGDNV4GXBeYD9fLl8tj8m7v0ATD0/IJuWrzxG6Lngk7OqWuwx+lrCZU/zoWz7t7otMVCh6Ebn3sEm41woA4dX7HNfqxNtgBu+K2GO8MngFJSTDLs0u2OAlFirkQGK6ijHHDGZUtfhn8nLCT8KPphoW0I/K5HH4S0x6OT4ZkO1AsJvJLyE7wU1DUuzg7YEodtB2FayMglypw+N4FT3tTWeEqlnP8yFOBHnUYJg36tBSET1XvLaR4d9iu5Q8OeMADkqgzt5WfGyikc7dCf3fAUXFpNezUyER29GCGPJ1HVm51jOhGIjz9LabU7/sFR3ZhJIXfs68CiUtxH/T8OrXMWltMXLCtNHZQ16WYyz6taOo3ZKzh3yu5KAX/HUWzC6VQvBHhJ0zj35m2vAirFHLDtkNIukPQJ6XQRKJaE9clcOVz6qisQQCC6AsctDtmrKff2EEczcs1KvPgy79+17zDvOYedta
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT060;
	31:gKEuim8fELAXzNU06LxqvweOlp4evqHUKarNSO87yJexjO8ruqfxkvr25QYVNJA19nXnESCyxpGWcovryksYAnhI14d+2dOW9OAZoFIItymhuB1CdqOm4UIakoZWAIKpP/siSBNYaNQvm0wunC/BVY5kX7f2JFTHqBL7H0zMr67hDLbRcs2yeTDXfiEY7+43M0EeNRNosJCSMPi5cIw9gF5f8Zhye1o9twcllauzwKA=;
	20:xZHYUjJ29YwyhCPOTOWhaGJbsnwa2AQ7fSLIM4y6XLgmDQoTXTa4xGOL43iP/VxtEpui6MiyOgNARbg4VYKIPvNxaL3eBUgl2+pD7FQs2rscvP3KlWtFbwIH6Tvr7+XwwamfNHhfD+y7IyLred71av6X81ut9fTN4C+13p8WPmoTX5F18ijL0qKVC6umkufsLnadXB35FCPbabAZDsnJGiIzeAmkdnybH8BJFTNaK4A3KU3w7rb4XKLADyxIwZVSB5cX89fotSK+oYMdwtqcIqvHX9M6qB80IzWfnIq36dTdoHn1H/esP1eNF/aAJwsOj4sfvSdSlGe7LCBQrVpUHCHRDx+od2gjMjLt+vZYwHa7Z3vbbQrOg2ymaEYfofTtlSHUFkX5tg5bYZXm/caSdzYeEomjxCnW4xCk77e4ITg5yRHOtkZyJmGuy8l1LZBwbGaUizFehTe35/nivKSRbYSbnXm80Gpfr7kpV9q4lXrl7vhoC1djlFy1rN7dZ/MD
X-Microsoft-Antispam-PRVS: <c05f570fc47b4a4ab97a2b68deff0544@CY1NAM02HT060.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040161)(601004)(2401047)(13015025)(5005006)(8121501046)(13018025)(13017025)(13023025)(13024025)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT060; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT060; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT060;
	4:J225ShB3lWUNocpb1klp924TUYJRjwhsaCVZb+YExvIzZp+gdM4XJ0NLbFt0i2nIBfRQW9xTXFSrJIbxpSiPX90jXLk2mpxGgPq+fOxrQgLnVkdI7ntQX0PQnwjwOA5fknOa0f7EHuvioxs4pA8t8kEwjV1dar7z5yYV7XNiIhfCInD84xV/usuMOu2pPupWGIIcSF0B1SgbLomAoMUTuEk4pYSoQMsrzF76I+DdUAcS6DTQ6GkWJnasmlC9p7TsfBdaDONrdMw/J7Mp5gdrZUXzz++pt0wMHCWr+577WOrjSsjTwFDFZto7jU5dTE/Mvdh2yXvG85GYPd76QIDNEqRk+tC6NRhWH+fDS+jM68DIE1yrn7ZbIKY4rP54aHEt5+U/YI7vtx5tQZg+sAkFQOKQFEUDzdmj+bd8KbRBjlDsLGJQ56BGdRJ7kBo7WYyynoxbobMT1NPdH01bGWnpTfDe8CPEe89s/3QludUhoPHF6Pk7D1F3KJ1ryKSl1Epg
X-Forefront-PRVS: 0029F17A3F
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFOQU0wMkhUMDYwOzIzOmZUSEFUQWYxbVprWUtjdTYyTnU4bmVhQTRS?=
	=?utf-8?B?VE4rRXdaYWZQZTAyVXlobURTSlhZdFBhS1ZBVmFmT2kwUXlNMVJnNmtOWDVP?=
	=?utf-8?B?Q3hFWlNiWmhEakhoZ1hqYW9Jb1U0RkNjR2RVZDE1UlVtNmxMd0pudVVsd0JK?=
	=?utf-8?B?djUvNXEwamFHeUUvd1oyb3Z6bCtxUHNmem1nQ1AzSW9JdWhoV050UEFpV1V6?=
	=?utf-8?B?UEhRSGMzMnJrK1FWR1pIRWQ1clhaRGQzak9uV2ZWcjZKMGRsbFR3NG9nSmhL?=
	=?utf-8?B?SXB6aUdlN04yOVZyaGl6eUpZaUV2a0F3eEp6YVFIK2pwa1lCYm0zZGg5b1Qr?=
	=?utf-8?B?TTMxRlhGZXRRVnlyaEpBaUdTSDBac0J5YUJxOVRNSzNoVUUxU3BLbkIxdDlC?=
	=?utf-8?B?bFYxaG1QOHFZRjNjbFdMZmVqYTljM2NQWDdSN3ZpdmJ6ckpVWWlDUFE0Nng2?=
	=?utf-8?B?ZkJ0amEwMDNJOUo5ZkdJVVBQWlJkNG9zTUdNdWpxVTJUMXFWVFcyQUs3WnFF?=
	=?utf-8?B?aVMyRUFDSlVVSFQxZHV5WktRbktKUnlxaitULy9vZlpBeFFmZXFpOUhFZk9E?=
	=?utf-8?B?MWF0YXVPUFpwaTRlR2p1R1hDRHdzN2F1VEY1RVlWd3dIeGdHU09MK2owa3VJ?=
	=?utf-8?B?TVppZmQ2S3QxSDhzY08vczFtQkhRSi9Ycno2M2R1YWJmclRWM2hsUXVKODhX?=
	=?utf-8?B?SElzMTF1Ujh2Uk1jd2FudWFsbytsKytDQ0Z0WUpYdXNwMEdqYTBBTDV4SzVp?=
	=?utf-8?B?VzdzVUE0M1RhZXQzU0pIdGdIN3U3OEVJemxCaXc1OUovYTBLYkVUWmlaQkVs?=
	=?utf-8?B?TEVjSUZJWFd3RjAvVnh6bGdNQVlCQ3VjMjI2aGlWay9nUGovRXJNRkZiUEtU?=
	=?utf-8?B?WFRnWnJmdHdwMTNneTA4S0RjL0ttTTFwZWtpTU11ZzFxM2RpcWlhL3FydVdt?=
	=?utf-8?B?OXl4d2FGMENXbG9IaE92bVZwVlE2TWRtQkZtRHl4dkNuLzNaSjQ4SFdPTkdv?=
	=?utf-8?B?dG5JU21LZGc1alYyalFMdWp5b2tVenBHSGM5YXFSbVp6cjRJRU4xMGRDRXJ1?=
	=?utf-8?B?OEVrRE4raDE1MW4xMXkwbVlnWXpMdnhNLzFXVEdBdWN4ZURScDZzZkdlMFJz?=
	=?utf-8?B?eWdEZXV4VGlPbHdPbHVvaXpTS0txZTFNTUY0OFMrckM2K1dNL0srQmNTemRq?=
	=?utf-8?B?MXNoMXVtR2ZPNVlMVHNUY0VDdEh1VjI4TEFlZy9PSXhPME10YmJxeVp6QWhJ?=
	=?utf-8?B?Y2hqKzZmTE4xY3NTaldlN21lZTFxUDM1d1hQcGJySnVHcFdWYUF5QkFGRzdl?=
	=?utf-8?B?ZG4yVjZ1ZlpwR1BTTGpxd1BSMkdUSDVNcSt4QzZha1BjNUJzYWdhdFJ3MTl4?=
	=?utf-8?B?Y2J4ajNTMDdENm9NRVlhd1hBRHk2d0xLYWdBc21Sa09GSWJzV0ttbUFkTFFk?=
	=?utf-8?B?Qm1QcDViUmc1ZHdRSEk2bysvUyt4YWlOMkVTa0YyZHRpdTBadFROVFFmWmJQ?=
	=?utf-8?B?MDBlNTJJQWJZVVpnRjBBSkwwNE5lYWUyQzA2NlBKSHl0WW9YSzNnMzB5MHpK?=
	=?utf-8?B?Z2FsR0Vyc3ZtaEF6VWFGTGJBUnJoTVJDMjUvTmR1MWVkbVFRSEY0dTg2T1hq?=
	=?utf-8?B?Z3djZkhrRjFZVEJCTEQzWGh4bU1Hc21ZWlNRdk4yUHZheHVKbW5pMFMvKzly?=
	=?utf-8?Q?GbtMPYbU/K6LsjmL4p4pkVLszye41r96bw2Agxx?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT060;
	6:QU7/ZFNik9Vs2LPGKOE/246NcsruMLnQ/F4xicAoOKUd4eoxkQdit1mgGF0P3fuDJwBK9xzP7qr4GZkHf+fSap9nzpU9KNsHSDttXGCyJVLPNVupGaKtoPk8Z3OFHztOv6uAnyrS1staQwLMUWvks4hFVLU4iaJCuXnJVYXuMNKNYbAThgI5MD31hhpMPgaZdecwFsnMQ7I52SkHdoIejRemCQOxnCDcIHGcCBvXKhtE+n5yadUByIbb3q7tdF5dSgp8GkvFlr2VYP53lnQsgff7He/vicNHM2jg+jHs7hI24TzsIv7aLsJ5XZGIwWINCrV2Mdl3rc0N6ee/nGFYLA==;
	5:JQ6fo7oFh/ZOlfN0zvfiKBySLI2NldTi4WcaPSdQj0ZGIst2t8xfdgl8SO3nUqrvp5LwAorUrK/38i8rymSMuK2OB16IKQ4Gk/XEfsMHfPM4ZT6pYdNlSVQUTj0dcQ7DL6V/KVetbutgrywtxM/xaw==;
	24:krx4qlhVQFEVra+SRBFE01wdJFxa279L4cArpk/evLACH9ABL5ejFXysV8kbgJpTufN74/RHiY4cvpfnsgYvabO3EYNf+a7oAjdN9w8EC1o=;
	7:rYUMbLNYObRidZ1XwQMXxLokhTaKaaQWVCOmnc2UwF4XjKcIG3gewl6mhRf73CkuXhjFi/NxHiD3v8UmMcxAqaQMlsaUXuNYp6gV+HVU4hqrYBz1HsaoW+Dvbr2ZPWcyMVFQZfTiNJUqptQdxBk3GKC+jxkhhRx47dO8N6QypU3i6a0Nb/vcvnBmDMzoxa5yTpJVcBD23HRNsu3mXICHMWmshG1cmbmZ3G7rCtigYLekSqdpNeJJCgLKGeF5oEXc
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2016 00:45:40.3822 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT060
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Tue, 09 Aug 2016 00:45:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



Hi Ross,
On 08/02/2016 01:10 PM, Manjukumar Harthikote Matha wrote:
>
> Hi Ross,
<...>
>>     INHERIT += "externalsrc"
>>     EXTERNALSRC_pn-u-boot-ti-staging = "/<path>/ti-u-boot"
>>
>>
>> I was able to replicate my build failure using MACHINE=beaglebone (from
>> meta-yocto-bsp, but it has no u-boot bbappend) and no externalsrc.  Did
>> you test that combination?
>
> With the patch in place, I removed meta-ti from bblayers.conf
> Just using meta-yocto-bsp, meta-poky, meta-yocto and meta
>
> Test Case 1:
>
> Ran MACHINE=beaglbone bitbake u-boot (and then core-image-minimal) and
> it built it for me.
> u-boot-beaglebone-v2016.03+gitAUTOINC+df61a74e68-r0.img
>
> Test Case 2:
> rm tmp, cache and did a cleansstate
> Enabled EXTERNALSRC and built u-boot using MACHINE=beaglebone bitbake
> u-boot
> u-boot-beaglebone-v2016.03+git999-r0.img
>
I re-tested again with latest master tip (dfc016f). Can you confirm ?
This was clean build, I followed these steps
git clone git://git.yoctoproject.org/poky.git -b master
source oe-init-build-env
MACHINE=beaglebone bitbake core-image-minimal


Thanks
Manju

