Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S07JA-0003D6-1H
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 09:12:16 +0100
Received: by wibhq7 with SMTP id hq7so4208596wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 00:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.144.160 as permitted sender)
	client-ip=10.216.144.160; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.144.160 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.144.160])
	by 10.216.144.160 with SMTP id n32mr8476267wej.30.1329897836379
	(num_hops = 1); Wed, 22 Feb 2012 00:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=gYlfKhdspCPFVfwt+TSW5bLJr9In04QAEgKPIoyTr1Y=;
	b=jjsLoEBnDKOuYGaGGIOAcAh2vD26jhBsWzKvtUxzCk845KXAphColFTJ2I1+UjmQnD
	CNaNrErHDiUdPcDoCQabdhBgme6wZiUqzd6osTixTrfnyQhnGkHzWHWTY+3z49hx1K9r
	qFOvupVl3Xbq7N+IVe440EOH1DysMv/E46JAw=
Received: by 10.216.144.160 with SMTP id n32mr7033824wej.30.1329897835961;
	Wed, 22 Feb 2012 00:03:55 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ft8sm27481007wib.11.2012.02.22.00.03.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 00:03:55 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1329865279.20261.92.camel@ted>
Date: Wed, 22 Feb 2012 09:03:58 +0100
Message-Id: <9C41C640-9B88-45D6-B0DE-6C9F317B43BB@dominion.thruhere.net>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
	<1329865279.20261.92.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkZIvtE1sZjYrXMZEGRSHMkYecwQwM50sBAVxZCLRF3Bo6pFo1LW/qOhoijjxJA1tO5CzCs
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Wed, 22 Feb 2012 08:12:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 22 feb. 2012, om 00:01 heeft Richard Purdie het volgende geschreven:

> On Mon, 2012-02-13 at 05:23 -0800, Steve Sakoman wrote:
>> Indeed!  I gave up on trying to determine an exhaustive list and just
>> blew away tmp and sstate and rebuilt everything -- including package
>> repositories :-(
>> 
>> We need to find a way to prevent or warn of disruptive changes like
>> this zlib patch.  For those of us trying to make a living using Yocto,
>> losing a day of productivity to things like this really stings.
> 
> I agree this change sucked and showed us we have some real issues. I
> will point out that if we had been using the basichash signature
> generator, it would likely have picked up this change and rebuild all
> the appropriate pieces.

Rebuild yes, but not fix all the -dev packages in the feeds.

regards,

Koen


