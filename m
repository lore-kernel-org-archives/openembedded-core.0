Return-Path: <manjukumar.harthikote-matha@xilinx.com>
X-Greylist: delayed 883 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Aug 2016 20:28:10 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0043.outbound.protection.outlook.com [104.47.38.43])
	by mail.openembedded.org (Postfix) with ESMTP id 19D6F607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 20:28:10 +0000 (UTC)
Received: from BL2NAM02FT062.eop-nam02.prod.protection.outlook.com
	(10.152.76.53) by BL2NAM02HT256.eop-nam02.prod.protection.outlook.com
	(10.152.76.164) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.557.8;
	Tue, 2 Aug 2016 20:13:27 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT062.mail.protection.outlook.com (10.152.77.57) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.557.8
	via Frontend Transport; Tue, 2 Aug 2016 20:13:26 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46751
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUg46-0007nR-2K; Tue, 02 Aug 2016 13:13:26 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUg45-0006uo-Rb; Tue, 02 Aug 2016 13:13:25 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u72KDPUj010718; Tue, 2 Aug 2016 13:13:25 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bUg45-0006uW-6e; Tue, 02 Aug 2016 13:13:25 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
	<20160728132014.GH5926@bill-the-cat>
	<CAJTo0Lbdc8tOYB9u3ybdFwCXoOZU_M6x+tg_wUSbydnwtXbs+A@mail.gmail.com>
	<20160728134732.GM5926@bill-the-cat>
	<b4c92879-346c-5b0c-e678-fe2eb922259b@xilinx.com>
	<CAJTo0LbFsd_ZNawVNHU5cQo8gb=6UupiYd5jFnVzrJ5Ci4smbg@mail.gmail.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <36d6bd7a-5f02-5990-c669-87abebd50f60@xilinx.com>
