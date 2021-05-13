Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web12.14306.1620917189046261030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 07:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=T5KKMccj;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id hCbalhEWFOQhvhCbbliFa1; Thu, 13 May 2021 15:46:27 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=IvmFjI3g c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=5FLXtPjwQuUA:10 a=Q4-j1AaZAAAA:8 a=TXWru-J5fz9pjidqVWMA:9
 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=obUvuzfYUeaXcAkBCmDLiz4D7uNbNnQ5gSJFypbZRl4=; b=T5KKM
	ccj/cuAIjn7lYgpHqwP7ZK1Vh9o//D6fhn7n1rca68ppWub22cyRPELxWB7mNbFlWpbVh4El26U0k
	Cf6TpdOwoMHvxKDPynY+zQB1cdrkmEcGgeYgGYCnjeZrdOyIg+lXnb6ZczInmTWqySaCcbt4JC2d8
	5QOOvakzswzDheTeE5Hf9QUMA37eaDiv2JAJrN9f3nx0ZSR6jQcKUcjwZm49CNpBHgr0/prYixTPP
	odJbVx1ZKJnan4030YW9+Qu+i0G4/VB440SUu5GUxkFLoOHEiO4YmJl97ZqmkriMuWX0kajNuTwBN
	7muOVsL7WVkYo4aTVl4GHHSqLPCUQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lhCbZ-0000zU-Ts; Thu, 13 May 2021 15:46:25 +0100
Date: Thu, 13 May 2021 15:46:25 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libnotify: Make gtk+3 dependency optional
Message-ID: <20210513144625.GA3115@mcrowe.com>
References: <20210513143632.1211604-1-mac@mcrowe.com>
 <CANNYZj8E6Rem_gy-NieFXyBBmb=qBB9rcX1C9D01dhtymFm9pQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8E6Rem_gy-NieFXyBBmb=qBB9rcX1C9D01dhtymFm9pQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfEYPn0qPrCb59GCUgOqSNgx1jMVL9UfzfaxyQloYdNIrmZy9TAVX5Yb5Pdw3IiozWGo8Weu+gzAwdJRPrX11fC9KMx5Qi78kJKdmleIjqOGR29kzNu3S
 YD8bV5PTyp9ChwNUR5xJ1X/u0EPXVav3BwKU0XHjiP3OQdropi/pwue8B/Sbfz3jL2SlNJgL29DneA==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 13 May 2021 at 16:43:15 +0200, Alexander Kanavin wrote:
> On Thu, 13 May 2021 at 16:36, Mike Crowe via lists.openembedded.org <yocto=
> mac.mcrowe.com@lists.openembedded.org> wrote:
> 
> > +PACKAGECONFIG[gtk+] = "--enable-tests,--disable-tests,,gtk+3"
> >
> 
> Was the --enable-tests scenario tested? Specifying gtk+3 after two ,,s
> seems weird.

You're right. That does look odd. This is actually an old patch I hoovered
up after upgrading and didn't retest it. I'll do some more testing...

Mike.
