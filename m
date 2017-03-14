Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id B1EE877829
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:18:00 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id a12so20742576ota.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=WCwGp9xTZYgZEjedijWToqtJ0ZComqZ6zoFw4QYmMBI=;
	b=OszrXx3XqNHLLVq/8hd5vVwlyJA0tqfojuotD7nQxsaFxpbFE/gJ6v1tHKXUWrFoXH
	/2aBIra12Q4arEbXnXiMD9tP3bdumHyMuGxCdztt2jY2vN4wM0VwM1Soq9MKncKJDTkc
	KCLEmoXKk16RC7ETerhPCckH0BiB/mpyhlMbSxjmDGqcFpHkgPs2f5vwkSJB/5Zp99Ja
	F3qFcuK+P+G4PsdhXg42v8QJfrbVz75bNN3/IOWt8qstmwUSWY3IwOpWvjDWjeHMwkKX
	MUx8VyzXhMMHQ9VB3+oyYY8xX62BU9r5mZHK41s8KkQxwaE6rwgh9rm1POBeu4eCaPLd
	1mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=WCwGp9xTZYgZEjedijWToqtJ0ZComqZ6zoFw4QYmMBI=;
	b=WpDz2sV8DyoNQRoDLsk69jVPapak/RqlTG2Gta+eEN8KOs06hXFzsgbRmmxmwF4Arh
	bVLfBgaIPfbDI4prBx8raPZh1l3gAKDdQn1RTYAoRQBI1vcdgwX4tmS5bIRlDVUsDF0J
	f70t5J0S0azQgXvo3bKjH0UPGfQD8GIdu20GyuQwfmCLFbm43n/lCBgpZq6wXpBPPjE0
	/wqSZmkeccogLftYTIZIWP+xeE5DmKuo31bcY2Hnh/+jdk3sQ0f6kcZGi2Q2XyK63yVD
	y47juyQSiiapWppcSLyqXQH3UMwmwjR76xS5nihZcZ8o/sS5xeNv4S1YnKQlCA+OSxUq
	Ze9Q==
X-Gm-Message-State: AFeK/H1l4dhM4MO9RztmoVrPQJtIXdNY7QFb2gvjF7T1A4nshOHAUEBYssZVtuXfVeAAZg==
X-Received: by 10.157.51.50 with SMTP id f47mr22977433otc.192.1489511881814;
	Tue, 14 Mar 2017 10:18:01 -0700 (PDT)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com.
	[74.125.82.176])
	by smtp.gmail.com with ESMTPSA id 59sm9452584ota.53.2017.03.14.10.18.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 10:18:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f176.google.com with SMTP id 19so143802468oti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 10:18:00 -0700 (PDT)
X-Received: by 10.157.4.5 with SMTP id 5mr18355456otc.205.1489511880089; Tue,
	14 Mar 2017 10:18:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.26.5 with HTTP; Tue, 14 Mar 2017 10:17:59 -0700 (PDT)
In-Reply-To: <1489511640.13980.47.camel@linuxfoundation.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1489504451.13980.41.camel@linuxfoundation.org>
	<CAP9ODKp5zA3egzti=OfYD7YvpHqhE9n4YOhJagOc4rZurbA85w@mail.gmail.com>
	<1489511640.13980.47.camel@linuxfoundation.org>
Date: Tue, 14 Mar 2017 14:17:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr_wVYKauiRWu9310DJ3zPkDQ7iuMeFAiN3J7rx2q76VQ@mail.gmail.com>
Message-ID: <CAP9ODKr_wVYKauiRWu9310DJ3zPkDQ7iuMeFAiN3J7rx2q76VQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/44] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Tue, 14 Mar 2017 17:18:04 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 14, 2017 at 2:14 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-03-14 at 13:48 -0300, Otavio Salvador wrote:
>> On Tue, Mar 14, 2017 at 12:14 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> ...
>> >
>> > Despite this I merged it on the basis that I'd rather have this in
>> > pyro
>> > rather than waiting another 6 months to get this in and having to
>> > tell
>> > people we were changing soon and having to deal with any more smart
>> > issues.
>> ...
>>
>> This kind of change should have been merged in November, not less of
>> two months of release. One more time heavy changes been commited late
>> on release.
>
> In this case the patches have been talked about and in review on the
> mailing list for months so I really don't think anyone can be
> surprised. It was also a stated release objective to do something about
> smart.
>
> Also, nobody replied to the status reports where I discussed merging or
> not merging either so I could only assume nobody had opinions.

I remember Mark sending a reply with some considerations and to be
honest, I did not anticipate it was being considered such late on
release.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

