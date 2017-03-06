Return-Path: <anders@chargestorm.se>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFBA6078E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:11:26 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n11so56311870wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Mar 2017 23:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=jwbKwpVXFtUMSXRFUqnOgs/VWZX5fJdNddPzWIsZL90=;
	b=PK2AyCo1Jk3ZlbceFAQb1fNFHU2hhPK9ZKrPDqO0ss+4f3ze1q/+znJcjk5XitKDKT
	cEbdI/QyzSoVr3bGvZxQuimIfHWtcQfC7/iTcLyhLrzZxOe8HfUjXbmekzrGX76DEO/N
	43f+IW6pZaHAXVuFPA0SSh7cWGmMExklrLLsZ2dzpE74VnHfQ+93IKldMd7JIUpd87g5
	VeFdbcoWfk70e8YoDRtscnBHUAQyYtr5phStTE/2vwu0lAfe12Va0unXB2Bk46cGJ5Cz
	/zfFozib0IOyrjSOX8ZH8jgDmqDMaYF2MjIBa5zGsjSHev5t3DOIgcAcw01pHkrq/KwJ
	iZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=jwbKwpVXFtUMSXRFUqnOgs/VWZX5fJdNddPzWIsZL90=;
	b=lDGpUVFUmi+HlvYMDLiWCa9gcbLDekipQ/tgbOALB/hOmDZ4j9CDRfi1b8+KLZChGs
	GNKFYyH0snKamfKSXG54Rlm6kZclRzW3DvbOSNZqM7NaU2jdAs55Y22xDM0cjK2geweP
	w+tRVNm4oUL/Zs4NIb8ZIPTI+VlGx7uYYnu4RyH6ZCiQAceLI/5QvoXg6qXEpPO6Fhcm
	2C8+WNBNXI1x1Jh04aOXZQ1+rBLR+ByZAafW9WTZPuIaPGfmC+dUPXu0E3NmzHDUop90
	rYTDLAhb+4RsDA/eAIpWgb0Z/LNffl24YZ/z2MnoqZPKUGDyaI68NqObIFni0rJBAGWz
	zK3g==
X-Gm-Message-State: AMke39nNKI/6uAvFvbfPU0gRBgf9rzPpYvqZSTvqFXyVVsvtx8ahJdrcCAaODqb7pgza4w==
X-Received: by 10.28.51.140 with SMTP id z134mr12798112wmz.55.1488784286830;
	Sun, 05 Mar 2017 23:11:26 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	u41sm25724767wrc.24.2017.03.05.23.11.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Mar 2017 23:11:26 -0800 (PST)
Date: Mon, 6 Mar 2017 08:11:24 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170306071124.x4hf35gtlrlgjm2v@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1488388550.git.anders@chargestorm.se>
	<1d9e36a9b92ba941e472aef5ed9dd32ec29404e9.1488388550.git.anders@chargestorm.se>
	<8048065.zPYkRBxOXs@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <8048065.zPYkRBxOXs@peggleto-mobl.ger.corp.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [PATCH 1/7] create_npm.py: add devDependencies to depends
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
X-List-Received-Date: Mon, 06 Mar 2017 07:11:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* Paul Eggleton <paul.eggleton@linux.intel.com> [170302 02:44]:

> On Thursday, 2 March 2017 6:19:55 AM NZDT Anders Darander wrote:
> > NpmRecipeHandler(RecipeHandler):
> >      def get_npm_package_dependencies(self, pdata):
> >          dependencies = pdata.get('dependencies', {})
> >          optionalDependencies = pdata.get('optionalDependencies', {})
> > +        devDependencies = pdata.get('devDependencies', {})
> >          dependencies.update(optionalDependencies)
> > +        dependencies.update(devDependencies)
> >          depsfound = {}
> >          optdepsfound = {}
> > +        devdepsfound = {}
> >          for dep in dependencies:
> >              if dep in optionalDependencies:
> >                  optdepsfound[dep] = dependencies[dep]
> > +            elif dep in devDependencies:
> > +                devdepsfound[dep] = dependencies[dep]
> >              else:
> >                  depsfound[dep] = dependencies[dep]
> > -        return depsfound, optdepsfound
> > +        return depsfound, optdepsfound, devdepsfound

> >      # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
> >      # (split out from _getdependencies())

> This worries me slightly - I've no familiarity with angular2 but AIUI in 
> general the dev dependencies most often aren't needed, and may be onerous to 
> pull in and build - should we really be pulling those in unconditionally?

I fully understand. However, I found no obvious way of doing this
conditionally. At least, the devDependencies won't be used during npm
install, unless you add NPM_INSTALL_DEV = "1" to the recipe in question.

Well, I guess, it could be possible to add a command line switch to
recipetool; though, in that question, I've got a few questions. Is it
possible to add this only for create_npm? (Ie not for generation of
other recipes?) How to add this to devtool (and have it propagate for
npm-packages only?

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

