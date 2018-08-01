Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0084.outbound.protection.outlook.com [104.47.33.84])
	by mail.openembedded.org (Postfix) with ESMTP id 64E9978AA7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 01:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y0m/nDnbPhLnwm4JcMTLaio3FCKDMjDOBQ5L5Rwkn34=;
	b=YfciZEMrQgTSahHkv6Npz7BKkiGqF77qfNFE+Pl4qdf0q7pnjXe18/ZW8otqoZvuhwZfHOx2VeD4WRAbKeXeS+GqI0hvsbg3/0lemJJhuloyw+Ct0DuFTjV4HKu214Q5LdZdYXJk+Ea1KJaiTR1o//lZKl6fAGBuZQHTq1jLzx4=
Received: from SN4PR0201CA0020.namprd02.prod.outlook.com
	(2603:10b6:803:2b::30) by DM6PR02MB4457.namprd02.prod.outlook.com
	(2603:10b6:5:29::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1017.15;
	Wed, 1 Aug 2018 23:33:14 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0020.outlook.office365.com
	(2603:10b6:803:2b::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1017.14 via
	Frontend Transport; Wed, 1 Aug 2018 23:33:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Wed, 1 Aug 2018 23:33:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46696
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fl0cB-0005KM-0t; Wed, 01 Aug 2018 16:33:11 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fl0c5-0002jN-TS; Wed, 01 Aug 2018 16:33:05 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fl0bw-0002f6-NJ; Wed, 01 Aug 2018 16:32:56 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>
	<72c0ba68-7fa5-2e3a-a554-e79bff93a00b@gmail.com>
	<2d0aedb8-fdb0-ad21-bdcc-e82f352570c3@xilinx.com>
	<db5cccef2f1ef458bb19d54fc03c7ce50de6ebeb.camel@linuxfoundation.org>
	<CAMKF1srz1dV8X-MP4si_DLd7esNpvynhSP_h-JOyK=mYABb35g@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <ecf401ce-e491-9c4f-8f15-d686f499152c@xilinx.com>
Date: Wed, 1 Aug 2018 16:32:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srz1dV8X-MP4si_DLd7esNpvynhSP_h-JOyK=mYABb35g@mail.gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(438002)(199004)(189003)(65826007)(446003)(426003)(11346002)(4326008)(5660300001)(31686004)(236005)(8936002)(2906002)(8676002)(81166006)(81156014)(270700001)(54896002)(106002)(356003)(336012)(84326002)(6246003)(76176011)(33964004)(39060400002)(229853002)(53546011)(37036004)(93886005)(186003)(63266004)(110136005)(64126003)(36386004)(58126008)(9786002)(476003)(2616005)(77096007)(478600001)(54906003)(126002)(486006)(36756003)(106466001)(316002)(16586007)(31696002)(26005)(65956001)(65806001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4457; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT046;
	1:v/uivD0oLDYytPYp/b6zX+jcqnTKA9pFkA0oESsiB/mfttsydh/Y00unelodqGA2XY0gIKXCeDINP6P8+bnWNolj98iWTm2F+5lkBzB71aEx/UVTraxZnPvVEC/RWGCG
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c25e31d8-33ca-456f-d020-08d5f8072667
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM6PR02MB4457; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4457;
	3:xzj9UsA+7fT+xL6qeTx70eaQnbzG00/NJtv8/BLG8U90vshGWEp0+KBOyvZAXy/yQg36a8PSDY701nYP8BgF/AJVgYD0+UZOXKk5giWlV+3gQGEEODJbc7C2zNH3CPTU1IFV5x9JobBP5JtTzDJ7v6MmFqOol/kh2GJOw0JG1g9ftupLtjMGRkXudMcCQs5gZHWSdM064EaJNHt6k4uJfOMVsVqvad8j2zSs3pzF7h+zxetG3LJlfIU6j3ctFPyXFJl8Q7hNlr4yQgMnJYq3mSUrsVcVx3MFL26b43y9dV1G/D1snQvcvUmpUKx6YKqSnFhSYSwSFSV/rHK5p+DIgGxY0ZtCKnpd5FUN8V1wZPg=;
	25:MySg1HxSUVJRw2gYd12V14LiIeJm9YC4bFKR7mImokI/uDxefpl7mVM1YOcLX750sMbwcbgc0ue34eOM98AJO7p9C1yYOC2cuFZZCkNDmLaLeKXMoGNRqFD4ry9GNd2DyiWJPZpqOCwPU6ylMJhTaVqKNBtH0guoU/vOUvDpzz3SnoBBGcuCh3LruQhlPl+dL1GQGY8UWLUQZ6S2p31u1nPEu9jicp4PjCcPQrdoz2oz8iR4mBYq3JrsIdQkt4YJLGiJ1M1RYL/JjaUh33FLoA2cHjMgh7QQrRQ7MyzHOaArwr6vEul0HFU2u1SpPg5HU1kD8TVtUQNKWWSACbm1SQ==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4457:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4457;
	31:BORM1IM3xrlrmybFipvBRpicQj0MHmgtRc8IhY+1281lyCkyNvlpMVrhNMexkQDrSDX1VsZpToDhzziLNHSbuFf3bk2KEJkWWZnaRj7ThVGgC2J4AX2jYSBf5y36S9H2tbFI4sy9h0et5gFPWfkRzaoZNzoQpjYfn4iUp3kFzH9vBm19b+E9Tcyv7S9lPNOPgF77d0o693PXi9CmfFnLsqasBEC9y1PQqy5RMsPgMfA=;
	20:wh3e49wlzLBkVyk0BVNcSwWQEFO08phrRkQrd2yTkKkNBmXuaT+W0x/J5OyrSrVIVaVyFLUjZYqWyxlwmCmWwCRyZFKqRWJx3jTSaP16Hhsc4LjzRl3ogKYmk6+cSskSLcSgkdwEKJmVAllijYdU2CqseyLAIqiMJGmTDUarQEx6qGAD/1tdj3T6UF5eLIs+9UNtUF5avr6zEjCF4Xd8bvmCI1wOoO0CMhRk09RKA+gU/dgjteUAC0CQ7NvN7+WEON4EdlHxHGxwq6cbeR9DROxSJAoqR+VlyPWvpuRQ607C0iSRaWIc5CVCK9Yi9obLtXRx5fITqqQkAI28nzzL8t8ZNdZigz2Q0+rknkZSiY0jUsA1SbTzAKCe2ExtUPjKSzBRwexLXbvRYx6oeOUTXXfkkSCHez7IUs+pFtQRKtFv+sre8kPn10aBmO1om7S19l2n4U9DQxr/SpJz5HNRvJnfYsZeGisD3aMpwhyz5XycRSpFTEem31seP/KHLd92
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB445712A6330AF02A60D50A62AC2D0@DM6PR02MB4457.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3231311)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DM6PR02MB4457; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4457; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4457;
	4:6Y7p//4SQ5JLnLJ9JZWRBudlQZ8GXJ3isJt5HLkebcbdH9ubd9ERzSbxSj9T5ghpNT3Bgzpmn8nC83lpSfhOE52rgHTED+u5UO1hnpYdJ541YqUWV6bgR1cM2Rqe/ZcfYZrm/gOTV6dZYih75Y0UVIPhu2TpF4wRnPCRP+VbxinLxznQz+kQNloQG7sjQdvDTUe/1qJYDhZI0GDfXPi+SSUWvM0kQuyccOY3yT8+wrSvDb5lHoJlhgN3axP20HZS6s2zpMjYkr7JOpof8FASeob1WPZQuqTm43J5ut+YXxBHrsIykr6MUw/JHcBMP8NV
X-Forefront-PRVS: 0751474A44
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4457;
	23:2B5f01w7EdytYy6OACgx60JGML9X/IN8v+tKkvoXY?=
	=?us-ascii?Q?5/fMdof85dm2uKfIQCe/jpp4Sclx5awcgE/pVtCW7R0226jGV3wmkDWBZfSd?=
	=?us-ascii?Q?pbXUxxiU6pGco3EaTjTLZVqm3hdmAGnNKoHdh2rurNuS+tN+zzpfIlAzrK7B?=
	=?us-ascii?Q?sbh7zqqHUV3YzkX64m0IZTJw2MVOVkQWdcLNMkqsmHWtGB51og05tuElviNr?=
	=?us-ascii?Q?a80wQ9nO1MItsdfnobSeTJN603ftr2fQrssVfgVFMsc+xWTmzBBwSx4LL1HV?=
	=?us-ascii?Q?U7hYbdvDJ6SryXkheCvX44VHTHzOeZMYmvwWsEGfnRFzL4lYZyScWiLHG+NC?=
	=?us-ascii?Q?5/fQIlwFipcmRaNiaHoj0yahtNAHl28A8kzTe5d+Oa8Ba2yVwUUrJsyUZODY?=
	=?us-ascii?Q?Wo1BRByva5I5YihMVa5VF7tfm/4J+MYa8K/ZlEUIxBHYafgTurNFnW7Agd5+?=
	=?us-ascii?Q?Z0FOkiFkhYUF6TT3/3T6nlqwlmiZu+8JwPdtPssLq41SjVB4xoP0dtNEX55a?=
	=?us-ascii?Q?anWzPvFx/FsCHkRGERzLAZOcdyeaF9XiARGHx8afIrB3wx2a2gztfHmaFQEH?=
	=?us-ascii?Q?v/JRoqzzc82w6raQMEooL55QzrhU3F/i/1BdyyRXjBLpyQzT2QuXGw7/w2wl?=
	=?us-ascii?Q?sTFCblqrk3Vu0+Rzob9I8VrzF4bGjliL3pSKI88jkzAOEtxIxxwhRx6E2i08?=
	=?us-ascii?Q?tvKC6xCloEonr6MdryjvMCDs5zOIoLfQ+tOckB5JSty4PphYc6URS2PdfojC?=
	=?us-ascii?Q?wBgKUFMvj9p7EhHij5sLLu7O2d2OeGvUhhQu2g1xHX0MyQFBR465NS+ELeA9?=
	=?us-ascii?Q?cQvwNGGZTp8jNGkrjJccIa3uMqixU3o72bbGaFitGmRh7V+MPkKQ9mn6tG+G?=
	=?us-ascii?Q?LeuEmbCIptGn+zQZw6Vv3uzOlm4cVme5JZaMRcIOQIrYg8XCQ6ibs6MVzp2w?=
	=?us-ascii?Q?L+TIPTZVhFmRUtZoYiM0rJiXKcgo/USnMiiA718cwDGLBj0yIPrl3z9fzCuk?=
	=?us-ascii?Q?Oj4FI557OKQq97wS+2xUX1/4pIqmteRMMjKpz2XHzTYTQ645x+goFlZHLYNL?=
	=?us-ascii?Q?MH/a+DFiMuAJUSp0mtU/MalHhYggPr753ZShK4mYS/QZN+UeJHaQVVKYJztZ?=
	=?us-ascii?Q?ZS6n97eHMFpArjX6WerjKuU78MSWpQAxyZvc4wrCTvorSisFr7Ktanc2At8z?=
	=?us-ascii?Q?fvmOlywIsDvIaDU05UnTn2oo6MLeNXJ5KkhrWvet1wfxhbnqWZqwDvkBI1Dq?=
	=?us-ascii?Q?H+gswNVHXjX9dgcQP5puPu0S64+0sW+Bj0Y1XhhpBpwRUtGvMfgQS6f+y5yA?=
	=?us-ascii?Q?FKOmtqC9o1zTlOY0kCYa0OHElST71PcMKSwdLi4rPCR?=
X-Microsoft-Antispam-Message-Info: dKEw1R7bZNY8n/ie7vlDZ0yr1hcRAyWPPfcHyKVz5WiFjmjgryQR9/zuBvGEmtfXhaz1Hg3qh0SgW+hx/dSEJLryB8QW6RzCb391OK1swpjdPZouhTW+hDoAvjHJ/iI/UR0cHH2TUGkeppbA4Uo7WgWBXGnkhj8mYrTF8S5uTdrXrH+sJwLsi6qJe5m7tTYk9wg0rRBK4nupgrzwm+oWXm9H4fGLuXtz7VWdWl825g1i+FDNjEJrLSQZzetnVgRX2EvQgP9gWsZFrK2VnvaR1WkAWB92nyV1jdJA23lMinkpGhP2XPqe8U7mMkK/4icn0oOk5V7wNBdJWRPf66D0+LLrTUsitzUYo5GZwn9LsL4=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4457;
	6:T5ycnj+4DazrBSfjo0vD/mHNYw1k+abKa5nTTo/J3v6N3tHHn1FA12usp6mJVLlneq0Rj7KATE6NfTw8uJDhqTIewpds1lCJazuZFi8W6M2VO+zh/nBVlZG5UDUQcq4sEEHIAVixw14dbMCngK2T0F0qyNNeBLU8hfJ8sODx/SWSDroHIgJntCB42D0L/nrcH3JL/0y03jxgLqIUOa0Z85xI2FR2t7EsReRg1b0MUX7BzM5gnUUxhcPsHfbw3eRNJ6tcko/7PBUBBdly4gtPPuhaLWXtd3RA5a5qHQcHau65j4ozCJdyF7IbuUuCWsBn3eLbkhkJ4Ic2tXuoo96qqdf7lriTDaKwnrcxR1ZCKmnC1yUeLrSuSgrIgv+lUkpaFdY0FD8HBchLqBVF6SH7i+y/OAcUW73fyvvo0F1oXZ79P7owJ1hKhySXIwT2AeRiPgB8I4908zhmsgDikbxJtw==;
	5:aVIkMzuymQQc4uvgN5qEWWqqG7HYWKkOQAXeNdTYLdQlbMc7MroyJTKQ+R97J2mjzhBG0dLrunY3YEEnoCp1jdMEnyO1lYhplVdM9315Yj6KsoUByfjle6cpgxFrZfGvj8yAnCm8hfuuWUteMz3Dj2AbjyQXsl+SX2w5T5ulMWo=;
	7:FdXH0JdnkoZIz6iQhEhTHPrZBvis+gCWkf2NsakxhhR+DCanFTnI0dYZNAJfvk8vJ6LnN1UDV5CsN80RMl685/sZZAXVeyuRquBfex3kcc64bqB7drfuUOg3KMPdkUNFDHIXC8rXADE+7suaZ0YA/Qna5dkN6DuNH2DQ+ft/rtnAosq3ZQhOKKYLhAWT4witdblngwRNC6z45mI+vjSayRdS/O+/A56QPtWGnHumqaEyv8BjqROMth3wq9q6fyDx
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2018 23:33:11.8871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c25e31d8-33ca-456f-d020-08d5f8072667
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4457
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] multiconfig: Enable multiconfig dependencies on oe-core
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
X-List-Received-Date: Thu, 02 Aug 2018 01:05:15 -0000
Content-Type: multipart/alternative;
	boundary="------------0A708DCEA340907C00799245"
Content-Language: en-US

--------------0A708DCEA340907C00799245
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Khem, Richard,


On 08/01/2018 10:44 AM, Khem Raj wrote:
>
>
> On Tue, Jul 31, 2018 at 4:59 AM Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Mon, 2018-07-30 at 15:05 -0700, Alejandro Enedino Hernandez
>     Samaniego wrote:
>     > On 07/26/2018 08:36 PM, Khem Raj wrote:
>     > >
>     > > On 7/25/18 9:05 AM, Alejandro Enedino Hernandez Samaniego wrote:
>     > > > This patch enables multiconfig dependencies (mcdepends) to be
>     > > > used on
>     > > > recipes using the following format:
>     > > >
>     > > > task[mcdepends] = "multiconfig:FROM-MC:TO-MC:PN:task-to-depend-
>     > > > on"
>     > > >
>     > > > For the sake of simplicity consider the following example:
>     > > >
>     > > > Assuming we have set up multiconfig builds, one for qemux86 and
>     > > > one for
>     > > > qemuarm, named x86 and arm respectively.
>     > > >
>     > > > Adding the following line to an image recipe (core-image-sato):
>     > > > do_image[mcdepends] = "multiconfig:x86:arm:core-image-
>     > > > minimal:do_rootfs"
>     > > >
>     > >
>     > > Do we really need to add multiconfig to keyword namespace ? can we
>     > > deduce this from "arch1:arch2:..."
>     >
>     > Bitbake already uses this and I believed adopting it would make it
>     > easier for the user to understand its usage.
>     >
>     > For example, since the multiconfig names are also provided during
>     > setup, if you assume that someone set up the build and a different
>     > user is going through the recipe, arch1:arch2 wouldn't mean a
>     lot for
>     > that user because they may not map 1:1 to MACHINE names.
>
>     It is consistent with the rest of the system. I'm still torn on
>     whether
>     we should shorten "multiconfig:" to "mc:" but we need to be
>     consistent.
>
>
> Given a choice I would suggest for using multiconfig for lesser chance 
> of conflicts
I also agree here that its better to use multiconfig.
>
>
>     > > secondy, this need to be well documented, with examples for users
>     >
>     > I agree we could add more documentation to it, where do you
>     think it
>     > should go?
>
>     I'm going to queue the patches for testing in -next, they look good to
>     me just reading the patches.
>
>     Could you start to work with Scott (cc'd) to get this new dependency
>     type listed in the bitbake manual and anywhere else it needs to be
>     documented?
>
Sure, I'll sync with Scott

Thanks!,

Alejandro
>
>
>     Its great to see this finally working!
>
>     Cheers,
>
>     Richard
>


--------------0A708DCEA340907C00799245
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Khem, Richard,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08/01/2018 10:44 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1srz1dV8X-MP4si_DLd7esNpvynhSP_h-JOyK=mYABb35g@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr">On Tue, Jul 31, 2018 at 4:59 AM Richard Purdie
            &lt;<a href="mailto:richard.purdie@linuxfoundation.org"
              moz-do-not-send="true">richard.purdie@linuxfoundation.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon,
            2018-07-30 at 15:05 -0700, Alejandro Enedino Hernandez<br>
            Samaniego wrote:<br>
            &gt; On 07/26/2018 08:36 PM, Khem Raj wrote:<br>
            &gt; &gt; <br>
            &gt; &gt; On 7/25/18 9:05 AM, Alejandro Enedino Hernandez
            Samaniego wrote:<br>
            &gt; &gt; &gt; This patch enables multiconfig dependencies
            (mcdepends) to be<br>
            &gt; &gt; &gt; used on<br>
            &gt; &gt; &gt; recipes using the following format:<br>
            &gt; &gt; &gt; <br>
            &gt; &gt; &gt; task[mcdepends] =
            "multiconfig:FROM-MC:TO-MC:PN:task-to-depend-<br>
            &gt; &gt; &gt; on"<br>
            &gt; &gt; &gt; <br>
            &gt; &gt; &gt; For the sake of simplicity consider the
            following example:<br>
            &gt; &gt; &gt; <br>
            &gt; &gt; &gt; Assuming we have set up multiconfig builds,
            one for qemux86 and<br>
            &gt; &gt; &gt; one for<br>
            &gt; &gt; &gt; qemuarm, named x86 and arm respectively.<br>
            &gt; &gt; &gt; <br>
            &gt; &gt; &gt; Adding the following line to an image recipe
            (core-image-sato):<br>
            &gt; &gt; &gt; do_image[mcdepends] =
            "multiconfig:x86:arm:core-image-<br>
            &gt; &gt; &gt; minimal:do_rootfs"<br>
            &gt; &gt; &gt; <br>
            &gt; &gt; <br>
            &gt; &gt; Do we really need to add multiconfig to keyword
            namespace ? can we<br>
            &gt; &gt; deduce this from "arch1:arch2:..."<br>
            &gt; <br>
            &gt; Bitbake already uses this and I believed adopting it
            would make it <br>
            &gt; easier for the user to understand its usage.<br>
            &gt;<br>
            &gt; For example, since the multiconfig names are also
            provided during<br>
            &gt; setup, if you assume that someone set up the build and
            a different<br>
            &gt; user is going through the recipe, arch1:arch2 wouldn't
            mean a lot for<br>
            &gt; that user because they may not map 1:1 to MACHINE
            names.<br>
            <br>
            It is consistent with the rest of the system. I'm still torn
            on whether<br>
            we should shorten "multiconfig:" to "mc:" but we need to be
            consistent.<br>
          </blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Given a choice I would suggest for using
            multiconfig for lesser chance of conflicts <br>
          </div>
        </div>
      </div>
    </blockquote>
    I also agree here that its better to use multiconfig.<br>
    <blockquote type="cite"
cite="mid:CAMKF1srz1dV8X-MP4si_DLd7esNpvynhSP_h-JOyK=mYABb35g@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            &gt; &gt; secondy, this need to be well documented, with
            examples for users<br>
            &gt; <br>
            &gt; I agree we could add more documentation to it, where do
            you think it <br>
            &gt; should go?<br>
            <br>
            I'm going to queue the patches for testing in -next, they
            look good to<br>
            me just reading the patches.<br>
            <br>
            Could you start to work with Scott (cc'd) to get this new
            dependency<br>
            type listed in the bitbake manual and anywhere else it needs
            to be<br>
            documented?<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    Sure, I'll sync with Scott<br>
    <br>
    Thanks!,<br>
    <br>
    Alejandro<br>
    <blockquote type="cite"
cite="mid:CAMKF1srz1dV8X-MP4si_DLd7esNpvynhSP_h-JOyK=mYABb35g@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <br>
            Its great to see this finally working!<br>
            <br>
            Cheers,<br>
            <br>
            Richard<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------0A708DCEA340907C00799245--
