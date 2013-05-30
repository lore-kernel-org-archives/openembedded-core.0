Return-Path: <B40527@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0185.outbound.messaging.microsoft.com [213.199.154.185])
	by mail.openembedded.org (Postfix) with ESMTP id C37376066A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 02:18:04 +0000 (UTC)
Received: from mail18-db8-R.bigfish.com (10.174.8.231) by
	DB8EHSOBE031.bigfish.com (10.174.4.94) with Microsoft SMTP Server id
	14.1.225.23; Thu, 30 May 2013 02:18:02 +0000
Received: from mail18-db8 (localhost [127.0.0.1])	by mail18-db8-R.bigfish.com
	(Postfix) with ESMTP id BB211C801CE;
	Thu, 30 May 2013 02:18:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzda00hdc73hzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzzz2dh2a8h5c0h668h839h93fhd24hd2bhf0ah1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1155h)
Received: from mail18-db8 (localhost.localdomain [127.0.0.1]) by mail18-db8
	(MessageSwitch) id 1369880227586416_12549;
	Thu, 30 May 2013 02:17:07 +0000 (UTC)
Received: from DB8EHSMHS027.bigfish.com (unknown [10.174.8.229])	by
	mail18-db8.bigfish.com (Postfix) with ESMTP id 82C2BA00049;
	Thu, 30 May 2013 02:17:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS027.bigfish.com
	(10.174.4.37) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 30 May 2013 02:17:02 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 30 May 2013 02:17:59 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r4U2GurZ013092;	Wed, 29 May 2013 19:16:57 -0700
From: Zongchun YU <b40527@freescale.com>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <1369119875-4984-1-git-send-email-b40527@freescale.com>
	<CAJTo0LZA89rPdGy65ShyfxjS4jenHsinO5JPsTbWNi3sgOD=Eg@mail.gmail.com>
	<000701ce5b4e$3c7684e0$b5638ea0$@com>
	<CAP9ODKo8453_vw-9u+8308vsvy3zRoSk0ptoEzgo8gFpwp76SQ@mail.gmail.com>
	<000f01ce5b5b$c64e39d0$52eaad70$@com>
	<CAJTo0LbLEH+S4OpoKVQyeV2j2gV9pkzsS1L9vyoB=SPSCzL1VQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbLEH+S4OpoKVQyeV2j2gV9pkzsS1L9vyoB=SPSCzL1VQ@mail.gmail.com>
Date: Thu, 30 May 2013 10:17:40 +0800
Message-ID: <001701ce5cdb$de85b1a0$9b9114e0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac5cgMkcCV1M366kSJanLv00UrcSaQAWkXAw
X-OriginatorOrg: freescale.com
Cc: 'Otavio Salvador' <otavio@ossystems.com.br>,
	'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files:fix the command line wrap around issue
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
X-List-Received-Date: Thu, 30 May 2013 02:18:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us

Yes.  At least for my target, CONFIG_RESIZE isn't enabled that I'd =
expect to be required for this to work.

for my target, CONFIG_RESIZE have been enabled, if we use resize in =
profile, we may meet the invalid character issue as I mentioned earlier.



