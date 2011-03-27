Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q3vkN-0007ia-Rz
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Mar 2011 21:35:36 +0200
Received: by pzk35 with SMTP id 35so397687pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2011 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=NGacULHVL8hVbm1qr0rSSHgSUMFj9G2Ok2vx0BhOjAo=;
	b=qdEAOVN1Q2Wc0uKWcgZOs+T7tc4GGvyvN68tZwiw1GUc3Eb7nIcQJX8XhOGEpPMCLJ
	Kffp0h6VPcagMfjER+IAQ4FWWi1I3zOt1i+T0ehlQxOtA1Ob17OwqJN01QVX/Y52oqt+
	DZD8mcaXt2aE1ZP/0Jo1Ik+mMesbuOwA9q5OA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Rn8UV9T6YsvT9a7uMrqDiqVPgdjfmo0pedgdwOiESl0cukrDOs/Foyqfrxv/I8v4Cs
	xSfdpx6MZ50tHhV8d13ElvaXeGr1Djx+AUqsJA+k90/PAf7Xjf1r82NJS/iEUQz4FO/p
	UfLl2/15tBsrFhZVE3JVjOzQMYtsK8APKEWgc=
Received: by 10.142.149.15 with SMTP id w15mr3057188wfd.325.1301254400083;
	Sun, 27 Mar 2011 12:33:20 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p40sm4804304wfc.17.2011.03.27.12.33.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Mar 2011 12:33:18 -0700 (PDT)
Date: Sun, 27 Mar 2011 12:34:05 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110327193405.GA23957@sakrah.homelinux.org>
References: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Using meta-toolchain output as prebuilt toolchains
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
X-List-Received-Date: Sun, 27 Mar 2011 19:35:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/03/11 13:44), Koen Kooi wrote:
> Hi,
> 
> What is the preferred way of 'importing' prebuilt toolchains into OE-core? In oe.dev I can use this: http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/meta/external-toolchain-angstrom.bb to 'import' an angstrom toolchain built with 'bitbake meta-toolchain', but I'm not sure how to do that in OE-core.
> 
> My actual use case is actually 2 use-cases:
> 
> 1) Hand people a prebuilt angstrom toolchain and migrate them to OE while keeping the toolchain

Did you mean "migrate them to OE-core" ? or are there totaly n00b to OE

> 2) "Get started in 10 minutes" type of thing, I suspect an sstate mirror might be better.
> 
> So any suggestions for #2 as well?
> 
> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


