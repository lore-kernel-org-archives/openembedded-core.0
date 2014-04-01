Return-Path: <Zongchun.Yu@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe005.messaging.microsoft.com [216.32.181.185])
	by mail.openembedded.org (Postfix) with ESMTP id B0EB96B8D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:30:47 +0000 (UTC)
Received: from mail144-ch1-R.bigfish.com (10.43.68.228) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.22; Tue, 1 Apr 2014 06:30:48 +0000
Received: from mail144-ch1 (localhost [127.0.0.1])	by
	mail144-ch1-R.bigfish.com (Postfix) with ESMTP id 9B2CA42048F;
	Tue,  1 Apr 2014 06:30:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 7
X-BigFish: VS7(zzda00hdc73hzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzzz2dh109h2a8h5c0h839h944hd24hd2bhf0ah1220h1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h20dbh2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h262fh268bh25d3o1155h)
Received: from mail144-ch1 (localhost.localdomain [127.0.0.1]) by mail144-ch1
	(MessageSwitch) id 1396333846793036_11412;
	Tue,  1 Apr 2014 06:30:46 +0000 (UTC)
Received: from CH1EHSMHS001.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail144-ch1.bigfish.com (Postfix) with ESMTP id
	AD7D8460065;	Tue,  1 Apr 2014 06:30:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS001.bigfish.com
	(10.43.70.1) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 1 Apr 2014 06:30:46 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 1 Apr 2014 06:30:45 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.193.20.88])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id s316UddK031810;	Mon, 31 Mar 2014 23:30:43 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Khem Raj' <raj.khem@gmail.com>
References: <1396332774-31033-1-git-send-email-b40527@freescale.com>
	<64C886B8-D3BF-40FD-9D96-F46F37DB608F@gmail.com>
In-Reply-To: <64C886B8-D3BF-40FD-9D96-F46F37DB608F@gmail.com>
Date: Tue, 1 Apr 2014 14:37:01 +0800
Message-ID: <001a01cf4d74$cced90e0$66c8b2a0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac9NcdD+jmUOI4TYR/a8z6T0BdH8NQAAZbwA
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool: Add depends on binutils-cross
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
X-List-Received-Date: Tue, 01 Apr 2014 06:30:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn

>can you explain the race a bit here. 

Sorry to confuse you. Sometimes libtool have been built but the
binutils-cross have't been built yet.
It is required by libtool.



