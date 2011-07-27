Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qm8OQ-0006W0-RX
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 19:59:39 +0200
Received: by gwb11 with SMTP id 11so1290799gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jMXOu/5fdH3cG/9iW3Ad4LtynB2ZU0O2BEqLm7c5PoU=;
	b=gd34s1YxMxuMqMvl/d0eSXhaCtS+L0+2wjK85NUXxD6jFBOX8DrbpC5dlgNuemq0o0
	g5ZQntVIxuTTGlj3uZImp98iQH+GKPYtZay4ubFaOAy6UievnENU7YmBwQ0/o8y/gJJ0
	7NZAs42ab1ElX2sURKt24ijuvJ+ulWNntUBW0=
Received: by 10.68.35.70 with SMTP id f6mr90317pbj.506.1311789323402;
	Wed, 27 Jul 2011 10:55:23 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u6sm99832pbh.32.2011.07.27.10.55.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 10:55:22 -0700 (PDT)
Date: Wed, 27 Jul 2011 10:56:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110727175618.GC14766@sakrah.homelinux.org>
References: <cover.1311234475.git.sgw@linux.intel.com>
	<1311280985.2344.82.camel@rex>
	<BD5C61B9-8EC9-4C55-AE35-71D9B022F532@kernel.crashing.org>
	<1311325508.2344.102.camel@rex> <1311326309.2344.104.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1311326309.2344.104.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [CONSOLIDATED PULL 00/20] July 21, 2011
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
X-List-Received-Date: Wed, 27 Jul 2011 17:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > There is something in my patch workflow which seems to corrupt dos line
> > endings. I've manually fixed the patches which were out of sync in poky
> > compared with OE-Core and am looking into how this happened with a view
> > to fixing the scripts.
> 
> The reason is we need to use "git am --keep-cr". I've updated my local
> scripts and we're also checking the layer handling tools. I haven't
> switched to them yet as we haven't had a lull in the patches to allow me
> to make the transition. I've got that pencilled in for after multilib is
> done.

configuring the clones repo with

git config am.keepcr true

will make it automatic

> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


