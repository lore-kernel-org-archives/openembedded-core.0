Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 90E9671B57
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 09:58:26 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id a6so45169774lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 01:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=BbFTr+6QQ8bnNZuUjL0kCOne0OafxHu1Wxui+5/bQps=;
	b=lvXquSxiV3LUujbVUOFR1j6BGHGCkaOZX99OrV7gcxDBvF5tqYf2QtZUieKIP5Jqw+
	jSp4G56F1lhPgbIhqRlwyCYDw1VqkwUlVJdwTRJdfv7fnxixJ0qK5Fija6nxN97Zhhb8
	GhCrEwhmFdheJl3TpRQVcKHvnb6WARMXFSi7p80RXyyJTbmoa/MWe2zq4jhVLtsSUbgT
	HWu1FTk+vV2ekq4dfhRTiJ1DmSAJ/Y1cchWS55KqoiylkvL+Rq0Ru+gbbOwwVXnJ3NIQ
	oYrMhLaSKGEMnvmAAC6RPZeEskfYgYYky/gmnkjHeMJhrc5QswET1U4caTZoUZWMJnJI
	PGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=BbFTr+6QQ8bnNZuUjL0kCOne0OafxHu1Wxui+5/bQps=;
	b=mnucTyQE74p/oTHZZlcgxJFe8P3JircOuDdatqJ13DJ9qD2+yLUlh9d2BjMFGgZsZ8
	hkhmR+El+NLdKdV5suUIGj1nvyL+xxfoi88Glr+aZrN8jKn9C/4lw/dj8bcfdpfa/Doo
	IXUw4omVlugEOOToDA//Ux7P8wSzM/63xL/ENaAKfLBO37Ja9gid1wj2Cr0ZKBFYsaAQ
	a7SRPsvIEbUHPQ1VgvSv+j5OPGJ4VZxfWT2kaJPc/S3NRY+g5OYP/n/9nBiT4s6zYaFF
	jZln7+VkUg4vEyxVHAI5UYhupI6OUVHlWyBppx5kIVFYYWJ7aBZa7bpAdNkAQ0hx1JPK
	Rv7w==
X-Gm-Message-State: AMke39kPROP74BwWWQS9IvFklOsp1eWQIzMr+Z4WYCOcK7BCJ6CHkBQ2bjdJczmHnm3uEw==
X-Received: by 10.25.21.37 with SMTP id l37mr614427lfi.146.1488535107941;
	Fri, 03 Mar 2017 01:58:27 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 91sm2157885lft.17.2017.03.03.01.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Mar 2017 01:58:26 -0800 (PST)
Date: Fri, 3 Mar 2017 10:58:25 +0100
From: Anders Darander <anders@chargestorm.se>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20170303095825.k2mfmg2mnut7hvks@ad.chargestorm.se>
Mail-Followup-To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1703020605560.10072@uk63952.mitel.com>
	<alpine.LFD.2.20.1703020627050.11911@uk63952.mitel.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1703020627050.11911@uk63952.mitel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "inherit setuptools" versus "inherit pypi" -- a python style question
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
X-List-Received-Date: Fri, 03 Mar 2017 09:58:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Robert P. J. Day <rpjday@crashcourse.ca> [170302 12:33]:

> On Thu, 2 Mar 2017, Robert P. J. Day wrote:

> >   inherit pypi setuptools
> >   require python-psutil.inc

> > and the corresponding .inc file contains:

> >   RDEPENDS_${PN} += " \
> >     ${PYTHON_PN}-shell \
> >     ${PYTHON_PN}-subprocess \
> >     ${PYTHON_PN}-threading \
> >   "

> > so the first recipe inherits pypi, the second one inherits setuptools,
> > and the third inherits *both*. what is the *preferred* style?

Well, different purposes... If you take a look at pypi.bbclass, it's all
about how to retrieve the module (source code). setuptools.bbclass is
about how to install the module...

Ie retrieving and installing...

Cheers,
Anders

> >   i'm assuming that if a python module is availably via pypi, then
> > you'd go with that; otherwise, just use regular setuptools. and not
> > being a python guru, why does that third recipe need to inherit both?

> >   i did a quick grep of the current meta-python layer to see the
> > frequency of each, and got:

>   grrrrrr ... i just looked more closely and it appears that all of
> the "recipe" files under meta-python that inherit only pypi are all
> ".inc" files, being included by recipe files that first inherit
> setuptools. so, again, clarification on the proper way to do this
> would be nice.


-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

