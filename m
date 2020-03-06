Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 11BCC61AE7;
	Fri,  6 Mar 2020 10:04:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Yjrm17znz4c;
	Fri,  6 Mar 2020 11:04:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583489064;
	bh=9tYWKghfykNyfyzzi54gGTvZth8ziskt6fZeet+YVr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8TaBV+AvKox6HpOTOZkL+YUyyojZYsYGq1fl8DBzVkpwsXtupTeJ6mL1v0IlQiEV
	WnxaRHQltsXLVZiiYFzExBhYN9yq1IMpL2u2EJABaVQl23OUfu3E9wX0FTn64rgsTw
	y65O0B3ZoCoPYHUZWQzBbSLtvGELdHjzgpGBaF/x3L27vNu+bzjyAQNvGJ+91hmQi1
	U51LO33jbZXJMf9T6PTHUDNejv8cXCQEpClu64wz6YuMf6lH//e2A2bGgynb8m3U1W
	a0PJuiL37u/DcoS3cZ307M1v4fbKALR11US4zcVKyHXGm8qKl5A/bzHddpoMRfCkOz
	tASVIdqDV2ZDwL4fCtddWW2jqG+AtokuiXpuieA4sA9Ac4LwPML2qUift9bK5f3h+9
	ZbJdpH9CC1A8afpLE+zjYl8feci21VoWZU/9CmNv0PAnWc8ikT1/4SeKkNYuY6Df2J
	P+6jnimphFoREUarfOXXq41do6dNfNavZpezPElBUsQULaHOy7I2eVlCTwb/qJ0GwR
	UatBBw+4ge0O3lNmlgvAiPH8BHmsQNJ8FcOBhfTRv+77w9bFGvGXo/zU9JWc2KYvv9
	RDs6i2lLeERI4eZApSteJBIJkgUT0qAwj+47V7QBu7UWbeijxmnMisWVvZqI1qfwxr
	FbRf3aWjCfAcGR5awZTDKGIQ=
Date: Fri, 6 Mar 2020 12:04:22 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20200306100422.GA17785@localhost>
References: <20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
MIME-Version: 1.0
In-Reply-To: <01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-architecture@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Fri, 06 Mar 2020 10:04:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 04, 2020 at 12:26:29PM -0800, akuster808 wrote:
...
> On 3/4/20 9:24 AM, Adrian Bunk wrote:
...
> > This could be combined with a call for help for security support,
> > an advantage of being honest would be that it becomes visible for
> > users that there is a resource shortage.
> There are weekly status reports  and minutes from various meeting that
> include the attendees list.  The attendees list has not grown. The build
> swat team was shut down as no one stepped up to help. That was an
> opportunity for the community to step up.

Yocto is setup as a B2B project providing a basis for embedded products,
your "community" are mainly companies.

The "build everything yourself" niche for non-embedded is already
occupied by Gentoo.

For most community companies there is no clear Return on Investment
if they would use the opportunity to invest in upstream involvement.

> There is request for help regarding defects sent out every week and if
> it wasn't for WindRiver, Intel, Joshua Watt and Richard the open defects
> would go uncheck.
>
> So the resource issue has been floating around on the various mailing
> lists for some time. What do you think needs to be done to make it even
> more visible?
>...

You are confusing developers with users.

Developers are following development discussions.

Users who are being paid for building a product based on Yocto
read the user information at https://www.yoctoproject.org/
especially the great manuals written by Scott.

Development discussions are mostly irrelevant for users.

To make a non-Yocto example:
I am using Ubuntu LTS on my laptop.
The security support provided by Canonical is essential for me,
and as part of the community I am using their bugtracker in rare
cases where I have problems.
I have neither time nor interest in following upstream discussions
regarding development of future Ubuntu releases.

>...
> >> The liability for insecure millions of devices does not lie
> >> with the yocto project, it lies with the OEMs.
> >> ...
> > The liability for insecure millions of devices lies 100% with the Yocto 
> > Project if it claims to provide security support but does not actually 
> > provide it.
> >
> > If a user has to decide today whether an upcoming product will run
> > Ubuntu 20.04 LTS or Yocto 3.1 LTS, then it should be clear to the
> > user whether or not choosing Yocto will provide upstream security 
> > support the same way as Ubuntu.
> >
> > A user reading the YP LTS announcement expects security support similar 
> > to what Ubuntu is offering, and might only notice that this isn't true 
> > after a known vulnerability gets exploited on millions of devices.
> I didn't get that out of the announcement. It only reference in the LTS
> announcement  regarding Security was in context to Community support.
>...

The wording is "releases move to community support, which means they 
only receive occasional patches for critical defects and updates,
and no regular defect fixes and security updates".

When the move to community support means no regular security updates,
this is a clear claim from YP that before the move there are regular
security updates.

YP then claims for LTS that "These components will now receive the usual 
defect fixes and updates for the extended period of two years."

When YP states "A very important criterion for evaluating and adopting
a software platform is support." the one kind of support that really 
matters for users of long term support releases is security support.
This is the baseline users expect from anything called LTS,
and the main reason why users want to use LTS releases.

If YP does not want to be responsible for insecure millions of devices,
it is up to YP to not make incorrect claims and make it clear in
announcements and user documentation if security support is not
provided by YP.

This allows users to mitigate by allocating resources for security
support of their products, instead of unknowingly shipping millions
of insecure devices.

It would also allow YP to develop offers for community companies to pool 
smaller contributions together - 50 companies each paying 2k per year 
for pooled security support is cheaper for them than each of them 
locally providing the same security support.

cu
Adrian

