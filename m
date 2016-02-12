Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D434660125
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 13:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CDeDav022667; Fri, 12 Feb 2016 13:40:49 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KIzvsQ-7eukR; Fri, 12 Feb 2016 13:40:49 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CDel8S022681
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 12 Feb 2016 13:40:48 GMT
Message-ID: <1455284447.16142.314.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Barros Pena, Belen"
	<belen.barros.pena@intel.com>
Date: Fri, 12 Feb 2016 13:40:47 +0000
In-Reply-To: <20160212132522.GC2607@jama>
References: <CA+chaQd-Yyno+uQOXKZgRqjTUSURtr0X8eSMAO3iRNf3AP_Cmw@mail.gmail.com>
	<D2E380AD.73A80%belen.barros.pena@intel.com>
	<20160212132222.GB2607@jama> <20160212132522.GC2607@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Parsing exception with latest oe-core
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
X-List-Received-Date: Fri, 12 Feb 2016 13:40:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-12 at 14:25 +0100, Martin Jansa wrote:
> On Fri, Feb 12, 2016 at 02:22:22PM +0100, Martin Jansa wrote:
> > On Fri, Feb 12, 2016 at 11:31:10AM +0000, Barros Pena, Belen wrote:
> > > 
> > > 
> > > On 12/02/2016 10:52, "
> > > openembedded-core-bounces@lists.openembedded.org on
> > > behalf of Martin Jansa" <
> > > openembedded-core-bounces@lists.openembedded.org
> > > on behalf of martin.jansa@gmail.com> wrote:
> > > 
> > > > Hi,
> > > > 
> > > > 
> > > > is anyone else seeing this unhelpful fatal exception?
> > > 
> > > FWIW, I am 
> > > 
> > > http://piratepad.net/2E3lnayxi8
> > > 
> > > Cheers
> > 
> > Upgrading bitbake helped here, so it's probably fixed in one of
> > these 2:
> > 4a6a8d0 buildinfohelper: unset brbe variable when build finishes
> > f673079 cooker: gracefully shutdown parsers
> > 
> > 
> > I wish that the bitbake version and BB_MIN_VERSION were bumped to
> > get
> > more reasonable error message than this unhelpful exception.
> 
> This is probably the oe-core change which triggers this behavior, it
> even mentions required bitbake changes in commit message.
> 
> RP: Why didn't you bump BB_MIN_VERSION?

I meant to and simply forgot, sorry :(. 

Will do this now.

Cheers,

Richard

