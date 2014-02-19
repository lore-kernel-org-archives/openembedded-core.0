Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B7E0E6E760
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 15:48:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1JFlOFY030115; Wed, 19 Feb 2014 15:47:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id at8D9Y3Hpc7X; Wed, 19 Feb 2014 15:47:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1JFlIPI030099
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 19 Feb 2014 15:47:20 GMT
Message-ID: <1392824832.14081.274.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anders Darander <anders@chargestorm.se>
Date: Wed, 19 Feb 2014 15:47:12 +0000
In-Reply-To: <20140219113705.GA9147@ad.chargestorm.se>
References: <1392807290.14081.267.camel@ted> <20140219112630.GC3854@jama>
	<20140219113705.GA9147@ad.chargestorm.se>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: systemd version - release or git?
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
X-List-Received-Date: Wed, 19 Feb 2014 15:48:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-19 at 12:37 +0100, Anders Darander wrote:
> * Martin Jansa <martin.jansa@gmail.com> [140219 12:26]:
> > On Wed, Feb 19, 2014 at 10:54:50AM +0000, Richard Purdie wrote:
> > > Any objections to defaulting to a git version?
> 
> > I think we can wait few more days for new release:
> > https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg16738.html
> 
> I was just about to reply with the same e-mail link...

I asked about this a few days ago and scanned the archives and didn't
find it. Typically, they sent it out after I did that :)

> > but otherwise I don't have strong objections for switching to git
> > version temporary (if it really makes QA test results better).
> 
> Otherwise, I don't have any strong feelings against a git version. Not
> as long as it works as it should.
> 
> One objection might be that it's easier for someone to update it to a
> strange version in between the regular releases. As long as we try to
> avoid making a release where systemd is too far of from a regular
> release, that shouldn't be any issue, though.

I agree its worth waiting for the release if it really is than imminent.
I'd previously not been able to find a commitment or schedule.

It might be useful to have a git based recipe anyway for
debugging/testing...

Cheers,

Richard


