Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A71BB7F696
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:13:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47BbXf3kScz4c;
	Mon, 11 Nov 2019 17:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573488835;
	bh=iNKKShZECofm9Pjj2T+fAtS76N8/F+RRjZ3d1i3pJVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1hqKurUsaH2fA/Abjdo3XDuMzUJhafSjXNP2GV5juWEo7cKLJY4phRm4rp4MASfm
	Sbp0hiMYwp/Q+Z6WrX70XhXi7LgaXE8HqZsBSDq2l+nfuRp3Dq9x38w3V6amupa1Rm
	GLKUCbstGz/3XLMsrAHKmL1o1vqqRiy+MiijthBFslNIUEdjzYTeZf3V5FLTTFvH6j
	wxdNPiBTfKwm/eGbYsDBX1GEb5Ep+UdWZYOdrLPsP0tUQnNNzacSef2Rjc/fo8Cezf
	gEGWKZmtRJfSIIjF6U3OSHIJ3JlAewgcnrGIit/Jkh4YNtdK+dn2zn/wyfKNcNKG0I
	iEi+by+K7IQUMyiW0lbSDTxqESnvbrKv7u76waqBKgynFxI8P15hrC1Cx95y609Vrm
	xjYxqc7lGBLumg0d6Xp6Mj/Havu3XN6iXXjIAhlh0GeSYQ5F2/VAXKjJeExoN3KXSp
	jN0lkzJbRiQEpQuBnEIbgPSVUQKqaCP5bMMtwQbYW2nJdP69Nhtr8lvSsnKwxf3Oxf
	9tQ2/QujleF3hEzQjl7WbAVXX2ZJ/1y+n0Xk7GhBFFC0cmO5JUNRCuVxa6TnWeSF3D
	XatKHz9Gbsoqn0L0PhXzShyAu7TPu+zkhgYDnVkIXQvAQSddBS1Y0C7cOpHhPCkocZ
	YajCJctoO0l0bQwwHrAP30Ds=
Date: Mon, 11 Nov 2019 18:13:52 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191111161352.GG28797@localhost>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
	<717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
	<be45a323-4379-8a13-71c6-21f98e3a0af4@gmail.com>
	<afa8eed45a5acefa38a89e82e5a833f387963a8f.camel@linuxfoundation.org>
	<20191111104209.GB28797@localhost>
	<63e30a3a07cd78e89c54637ad9893e8a1aec9f84.camel@linuxfoundation.org>
	<20191111141416.GF28797@localhost>
	<455f1e8afcbfac40259ee8942d1a67ca5ce23264.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <455f1e8afcbfac40259ee8942d1a67ca5ce23264.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Mon, 11 Nov 2019 16:13:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 11, 2019 at 07:54:34AM -0800, Khem Raj wrote:
> On Mon, 2019-11-11 at 16:14 +0200, Adrian Bunk wrote:
> > On Mon, Nov 11, 2019 at 01:12:47PM +0000, Richard Purdie wrote:
>...
> > > As I've said in a few places, the TSC really needs to figure this
> > > out
> > > and its complicated by the LTS discussions. Those discussions are
> > > happening but aren't simple.
> > 
> > Past releases and future releases might be separate topics.
> > 
> > Please keep in mind that many people already have to support products
> > on existing stable branches, working under the assumption that
> > patches 
> > submitted by the community will be accepted.
> > 
> > Closing future non-LTS branches early might be OK if this is part of
> > a 
> > clearly communicated EOL schedule for future LTS and non-LTS
> > releases, 
> > like it is clear when Ubuntu releases will be released and for how
> > long 
> > they are supported.
> > 
> > But this visibility on upstream support is needed before deciding on
> > a Yocto release for a product. Future LTS releases are irrelevant
> > for 
> > existing products that cannot move to a different stable branch.
> 
> current and prior two releases are actively maintained.

"master and the latest 2 stable branches"
(AFAIK thud is no longer actively maintained)

> So that should
> have been the consideration when selecting a release for production in
> past. see
> 
> https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

Which also says "but well-tested patches may still be accepted for them".

The question is exactly how the patch acceptance for the community 
maintained stable branches works for people who are maintaining
products on these older branches.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


