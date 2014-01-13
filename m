Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id 782756B5D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 11:52:58 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost.zedat.fu-berlin.de (Exim 4.82)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1W2g4f-0049t6-Fo>; Mon, 13 Jan 2014 12:52:57 +0100
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.82)
	for openembedded-core@lists.openembedded.org with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1W2g4f-0013Qs-Dl>; Mon, 13 Jan 2014 12:52:57 +0100
Date: Mon, 13 Jan 2014 12:52:49 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140113115249.GA22825@mail.zedat.fu-berlin.de>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
	<20140113102147.GK16995@jama> <52D3C44B.20403@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52D3C44B.20403@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 94.198.62.204
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Mon, 13 Jan 2014 11:52:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 13, 2014 at 06:47:39PM +0800, Robert Yang wrote:
> 
> On 01/13/2014 06:21 PM, Martin Jansa wrote:
> >On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
> >>* The archive*.bbclass didn't work, and there were a few problems, for
> >>   example:
> >>   1) There were a few duplicated code
> >>   2) There was no src_dir.org (or orig), but the diff command still use
> >>      it, and it is not easy to fix this issue if we don't change a lot
> >>      of the code.
> >>   3) It didn't archive the source for the native or gcc
> >>   4) The work flow is not very well
> >>   5) The "subprocess.call('fakeroot cp xxxx'" should be removed
> >>   6) And others ...
> >>
> >>* So that we have to refactor it, the benefits are:
> >>   1) Fix the problems and make it work well.
> >>   2) Reduce more than 400 lines in total.
> >>   3) Make it easy to use.
> >
> >Have you seen
> >http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087729.html
> >?
> >
> >Could you review it/integrate changes from it?
> 
> I've looked at it just now, I think the problems that you mentioned have been
> fixed during the refactor. It won't install/remove the files manually any more,
> they will be installed/removed by the sstate. And the usage become easier, just
> this would be OK by default:
> 
> INHERIT += "archiver"
> 
> And we can easily add other functions when needed.
> 
> // Robert
> 

Hi Robert,

does the whole thread means it is broken in dora too? Are there plans to backport the patches?

Bye Henning

