Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2989C7549B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:33:37 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id p185-v6so1140507itp.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 16:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=if483NM/w8xXLWke24zTLkzI8l4erORt1dbPB2MIycM=;
	b=uumK50/GHVMS6ydKHLY8feMxRtgKkSSA4uMocUK//bhp8fNLbssGEJQzGGVRZAS8KX
	oWUcrM86CW1G7K5Oa29o7zazigjvyEjKwS8Eh82QYz6ZVv4Nm5CECL1ECxXQJKpErVoP
	AZBUlFIirQVseZywBNiP+FuLPU1unYopBN7woplfvN2o1/RqzpTX0q4mEBuujmNVZkiK
	YN/9RZYAgtuV/e1+bec45cG1z/9291mxE7yBBSLNIb/6tLTsmJkbID2Omy91/Y4k6maa
	Npnz/rUzsX/IkwY+uMxVNPfXz+qeP71ktQQJnTZOI/lTgXosUesZ4UV3atzA6kmyHiMk
	rneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=if483NM/w8xXLWke24zTLkzI8l4erORt1dbPB2MIycM=;
	b=cdR9iBQBoWFQNXGShdsRjB0yO2acvtkJIY1ksYfXW+LEJ25E4iDh6oOxoId0Zt8ecN
	eWOjb84msHGiMUuW10RApEbYzfgdxEIQX5RvfSksHR/LTBzgxWNrp22cRsq/GaT3KzFe
	+k7Lhdl8/VR2islmknq8k7hPgiNZbvRaek+cCPO+ubLbTHKpgDdTdz+cGobDdbfWoD6N
	2SmGlsrI8UFYZC1sMDPkI7fESwvumPSjdUyEVv2QoGPeG0PRoMPUZSAG60zNl/l7AR/0
	Nx77lIvRGCM2XZQwUPLaJ1occmgqil3RoFGD2wF6GMXJS7hKeaYijkkmBxmvwvpQWoDF
	x/DA==
X-Gm-Message-State: APt69E2D2XTNtzc0pq3bSx7/M1kwvnU5g8jR3tbHTVIIALEIfb0gmxrZ
	W0Qqh+LePhFpIw05T5a/7Ew=
X-Google-Smtp-Source: ADUXVKJRnh6lWCe+gW86Qc/eSuCNRlyb6rN8DGwP3XRaWWjNdlc9TOcVc86h4usqZqkiM5pGv4kXPA==
X-Received: by 2002:a24:b21a:: with SMTP id
	u26-v6mr12950248ite.81.1528155218290; 
	Mon, 04 Jun 2018 16:33:38 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	80-v6sm116876itk.12.2018.06.04.16.33.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jun 2018 16:33:36 -0700 (PDT)
Date: Mon, 4 Jun 2018 19:33:34 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20180604233334.GA21528@linux-uys3>
References: <20180531200659.28877-1-twoerner@gmail.com>
	<CAJ86T=XTDOZYzdUTBLSO39XeBu6QhV0U5+U=iGd_hM0OwBXH_Q@mail.gmail.com>
	<CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
	<2113513.UM95QSBf6H@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2113513.UM95QSBf6H@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Mon, 04 Jun 2018 23:33:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Paul,

I was hoping you'd notice and provide feedback :-D

On Tue 2018-06-05 @ 10:59:07 AM, Paul Eggleton wrote:
> > I checked at the time, but I'm not 100% sure now, but I believe if one
> > deploys two packages from one recipe, the on-target file gets appended. But
> > now I'm not 100% sure, so I'll verify this tomorrow (thanks for the
> > reminder). 
> 
> The way I recall writing it, it will remove whatever it deployed last time, so 
> I would be surprised if it were incremental.

Yes, further investigation demonstrated this to be the case. This is a good
feature, since it handles the case where files or filenames might change
between deployments.

I've since updated the patch (locally) so that the on-target filenames of the
deployments, e.g. <recipe>.list and <recipe>.preserve, now include the
optional packagename (if this option is used): e.g. <recipe>.<package>.list
and <recipe>.<package>.preserve. In this way a user can deploy and undeploy
multiple packages from the same recipe independently of each other without any
of them clobbering the other.

The only caveat, now, would be if the user then deployed the entire recipe. In
this case the on-target files would still be the things the user was working
on; the "problem" would be an inconsistency in the on-target devtool
accounting files. In other words, it would be inadvisable to mix and match
between using and not using the --package option within the same recipe.

Best regards,
	Trevor

