Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id E1F666067D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 19:10:22 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5H00I3DH9AXKA0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2016 14:10:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=ij1c-rEgsU70pJSVk7gA:9
	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 1dd22290; Mon, 11 Apr 2016 19:10:22 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 23034161F92; Mon,
	11 Apr 2016 15:10:22 -0400 (EDT)
Date: Mon, 11 Apr 2016 15:10:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gary Thomas <gary@mlbassoc.com>
Message-id: <20160411191022.GS16135@denix.org>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<20160410225130.GK16135@denix.org> <570AFBA4.40201@windriver.com>
	<20160411014945.GL16135@denix.org>
	<1460363748.9308.30.camel@linuxfoundation.org>
	<20160411134240.GO16135@denix.org> <570BB0B6.4070907@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <570BB0B6.4070907@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 11 Apr 2016 19:10:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 11, 2016 at 04:12:06PM +0200, Gary Thomas wrote:
> On 2016-04-11 15:42, Denys Dmytriyenko wrote:
> >On Mon, Apr 11, 2016 at 09:35:48AM +0100, Richard Purdie wrote:
> >>On Sun, 2016-04-10 at 21:49 -0400, Denys Dmytriyenko wrote:
> >>>On Mon, Apr 11, 2016 at 09:19:32AM +0800, Robert Yang wrote:
> >>>>On 04/11/2016 06:51 AM, Denys Dmytriyenko wrote:
> >>>>>On Tue, Apr 07, 2015 at 05:58:13AM -0700, Robert Yang wrote:
> >>>>>>Hello,
> >>>>>>
> >>>>>>I think that one recipe should only have one -dev package, I'm
> >>>>>>not sure
> >>>>>>whether this is right or not, please feel free to give your
> >>>>>>comments, we
> >>>>>
> >>>>>I know it is already 1 year since this change. But I can't seem
> >>>>>to find any
> >>>>>discussion or any explanation to why this change was required and
> >>>>>what
> >>>>>specific problem it was supposed to fix. Please point me to a
> >>>>>clear reasoning
> >>>>>of this change. Thanks.
> >>>>
> >>>>There is only one source package, so there should be only one pack
> >>>>of header
> >>>>files, dev libs, and so on, and they should be placed in a uniq
> >>>>pkg.
> >>>
> >>>Since you are using "should" twice in the same sentence, can you
> >>>please point
> >>>me to a ratified RFC?
> >>
> >>I couldn't seem to see the history of this discussion in my mail folder
> >>but I do remember some patches along these lines.
> >>
> >>The reason for a single -dev package is that the "package chain"
> >>functions we have assumes this. I know there are some specific cases
> >>where we do have multiple -dev packages (qt4, gcc-runtime) but they are
> >>very much in the minority and are special cases.
> >>
> >>I'm definitely on record as saying the depchains code needs revisiting
> >>and redoing, preferably with a structured rethink so that we can better
> >>handle situations like this. Until that is done, multiple -dev packages
> >>can cause issues and we did remove some where there didn't seem to be
> >>any real benefit.
> >>
> >>Which case is causing problems for you?
> >
> >Thanks, Richard.
> >
> >I was updating some of our old recipes to work with the latest code and had to
> >replace dependencies on libblah-dev to blah-dev as well as -staticdev and -dbg
> >in several places. When tried to dig up any relevant discussion on this matter
> >either as a discussion or clear explanation of the problem this causes, I
> >couldn't find any, hence my inquiry.
> >
> 
> You might have been thinking about my problems with -dbg packaging that
> currently breaks a number of dependencies.  Bug #9104

So, why -dbg cannot follow the example of -dev and -staticdev packages? I.e. 
in your ffmpeg example it would mean creating all the necessary libblah-dbg 
packages. Why isn't it the option?

-- 
Denys

