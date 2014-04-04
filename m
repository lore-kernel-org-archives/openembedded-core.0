Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 486A56B89F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 11:21:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s34BIox4006237; Fri, 4 Apr 2014 12:20:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PFHJmjfuBZtt; Fri,  4 Apr 2014 12:20:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s34BKkaw006293
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 4 Apr 2014 12:20:47 +0100
Message-ID: <1396610440.13862.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Date: Fri, 04 Apr 2014 12:20:40 +0100
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B57551ADA@COSNADEXC13.usr.ingenico.loc>
References: <1396457186-5961-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1396510015.2910.59.camel@ted>
	<8672BB614B4CCA40A6B3BDD6FD82050B57551ADA@COSNADEXC13.usr.ingenico.loc>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] files/device_table-minimal.txt: cleanup
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
X-List-Received-Date: Fri, 04 Apr 2014 11:21:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-04-03 at 07:54 +0000, Matthieu CRAPET wrote:
> Hi Richard,
> 
> > If I remember correctly, mmc devices are dynamically allocated numbers.
> 
> Well, in my work experience, I always used this.
> However, according to include/uapi/linux/major.h:
> 
> #define MMC_BLOCK_MAJOR   179

I guess we should be ok then. I think the partition numbers can fail to
map but it would be rare that would happen and probably not at first
boot, or on the kind of environments the restricted dev directory would
be used in.

> > I only see ttyS, not S0 or S1?
> 
> According to file:
> /dev/ttyS	c	640	root	tty	4	64	0	1	2
> 
> This will create ttyS0 and ttyS1.

Sorry, yes, of course it will. I was getting confused...

Chewers,

Richard


