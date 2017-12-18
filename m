Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0D478292;
	Mon, 18 Dec 2017 21:26:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBILQxdK022026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Dec 2017 13:26:59 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.25.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 18 Dec 2017 13:26:58 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Derek Straka <derek@asterius.io>
Date: Mon, 18 Dec 2017 16:26:57 -0500
Message-ID: <3152872.oFNfv7Rrbj@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CADNbA1qZ=m2MwE78Er4MjBr3jEcQtgE+a4Z-FCDWxLSw1Tc=Eg@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<20171218210256.GQ27580@vctlabs.com>
	<CADNbA1qZ=m2MwE78Er4MjBr3jEcQtgE+a4Z-FCDWxLSw1Tc=Eg@mail.gmail.com>
MIME-Version: 1.0
Cc: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 21:27:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, December 18, 2017 4:07:44 PM EST Derek Straka wrote:
> I also need to look at the UPSTREAM_CHECK_URI for this recipe since it
> isn't finding the latest version and telling me to update the package.

Odd. Let me know how it goes. If it is easier for you to make the changes 
locally and complete the merge go for it.

Mark

> 
> On Mon, Dec 18, 2017 at 4:02 PM, S. Lockwood-Childs <sjl@vctlabs.com> wrote:
> > On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:
> > > I have several customers who have optimized for space and would like to
> > 
> > see
> > 
> > > the capability maintained unless core removes the ability to split
> > > python
> > > packages out.  They also remove the *.py files in favor of *.pyo files
> > 
> > (via
> > 
> > > a custom packaging mechanism).  I have automated tests that go through
> > 
> > the
> > 
> > > module importing on each of the meta-python packages to ensure it works
> > 
> > on
> > 
> > > minimal python installations.  When other contributors don't do provide
> > > that functionality, I either catch it when I do package update or when
> > > it
> > > breaks for one of my customers.  I'm fine if you don't want to perform
> > 
> > the
> > 
> > > checks yourself and it breaks my use case with missing dependencies, but
> > 
> > I
> > 
> > > would prefer that you don't remove the dependencies that are currently
> > > in
> > > place.  Thanks.
> > 
> > Me too -- some of my projects still use NAND for rootfs, where space is
> > tight and
> > ability to split out python modules is very useful. Thus it is not an
> > unused
> > feature, though many projects have SD/eMMC for rootfs and those ones
> > generally
> > will not care about it.



