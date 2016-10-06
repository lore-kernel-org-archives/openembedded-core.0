Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B0022605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 13:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u96DAQIY027765; Thu, 6 Oct 2016 14:10:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RT1vw18s0WDD; Thu,  6 Oct 2016 14:10:26 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u96DAO8Z027761
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 6 Oct 2016 14:10:25 +0100
Message-ID: <1475759424.30475.556.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 06 Oct 2016 14:10:24 +0100
In-Reply-To: <CA+chaQeVPFGamX=E8o6SNTTth5ytm9EdrecFtW1z4NfTRNSiDA@mail.gmail.com>
References: <20161006082332.29189-1-Martin.Jansa@gmail.com>
	<1475750706.30475.539.camel@linuxfoundation.org>
	<CA+chaQeh3Y2jYm97R6cWw3OvuQrTqHQn1NMWaUfGjFRQN4okEQ@mail.gmail.com>
	<CA+chaQcyvfvyZ8xDYmHMkbhQcTaZWbLheaVSW5so2zPA=UTA-w@mail.gmail.com>
	<CA+chaQeVPFGamX=E8o6SNTTth5ytm9EdrecFtW1z4NfTRNSiDA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH] binutils: fix AR issue when opkg is unpacking IPKs containing empty entries
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
X-List-Received-Date: Thu, 06 Oct 2016 13:10:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-06 at 13:12 +0200, Martin Jansa wrote:
> I see, there is ^M after empty in the actual .patch file, if I read
> the git format-patch output it shows ^M, but the git webUI gets
> confused and shows ^M as normal line feed.
> 
> ++    if ![string match "empty^M" $got] {
> 
> Does it work for you when cherry-picking from the branch.
> 
> Here is the same change in binutils git repo:
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blobdiff;f
> =binutils/testsuite/binutils-
> all/ar.exp;h=45be9b1b594b39624f3e010f50bf98892fb64549;hp=508ae9c1d756
> 2c8b0a2c090a93e35acdba733944;hb=4fc874242f8f1bf17cf6e65b159dd804e793e
> 6cd;hpb=23a4bd22c75862fdbaa5faef59b9094ec738f675
> 
> It shows '\r' so it isn't there by accident.

I've been able to cherry-pick it, thanks. I figured it was something
odd going on with the mailing list damaging line returns.

Cheers,

Richard

