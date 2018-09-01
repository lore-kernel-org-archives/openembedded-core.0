Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0059.outbound.protection.outlook.com [104.47.33.59])
	by mail.openembedded.org (Postfix) with ESMTP id 02E75600BB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Sep 2018 00:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=93XfWCu6Cx2sOKPk3QXx+QWsDf36SsZCD8rDm0fWxKQ=;
	b=rbg9eyW9RWZ9/21qD760QN4sgIK7zN/wSTntAxe5dG992yTlZXlz3Z7zeISpfg6b5R2Ko0dEB09fzWge3CGk1kFnwwzMHVpqk4euhvCc4010Q46Jy6FbJyhJ6I+1M5nCCaSgj3jgjzystxNlpsh1cCx/ixh+TA275GqiuffttwU=
Received: from SN6PR02CA0007.namprd02.prod.outlook.com (2603:10b6:805:a2::20)
	by BN6PR02MB2673.namprd02.prod.outlook.com (2603:10b6:404:fa::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1080.17;
	Sat, 1 Sep 2018 00:14:10 +0000
Received: from CY1NAM02FT024.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by SN6PR02CA0007.outlook.office365.com
	(2603:10b6:805:a2::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1101.13 via
	Frontend Transport; Sat, 1 Sep 2018 00:14:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT024.mail.protection.outlook.com (10.152.74.210) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1101.10
	via Frontend Transport; Sat, 1 Sep 2018 00:14:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fvtYG-0005IA-Ld for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2018 17:14:08 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fvtYB-0008W6-Ff for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2018 17:14:03 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w810E2xX011322 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 17:14:03 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1fvtYA-0008Vm-Rf
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2018 17:14:02 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
Date: Fri, 31 Aug 2018 17:14:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(438002)(54094003)(199004)(189003)(65826007)(305945005)(2906002)(8936002)(31686004)(63266004)(47776003)(9786002)(2351001)(5660300001)(106002)(106466001)(229853002)(8676002)(81166006)(81156014)(64126003)(23676004)(2486003)(52396003)(76176011)(67846002)(478600001)(230700001)(50466002)(356003)(6916009)(36756003)(486006)(6246003)(126002)(186003)(26005)(476003)(77096007)(14444005)(53546011)(31696002)(58126008)(336012)(65956001)(65806001)(446003)(11346002)(426003)(2616005)(316002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2673; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT024;
	1:4s2CSaonTDR9yn05tPk31aS2l4811Kwf8oiDsIyNg2kgqUY0qqbnsulb9S61KPrQJ1EB5KhBHTGQOmfZtbdqWtxNZMr3xl45vYZgceZCtBFjMZ2wfmEZkL2N7TsZffyz
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7fac016-ed98-4986-18c1-08d60f9fd6de
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BN6PR02MB2673; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2673;
	3:pEF/7zJ8SmHeNLrUgquuoTZo2rdvZoMFHqYR/uKcmqJsOYTztJx4tWhcG1v+chJTgrr/RaKePYVfkAI4u7L9e0gpDfiy7IMBIqFL/R/fZMNtjqVvP/cfPcsvQZxIeX/Vqllpf2jUZzGXE8IWxjs6WcXkdI9edXgLZCnbhH7OLKnZcIQ5u28TsRnZmj4abr+0kXAVx3hlAox5+qonNNq5DhOZNizbgYpP+jH4Z1jisFS51WioHGrEOE9S13WS3Bxqa2SfWwxdCDwJKMWDjbtDTK2KqdZ7VXR1qkMSYzlPB7AbnJDY0TTsUyV+tNkXnZVvtAzeUXeS3ewjWGkOguLw7MvxxTGZ3IdbzVvrWMOy+TY=;
	25:yg8TT66Pk7ikAvKmj0ve7TqLsxqvTM0sveDR2MbV7hbo0UQPTbCJxlsB+1Tskh5TJU5eEUkiIgsrTqw0EXL6B9faqBXhzzDNNlASuJAg+v7+30srZbVPdHFxafYv/NN+Sr0VidDqaZCFvTE7UG/rHXYhtyWk52Jmi0xKhkiQYEKHwyYsoBYg0+MKCRjo4y4OstN77SsyjGzxncyqJSTrO/PFRqPUJmQSJOMYnqmBq5bckOJUNHxIzUj61xfSZpPu0489L+0nOPuHJfOUV3NK/IHDbF3ZEhkRSyLMXBmAprRN2laQqdL0A7/HwwsIxELuOR23oCtibWrIQ/Z+nEoEOg==
X-MS-TrafficTypeDiagnostic: BN6PR02MB2673:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2673;
	31:ztYZX5SqdyNZE5SZGLp9Z1/IAEP25w3DnhuR9SPwNiWQJZ8AhsgexvMpmyhFfdI4ZTgxXHAmjvwzpxnv4PPPb/kDIVuKlwBp92KIU6GEaTRLgSqwvQpiaHs+dU7YHvzxl9G9i84jhnPPB4xkmrIdeXQSozJM8IhnDPj5t4w/NGo+cpVpnLHXBvWzZApIjEHeVmSN6P0QvrAGO8ZUQPACawd2pLTARium7NwZxsfiLx8=;
	20:N8f2utC6nqhouOiW5lSrDQMEWD6cpeByiyLCdZN8HBIqo6PN5RwT73dbEkHqqwbFC2GZ7af/MRUe8hq27GrOpuxtOunmwFPXzJnEIC4ckH29HkDz9Ua2uh8UzgXJWDw22bTslydCJ95/+S1eAaQV1hL4tb6/adHq0WKHExhkMc7JoGn0WkALo2Qnm+UO9Stul8uVNHLrGjDQZyE+8vNROmC7NOFoCJ1y0HPismBxQn7OG+Q/HP90wNjtBD48cbQHYDd7+cYSpug+p+i4bmmad2Pngt+hS4ISUZYY68UmEeokBnopQBRzsMRo8JSopN9+rlMTeE7T+eMG1o+GE75tPfYp5hfOs1e4SnaqjtE7uH+8EvMV86HUDkPoqhhDWRsQPGSAVaWiN7IPtVTEwoz46i3uoohIQ1eENfsbU6qOgJDfZT3FBuAlg/wXj8R3AdigHu3r6LiTwwAivxemS8u585kkjrf+ARvS1SjvTfFqtS7vuOBpQjHIdXqZOzqXtOAn
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB2673F11E13ECE9F1A2200EEAAC0E0@BN6PR02MB2673.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699016);
	SRVR:BN6PR02MB2673; BCL:0; PCL:0; RULEID:; SRVR:BN6PR02MB2673; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2673;
	4:wTaeFjsKd2ZK0K71ufBY9plkK6PqPtMnJ5Ja303gICWmlSuFdPiVWlbDD2l0QQLUgFXOyE0+LurWbM5/SCbKeGDif3rU+VAw2/szccQuIH60pGSCOzbuiMg2kFpMIcFjUnlinRfAV4HaeCLsXL4Ii52ZqN64roep3qfioWLLMGAqgQ9SAnu1sKJUFRK8CWp1tvUbdi83UAfv8G1XbTp5hYCv9uoYIR813wd8JnF7C1eruQXmJnTfqoJU+bKraP8csA75MjqUm/QYyYoHUy/anQ==
X-Forefront-PRVS: 0782EC617F
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIyNjczOzIzOlZkcExZdnJ6S0J5RkJoNk9wNU9iV0ZlNEIy?=
	=?utf-8?B?Z3p3YlZPTmI1bjRKTWFDUDZrTWVPd1hTQXVnd3VvVStEdXpMc3VaV1FIamdZ?=
	=?utf-8?B?SU9KSUtERzFRNkVRR1ZBbU9tUFFkNVNOOUhSeG9GOS9JallaNndoWGlOeUYv?=
	=?utf-8?B?cFpQcEFpTXE0eW1qRXlOUDdGVXBvbnVJcnFyaHN3YkFsclFiR3RHQ1BzYkZ0?=
	=?utf-8?B?NGdVUW0wVXZJYzFveEJnaW1qRzd5c2JFUUpJK0MvQmlrZVlOVU5WR1BhazVJ?=
	=?utf-8?B?YTEycnhSL3VMQ3hESTlBQzN0UXpRYlNLQktLZkVPRFEwQUNSSThFcUNjci9S?=
	=?utf-8?B?RnI5MlREVC9aWGhyb0h6VDRmcU40Z0NzaDNVTWFzOWZueUdkNWI3VWU5ZkdF?=
	=?utf-8?B?cm52YjBOTGtCNEQ3TnZZWkFraGVlWGUwYjZtRVRXVll1eHJ2RC92cDYxa1RF?=
	=?utf-8?B?R1JHdVN2WUZBMzdJOS9VR3NUKzViZjRKdkFWc1hoSGdqT3FRdDFzdHVKUUlE?=
	=?utf-8?B?QmVZaDV5R0hIeXI5ekgySHJ1NTFpWlNqbXlzalcxNUN4RFVtSEovWnNuYUNu?=
	=?utf-8?B?MTR4T3dWUzlpY29iZ3l3TzlnOU9VdzBZMVZjbTlJdUZsaUR0dlAvRnIzUGRz?=
	=?utf-8?B?STEyVWl2NTlLdXpDL3dxOFVRZUJhUWFRZXN0RGhGY3pWcDRBSEdLZkh4SmNa?=
	=?utf-8?B?a2JmaHVCRkJFd0RiVmlvZ1FNaGNkMXdpREVuZXVPWTlUbkdmdGtwOWhZblFm?=
	=?utf-8?B?NUtwTGc4a0FWdmdWRWRZSm5ET0VvNCtCbXpVZjVaWGU3L2RQZHI2UCt6ZE82?=
	=?utf-8?B?emVqM1lpQThIS3dKWHo4WnFvL1VPTDRVN0FUWFBBcXBkS2p0QVBNUzZyNTg1?=
	=?utf-8?B?WGNTRVRzc3ZzTVg4VlpyM2krZ1hlOGtFWlpYTVVWZVVyV0RXcVdmQzJOK2Yx?=
	=?utf-8?B?MUFmNFVlWExUQ2pQTTdJRXhYd3VVYW9pRGtEaCtUcFpPK0tYR3dMZDRIajVH?=
	=?utf-8?B?dVAySHlMUUxRbWdZMXZkSHFFUmdXalNBeGN3cTlIY0orOW1Gc2dIdlMyYXJV?=
	=?utf-8?B?dHRQTENOQllZL3NTVU44aUdYSG1EQ0pZZzE4VGJPWEl2KzR3S292Z1FreFZC?=
	=?utf-8?B?dnExcTVZeDJkU2FjOFJENlZWclpocDVTUzRpR0tlRkNPWnZkcXlVeVNnRUo3?=
	=?utf-8?B?R1B0bXpCSE5JQUJjUFQrQTMvUkhOOWJWUUZSRXFReWtaKzdXdmZiKzVxc2FF?=
	=?utf-8?B?K2tWUFVTTmY0NzM4ZExyMEN2TUFlbFJMNXNNQXJSQzV0ZmgyQTkveUEvMHM3?=
	=?utf-8?B?YVh5cVI3ejBaOTlNL0lmby9tMVlDL3Bjd2tLcW1zL0JjQ0NKZEZxeDZMOWVX?=
	=?utf-8?B?VHAybDZFQlJ3RzZJTzBMYlU3dFBNTGVjNFhnZGczKzdWY0NmZ3dlWWZYelo3?=
	=?utf-8?B?ZFRYRFFpSlFxR29vMmlMTHdHRWRMeHRmNWV6Q0VrYmhtcEVmaVY5ckhreUdH?=
	=?utf-8?B?dFpiYlZkaFF3RUhSNGZYSjlwZFVzQkRKUHBrS1AwSGI5U3lHbjJaWEIwOGFE?=
	=?utf-8?B?bW9JQ1pvMWJ1ZWphVDhwL2FaYVZqQlRXYWRmdUNhcmhLQ2prdnh4b1R0OTRn?=
	=?utf-8?B?b1VqZExIZzhpR2FzZDRFaHFCd1hZelBHRDNVdjhvUGdNcUp3VHVKNEo4SElv?=
	=?utf-8?Q?GweoQV3pSriHzPrbNJ1rfU5ayiEvKI95u9LY/JU?=
X-Microsoft-Antispam-Message-Info: +piXnjMA8pp1eCsLxaDghLFGSEEIYnqVmGJTac2QiUJznP6ujenvHBcPP8Q2pC9BFIbg8b4RcZJ1srYuiGCLypRN4KCX2xn1l+VE+GHKDHAWAkJ21E6J42hRas35WEHqEwmxbS5RTRnniXZKF0kPoDhkX7zixgE13E04XYqWXyK36ZLXnQY7dR+XUMOmSoM2RLm/hFOTqrc6cOYa3IdI+nYInK+3BNZ9EzHh3EkUXchsUz+l9nkUmyyKuRurm3LFH1qg1kA7b2toKlBrYOk21HCyKcoo2Rg8/Xm73bhGCVKXczR7+lh4NZBLvi2r/cEd0L6tDFgDn/4H8YIQQZ6om/MmOJu0SACwfCUo8Ubq4y8=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2673;
	6:RK+i1HCyCAscWilkknsoXbUVYE0Igg39gti6BL3uzScC2FMR1J1uQ5KcTY+nL6DBbyTJ2Pf1H2RcNJHHjCddGGrNIHTfqUYaLLDRcUGCIGhDqqDZd1tCoOyXdvGKrMbJM5ze/nLqCJJmMG2AkgM/5hUFRMwFOHKr6aySdq2TuZKv5JRWyjZMCFDodjYKsF6S14a/CGp/PlV2zqNiiavHZeJB/heCfw8P+aJx3fAHgekJHWNkIfy3E69P/FZfXPPNhEaeoSsqmXK8CGyKgkLOvvGmIIYxOhnODwgVllrvi0alvpzlyupapvBnAw7ZTAhmuZj8UyycXJhMXu0KNS299Auk52iHkxir5mnZgzISv/9Sm62UjsShG/yF7d8MOGJaqpm1xw7medg7eP7R90FNcf3GbLjVxDUVqiP1RZwpqIrUv35BtheOtOgIKDM9fVRxFJoKlZV+alCVQZGPl57S0w==;
	5:hrOjByO3069zQXLTMaaVMoO4271qWtX+kE+CQsxg1YxDxNpohsBc33kLRsRMeF7gRtKHvcB4T60afBeDznO2zwkRX7MIYRJkwzD1lnd/selQP2+L7Ozq6c2abi52v3r395AYLAEQiVQc7Qx4KTyTr0euNqVCYAkNkBGrc8LI10M=;
	7:UGLNNG2YmLdpO8uhttDl8o60GEOipx0SbINEAS/FBVZuBvE3cJYfV13yBdeU2TNZl+NULaVlsv6n50owdAXKvhvWGfCByeWXzEQfWI8QJk3Bn4GU66IFVZj/R9PypJSwKu1M7CHSR/7o41fQszUcceLNqum9Dn7mDCpJ8CC+Lm5R2gO43BL6ntIV2WACsNBOBcDzYI4G2JXXnBHdV68bIXeB/yXJjFMstz7JT4kLPHdHS2+ae3g9gAMCepqwTvcx
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2018 00:14:09.3912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fac016-ed98-4986-18c1-08d60f9fd6de
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2673
Subject: Re: [PATCH] terminal.bbclass: use var-SHELL as the shebang of wrapper script
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
X-List-Received-Date: Sat, 01 Sep 2018 00:14:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Hongxu,


On 08/24/2018 01:54 AM, Hongxu Jia wrote:
> The devshell.bbclass set var-SHELL to var-DEVSHELL, and terminal.bbclass
> initial var-SHELL with `bash'. Keep sync with it, use var-SHELL rather
> than hardcoded `/bin/sh' as the shebang of wrapper script.
>
> On Ubuntu host, default shell is dash (/bin/sh -> dash), even though
> we assign var-SHELL with `/bin/bash', the wrapper script is still dashism.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/classes/terminal.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
> index a27e10c..73e765d 100644
> --- a/meta/classes/terminal.bbclass
> +++ b/meta/classes/terminal.bbclass
> @@ -25,7 +25,8 @@ def emit_terminal_func(command, envdata, d):
>       bb.utils.mkdirhier(os.path.dirname(runfile))
>   
>       with open(runfile, 'w') as script:
> -        script.write('#!/bin/sh -e\n')
> +        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
> +        script.write('set -e\n')
This is causing a bug on several systems, I believe that it is because 
the way our systems are set up,
basically, our running shell isn't necessarily $SHELL, so it is causing 
the process to exit immediately,
anything thats using this class is affected, devshell, menuconfig, etc.


$ echo $SHELL
/bin/csh

$ echo $0
/bin/bash



Sadly we are unable to set $SHELL correctly.

I wonder if there is another way of doing this that wouldn't cause this 
behavior.

Cheers,

Alejandro


>           bb.data.emit_func(cmd_func, script, envdata)
>           script.write(cmd_func)
>           script.write("\n")


