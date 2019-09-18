Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id F29DF901C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 12:37:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 3so6154wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rop9bEqM+udr6A+C2HhjsopA4twafX4bxUpLesLW6zA=;
	b=SZ93nKnKCYImFrJYMaV3wr41VOPhjYVvcvBo5UOEsJDX1gLT3W4Cl+wQPY2/cBvQuQ
	ixUqJ26KG5Kigksd2f9PomBcvKuz9HIzEXP68gJo+n2pWzPCHoVyAngZ1QDh1674o8aw
	KAP7cUC9es2ON7wZ669D9aTfgIDynnzVMCvRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rop9bEqM+udr6A+C2HhjsopA4twafX4bxUpLesLW6zA=;
	b=YfVbDKJ8xMj+xvNC0NPP3+7KXT2iY+zEt0yGE69hQArsARmnjULsFSSlRkg50ZAmq+
	7t7ywUeMfko9phg29WfIdf8BdqHKH7XP+mXfmo8DwHJCOZebDSEeYFnNpp3VS0uwxSfW
	kYZyl8+5qt4nr+QJxRXfbfOHWsY6pxbp5Gcdhw/QyYi/iHhJvFLNT4NDYwlpqcsap68p
	YBl3kgPjqu1s05SieAMLQATBtc9zv/fI5brKS16kCNLBQ0Ofw50IFP1OlwZsE4kXo4BT
	2o1Y15S39LgxPhDaMWdZJypUHdvnuK3HYuo3pjnT/kBmBiqznUyU5+/w63YX9ZBADemo
	nTNA==
X-Gm-Message-State: APjAAAU+O530++/gTk0Yj/1pF9QL77xqk2up5ESru2F3Gd/Qq8j4ZLQ5
	9n2Vt+yzVsQrlF5zP0RIP+NFeQ==
X-Google-Smtp-Source: APXvYqwEruaa/GirAmKhjxZ45M2Y0xdGB5WltLxOwBQkgoAGaUfOvZcc51nPwK4ZMXhpqtkOYhArew==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr2561013wmb.34.1568810279617; 
	Wed, 18 Sep 2019 05:37:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	207sm4047367wme.17.2019.09.18.05.37.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 05:37:58 -0700 (PDT)
Message-ID: <6171e6d469ce57159be2a5f9182cd5a4c3134301.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 18 Sep 2019 13:37:57 +0100
In-Reply-To: <CALT56yOx98GPrNCZTMLbShmMvTZz3v4v3Ei5L6Wuvh62Mps6Hg@mail.gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
	<8efc4f66f7509b3cc4235939f542858051b61b8a.camel@linuxfoundation.org>
	<CALT56yOx98GPrNCZTMLbShmMvTZz3v4v3Ei5L6Wuvh62Mps6Hg@mail.gmail.com>
User-Agent: Evolution 3.33.4-1build1 
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/9] uefi.conf: add config file holding configuration for UEFI applications
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
X-List-Received-Date: Wed, 18 Sep 2019 12:37:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-09-18 at 12:04 +0300, Dmitry Eremin-Solenikov wrote:
> ср, 18 сент. 2019 г. в 01:16, Richard Purdie
> <richard.purdie@linuxfoundation.org>:
> > On Tue, 2019-09-17 at 18:36 +0300, dbaryshkov@gmail.com wrote:
> > > 
> > Now I understand more about how this configuration file is being
> > used,
> > should it be called image-uefi.conf ?
> 
> Fine, I will rename the conf file
> 
> > I feel really strongly that we do not want an uefi.bbclass, its
> > simply
> > not warranted and will just continue to expand the current mess of
> > classes. If all we need it for is some functions, those functions
> > should be added elsewhere.
> 
> As those EFI_PROVIDER bootloader classes are called only form
> live-vm-common, maybe I should just add them to live-vm-common and
> make individual classes _append those functions?

That sounds much better.

> > I'm also on the lookout for tests of these kinds of codepaths. Code
> > is
> > much more likely to be accepted if tests are added for it. I'm not
> > quite sure what would make most sense here in this case buts its a
> > general point I will be pushing for going forward.
> 
> What kind of tests would you like? This code already exists and is
> called as a part of any live image generation.

I think these patches are ok, you hinted this was part of a larger set
of changes and I'm worried about the fit/signed image/uboot codepaths
though which are in a similar area to some of this.

Its something to be mindful of as if changes are made to something
which isn't currently tested I will be asking for tests.

Cheers,

Richard



