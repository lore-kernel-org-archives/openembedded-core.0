Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id CB52E6F139
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 11:03:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,539,1389744000"; d="scan'208";a="65910701"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 25 Feb 2014 11:03:56 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WIFnn-0000Wy-Vn; Tue, 25 Feb 2014 11:03:55 +0000
Date: Tue, 25 Feb 2014 11:03:55 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Message-ID: <20140225110355.GA32190@mcrowe.com>
References: <1393194057-2364-1-git-send-email-mac@mcrowe.com>
	<CAMKF1speSb1EJmaqZomq6GZ41Zg5WmFd0+e0fXiJBUiGE_WPMQ@mail.gmail.com>
	<1393315179.31769.22.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1393315179.31769.22.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: upgrade to 7.35.0
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
X-List-Received-Date: Tue, 25 Feb 2014 11:03:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 25 February 2014 at 07:59:39 +0000, Richard Purdie wrote:
> On Mon, 2014-02-24 at 21:33 -0800, Khem Raj wrote:
> > On Sun, Feb 23, 2014 at 2:20 PM, Mike Crowe <mac@mcrowe.com> wrote:
> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > > ---
> > >  meta/recipes-support/curl/curl_7.34.0.bb |   63 ------------------------------
> > >  meta/recipes-support/curl/curl_7.35.0.bb |   61 +++++++++++++++++++++++++++++
> > 
> > can you generate patches with git format-patch -M ? makes renames
> > detection better
> > and patches are simple to review
> 
> Cristiana sent out a patch for the same upgrade about the same time and
> I have to admit I took the other one since it was generated with -M and
> I could review it more easily...

It looks like you were wise to do so. Using format-patch -M on my commit
showed that I'd based mine on an old version of curl_7.34.0.bb.

Thanks, Khem, for the -M advice; I shall add it it to my checklist.

Mike.

