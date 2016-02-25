Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4E302772F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 20:10:00 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fl4so37529940pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=51gA2b3/9lnX8YleEP5CMUfOWT6hxno+bD892CRljHQ=;
	b=tnWd3KkbCPLEhjKKw36XFgylQjIq1g/Z4SxT3Vime4FcaCq6yMHfhpCQbGw0RAJcSL
	Bfe3IiBuDi5iO8lN74g77zm4dhOx4toC36QRT/ETATKLJ7RHKeoth7Sm95BRosQfSSIY
	6DUlnR7Dhnr7tWNiZSL3mrekAkl7yVOjU0qT8gG3eKNd/L1hr5AWHn7X0RLFYtVNCzJC
	gNEw2QkuEEDDJ8H0eGpjxDdIRDTI20wnQtPzmtiqcH4Ao2MJ378O1wpsbtcsDSrCrViU
	TiQ6l5mD56DcHmtIOiSivWtqvL56PqxkHAwW3+7K+loK4iTyezZVp0vy084c2l26zJUg
	VtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=51gA2b3/9lnX8YleEP5CMUfOWT6hxno+bD892CRljHQ=;
	b=d6cvYHVKXXbDiL68cQiV/eeuEeK+gMzV0TUf+nFQoVrhVFRnUYsJSSBjr8KiqbcbqK
	WLcS6JWIclPT0/Y/qfnjVKNHPO6GiyCa5h9B3lb6auO22U3WG/ZHXhfWzmOViEccDQdY
	0tcBi+HTEx2Ag4nlYPhHc/mSuNMDzLj8ujYknDFW6jFOdYWaZ9s8LnD0QaXNMl867t6O
	GLvZd+uoApPgkobkf9IBoyhPUQUDHuqel6IW6nH2QRfRlu6VrTzIa3GamvXARjkRuYrZ
	Jyn/YxIzpCdf4Su3mias32tedFZivcMafF6iABFZUqg1TlZBtJ391l+gXvgRvL/J4HGk
	xF6A==
X-Gm-Message-State: AG10YOQDr8z4kgTwmZLydcYcRXIwhPobPmCGsJISeoxKEfWWmPwrESztL9C6xKMSipXAnw==
X-Received: by 10.66.145.194 with SMTP id sw2mr65063997pab.69.1456431000899;
	Thu, 25 Feb 2016 12:10:00 -0800 (PST)
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com.
	[209.85.220.53]) by smtp.gmail.com with ESMTPSA id
	n28sm14099357pfa.45.2016.02.25.12.09.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 12:09:59 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f53.google.com with SMTP id fl4so37529513pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:09:59 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.121.10 with SMTP id lg10mr65488027pab.59.1456430998842;
	Thu, 25 Feb 2016 12:09:58 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Thu, 25 Feb 2016 12:09:58 -0800 (PST)
In-Reply-To: <CAJ86T=UvGuB4ndSvJc9FPkEw56HK4NUw2A9iGJotBqk7FfoJOg@mail.gmail.com>
References: <CAP9ODKqeD1qZe+Gf-LQoVbmAZrkGVgGDYFgQFGkniaiwTh25sQ@mail.gmail.com>
	<CAJ86T=UvGuB4ndSvJc9FPkEw56HK4NUw2A9iGJotBqk7FfoJOg@mail.gmail.com>
Date: Thu, 25 Feb 2016 17:09:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqsktPQLesFdNbg7it-b81rANpx+16iNjEfqKaRMLzwZA@mail.gmail.com>
Message-ID: <CAP9ODKqsktPQLesFdNbg7it-b81rANpx+16iNjEfqKaRMLzwZA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: busybox not buildable when using armv7ahfb-neon tune
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
X-List-Received-Date: Thu, 25 Feb 2016 20:10:00 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 25, 2016 at 5:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Feb 25, 2016 at 11:59 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> Hello folks,
>>
>> When building a target, with Big Endian enabled, busybox is failing to build.
>>
>> I reproduced the error with Jethro and master.
>>
>> Here goes a simplified log:
>>
>> http://termbin.com/1c8p
>>
>> Could someone shed a light on this?
>
> I don't see any errors in the log?

Oh my, I need another coffee. Here it goes:

http://termbin.com/28dx


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

