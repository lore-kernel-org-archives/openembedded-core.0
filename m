Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0059.outbound.protection.outlook.com [104.47.38.59])
	by mail.openembedded.org (Postfix) with ESMTP id 288C77016E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BrRWhXI2/xnQcmjtKb9UWYvVS767ROVutrvPL+VKVmU=;
	b=L5RZapRqp//BeZGDiDkTOU1EQNjB8/tmKzay5KFJa/SjE2VVoys2YdWvf9azeVJgA9TyimOk0XM3mNAA+TrRq7UbNDuRTPusSDBEZLwqtK2wTk74kysZBSNxby8N2sCLxUcSy+FCOvYfhEGqRjusQdyN4Exv9WbxFzCtxUWCstY=
Received: from BN6PR02CA0051.namprd02.prod.outlook.com (10.175.94.141) by
	BY1PR02MB1145.namprd02.prod.outlook.com (10.162.108.147) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.13; Tue, 30 Aug 2016 20:58:46 +0000
Received: from CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by BN6PR02CA0051.outlook.office365.com
	(2603:10b6:404:f9::13) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.587.13 via
	Frontend Transport; Tue, 30 Aug 2016 20:58:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; cambrionix.com; dkim=none (message not signed)
	header.d=none;cambrionix.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT037.mail.protection.outlook.com (10.152.75.77) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 30 Aug 2016 20:58:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1beq7G-0000fr-Dc; Tue, 30 Aug 2016 13:58:42 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1beq7I-0006vm-6E; Tue, 30 Aug 2016 13:58:44 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7UKwgTv004878; Tue, 30 Aug 2016 13:58:43 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1beq7G-0006vj-Op; Tue, 30 Aug 2016 13:58:42 -0700
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cf64ae59ea584fb18975ca5f33464981@SEHSTE15D2BE2.hs20.net>
	<CAJTo0LbYUFLWAhiM+WF3dYzrcLksTLDCQUDqDVr4w0m9050jdA@mail.gmail.com>
	<e0328689f1a4439a97564d4e2620da53@THHSTE15D2BE2.hs20.net>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <b79f5b71-f8eb-d466-fe5a-ca2d460b6169@xilinx.com>
