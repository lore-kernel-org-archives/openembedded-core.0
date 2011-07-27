Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qm8JZ-0006QD-QF
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 19:54:38 +0200
Received: by pzk1 with SMTP id 1so3094745pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YTSkivwgu7mKuzi66gxo8Ec/3e3Q/plNud3/kIsYHy0=;
	b=EnUUsAFqo2pNbECK7kjW83QwKIDKNYKG6Qe6mV300fAdb++lX3APJAriVnTBrqE1su
	Z2UlyN3S6KbN8o7tsOVHy2n8yvdrpZPh7XhTqhAUMMdUEqggq6jVZJeUAJm5WReNPHeC
	ee0AL8mTehN/5N5e/zUUn2onyyf/ndwzw6p3M=
Received: by 10.68.22.65 with SMTP id b1mr133099pbf.246.1311789022516;
	Wed, 27 Jul 2011 10:50:22 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k3sm84152pbj.93.2011.07.27.10.50.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 10:50:21 -0700 (PDT)
Date: Wed, 27 Jul 2011 10:51:17 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110727175117.GB14766@sakrah.homelinux.org>
References: <cover.1311234475.git.sgw@linux.intel.com>
	<1311280985.2344.82.camel@rex>
	<BD5C61B9-8EC9-4C55-AE35-71D9B022F532@kernel.crashing.org>
	<1311325508.2344.102.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1311325508.2344.102.camel@rex>
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
X-List-Received-Date: Wed, 27 Jul 2011 17:54:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 
> There is something in my patch workflow which seems to corrupt dos line
> endings. I've manually fixed the patches which were out of sync in poky
> compared with OE-Core and am looking into how this happened with a view
> to fixing the scripts.

git am hoses them

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


