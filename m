Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id DA4E073117
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:40:37 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id d10so109577oih.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 21:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=91YZ54mxSyb3z4ZpzeDTlpvBeNXQkPlWzNy93p83QQU=;
	b=z50rNbwmx5nM8E3HSBalZD+HzXPav03YxNQbRFRdoBNzoHF8HuPr7bcPc2odK1SlEB
	SI+yXbJEGqQKO+b9QiC5kkKMPGu8P4MMSGyHyhczxzhvgFsnQ6e495Nh9xVL6KdnU/h4
	RZuExwz+u9GhH/XnvtXrpYKRu3E8/YiF8zLn3zKB8N4ZMa/qxhBewU8AdTslpfpUxZlx
	xS9SGtJhZNvZJXTp0ouczBVqimJbeJfYsyjybTrFGY+TB3ypXQG4w0gqUNkNOGxwLkpU
	Jq1NH02DY1CeLfes+Ezd/blRhblB++Kf9dbi19Tm1Z2vBqVgn74FkrFe07z3dzGOY47s
	SJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=91YZ54mxSyb3z4ZpzeDTlpvBeNXQkPlWzNy93p83QQU=;
	b=pT10x786FPkF2X+x3HXmuiHSL1BupN0jAGOPYNovFo4Eurf5EypTbHKTtTdYEQ3/hu
	1zQEj9uoojjKk2hQiu7MSF1XyYuU45xxj1hjSLQEO54dXkcFF4Er2tyX7O3+dHCKWjNt
	z6mx21jcf9EPfddO1tWyphK7+OU7h+WzhpxJIOK+zRDlu0LatHQaTS7rcoz6kIgSAVkZ
	crvNHkl2pV44PWTpBmM6XZNJyzP6E7tG6AaF7RfqW61/mUETl9yM13nAlKAKW5cjYflj
	0xofix3oOxbAiBqMkkQeQqbwpNl6p4F55xPySCkrfATr6De3uJeyUcjBbeizETguvwbC
	RLpA==
X-Gm-Message-State: AHPjjUg9Apa09tVCsaRddagCfe92R5Z0yqz35OQ5HL9uJYDFUeXf+1IB
	1gP8bifnxYdOSguiDsI=
X-Received: by 10.202.237.131 with SMTP id l125mr2236371oih.254.1504586438413; 
	Mon, 04 Sep 2017 21:40:38 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	c187sm11715513oih.52.2017.09.04.21.40.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 21:40:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id x184so16779382oia.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 21:40:37 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6vmGuYIK9r2lH24s1mA8q47QJurT7z0+eemdrmyR7B5BVok8WtMncmMvRmGHy/E6JvXY/U1SR4AaiwAMOYCOc=
X-Received: by 10.202.56.194 with SMTP id f185mr2183136oia.249.1504586436866; 
	Mon, 04 Sep 2017 21:40:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 4 Sep 2017 21:40:36 -0700 (PDT)
In-Reply-To: <CAMKF1sruu96Y0ZUsHXDWG08=eayFWMe+p6QQJwk1oOw6qPViUw@mail.gmail.com>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
	<CAMKF1sruu96Y0ZUsHXDWG08=eayFWMe+p6QQJwk1oOw6qPViUw@mail.gmail.com>
Date: Tue, 5 Sep 2017 01:40:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqsTuHMTUPOqERNhTw5WvxhYMw40-PDVfh59LwTWatdCQ@mail.gmail.com>
Message-ID: <CAP9ODKqsTuHMTUPOqERNhTw5WvxhYMw40-PDVfh59LwTWatdCQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Revamp the Go support
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
X-List-Received-Date: Tue, 05 Sep 2017 04:40:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 5, 2017 at 1:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Sep 4, 2017 at 2:06 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> This is not yet complete but does improve some parts of
>> Go support on OE-Core.
>>
>> We are trying to port as much as possible work done by Matt on
>> meta-golang back to OE-Core and also to avoid carrying old releases as
>> there is no need to support more versions of Go toolchain.
>>
>> The first commits on this serie does fix errors in current
>> implementation, the others are improvements and clean ups.
>>
>
> these changes look good to me in general.
>
>>
>> Otavio Salvador (7):
>>   goarch.bbclass: Stop passing True as second argument of d.getVar
>>   go.bbclass: Fix binary installation path detection
>>   go: Remove Go 1.6 and 1.7 releases
>>   goarch.bbclass: Add support for ARMv5
>
> Does it work on v5?

Yes; I've been using it in UpdateHub project. I can retest it on imx28
if you want.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

