Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id B190D6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 20:04:57 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id t74so31697738ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 13:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=l9SbfIYdDnufZ4g5114mYK2HLV4274/ZNbAh9Z4LpFg=;
	b=xOU+Bh/iKkAohKnyw0K4E/KAMMFbsPmtngrFvHo0xbXjvP7yH3HZlmJIitYGDKQ/pT
	sRfME5fQx0R/dslpKoBIvpaOVRNjIA4jlm41GDpXvnkOoRyeyGHx4yXeINeMUuO95Co2
	+yvBRUYMibgvAJRmDeGo6VYCWid7xh5fZJfx3eeBMOo5lCXBdmoXMhDAoSYisuDJ6BXH
	/b30ihuZ2d9KLu4qy6NHdGlYTsGchfNPOjcTv9+6ajPiwb84wAf6BzuLWm9zCpUV8XXH
	hjwYo1+6a6/RrrscMUyzS7mchGTvEqfJY+eciftlwaEeN4SySmx/tSbX9N4EVB7+JJ30
	OTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l9SbfIYdDnufZ4g5114mYK2HLV4274/ZNbAh9Z4LpFg=;
	b=NBZsBbjX0S3h8ekewqpOEBrF5SojbEe172UiId7LnniADH0MB4eKbkt5LH6aj8tZxL
	eozb6/3Q/R6w9AsFQ3OK66gyatrZ2BB4TMISPhSbvcMYdBzoWklrnn/XJS+phsq3BF/q
	ZwJTHqf/Vw4C4SDGcOzHmj0v1HZg0ILzxas4GQqeEMbCseUY5Zp1nSMQo5xPfIFYqo2o
	5AWmw7upEfj4XQpOvZ/Vv46SVhT/GvMKL5WX2YMa4O733nZoQa7fPLeISXPVrvjUgJSp
	EpgiUHRpCXTDZhbc6hFcYOFzzp8k6lqaLgCOoj4TmgYw/ex7wL6FGanSkJ1qiIb5uL2p
	3m2w==
X-Gm-Message-State: ALyK8tIOG+bCZUfDB3phCFakHItfH767QpLSb9VGQNy48B/tWZ/acbB7vwFr8/OMAmx6xQ==
X-Received: by 10.107.175.156 with SMTP id p28mr4682072ioo.78.1467921897766;
	Thu, 07 Jul 2016 13:04:57 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	f129sm1632710ioe.35.2016.07.07.13.04.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 13:04:56 -0700 (PDT)
Date: Thu, 7 Jul 2016 16:05:10 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160707200510.GA4311@openSUSE-i7.site>
References: <20160702081927.7365-1-raj.khem@gmail.com>
	<20160707053905.GA28068@openSUSE-i7.site>
	<CAMKF1spS0OSZ=aWRP+ZJPkcBPn=SfMrgP=uA9SvR8CmNiXm4PQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spS0OSZ=aWRP+ZJPkcBPn=SfMrgP=uA9SvR8CmNiXm4PQ@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Thu, 07 Jul 2016 20:04:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2016-07-07 @ 09:27:30 AM, Khem Raj wrote:
> Is it specific to x86-64

Up to this point I've only been focused on x86-64, but now that I have things
cleared up on that arch, I'll be working on aarch64 to see how that goes.

My "solution" for the time-being is to simply pull in the glibc_2.23 recipes
into my build and set GLIBCVERSION to match. At some point I'll be trying to
bisect the glibc commits themselves to see if I can find anything conclusive
(but, as always, that'll take some time).

