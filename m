Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pzg5F-0005RQ-Nw
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 03:03:38 +0100
Received: by pxi1 with SMTP id 1so291619pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 19:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qa35iQWVGg6GrRgFVc7U++YsXsj+dmE5qpKDfX8xk6w=;
	b=Q6CDTv1YQhG8bm2JoBV8OQJghmE2BDm6fr/vqjyVA9fwwgOhbJduq6TNbZQ2vbnwqx
	zuzx6pmeqmf9NM9DF13cIbPS+TmvRVAUTXTOlCedJ3b16u88tWbccWatfsiIUYxorNjT
	U75oRzEx171tmDD3XZq3AvNuGhWT4pHVAlkP4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QW2rtG8F32ybdGPI+NBTr9Pg6N2HlbdQ6L2D/zHhCLiNA1kAkDCLdp+eMKaHi1OrMS
	OCQ8Zh9XBcL9GuoXzwi4WWp8JqSFdIVewluD/w2rhq7vTS97eMb2yGXbQIvJlyCK/rrw
	TdMu0z8KZSaka5tJIUO3uuiRmeKk1qwqywNPw=
Received: by 10.142.214.16 with SMTP id m16mr165265wfg.218.1300240892806;
	Tue, 15 Mar 2011 19:01:32 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm509499wfl.2.2011.03.15.19.01.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 19:01:31 -0700 (PDT)
Date: Tue, 15 Mar 2011 19:02:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110316020218.GB7694@sakrah.homelinux.org>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>
	<ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>
	<4D7F9CC2.2030002@linux.intel.com>
	<AANLkTikC7yWvzTzf1Od2WLiBhQjz1iactGCaPCN+aAmR@mail.gmail.com>
	<1300213438.30423.1820.camel@rex>
	<4D7FBDAB.7040501@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4D7FBDAB.7040501@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@beagleboard.org>
Subject: Re: [PATCH] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Wed, 16 Mar 2011 02:03:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/03/11 12:27), Darren Hart wrote:
> 
> I recall purging .pc for this reason (just in other development,
> outside of poky).
> 
> I take it deleting .pc from the build dir would be bad as it would
> make build/hack/build fail to work on the workdir tree. That leaves
> changing the permissions and copying it, or just avoiding the copy.
> I'm leaning towards avoiding the copy - but I hate to add a ton of
> scripting logic in the copy, but that may be the best solution.

I would vote for excluding it from copying.


