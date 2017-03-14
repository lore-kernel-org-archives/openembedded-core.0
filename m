Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AF5CE77824
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2EHZSIA027646; Tue, 14 Mar 2017 17:35:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4yVDXwDgGrIO; Tue, 14 Mar 2017 17:35:28 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2EHZOTr027622
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Mar 2017 17:35:25 GMT
Message-ID: <1489512924.13980.54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 14 Mar 2017 17:35:24 +0000
In-Reply-To: <CAP9ODKr_wVYKauiRWu9310DJ3zPkDQ7iuMeFAiN3J7rx2q76VQ@mail.gmail.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1489504451.13980.41.camel@linuxfoundation.org>
	<CAP9ODKp5zA3egzti=OfYD7YvpHqhE9n4YOhJagOc4rZurbA85w@mail.gmail.com>
	<1489511640.13980.47.camel@linuxfoundation.org>
	<CAP9ODKr_wVYKauiRWu9310DJ3zPkDQ7iuMeFAiN3J7rx2q76VQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/44] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Tue, 14 Mar 2017 17:35:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-14 at 14:17 -0300, Otavio Salvador wrote:
> On Tue, Mar 14, 2017 at 2:14 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Tue, 2017-03-14 at 13:48 -0300, Otavio Salvador wrote:
> > > 
> > > On Tue, Mar 14, 2017 at 12:14 PM, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > ...
> > > > 
> > > > 
> > > > Despite this I merged it on the basis that I'd rather have this
> > > > in
> > > > pyro
> > > > rather than waiting another 6 months to get this in and having
> > > > to
> > > > tell
> > > > people we were changing soon and having to deal with any more
> > > > smart
> > > > issues.
> > > ...
> > > 
> > > This kind of change should have been merged in November, not less
> > > of
> > > two months of release. One more time heavy changes been commited
> > > late
> > > on release.
> > In this case the patches have been talked about and in review on
> > the
> > mailing list for months so I really don't think anyone can be
> > surprised. It was also a stated release objective to do something
> > about
> > smart.
> > 
> > Also, nobody replied to the status reports where I discussed
> > merging or
> > not merging either so I could only assume nobody had opinions.
> I remember Mark sending a reply with some considerations and to be
> honest, I did not anticipate it was being considered such late on
> release.

FWIW I do agree it is late in the cycle, almost too late and if things
hadn't been delayed for other reasons it wouldn't have made it.

That said, I do believe we'd potentially hurt OE more by waiting given
the stage the patchset had got to rather than merging it now and
dealing with whatever we need to deal with.

Its a judgement call, I have to make them on a regular basis. Some you
never need to notice, some like this one are controversial and can be
argued both ways. I can think of at least one in the past that went
badly wrong. 

So I appreciate the concern and I do have some of my own but I have now
made the decision and we'll now get to see how that works out. It
wasn't an easy one...

Cheers,

Richard


