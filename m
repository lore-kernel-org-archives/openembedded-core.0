Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 62DFC7EE24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 20:33:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a11so282321wrx.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 13:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=NbaFhHzphPagbGvSzN3u8GzNxFRNrC72cssiccL9MVY=;
	b=iGZGAsTKmzdH4nSjDr6EBEyHpP4tS++GGzwXM5YO7LxGZczb06nOnDos+0SY0go0bw
	EyXTL47rRKz+kPnZ70AKtN6CJy7DfrsCJsM5IISIJwCKb7Gscoz962N8MGfHI17G4fGx
	Tqvt9c+RJEfJyiHAHausqe37IgBUrBqqeD9YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NbaFhHzphPagbGvSzN3u8GzNxFRNrC72cssiccL9MVY=;
	b=aBek+PPkzsMee/mvDJz7ITs4F/ZMLKpxVKkRTCNgoRgLgGLQ2SMJRKbNtkxX1oiKLI
	5Jj78ecwPcPAXP2Qf7pxD8mf4TRh9EKqkdRhWpWWvHbKbjvmwx6442E0hp9GnRK56tum
	Sf5Euz8MRyyaGRBPDliW9uSzMxPelHZjsi4NltHsPGlQpvf+HQ2TTxqmPMghICfZxrlb
	AY/303rKCHiFBNRwxT5aRlo/7Edw95JsXsU1Xi2kGMUD84/DhXrQVljp47cJZPVdPUkL
	4QJ+NczNLfMVNRcxzB0DXPDysXf/oVNNtik7q5efzKHLPdKwwL47+iGjNL8FVbai7lsi
	MFOg==
X-Gm-Message-State: APjAAAUn38aeDdeBm/2o2F+vnGtdWiPo8MJVmBEsAObD1roooQ+R5zv6
	PdT4O1TzOOifBG6Mq4Imv2exMcyIu6I=
X-Google-Smtp-Source: APXvYqwMebIa8sHfXJCTLIGttPbUkov2kiQHEGzHtQwVTmXUA8e2OiDa1htb9+jrdeYtaZgcYXrgBg==
X-Received: by 2002:a05:6000:1c4:: with SMTP id
	t4mr217849wrx.183.1569529993140; 
	Thu, 26 Sep 2019 13:33:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f20sm2311856wmb.6.2019.09.26.13.33.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 13:33:12 -0700 (PDT)
Message-ID: <7ffb41b488386caef3c4de5178369beea8f189a0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 21:33:11 +0100
In-Reply-To: <47210e81-33a4-4f87-c258-e7b63b71482e@intel.com>
References: <20190923180109.15157-1-Trevor.Gamblin@windriver.com>
	<47210e81-33a4-4f87-c258-e7b63b71482e@intel.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] lighttpd: remove fam as a PACKAGECONFIG option
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
X-List-Received-Date: Thu, 26 Sep 2019 20:33:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-09-23 at 21:16 +0100, Ross Burton wrote:
> On 23/09/2019 19:01, Trevor Gamblin wrote:
> > From: Trevor Gamblin<trevor.gamblin@windriver.com>
> > 
> > lighttpd builds fail if "fam" (and therefore gamin) is enabled.
> > 
> > In conf/local.conf:
> > 
> >      CORE_IMAGE_EXTRA_INSTALL += "lighttpd"
> >      PACKAGECONFIG_append_pn-lighttpd = " fam"
> > 
> > bitbake error:
> > 
> >      ERROR: Nothing PROVIDES 'gamin' (but /yow-lpggp31/tgamblin/oe-
> > core.git/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb DEPENDS
> > on or otherwise requires it)
> >      NOTE: Runtime target 'lighttpd' is unbuildable, removing...
> >      Missing or unbuildable dependency chain was: ['lighttpd',
> > 'gamin']
> >      ERROR: Required build target 'core-image-minimal' has no
> > buildable providers.
> >      Missing or unbuildable dependency chain was: ['core-image-
> > minimal', 'lighttpd', 'gamin']
> > 
> > Since gamin doesn't appear to have a recipe and hasn't been
> > maintained for several years, this should be removed from the
> > list of lighttpd PACKAGECONFIG options.
> 
> Non-default PACKAGECONFIGs are allowed to depend on recipes that are
> not 
> in core, plenty of recipes do this.  Otherwise there'd be no way to
> turn 
> on options that have dependencies in other layers.
> 
> However, the fact that Gamin is very much dead is a good reason to 
> remove the PACKAGECONFIG and simply hardcode --without-fam for good
> measure.

Agreed, can we have a v2 with --without-fam hardcoded in EXTRA_OECONF
please?

Cheers,

Richard


