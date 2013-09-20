Return-Path: <walters@verbum.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id C97AB6BD79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 16:19:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 8AF62220D1;
	Fri, 20 Sep 2013 12:19:26 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 20 Sep 2013 12:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=J1iUfL/ZjhNQHC4Rh16vgW
	wqrpc=; b=WCrb1+2C/7C6QpaqcCzgjM/VS02/sSotpyNWIzwaTWsq/dRGu1QBf+
	9GaW6Dl0XyJMla7zDLtvbUwKDnpXmFfk7UJA90I9UjSfuzieCQWe4vyscZ7s+Bjm
	pkTHdR03Ys9zQW+CF5ZQw1EqwsYMWlzuOwWWSHxJk40qhMFDE8Kxc=
X-Sasl-enc: /5No3aS1k01sXA+oOxyF/Oo5nmZ5l2MB/qGZOhqkA1gk 1379693966
Received: from [192.168.1.2] (unknown [66.31.18.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2EE18C00E7F;
	Fri, 20 Sep 2013 12:19:26 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <4037078.8vkzREKUPL@helios>
References: <1379688225-29241-1-git-send-email-paul.eggleton@linux.intel.com>
	<1379693055.1665.9.camel@localhost>  <4037078.8vkzREKUPL@helios>
Date: Fri, 20 Sep 2013 12:19:25 -0400
Message-ID: <1379693965.1665.13.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-26.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: fix broken python script header on machines using buildtools
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
X-List-Received-Date: Fri, 20 Sep 2013 16:19:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-20 at 17:14 +0100, Paul Eggleton wrote:
> Hi Colin,
> 
> On Friday 20 September 2013 12:04:15 Colin Walters wrote:
> > On Fri, 2013-09-20 at 15:43 +0100, Paul Eggleton wrote:
> > >  it also seems sensible to do
> > > this for native as well instead of explicitly trying to exclude that
> > > case.
> > 
> > But someone presumably introduced the explicit special case for native
> > for a reason, I'd expect some blame analysis to be done here to
> > determine whether those reasons were bogus or not.
> 
> I already did that as a matter of course; there is no clue in the message
> for the commit that added it:
> 
> http://cgit.openembedded.org/openembedded-core/commit/?id=08fd9740b9359425ec6ee9810fab1152e9737b0c

Ok, well then I'd expect something in your commit message similar to
"There was no original rationale for why native was special cased, and I
think it should be safe to remove."

It might be still cached in Richard's brain of course...let's see =)



