Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOvz2-0006SJ-0f
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 20:05:32 +0200
Received: by pvc30 with SMTP id 30so3163340pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=b4v3nLRMzVUivMcdQ7vR10S+WoItNL6f6sfshSjhewU=;
	b=Rz+qhKjkvcjkp6l9h9sxGVn6wTSnkCW49iKTg2q+DhUkGVAE6pl/d2MKtMS6C00qZ5
	0o5NlN1ek6WpOqzfgQSuqpaK9hHsg0lj1FHvCkLZ5AO1I56WQ6nZismHiDDAXQdMWDpK
	LoYOdLiUvPSZn1L3y+0m3H2X4zEax9utrBl7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rjffCFfBV4zTy+vDwvWgkDwxd4e58Hhe69h3rMQsAa5NQQgXCM0rxmKBZEUiEzVnv8
	Jc9sy4r3wVd5IBUAe6zjY0RCJUF1uGdO68L1mF86FemeoV8/B1kHhaWp9QaQ53RSWwR0
	OXzomG/SOjWKV5UMnUuCYIrJKUNq0dtVZcz3s=
Received: by 10.68.36.3 with SMTP id m3mr2738656pbj.432.1306260149676;
	Tue, 24 May 2011 11:02:29 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y8sm5135407pba.51.2011.05.24.11.02.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 11:02:28 -0700 (PDT)
Date: Tue, 24 May 2011 11:01:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110524180110.GB18116@sakrah.homelinux.org>
References: <cover.1306037150.git.raj.khem@gmail.com>
	<c3ce108a01c4c250640528973e4cf12dfe062671.1306037150.git.raj.khem@gmail.com>
	<4DDBC45A.6090102@intel.com>
	<D0F7BA36-2C4C-4442-851F-EC89894864F4@gmail.com>
	<1306248867.2525.198.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1306248867.2525.198.camel@phil-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
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
X-List-Received-Date: Tue, 24 May 2011 18:05:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/05/11 15:54), Phil Blundell wrote:
> On Tue, 2011-05-24 at 07:52 -0700, Khem Raj wrote:
> > I have done couple of builds of eglibc with -j 2
> 
> Do you really mean that?  I wonder if you actually tested with -j2
> instead.

Yes dump spell checker on iPAD did that for me I really meant -j2
> 
> p.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


