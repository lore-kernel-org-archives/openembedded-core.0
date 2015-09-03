Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 3F33076FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 19:16:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 3EF683C88695
Message-ID: <1441307813.2977.33.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Date: Thu, 03 Sep 2015 20:16:53 +0100
In-Reply-To: <CAJTo0LYnmyRGKb0Tjunn8__GYB5mRPkm_dUyrb8678EC2YPhyA@mail.gmail.com>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<9f749745e56f33bc00d0e08dd4951840b29a557d.1441291646.git.joshua.lock@collabora.co.uk>
	<1441293176.24871.118.camel@linuxfoundation.org>
	<CAJTo0LYnmyRGKb0Tjunn8__GYB5mRPkm_dUyrb8678EC2YPhyA@mail.gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] systemd: remove hard-coded paths in FILES entries
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
X-List-Received-Date: Thu, 03 Sep 2015 19:16:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 16:22 +0100, Burton, Ross wrote:
> 
> On 3 September 2015 at 16:12, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > From what I remember, this is intentional and this change likely
> > breaks
> > multilib. You don't want two sets of rules on a multilib system.
> > 
> Indeed - you need nonarch_base_libdir or whatever it's called here I
> think, as that doesn't get renamed by multilib.

Got it, thanks - I'm testing a v2 series with a multilib build thrown
in to the mix.

Thanks both for the feedback,

Joshua

