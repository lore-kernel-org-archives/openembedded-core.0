Return-Path: <darknighte@darknighte.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4622579FB1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 21:51:44 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id e9so3001533oti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 14:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=darknighte.com; s=darknighte;
	h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pmGL+b/7sdunbcWNrUAs0I9tniZGy6JKhlPJMhuTx7Y=;
	b=d+Y6cNUdMM6K4kOaR78AQkXg7tJFoOHhX/T97yDISeOk33sTXMnw9mwgIlePov87y0
	ep04YJHwXKghMICBO1oMwaccDybwvv6e8fzznlzQoKL/l7+f9ji/y7EBHQsA6pYD1w4R
	26+QbwyH3ST46KJpNqwdk9XLMPxsx7J5kJQHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:references:from:autocrypt:subject
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pmGL+b/7sdunbcWNrUAs0I9tniZGy6JKhlPJMhuTx7Y=;
	b=jtpNkTCPW6EIPzvz542aT8fE724F5RmdCcZzZf+xlJgWnYA+jhE96iVJV2TqTnUzo7
	deXyrvH04qCZy9AfWxc9ivn7nYhz83YqFRPI7+bsOFR5g6iDt3nKdtNg/5COtm/EtkWH
	8ilGciUJtoSaWSQtb1aWQd8Lmw0PeA2wCRftohJfBDNabgtJDpN7rwo4isfyVuXq45ct
	HIkKzVwyhGZrOe3N3xWIGAxJQwC1v50OslR5HOhAOOCRWIcl/Bbz/oMwaa9S2Dz5eLtl
	T7j4djVQLsmXggqV//DJH3mp8BmZ6s+IP9hmOptGaAKdP2hHrCu9B440YJld5JIAAXkG
	CppA==
X-Gm-Message-State: AGRZ1gIoWhHWJewa4SsIJbaj3eFQVrqo7uvZBGUGiY4h7V4pSVCEImIV
	BgoHnLjWnhC8QrGARS6zMsG2dJn3xVw=
X-Google-Smtp-Source: AJdET5cyVZ/TxDV6JHzau5J8uHnJwQf4EeqSMRMrvDPzFl/B4FFaZvwIUqmqwF80NwKivl2DswYI6A==
X-Received: by 2002:a9d:2004:: with SMTP id n4mr7553966ota.127.1541195504839; 
	Fri, 02 Nov 2018 14:51:44 -0700 (PDT)
Received: from [10.0.0.58] (47-220-180-222.pfvlcmta01.res.dyn.suddenlink.net.
	[47.220.180.222]) by smtp.gmail.com with ESMTPSA id
	2-v6sm7802703oig.17.2018.11.02.14.51.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 14:51:43 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, Trevor Woerner <twoerner@gmail.com>,
	jdmason@kudzu.us
References: <20181101140417.GA12376@linux-uys3>
	<CAPoiz9y_prstnR5dsxHNwSk81ShLmkybEXySEESTgZrpgKXMcA@mail.gmail.com>
	<CAHUNapRrWkAGahwLgEzfbPSi2UhQCTqMSGQOAEp2Dxpi3MwRPA@mail.gmail.com>
	<56f451cb-f059-d8bb-aae7-aca4c6bdf1a6@gmail.com>
From: Sean Hudson <darknighte@darknighte.com>
Autocrypt: addr=darknighte@darknighte.com; prefer-encrypt=mutual; keydata=
	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
	i7Kf
Message-ID: <c0ffc639-e586-7721-d61c-fa535e70b8da@darknighte.com>
Date: Fri, 2 Nov 2018 16:51:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <56f451cb-f059-d8bb-aae7-aca4c6bdf1a6@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	yocto-advocacy@yoctoproject.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OEDAM @ SCaLE 2019
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
X-List-Received-Date: Fri, 02 Nov 2018 21:51:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/2/18 10:57 AM, akuster808 wrote:
> Morning Trevor,
> 
> On 11/1/18 7:27 PM, Trevor Woerner wrote:
>> Hi Jon,
>>
>> On Thu, Nov 1, 2018 at 3:56 PM Jon Mason <jdmason@kudzu.us
>> <mailto:jdmason@kudzu.us>> wrote:
>>
>>     I am planning on being at SCaLE (assuming the OEDEM happens there).
>>
>>     Many corporate travel budgets are tied to presenting at conferences.
>>     So, if we could somehow get a track there (which might be too late in
>>     the game to do now), then we might be able to get enough people
>>     present to make it happen and pull in others whose budget is more
>>     flexible.
>>
>>
>> As it turns out, I'll be organising the YP/OE Miniconf that will most
>> likely be run on the Sunday. I was going to send out a separate email
>> discussing the Miniconf, but I guess now is as good a time as any :-)
> 
> 
> I would like a some clarification. As fas as the OE Board knows, we had
> one room available on Sunday. Is this the same room or did you find some
> other space at the venue? I am a bit confused about the messaging. The
> subject and Jon's statement are all about OEDaM but your addition to
> this tread is about a Miniconf. Is the Miniconf a separate thing?
> 
>>
>> While it's true that the CFP has closed for SCaLE, I plan to open my
>> own CFP specifically for the Miniconf, and I don't plan to close it
>> until closer to the conference itself. I want to encourage people to
>> give talks about current things, as such, having a CFP close this
>> early wouldn't do.
>>
>> We haven't decided on a format for the Miniconf, exactly, if we have
>> traditional talks, we'll have 6 sessions (2 before lunch, 4 after).
>> But depending on interest and what sort of proposals we get, we might
>> do some longer, some shorter talks.
> 
> 
> May I ask who "We" are? AFAIK, Behan and Tom are doing a *-ale tracks at
> Scale.
> 
> 


Trevor,

  The OpenEmbedded board had a quick discussion and would like to share
a few things.
  First, the board fully supports any OpenEmbedded member organizing
community events.
  Second, thank you for stepping up to organize such an event.  We
greatly appreciate it and will support you as best we can.

  Third, the desire for user-centric events or a separate conference
entirely has been discussed at several of the recent developer meetings,
while at the same time, we've seen a growing number of users attending
these meetings "just to observe".  It sounds like the event that you are
starting to organize at SCaLE presents the perfect opportunity to start
creating such a user-centric meeting.

 Lastly, as was brought up at the meeting in Edinburgh, this is all
occurring *very* late for conference planning, which adds greatly to
everyone's stress and angst.

  With that said, the board does have a concern, a request, and a
suggestion. (triple threat!)

  The concern arises from the history associated with the OEDEM and
OEDAM names/meetings.  Specifically, we are concerned about possible
confusion that may arise from overusing those terms.  FWIW, members
expressed this at the last several developer meetings publicly and have
also expressed reservations to board members privately. For many,
employers will only pay for them to go to a single "meeting" a year.
This means we need to make it easy for users, developers, and their
employers to know what type of meeting is being held.

  So, we request that you call the event that you are organizing an
OpenEmbedded User Summit, or something similar.  We think this will help
clarify things and it also preserves the use of the "official",
OpenEmbedded Developer Meetings terms, e.g. OEDEM or OEDAM, for the OE
developers.

  Recognizing that we are scrambling to get things organized at the last
minute, we further suggest that we put together a quick verbal
discussion with all the necessary folks present.  ATM, that appears to
be you, Tom K, Behan, and the OE board.

-- 
Sean

