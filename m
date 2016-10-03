Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id F0F54606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 17:17:20 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id r126so207138916oib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=VWanUlOTVUuUK6ORbphbmBbbRGxHpjBXzqze2kT0h7Q=;
	b=zrdoGZ0D4t/IJTI5F0p0JRDhGbPzgaHs25S8XkKR6jwJyNwEo91YouveB3KhB1JlxS
	JyKyvYrI2e/FhoOWwRMQccngyodQXG21NuCeiDo3vru7ujdUmmbQD7hYxQT3eeNYG1fL
	CkEEWW/HnCLDH8t/GvIxaS6tv75xUHrdPwzl7pJQCr+Aeadx4K7CvDeRE1Q5HQ9R9KKK
	0iVfBGbotoPmE/wi5ppaO7VlHzmZA/SqMr8FyFkVRwtMs49IBgksSq+WXLV0AKCxsk4u
	ZwiR2yp+tHhBoi31J6qV9FHImMKLbE+L+IQQBu3FVeRoMI9XfZoPGPhVDzGdTR8DFvCA
	WnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=VWanUlOTVUuUK6ORbphbmBbbRGxHpjBXzqze2kT0h7Q=;
	b=Tlq1i4PRWeB3nc2q+ndufNxwK1HME0J+5YKmwD5qYwGuKoH0CcyvZpwcNBU/yboXz/
	bsvsNIgkS0uCbl+HGTV6LSZzAV0GQWwYm+XFPNNlMLLrPxH4Rw+DGVJjoY1wrN7fI3ra
	AhBBhdJ7djlIcEqzgF8/tAaPqD6wNgYVD/eqTOcULZDPXNtqhxbSgbtuYTagq/vsyz4E
	VwPH/LpwITSNVavJGJzRoz87StiuWfjmeMC+EyTe3E9zfLH+WjreIctlr3u9wp6hbiil
	GB0TOiC4yKjlTzNfeTtmBw9NVRFqoN/AOvi5dragmonecL9sIH6ggfS6iYSR1ZsrckSH
	Rl0Q==
X-Gm-Message-State: AA6/9RmN5Ec+mkw//A0eo/bxaRMiApWWLWP3/cdOA1B9Zmth7RG2qRCjk2X+rmODJQKclLCMLyHvImbUjrUD5g==
X-Received: by 10.157.48.77 with SMTP id w13mr14494460otd.204.1475515041587;
	Mon, 03 Oct 2016 10:17:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.119.229 with HTTP; Mon, 3 Oct 2016 10:17:21 -0700 (PDT)
In-Reply-To: <1724648.cX3L07qpO2@peggleto-mobl.ger.corp.intel.com>
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
	<1473976307.7207.151.camel@linuxfoundation.org>
	<1517439.eAOeRX8ZQL@peggleto-mobl.ger.corp.intel.com>
	<1724648.cX3L07qpO2@peggleto-mobl.ger.corp.intel.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Mon, 3 Oct 2016 10:17:21 -0700
Message-ID: <CAOLEWZVcxGsVANZnk08mxXBJi6A9ChzzOzA=vu7+AnGzYaBbAw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Crazy display
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
X-List-Received-Date: Mon, 03 Oct 2016 17:17:21 -0000
Content-Type: text/plain; charset=UTF-8

I do mostly remote screen sessions (on gentoo host, sometimes
ubuntu/debian vm) and occasional local terminal (xfce term but remote
could be console only).  The fact that I have not seen this once is
just *weird* (and I'm pretty damn good about hitting the annoying
bits).

Steve

On Mon, Oct 3, 2016 at 10:05 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Fri, 16 Sep 2016 10:00:12 Paul Eggleton wrote:
>> On Thu, 15 Sep 2016 22:51:47 Richard Purdie wrote:
>> > On Fri, 2016-09-16 at 08:41 +1200, Paul Eggleton wrote:
>> > > On Thu, 15 Sep 2016 22:26:09 Gary Thomas wrote:
>> > > > On 2016-09-15 22:12, Burton, Ross wrote:
>> > > > > On 15 September 2016 at 21:03, Paul Eggleton
>> > >
>> > > <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>
>> > >
>> > > > wrote:
>> > > > >     Are you guys perhaps using the same terminal application?
>> > > > >
>> > > > > Using screen
>> > > > >
>> > > > >     / tmux / anything similar? (I'm using screen here and haven't
>> > > > >     experienced problems though.)
>> > > > >
>> > > > > I'm using iTerm2 on a Mac to run normal SSH to my Linux box. No
>> > > > > screen/tmux/etc.
>> > > >
>> > > > Pretty much the same for me - just SSH in an xterm window.
>> > >
>> > > Hmm, I'm still no closer then.
>> > >
>> > > Does it just start happening at some point in the middle of a build?
>> > > Or right
>> > > from the start?
>> >
>> > Seems to happen at various points during the build. Looks like bad
>> > timing of console updates so can happen at any point, I'd see evidence
>> > its happened multiple times in a given build.
>>
>> This is bizarre. Clearly something is different between your systems and
>> mine :/
>
> I just wanted to check particularly with Gary and Ross - since the following
> pseudo fix went in, are you still seeing this problem?
>
>  http://cgit.openembedded.org/openembedded-core/commit/?id=efd0b0f604f9f498b9c20bc9a25708c493aa4f4a
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

