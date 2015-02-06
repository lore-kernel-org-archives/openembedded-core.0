Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6F15C72E0A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t16FDGwa006114; Fri, 6 Feb 2015 15:13:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EPCzQn4r1oK7; Fri,  6 Feb 2015 15:13:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t16FD2HQ006104
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 6 Feb 2015 15:13:13 GMT
Message-ID: <1423235582.20217.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 06 Feb 2015 15:13:02 +0000
In-Reply-To: <20150206150241.GG2287@jama>
References: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
	<4479188.gEPuv5Te0O@peggleto-mobl5.ger.corp.intel.com>
	<1423222962.20217.13.camel@linuxfoundation.org>
	<CAP9ODKqxCyd=h0ZdyjjY+eogPumbtY3VMBwvskSBQEcw8+D5+g@mail.gmail.com>
	<CAJTo0LZeVbSajYg6iNZo33O1BGRrU8SuQgnDA=Ra+XpOFprcuQ@mail.gmail.com>
	<CAP9ODKoE12hnigK3Z1MKjV5TYRu-EACd2KsCgD0M2hZSEFeNww@mail.gmail.com>
	<20150206150241.GG2287@jama>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Fri, 06 Feb 2015 15:13:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-06 at 16:02 +0100, Martin Jansa wrote:
> On Fri, Feb 06, 2015 at 12:21:23PM -0200, Otavio Salvador wrote:
> > On Fri, Feb 6, 2015 at 12:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > On 6 February 2015 at 14:10, Otavio Salvador <otavio@ossystems.com.br>
> > > wrote:
> > >>
> > >> I think they should re-run. Otherwise we can end having errors and QA
> > >> issues unnoticed until a full rebuild.
> > >
> > >
> > > That was the state of things until my original patch last week.  The patch
> > > had the side-effect that changing QA tasks causing *everything* to rebuild.
> > > I'm really not sure that's a good solution.
> > 
> > If someone adds a QA tasks it is because it matters. In this case we
> > ought to have it in an immediate effect so it does makes sense to
> > rerun everything.
> > 
> > I know it is bad from build time point of view but predictability and
> > correctness is more important from my point of view.
> 
> Agreed, especially when someone decides to make something fatal it
> should highlight all failing recipes before it's enabled in "official"
> build instead of sneaking the failures one-by-one as sstate is being
> invalidated by other changes.

Thinking about this from the other angle. Should someone having a
different set of WARN/ERROR local settings mean they don't reuse sstate?

Cheers,

Richard



