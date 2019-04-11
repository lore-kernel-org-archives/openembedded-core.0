Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3B67D781
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 20:00:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g3so8915699wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8MGq9Z3X/M3smO2Yce88qVykrVjiTqYH55Wxu/PcWVw=;
	b=dL6xKQrd+4oHZ4QiVNQAX+iD7uyuoijrax8aa0r/JktRrRRj0sk3elwaoURwiuXv6b
	urs57WKiSk2jec2JPCWL6qsRnlbvo6ZKUorLmkw28xiUGJMEfzuy9+VzYH1WpcJOadVF
	G7tts6sJqopLfIIL9SOJF8S13gQiWmPpElM6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8MGq9Z3X/M3smO2Yce88qVykrVjiTqYH55Wxu/PcWVw=;
	b=eFjj3AIh4amBwHZYa1B9amAYf/bnhUn58OWa2X24i+rVecjrVhaP9v9s/YSjyoMsHO
	KFNteoBryH9igsZWnCJkzY4v4ndz4ga9m+Tt+QOirBLJSH77tR7JuJDifmlEa2f/0Yux
	sE6kaso01M3iTBuMOw5uv+nwiWO/L1k5K1T9Buo57fPqXeLl2lse7qyTJJvfS1rAY/1i
	hbWQ7TZvCjUqQLjbRpK7r/Qx6HJTAsi22M452gypIob7FbjMYxAQtyNAL7kkVQprW2w6
	4a/uC5RuHHBH6c+91B1+RK07vPNmHRPbqm3v0MFw/LLdGoZTPL94zMJ97t01lfLsggBH
	YBGA==
X-Gm-Message-State: APjAAAV0FtzwoPVKW7pKGGE8cQCbuhfY9XEG95N5q3DxtY0KwsqHwDmb
	c6ePcJ661gxLqykbJhjQYdmYiQ==
X-Google-Smtp-Source: APXvYqwEL8Efrf6elnrn1KOju84MwQMSidyU0d3b/vyW2XQogt3SBwisr7vWlBydYVo/nOa/Sn7bVg==
X-Received: by 2002:adf:f488:: with SMTP id l8mr31403521wro.213.1555012801060; 
	Thu, 11 Apr 2019 13:00:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z1sm33833085wrs.52.2019.04.11.12.59.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Apr 2019 12:59:59 -0700 (PDT)
Message-ID: <89f9a01cf5b0e87afe338360dda5057f34a60747.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>, Andreas =?ISO-8859-1?Q?M=FCller?=
	<schnitzeltony@gmail.com>
Date: Thu, 11 Apr 2019 20:59:58 +0100
In-Reply-To: <6cb9ab41-778b-5e87-dfd2-88d38fec279a@windriver.com>
References: <20190410215402.20055-1-jason.wessel@windriver.com>
	<CANNYZj8K=irJAXpTtFtaNiQ2V+dFpSPT-ikfTgK5e0TECCv_fQ@mail.gmail.com>
	<3e65af20-d2ad-603a-d121-a5982c0ae69e@windriver.com>
	<CANNYZj94F69Ske57dARqP__Yk5iiutjaqxcens6tR84sfVMF+w@mail.gmail.com>
	<847b6274-fa84-c76b-ee52-b4f884d63c0a@windriver.com>
	<CANNYZj9k0qM+O9+mVmHf1JM6MR3Cd5xbuhfZFWTqXcW+DnXb2w@mail.gmail.com>
	<6cb9ab41-778b-5e87-dfd2-88d38fec279a@windriver.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection.bbclass: Disable writing to $HOME/.cache/g-ir-scanner
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
X-List-Received-Date: Thu, 11 Apr 2019 20:00:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-11 at 11:36 -0500, Jason Wessel wrote:
> On 4/11/19 10:35 AM, Alexander Kanavin wrote:
> > On Thu, 11 Apr 2019 at 17:25, Jason Wessel <
> > jason.wessel@windriver.com> wrote:
> > > > Generally because generating introspection data is disabled for
> > > > native
> > > > packages, as a matter of policy (do not build something which
> > > > is
> > > > unused and untested).
> > > > 
> > > > If you could add
> > > > EXTRA_OEMESON_append_class-native = " ${GI_DISABLE_FLAG}"
> > > > 
> > > > to the gdk-pixbuf recipe, and re-test (without your fix, to be
> > > > extra
> > > > sure) that g-ir-scanner is not invoked and nothing shows up in
> > > > its
> > > > cache, I would appreciate.
> > > 
> > > Thank you for the explanation.  I think the problem is more
> > > widespread than just gdk-pixbuf, now that I have a slightly
> > > better idea about what we are looking for.  My build is not even
> > > complete and I can see there are three additional places the g-
> > > ir-scanner is creating .cache entries.
> > > 
> > > /poky/build% grep -r /usr/bin/g-ir-scanner tmp/work/*/*/*/temp
> > > |awk -F/ '{print $4}' |sort -u
> > > atk-native
> > > at-spi2-core-native
> > > pango-native
> > > 
> > > 
> > > Is it the case the bbclass file should be altered to set this
> > > variable for the -native, or does each package need to be
> > > modified individually?
> > 
> > I think Andreas's patchset that was recently posted (and is
> > currently
> > in master-next) takes care of this in a general way, where you
> > don't
> > have to go and fix every recipe. The unfortunate bit is that meson
> > does not have a standard flag for enabling/disabling introspection,
> > but we found a way to deal with this that is as generic as
> > possible.
> > 
> > If you try with master-next, would be good to know.
> > 
> 
> It all appears to work fine without the need to patch anything in
> master-next.  
> 
> Thank you for the explanation.

This is starting to look like something we probably want to pull into
the warrior release given the problems with meson converted recipes
otherwise?

Cheers,

Richard


