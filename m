Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4CC66060F;
	Thu, 19 Jan 2017 03:54:33 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id o138so3774748ito.3;
	Wed, 18 Jan 2017 19:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FBEUU87KvUmasYXLwuA0+0ujDrPovyFPWkzO0G6LgjI=;
	b=l8IbLb/VUogmPVR+p706fRp6b1z3hRMwAL3Qz5gY4swbxJrrV5+iW1RKii/J+yK0rd
	glS5C1nEZmi/feDi7YZ+fEwMxcKZOQYG9rPFA2ReV80J6B0taCCzusEdc5MHa35eN3Jw
	zskYqQbsPrBqvmxIlvD3+Zf9lVvBg1w5QxS+JgsFsXvqeQEvWs1+CRhspPGVslB4iKYZ
	TRjvSeSMprp4lQFzuiIkSzK5EcvXCsGZTcr628QH3zsTR5YkiFpqeB5hek0CvNKWH66E
	s/YfF4zknCPHNjpzOXj5Mcf6G263yzCLlDaRihDVCOX4V3vZztbor4QUx9fTOb9WrPNy
	mQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FBEUU87KvUmasYXLwuA0+0ujDrPovyFPWkzO0G6LgjI=;
	b=rRG8bj4Wvj8XLnnSwRBDpa4MGRHuTXsVguE9dvCld+wdPcM0NuEcc3VPiBg5frwFvg
	Y5MNhVeH1TcSrHXjYhZwhGLj+a9KD8+b0t065oahk25WViK51qM6dBtfStZz5IeWX8G0
	htCeJP9yiNYLvlcXgH++vKxCK3ReJe2x7hDdUsSS64SWKHoe8c8njT6dmCzWUA9eH76O
	19FMtfZ/XZh+osoLBMgg2nQyy4KMvUpaCo6bTynPr+quz0FAQLTMzKLKNxMGpu4w/GBL
	qbZnMk8Aa34YtVfRDEbxvRZAAnAVfZLVh9lcN4wUmkrIYotsJGl48xr9eBizjdu2wrf/
	HVXQ==
X-Gm-Message-State: AIkVDXLb/lby/6kcJGxLbpIFLC3nSOrW7kBVZ47/ChI8VVS2Np6AbWPbBDaYr23s6Fq18Q==
X-Received: by 10.36.225.195 with SMTP id n186mr28036829ith.35.1484798073442; 
	Wed, 18 Jan 2017 19:54:33 -0800 (PST)
Received: from linux-uys3 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id a99sm2197097ioj.7.2017.01.18.19.54.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 19:54:32 -0800 (PST)
Date: Wed, 18 Jan 2017 22:54:30 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20170119035430.GA24183@linux-uys3>
References: <2683342.SVnRAGIE1W@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2683342.SVnRAGIE1W@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: yocto@yoctoproject.org, openembedded-architecture@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Patchwork and incoming patch testing
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
X-List-Received-Date: Thu, 19 Jan 2017 03:54:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2017-01-18 @ 07:05:58 AM, Paul Eggleton wrote:
> This should give us a bit more visibility into 
> where patches are at in the process, although we are still working on a few 
> places where patch series status needs to be updated (e.g. when a patch goes 
> into testing).

Is the testing process for OE patches formalized?

I'm not referring to the Yocto Project's release testing.

