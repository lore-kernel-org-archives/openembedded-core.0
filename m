Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0F27732E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 17:31:47 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id c4so33835232wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 09:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NndmFO1aX3dl2+HAcRQAa96DK9xYKk9rQsuPOfVLeRE=;
	b=DAMtkco/n99RudwFfUii+TP1PudKdYBkEKoj3j0Ag4KLSlUIPPV9gHR3mRmspudux7
	reR5qVL0/MgRqz3vLNBBjI09t5V1Ak8LDQdBsLdCoKeWf6KR1LvkoiFGGrSI7xKlJTqt
	YgYJmfMnFA+AknYxUNK6FC45Y5dvDXFFiZ+zknq5m8/39s0Nul+Gba1Xd/XlOAqaiPgh
	4sGImtnfQ+4AzxJsmsvQi9TJK7eHZ5ZIwy6DzAe7Eaatw1CS16vxj1MYY4lCLvOGLFtY
	D5k6T9AR7OMP1C68AKRwXff52HThWEV2p5JDYRf6kK17ZmI4VBlOSesYtHvma93bLdR1
	oP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NndmFO1aX3dl2+HAcRQAa96DK9xYKk9rQsuPOfVLeRE=;
	b=D/O1Bh5U8JCg67zvWwXU1+IRLSrGWmBL7cDh4lBgZu/DV33ekLR9YGd2lXvkUKudfL
	j9+Vr2xEeHlMqDQ5rjfzgTXRp9wbFKTDqvg+ONRky2j7N/KI8V3xKCcYZyLaKQiqJEVg
	Gm9MJ51af8VS4VhA+D7WEuEZwOJ6ggawOQZYS2/iEqxIASLIJjci79okFmvQIG0VlaYc
	Y9x0BQrmY56rdR8CgOdpd4ur5+N5SqfNe7UljlgZ/w7/H8uhx7cLs+gmJJXJeyayEaip
	v+heaGJPamVkqregJEkyJbEgT7dU3ukZkqyjQ3hdw5Gc/u6YHCSh14aoC2U9zusB3uPZ
	WfBg==
X-Gm-Message-State: AMke39mCYflF5DwjyCQxxIsjl40RtPnshuJpcuZVtSuC67IRE0bkwSFSHf8F3Y14k+XZFjHBJKXJl3sKIb1Xew==
X-Received: by 10.223.129.196 with SMTP id 62mr7695522wra.43.1487352707680;
	Fri, 17 Feb 2017 09:31:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.52.78 with HTTP; Fri, 17 Feb 2017 09:31:27 -0800 (PST)
In-Reply-To: <CAJTo0LayVZF5CjD6r3UXZfBORY1TNn3GPUf8ZUTYwyeJdmHdEA@mail.gmail.com>
References: <20170216211957.23670-1-raj.khem@gmail.com>
	<CAJTo0LayVZF5CjD6r3UXZfBORY1TNn3GPUf8ZUTYwyeJdmHdEA@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Fri, 17 Feb 2017 18:31:27 +0100
Message-ID: <CAD4b0_J=aGp2gJHSRQdYczQ7azG-TrZc1e9ubAy5yKLK1EL84Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] qemu-native: Point python to python2 on build host
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
X-List-Received-Date: Fri, 17 Feb 2017 17:31:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 17, 2017 at 6:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 February 2017 at 21:19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On buildhosts where default python has switched to using python3
>> qemu-native fails configure like this
>
>
> What distro is this that ships python as python3?

Arch for instance:

maciek@corsair:~ ls -l /usr/bin/python
lrwxrwxrwx 1 root root 7 01-16 12:14 /usr/bin/python -> python3

-- 
Maciej Borzecki
RnDity

