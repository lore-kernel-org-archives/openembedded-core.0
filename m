Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 37EBB60EE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 18:08:01 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id jz11so5895821veb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cYlgIKNl/Hj6PKipojBPzTsEUSFVNNlTBCxnbn8K2T8=;
	b=TePC54tNnGEqkduwKNYl/+3sgTJ4HvtewjXMOIeUtdxe0/aDjGWQCxiCloMqeCOJay
	6QUK5AjO7DR94ZYgF/BMu1RDC2YdnwYQ+NB1OksYzj1iu3BfrBH2L3HCEfcWMUdCP8rf
	kPKZu4VLkWJKg6Xic9UAeGTsa6OPuNV5+KY8uVu18MxBBo54JRp8sR78wSPhLr9RG/N3
	Snr5oFHJtYWkhPNsCx94Aw4x1omUoElwC2nXCWBuuEcw4EUfmHk58St6Pe+Hr217Dy+x
	5l7JIpSCLGaQjLKyulRJMfKDgxgebOmryBg4GGOmzvdQsDJLzlnvcR9xNE68QEwqvvoh
	12mQ==
X-Gm-Message-State: ALoCoQlKsRcTdEcQK1JFCHKTmCbLOv5tGIvBcke0X6Uq0/zSrTho8pzLv2+1lOkbBwRKPKeWFAnL
X-Received: by 10.221.55.4 with SMTP id vw4mr1245635vcb.37.1378922882632; Wed,
	11 Sep 2013 11:08:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 11 Sep 2013 11:07:42 -0700 (PDT)
In-Reply-To: <5230AFB0.7010008@mentor.com>
References: <5230AAB4.2060005@mentor.com>
	<CAJTo0LZMNna84CTpC3QTr6X+kMMcFXCERgsx=8kaqL3PpRr_hw@mail.gmail.com>
	<5230AFB0.7010008@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 19:07:42 +0100
Message-ID: <CAJTo0Lbt25Rd0yz3XGTjhA3+S-55t6DpgyhhDRmxSpxB6HNpTQ@mail.gmail.com>
To: Stefan Seefeld <stefan_seefeld@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: build errors after upgrading
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
X-List-Received-Date: Wed, 11 Sep 2013 18:08:02 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2013 19:00, Stefan Seefeld <stefan_seefeld@mentor.com> wrote:
> But meanwhile, what is the appropriate fix on OE trunk, to get back to a
> working state ?

The appropriate fix would be fixing the configure script.  I'm
starting a build without opengl now to replicate, unless you can beat
me to a patch.

Ross

