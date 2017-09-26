Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6B57804E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 19:19:28 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id s62so5578124ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=F7XbeJF+RAlzg3KGGo4XSNwyWRtOKPuJqVDR80+VjuQ=;
	b=fkOu5qyFWLaQg06mp1IfdQIPbX29JMcjb1CIO7w9ZMGBPxsJbyz3xzNslI18ejKWW+
	0N47zVsgAvtw61k/UNau/mLMOuLlFRQd8RWJi/Pef0EFAWyOF28RKoaBeSyUK2PWjzAV
	EqIT0YGuyBtjZ0wnOZjhwMNysyyb3vU8eh3DwldcaN7GPIw5iECfrTfikqHq6sOVn84a
	o3ErEKNlVAetMvrgT0fQAoUbMvQtBdpmlLQhcx4Aj42v1PgdqiwsNnPK1EiQ2wUwjGn8
	WBidRW4SDwS4CobtUGqSvHkfrZZ/PqhwQT+0O8cN3nQqj/rgBs4+5Y5pxR+VbymTg5+n
	UjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=F7XbeJF+RAlzg3KGGo4XSNwyWRtOKPuJqVDR80+VjuQ=;
	b=WYMmouA254PM7uryeo8l3YGmldELwe1BB1Ts6x2pySbGEp9CmLfsk4i1Mo0iMlQ0bs
	hHm/DCMj68CTchzb5JnnxxZCcO1h3EB9Slb9o/tw80sdeaENTiO2SbgXFztirUDcEnut
	R8qn5ho5byYiM2sxXW6NsVAPb14y6M3txuMQY5wbtZcI5uiL83ZFewFYOV/VbuT6iHrT
	1nU4orSv/ZUhuzanZ/CMC61Kqeo9tTslpyGgFrugKvzoDx1cd0CftdIS5UTKzyYEbF7Z
	99GNogTF5RCVSxCIRPBmup0eeuaNAArE43nr7RnZ9akNYmXrYN9v6nDuqfS6s1XjbBKi
	VaFw==
X-Gm-Message-State: AHPjjUjfhF7nT+ten2Q2o3TVHVw3N1I3l3MXfujf9pZeFDqMXyN/woc6
	x7ywpcJQYMk9u0OdoC1hW5OWAQHG
X-Received: by 10.129.112.85 with SMTP id l82mr7248221ywc.191.1506453569282;
	Tue, 26 Sep 2017 12:19:29 -0700 (PDT)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com.
	[209.85.218.42]) by smtp.gmail.com with ESMTPSA id
	z77sm3829739ywd.31.2017.09.26.12.19.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 12:19:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f42.google.com with SMTP id p126so13467295oih.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:19:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAUC/406xBaqyNQU3WGEnOTZTCKg5hMVYPzxR8fmbefvFhWFrlwUYv/sxU9BgLlnFwXVKyNEYQVQeK3xaFg60A=
X-Received: by 10.157.18.162 with SMTP id g31mr2879998otg.158.1506453567586;
	Tue, 26 Sep 2017 12:19:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Tue, 26 Sep 2017 12:19:26 -0700 (PDT)
In-Reply-To: <CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
	<CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
	<CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
Date: Tue, 26 Sep 2017 16:19:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpM8_5_AdiO=g-FbcZEH7EVby5nKniQ0m2XhVRdbG593Q@mail.gmail.com>
Message-ID: <CAP9ODKpM8_5_AdiO=g-FbcZEH7EVby5nKniQ0m2XhVRdbG593Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Tue, 26 Sep 2017 19:19:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 4:16 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 September 2017 at 19:04, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > Does this depend on the upgrades, or should it work standalone?
>>
>> This works standalone. I've been using it.
>
>
> In which case I should report that when I applied it, building weston
> failed:
>
> make: *** No rule to make target
> 'protocol/xdg-shell-unstable-v6-protocol.c', needed by 'all'.  Stop.

Are you using pkgconfig or pkgconf?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

