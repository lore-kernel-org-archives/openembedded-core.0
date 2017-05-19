Return-Path: <anders@chargestorm.se>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6A23077E13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 09:02:33 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id w50so12695646wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=9UQPpBL6nQM6kR6+9sFD5au6yEZIAThd4AEvKv4AU58=;
	b=OkAU0Oy/mJqoz27k4flqc4eGn21saxj81J1B2pMLgEQwCCP0X+dWXqn5e4w+ERXcSR
	Zd5PSLKIgs+nefdLtUq7ASryAaZIYUWjl4WQhw2CYIc9eQX8Kd+knN8cHORz02kjr5Fx
	+IuAA7Hu7l+oby5+QIQXUo1el4JfRwQPTbLU/aOpwWMtHvfzvq1bwtdDu5YFmy80fJri
	+xFY9kbHl6qWgcE/QUccUuFoaRm4ERFLIk+tT+TFUXZjGIIX9G+4Tf+kvzXXv1VGUCOZ
	YUfKJjnrZdDLaS88ZOG25AATSc2lX0VpuuRK7mDv9FuVN4VmoqGBLF56dzX+0Az3Ag6Y
	H9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=9UQPpBL6nQM6kR6+9sFD5au6yEZIAThd4AEvKv4AU58=;
	b=Xx6abwkykjm47ZGYGO4iX4gAXwS+oG6Zlm/sA7IYPFGm162FP7KnAY8S2GlDwiHrPD
	999HSIfZLqAuBEV/seZo/pTbaBb6/mE2uELalg2S8eHevoSnxUWmZ+qdZSuHG6JEeX+s
	hRYZsLn353XjVncr1n3g9PwsLhtpxiSNgBNlMqSxFG0BjW4y/Xl0nnI+aoKI2nRdFcQM
	4mCF7qNpoLNec15l8rx8MI6PPn+Lrgj1MTL3ktUVu6wsxnT/GMGlqUfgZeRpOC/jWlAm
	ZKHpQiHi963yXWAF/81Kw94XmIA+gIuDoGJKd7ypFAjiAKzLGutprjP8o0V0ZfpZX157
	OHNw==
X-Gm-Message-State: AODbwcB4VsZtjp7I9DNOkArOPMwuBUASRf5lvpSi57yxh3ko96y2XkNr
	9g+uuoiftlAJaofD
X-Received: by 10.46.13.2 with SMTP id 2mr2307556ljn.93.1495184554906;
	Fri, 19 May 2017 02:02:34 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id v70sm831345lfa.61.2017.05.19.02.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 May 2017 02:02:33 -0700 (PDT)
Date: Fri, 19 May 2017 11:02:32 +0200
From: Anders Darander <anders@chargestorm.se>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>
Mail-Followup-To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	bruce.ashfield@windriver.com
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
	<1495149157.27342.142.camel@linuxfoundation.org>
	<CAMKF1so_wFUH=eNqBc_Qhach4+C1mW73ZFUuK=TqLaYZ81C=Hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so_wFUH=eNqBc_Qhach4+C1mW73ZFUuK=TqLaYZ81C=Hg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170306 (1.8.0)
Cc: bruce.ashfield@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
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
X-List-Received-Date: Fri, 19 May 2017 09:02:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Khem Raj <raj.khem@gmail.com> [170519 01:17]:

> On Thu, May 18, 2017 at 4:12 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2017-05-18 at 17:28 -0500, Jose Lamego wrote:
> >> Some recipes build fail due to missing ed command.

> >> This change includes ed to the hosttools required to
> >> run builds with oe-core.

> >> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> >> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> >> tel.com>

> > We really don't want to add ed here. Which recipes are failing and why
> > do we need ed to build them?

> we also need whoami which kernel uses to identify the build user id


No, we don't want to add whoami...

As fas as I can (in a recent kernel), whoami is only used in
scripts/mkcompile_h. And there, it's only used if $KBUILD_BUILD_USER is
empty. I'd rather see that we set $KBUILD_BUILD_USER to something
deterministic in our kernel.bbclass.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

