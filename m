Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5826FAEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 16:18:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2OGIGX7001831; Mon, 24 Mar 2014 16:18:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RkHbM09cLJrO; Mon, 24 Mar 2014 16:18:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2OGIC7U001816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 24 Mar 2014 16:18:13 GMT
Message-ID: <1395677886.24890.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Austin <jonathan.austin@arm.com>
Date: Mon, 24 Mar 2014 16:18:06 +0000
In-Reply-To: <533058C1.3000102@arm.com>
References: <1395676843.24890.7.camel@ted> <533058C1.3000102@arm.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Features in Yocto Project 1.7
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
X-List-Received-Date: Mon, 24 Mar 2014 16:18:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-24 at 16:09 +0000, Jonathan Austin wrote:
> On 24/03/14 16:00, Richard Purdie wrote:
> > As development on 1.6 finishes up, its time to think about what we
> > should be doing in the 1.7 cycle.
> >
> > I think from my perspective, in 1.7 I'd like to see us looking at
> > "Developer Workflow". Its a generic topic which I think covered multiple
> > areas (in no particular order):
> >
> > * the ADT/SDK and how it intergrates into the rest of the system
> > * toaster
> > * python devshell
> > * exteralsrc.bbclass
> > * memory resident bitbake
> > * how a standalone app developer might build an image
> > * locked sstate
> 
> Is there a wiki page that collates the enhancement requests that have 
> lead to this list? For example, if I want to discuss the issue of "how a 
> standalone app developer might build an image" (I do!) then where should 
> I go? On the list? Bugzilla for 'standalone image' doesn't appear to 
> have an item for this (unless I'm pounding my keypad incorrectly for 
> Bugzilla).

Whilst this is a key area I'd like to see worked on in 1.7 and I do have
ideas related to it, they're in various states of development. Some have
bugzilla entries and good information, others are much less well
formulated and don't have bugzilla entries yet.

So no wiki page exists and the "standalone app developer might build an
image" item isn't well defined as yet. There have been some developments
which lead into it like wic and the locked sstate work though.

Here on the mailing list is probably as good a place as any for the
discussion, which can then be turned into something in the bugzilla.

Cheers,

Richard




