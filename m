Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5A009780BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 16:19:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4UGJ9R5013782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 30 May 2017 17:19:10 +0100
Message-ID: <1496161149.6630.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 30 May 2017 17:19:09 +0100
In-Reply-To: <CAHUNapR0bPQq4qJnzK-ddPzn-m-0FCtVYLDBMsBuLY=eJUgmZg@mail.gmail.com>
References: <20170526212248.16374-1-twoerner@gmail.com>
	<1496100337.25229.147.camel@linuxfoundation.org>
	<CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
	<1496130475.25229.160.camel@linuxfoundation.org>
	<20170530152738.GA24515@linux-uys3>
	<1496159050.6630.12.camel@linuxfoundation.org>
	<CAHUNapR0bPQq4qJnzK-ddPzn-m-0FCtVYLDBMsBuLY=eJUgmZg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 30 May 2017 17:19:10 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Tue, 30 May 2017 16:19:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-05-30 at 12:00 -0400, Trevor Woerner wrote:
> On Tue, May 30, 2017 at 11:44 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > > 
> > > Maybe this would be a better way forward? Enable it, always, in
> > > ./configure,
> > > add the patch to check for it in the code itself, then you can
> > > build
> > > for all
> > > the gallium targets (including swrast) and know that the patented
> > > code will
> > > only kick in where it's supported in hardware (and thus patent-
> > > safe)?
> > That sounds like exactly what we need to do!
> Okay. The only caveat being, if someone actually *wanted* to enable
> float for swrast, this would prevent them from going down that path.
> 
> ajax on #dri-devel pointed out that some piglit tests go from pass to
> fail instead of being skipped as a result of the above patch since
> the
> piglit tests are done with swrast and run very poorly without float
> enabled.

If someone really wants to enable it, they can drop the patch. I'm open
to feedback from others like Ross/Jussi but IMO I think we can accept
the degraded piglit results for swrast...

Cheers,

Richard

