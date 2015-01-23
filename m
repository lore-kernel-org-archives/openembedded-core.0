Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 4733 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Jan 2015 01:46:42 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0057.outbound.protection.outlook.com [65.55.169.57])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5646AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 01:46:42 +0000 (UTC)
Received: from BL2FFO11FD047.protection.gbl (10.173.160.33) by
	BL2FFO11HUB067.protection.gbl (10.173.161.167) with Microsoft SMTP
	Server (TLS) id 15.1.75.11; Fri, 23 Jan 2015 00:13:25 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD047.mail.protection.outlook.com (10.173.161.209) with
	Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport; Fri, 23 Jan 2015
	00:13:25 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YERp2-0004ah-2E; Thu, 22 Jan 2015 16:10:00 -0800
Date: Thu, 22 Jan 2015 16:13:23 -0800
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1420757983-26493-1-git-send-email-soren.brinkmann@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1420757983-26493-1-git-send-email-soren.brinkmann@xilinx.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21276.000
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <7b9a128c271f4104ae85652d8824e476@BL2FFO11FD047.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=soren.brinkmann@xilinx.com; linuxfoundation.org; dkim=none
	(message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(24454002)(377424004)(51704005)(53416004)(85202003)(106466001)(76176999)(108616004)(107886001)(6806004)(62966003)(23676002)(77156002)(86362001)(104016003)(87936001)(2950100001)(54356999)(74316001)(92566002)(50986999)(50466002)(83506001)(85182001)(19580405001)(19580395003)(46102003)(47776003)(92726002)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB067;
	H:xsj-pvapsmtpgw01; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB067;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BL2FFO11HUB067; 
X-Forefront-PRVS: 0465429B7F
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB067;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2015 00:13:25.2593 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB067
Subject: Re: [PATCH] shadow: securetty: Add Xilinx Zynq SoC
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
X-List-Received-Date: Fri, 23 Jan 2015 01:46:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline

ping?

On Thu, 2015-01-08 at 02:59PM -0800, Soren Brinkmann wrote:
> Add Zynq's console devices to securetty.
> 
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>  meta/recipes-extended/shadow/files/securetty | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
> index ecc246f7997c..2be341a216bc 100644
> --- a/meta/recipes-extended/shadow/files/securetty
> +++ b/meta/recipes-extended/shadow/files/securetty
> @@ -45,6 +45,10 @@ ttyO1
>  ttyO2
>  ttyO3
>  
> +# Xilinx Zynq SoC
> +ttyPS0
> +ttyPS1
> +
>  # USB dongles
>  ttyUSB0
>  ttyUSB1
> -- 
> 2.2.1.1.gb42cc81
> 

