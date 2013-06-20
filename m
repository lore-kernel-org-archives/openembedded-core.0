Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id A1E016AD48;
	Thu, 20 Jun 2013 10:53:10 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz10so4900976veb.19
	for <multiple recipients>; Thu, 20 Jun 2013 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=M6ntFxpF8m6Pz4tvOOzkpmUae4jE8tENggGdmupL2+Q=;
	b=gLdSZZdOr/t2u59F6jI90fqNYMSLbfUAf6AoDuK+kCffFclAa6APSuAtPUMkju12t5
	Hf5YPYfrAhkBO/WRgBqKCtf6OCHkwdHXYIfzlq0gTzN2qNWkjQVSf4cIq9lhKnuIVE3I
	AaUYuz1uiKblX7RIw6mi9zneBXMhqGOkrwkVzemz7RTwF5ub+iShB5f+aGljThoSdZOw
	egKNhLDLqI0pkNr504DMKbbbIlqvVgOBi4mKaneYsig2kVQlCX/sqFGzpxhev9zkQvG7
	xzgisPn7lyAyS13PTj9udKAOVF7zsv+6zyhhl1drwnl9TjOpt+Q9TwWdgkHArQL1VCPR
	IeaA==
X-Received: by 10.220.98.68 with SMTP id p4mr2390364vcn.28.1371725591556; Thu,
	20 Jun 2013 03:53:11 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Thu, 20 Jun 2013 03:52:31 -0700 (PDT)
In-Reply-To: <CANyK_8f+tsurm4_5GrdiXwEkak70YAhn3t51roeRydCTx9Mbcw@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<CANyK_8eXUptxF52CmcJftYZD+oht4gfkDfRsbY3gOnmTRwyzaQ@mail.gmail.com>
	<3004132.t7dk9348rv@helios> <1886786.nfT3SfR8Pm@helios>
	<CANyK_8f+tsurm4_5GrdiXwEkak70YAhn3t51roeRydCTx9Mbcw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 20 Jun 2013 11:52:31 +0100
X-Google-Sender-Auth: Fpm0uwyKiyeg4PVFL1mJCwljAp8
Message-ID: <CANyK_8eanLYLxAv48juZ7Vr0XVdnvafxbtwr2CYk7MVQt9XcXA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Thu, 20 Jun 2013 10:53:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 June 2013 11:50, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 20 June 2013 11:25, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> On Thursday 20 June 2013 11:16:37 Paul Eggleton wrote:
>>> To be honest I think ENTERPRISE_DISTRO needs to go. It's not even clear what
>>> it should mean, and it's not consistently implemented. For things we want
>>> to be optional we have PACKAGECONFIG; for items that have licensing
>>> requirements that might be troublesome in certain deployments we have
>>> LICENSE_FLAGS, and LICENSE_FLAGS
>>
>> Sorry, that should have read "and LICENSE_FLAGS already has a mechanism to
>> prevent a recipe being built based on the current settings and report why."
>>
>
> I decided to do a quick grep. "ENTERPRISE_DISTRO" isn't found at all
> in openembedded-core, and in meta-openembedded it's just in the
> following places, after I've converted mplayer2 to using PACKAGECONFIG
> instead.
>

That got trashed by word wrapping. It's these files:

./meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
./meta-oe/recipes-multimedia/libav/libav.inc
./meta-multimedia/recipes-multimedia/vlc/vlc.inc
./meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
./meta-efl/recipes-efl/e17/enjoy_svn.bb

>
> So if we do want to get rid of this, it shouldn't be too much work.
>

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

