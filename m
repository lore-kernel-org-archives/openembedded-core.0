Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id B92896BC8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:00:17 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id j7so2276913qaq.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 04:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j6gkLpPCwGqL4XhqTn14ahIloxSlpFvbW6xt5oV0DIQ=;
	b=k9S/9wcjIzdeH3SLqpJnfrjJzWWjD76BdJGpws8BctWYxxwoSNrqMQj2bjZ5llQeZE
	lvhe4gwqMxlIPwv9X3AGdhK2WhW4fKc8SRv7XYh+NRVgMnRbVjdITgXNZs4R9qO6s78x
	RuRu/hqwwUb1/lBWd9eUQPomzXQPp8Wber/0/luAsv9CsDnTKqNT4GBzbXe2UbQfGigq
	zl21/FzNWxZo+t/3XlnYSX7nM6Pv9z+//5DQhAzdgtnjEiRH+Mfy/GeCZb3DdxqedYNu
	2QvHpXPm20DOTn/VWOUvJ8ipNDujhvYY/kfRp2RXtP2OIcG4QuGxs0yZX25UzrsvOVDn
	iaaA==
X-Gm-Message-State: ALoCoQkh1kZosHZWzHKD046wTzQuV5RQBsqxz7ynN9zuvfH704FEVShzbYyc7+VNVAQjNvLEmjYj
X-Received: by 10.140.42.9 with SMTP id b9mr8141798qga.87.1394794818684; Fri,
	14 Mar 2014 04:00:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Fri, 14 Mar 2014 03:59:58 -0700 (PDT)
In-Reply-To: <532265E8.1010907@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<7337ad5ac0c8f13c3b23160f2a2ea6e9dc383f64.1394555880.git.liezhi.yang@windriver.com>
	<CAJTo0LYPyrTpEN6w4g5KcmsXMB6=GvaKxcshObb1Co6Lh3A8VA@mail.gmail.com>
	<532265E8.1010907@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Mar 2014 10:59:58 +0000
Message-ID: <CAJTo0LaxADf1+jyUNMZe5ZLGCxtocoPo_Pr9WiZ_aLMs3d8=XQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] package_rpm.bbclass: archive the source to srpm package
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
X-List-Received-Date: Fri, 14 Mar 2014 11:00:21 -0000
Content-Type: text/plain; charset=UTF-8

On 14 March 2014 02:14, Robert Yang <liezhi.yang@windriver.com> wrote:
> I'd like to remove the sources in the first thought, but that would
> cause a problem: if we only re-run the do_package_write_rpm, for example,
> when the FILES is changed, then the sources are gone, and we would get
> nothing in the .src.rpm. I thing that keep both the .src.rpm and.tar.gz
> is not a big problem, so I changed the usage to:

Good argument, fair enough.

Ross

