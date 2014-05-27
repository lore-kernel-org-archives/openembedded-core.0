Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com (unknown
	[207.46.163.240])
	by mail.openembedded.org (Postfix) with ESMTP id 37A4B6FA68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 07:37:49 +0000 (UTC)
Received: from BLUPR03CA037.namprd03.prod.outlook.com (10.141.30.30) by
	BLUPR03MB247.namprd03.prod.outlook.com (10.255.213.21) with Microsoft
	SMTP Server (TLS) id 15.0.949.11; Tue, 27 May 2014 07:37:49 +0000
Received: from BN1AFFO11FD016.protection.gbl (2a01:111:f400:7c10::190) by
	BLUPR03CA037.outlook.office365.com (2a01:111:e400:879::30) with
	Microsoft SMTP Server (TLS) id 15.0.949.11 via Frontend Transport;
	Tue, 27 May 2014 07:37:49 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.1) by
	BN1AFFO11FD016.mail.protection.outlook.com (10.58.52.76) with Microsoft
	SMTP Server (TLS) id 15.0.949.9 via Frontend Transport;
	Tue, 27 May 2014 07:37:49 +0000
Received: from b4052702 (b40527-02.ap.freescale.net [10.193.20.88])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s4R7bjCa001047; Tue, 27 May 2014 00:37:47 -0700
From: Zongchun YU <b40527@freescale.com>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <1400825337-3955-1-git-send-email-b40527@freescale.com>
	<CAJTo0LbMGfDFMre2dNJXZ73R2NNzjtHyso_4orZT4yv0oc_OpA@mail.gmail.com>
	<CAJTo0Laqj7cauEEEor5Us3TonSfeiPkOC=f3V5PvS2dEMCrW2g@mail.gmail.com>
In-Reply-To: <CAJTo0Laqj7cauEEEor5Us3TonSfeiPkOC=f3V5PvS2dEMCrW2g@mail.gmail.com>
Date: Tue, 27 May 2014 15:38:52 +0800
Message-ID: <00d601cf797e$b8663560$2932a020$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac92pMR4reLUU5gkR4mSWLpUwsbhWwC2bRHg
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.1; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(54094003)(199002)(189002)(104016001)(83322001)(558084003)(4396001)(76482001)(64706001)(50226001)(44976005)(6806004)(14726001)(80022001)(21056001)(46102001)(92726001)(92566001)(99396002)(23676002)(93916002)(20776003)(79102001)(47776003)(59696002)(50986999)(76176999)(77156001)(87936001)(2656002)(87286001)(77096999)(74502001)(74662001)(84116002)(31966008)(96836002)(33716001)(26826002)(77982001)(85852003)(33646001)(50466002)(81342001)(61296002)(62966002)(81542001)(89996001)(83072002)(88136002);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB247;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:gate-tx3.freescale.com; A:1; MX:1; LANG:en; 
X-Forefront-PRVS: 02243C58C6
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.1
	as permitted sender) receiver=; client-ip=192.88.168.1;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.1)
	smtp.mailfrom=Zongchun.Yu@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2][v2] doxygen-native: add recipe
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
X-List-Received-Date: Tue, 27 May 2014 07:37:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn

> Whilst this recipe works, I wonder if it would be more useful if it 
> were cross-compilable and used BBCLASSEXTEND to become native.
Yes. I agree. it would be more useful.


