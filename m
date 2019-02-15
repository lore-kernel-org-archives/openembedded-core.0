Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B07B77C6DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 14:36:29 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1guebO-0001PD-8G; Fri, 15 Feb 2019 15:36:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qDS1WHu376WlAEZYmITTnBDR+ltD4u1J8RCsFNqbvIM=;
	b=PYhSoxL4nIOajXUEWH8h9WuhM8
	4ehOHhJW4MDwlfDGRBOTv/fQ48JNbKTdWhOVtB9qbFeCJXyizFEpqezgGR6D4VliQSkNRmEvBu3Zu
	g/BHZiM3MffY5qPCWyzgO4UEIs/DTNFHVaWTEiqeqHnWMAIGaha1UeXjdDZrtKlQnFvosoyDlE2m1
	6PoT5tKFP8A59I29eXg0VQ6cwgGPmWD8yeWAFsVHC1GOPLN/ZXthcSEdCe+UxD6QdWqxptReqorWl
	eF6ZbHIkeqE+MkJANXjz4Z3Eb43Q2ELlYPl9GmN9jdDTbcCtsZCDsNBNH9kUH0ZQ7gpuhkk29kaDE
	i1KwUTFA==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1guebK-0001he-8W; Fri, 15 Feb 2019 15:36:28 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Fabio Berton <fabio.berton@ossystems.com.br>
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
	<CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <be4efd67-1b40-70de-29c0-9e0fdcc7deae@pr.hu>
Date: Fri, 15 Feb 2019 15:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
X-Spam-Score: -1.2 (-)
X-Scan-Signature: 7572fbe1482f51d378d5cb517c4344f1
X-Spam-Tracer: backend.mail.pr.hu -1.2 20190215143628Z
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 14:36:29 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2019. 02. 15. 14:26 keltezéssel, Alexander Kanavin írta:
> On Fri, 15 Feb 2019 at 14:21, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
>> In my opinion, there is no relation with an update and change build
>> system, once we can use mesa 18.3.3 without meson.
> 
> Please see:
> https://www.phoronix.com/scan.php?page=news_item&px=Mesa-19.0-Deprecates-Autotools
> 
> We might as well switch to meson now. The patches are ready and
> (mostly) working.

I have read the mesa-dev list constantly regarding this change.

The deprecation process was painful and issues in the meson
build system still turn up occasionally.

19.0 will still have a configure option to opt-in for autotools.
In this upcoming release they have worked out all known issues
for meson but I would in no way want to use meson for older main
releases because these changes are not backported offically.

So, either keep autotools for 8.3.3 or wait for 9.0 and switch to meson.

Just my 2 eurocents.

Best regards,
Zoltán Böszörményi

> 
> Alex
> 


