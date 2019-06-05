Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 70E036C3A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=cxS3/Ij9xV+lweIWwtm1WkfJPfg34gCNkoWLoM/+CeM=; 
	b=m2a1Vg2/hvXQ7kjESg1UxRH1BU0euOn3RTgbFgojBXeU5GgXb4uRY9Ot7g8IUSkAggsblNHycs/e/Uo0N3ufShOrmY7jPTKClq7NO9WgvLxg9k5+ciuW4u/7dSKHufozH0luJ8y3dbe/V570KcmATY+1r1JPkj5WFnDGEaTJqQ5Q91yYN1xI9XtMKy0K5wjzg6SCpVykoPI1jMopk6DkHvND1YxnFqwE3OxCq3yBNP9Ss6HgtXPVlvV91AxqgcsJnQHhqDtBmBuMEnOlom9gVuPDOr2dA4O2sjWIJZg3GMD1d6fxeAshKI28abkDAn52wA52UrmV5s6MCqOHzq7htw==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hYYqj-0006fw-5j; Wed, 05 Jun 2019 18:33:17 +0200
Message-ID: <20ba25d5ac6d3602e3bf366a4d07ff06d9b36368.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 05 Jun 2019 17:33:07 +0100
In-Reply-To: <CAJTo0LaLyjSxmXU8p4UOHgVf+QrHDgGsU7A=TcqCJBEctsqMsA@mail.gmail.com>
References: <20190530134703.16094-1-philn@igalia.com>
	<20190530134703.16094-2-philn@igalia.com>
	<CAJTo0LaLyjSxmXU8p4UOHgVf+QrHDgGsU7A=TcqCJBEctsqMsA@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] p11-kit: Enable nativesdk and trust-paths option
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
X-List-Received-Date: Wed, 05 Jun 2019 16:33:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ross,

Thanks for the review!

On Wed, 2019-06-05 at 17:09 +0100, Burton, Ross wrote:
> On Thu, 30 May 2019 at 14:48, Philippe Normand <philn@igalia.com>
> wrote:
> > +PACKAGECONFIG ??= "trust-paths"
> >  PACKAGECONFIG[trust-paths] = "--with-trust-
> > paths=/etc/ssl/certs/ca-certificates.crt,--without-trust-paths,,ca-
> > certificates"
> 
> Should that be /etc?  Or $(sysconfdir)?  Especially in native and
> nativesdk builds.
> 

Yeah you're right, hardcoding /etc might not be a good idea. I kind of
abandoned this patch series though, since it was decided to not make
gnutls depend on p11-kit for the time being. This patch was merged
instead:

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=4babb468b856f495ef828ee21cefb266ed58bd28

Do you think a follow-up is needed? I'm sorry I didn't know about
$(sysconfdir) before.

Philippe



