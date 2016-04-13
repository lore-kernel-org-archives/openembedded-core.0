Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 648AF73163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 14:11:12 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id er2so5643257pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1V2jfeKsVKwY3ighOaYF34jlKgJ/EOWtu3vHpMjhb8M=;
	b=BjD5xYcfpawVk2mgR3Z3nIoO7LBBGmxduttkZZlEc0CuMSJebrtpa/rc9LyhXtVBD+
	0/whtqjslIWeccWbmUctNgTWVk68MOLVs5vruEMlokvKGj7xH5p0j7BYmeZCV5MWrEip
	X1ckFjue+bg/i0DEGWzqAxpZK/Oe6yIpSTjXrlT/TO41gMjgX1gDMo0adjh/+wMaFUqu
	B99dJSQdQQkLvEvWoMUHh1sn9pXLjsdUqGKk1x6WXugvyQLhzR9RTJRPSgMAe6ERFbEK
	ur0RRfv0JVx79HoWqEoUaTKHJqNn63KPcWwAPPbfCP9Cjp9ICp/rG+A8AELZ3cC50EsD
	v48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1V2jfeKsVKwY3ighOaYF34jlKgJ/EOWtu3vHpMjhb8M=;
	b=RNVO+k9OvBN0GZLtbyymQ1WJ2MkztOs5sJdliIKNLHF7jM4lGdlMOJwSX7c69wD5m1
	78C5qTVZUkVr4xrw3ih+q7w87czm+88j6OMnBKjL0CRKOm+n5nImNhBqF0k1AIdkXkfo
	9xSB9o2TruC5xFQ1+YponQ1Bq8MbgLbL7My2acNLXZe/EfsVgXfWPZuvxzVKyIDs8DDS
	SiE//XvuYiBIZYQFOYWCFecRGkOHatunwHWjrURj5NGZWgu+OBbjVOPq7jScFOtMHBb9
	IOICs1uc/BIpqFya4wEjpfF3NbWLZLHp478LMUSCB/t8ilSmrp9XxBXwp10fV7gNNngh
	O+bQ==
X-Gm-Message-State: AOPr4FVPxQO7TfgzYWGyOChajdmED/uFx8eKC3jPLK7MZJN/8b/JlGwV5Gv/l4VrnEjk/Q==
X-Received: by 10.66.27.208 with SMTP id v16mr13345608pag.35.1460556673694;
	Wed, 13 Apr 2016 07:11:13 -0700 (PDT)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	s66sm51517747pfi.3.2016.04.13.07.11.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Apr 2016 07:11:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f48.google.com with SMTP id ot11so34208859pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 07:11:11 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.235.9 with SMTP id ui9mr13191361pac.135.1460556671663;
	Wed, 13 Apr 2016 07:11:11 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Wed, 13 Apr 2016 07:11:11 -0700 (PDT)
In-Reply-To: <20160413140103.GA14803@mcrowe.com>
References: <20160329125626.GA11712@mcrowe.com>
	<1459260670.21672.25.camel@linuxfoundation.org>
	<20160412185126.GA14627@mcrowe.com>
	<1460494253.9308.70.camel@linuxfoundation.org>
	<CAP9ODKrgznCG2ezJLxF7fRsa13-ffD+3tLSttEegp832OoDFog@mail.gmail.com>
	<20160413140103.GA14803@mcrowe.com>
Date: Wed, 13 Apr 2016 11:11:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpPEmPQuz7rJWfzCz5Rw4rpBHvBoRAg-FXktNd2nu6vRg@mail.gmail.com>
Message-ID: <CAP9ODKpPEmPQuz7rJWfzCz5Rw4rpBHvBoRAg-FXktNd2nu6vRg@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Over-pruning the sstate cache
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
X-List-Received-Date: Wed, 13 Apr 2016 14:11:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 13, 2016 at 11:01 AM, Mike Crowe <mac@mcrowe.com> wrote:
> On Wednesday 13 April 2016 at 10:47:13 -0300, Otavio Salvador wrote:
>> Couldn't this to be done, similar to the fetchall task?
>
> That's the sort of thing I was thinking of with my "all_populate_sysroot"
> task in my original question.
>
> But, I've a working script using Richard's method now. I'll share it once
> I've tested it a bit more.

Having it as a task allows it to avoid races and like, when running
inside of the BitBake. It also can reuse the metadata database
information and ought to be faster. Once you share the script I will
see if I can rework it to a task and see how it looks.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

