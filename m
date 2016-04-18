Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0454A605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 22:31:43 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id 184so85497757pff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 15:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=jL9n6yFbI3stJwYdRqSfRM4w1evBy5qlkbBBlVH/VhM=;
	b=UNd8PX/KYkNoCYAe9FvXv/q0by7FMM7tM2NEJzxuVfMpSUJJMr2t/kVJD9E3QiEchE
	GsMPLcDwsXSxDew1IOO1grdfFkaG1w+5TR8MqBOm2qpddUC6Phkh6SN6DVNnj4mRpz3k
	a/ZgJophP8S83NIwBuxTNOGBNbbVQe6IxSloKAbwb4xgO7vJ+b7FPTUjI9mrlrWTb46X
	DIOVfVKMVtFN7fymLZIhhZhBu2Hj99qM292oyRoSX9B4Oo5Mnf/QFBf1xI3Yvfp7B/+Q
	8CdJp5RgEQ8dwOSRPhG38JErvZIcDF05PehG7Z3CZ4tcgIhpMyo358wzjrxtlwGgfNnu
	H/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=jL9n6yFbI3stJwYdRqSfRM4w1evBy5qlkbBBlVH/VhM=;
	b=Y5gsMQKPADckykZmZvqZ4CqHKgqA9VqrJXr8uEUoVJWEEh3ngwTsYaojsQNYdhqheQ
	lj6JflgAi8XmZmvL44UvxCLqOxumkwURKFr+HC1fksNitULeI3s3pXeoGWOzrNn2AA98
	bJ5e1ssJYFB2uiBA5zvkfoEdCgE3vbAxWVc7vDExJBR18znE8zNd2Q3X7IkDxiSetA3i
	nMx9Jbi4JIztvt3ggdZuJow4p1cEgfOZeRjkFh0ksEAtUH+MQlZx6FOac182onlixERg
	Sc1u60GwWtcVwEgJrvc2D/f558Eg0C+9JNYZKWCpY2zE6TBjWuZiY74rqUX2TcF4D2Nj
	dVUQ==
X-Gm-Message-State: AOPr4FWLfpcHC1ik+6KDKROlxE0sXbxzSVbMgY3d7eN/5/Kq9yVmzT6dIskBqNBNGX9epw==
X-Received: by 10.98.91.198 with SMTP id p189mr30009698pfb.91.1461018703889;
	Mon, 18 Apr 2016 15:31:43 -0700 (PDT)
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com.
	[209.85.192.169]) by smtp.gmail.com with ESMTPSA id
	s63sm30207372pfb.71.2016.04.18.15.31.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Apr 2016 15:31:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f169.google.com with SMTP id e128so84867784pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 15:31:42 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.11.205 with SMTP id 74mr52792953pfl.98.1461018701908;
	Mon, 18 Apr 2016 15:31:41 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 18 Apr 2016 15:31:41 -0700 (PDT)
In-Reply-To: <20160325115503.GE2555@jama>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
	<20160325105025.GC2555@jama>
	<1458905339.3073.53.camel@linuxfoundation.org>
	<20160325115503.GE2555@jama>
Date: Mon, 18 Apr 2016 19:31:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpZc=zKfUHtbJOJt5sTdXDkrEOMdKOZXBkxPUJCwmxFyg@mail.gmail.com>
Message-ID: <CAP9ODKpZc=zKfUHtbJOJt5sTdXDkrEOMdKOZXBkxPUJCwmxFyg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Mon, 18 Apr 2016 22:31:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 25, 2016 at 8:55 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Mar 25, 2016 at 11:28:59AM +0000, Richard Purdie wrote:
>> On Fri, 2016-03-25 at 11:50 +0100, Martin Jansa wrote:
>> > On Wed, Mar 02, 2016 at 12:40:31PM +0000, Burton, Ross wrote:
>> > > On 27 February 2016 at 22:09, Martin Jansa <martin.jansa@gmail.com>
>> > > wrote:
>> > >
>> > > > * add separate variable for configuration options generated from
>> > > >   PACKAGECONFIG setting, this helps other bbclasses and recipes
>> > > >   to take advantage of PACKAGECONFIG mechanism, without including
>> > > >   other options from EXTRA_OECONF
>> > > > * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
>> > > >   from PACKAGECONFIG:
>> > > >   EXTRA_QMAKEVARS_PRE +=
>> > > >   but with
>> > > >   conf/distro/include/no-static-libs.inc
>> > > >   it means getting --disable-static as invalid option inside
>> > > >   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
>> > > >   to use poky with meta-qt5.
>> > > > * once we migrate all bbclasses and recipes to
>> > > > EXTRA_CONF_PACKAGECONFIG
>> > > >   we should also restrict EXTRA_OECONF append only to
>> > > > autotools.bbclass
>> > > >   like I did for cmake.bbclass
>> > > >
>> > >
>> > > Sorry, some of us have been a bit busy trying to get M3 stable.
>> > >  This does
>> > > look good and I'm for squeezing it into M3.
>> >
>> > Any update on squeezing this?
>> >
>> > meta-qt5 is still broken with default poky config
>>
>> I'm a little confused, was there going to be another version with some
>> tweaked variable names?
>
> Was there some agreement about variable name?

meta-qt5 5.6 is using this so we need a final decision if it will be
merged or not. I am in favor it as I think it is clear enough.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