Date: Tue, 2 Aug 2016 13:10:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbFsd_ZNawVNHU5cQo8gb=6UupiYd5jFnVzrJ5Ci4smbg@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22488.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(3190300001)(189002)(377454003)(24454002)(199003)(47776003)(31686004)(65956001)(54356999)(19580405001)(65806001)(76176999)(50986999)(4001350100001)(2950100001)(4326007)(23676002)(36756003)(19580395003)(230700001)(50466002)(93886004)(106466001)(63266004)(305945005)(86362001)(8936002)(9786002)(8676002)(87936001)(189998001)(33646002)(110136002)(7846002)(64126003)(586003)(92566002)(31696002)(81156014)(77096005)(81166006)(2906002)(83506001)(356003)(65826006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT256; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT062;
	1:bUFTgF95hexBukicd5FI0JTCKD8Lzm21qR2BHnzeNYLKwyczFhn5GfcYTXkBm7dBwhL+alzC9iO3rGT6x0vCK55wWRIOsxiuXuJ6FmHE4r7B3CP9JAgXGYlk10jPwFdYkfbS0C230yTFXGqSDB3obeVHakmhMLG619129HBDOn0WQy4aKmABZ/9fNNJfylqei3ZSxIWU4O3tqsS2rKrCbjOkM6An2IZdKMpm1ffAIEg/YpXZms1phjQwN+DCJbKxno5j8SXojvescKjz5UnPNCAo1WikBO7RyUvtgfEZcMIPRRafGRhn2hJeWC2ikXqPTQE8vtHK0oVDo8cbglCSBHIZKXxNn4oxzSlwdUwz7eiohiH6RWFG7hTgq2DyE0vPqvzMf4fFbHLoqFjLoqwQNskNj0Il1lk1Acta9OdG8hgY1LuUTVMR7oJTX8cXk5pG7U2zWMkiI2CFpcdRCLawTptyrPo9oKEa513T9d/BTioPYp6E4aU4+wp+dYEoGDczKXXpZz7NssJxkfbNb8qTBI25tJYWvdd2g3GdKomm4NpQgH69mFzdZWRs93PPNB0SSVbNAfScyOMa30Jl3XoLqRrgu1mel8L0e7u5SFMqlfN+N7A87dZivdv5CFFT3nTP
X-MS-Office365-Filtering-Correlation-Id: 69edabc6-5299-45ac-bbd4-08d3bb1176ad
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT256;
	2:r/NVjFOdc183IREXYtByBu/haAnnf2hJHCBl4jTdMa8F6laQj3rU+zce+Iyr8isE7+FZiDUNpQfcaQg6SQ3Q0tjGlaOH+S4+OHGUGtpG7pK/WIWkKsWmXZFORXmN+8XZ0I0ywcC4SXS1yiORpyZdiS7PtJheu4eEUOdgDw+ak0FmcKsUR4bN0U1fhVc73Gbe;
	3:QC+5oyQi7DUXcsW5a6Qnbl0A2RH6yIFsqL3lsn5i/FYPj3HxKItfV+FH2RDlbvM2GI3SBb+jkSjIJhIOc8F+yPAM31ztRikTyNpKyaHEruFrywJ453N/u5mLd+tpZmCN3CCSwHGEiRcAf1s1pvy+FGXQGsqZ6/sErYlUOhr1nyUlWvQ2NfY5HkIfeY5UpGs2PLIwPOWyucQeatMReJqi/CVOgl5m12FmZjNgzGPTlYjPxGWSdYZpGVxwXboCids1l1BLaUBjRdErlVN6NYXZ7A==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BL2NAM02HT256; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT256;
	25:vihhiYVkfKv22fzbcIh30D5z/xHJEQl5nKw74f87q/hxBeYsAH7UckO1T8wL5UEDdWvPFDb454ZeQ6/aTIX+2uepWLMc37cz/uRicJVS95rIDIdTuxo/jCnmFMzG8+gME3MYiy35vTZbNS6U4Tp3GOq/LM+xW0hhgTh0OnuP7jRSYBygmz3CT+hkYyaPzVJvbv6jKRJR1pdfkvcIDYzP98FlRzoO8D/bnnLR0xVG+G8e74vWXCVDL667EZ2P8B6gTxHDCTpIPXtucteXbjOvkaVqRqHCJ6OJ2t7lhBwi2SWf/+UCbijg0x2AVwfjyGXrR0rUpCHLLam1Jj0uHkSdOzKTMO2aafOm1K/vmBp9BLgJMjhgutD6Sc0gh23qmyrqT+z+nvdc1+3Q7I9uIBfOYSZcJj6VJoKVAESGrhYAVdBwkZurPOff4/nPisrkn+OXfF3u2yviZF29f9PQDrx+W/GwFucVAM0/AVgLUM4g7rDU6IF0wVQFYKBGwVrK6Kr67FCjEWDfORjpApvu7ltWWWR6P0evFidoS8T4DI7ROlKm980fJhMuRD3BfqpEZMlaeUv6aFhz4my9gXiDQj/z5GKwafSKovMBE1fVutM7Xb+C4UuPtCa4F5HfoXjKXfBjtZKtQThdV5FXXnhZi2RfaPiY/whdUxtcI2Z13mej9k5YVjLutiUZai9wCWwgMiW9buLCgKde78iEshap7FbKaZGbArzahpWof6ommHpz6p1hlM+xGYApbxQ0hsTo6TV2Lx3jBSb5eOF1/5GwLvzCDQ==
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT256;
	31:41s5r3crRK8sYLTej00/WYZq+bZq8tDGoOXNE84QtwWE1HEr7Eu3fPUWKxCIzFWxcbZsE0ErmAf2rcYOSrHM/xZcrueEkG5tbh3Ibo4SYJC4aOjvTGf7//F2BFL2CsigkAV5abY4WgeX6enGN53iVKHJUaotL+NB7A9ClNVgZsfgoyiTaVbzVHDGM/Z6hMMogYTgYFEWceRlyKJRLHkPOlkcGKe9eiORn7GFQayuWQg=;
	20:Fsn1lXBqbnxuDBuURhtspR0jL+IQz8pBmqQ6K1QhpuRbgh5oB4u6xFDgIRzCt5vpp62N9jARtdlUw9KHzqItVBm19YSZGHIvNrbzItNEUnOkVBDevRHHb9oDOm6pUfxN0hhsCryNd+9CGMQmSwH2e04zrGASX2Gf9NNM0eNX5R5WM7zZzDyvh4DSsTtrhqxugOmv/wSMckfB1j57fMHneRIzyq59aKJjrfG5/86hPJZAGP2Wyrtk4SEPVh+HcijZGzHymeJdNFHiJwCY14FmuOo6Wm+HWhC1NGG7U+fCDzP74okFGYwCknoM6b9Vklnl0pjAdUWlrEynrqMXrVUQZyy8AsPmMDPDdm5A5qqJJnDTIXN7jY3JKhg1SNtwkACYh7hUH4gjaQolxtVyWqO2C6pCa3KxKC66pNvT/uUI07ewxah8Bhfjhvp9dtT3Z6dDFKQI5bmzZom9aLLqsV2mr7p4jOtPKPIpeN0Z+5Fvi9QtkqV63oZ4aZOjJQoUNXrg
X-Microsoft-Antispam-PRVS: <9d41a8feac634da8934ef2b4e5f94773@BL2NAM02HT256.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13017025)(5005006)(13018025)(13023025)(13015025)(8121501046)(13024025)(10201501046)(3002001)(6055026);
	SRVR:BL2NAM02HT256; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT256; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT256;
	4:M35AQpoYjVgeFOc42M0emSiqIMB2pqB7hNJBA+Ma25ieaNry6BE46OIly1Ckq5R8MMpTCTXAznZEOVOHE+np/IM+PIbYIiSWilsVl99qHTPl9/uOamWPCLlaB43J26gJZ++ixoWi1QkVaUhukY4st/kc1dKRm6b76nWr9v0g5vd40nV9/ETGD4/Iw6LXFmZ5PG/4ApSnRMFn8/9NGJhU/qS1G/qvV6h50aZDKVvTCiMIhwee6LOaiTphxwTPG2uzfld3+NifAOapqjxF4mbgvnPHTdZVFOPbwMnWRvj4RV3Vjo9DbInjDvHZkAXDQYMqvH0mZnWGgqKwSFCUSngjSGi8u0s4C9EcSgCIyOCNIqTQBV8KcMjiFqU6zYV1vGlmsmBPCqfF73cYGY36Z2jhPwsZJ5ry2zSa9Jdh/B+Ccyr7DhxsD9T1qOmjWMCp6V+CHdiOa1fIrZ5/5dpgiMAZO61fneH3PJAUyJ30rjGsj6EjjVVyY8I3Wxa6jnLe8omDF7kmwjXxNRm7Wr/tiiBEXYk/z8Z7y4Hf84gAUrt3GQY=
