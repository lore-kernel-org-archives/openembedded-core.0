Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4176E671
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 13:30:15 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id r85so736770ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=dqDq0KMHWLQJPGQKGimX/TGm66eoDsMl7kbLwnRqShI=;
	b=Iv29E+gWlE09Fna7at81G5IJ2QEEvUimGqGAdh3rIMLt3tAl8rstCmk+AWrDWzoI2W
	zuSV43gGntekB3w3PwsolSQyF8xaCS9IOnEsjJgI48F2S1VFDx3v8UQ99gaffZkhuBUe
	jAphmzP8677DieVhzQw1rTz8T7+01AOqFQR0lI01w6Mv7ehW8fO8kTzvSoQGu5g0nrqa
	kg5KgIIgPFqNU1mOjLL7eVWFsetbesJPO6piqBCm+CoWPDRK11I2J1+zlA9Hktc3e/PP
	WbARy6L2ZSr1WTIe4gfn6tlNJIgQEMRUjVNOny3A3WjEA/YTtxunAHBYFYltIuYlCGTV
	DOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=dqDq0KMHWLQJPGQKGimX/TGm66eoDsMl7kbLwnRqShI=;
	b=gyNkpItZWn1xDRFQC7tCdZZIlDaWr6XzzKbu71TA3KajgF/s9P01/xewkRrP2PgMw9
	1JQAP0BE6Zgh/rU559LRZ4IdAeomcjd7Qu/O3u5OUJmAubVOI8cD76J2purhqADbopyl
	+pJUh6oyh+9kuXEg8vLUeIK1kin/sQajBbMbDUu+i6hlqzrOHVn4vwowSLVURncbMZ5W
	hfMxkEDhoN0V6RCBHgKq2qokOu4EYQ11T6yHOwcymzWeWiX8LBtBkvinD1HOkgUw/d7I
	Ab3fH+y1o8q3EF4ur/c/8MZ8/ezQ9++eShJ9WXFj2OLj7m68qFx130OCBszRsKJfYvC6
	DRdA==
X-Gm-Message-State: AHPjjUhViI1xjxRO/FRobzbN3bOfE9tGxh4Hl59BlwVZqAMWEENsBGq+
	5cGNtlRpdQvyeQNatBp3LzhBGdnA
X-Received: by 10.129.172.25 with SMTP id k25mr3707888ywh.299.1506087016919;
	Fri, 22 Sep 2017 06:30:16 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174]) by smtp.gmail.com with ESMTPSA id
	t185sm1466402ywa.17.2017.09.22.06.30.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 06:30:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f174.google.com with SMTP id e189so3048400ioa.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 06:30:15 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD0z3SR8ZCc/3+GyvSgca+LuGzky0W6vJrmguUVxwHLXdZNBYjKIewmagYZR5iTbugOQzsD+YrNCYle4UBekLk=
X-Received: by 10.202.199.129 with SMTP id x123mr6428186oif.67.1506087014609; 
	Fri, 22 Sep 2017 06:30:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Fri, 22 Sep 2017 06:30:13 -0700 (PDT)
In-Reply-To: <1506062580.18640.184.camel@linuxfoundation.org>
References: <20170921140819.21292-1-otavio@ossystems.com.br>
	<1506033277.18640.172.camel@linuxfoundation.org>
	<CAP9ODKphgL7Dndk8PcpLnE0me_O9AyMhYkjhYbE_HCM+sYMNZg@mail.gmail.com>
	<1506062580.18640.184.camel@linuxfoundation.org>
Date: Fri, 22 Sep 2017 10:30:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpkHYzTsHTH3=s454ngWyxsJ+R0Zh=jr8_pGwigC6F4Bw@mail.gmail.com>
Message-ID: <CAP9ODKpkHYzTsHTH3=s454ngWyxsJ+R0Zh=jr8_pGwigC6F4Bw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: Upgrade to 17.2.1 release
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
X-List-Received-Date: Fri, 22 Sep 2017 13:30:16 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Fri, Sep 22, 2017 at 3:43 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2017-09-21 at 21:43 -0300, Otavio Salvador wrote:
>> On Thu, Sep 21, 2017 at 7:34 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Thu, 2017-09-21 at 11:08 -0300, Otavio Salvador wrote:
>> > >
>> > > Upgrade to a new stable release and drop patches applied on
>> > > upstream.
>> > >
>> > > For a full release notes, please see:
>> > > https://mesa3d.org/relnotes/17.2.0.html
>> > > https://mesa3d.org/relnotes/17.2.1.html
>> > >
>> > > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> > > ---
>> > >
>> > > Changes in v2:
>> > >  - update to 17.2.1
>> > The trouble is this isn't just a "stable release", I didn't check
>> > the
>> > patch fully enough initially but now I see this was a 17.1.X ->
>> > 17.2.X
>> > change.
>> The commit log mentions the two release notes. The 17.1 is at 17.1.9
>> release but should not receive more fixes. It is advised to move to
>> 17.2.1 as it is the current release but it is up to you if we will
>> take this one or 17.1.9.
>
> Its not clear from the commit message that we're on 17.1.7, that 17.1.9
> (and maybe .8?) exist and that in going to 17.2.X, we're actually
> changing stable series. Release notes for 17.1.X are not mentioned.

17.2.0 implies it is a major release, does not?

...
>> That's the reason for autobuilder, right? I do not spawn all
>> configurations here as I don't own such build monster ...
>
> The autobuilder is a last final sanity check so we can test the
> proposed changes, Ross and I are not here just to queue and test and
> report back on people's patches.
>
> In this case *any* poky build of mesa is failing. That is likely
> because poky has wayland in distro features and your local
> configuration does not.

Possibly.

In fact I was testing for an i.MX machine and as it mangles the
PACKAGECONFIG the test was not showing your error, even with wayland
enabled.

>> > If people want us to be more flexible about taking "point version"
>> > changes later into the release cycle, we really need to start
>> > getting
>> > better about how these things get tested and how we refer to them
>> > in
>> > the commit messages.
>> See the commit log above. You are frustrated, and I get that, but
>> commit log mentions BOTH!
>
> The commit message implies we're upgrading along a stable release path.
> Now, I agree had I thought more carefully I'd have realised that to
> mention release notes of a .0, we must not be. You do call it a stable
> update though and it really isn't.
>
>> > [and yes, the fix is trivial and included below, that isn't really
>> > the
>> > point though]
>> Do you want a v3? or a 17.1.9? Let me know what I can help.
>
> I left it building locally overnight and the first fix I mentioned
> isn't enough, it eventually fails with:
>
> | make[4]: *** No rule to make target '/usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml', needed by 'drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h'.  Stop.
>
> so a v3 would need to figure out and fix that. Who knows what else
> might then fail. I suspect we might have more success with 17.1.9 but
> it sounds like I'll be the one who you want to test this...

I am preparing a v3 and testing with wayland and x11 enabled. Once it
works fine I send it out.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

