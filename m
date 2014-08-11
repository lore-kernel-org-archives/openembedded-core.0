Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD6A770B74
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 11:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BB9uoj001464; Mon, 11 Aug 2014 12:09:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7u2SDOxJr-lk; Mon, 11 Aug 2014 12:09:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BB9nNc001461
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 11 Aug 2014 12:09:51 +0100
Message-ID: <1407755389.22187.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Aug 2014 12:09:49 +0100
In-Reply-To: <20140811110437.GA14848@jama>
References: <1405638999-9737-1-git-send-email-Martin.Jansa@gmail.com>
	<20140725001645.GQ2492@jama> <53D85A56.6060401@windriver.com>
	<20140811110437.GA14848@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCHv2] gcc-4.8: backport fix for ICE when building opus
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
X-List-Received-Date: Mon, 11 Aug 2014 11:09:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-08-11 at 13:04 +0200, Martin Jansa wrote:
> On Wed, Jul 30, 2014 at 10:37:10AM +0800, Robert Yang wrote:
> > 
> > On 07/25/2014 08:16 AM, Martin Jansa wrote:
> > > On Fri, Jul 18, 2014 at 01:16:39AM +0200, Martin Jansa wrote:
> > >> From: Martin Jansa <martin.jansa@lge.com>
> > >>
> > >> * backported from 4.8.2, so daisy isn't affected
> > >
> > > Robert, any eta on this one? If we cannot expect this to be merged in
> > > dora in next few days, let me know and I'll temporary add it to
> > > .bbappends in our layers.
> > 
> > Sorry for the late response, I tested it and worked well, I will confirm
> > with RP.
> 
> There were some dora changes merged today, but this one wasn't one of
> them, is there some issue with it?

No issue, its in now, thanks for the reminder.

Cheers,

Richard


