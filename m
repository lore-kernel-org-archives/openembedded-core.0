Return-Path: <alejandr@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0062.outbound.protection.outlook.com [104.47.38.62])
	by mail.openembedded.org (Postfix) with ESMTP id D9A6778834
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 23:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IEAXs0BRYDDzaPo3h+xpeGVlYiaGQdgAFRkjn3EUUHo=;
	b=3rdUKB7CHGGPYl4Uwk62P2wGjQEEnIRwxaCUwgxTkgWPHGDmdM1EUR7pw1J82EOsiMmpMAwX/Axd4TCrKsd4O08wZVLebWvl5RnYK6xvVETu59NFsFR84Oh9BdQE6ee5uc1SAasjS4qvVK6SevtArpQZlg5Vs4e4+6MEvNUbO6A=
Received: from BY2PR02CA0001.namprd02.prod.outlook.com (10.163.44.139) by
	BY2PR02MB1332.namprd02.prod.outlook.com (10.162.79.27) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Mon, 29 Jan 2018 23:56:41 +0000
Received: from CY1NAM02FT013.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by BY2PR02CA0001.outlook.office365.com
	(2a01:111:e400:5261::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.444.14 via
	Frontend Transport; Mon, 29 Jan 2018 23:56:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; asterius.io; dkim=none (message not signed)
	header.d=none;asterius.io; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT013.mail.protection.outlook.com (10.152.75.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Mon, 29 Jan 2018 23:56:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egJHz-0006uY-Gt; Mon, 29 Jan 2018 15:56:39 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egJHz-0000rp-Dp; Mon, 29 Jan 2018 15:56:39 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0TNuc7w026211; Mon, 29 Jan 2018 15:56:38 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1egJHy-0000rm-HI; Mon, 29 Jan 2018 15:56:38 -0800
To: Derek Straka <derek@asterius.io>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1517262541-8719-1-git-send-email-derek@asterius.io>
	<1517264310.3090.15.camel@linuxfoundation.org>
	<CADNbA1ob_P9HqYfFMszuddKDsUwPU7DzeJH5gdmhgQmSQ_F9HQ@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <5de4be98-bfba-190e-3ac1-46e4df5c9d83@xilinx.com>
Date: Mon, 29 Jan 2018 15:56:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CADNbA1ob_P9HqYfFMszuddKDsUwPU7DzeJH5gdmhgQmSQ_F9HQ@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(376002)(39380400002)(39860400002)(2980300002)(438002)(5423002)(377424004)(189003)(199004)(54896002)(478600001)(229853002)(83506002)(63266004)(236005)(59450400001)(64126003)(106002)(36756003)(316002)(65806001)(31686004)(65956001)(110136005)(37036004)(58126008)(65826007)(6246003)(16586007)(356003)(2906002)(33964004)(84326002)(81166006)(31696002)(106466001)(76176011)(53546011)(8936002)(81156014)(8676002)(186003)(4326008)(77096007)(26005)(336011)(2950100002)(270700001)(9786002)(5660300001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1332; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT013;
	1:IP1oIMZg2x2G7lczVnEfDv+9NqVJVERB99KJfDL/cXk2MZr5DW4ENUssEoYRvFYcllsFbmeL3+KSk+/RbbVmlzty2ACK10ap2fHucjFY7I4IHQEa/3s5ngm3gvbAb+u5
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ede82bc0-ba63-4b9c-fc5d-08d56773f107
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BY2PR02MB1332; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1332;
	3:Cc07KwshQttkOV1O+dASCpD11CKEloH3VaoTsMHbK8PVaJZ6yZvZ2NtUDaanFMgZUXHyqS9UxHKGagvwRkSdo0r0F1lITulaWz49fX289ZDi8GHcE+shqGHb/ZLYGoO/CI7oqoLT2gVfXvb4+YVx8uYVXaOeWoZiqI++5q13yHNN3QyZ0t2UqwnmjzwrQb+2+5Et/Gb/icR3XnxjDblUAdDqZvfavHbvAT1CgCxAwekVS/dBcGTjm2CGefmMK+Q2nJfrMdzblhUacw7zZjXb1Pm9re4qK5NsdwPMWlzRzsxddx0r1QPjIM2YTelAOe/iT6JhvxFiSH2ZwTN4t9Sx6xyrC7zneUkt38p7FJZt55g=;
	25:FTjzMPCkDe9s1qxP9JVKUIP+zryrc1DpGSOnT3Zmj97Xootj9j5npYxMynv8XK7M5cmyxb3m5toDqXZbrhac6lwSaOANkZeXQsjExPgqfQtQT/GbuoArP8Rarr+Vhs6jx7GaxaQo6vWrzHC2fXKcKuo0PC2KuDybCP8VirpTvhlLMp+pImCMtCC/I6ttVkc6tbvtPCSHckgRUAGnYyyfSGVLgZ+3FKhBxNn3c61qZZ6y68VFGn1xHY9Te3Qdf0q1EhNljRjnlD6lmGRiYZEqTR8KDBnmW10ys3uf7cQ7iQEDcgtCQY0inRYJJLmyF4aRcY7enB7eJdHEqmQCFVIe8l2mdIF5+nA/dcQOVg6utYs=
X-MS-TrafficTypeDiagnostic: BY2PR02MB1332:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1332;
	31:f8xa46OwsHbvpAUXeW+lVDBNYNwENCRR3zpeZzOrRX5mwKr8pkKVzaZqxSC1nu8zVDyiJKmxNr8XDIQzBrf3je6Zmiwf8n4IlU8qolQLoX9V2EkA6488ULymoEh3xEpKjb4eDayDeYNqB7Q2PUdcJdHrV2Kf1AGZz1qbxrFaASY87nDC1GNlqA8AZaaR/vyWzIH4ed5yGZYMLH+36B9vy5bMIK/P93alSebNLcKzSuI=;
	20:WvkdwM+EA+kBA67IRCS8YZoJYh4sBnCiUwcj4+8tvdxRhkTP82+h9Xvk375533RsOSuIwlqCP7FQjP8qK4DUbIzg3L3gOpyrUj6WBd0/rGERnwDT8lSDedhAJQi5J5kmVh53t5nEUc48q1BWY6UK6NmKIWK4Py1IiQl2YFRQH2lqas5raZnTaSjU9Mbw/xPKOAIIRBBoJOD1EdFZQPBnYtQWWM4Oe9RejalTknk5ub3ARSbk8V3ggceegrRsblGpoONGygw796aMapFZnjgXnHOBJA4vyzshBLsIPBR/QEB/HG6GDYv6t4BiqWQU7hf4kksP1UpEfaLID2LCSLqlXZ4iUTgFP26//tTdYYM6CK16ry8ucGqH0mgceRqCD26sWVS3VI6QHRvEtW7bQRtchvOimazzU4SBt3tme3OY6/DCyJ8v/IfpWecwj1LXECfxpZ08m5w35N9md8mZrtLUdn2RN/ayHxVK/D2MFohejFfD5S9eBl0BMSPQik/0VLHj
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB1332B714368E9DEFE7A37C25ACE50@BY2PR02MB1332.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(93006095)(93004095)(3231101)(944501161)(10201501046)(6055026)(6041288)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1332; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1332; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1332;
	4:bQC9JHd88ADplu1fmbRUk/ofnlvpmNcR6tRAMK/BIXriOhWUbEO8Yl2VQSsE0wSTEy048bCN2XmDoRHcwlpj1BB21EKdj3bM6GGu6c8M+ivQmd6eyyOtqkmfE34gTGwSg6w9C/R82UOGDvYPYIkJeI/zxxgTOZmiVZwEGaQ3OQbJ/m2Z8KBH/nIZ5pvut6q/AL5xaDHcfl1zRQQZd5hSIEdo3vEvQg0JgTVg+LvIC01qJrrUN2GwyWte1Q7L5R5B7ZHXfd2xkplGvJ++4oVf89GFmn/FukQpR1in1OoeL0f/VfpErkwGPGIzWyIWP5mQ
X-Forefront-PRVS: 0567A15835
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1332;
	23:OseBnv+crrsfBWtkh//m29clCU3WxZrwCd+XYglSk?=
	=?us-ascii?Q?VjQnrTRwJVKAAtg3Aw8fR5yCt0xM4KrBud+mtWnQ1N6OKglJjjZnBKZGaz5L?=
	=?us-ascii?Q?LOih79xQppKy9Yo/YNU9ZyZ0/pr3FioIjGBrBfXx0yAx/i/Y2aYyhL6uEMPQ?=
	=?us-ascii?Q?U27iLsmcSYtm3ekaG1bCO8ADEb/aERzqAvrp3W+4Q+6G6WPBrjLU+TQQTukS?=
	=?us-ascii?Q?lV6gbVGUDkiIDz1k9z4m7Hh6gal8Nb3DPNywVyRhweBvdcMfcBaJ3nNF027b?=
	=?us-ascii?Q?ssqcUXtAnYaakbViiufBbVtttOj0jNBbunVDqPG7WHypbkYc3+b8txjWILUV?=
	=?us-ascii?Q?NNqcbiiiuXSkhyRSTjHYYv5mnhoVvGa3csPO8TJZq9pEN8+ijLGJQ9eIyRbE?=
	=?us-ascii?Q?sPV++qbwZ3eBf1vyicTn+1AN0Qnl12QLbvurgiPEumAGO7PwF0tGeI2KI9Dk?=
	=?us-ascii?Q?P+HmBfdH2zKIxH2WooKlhXDPvKnRpKI2ADNcUIC0IBtf0A9SycKYJRi8lYag?=
	=?us-ascii?Q?Ip15U+6+2BNcjRWY5X0cTFlX6PtJ4HAPHPof16IJ/nO4nJdcVqTbA4B1p+ic?=
	=?us-ascii?Q?Ok/ncLCJpGjBuyA36pPQqLpHMadVVjKA/9rCjE8LkLVOldOLnuOtZLP25+Af?=
	=?us-ascii?Q?VtuSagWFIHHch7cTRmVWRUHaJ2cT17gB30vLazrihO8XBQvupFEUEtyCuMUK?=
	=?us-ascii?Q?c9yiqzgVXbBc1a47aHxZTDXiNpYJ+kXChWrIiFlhDg4a1pA42jm6QOW/Si5D?=
	=?us-ascii?Q?/a1afBWZDZepTlRbtHRo5vZynoDfMpEY5YbM0dmiPyKSjI3u+MttnPC4nEFR?=
	=?us-ascii?Q?0JeZZZDMZsMgEQVFswZyM0nQAGkzdk/0t8gQ8LGy+z2CEaSG6Gfvl3mjvt8x?=
	=?us-ascii?Q?5FuS6hqeN2DYAICoTHVumGSNj5xqNOt93Fxu/eBB9tcpWCv1LoIef+w5c6aF?=
	=?us-ascii?Q?qPQ16KGLn9bnfJ/1jwd5t1OnAqXm3sMGPQTX58DD63d44J0atNln9v3Ci2+b?=
	=?us-ascii?Q?/tMwJSL9+YAevWZs/jXZC7unDy/2yziZWKgZ/RPPGOOgFiXn4JF7vRGPJ0LR?=
	=?us-ascii?Q?Jp2bm2JeVocQ91nPrSakF1460eRfWRyVkVV7pQ2dd7dzXEvRK1JbgUj3akFr?=
	=?us-ascii?Q?NsRsVFeSAcVtdB6MQlnnLsO1c8wfpuXcckP+xGI5s6X/tyA9Sazb1OxAODva?=
	=?us-ascii?Q?+JOZfAtujMIs37lp9TdfE02j0LgDywUPBzh6e96hK0leUh+KQb+ggk39Q=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1332;
	6:AtxH3Sxn2G97di/BABuI+nUB4sHYvyx+v630KaTIhTkxd+WjDjzsaIC18HqUdg5/n38DUdEGGjZn4U1btU3XQZNUI4WHOQm7VNYwqsKF6UopcfY2BBnhTKVrs01TZCB8bGPGXkuwGqNEI20SpQVbpxwxYnT9urFHZ1saYt/AfvXSR1ZDBAtFubrzkJroTXc3sc0wxkAMh7PgE+1iIUXVhIMHr1748o1iHWd1kl6sbZX/EpXiPJd7Mr7lHI+GGUtOK6Nhw1TUsIKvlel+xIaa2YynruTaae9P+/ROGyrZxo3NLDyFTFTS74eiDPNrSpc8GIdGiBujPXGFDo688kqT/og0eNFYYJsS/v8HVAiCsP4=;
	5:V/TRPqen8TKAgIa6nDOxnNnVvdFOrJIOP0rCd5AEc9boWAMYHsXYUeBTdHg6ymJ+Zt8tc9JsTW6qw6sTTQcMZ5GYE36LwyaO97OLNhlhBpu+4tUoVm4rstfIj+kFmWlIryVA6QyQt+Ay4YfdqiI2x1jwu0EpUfyEK5XAC3d2Xi0=;
	24:iTZlewn8GA20T8DIdRTNfGVY8Ft84xPa3X4FXY+wuWQb6KUmjiKBOstApG3jojO5pbCeS9P0c3ouivZUetZO7sQB1eZCb5jR9F6NB2tuJt8=;
	7:FogCLbsmFqljdc5/YALfIBCuwekqrEGRYFfN6o+Gc4VCS+gK2FLeP318m037s9vzJCuoUd7I0SZQmk6ZFuUjvAz5xX2NfZ67Tv3jYjrEm3RlMXxF/2M+OuOvBUZ6BQlyjJH+Xe9TOHwpS6IhBSlKobcQgvDAKIiSZOTxajt7K54NN3tudaaqmf9X/L+ZSGd83WxVTfHffB1W7Wr4/96g2QXwASPJsaUsfVVcwbJZmZG9eVK28qUj774jc9z12Akn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2018 23:56:40.2088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ede82bc0-ba63-4b9c-fc5d-08d56773f107
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1332
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python: Upgrade both python and python-native to 2.7.14
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
X-List-Received-Date: Mon, 29 Jan 2018 23:56:42 -0000
Content-Type: multipart/alternative;
	boundary="------------493C34E272053E25250822FF"
Content-Language: en-US

--------------493C34E272053E25250822FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Awesome!, it seems that the script did save us from a couple of annoying 
RDEPEND bugs on this new release!


Thanks Derek!


On 01/29/2018 02:26 PM, Derek Straka wrote:
> Thanks.  Last I checked it was just in master-next.  I'll send the 
> patch for the manifest once I get off the train.
>
> On Jan 29, 2018 5:18 PM, "Richard Purdie" 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Mon, 2018-01-29 at 16:49 -0500, Derek Straka wrote:
>     > Rebased:
>     >   - python/01-use-proper-tools-for-cross-build.patch
>     >   - python/fix-makefile-for-ptest.patch
>     >   - python/parallel-makeinst-create-bindir.patch
>     >
>     > Removed Upstreamed Patch:
>     >   - python/Don-t-use-getentropy-on-Linux.patch
>     >
>     > Updated license checksum for changes in the copyright date.  The
>     > license
>     > terms remain unchanged
>     >
>     > Added an extra do_compile item to create the native pgen that no
>     > longer
>     > gets compiled by default
>     >
>     > Update the json manifest with the latest dependency set
>     >
>     > Signed-off-by: Derek Straka <derek@asterius.io
>     <mailto:derek@asterius.io>>
>
>     Your patch was merged into master so if there are tweaks they need to
>     be in a patch against master now please.
>
>     Cheers,
>
>     Richard
>
>
>


--------------493C34E272053E25250822FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Awesome!, it seems that the script did save us from a couple of
      annoying RDEPEND bugs on this new release!</p>
    <p><br>
    </p>
    <p>Thanks Derek!<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/29/2018 02:26 PM, Derek Straka
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADNbA1ob_P9HqYfFMszuddKDsUwPU7DzeJH5gdmhgQmSQ_F9HQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="auto">Thanks.  Last I checked it was just in
        master-next.  I'll send the patch for the manifest once I get
        off the train.</div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Jan 29, 2018 5:18 PM, "Richard
          Purdie" &lt;<a
            href="mailto:richard.purdie@linuxfoundation.org"
            moz-do-not-send="true">richard.purdie@linuxfoundation.org</a>&gt;
          wrote:<br type="attribution">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon,
            2018-01-29 at 16:49 -0500, Derek Straka wrote:<br>
            &gt; Rebased:<br>
            &gt;   - python/01-use-proper-tools-<wbr>for-cross-build.patch<br>
            &gt;   - python/fix-makefile-for-ptest.<wbr>patch<br>
            &gt;   - python/parallel-makeinst-<wbr>create-bindir.patch<br>
            &gt;<br>
            &gt; Removed Upstreamed Patch:<br>
            &gt;   - python/Don-t-use-getentropy-<wbr>on-Linux.patch<br>
            &gt;<br>
            &gt; Updated license checksum for changes in the copyright
            date.  The<br>
            &gt; license<br>
            &gt; terms remain unchanged<br>
            &gt;<br>
            &gt; Added an extra do_compile item to create the native
            pgen that no<br>
            &gt; longer<br>
            &gt; gets compiled by default<br>
            &gt;<br>
            &gt; Update the json manifest with the latest dependency set<br>
            &gt;<br>
            &gt; Signed-off-by: Derek Straka &lt;<a
              href="mailto:derek@asterius.io" moz-do-not-send="true">derek@asterius.io</a>&gt;<br>
            <br>
            Your patch was merged into master so if there are tweaks
            they need to<br>
            be in a patch against master now please.<br>
            <br>
            Cheers,<br>
            <br>
            Richard<br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------493C34E272053E25250822FF--
