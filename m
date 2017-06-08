Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id ED6B46FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 06:04:55 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id i7so15993975ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 23:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=HV628ez/ZOi5VO2VeguEXlx3sZ2Dz6OSlza523Mf+WY=;
	b=u/kEuIHmyKekMvCPu4YkBU2ExJQp7Bq8P3eMW7jMKx0Z5MzprfJWW3hRgfiGCi/PMu
	lLmmQ+32toslJ3koXayYXJWe5q4n5Peb0Lg+rDsx8ZWJ+PfoaboED81SSD8OCdhxga5e
	yRqZJFS8ggCZE2oyzB9U/8d5E+yE2K/ASNyrVocKg4qH5gjvMcxaTA238fMV8rSqUbfm
	6WKqLeaBfIGqjB94OSTXOic/7JegTds4ME5jnkHdvdbIs0EtZ+ulevRsAOHJfW5APShH
	dKJ6hLq+Gwjyavzs55kxvPKLh0loEUboUvPflDOwokvXN3sSgKa8Qb097W6FBvYf/0d/
	05hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=HV628ez/ZOi5VO2VeguEXlx3sZ2Dz6OSlza523Mf+WY=;
	b=Zo9OTuPPzrUTF1ZyEchb4SayuwHd6XkqEeWu/nBG0+kwb3BlmX9+erZhMWXrm2i9YP
	f47JtVF09bh9FyAklah4/PEFB1eWFpSvK3+kVRAeqteB+tU5oyU398M4tqyB1DKKvXFY
	pRqfXHg1A+wJsnclVtJeiTVJaS8dtv1hOBhl97VGV6RphFs5n4qTeWiTnlKlN4nv8Fnj
	Ymu4IFgapUh6b6vv/TslUWnoPTECyJZZ1fN0+ozf/P9bKPWGMn60jt00CzI0ZtCyv+2I
	snRu8jRHlCV9VHtPQLa6OWiHR+avRYt4/eorszXlzwnEZSg6bKnTj6iT70zPlaklLd4U
	nxFw==
X-Gm-Message-State: AODbwcA48IcLttWvnViOnw1j2cL3+u0wcuUjCPLDcTWTll63JdvzJrnd
	PoX0jDVFFfUJ//JqutU=
X-Received: by 10.107.133.228 with SMTP id p97mr20430662ioi.69.1496901896781; 
	Wed, 07 Jun 2017 23:04:56 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE54.dip0.t-ipconnect.de. [93.232.206.84])
	by smtp.gmail.com with ESMTPSA id
	136sm1771792ioo.41.2017.06.07.23.04.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jun 2017 23:04:55 -0700 (PDT)
Message-ID: <1496901892.30163.119.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Thu, 08 Jun 2017 08:04:52 +0200
In-Reply-To: <13cfc543313a4c59bb8c9688c91db3c4@XBOX02.axis.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<7942e5efccf0ee4fa360948d892b4508e3f1f00c.1496849345.git-series.patrick.ohly@intel.com>
	<13cfc543313a4c59bb8c9688c91db3c4@XBOX02.axis.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Thu, 08 Jun 2017 06:04:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-07 at 16:11 +0000, Peter Kjellerstedt wrote:
> Rather than requiring that the wanted DISTRO_FEATURES that should be 
> available as overrides are defined in DISTRO_FEATURES_OVERRIDES (which 
> should not be confused with the similarly named DISTROFEATURESOVERRIDES 
> variable that you also add...),

I had thought about those names and in the end went ahead with the
similar names because the customizable one made sense to me and the
internal one is similar to the other entries in OVERRIDES.

>  why not add them all but with a prefix. 
> I.e., similar to how package names are available as overrides prefixed 
> with "pn-", how about all distro features are made available as 
> overrides with a "df-" prefix?

That would be fine with me.

I just have a few concerns:
      * How performance-sensitive is OVERRIDES? How can the impact of
        both approaches be benchmarked? The idea behind the configurable
        subset was to add only a few new overrides. We currently have
        almost 70 individual entries in DISTRO_FEATURES.
      * I've seen confusion about the pn- prefix. At least df- would be
        named appropriately (in contrast to PN, which is historic), but
        it's yet another convention that might not be immediately
        obvious. The same is true for selecting a subset with the same
        name as the feature, though.
      * Can distro features contain characters that are invalid in an
        override? _ and : would have to be avoided, for example by
        mapping them to -.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




