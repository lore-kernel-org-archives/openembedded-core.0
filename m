Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNXVj-0007qq-Uz
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 23:45:32 +0200
Received: by pzk36 with SMTP id 36so1916660pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 14:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PcXO2XdThvEEvG6LsW4nnGZcsfnsbbp0cdJtiTtkhik=;
	b=BrWxjIX93ppx2hc63odvVwziE8cC+mD+jNFFbbBjuLx+9Ex+X7E5DH12PvZmyXu2X6
	FTc4SM+BFlKkx2AlrmsMgeug/pp7VSKGjDy5rgL+lUm3xuxALyFsNK/Qwn08oU8VQnP6
	idbYFTJxDkGV9HN8GL1fSQXhP333+3Lge6QBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LMtivt8wzStBW/N/E3q1dAc1FAnm3PWhxnhED8dVx+74XSV5pIw9zVEExcqNJJKXfl
	G6jLaaIf8LCQ6paHON7bJQ+dEd7BIhf06YZZ4XaWEA6IqG6i4G+ZkHEOEDfWMu8HPEkq
	MqhiJIbhHFn2pVPbE8ivjqeGWthI903BUYdQg=
Received: by 10.68.65.36 with SMTP id u4mr49849pbs.156.1305927753651;
	Fri, 20 May 2011 14:42:33 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r7sm2681624pbo.52.2011.05.20.14.42.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 14:42:32 -0700 (PDT)
Date: Fri, 20 May 2011 14:41:21 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110520214121.GA7156@sakrah.homelinux.org>
References: <1305563748.2429.76.camel@phil-desktop>
	<BANLkTikh-we7ziQCB5ywApYhw63NOWiUfQ@mail.gmail.com>
	<1305576661.18415.6.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1305576661.18415.6.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: uclibc?
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
X-List-Received-Date: Fri, 20 May 2011 21:45:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/05/11 21:11), Phil Blundell wrote:
> On Mon, 2011-05-16 at 10:01 -0700, Khem Raj wrote:
> > On Mon, May 16, 2011 at 9:35 AM, Phil Blundell <pb@pbcl.net> wrote:
> > > I've just been trying to build a uclibc-based system from the current
> > > head of oe-core but this doesn't seem to be something that works
> > > entirely smoothly at the moment.  Does anybody have a patchset to fix
> > > the uclibc recipes, or is anybody working on such a thing?
> > >
> > 
> > I have not fixed uclibc in oe-core yet but if you use
> > meta-openembedded layer along with oe-core
> > then the uclibc in that layer should work pretty well on top of
> > oe-core. Eventually
> > it should move into oe-core one of these days.
> 
> I just tried that and now I get a failure in gcc-intermediate due to
> missing linux/limits.h.  Not quite sure what's gone wrong there.

hmmm kernel-headers may be missing some bits.
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


