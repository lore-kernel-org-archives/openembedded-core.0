Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnwpM-0001PX-OG
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 20:02:56 +0200
Received: by gxk3 with SMTP id 3so3731775gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w/THKfLWoUFWCtD51pmCHevnC+B2lBvYK/qXZhzGubE=;
	b=wmjaPShDpGKM7erN4LZZCMDqM8yJjdXfre2DbiodQxxQ4+xy8kGCzvpEPLy4lViZpU
	g2wayI7ZuE/KH4KV9YmPIFfZGy0rDacNeIlmWduc4s25hsKp2KhvDQcWCbzB9OONF9dU
	YNyAkeXOXI8VZGbnbbnnrNR57XkYTcNrk3Fto=
Received: by 10.68.2.134 with SMTP id 6mr8863342pbu.368.1312221515328;
	Mon, 01 Aug 2011 10:58:35 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d3sm3114137pbg.60.2011.08.01.10.58.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 10:58:34 -0700 (PDT)
Date: Mon, 1 Aug 2011 10:59:58 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110801175958.GE7798@sakrah.homelinux.org>
References: <1312206333.2344.456.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1312206333.2344.456.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Commits to master in my absence
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2011 18:02:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/08/11 14:45), Richard Purdie wrote:
> I'm a little frustrated to see what happened when I was away from a
> couple of days. I thought we'd agreed we'd queue up patches in a branch
> and then I'd take care of things when I got back.
> 
> I appreciate a serious bug was then found and a fix was committed
> against what I thought was agreed. This then opened the gates and more
> patches were merged with decreasing severity and in the end something
> got added which is just plain broken :(.
> 
> The problematic patch is:
> 
> http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=e23f9ce928353c9da2b9c4bfa9a1a125a7d160f2
> 
> and I've commented in emails elsewhere against the various attempts to
> further "fix" this.
> 
> I *really* need people to step up and start thinking about quality and
> the long term impact of changes rather than just X fixes bug Y which I'm
> hitting right now. This is particularly true if anyone wants to step
> into the position of doing final commit merging. You *have* to take the
> time to fully understand and review the changes you're adding and
> consider the big picture.
> 
> I'm really hoping that I can find people who I can share the final
> review/commit responsibility with but until people stop presenting me
> patches which I have to reject we're not going to get the point where
> they can work in that role :(.
> 
> This is particularly frustrating since I've seen people push patches
> they know to be lacking in quality just because they were running low on
> time and hoped they might get away with it.
> 
> Cheers,
> 
> Richard (a bit disappointed)

It was me.
since master was broken for arm (even qemuarm) after the tune overhaul
It was a mimimum workaround since many devs were complaining about it I
thought until we rework the tune overhaul this could be a survival path
and at the same time tune overhaul for arm could be worked out. I was
just thinking about making devs keep going.
But I apologize for this. Kindly revert it.

-Khem


