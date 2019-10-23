Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E91F87F8B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 21:20:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w18so23097790wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=eft6BT3i4Y4AbPEC26tLWRf3D3mdp9AMxGbgdNKUsLY=;
	b=Natxh4As4Ff3vPZTQenb7tiHLkc+OjUSqFSmHM3AR2kNl0DL5KIYQzrXMk6nAETZlK
	TFoDr/xEJaIfPyemGbrs24uesEQVC0/TqxFmkNRXCwAOb3HoN7aHpLr2t095hFLrr+9B
	pgYICn9hGG9ibxH2RH1VtAfeulZGo/mpxsNVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eft6BT3i4Y4AbPEC26tLWRf3D3mdp9AMxGbgdNKUsLY=;
	b=O9xkuNpI1oLm8NiG0MFCpDp+hGKtfrVwiOlQSKk37LP3F6Xj0FQMv7GefmFWjPhtAU
	N0m4HdHMoaTZNOmnLEWXk12yrqkXsQ/1F8IorguZVol4SjGDC81Z5WTeI7fNaYn8pGbq
	wIa/UQd8/H+uZsSHtlNFTMNnTqE3/Fe3+qx8r7R62Fw/eNx1vxnugexYe5Y0m+E/uJtA
	xAyBLGhMYl12y44f9MZRgFgJUeFUJD+fhwE1U/lLB39OqYRiqpicPlxTI8Ezqdvz5EnQ
	OwKutpeoFpQ2hUglnzwIP2hTPnTmR1K7kW9b8v54O4ncr+aIYm4wsZk1soppmuu+Ad1l
	UWgA==
X-Gm-Message-State: APjAAAXp1Z1fxsTYm4BH2s4EH/tNNu5vnp7yN5Zi6eF6aUZSNPKPgnUg
	CJtgrkgYxjhFMeS/Dxlze2PfLg==
X-Google-Smtp-Source: APXvYqxHce1GRx36yYnX/fp9ZuLfmj3ct9qzANnWCDkcpuQTv7mSL2BD+IAipGi7o/ciWq3cj7AxgQ==
X-Received: by 2002:adf:efd1:: with SMTP id i17mr645110wrp.172.1571865631589; 
	Wed, 23 Oct 2019 14:20:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o18sm26244329wrm.11.2019.10.23.14.20.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 14:20:30 -0700 (PDT)
Message-ID: <f6b699e51c006c103b143b2f5eeddc8a34bf26fb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Ross Burton <ross.burton@intel.com>
Date: Wed, 23 Oct 2019 22:20:29 +0100
In-Reply-To: <20191023192329.GA31488@localhost>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<20191023192329.GA31488@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 21:20:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-23 at 22:23 +0300, Adrian Bunk wrote:
> On Wed, Oct 23, 2019 at 04:29:13PM +0100, Ross Burton wrote:
> > On 23/10/2019 14:03, Khem Raj wrote:
> > > Hi Richard
> > > 
> > > New master-next I see these fails
> > > 
> > > https://errors.yoctoproject.org/Errors/Build/91645/
> > > 
> > > First two are important one's we already know why
> > > ti-display-sharing-fw fails to fetch
> > 
> > ERROR: QA Issue: libiio: Files/directories were installed but not
> > shipped in
> > any package:
> >   /usr/lib/python2.7
> >   /usr/lib/python2.7/site-packages
> >   /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-info
> >   /usr/lib/python2.7/site-packages/iio.pyc
> >   /usr/lib/python2.7/site-packages/iio.py
> > 
> > That may have been triggered by some change in oe-core but that's
> > definitely
> > an issue with libiio.
> 
> I'd agree on that:
> 
> Python bindings were converted from python2 to python3 last week,
> and it picks up the host python 2.7.
> 
> -inherit cmake pythonnative systemd
> +inherit cmake python3native systemd
> 
> This does not in any way guarantee that there is no python2
> interpreter 
> available.
> 
> > WARNING: TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-
> > astor/0.7.1-r0/temp/run.do_configure.7679:1
> > exit 1 from 'NO_FETCH_BUILD=1 TOPDIR/build/tmp/work/mips32r2-yoe-
> > linux/python3-astor/0.7.1-r0/recipe-sysroot-native/usr/bin/python3-
> > native/python3
> > setup.py clean'
> > ERROR: Execution of 'TOPDIR/build/tmp/work/mips32r2-yoe-
> > linux/python3-astor/0.7.1-r0/temp/run.do_configure.7679'
> > failed with exit code 1:
> > Traceback (most recent call last):
> >   File "setup.py", line 17, in <module>
> >     setup(**config['options'])
> >   File "TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-
> > astor/0.7.1-r0/recipe-sysroot-native/usr/lib/python3.7/site-
> > packages/setuptools/__init__.py",
> > line 145, in setup
> >     return distutils.core.setup(**attrs)
> > 
> > Looks like whatever astor is doing with setuptools doesn't agree
> > with the
> > upgrade to 41.4.0?
> 
> The recipe is behind upstream, but even the latest version needs
> fixing:
> https://github.com/berkerpeksag/astor/issues/162
> 
> Temporarily broken leaf package, not really important.

Well, yes. The proposed policy is now that we should address these
kinds of issues if they get reported. Whilst I understand why and that
Khem doesn't get as much help as he needs with meta-oe, pushing the oe-
core maintainers to fix things likely won't scale. I would like to see
meta-oe quality/reliability improve though so I do understand the
desire.

Since I'd had to look into them, I've posted patches to oe-devel for
the above two issues.

Cheers,

Richard




