Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 3614 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 21:57:27 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
	by mail.openembedded.org (Postfix) with ESMTP id 072F76C118
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OE2IJEIbxZgMWpPx1PYP+tSkuTabKrPy+Ln/B9lxXNY=;
	b=KhIyp2eUlu+00jj/SinmkFxuucOS5QY3rjpp3W7yz0DIN0/fZP1QCk5kORghCQ5Cp850XUf6cw29rBnDfPxNXlmL8fcZ5O279UOH8mjwunbpus3mpCMZ4BbttDW9tR1Cd+Oiyfj6jsJ20M20SwVDvSw6XK7PwEb4G6ESXVJ1OKA=
Received: from BL0PR02CA0056.namprd02.prod.outlook.com (2603:10b6:207:3d::33)
	by DM5PR0201MB3510.namprd02.prod.outlook.com (2603:10b6:4:77::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1382.22;
	Wed, 5 Dec 2018 17:26:31 +0000
Received: from BL2NAM02FT026.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by BL0PR02CA0056.outlook.office365.com
	(2603:10b6:207:3d::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1382.19 via
	Frontend Transport; Wed, 5 Dec 2018 17:26:31 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT026.mail.protection.outlook.com (10.152.77.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1404.17
	via Frontend Transport; Wed, 5 Dec 2018 17:26:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gUawP-0001jm-2W for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2018 09:26:29 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gUawJ-0007Eg-Vr for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2018 09:26:24 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wB5HQNOV004283 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 09:26:23 -0800
Received: from [10.23.116.151] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1gUawJ-0007EX-8D
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2018 09:26:23 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1543953282-1856-1-git-send-email-chandana.kalluri@xilinx.com>
	<1543953282-1856-4-git-send-email-chandana.kalluri@xilinx.com>
	<CAFNP8Ous2ZkGuxWQ=z3FyCOG39AGX4KGZF7FzUcztyKoCaNCoA@mail.gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <c62261e8-3db0-ac42-b5ff-1245d946647a@xilinx.com>
Date: Wed, 5 Dec 2018 09:26:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFNP8Ous2ZkGuxWQ=z3FyCOG39AGX4KGZF7FzUcztyKoCaNCoA@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(209900001)(189003)(199004)(8936002)(53386004)(478600001)(26005)(106002)(8676002)(4744004)(2906002)(53546011)(6666004)(81156014)(81166006)(356004)(6346003)(186003)(14444005)(65826007)(84326002)(71190400001)(65806001)(5660300001)(65956001)(77096007)(63266004)(2351001)(106466001)(36756003)(126002)(31696002)(229853002)(966005)(31686004)(9786002)(6916009)(236005)(54896002)(33964004)(64126003)(6306002)(486006)(336012)(58126008)(476003)(11346002)(2616005)(426003)(446003)(76176011)(606006)(37036004)(6246003)(316002)(16586007)(107986001)(2004002)(6606295002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3510;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT026;
	1:yeUKDW3H7LvVCi3fH9+SgfXIRzSFAC9f1cPwTyAuSb/TYqjsQCGWK4huKq3YVEH3xpO+7XQfYFqpZI9+LUM+9ZF+LeyOOEZwdTnyOqgL041SrTE3SnyIDadMHDXpb06h
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1033906d-d00c-4804-ee3f-08d65ad6cbaf
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM5PR0201MB3510; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3510;
	3:MW6A3NhwoCr2GFzowZk4+tBmgYTYB+V4Y3bZpxwa4P2jB8l0eOgmvaEAqswbrupoWct41E+QyShYJq7k0xE8sqZqkVsirfYoZ2TQ+nT1WGkJgqMfqsqzyG4nCY8nz9oKXMBpJ7IAhph9Un1Po+eAZv+x+nvSPqVe8kI3Vpsj9VNgM82IATl0iEnl5J1fY64f5oYbop3pOdKIlPb35i8Yd5ulznkZryT0R2oWRhIXW+eLszujdP3qV4hGuKaFK/OMhqIEUzu6b0rgOonPlZx+Gnxk49g5lEZM/gWbLHxKxuB+nz3QV2Nb/nX3Ij6Es1goAfmQexLSvjdT7HimvKftXf8oG7vNuxlVYu9z4y1tiDc=;
	25:n6wQa0/dKJsk04/m7+Pbz7t5kDQVozA+iQ4/9PxL1QqO5UxezsFPHQSrLrwjWzl3ImZojX6ESJEkEIbFLN4ihBt7Vci6x0uTCK2Ukhz79niPowhu4vmTakl/yli1KN8ZhmDwzrkpHfP/X+3vgwsArzIiu8ISs5J2NDsKRDLOl4g2T3FPyRgAg/rtHnh5wAnZzi0U4kTJcYYTOJPh7w+4Kovh1Dw7K19RWCVmeSGjDJYm6za2VELuEFFvpqc5Ptt0tJp+vGBwGknMTNh0qEXXNsxlqUBaHJ3dll686EwhC0CU+BgI7PUU1n04shoWaz6a1QreQvqtdmTzukVVhI4t6Q==
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3510:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3510;
	31:+CWXPd9Q4oSZbqLxCRFyHgj0Ejg0I6yS3K25x/wuU3cXNVI7tP8dq/ThXDrYJrwOGP/xJ0hlmARAb09nJYv/w68LcriMksO8lCe7ijNesU6v1aQwmSbco1XP+zzAvGLehYk/8bxF0PYb4xSDWZwmi3kIHB2q+v+YGpodc2sXbTKBIWlmm42MwzyiiJlgdtI9vkFeA2NjKIsmNJx3KIwk+H/QX/ROpVSSzSZMUxd9ZaA=;
	20:sHfUZckkQq0aFOeGcCz/L4AJ/9U5WjelXKAsr6qYEeH7HCG65jk/9MfUxZQFhradF6alTWA71X78xYduHFO6ITcRT08jQYMUeBs5Eut/AtJY2Ubgz2mwqTSpxu2iHpmBBFP44+qA2/i2nie75Z0Sb6UvIMPByvLgAu7Zi0XfTNvz5OBnBie0dVBJQ1kjIBhP2ODvUPaYisJCWlTF9ido7vM/vEtXSFTNfFCtq4UKwjb0LUk3KhsQN3oeEtEkEuV4beW1gSafRrP0XcjtaQPplUgeljzVX3g6lWwHGGcqLZuaPJ8qjuYyj1ammXzpYFVIShLDFJ+WkiZUoK+RkEzLf5//ymlIiBiqFX+sdegy5nzEwAR6TqSb+/Dw1LznJ8T0LYalERmvsY3BpN6BP469Ta0gC8QZMPOBQpiTh1WjgKGN8P1W5vjhvlmPBFtVv/7AdC+LRlPyUPz5ttvd87Xaqg/SPc2gZc+MwHddfC29+pBtLgN2zXUu4EWKpK2SJr4l
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3510C7AC9AA98191F073CCBEACA80@DM5PR0201MB3510.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231455)(999002)(944501520)(4982022)(52105112)(93006095)(93004095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM5PR0201MB3510; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0201MB3510; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3510;
	4:xL3zhBPgeFZur4FUfSgcMOOEeoj1O0sOaA40kUpawNBGQhHLyJ8qmKGWvlyE+nCWucK0ZWL2hcL9twAiExfrxd+00z2ly3j3Dfva6qg29VSR4+y5TKl6pffPmukUJrW8cepLmQMBenmwhB9r8EP7SM2uBEuFIxIRXAfGZdniKVqY0iMixGh43IClLxhtLlXU4TAOeT37A1+sfdnEuPY0FG1BC3oZ9LGm09Ey2oFHiA9Ek8VbUK5bF9s5pzIfHDP5jQdlcYupcJPpG5Cg829XeA==
X-Forefront-PRVS: 08770259B4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0201MB3510;
	23:ePP6Q3ViezFs7IMKt+HFpZRrigip3KuUHinIHB+?=
	=?us-ascii?Q?7Wd8CfdHO1JSZp9VoZD2WFOkb5iSUbH4Emck1F7s0EyHGkVfjGKxO90OPiSV?=
	=?us-ascii?Q?7/NBv+VulA0LeI0/wpS6p2JCQd3Ttl0LHuFWL4wyszRTip+PJAX/273M3IjH?=
	=?us-ascii?Q?qOrIDxBfSqTeeIz/JzguTvWC46YaC+7wSkYhAHIJBcIGflJ3uadDQNprwj4/?=
	=?us-ascii?Q?KSryhxg+xwF7HuYjLVkN7NdC1dVtg8jBzhW9yWa3G/2kfZJ1lJhBDKn0KuqV?=
	=?us-ascii?Q?mHU7GT34+V42zH3K4X04SP2iR4mmlJrOFCprAVY4L/m/TuBWBKPN6BHXZqhC?=
	=?us-ascii?Q?Xo0jStjZ9F/J2J1Cqmzbm0H1nxGx7sayzvDM4CwmIOZ7sBBLhMq+aGGQDkC+?=
	=?us-ascii?Q?fSn9bo6nKSChtupHu9ZPn430nkNXjKcVYX1q4dOoc5Nm41ctM7gWwfq13m52?=
	=?us-ascii?Q?g3VaZUSluIfH24MuV5aMkh5PfcPINNcVRBT0QcQaBmuZM+8bR2iRC6/coEFt?=
	=?us-ascii?Q?e2V4k/J1K8gciG/NleW36WwdleuAsDB+JIPmEzSKEK/H/GId8WkYa+5Bgaka?=
	=?us-ascii?Q?28K6P9fanUh/9gAogg8o0N3x9V0WPrckZfXwL0ZAEmkU+/1SpZlnPZfsIf8h?=
	=?us-ascii?Q?plr95111h7lG3fERS1gWAcATXRH5dQWVmEc0UkIl/mM3fmZhB0YsAtPn06Su?=
	=?us-ascii?Q?6TP1JMPg1V/Od+Px6HB9H/6PGJhcSiJOoEnXfzvZ1VdXmscXR2P8sMbjP0YZ?=
	=?us-ascii?Q?1xRHviF5ZUXv1yKHTRfEENECy3fN8F3Qtiv2wEbM5Q8zyLBoNSA1uy1p3tms?=
	=?us-ascii?Q?UreEHIdIrmlrmIvlwkXrg7+9o4wTeTKjs+WXpdfdefdS8lB23ow1TN9z4CeP?=
	=?us-ascii?Q?jVWlZ7f5MPk3TMM/FBqKxNmRPdFwQvjK93xHrCL1uTho/2+rnaOIW6oVLJCs?=
	=?us-ascii?Q?7mTj4grxXmKluGjNFNUKSg8VFDM36RL4CtI6/o9sVB5f1XwhhtX0xkur5nP3?=
	=?us-ascii?Q?aJSTR0NA4snl39e+yMwqO7tOAyIhxWgFlxZFWmYn9QIl4whNJs1k8z0IFvN/?=
	=?us-ascii?Q?sW5sYau4xQgUAq6OJHPutXzMrc1LqyGx4l+zyCVwPUkEN93uwg7aJFNzRrQj?=
	=?us-ascii?Q?gIUJAm82Vf5BFcx3o9MCXc9uNiiKK8nAUSGGadQrpepqC498TZvz1sTtl0Wl?=
	=?us-ascii?Q?2Jg7f8jUTGLJ7PxXoyPSby7bBazEfpEmcOahCt2QFEYRJUz3+Bfm4HsjDC0R?=
	=?us-ascii?Q?mCLlKJi/F9M1ZRKs/I1gSzi2224HNLpOk4+oVSDb3ExTSagX9AtrwmuzM8Ja?=
	=?us-ascii?Q?LquD0sTCnuOQ7Fuopi0MubKSKF9p3xX9dfPi1hBacwChf+gA2F4PELbF4ArL?=
	=?us-ascii?Q?7HhkV4ZnjpUAO3Th9AMHHpoYM7RfC4lK5ORGr9lNl6hLjdNUDImh0p3/TK48?=
	=?us-ascii?Q?xHVk2zpYLsA3rqWL0nEBVDDYO0fw1yyztgm1TCCpj7hcSEp7p2x89Jnl8oJQ?=
	=?us-ascii?Q?OQwrAPjfWMtS6aMqGAWNPo++EKBGTYQ5THRQ=3D?=
X-Microsoft-Antispam-Message-Info: xutCouhiCi3OjEmq27Bf9zQXzngsZcFOj8Bjaf6sBZ/umdYUsAqtrny4pxZWMEmhepkOJCDntj8Fsf38NTxVK7nymuWazT7PA3pvOahbQua4uCtDMpwKBuNYJB7IP3qDefWXj6LJ8fTGhfFfnpbQuNclX1BBqm3nc97QbRMWIf7SopWp7RGTwQ3J7lBRJxyxGSgCFzl2dj2fJBcFkugujxuTPwaeP4dd3zN3NFvETJszBy8gXd22OXRnJfp9VHS+h9X8dPqBOVqrFkJB3idEAsl2K7GSrgJZDlOpSf/CWYb5iCslqUxl9jRMMFlBgpGPJQ5xQARsuiLvUEKMphkJtTJvUHQlY0eagjv6vCceXMM=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3510;
	6:69NA9r94fn1R4Z1bEzHWxx7EO+LpsNLSVQVyzalysKfRoM/B4qyih+0sgMtosJHoJR+nJXd9crX9FDcFh4hKyIiUIdJ96QDItxBiDdh4SywI513KfX924jd4VtNZOnM6Dtm3aXCOO3vga8gcJMTGrpJ4lSQYGfM8mHnFHhl9X2/VAzMYpPK8ArNIkDZAleB1QI+Zl55nQj2X7FBs1sGcLFkm3ivY5wecSJzk3P/3wtbtRRyHAEliT+8qEQdTRvYFn63cKDi6daRQjXBiTbMYfjKKD/HhLNJIWy3YuyE2tFNTnu//uNV/S2efv6S11AALr7hh5dDP9xPOj0IQODKvFeAtin6y+dQ/QJIfFNqQ0k2gg/nRX09vJKcZdTazUdhclcA14AtLI35M9KoMs0/HgUgSwSRmK1ZlfXQRucu5kbvda5ZmnqhkrIHM1aIY0BZMG3u+DbJcDQBN6X6VtSFiPA==;
	5:shDQ0+18LwgyFqaYXYnkFAgc59JbPNgv4OiR4wl1Zws9gNkVezd1mVXzPlScJ4UR4guHE/HzZw1j7blhzeKxk86lq5XNN1SbKnSxPmM9IC6GqPpECmberjHZ2k1KogtwLH/JXVPT/bvmbdUa5CLMMYHTl++8noDSJouDU4tW1Oo=;
	7:1LSDK9XP9nRhfBZr3ReyifzbuYqcQqhuUxmY03tp1BBPoXtIWJQJn5R+CBs2iFuNR7zxzkSL/EIVzXqkMcjHybTMlESPFy3K+WP/C0Ty4Tg+UmkOIPokFq73ramVdt2XMO8y6OionxpXkYfn8rwUdA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2018 17:26:29.9747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1033906d-d00c-4804-ee3f-08d65ad6cbaf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3510
Subject: Re: [PATCH 3/3] devtool: provide support for devtool menuconfig command.
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
X-List-Received-Date: Wed, 05 Dec 2018 21:57:28 -0000
Content-Type: multipart/alternative;
	boundary="------------0AC5A256C047D26BD96B4C09"
Content-Language: en-US

--------------0AC5A256C047D26BD96B4C09
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Scott,

On 12/5/2018 8:38 AM, Scott Rifenbark wrote:
> Hi,
>
> This probably has documentation ramifications yes?  See 
> https://yoctoproject.org/docs/2.6/mega-manual/mega-manual.html#ref-devtool-reference.


Yup, this should be documented, we can provide you a draft for you to 
review, expect it within the next few days.


Cheers,

Alejandro


>
> Thanks,
> Scott
>
> On Wed, Dec 5, 2018 at 8:27 AM Sai Hari Chandana Kalluri 
> <chandana.kalluri@xilinx.com <mailto:chandana.kalluri@xilinx.com>> wrote:
>
>     All packages that support the menuconfig task will be able to run
>     devtool
>     menuconfig command. This would allow the user to modify the current
>     configure options and create a config fragment which can be added to a
>     recipe using devtool finish.
>
>     1. The patch checks if devtool menuconfig command is called for a
>     valid
>     package.
>     2. It checks for oe-local-files dir within source and creates one
>     if needed, this directory is needed to store the final generated
>     config
>     fragment so that devtool finish can update the recipe.
>     3. Menuconfig command is called for users to make necessary
>     changes. After
>     saving the changes, diffconfig command is run to generate the
>     fragment.
>
>     Syntax:
>             devtool menuconfig <package name>
>              Ex: devtool menuconfig linux-yocto
>
>     The config fragment is saved as devtool-fragment.cfg within
>     oe-local-files dir.
>
>             Ex:
>     <workspace_path>/sources/linux-yocto/oe-local-files/devtool-fragment.cfg
>
>     Run devtool finish to update the recipe by appending the config
>     fragment
>     to SRC_URI and place a copy of the fragment within the layer where the
>     recipe resides.
>             Ex: devtool finish linux-yocto meta
>
>     [YOCTO #10416]
>
>     Signed-off-by: Sai Hari Chandana Kalluri
>     <chandana.kalluri@xilinx.com <mailto:chandana.kalluri@xilinx.com>>
>     Signed-off-by: Alejandro Enedino Hernandez Samaniego
>     <alejandr@xilinx.com <mailto:alejandr@xilinx.com>>
>     ---
>      scripts/lib/devtool/menuconfig.py | 80
>     +++++++++++++++++++++++++++++++++++++++
>      1 file changed, 80 insertions(+)
>      create mode 100644 scripts/lib/devtool/menuconfig.py
>
>     diff --git a/scripts/lib/devtool/menuconfig.py
>     b/scripts/lib/devtool/menuconfig.py
>     new file mode 100644
>     index 0000000..38133db
>     --- /dev/null
>     +++ b/scripts/lib/devtool/menuconfig.py
>     @@ -0,0 +1,80 @@
>     +# OpenEmbedded Development tool - menuconfig command plugin
>     +#
>     +# Copyright (C) 2018 Xilinx
>     +# Written by: Chandana Kalluri <ckalluri@xilinx.com
>     <mailto:ckalluri@xilinx.com>>
>     +#
>     +# This program is free software; you can redistribute it and/or
>     modify
>     +# it under the terms of the GNU General Public License version 2 as
>     +# published by the Free Software Foundation.
>     +#
>     +# This program is distributed in the hope that it will be useful,
>     +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>     +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>     +# GNU General Public License for more details.
>     +#
>     +# You should have received a copy of the GNU General Public
>     License along
>     +# with this program; if not, write to the Free Software
>     Foundation, Inc.,
>     +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>     +
>     +"""Devtool menuconfig plugin"""
>     +
>     +import os
>     +import bb
>     +import logging
>     +import argparse
>     +import re
>     +import glob
>     +from devtool import setup_tinfoil, parse_recipe, DevtoolError,
>     standard, exec_build_env_command
>     +
>     +logger = logging.getLogger('devtool')
>     +
>     +def menuconfig(args, config, basepath, workspace):
>     +    """Entry point for the devtool 'menuconfig' subcommand"""
>     +
>     +    rd = ""
>     +    kconfigpath = ""
>     +    pn_src = ""
>     +    localfilesdir = ""
>     +    workspace_dir = ""
>     +    tinfoil = setup_tinfoil(basepath=basepath)
>     +    try:
>     +      rd = parse_recipe(config, tinfoil, args.component,
>     appends=True, filter_workspace=False)
>     +      if not rd:
>     +         return 1
>     +
>     +      pn =  rd.getVar('PN', True)
>     +      if pn not in workspace:
>     +         raise DevtoolError("Run devtool modify before calling
>     menuconfig for %s" %pn)
>     +
>     +      if not rd.getVarFlag('do_menuconfig','task'):
>     +         raise DevtoolError("This package does not support
>     menuconfig option")
>     +
>     +      workspace_dir = os.path.join(basepath,'workspace/sources')
>     +      kconfigpath = rd.getVar('B')
>     +      pn_src = os.path.join(workspace_dir,pn)
>     +
>     +      #add check to see if oe_local_files exists or not
>     +      localfilesdir = os.path.join(pn_src,'oe-local-files')
>     +      if not os.path.exists(localfilesdir):
>     +          bb.utils.mkdirhier(localfilesdir)
>     +          #Add gitignore to ensure source tree is clean
>     +          gitignorefile = os.path.join(localfilesdir,'.gitignore')
>     +          with open(gitignorefile, 'w') as f:
>     +                  f.write('# Ignore local files, by default.
>     Remove this file if you want to commit the directory to Git\n')
>     +                  f.write('*\n')
>     +
>     +    finally:
>     +      tinfoil.shutdown()
>     +
>     + logger.info <http://logger.info>('Launching menuconfig')
>     +    exec_build_env_command(config.init_path, basepath, 'bitbake
>     -c menuconfig %s' % pn, watch=True)
>     +    fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
>     +    res = standard._create_kconfig_diff(pn_src,rd,fragment)
>     +
>     +    return 0
>     +
>     +def register_commands(subparsers, context):
>     +    """register devtool subcommands from this plugin"""
>     +    parser_menuconfig =
>     subparsers.add_parser('menuconfig',help='allows altering the
>     system component configuration', description='launches the make
>     menuconfig command, allows user to make changes to configuration.
>     creates a config fragment', group='advanced')
>     +    parser_menuconfig.add_argument('component', help='compenent
>     to alter config')
>     +
>     parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--------------0AC5A256C047D26BD96B4C09
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Scott,</p>
    <div class="moz-cite-prefix">On 12/5/2018 8:38 AM, Scott Rifenbark
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFNP8Ous2ZkGuxWQ=z3FyCOG39AGX4KGZF7FzUcztyKoCaNCoA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div>Hi, <br>
          </div>
          <div><br>
          </div>
          <div>This probably has documentation ramifications yes?  See <a
href="https://yoctoproject.org/docs/2.6/mega-manual/mega-manual.html#ref-devtool-reference"
              moz-do-not-send="true">https://yoctoproject.org/docs/2.6/mega-manual/mega-manual.html#ref-devtool-reference</a>.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Yup, this should be documented, we can provide you a draft for
      you to review, expect it within the next few days.</p>
    <p><br>
    </p>
    <p>Cheers,<br>
    </p>
    <p>Alejandro<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAFNP8Ous2ZkGuxWQ=z3FyCOG39AGX4KGZF7FzUcztyKoCaNCoA@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div><br>
          </div>
          <div>Thanks, <br>
          </div>
          <div>Scott<br>
          </div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Wed, Dec 5, 2018 at 8:27 AM Sai Hari Chandana
          Kalluri &lt;<a href="mailto:chandana.kalluri@xilinx.com"
            moz-do-not-send="true">chandana.kalluri@xilinx.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">All packages
          that support the menuconfig task will be able to run devtool<br>
          menuconfig command. This would allow the user to modify the
          current<br>
          configure options and create a config fragment which can be
          added to a<br>
          recipe using devtool finish.<br>
          <br>
          1. The patch checks if devtool menuconfig command is called
          for a valid<br>
          package.<br>
          2. It checks for oe-local-files dir within source and creates
          one<br>
          if needed, this directory is needed to store the final
          generated config<br>
          fragment so that devtool finish can update the recipe.<br>
          3. Menuconfig command is called for users to make necessary
          changes. After<br>
          saving the changes, diffconfig command is run to generate the
          fragment.<br>
          <br>
          Syntax:<br>
                  devtool menuconfig &lt;package name&gt;<br>
                   Ex: devtool menuconfig linux-yocto<br>
          <br>
          The config fragment is saved as devtool-fragment.cfg within<br>
          oe-local-files dir.<br>
          <br>
                  Ex:
&lt;workspace_path&gt;/sources/linux-yocto/oe-local-files/devtool-fragment.cfg<br>
          <br>
          Run devtool finish to update the recipe by appending the
          config fragment<br>
          to SRC_URI and place a copy of the fragment within the layer
          where the<br>
          recipe resides.<br>
                  Ex: devtool finish linux-yocto meta<br>
          <br>
          [YOCTO #10416]<br>
          <br>
          Signed-off-by: Sai Hari Chandana Kalluri &lt;<a
            href="mailto:chandana.kalluri@xilinx.com" target="_blank"
            moz-do-not-send="true">chandana.kalluri@xilinx.com</a>&gt;<br>
          Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a
            href="mailto:alejandr@xilinx.com" target="_blank"
            moz-do-not-send="true">alejandr@xilinx.com</a>&gt;<br>
          ---<br>
           scripts/lib/devtool/menuconfig.py | 80
          +++++++++++++++++++++++++++++++++++++++<br>
           1 file changed, 80 insertions(+)<br>
           create mode 100644 scripts/lib/devtool/menuconfig.py<br>
          <br>
          diff --git a/scripts/lib/devtool/menuconfig.py
          b/scripts/lib/devtool/menuconfig.py<br>
          new file mode 100644<br>
          index 0000000..38133db<br>
          --- /dev/null<br>
          +++ b/scripts/lib/devtool/menuconfig.py<br>
          @@ -0,0 +1,80 @@<br>
          +# OpenEmbedded Development tool - menuconfig command plugin<br>
          +#<br>
          +# Copyright (C) 2018 Xilinx<br>
          +# Written by: Chandana Kalluri &lt;<a
            href="mailto:ckalluri@xilinx.com" target="_blank"
            moz-do-not-send="true">ckalluri@xilinx.com</a>&gt;<br>
          +#<br>
          +# This program is free software; you can redistribute it
          and/or modify<br>
          +# it under the terms of the GNU General Public License
          version 2 as<br>
          +# published by the Free Software Foundation.<br>
          +#<br>
          +# This program is distributed in the hope that it will be
          useful,<br>
          +# but WITHOUT ANY WARRANTY; without even the implied warranty
          of<br>
          +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
          the<br>
          +# GNU General Public License for more details.<br>
          +#<br>
          +# You should have received a copy of the GNU General Public
          License along<br>
          +# with this program; if not, write to the Free Software
          Foundation, Inc.,<br>
          +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.<br>
          +<br>
          +"""Devtool menuconfig plugin"""<br>
          +<br>
          +import os<br>
          +import bb<br>
          +import logging<br>
          +import argparse<br>
          +import re<br>
          +import glob<br>
          +from devtool import setup_tinfoil, parse_recipe,
          DevtoolError, standard, exec_build_env_command<br>
          +<br>
          +logger = logging.getLogger('devtool')<br>
          +<br>
          +def menuconfig(args, config, basepath, workspace):<br>
          +    """Entry point for the devtool 'menuconfig' subcommand"""<br>
          +<br>
          +    rd = "" <br>
          +    kconfigpath = ""<br>
          +    pn_src = ""<br>
          +    localfilesdir = ""<br>
          +    workspace_dir = ""<br>
          +    tinfoil = setup_tinfoil(basepath=basepath)<br>
          +    try:<br>
          +      rd = parse_recipe(config, tinfoil, args.component,
          appends=True, filter_workspace=False)<br>
          +      if not rd:<br>
          +         return 1<br>
          +<br>
          +      pn =  rd.getVar('PN', True)<br>
          +      if pn not in workspace:<br>
          +         raise DevtoolError("Run devtool modify before
          calling menuconfig for %s" %pn)<br>
          +<br>
          +      if not rd.getVarFlag('do_menuconfig','task'):<br>
          +         raise DevtoolError("This package does not support
          menuconfig option")<br>
          +<br>
          +      workspace_dir =
          os.path.join(basepath,'workspace/sources')<br>
          +      kconfigpath = rd.getVar('B')<br>
          +      pn_src = os.path.join(workspace_dir,pn)<br>
          +<br>
          +      #add check to see if oe_local_files exists or not<br>
          +      localfilesdir = os.path.join(pn_src,'oe-local-files') <br>
          +      if not os.path.exists(localfilesdir):<br>
          +          bb.utils.mkdirhier(localfilesdir)<br>
          +          #Add gitignore to ensure source tree is clean<br>
          +          gitignorefile =
          os.path.join(localfilesdir,'.gitignore')<br>
          +          with open(gitignorefile, 'w') as f:<br>
          +                  f.write('# Ignore local files, by default.
          Remove this file if you want to commit the directory to
          Git\n')<br>
          +                  f.write('*\n')<br>
          +<br>
          +    finally:<br>
          +      tinfoil.shutdown()<br>
          +<br>
          +    <a href="http://logger.info" rel="noreferrer"
            target="_blank" moz-do-not-send="true">logger.info</a>('Launching
          menuconfig')<br>
          +    exec_build_env_command(config.init_path, basepath,
          'bitbake -c menuconfig %s' % pn, watch=True) <br>
          +    fragment = os.path.join(localfilesdir,
          'devtool-fragment.cfg')<br>
          +    res = standard._create_kconfig_diff(pn_src,rd,fragment)<br>
          +<br>
          +    return 0<br>
          +<br>
          +def register_commands(subparsers, context):<br>
          +    """register devtool subcommands from this plugin"""<br>
          +    parser_menuconfig =
          subparsers.add_parser('menuconfig',help='allows altering the
          system component configuration', description='launches the
          make menuconfig command, allows user to make changes to
          configuration. creates a config fragment', group='advanced') <br>
          +    parser_menuconfig.add_argument('component',
          help='compenent to alter config')<br>
          +   
parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)<br>
          -- <br>
          2.7.4<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
  </body>
</html>

--------------0AC5A256C047D26BD96B4C09--
