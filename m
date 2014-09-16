Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 1097 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Sep 2014 18:49:13 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0070.outbound.protection.outlook.com [157.56.110.70])
	by mail.openembedded.org (Postfix) with ESMTP id B940971467
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:49:13 +0000 (UTC)
Received: from BN1BFFO11FD035.protection.gbl (10.58.144.33) by
	BN1BFFO11HUB056.protection.gbl (10.58.144.203) with Microsoft SMTP
	Server (TLS) id 15.0.1019.14; Tue, 16 Sep 2014 18:15:01 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11FD035.mail.protection.outlook.com (10.58.144.98) with
	Microsoft SMTP
	Server (TLS) id 15.0.1019.14 via Frontend Transport; Tue, 16 Sep 2014
	18:15:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1XTxHZ-0003Dm-MN; Tue, 16 Sep 2014 11:15:17 -0700
Date: Tue, 16 Sep 2014 11:15:00 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
To: Philip Balister <philip@balister.org>
References: <1410467636-17638-1-git-send-email-soren.brinkmann@xilinx.com>
	<CAJTo0LbAQ38w=dUqTKEXpt=BRvMk5WG9UCVFkMnEE31w95Xvtg@mail.gmail.com>
	<5416CB83.5030304@balister.org>
MIME-Version: 1.0
In-Reply-To: <5416CB83.5030304@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-20950.005
X-TM-AS-User-Approved-Sender: Yes
Message-ID: <d3930987-32bb-4827-9723-e49d487658d4@BN1BFFO11FD035.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(377454003)(199003)(24454002)(479174003)(51704005)(189002)(164054003)(377424004)(83506001)(31696002)(85202003)(54356999)(47776003)(87936001)(107046002)(33646002)(83322001)(102836001)(104016003)(77096002)(46102003)(81542003)(74502003)(74662003)(77982003)(81342003)(80022003)(79102003)(110136001)(6806004)(44976005)(50986999)(90102001)(85306004)(99396002)(92566001)(19580395003)(19580405001)(76176999)(76482001)(20776003)(53416004)(64706001)(31966008)(50466002)(4396001)(21056001)(23676002)(85182001)(92726001)(86362001)(106466001)(95666004)(74316001)(85852003)(70736001)(1496007)(83072002)(107986001)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB056;
	H:xsj-pvapsmtpgw01; FPR:; MLV:sfv; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;
X-Forefront-PRVS: 03361FCC43
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=soren.brinkmann@xilinx.com; 
X-OriginatorOrg: xilinx.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Allow setting hostname through DISTRO_HOSTNAME
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
X-List-Received-Date: Tue, 16 Sep 2014 18:49:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, 2014-09-15 at 07:20AM -0400, Philip Balister wrote:
> On 09/14/2014 06:30 PM, Burton, Ross wrote:
> > On 11 September 2014 21:33, Soren Brinkmann <soren.brinkmann@xilinx.com> wrote:
> >> Add a distro variable to set the hostname. This allows easily assigning
> >> a hostname in local.conf.
> > 
> > It's already as easy as assigning a hostname in local.conf:
> > 
> > hostname_pn-base-files = "cuteembeddedhack"
> > 
> > Also your patch doesn't add a distro-level variable, it just adds
> > another package-level variable.
> > 
> > Patches like this tend to appear every 18 months or so, clearly we
> > need to ensure this is documented.

Apparently not often enough to make Google show this solution :P

> 
> We should change this line in the bb file:
> 
> # set standard hostname, might be a candidate for a DISTRO variable? :M:
> 
> to let people know how to override from local.conf.

Good idea. That was leading into the wrong direction.

	Thanks,
	Sören

