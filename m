Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rutpq-00049v-UO
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:48:27 +0100
Received: by daln34 with SMTP id n34so3190360dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5nqMDWpiyFDyTm3lvO+tmHUZptDUmTT3FXez58OvP2o=;
	b=eNIyIiNLicrDrPst2S08fOU6CEUUyuxa+DUuvlXHFL77mhMpS0edxWK2Nrj94VltNt
	14EzKDZHkuEaYGnj/4mG4LmwGb3pj2cY73YGts29a0f+vOZVUJQUq20fHtoGAKSFo/cB
	sstfxv63BBkT56psblyd7dXsbQP8DB6BeqrnI=
Received: by 10.68.135.137 with SMTP id ps9mr61388568pbb.40.1328654423157;
	Tue, 07 Feb 2012 14:40:23 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-142-235.lightspeed.sntcca.sbcglobal.net. [99.57.142.235])
	by mx.google.com with ESMTPS id y9sm142018pbi.3.2012.02.07.14.40.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 14:40:21 -0800 (PST)
Date: Tue, 7 Feb 2012 14:40:06 -0800
From: Khem Raj <raj.khem@gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120207224006.GA13125@sakrah.homelinux.org>
References: <4F25501F.9000606@emagii.com>
	<CAMKF1so1dzbo3_YN-pJqn-axFAUazqkdKgFU+CUh3dSbWgYF2Q@mail.gmail.com>
	<4F26678A.1050803@gherzan.ro> <4F310EEE.80905@emagii.com>
MIME-Version: 1.0
In-Reply-To: <4F310EEE.80905@emagii.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: bitbake -c clean <package> fails
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
X-List-Received-Date: Tue, 07 Feb 2012 22:48:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> >Clean it's just a "clean". As in "make clean". So after a clean
> >you will typically have configure, compile etc.
> >"cleanall" = remove unpacked + remove source. So after a clean you
> >will tipically have fetch.
> I have tried clean, cleansstate and cleanall.
> All of them remove the source directory.

if you are talking about ${S} then yes but relevant content in ${DL_DIR} are only removed
with cleanall

> 
> If I try to use XorA's method of testing out the kernel
> http://www.xora.org.uk/2009/12/10/openembeddedangstrom-kernel-workflow/
> then it fails since a recompile of the source will fail to update
> dependencies.
> If i bitbake -c compile virtual/kernel -f a
> and then
> bitbake virtual/kernel
> then the previous build will be used.
> 
> Is it at all possible now to recompile, without having to clean out
> everything,
> and start from scratch?
> 
> >
> >_______________________________________________
> >Openembedded-core mailing list
> >Openembedded-core@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


