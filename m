Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 843 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Mar 2018 02:59:03 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0043.outbound.protection.outlook.com [104.47.42.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5797198F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 02:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4g+SfDF9qWIRmbd/eBNqH5hO1O6JrEisYXvNeX40Fio=;
	b=tKrN6/Ijo0XsFBaaEPQRmoZJPpMcJbkUnkpUgrWUsHLpAvvXUjk6m3xuw4QxMnmnMlqjN/nQ4ciLpOO/Ybe91ImEaAWLBxpRK7aFQAuKHl0/Zc7Zg/xFesZrW4imqo3xitnUclihljrryjbN2QKBPqkSeBEUw9ed7K11sg0Y2k8=
Received: from CY4PR02CA0023.namprd02.prod.outlook.com (2603:10b6:903:18::33)
	by CY1PR02MB1303.namprd02.prod.outlook.com (2a01:111:e400:50f0::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.609.10;
	Fri, 30 Mar 2018 02:14:04 +0000
Received: from BL2NAM02FT043.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by CY4PR02CA0023.outlook.office365.com
	(2603:10b6:903:18::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.631.10 via
	Frontend Transport; Fri, 30 Mar 2018 02:14:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT043.mail.protection.outlook.com (10.152.77.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.631.7
	via Frontend Transport; Fri, 30 Mar 2018 02:14:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f1jYI-00054m-Rx for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2018 19:14:02 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f1jYD-0001QZ-Lg for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2018 19:13:57 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w2U2Dv98016835 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 19:13:57 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1f1jYC-0001QU-Va
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2018 19:13:56 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180328201929.6810-1-ross.burton@intel.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <7ac15a26-eb00-74bc-4ab0-933802389240@xilinx.com>
Date: Thu, 29 Mar 2018 19:13:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20180328201929.6810-1-ross.burton@intel.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(396003)(39380400002)(376002)(2980300002)(438002)(189003)(199004)(2616005)(426003)(230700001)(6916009)(64126003)(8676002)(58126008)(50466002)(476003)(47776003)(316002)(81166006)(11346002)(9786002)(126002)(2351001)(8936002)(5660300001)(81156014)(36756003)(106466001)(446003)(31686004)(76176011)(186003)(77096007)(23676004)(67846002)(65826007)(53546011)(63266004)(26005)(356003)(65956001)(6246003)(31696002)(106002)(229853002)(2906002)(305945005)(336012)(478600001)(65806001)(486005)(2486003)(486005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1303; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT043;
	1:OaLR+t3OiysEXk3TtP+URHvDL6LN1grL+2nSkB0HWIEzU6GW43gSswyJ8Y5+mHsxYO2DYrk0WLHny3nUs5Xv0vALtkbe5ewX5KklhtGgQ+LIwZrENYLl9QmFpulQBUWQ
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a1d1fb9-83d5-493b-00cb-08d595e3e8ad
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY1PR02MB1303; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	3:yIU0cXcAmjVWdmzAXfPcp5TBIb9YaHYTM4z2DNnrh/5Oyn0cPmRG7hUBhyuQU/m/TgeEC22qmzad9YOuRvSaLSTi57BJCuYnYbDzxFZXIfpkZX3z2QvND32q6IeQG9jC/3bNhsuwETs5XOJxPeISBQs/kYrkwvOTRxzWW6BqyDjETa61aktiUSoCZhUYKRXnArwre6EF2BIzPS/9eUOrshLR9FrI84RdXxQ10fZve0x0VCn7Dj55p16f2sH8JrB8x71mB2wTk+7hr9ynNgepBYxFW8/GDd3Y2vNVgMbRLN3vm5+BgW3qRbC87mSC3DcXPA9mariSiuNhg7XRe/IT8Z0VMdxqPSMSZ0YAj6Mw6gw=;
	25:sQj4c1uFKFNSqOKoHlSwUBgEnvf3iFisjsVzXEgdTl+sRO+cUxID01pj8OQ1+OUHTXMYTAnQHpdokBm+wSi1M0P6/VFOma+Atz+3a8nCTKwGuHDOM+FRV2NJvG/nZPNi52t6m4x5v+rY6I6dW2WzsmaiKABnDNhRen9wx1z46ZSquqRW5BzSJn55xw/Vrlpgv/4y2vDTS1BOAcM5sW0exXZiVQDpSO/UbgMLLDEgPKT6FVW4LelQGUpUVv6R32boDDM9kBxSHISvFmiNVA9ybHElemaifPD96v2VitqVSB2VP6rLiOQM4EkjX3tkp27X2yqnSXZy5a8PMPfNd0zIwg==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1303:|CY1PR02MB1303:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	31:R1C47TC9gk+dR35Of06mdsr0qu35wqjt1GpT8NK0zQyuWAhQEw9ceOCr/WPE3cFd1bck3n68yGTKsUKseJHTIt0TdeoAbb92Hjfc6xtwLda3VZZ1By0NUtKAhLi1XiZ8U4KLyVttfb+luvOoZcCFKkfBpxGbMhqfeH82pNSYnsSYz6rDnAkW7ONlCJ+Y2b9mzm8bRDPHjf2fEFKgpUo/wXLtIaIkn1digKVPxWkkEP0=;
	20:C9zEuseO1yNqlXX1ziCrEk/Cs6cudGaXcLdt+J3EFQG9MkBDQV9FrycAG8960Z58oKmlv7ZQtElhpKf/B+duQ6aoWHh+XukYQRKRpEKEooDefUtiIiPp5hnSAX7nzIuPiYe1Lvp5UqnTSEgFUFUKxvfSCENXpGMh4chCoTZU0qZ/6yeapoZ4UaHkYFig7XFNeHecicIsWnJIZzfm6nY0A2uOVzgRh15+InHmooHzaO/HHbk+UoWGXBVlUQYAXwOlKbpbxCbIaAgH16bQ2rQySy41+g9Y8hIM83rkR9ojzVjc3AVls6fXiFCDYm39//kSC4UTlZErfNIxKWZo7fNQKo0Poho+6SzSR6gswE3vH+yMGbY9Q1cTWSBBNeP9RTg67+OxhkqFW4+8EfTSK6Le9laVP3owLZtdGVrI2a8I9K3URUVYFbmZ3M+RJRJ7q5jBTq/v1IgmpUFIF2vt0ktJo50yGtmMt2+hMvvO36q1T4i2FXdxoPREfW6BRGdu+atX
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR02MB1303F28405BD7C192DF3DD51ACA10@CY1PR02MB1303.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231221)(944501327)(52105095)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(6072148)(201708071742011);
	SRVR:CY1PR02MB1303; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1303; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	4:uJlxhd7mLwCtkrqKtUjWwp9+bvNx6XcaAG0ruEYawxI5sHuYUgqJQJ3i/knv7CuqSyZw5C5V/JW6rlqqO93ZSLoKqTx0lAqXsDpEGjPa4FiNtK4mkWFJm527DVzmymxrgk2e+wBXbRfHZZgd41IWRqR+s7CfGlX8ufeuJZZ1/m5I+nViE9yLCasS5WPrMptDjXUCdITEl/7YZ+JXLK3lGkLhg2ZqJyb+D/89AxTR0l8y0cqWmgTq3Pzq0WFGOSVRYJFayS6CtFjqkllrimPC/x5pP0I8RKv23lWM6Ma1sEMMG5LvGWZlzMA+VUn/4XSOhmzJl1fR0xOS8Fi4tTTCC8/4TjyHsfrGOsfQFBhzQTM=
X-Forefront-PRVS: 06274D1C43
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAyTUIxMzAzOzIzOnZuTEtkNC82Nks3TU9jRVNQU1FNeTB2ZVhO?=
	=?utf-8?B?YlNzVnkrN3lrd2lvUm1SZGxaQ0t5OExvWFhOb3hGTGtiVWIxdlNwUnhrV1hW?=
	=?utf-8?B?bXJGcWwvSnM4czRlY2Z2L2JnVHcyY1A5UzV2UVE0VTNwTGo3SGtMNWNDS25q?=
	=?utf-8?B?ZG4rbENCd0JUeUU0UkxNZmhKTEtadnBIN3VKbHZyb1Q3NVp2Ukczb2ltQ3ow?=
	=?utf-8?B?VUVSU3lkeTQ3dlNDc0NRdmlyQkEwNEIwbk5JeGdRSTdwSERzY2U5TUtoSVQy?=
	=?utf-8?B?bGN4Ykx1VEZlVTM5aWpaUS96aFA5V3A3cXF2Tk9Jb3hYY1RYbDg1Z0dDY2Ux?=
	=?utf-8?B?TXN5b21EemppNUxCR21ybFlSbU10bHlZanRQdUQ0L1BUWHVIaHRJUFhxN1Fk?=
	=?utf-8?B?dzFmbnJHdVhhNndMY1VqSklERVVCbXZFVG1XTU9PczVyM0M1YW9tWmhZWmRP?=
	=?utf-8?B?WnVWd1pJRkdGZVVLUDYvVW5FaUwwcnFtZlBQREx0QmtxRE1LRGRJOVZpMCtP?=
	=?utf-8?B?Ylp0cGphZEVHZWVFWGF6Y09GTjIrMHkrSFg3bzlnMXc3MTlLT1dobXJQN2NO?=
	=?utf-8?B?b1ZBRWQwREYyN3k0ajV4UWkvK3VUVklDWUJ1UWZ5UWJTdU9YMjdKaldLdHU5?=
	=?utf-8?B?THc0a3JURDRhamNBcC9vbnIwL29mcGxZYzM4S0dEUktISUFZdmJPSDd3M00z?=
	=?utf-8?B?ditLVlJGaWU0MzIxcmVvL1Y3ZDFlNGIyay9Oakx1aS83NW4wRTA1MFoydnhY?=
	=?utf-8?B?VmF1a04vVEt6SW1tclkwSWZyTFQ3NGV5MHlUaG5oZ1J2b0FGTGM3SXgycm5Z?=
	=?utf-8?B?TWpqTHdKQUNVaU04Vk4xZ01KcGVKOXloQTRzUnZ5SXNHWHRuSmFPa3Z5ZDd5?=
	=?utf-8?B?ZmMyYzBoWGpmdXBMRjF2cVFITFYybHBRaTE4RTZianpEQkROS29NOXVxRVZI?=
	=?utf-8?B?V2ZOZ2F5eUVxSDZYNm0yUDh2cDR2RDRyYnRwVnNqRHFHTEg0Yk1XMjQ0eE9x?=
	=?utf-8?B?bXV2WGJrOWUycnEzTjJmL0JVUkNzZXl6V1loWnd6aUFmWmt1YVY3aXUyNER5?=
	=?utf-8?B?a2E1NERRelYwcDdWOEF5b013ZWhkYzlLYmQ4Titsa1R5OHZ4YzFTQnZVRzNB?=
	=?utf-8?B?Y21weTZGK1FCSDJ0U2ZTR2gvbXFjV0JrZkZkZ0hHV0luSEFhRDRzZXhISU5E?=
	=?utf-8?B?ZDFLU0ViWllsRDFUcTNaY0EvbEs2SjhTSllodmtxMXFYOUIzNDdZSlhCeFdq?=
	=?utf-8?B?cm1WTjhyZ3UzM2RPZXdFOHFkSlo5d3ZLVzlsb3lSZnFGcS9SNGRJY0lNTkda?=
	=?utf-8?B?QVl0dXJhQzkwVllTYUlrM1lKK3FsczlMMjVQVXhKY3BBYUFiUksxYXUxQVhD?=
	=?utf-8?B?OWJvaWluYWMvRHc4d054eEF5YzVDa1l4ei9ucWk3QjRoNnBybjU2RTAwY0xl?=
	=?utf-8?B?N3psRnJRdDJzeGVmZGRUSUJwRFhmalBUcVpObVduNHdlL3plNlNPT1JTSVkw?=
	=?utf-8?B?ME8zZkZFaklrcVZOSTJTRDR5OWdEb0Vyei8yMXVTSEVWUXAzK0hUcEFSL3J4?=
	=?utf-8?B?NFE0b1RGMVZ4UXpZeEc1dEZqdDFiZThlbTdncDE5eThPdmM3QzZkQU5ZVXEv?=
	=?utf-8?B?ditoS1E3d3I5UXM1ZXVudGFIL05FdFdPRW13MW9hZW42NTJYR2VKbkxDNmF0?=
	=?utf-8?Q?4oNh60pkGpBr5DCBLc=3D?=
X-Microsoft-Antispam-Message-Info: Bz9js2zemsD3QfQP9YtNyynTYBUcwJvdmGj+DpIc8a/QtkTOMLyNs+5XL/m6ydqKp+rBvhPnLs27SNdFBp/p3z2TsEhmU0k7azfHgzxxp6m1OyBTjXACRMB1jbu3/W6ajvSq9lypQ5JhnBJxkvWpn5Fv5NcaR9SN3jFAr29tN84jbD00+on5Fjwzk+G+lAUb
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	6:BChiQb+WO47KO1m9YJJ4pECmJjQ4WPqeMVLwbl6oDn7kyBrhbsJWRpZOXlnS/7aPiKxqyz89EjtnW6zttokKyrm8PIiTFMLcDLu6yDD7g5EUP5YQvgl1WhKxxlM05rhR0j2gvwON/vKdft5gvJz2ljRQTGA5nQ92lDrLeCKZulJlJ8s6JymW5R3mLzZZTR7NiyE91Jz3hkRIc8POMofa42XjEe4j2PphUNIPoskIvzenn2OpXvHO7ZQQR0LV/hg7dNoK0ThoYf/Ok2RCpCw4wd+fFzq//StMXG+I1PhvSyONh6MtsNhkdrOAZOBKDDP/KlCKAiZzCzNwkKNc+8TMASS5+B0h8fxef553udUiFkJXbPR6LE5U4AynbQBVYZR+efhYaIamhpmtdDfrgixL5Y/1sVQ2AWhef4FDdV+IMsVY8BIdCOmYDQ70QGfjnKhSLxTkCwxSHvuUZuvRfHzqcQ==;
	5:DaDCNLtM3MVIEWDkNGASlFCyZ/81digibSdadJxm0mDPcd6WYlXXBfxv0knAqDrohmqcfX+sL6rZhpJVKCoi1GjAhGsQ5g5Q2zkDm7OhEu4Qvy5P+zIHzUYB/2vD7sctgpF9hvEQzqgB08wZINgYvMFheS/WOIrMqILL08rfGZA=;
	24:wNtuIc01MNoq2RcW128tcAB5hem7k4lS3JUB/4/op9l7agCNMYUC1Q6RPWZiQwNsDqqz9F/C8SLMyQ/uRHMrosmkMiD/zD1ydQ+lSPfOhsY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	7:1G/cAumB8azFXRX34xnkoiIGOM3gfkA67ymvs0NAcXX6E77mTb72uxGOqZMBlEnVkYFNRjs3DFzb6E6b9cwri7OzizL/LyP+zzmFEcHEuBhl7XH7ryXIk/HBEcoiHF9EVKXQDLFE50JP+ao33zMMNYEH0J4Y2br2nLbmMPoKgZduc5v/fyykY/G10kObMfJ1uYqcLYbWstlzd7hxArs0oVFqF9Z7scTABDzRz8BGKq9tHRNVYpn4zcLclAUoaZff;
	23:x6BtBAki7tj76fChtlxdsA6+UzgYmbOGCh1XmS0PBZBhCGncAaQZThUzIKNei1mpGiT/cVII6s8lIdABjMOtBi5rOc0oybt/PC0rBkTUedtyHQ46gfCjUjkfFtPzNNggxGTPNR61qL5xYmjtWS7PTA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2018 02:14:03.4685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1d1fb9-83d5-493b-00cb-08d595e3e8ad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1303
X-OriginatorOrg: xilinx.com
Subject: Re: [PATCH] python3: consolidate sqlite3 files
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
X-List-Received-Date: Fri, 30 Mar 2018 02:59:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Ross,


On 03/28/2018 01:19 PM, Ross Burton wrote:

python3-sqlite3 happens to be a very special and unique package, its 
folder inside ${libdir}/python3.5/ called sqlite3, which would be fine,
we usually  handle those packages by adding the whole folder, but in 
this case, we separated the sqlite3-tests (which is a folder inside the 
sqlite3 folder)
into another package, so if we add the folder to sqlite3 there would be 
nothing for sqlite3-tests to get.

> Some of the sqlite3 module was in python3-misc by accident, move the files
> into python3-sqlite3 where they belong.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/python/python3/python3-manifest.json | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 1914a4c43ba..95071c53f5a 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -977,9 +977,12 @@
>           "summary": "Python Simple Mail Transport Daemon"
>       },
>       "sqlite3": {
> -        "cached": [],
> +        "cached": [
> +            "${libdir}/python3.5/sqlite3/__pycache__/*.pyc"
> +        ],
>           "files": [
> -            "${libdir}/python3.5/lib-dynload/_sqlite3.*.so"
> +            "${libdir}/python3.5/lib-dynload/_sqlite3.*.so",

While this will work for splitting packages now, we dont support 
wildcards on the manifest file anymore,
at least not for the whole filename, because when we try to get 
dependencies for a module the
wildcard becomes useless, so this will likely kill the 
do_create_manifest task,
it'll go fine but the next time you run it, it wont get the module name 
it will disregard that dependency.
> +            "${libdir}/python3.5/sqlite3/*.py"
>           ],
>           "rdepends": [
>               "core"

The right way would be to get rid of sqlite3-tests but I know we cant do 
that, so I'm working on a fix for the do_create_manifest task
that could handle this situation.

