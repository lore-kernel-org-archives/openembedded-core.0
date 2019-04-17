Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BD4D77C62D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:37:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so31037768wro.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jQuyKda8+yoO0rHyvU/sdK2pgY8VnbyzmWzuMGFOyfI=;
	b=D+9PfLRWaEcxZLfzSMerNxfmvRACOzqbPXd/oX9ze9pvus/fvjkYzabCwXuvDEQ8SM
	erVenhLtPUsK9HkfXbqE+KeiNatJvIWdX5WEyhm90z8EmU5km9dA4r+zqke2OlRZCDsg
	64M9+QIDq/hrk7bdlked5uqVd/DWRP0Ia0gX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jQuyKda8+yoO0rHyvU/sdK2pgY8VnbyzmWzuMGFOyfI=;
	b=h+9O00sCQJeoMQ61o7qzDikfW4tKTYCtjieFm+1GGg0BVZcUXspO2fnxBXlB+N3MWN
	3/AwqhHioSdydIqQ/DHiU2pW19bBb4rr9SpIAgKxpJFPbdRiAdc7JODedcOXUGtVAr3w
	rNnpchCTrs5wkNQNZoeBh4ogGKTNKAn8arhtv7LE38T9rrzkyQ7zvLbzBXnPejKNm5YU
	ObdmLsDbplacXVOBJNnmXPvoaIAW7Yk4pIlw4hrDVA9PDicW6a3ruI/Qp2ZDAezj1OjZ
	JN08ptFIpEz+BM+JqxJE95tTULWmspNLQE8He7RPEoNH13BbSJgm6fq6uiaqkm2YwrIT
	OYWA==
X-Gm-Message-State: APjAAAW+9elRq4bjqBOVDWAsxe8SaTnbjukhScMy1FhHSLELy5BtWD2B
	9A7h2iamom+UmkTR/ld0Dnc3zg==
X-Google-Smtp-Source: APXvYqysKKsTs1F47Kc3+4doVIgxo3Rmjomm8Pi2CdjgzcY+/n3qri7H59D4k4PXHFUFJVDQJU9ZXg==
X-Received: by 2002:a5d:698b:: with SMTP id g11mr15636007wru.65.1555493868405; 
	Wed, 17 Apr 2019 02:37:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s21sm33186902wra.45.2019.04.17.02.37.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Apr 2019 02:37:47 -0700 (PDT)
Message-ID: <fdc87321d0cba27741ae1b9e1dde703e42683fa2.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Adrian Bunk <bunk@stusta.de>
Date: Wed, 17 Apr 2019 10:37:45 +0100
In-Reply-To: <20190417093520.GA895@localhost>
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
	<b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
	<95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
	<eac500ca51a96c769ab3080bcd78dd93316bea9f.camel@linuxfoundation.org>
	<20190417093520.GA895@localhost>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 17 Apr 2019 09:37:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-17 at 12:35 +0300, Adrian Bunk wrote:
> On Wed, Apr 17, 2019 at 09:46:25AM +0100, 
> richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2019-04-17 at 10:20 +0800, Saini, Naveen Kumar wrote:
> > ...
> > > Should this be added to HOSTTOOLS instead so lfs files are always
> > > fetched for packages that use it?
> > 
> > No, that would mean everyone has to install it.
> > 
> > I'm ok with adding it to HOSTTOOLS_NONFATAL as soon as we have some
> > mechanism in the fetcher or in recipes which detects lfs usage and
> > hard
> > errors if its present but git-lfs is not installed.
> > 
> > That way its deterministic - it builds with git-lfs installed and
> > errors if it is not.
> 
> Is it OK that some packages are not buildable at all on supported
> distributions?

We're talking about a non-core layer and that would be something for
that layer's maintainers to decide.

> Your "everyone has to install it" worry misses the much bigger
> problem 
> that git-lfs is a relatively new tool and not available in
> distributions 
> like Debian 9 or Ubuntu 16.04.

Someone could certainly write a native recipe for lfs and add that as a
dependency which would also solve this problem. I'd be quite happy to
see that and it would neatly solve the problems.

Cheers,

Richard



