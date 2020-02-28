Return-Path: <petr.vorel@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11FAA61920
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 12:08:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x7so2727976wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to;
	bh=d83ucFNgIxAQgl5bPyBizlglNV+4cg944fFJ12rq63Q=;
	b=glHt1fqYouU8p+OREtqhX5HSK1THfaTP7TnJI5hBNVjBCbefXwMvxslEjn/9X7k+ly
	vNRljG1POGgKhAsxNz4ixKXfYguS0yDvrqPMw73ZbVNMElxy7HOdmq7tVfW/jmgDgHBT
	HEBWU+25qDXp/TBWdmg/JSjLGjkHh4yRPpvbyB45ut9EOgpLaGiPqv/o3v6tushRRG/V
	ZNmxVlm75I9yZIQXmEH6PNU9Apf6F/pEpnDjzURb+l9GbyJP93ZE38vJiMamkfLfrw4p
	7yYVWQwHtFOLHp7PbzQY82NJ2Tkj3/4reAlD6vbKEPqNqB3A8m1gD/a+xZR4JYlStPpJ
	6MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=d83ucFNgIxAQgl5bPyBizlglNV+4cg944fFJ12rq63Q=;
	b=rMqNKJf/dXCUfxshe+3XglYCFcA6a7Au7sGL6ZpDgFhs2cmgg+rD+UGWDbCNyGkw+5
	aRZrdJMZ89keXoMsFmNSeqd4piJv7IPDzF/+J8/+k080b/rCjIfk3Z/3Xngo4AjRB+m0
	qbFDG0mg00K9wCLO/D5RFhOCm4pHjtlR878HNR/f0M8PG/7QtmC8JED2i2BViH+tR8jr
	Uxh2FvK2R6lSHr8CF5BuWlg5a43qOX32mavrBiGmkiEVxduxyL6gjhah6So3BVz3LK0o
	zaAnkv3LHfclPmONIe8XQHgnaCQy7olSKwyTLToUNM42s7FIGpAXwAORDpdFt1++jRtA
	I8kA==
X-Gm-Message-State: APjAAAUNroAIK+T01PiOYXUz9/ruv7MrpXdxBpvLL3dyzk4H/n/dzhgs
	iBmC3HXqRFEGlK89QgjJpdc=
X-Google-Smtp-Source: APXvYqzAFrbL8gnwRpt+qZSVqp7CqHa2IUZZYDd4y28pSpwryO2amRjghrY6aDSX1y61RwruAhlHNA==
X-Received: by 2002:a5d:4088:: with SMTP id o8mr4710482wrp.144.1582891732636; 
	Fri, 28 Feb 2020 04:08:52 -0800 (PST)
Received: from dell5510 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	g25sm17629091wmh.3.2020.02.28.04.08.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 04:08:51 -0800 (PST)
Date: Fri, 28 Feb 2020 13:08:49 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200228120849.GA31133@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200228061225.32003-1-petr.vorel@gmail.com>
	<6558d8c05b858a831ecd4dd79df70f4764b10c6c.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <6558d8c05b858a831ecd4dd79df70f4764b10c6c.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Fri, 28 Feb 2020 12:08:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

> > Changes v3->v4:
> > * Fix musl build with LIBS=-lfts

> Unfortunately the musl build is still failing with this version:

> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1627
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1631
Any idea, how to fix it? libcgroup uses the same flag LIBS=-lfts.
Maybe the variable isn't propagated.
Or is the dependency expressed enough?

DEPENDS_append_libc-musl = " fts "
EXTRA_OEMAKE_append_libc-musl = " LIBC=musl LIBS=-lfts "

I'll have to put back patch
0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch, but that's bad,
buildroot works without it.

Kind regards,
Petr