X-Forefront-PRVS: 0022134A87
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJOQU0wMkhUMjU2OzIzOkg1ZVNnRkdVd3hxaVZlZmhnS3FlN0hCMlMx?=
	=?utf-8?B?dVFxWGdYcEpkaHh3V2piMitsUXZabmtaM04vQThraTgwVlpqYkhWVGZrdmpF?=
	=?utf-8?B?YlFBbHJTNWJFOVpLa004SkpmbFZ2Sms5Mlc0Tmd6QW1xczNTN25oWmU0S29z?=
	=?utf-8?B?RmNwaHY2cm4vcTkvQTVySnpUenNraUZwcGdWNW1lcGpGb3pBVjZkaG9nTWdh?=
	=?utf-8?B?S1N4Y1E3MEUvaEdkeFN5NVh5ays3bG4xU0dORFRrUGYxeXF3WncwdWtRRER4?=
	=?utf-8?B?TVZ1RjNZbVo5dWZvaHEzN0ZJZmZSZ2hpNi9qNFdoTnhkSHlNMjJvNmFEbUpN?=
	=?utf-8?B?aW5HQjl2UlMrenNUWFBFOUIrQis1ZmN4ZjNVQUsrRkJza25wem03NUdyaGx1?=
	=?utf-8?B?UjJ4R1BuQUNQZVlmSm5GS1Rqa3UyWWtuMkhXNkFqbVFYalcvQ3pSOFNOb2dU?=
	=?utf-8?B?RVVOODRVbW9RYjArMWlnQWcvMTdWWUZiZWZzdGFWRmc5RmJYTTVYN20vUlZT?=
	=?utf-8?B?THJ0c29OZFEvOU5NWkZodklwazNBNmVGWFp0K3pNM21meG9OZ1lQemtNSWJI?=
	=?utf-8?B?WjBpRnRDdU1kbDE0YTI0d2ppYTF5K1FKZVVScXVJR0toZ1JnU0FZd1N4TkZ2?=
	=?utf-8?B?VWhUYWhobU1YR2lZbmpncGY5NjZjTkx6RndNT210Z2NTNmZqMm8xVnc2dksv?=
	=?utf-8?B?a0VpMWxjSlIyV01aL3J3bEd2enVoSnhTNDVSZE16aC9KUnFiT0xVK003bG1H?=
	=?utf-8?B?Sm5yTzBpelVyMmZJM29CRlE2cTltdnJsWWVMOStWMmF0NzB2RUNXb0w4dWVw?=
	=?utf-8?B?aTBRN2pTUk1YdTdCTlppdi93R0lQQWdOWmw4akZRSGhyUEVpWWQ5MFByQWli?=
	=?utf-8?B?SVpmclY4c3hMbjNzKzJid1B0U3pRbXRRY21UdnZKZ013ejdpTUZIKzBLZFhH?=
	=?utf-8?B?N1prVTM4NHZJSTkxL2d3QXRnS21YNDVuQllUbldLNC9xUDAzV3NTQVlUekE2?=
	=?utf-8?B?Vmp3U2drYjhBcmExT0RBSGQ1bFBOdnhSRC9KRU5rK2Zlc1ZCLy9GZ3R4VHkx?=
	=?utf-8?B?UHBFQ3NseUZJTm1RaXcvaTExSzVvbzdSUFlXK1NvdzRrY1ZnaGZVSUU5U21Z?=
	=?utf-8?B?eUhjYnVRRitTQ2pCQnpzMm9qenRKZ1JldG50V2RySGVlYkRWMm13RXVudGsz?=
	=?utf-8?B?bGdhbTlpcmZ3aTNNV3N4ZkRaMjkyS2Fqc09FMlpNcGVEak9pdHNTd1dZWXhJ?=
	=?utf-8?B?OFpxc3NzQVZpV3kzbzJUQ01IV0RHOUYxdmNMZldreEZzZkRqa2lpL002L2ta?=
	=?utf-8?B?UWlaWTZxSTllV2dmT3JtOUxwaFFpSkp5WklsV28rZ0ZjS0d6N1FLOVFIdlhl?=
	=?utf-8?B?UXZreDRIWXFMRENDZkQwT1pCb0pDTnR5bDBHUWdkQ2oxZkwyQjhZa05WYkZl?=
	=?utf-8?B?K0d2TUZYNUxIZkt4ZUFibVo4SGpybXYrZS85cHpPODBsMnlKU3Q5YXArblFs?=
	=?utf-8?B?SDhwM0xGSFR3aDVsa2hmWGRQMjVyRUE2N0ZScDNuSC9rVk00SzhLbklOV3ho?=
	=?utf-8?B?Z1BlNjBpNEpRc2ZMMTl1bFhzZUtUVWVSOS9HKzMzdXBYNFcrMTBocXMwNlA1?=
	=?utf-8?B?UVJMOFJGVFNRdDNLWXp5bm1abkxEWm9TRXRTN0tmQTl5QjlKWHBZMk51MW9s?=
	=?utf-8?Q?MC1TBw0Ej3HqDQaa72/vzS2O0s7loY2zR6lOdgd?=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT256;
	6:p6dMzlWvwHUdhYzv0muw4YCSIJ3nsKTVsGUJa3Qic/vfgSYhOegILrqZyefX3EarBIE+Phr8JDG3KkN7MIkFc4SKSqVHjDIWSpoChX+Ed6B6Han5DRD1smNBz5pENRNjFk9twct+a7UYD6vsA4JwU+sTqafNfu0UMLpKD/88n1juHUvWCal88Z+dGW4gc2WrOzliyq7encPlGFEDxnWSyFFxz+0k3vxJOA8Y4JOU2Diu5qZmSECcU8Ree7ICRZsbHglUqTteEfGBGfGVkZMjLdMEq1HeOUqlisx61aNBUGcNjzcF+K+32H1EAyAGXePdekHzvyCeS7Z9IlB6/nX+IA==;
	5:e6ZI0yX4nH+w9HGH8MOliVJTLa8cvZSVPnd0wPtwjqAMRYjORRKsRLq5NwGRJC7L9XriGSGEFJPvKRjrvYo/QHzuLBIzQGTu4CG+PR6yqtJFfZaoO9bnmx9NkVGVzD1iH6TUkz2ofgvqIVIFB8KtkA==;
	24:14CEK5WALt1knJXvEHoWcSHxogUdJgrRJ06mEg6Xw2ILMMITc97cs5SLRpb01CNQz5w80h5wpGn6MYfHXPtiW/hWbgdfSI0ucoS0jZ2pzSg=;
	7:HOx+UqTtjKAO4IxaHfXS4RYOAzF6o1qyVhnnVoQx57+Ckmrd/3hMQZrufxc4RyumCdpGPesPtTojp2uV9Cl3/6Ff417MzNCzZkJK4LbdGv/bmuy7CD3LKxsZK5ebBE9XZPD46SFuQ3A80zBJMiUDyWEDvq9E3rDiN1SNOyKBf1bLwwjrNy6jPHwO9Q7sXd0QWiEaKe2KDMxt8MHoY5jEpj0jMHiiDkTAe2yZ7aL2p5kDyQ0muCRblv5SqtXU7ngu
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2016 20:13:26.7276 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT256
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
X-List-Received-Date: Tue, 02 Aug 2016 20:28:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,
On 08/02/2016 11:39 AM, Burton, Ross wrote:
>
> On 2 August 2016 at 19:13, Manjukumar Harthikote Matha
> <manjukumar.harthikote-matha@xilinx.com
> <mailto:manjukumar.harthikote-matha@xilinx.com>> wrote:
>
>     I tried building master (poky and meta-ti) with this patch, it does
>     work, but needs change in u-boot-ti.inc (for do_install_append and
>     do_deploy_append, changing ${S} references to ${B})
>
>     Git cloned ti-u-boot and used ti-u-boot-2016.05 branch
>
>     I added these in my local.conf
>
>     INHERIT += "externalsrc"
>     EXTERNALSRC_pn-u-boot-ti-staging = "/<path>/ti-u-boot"
>
>
> I was able to replicate my build failure using MACHINE=beaglebone (from
> meta-yocto-bsp, but it has no u-boot bbappend) and no externalsrc.  Did
> you test that combination?

With the patch in place, I removed meta-ti from bblayers.conf
Just using meta-yocto-bsp, meta-poky, meta-yocto and meta

Test Case 1:

Ran MACHINE=beaglbone bitbake u-boot (and then core-image-minimal) and 
it built it for me.
u-boot-beaglebone-v2016.03+gitAUTOINC+df61a74e68-r0.img

Test Case 2:
rm tmp, cache and did a cleansstate
Enabled EXTERNALSRC and built u-boot using MACHINE=beaglebone bitbake u-boot
u-boot-beaglebone-v2016.03+git999-r0.img

Thanks
Manju


