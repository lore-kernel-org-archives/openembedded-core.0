Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2B93C708B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 14:03:19 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id l13so87992iga.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Oct 2014 07:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=REBYauYBugnKuf70c+3RGfRE9ETxHxYDu5x0rv5ngvo=;
	b=hH44rUFXBqe0Cm9JoPy4dqXlPFh4BzKq56atEewlf7LU7abyjRwtnuY6aMX+PORVk+
	AyLimkxlnqhSlvH4zCcN+oIVS4wIGUeQPZC+FOL5Tm9CZ1wWr/dIP6PzYdahXqVYTXfx
	tmLPA70W6OfANaOnGhtFSdMRZJ+NzExj4TMOECKinPwn8qdvpNZ1V/GhR78t1F3XQfAo
	otNDjvbqEKzgYAupgXzIkKjKKDdwRANzIyOejgoWONra+GRsNJPLqhBy1ePovtqyJRpk
	voamDnWniYamOaD2BR0u3yPKUf1WsLUYMuE51cLZjtbYe01ikLUkDGND3tWXXIdvMy+C
	GsZw==
X-Gm-Message-State: ALoCoQmiQJlrGNXX/iyR+8/dVpAaGOcPsR6Nz9GRw0+LjO1y1B8urCKKExPExwAQyauj3ghqGNHu
X-Received: by 10.50.87.99 with SMTP id w3mr14980599igz.4.1412345000092;
	Fri, 03 Oct 2014 07:03:20 -0700 (PDT)
Received: from [192.168.141.122] (dsl-173-248-233-100.acanac.net.
	[173.248.233.100])
	by mx.google.com with ESMTPSA id v2sm1819487igs.11.2014.10.03.07.03.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 07:03:19 -0700 (PDT)
Message-ID: <542EACA6.8010406@linaro.org>
Date: Fri, 03 Oct 2014 10:03:18 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>	<20141001005520.GO2480@denix.org>	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>	<20141001013231.GQ2480@denix.org>	<CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>	<20141001041020.GC25706@jama>
	<1412151136.17658.10.camel@ted>	<20141001153415.GF25706@jama>
	<CC366DA2-152C-4E5C-9F9C-2BB6C1ED73B7@dominion.thruhere.net>
In-Reply-To: <CC366DA2-152C-4E5C-9F9C-2BB6C1ED73B7@dominion.thruhere.net>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Fri, 03 Oct 2014 14:03:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 10/03/14 04:24, Koen Kooi wrote:
> Op 1 okt. 2014, om 17:34 heeft Martin Jansa <martin.jansa@gmail.com> het volgende geschreven:
>
>> On Wed, Oct 01, 2014 at 09:12:16AM +0100, Richard Purdie wrote:
>>> On Wed, 2014-10-01 at 06:10 +0200, Martin Jansa wrote:
>>>> On Tue, Sep 30, 2014 at 08:55:53PM -0700, Khem Raj wrote:
>>>>> On Tue, Sep 30, 2014 at 6:32 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>>>>> On Tue, Sep 30, 2014 at 06:25:57PM -0700, Khem Raj wrote:
>>>>>>> On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>>>>>>> This line above ^^^^ has a very long trail of whitespaces and it got commited
>>>>>>>> that way, unfortunately :(
>>>>>>> Better was if you commented before it went in.
>>>>>> And how would you suggest I was supposed to see it?? Nobody saw it. My email
>>>>>> client is no different than others - it doesn't mark trailing whitespaces. The
>>>>>> reason I saw it is because I ran "git log -p" on the file and that explicitly
>>>>>> highlights trailing whitespaces in BRIGHT RED... :)
>>>>> just for that may be we should start using gerrit ;)
>>>> I'm all for it, it would make my e-mail - review - patchwork -
>>>> master-next workflow a lot easier and reliable.
>>> And I am not. Why? I've actually tried using the thing and I absolutely
>>> *despise* its interface. This isn't just a mild dislike, I simply cannot
>>> do the things I want/need to do with it.
>>>
>>> I believe I should have some kind of a say in this since it will
>>> directly affect my workflow and general life (since I spend a lot of my
>>> time dealing with this).
>>> Its appears to be very easy for other people to tell me how I should work though :(.
>> Please calm down, we just said that we like it, we're not forcing it on
>> anyone and I don't think khem would start installing it on OE servers
>> without much longer and broader discussion between all people who should
>> have some kind of say in this..
>>
>> FWIW: I despised the UI at first as well, then I got used to it (after a month
>> or so), now I really like it especially with the "New screen" UI
>> introduced IIRC in 2.8 version.
> That 'new screen' is indeed an improvement and I also found the switch to make it show a unidiff instead of side-by-side. I still despise the UI, though, but not as much as before :)

gerrit does provide a rather complete REST api:
https://gerrit-review.googlesource.com/Documentation/rest-api.html So if
someone wanted to "go wild" they could get quite a bit done just using
curl and some simple scripts.

E.g. to get the current list of changes:
$ curl -X GET -H "Accept: application/xml"
https://review.linaro.org/changes/

- to get the details of a specific change:
$ curl -X GET -H "Accept: application/xml"
https://review.linaro.org/changes/If7f0ead3471a08f7b8fe9151c6c31cdfbaef1c4f/

- to retrieve a patch as zip (converted from base64):
$ curl -X GET -H "Accept: application/xml"
https://review.linaro.org/changes/If7f0ead3471a08f7b8fe9151c6c31cdfbaef1c4f/revisions/current/patch?zip

If you need to provide credentials, use curl's "-u" option.

The communication is done with JSON, and there are some JSON cmdline
parsers available too.

