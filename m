Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBJ1f-0008LX-2y
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:28:43 +0200
Received: by iaky10 with SMTP id y10so103102iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 22:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Ljou6EfFDnpPNm/Zk0NcUy93UaehkSrIrCChR1jwMXg=;
	b=ZmxyB+aqsW9Jxlx/HgHKRuzIzgeTQhTwmsjdy2cD4thmdKfIZ6f3ewUheggtXruUmL
	FKv9VBNUceUE7NtUFyngfBQcsi96EifkNDjGiiUKtkBsGoY0qUOHh5Q509SwSaGqk8LX
	617R34leVhhsxLaIkmQld4i5Ct8VXUpEwdmoTTvBr/5ROqbm7vK6wtAc4uVOkV5AcUQI
	RECACzcizj5oyFWCa7YX0ferksPxFO/U0ZbXxy9byhHtIGcTkUnj5lUwwZj/QuA36JYq
	iYleWx4sjGCs9tQi3xmR49oPMXXvRjBxGpE2W24LepmK6rPYXG1gwn/CtVpE/m9U/uSW
	2LiA==
Received: by 10.50.160.228 with SMTP id xn4mr19690126igb.1.1347340572215;
	Mon, 10 Sep 2012 22:16:12 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id p5sm699939igm.13.2012.09.10.22.16.10
	(version=SSLv3 cipher=OTHER); Mon, 10 Sep 2012 22:16:11 -0700 (PDT)
Date: Mon, 10 Sep 2012 22:16:04 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120911051602.GA3035@sakrah.homelinux.org>
Mail-Followup-To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
	<20120911045038.GE2980@sakrah.homelinux.org>
	<504EC385.6060008@windriver.com>
	<20120911045557.GF2980@sakrah.homelinux.org>
	<504EC4F3.30705@windriver.com>
MIME-Version: 1.0
In-Reply-To: <504EC4F3.30705@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 05:28:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/09/12 00:58), Bruce Ashfield wrote:
> On 12-09-11 12:55 AM, Khem Raj wrote:
> >On (11/09/12 00:52), Bruce Ashfield wrote:
> >>On 12-09-11 12:50 AM, Khem Raj wrote:
> >>>On (10/09/12 14:11), Bruce Ashfield wrote:
> >>>>Updating to 3.4.10 which has been soaking for a bit now, as well
> >>>>as picking up the following meta commits from Tom Z:
> >>>
> >>>would it also need bumping linux-libc-headers too ?
> >>
> >>There's no new interfaces in the -stable updates, so there's no reason
> >>to bump. I typically elect to jump to a 3.x.0 and leave it there, but
> >>we had an interim bump that I wouldn't have done .. so we sit at 3.4.3
> >>at the moment (which is still fine).
> >
> >OK. Next question is, do stable updates get changes such that we need to
> >bump the linux-libc-headers ?
> 
> Not that I've ever seen. 

OK thats what I was expecting to hear
so in theory if we always pin linux-libc-headers to major release we are
good. say 3.4.0 and then 3.6.0 and so on we really dont need 3.4.1 or
later and similarly for other versions. In this case we only bump
the linux-libc-headers recipe when we add a new major kernel release

Since there are no new features or user exported
> defines that make it into the -stable updates, using the base
> version headers
> is reasonable. It saves churn, and keeps all of the QA and testing
> results directly applicable throughout feature freeze by leaving the
> the stable.
> 
> Cheers,
> 
> Bruce
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


