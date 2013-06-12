Return-Path: <sakoman@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id CD3896AAAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:30:24 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id n10so2583902oag.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GGzXA02xRupJp3Fz7RiqMlji9end8LXPX3t001lHBZc=;
	b=aqS155xWWVm98b8zprJZYarmIZFWAri1p9UIAPBBVyxUvc0/WBCST1h/WbYsyE3v4M
	vGN14tlpWt1vcGkx6EFo3D3I4RysggfzdWC/pqVzZ8AOo3FF+npq76lklV6SleoGRzjw
	TYSz6cNyK3F/l0LT9x6FnpVmVppk9wWhgQKP2Nw9pOJNJmM860xqlRKwx3A/xuJfKn7o
	qssyOAvVu6GIpv6ybmHLOV2/BbR/V64yZX2o3NHxRUy7pPphoeXyXYVgdZiMH+pMZ2fB
	YZF+p7Jk3lMqUhlYFwBKgDyCoLmjOVcIoKa+3IkQ+TR1mSwb9Hg/sSG3VyXTTP+v5R6c
	8zNA==
MIME-Version: 1.0
X-Received: by 10.182.227.133 with SMTP id sa5mr15018597obc.96.1371043825917; 
	Wed, 12 Jun 2013 06:30:25 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Wed, 12 Jun 2013 06:30:25 -0700 (PDT)
In-Reply-To: <51B875C8.2080403@communistcode.co.uk>
References: <CAGDS+nkMujRn-M+Oja==L+kMynx0-P0WxZWeVaSsAHJGGWPUUA@mail.gmail.com>
	<51FB023E-F4EC-42A6-8230-D40DDD2542AE@dominion.thruhere.net>
	<CAGDS+nnsT3TVesy=k6a0mqTtz1EFG68XGVQcGRqc-o_vbN4sjA@mail.gmail.com>
	<51B875C8.2080403@communistcode.co.uk>
Date: Wed, 12 Jun 2013 06:30:25 -0700
Message-ID: <CAGDS+nk-6LCKPZJxWMocKk3QDrg0zPa2mPxuZtU7MpP7k0T1=A@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: ml@communistcode.co.uk, Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Possible to fetch from private github repo?
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
X-List-Received-Date: Wed, 12 Jun 2013 13:30:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 12, 2013 at 6:21 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:

> Ditto, I grab from a private repo's using validated ssh-keys without issue.
> Just ensure that the machine you're running bitbake on is the machine that
> has been validated, and you have set the protocol to ssh and you should be
> fine!

It is working now.

My ssh keys were in order.  But as is often the case the problem was me :-)

I cut and pasted the ssh address from the github web page for the
repo, added the git://  in front and the ;protocol=ssh at the end, but
neglected to convert the : in the supplied address to a /

With that one character change all is well.

Thanks!

Steve

