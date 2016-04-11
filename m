Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 14B786011B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 08:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3B8Zrgt028281; Mon, 11 Apr 2016 09:35:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TfgZGtJzRbLh; Mon, 11 Apr 2016 09:35:53 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3B8ZmIN028258
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Apr 2016 09:35:50 +0100
Message-ID: <1460363748.9308.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Mon, 11 Apr 2016 09:35:48 +0100
In-Reply-To: <20160411014945.GL16135@denix.org>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<20160410225130.GK16135@denix.org> <570AFBA4.40201@windriver.com>
	<20160411014945.GL16135@denix.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] unique -dev package
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
X-List-Received-Date: Mon, 11 Apr 2016 08:35:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-04-10 at 21:49 -0400, Denys Dmytriyenko wrote:
> On Mon, Apr 11, 2016 at 09:19:32AM +0800, Robert Yang wrote:
> > On 04/11/2016 06:51 AM, Denys Dmytriyenko wrote:
> > > On Tue, Apr 07, 2015 at 05:58:13AM -0700, Robert Yang wrote:
> > > > Hello,
> > > > 
> > > > I think that one recipe should only have one -dev package, I'm
> > > > not sure
> > > > whether this is right or not, please feel free to give your
> > > > comments, we
> > > 
> > > I know it is already 1 year since this change. But I can't seem
> > > to find any
> > > discussion or any explanation to why this change was required and
> > > what
> > > specific problem it was supposed to fix. Please point me to a
> > > clear reasoning
> > > of this change. Thanks.
> > 
> > There is only one source package, so there should be only one pack
> > of header
> > files, dev libs, and so on, and they should be placed in a uniq
> > pkg.
> 
> Since you are using "should" twice in the same sentence, can you
> please point 
> me to a ratified RFC?

I couldn't seem to see the history of this discussion in my mail folder
but I do remember some patches along these lines.

The reason for a single -dev package is that the "package chain"
functions we have assumes this. I know there are some specific cases
where we do have multiple -dev packages (qt4, gcc-runtime) but they are
very much in the minority and are special cases.

I'm definitely on record as saying the depchains code needs revisiting
and redoing, preferably with a structured rethink so that we can better
handle situations like this. Until that is done, multiple -dev packages
can cause issues and we did remove some where there didn't seem to be
any real benefit.

Which case is causing problems for you?

Cheers,

Richard




