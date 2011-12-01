Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVvoF-00089r-GY
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 02:51:35 +0100
Received: by iahk25 with SMTP id k25so1671882iah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 17:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eoa1AUPx8csq5oTqdeS75RYp0foE9EilVDPn0Z68hCs=;
	b=TrcTIeRsZ/Ad1YWHvenXFz3x7CgqU/8G/9aoOd/mIo+4puOIJ9Lk/mG6fwLRbkjTHx
	vrKTeLf3J1BVcHQGfnhTYJyxm4zDaPmy0e2uCECiNQAT6kV3y4QD9VyzxnxkiRXBU2R6
	yYe5fRA/WluQNXeQjf1woxTG9jpDK31LC/nuU=
Received: by 10.231.82.149 with SMTP id b21mr1319185ibl.38.1322703893811;
	Wed, 30 Nov 2011 17:44:53 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id e2sm14795452ibe.0.2011.11.30.17.44.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 17:44:52 -0800 (PST)
Date: Wed, 30 Nov 2011 17:52:51 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201015251.GA30618@sakrah.homelinux.org>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<FBD66FA7-8184-4933-AB82-124F18225ECF@dominion.thruhere.net>
	<1322582613.7964.3.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1322582613.7964.3.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: ulf@emagii.com, "Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Thu, 01 Dec 2011 01:51:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (29/11/11 16:03), Richard Purdie wrote:
> > Assuming your statement is true, why isn't the hash style fixed in
> > the .inc? Meta-oe uses the ones from OE-core, so if the include files
> > are sane, the toolchain for meta-oe is sane.
> 
> Its fixed by a patch so someone needs to backport that patch to the gcc
> 4.5 patch set.

I have intentionally not ported the patch back to 4.5 but let me see if
I can find some spare hours

-Khem


