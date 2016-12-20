Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id BD21877338
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:17:56 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id b123so14284047itb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=a0PfvhlvS/hFz3/4aQTn49W6cQk1lDqW+rchyCyK0qo=;
	b=V0XeHJXmsD1Prhyz/v2mEb9bcYLrJa5eyWU0qDdaoNlrmQSRnWnSaiOGmvxLs9TMCQ
	iOA+XjZ63283GhkUYJoaTDWkkKI0mjgKletyERz75TtaT+u31EdtFyaV9NP3Z0NNPWnA
	k2+tboud2/DVNy3o+j4LNuG56VyihyNm3LYDbDpLUYFyP26oPceiFHiNnjSPsxGgHjqD
	805bPyjU9Y+rmb62ikXzsUvCN5K7nUOyo7DjiiGGOoRkWFpkXKHCJhZfnovjtIE1b2SO
	22SpWkMq5wtsyeeoW5H2Va4WkAUDLKDMAu28mzm4hvHGQf5wZMIN7mfvwb3KPsL/yrAb
	oGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=a0PfvhlvS/hFz3/4aQTn49W6cQk1lDqW+rchyCyK0qo=;
	b=tA9T7lCP0iQqcnGToLTKI0RHjwooDfFpzBfRX3RGDUA59+5X429lfswZyyPDjcf7be
	g1+u/rAbhLwjqV7/9pYhZdhC8BFSPCssjcaat4+OYVd4TZfdrjHJLjTaDS/e8AgU2YwS
	aaEKD1XRCNJCVqSjl/9ztX5TrHBMA4CejmpWJV04rVWa+8qO9Xyc97AdyyyOzrkW7lWP
	t69OGvgc6oTaalYVMslc2LaTVGOH3GT1ptSUzk8EwoqTGpnLMWFtKviXbijH7W+wla/x
	/jKcP0Z+ism29Qy61hK5wzdK/0qKqxvGj9LWXALi7LafzbxUX9AfMx96aAfd0YnkZsxX
	yygQ==
X-Gm-Message-State: AIkVDXJGvjjgi5ZtsdqaJuOS8TzTQ/Q1+kIoBY+hJC6xAZPpqMTXA2vsrtnZu7Od7sSgMg==
X-Received: by 10.36.160.134 with SMTP id o128mr2647275ite.26.1482247077954;
	Tue, 20 Dec 2016 07:17:57 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	p140sm9014119itc.22.2016.12.20.07.17.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 07:17:57 -0800 (PST)
Date: Tue, 20 Dec 2016 10:17:55 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161220151755.GC11748@openSUSE-i7.site>
References: <20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
	<CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
	<20161220145554.GA11748@openSUSE-i7.site>
	<CAJTo0LajFQ85DckLMqS7Tbza4NJNNc4A6QMuACa4XDb6PiHJnQ@mail.gmail.com>
	<CAJTo0LYzEZpgspkijcDOUUwPSRBaiWsYbts02NkBy4FJW28jOg@mail.gmail.com>
	<20161220151401.GB11748@openSUSE-i7.site>
MIME-Version: 1.0
In-Reply-To: <20161220151401.GB11748@openSUSE-i7.site>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 15:17:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue 2016-12-20 @ 10:14:01 AM, Trevor Woerner wrote:
> So I only have the version 5 -config scripts, but my host has version 5 and
> version 6 -config scripts. I'm guessing we need a dummy ncurses{w}6-config
> script in the sysroot too (?)

YES!

Going into my sysroot and creating v6 -config scripts by simply copying the v5
ones allows util-linux-native to build successfully :-D

