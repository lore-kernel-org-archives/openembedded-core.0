Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 3568 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Jun 2019 10:56:24 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBC77DE74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 10:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=38GkCozf7TtJEDq6OuFej92QXxbUW3EeiJam/UggGmE=;
	b=ARqrKFzChFTKyv03T5mDn59Dsh46bpKqt/VhMZDNgSOGjJJfcG1t9aGY5S+aTfedzP1DEVp3y1liOuuCCTiGbXHOg8/MxrHJIFP2HDD3EP5fM0br7ONi4VIhy540aA4RGVHYoclfiMDf1f7Qgh2o+ERhfb9pg886bWo9g7IqZ7E=
Received: from CY4PR02CA0039.namprd02.prod.outlook.com (2603:10b6:903:117::25)
	by BL0PR02MB4931.namprd02.prod.outlook.com (2603:10b6:208:53::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16;
	Mon, 24 Jun 2019 20:20:25 +0000
Received: from SN1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by CY4PR02CA0039.outlook.office365.com
	(2603:10b6:903:117::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.13 via
	Frontend Transport; Mon, 24 Jun 2019 20:20:25 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT022.mail.protection.outlook.com (10.152.72.148) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1987.11
	via Frontend Transport; Mon, 24 Jun 2019 20:20:24 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hfVRw-0007YO-5v; Mon, 24 Jun 2019 13:20:24 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1hfVRr-0003lC-2k; Mon, 24 Jun 2019 13:20:19 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x5OKKHdA024498; Mon, 24 Jun 2019 13:20:18 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1hfVRp-0003kW-CP; Mon, 24 Jun 2019 13:20:17 -0700
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190620145325.8654-1-ross.burton@intel.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <84a8dcf8-3491-bf07-2e68-46aac1b38162@xilinx.com>
Date: Mon, 24 Jun 2019 13:20:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190620145325.8654-1-ross.burton@intel.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(39850400004)(376002)(136003)(2980300002)(189003)(199004)(11346002)(476003)(486006)(229853002)(446003)(47776003)(64126003)(5660300002)(52146003)(2486003)(65826007)(2906002)(58126008)(23676004)(76176011)(77096007)(2616005)(26005)(186003)(31696002)(67846002)(70206006)(70586007)(36756003)(126002)(305945005)(356004)(6246003)(50466002)(316002)(63266004)(31686004)(230700001)(478600001)(106002)(53546011)(8676002)(426003)(336012)(14444005)(8936002)(9786002)(81166006)(81156014)(65806001)(65956001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4931; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89bce46e-110b-462d-07f9-08d6f8e163e5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:BL0PR02MB4931; 
X-MS-TrafficTypeDiagnostic: BL0PR02MB4931:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB4931FAF383B65A4FC11FB867ACE00@BL0PR02MB4931.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-Forefront-PRVS: 007814487B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bY9K8dG7uBUMJcMgKL4Px33TNiJMBnehwhsTKwDk/clX0Vt/z8FZvxTJ23EuXCfzt4Z5Rri7dSUe9NIpvgje1k3Ss1rjFzlGWD7OCzIF6MtInH0cVLyyZIeW4XbUcDc2Nx7iMy97F0v0MO6G/3mwYRmmRUWhZDpH7G0qwJsV1DlHtZMdGFQ5tthSYnYFpg4eFmoLQ+tdohLdVqe0MflnlrP5AV8fhUcrKFz6TLNKycMr3F+NBC0hCKrqNrU64kh/XuMIKvEk4stBlUJCRjjWGC55Iv855rzVnFN6evNkxCsfUq7k4QlRd3woL9Kid9ZFc59X7/QDUHEHD00r2JJ1c4yewcNn4FhwtQH1OclDo1F5ZQt3RamH4ixvVIFV8ZP5vAlJkMlfoomG7MSVOVfoRiwT0ZbyPoXbdvdoOtlzacI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2019 20:20:24.5316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bce46e-110b-462d-07f9-08d6f8e163e5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4931
Subject: Re: [PATCH] python: make 'python' install everything instead of just the interpretter
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
X-List-Received-Date: Tue, 25 Jun 2019 10:56:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Ross,

On 6/20/19 7:53 AM, Ross Burton wrote:
> Follow the python3 behaviour, and common sense, by making 'python' install
> python-modules instead of python-core.  This means a user installing python gets
> all of Python, instead of just a fraction of the library.
>
> [ YOCTO #13402 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/python/python_2.7.16.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
> index d70342fe3a6..5f387b8af11 100644
> --- a/meta/recipes-devtools/python/python_2.7.16.bb
> +++ b/meta/recipes-devtools/python/python_2.7.16.bb
> @@ -162,7 +162,7 @@ py_package_preprocess () {
>   PACKAGES_remove = "${PN}"
>   
>   # manual dependency additions
> -RPROVIDES_${PN}-core = "${PN}"
> +RPROVIDES_${PN}-modules = "${PN}"

Is it just me or we already had this?, maybe we had this only for python3


Alejandro


>   RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
>   RRECOMMENDS_${PN}-crypt = "openssl"
>   