Date: Tue, 30 Aug 2016 13:55:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <e0328689f1a4439a97564d4e2620da53@THHSTE15D2BE2.hs20.net>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22544.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(24454002)(199003)(377454003)(53754006)(189002)(586003)(54356999)(63266004)(86362001)(106466001)(50466002)(31686004)(7846002)(65806001)(2870700001)(19580395003)(65826007)(87936001)(64126003)(33646002)(50986999)(77096005)(8936002)(83506001)(81166006)(8676002)(36756003)(356003)(15975445007)(11100500001)(4001350100001)(2950100001)(47776003)(65956001)(23746002)(81156014)(5660300001)(305945005)(92566002)(5001770100001)(189998001)(76176999)(2906002)(4326007)(9786002)(626004)(31696002)(19580405001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR02MB1145; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT037;
	1:G0RobX7WdaeatS6CXXrCx4Vx7m00lW0073QR7TrudUap6cG9rLzxhFDqGBVWJa4o4T5rO29uhbBHrS96oMtDwke4GtX7qo6ilPE1vUEA8zTv9ZeytgLBbIT+Hkt9XQeNN+We0cfStYXQxi1zr8LBpQcpWzSLnmMco3cXjMUUOv/OQ21dhSYl+/5bVJdb+eJPv6RLnCZAC/dneNDL0H+4v/NhkRQyIsr+OtHM9Vxk5jozZtp0PfqvdONn+Un4adx3vA9IF19cSSrRAjs/i8jV39RldPsTRf0WA+23Esb3gJ7Dc9pLmyryrv6Mf0zhSjqxUjB/ZX5a7vKJjn2g2HaHdBXaGe5L9ZkY8AZxXJYe6q/QI4ixHcGCznIJjZ0Ok25HW0uklhSX4Xv+CfwzwTCBS5LFPWUinxAPQjrbcGPJBB4tkOXVakjuNHXv8lpOdQt1lrnTQMVjAV6TYgiMQG1twmajD2XnVfuLI4/7Ob+Lltxg5laHCK3JmC4lBFS+eAmU18wP1yRj1mtSzrNz/mfqfHnpdxGlPGrB2GSvjoW7j5iNcm7KJ+vXOKP8pGj206J4A/0vx3/sDucgSsRFkampkVkJa9sZomLOKT9W8T0SDNo=
X-MS-Office365-Filtering-Correlation-Id: 950011f7-f5f5-4888-3039-08d3d1186e64
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1145;
	2:qvAR+z0s7O9Es3ps/elPPSA/+K5m43S/W7ubj/HeQ9x7/wVZ88JYsN3itrRExYHj04B2pAs2a37IOrOHr3pB24vZMUuvGef58JCGzQRq8wj4DpkoeHrcZ44O07utkHR8A+X7UJmEa72JsOyHZ3YRtw9Fp6gaB2p04TjFxR5D54WKVVVAdRiw4thtIa5eoLPl;
	3:GY8giiwtZ/gIvQlauUnHBzbJHboUFZVJGVszHuwzre12hQtFwWCHyODaTiyENulsB8LmCT7yKw8HrSGHUdzLoyU015BTVuFWGElOqt/NDRub0DCejeGzJBU5CkAkN7RvmH5ejGd43RQlcgsTr6xKhgY7Zo+7bKUxH2vbApmx3CkdWOJKtagk7kWRvgvtYLAvLh5Zj9p6ppatudf9+Vtx0RxEKC9vycUAvsVmcaHXnDEdGqdWWsNf89Q8YQ0pZPtgHHpsqnqYIFi2EKl1Uw0sQA==;
	25:RhWdaBagX/a751bAtpHZxvfRwFNVk6KVJsWW7k4Wu7I6m7QWXLNtmn3xE/TGAEA8WOglWIMztU7g5iUKOwreHtTXo+XV/UfPbZ6+RZJAcpH676Sqc7A1cGbq+DL2o+e4dMWBZCrXt0EJC2BgnHCA3Baw1mamVLU43sYIY3uAESjvC5EaGHwiGNoFG7/Mk7+QhVnhf0sRoLfGSHKZENzKtgnZ2TVVTDK93Ms3cpvWx17t4l9nYcyar5r9t+iLHK9e9HfIBfCVWe56V3m2b/PIM/Xgl7bKxOaVJICB0/3sgTDlApnt1+00VZEB2RVksBHSl9FK8yCdSVVZLb8PHS/SbXU7OwRg8IdIoq6GouReS+2sGgjcn8CKQGgiZvZvcLHQK0Ec9vh+gBTJfo0Nds+ByulkfPbRTgpliPr5Drnb7qg=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BY1PR02MB1145; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1145;
	31:EKeLAj2gx1VtN3xXtSvzwduz0dV6p4ZEzl8nXDvaKc73nqNQ4YWM3OnpiTpYaZTlKvsza0Y6LDXqP/APiz9vZGtcuSERfFAHxW82UDHEF/k5Cn6EcuNQm1W+1fCH+W/Nsu73M0RKQ5Pv+nj4exJ/Ii3zbpSxfgx3tTIIGkaGqfo0HZzsADW53LWFp7RTtXpVICJhXdKa5YaNCVm+p62UzJaWVBakaiwx3SKM4iUYpPw=;
	20:z22Elt55FVQif3MCdeR7VNhahXadvE4Wh23pz1xzudnkjFUEwS3kReJToJa5K8N8w5TqWBrnAwj3mE/wXQDnsYoi/iwLeY3pj4Rb0P6Kft3YsBZQO8iVf0niT1RRkJefkFoReK/2bSKM9SZMK+/UnwmBR7u4mZmKRuA+0v5MVF1K1otp9wKEasjlmn/T9TR/M9eN3v7DZBGPuWHW2DfQbqBknG4vVmi2ZZMbfEClS5583bhhg46DyTOVnKmLpNP/Pj83z86nfZICPoO6G2b1C6MVPkAyqP1Wip4TjUVgHmzB7rsLMiXA/XRDh67b22Wdtc8LiL/jrlTF7UBp5IqvqGkHVcI8MiL2MhkIkOfoUxEdwdbYMKjcEmPAddltrje3bcXsG5FiLLpFIV8vMT9Phw7hyga5x5VeLqIEW1+Wohry0rGXtbncQ7NwD0RZ9Xya/fTPgrhetS1dLk91rL7vdhH5GVt706JxKTCmY1QNJNP8YTji5W1A91ruzLBOQapj
X-Microsoft-Antispam-PRVS: <BY1PR02MB114519D7A1F3CE68BB997BE7C3E00@BY1PR02MB1145.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13023025)(13024025)(13018025)(13017025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BY1PR02MB1145; BCL:0; PCL:0; RULEID:; SRVR:BY1PR02MB1145; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1145;
	4:XYTvR8VVCKP7m4GchQgEid/g+Jsd00xkM+dcTRFGiPSpBcH1hV+vhI6Owfhu6/vpp1mViwAS98TdBvypy6mL1lKjh8fcWS7rFRCbfHt6pWIs6qpGq/sCChjYELeqcogj8pNW4o7mOL0ftxQUVGvFs2geuJ/t+zLYPiF/VINB7kfGLAR/oSPPazAxS3NUF53h28tGWgnxYT54UDJLwHurbAqsw1urhyWSH5UY+lZEj1LbNfU/MDQbW5LPkPAl/+y6VbEybSmr4AobqtDzPX0q0AHjgKx/W4WfrM03exR9PFBShcxUVYwi2J4wWIJnfa09kHlHQWmewZSlnzENM8v8mB42ySpJ0o4/ZhbjUG2DuTT5G0xAc/6uVhkbOGjFKR3AoomVdcuYazb9B+Hs2k3VDAWphTx854AQ/deiRWyfNs7Iw9FEzFo3vFBXch5VtWJioeIf64T6HwyhpmOtTkQ9/DFFBrpnW3jnd9Cp8FRQdGi9WKd5wcNo4/Xcjg6x/rUE3PIQ9ncvb7/7I/UGt017FOG2HrgtDtMzM5pWTc1Ubn0=
X-Forefront-PRVS: 0050CEFE70
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BY1PR02MB1145;
	23:RSP9lVhtWNdujKCwpqbdovUiJPg96scb+3PyS?=
	=?Windows-1252?Q?4+nBNG9LsRDqzVPknwrF9ZGT6ioQ8ikIYrvD1PVrezmoe03EffZrllNy?=
	=?Windows-1252?Q?loFokjsAGynq8fV87rvcU8FM48N1aqHmalugXyKog1qr1mkqrIGJnlVz?=
	=?Windows-1252?Q?OU5chdbsDHIXARH7EOAJzpqOY0FsFkiW3zFv2L8cT6KUYUXo946Arr/s?=
	=?Windows-1252?Q?op12sfWSvIICohGkHNjvAGBiA7jDDyB03py+waQI6yHAgL1busmnpxRr?=
	=?Windows-1252?Q?Mj4NZJ2WkqdBNX4Cy8LC3Jer/ZBaZYjooH9iNvXf5a0X3TZVHEqDlBvw?=
	=?Windows-1252?Q?c+AjICTD3U7HjlUXk8633BWFlGKfUnmgpKSdyHzZmaJE+w8pTEt+tyAX?=
	=?Windows-1252?Q?uFIjU4uxBZOP2bEiFwfDzVR+F+ZuRCnAmYg4uuzn6NpQ2nbp14HDjCGn?=
	=?Windows-1252?Q?QQ7qHtVktrNKwmv4sbw/hh9iHr/WD6uYJu/JU+KJ3qeM0DlZzrkHv8Cg?=
	=?Windows-1252?Q?JZOqOBAXgeoUOiXs1+b0qETeBtn93qjKJsU23qh82uhuFq6eXz3i4UjZ?=
	=?Windows-1252?Q?cy00mnK5HYrf29ed7stisyNF552a88AKFE9FtgFPn9yQIegLbQiUqrd7?=
	=?Windows-1252?Q?+I+UbcqUXqJfrumlQp9Paimu1JQPQHHLg7Bd0c4F/Kic9jurqqexsJux?=
	=?Windows-1252?Q?2bcOc2PcclUpepHaBlR+jVYRJYGXaYAW1Vn/IgnYU9j+1zjNgxSkdJne?=
	=?Windows-1252?Q?aHfaOLKMj8QmK8vjhY8I46LZlLsVgWvzr0YOnCIFrEayDUomBefib57+?=
	=?Windows-1252?Q?y54abKs+7+s9c0Yb3qnvrN+rhElqDwSM/0akVrz62iKwoB4bHKX3jE6o?=
	=?Windows-1252?Q?zhI+3nh/0S1Z7BZfGvfb65JzzQjxdhK17ohSctuBHGTle26NqOcXq/Kg?=
	=?Windows-1252?Q?WVYRuyEVjzZ9GZQNXB13z2Vdoga2V7OMjzQLlo/HMyq5pR7Vu86Ses/V?=
	=?Windows-1252?Q?ySgYa0zi/LX5TwOjhGg2ZH4qiE/i+gS+UG2mqhzVrwhiXO9MD64emC7q?=
	=?Windows-1252?Q?1Ys/E1e0knNLKdGadL+KiGQTtE0NkDOZ/RTCnG0DXnC3mvNW594J2rxm?=
	=?Windows-1252?Q?QSVBlCzUjqa0CGEwSKTtD1pK9eSxPXDWdJ5IhnpOyNVlXWkUBbzRvBQP?=
	=?Windows-1252?Q?BRV1dEa1QLXXEWZjRlSQfh+VjMV3W+gEa83TG4O831YGdCpyE3HQP58b?=
	=?Windows-1252?Q?NA7DXUNIUbsx5j8lvq1/4p8lluLi57jt9R7oaiBtu6HEGnjLTeLA8Art?=
	=?Windows-1252?Q?DVAMSBYEcfp7DVbqTrirXCAYYqXiWy9n8C5OP2ozPDyDK159WkzmZZh1?=
	=?Windows-1252?Q?kviMNI3h6xhPU5E71z4LLGgy3OvhISjYw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1145;
	6:P5hQ5fgjUh3WjJQTwTUB84y5/q52iy1rh8chRyqvbreJgCw06W8PMG3vm5DJH3Ig3WnCD0gTwGtR3mHEuwCtgcdpxnlNU7iwg4XOcGu3Yx87nYBmMARYG7Cffj/839YjwcHiuuqWlHa1JZLoDUPk9uRQH+62Cw3+rn9REyOyzkBe5mr0GKLuO4AslV8c85FAwfCaWuhQIzaUwiJm/tZdXPB4DyffYiIxt8NXMmhQjLZpf0JZNKlb416087sS3JbS82UvE4nIowZ3auROg0MiUCddkzmjqxXebpNT1lcdwCrU0fPeRCLJgFWinVRXgWAPardWTAKpMA0MRaciXpz+eQ==;
	5:jUmqBNSbf5XtVb5woj6R7bQ0dT3Gs9BhQuWQp7mC9H1ihvrGhXr1lUKDzGljcaX1LqYkzWMk9LgrN7ldXNQMUK8XsYmA+NoYAIeqMSW5AYQ5gPnarzyRTzK13R2Roiip0i3eKMelJjsq6LJaVioKGw==;
	24:RK+XJ5ZYLiHL5FlAw+oocJSqxE9tDdRH0/5ybpC0zkhm0wLW+GlowE/udpLO4xIH2sKHcVjlTIIo6rAHIzBT039OHnENCziiyG8qYoZxdto=;
	7:oF0DRXjaH0QFYhiYtgyabg0TrD45alBwqtYwxPJSFSBYTJ0P/5/+HS8N9/QB7HcI5KgmbsLqlKB7bB2y2VHkjdK7zxPi7Ouljb7DA7k+mAPZ7HNUgh/9+Ak0Z/9aJH6YFLFqREtPcDmL5+jQ7D1xflcprlshmE10egGnuNydjXprVxRZ6G8N7OdiWdT5eDA8UM8GCYoyU+BOhFGNvwpRSfgW8UcdXZHsORImv0ZL/kfxPfyFOPIvicaGIsqD3JrG
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2016 20:58:44.8664 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR02MB1145
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build of u-boot with gold is broken
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
X-List-Received-Date: Tue, 30 Aug 2016 20:58:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

On 08/30/2016 02:57 AM, Andrew Goodbody wrote:
> *From:*Burton, Ross <ross.burton@intel.com>
>
> On 19 August 2016 at 10:33, Andrew Goodbody
> <andrew.goodbody@cambrionix.com <mailto:andrew.goodbody@cambrionix.com>>
> wrote:
>
>     The sed at line 70 fails as it is being executed in an empty build
>     directory and so there is no config.mk <http://config.mk>.
>
>
>
> For fame and glory, can you send a tested patch to fix this?
>
>
>
> Ross
>
>
> Sorry but I am not sure about the best way to fix this.
>
> Andrew
>
>
>
> PS This is a resend (with additions below) as I neglected to copy the
> list, sorry – I was out of the office at the time.
>
> It would be possible to simply cd into the source directory, apply the
> sed, then cd back to the build directory. However this seems to go
> against the point of having a separate build directory in that you are
> attempting to leave the source tree alone, or so I assume.
>
Can we do ${S}/config.mk ? Meaning
sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
I dont have a setup for gold linker, If you can send the instructions I 
will give it a try

Thanks
Manju

