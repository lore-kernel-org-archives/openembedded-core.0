Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 980ED60125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:24:06 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so18314448igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZxDO6SxYQNOEl9vqPjLh2153JY2R/F9uam24NFglnzo=;
	b=h27XibTBS4ll0jAbYWWuQN5ZqWNpOIYijUtslGoIlW4whVrSftms/HGOC1ZBUcmrx8
	vFhvMVUxrld6D50Pl7SNMRyzktjW987q6pjSP0E59Zr4i6Q4W8XUU6O6l14Ry/fEPANg
	Z1jZvTlVSu2S/rvi224bpsFHVQ8YwuvpkkkGKFndXzKh4f/+W0wcNro8+ASGVc+9DIdS
	IkubOBRfvtXjwJv8h3uawYT6wVtkGED5lcdq8IU4Kn+fHNcrNFzgxdlo2WALLvr79mtM
	zgrA8x+FQgg/g347k0f63azVWv9IWF8p9NbrOh6MfuvkDuijVz4sAH2kT7ewghjcNoLC
	JmwA==
X-Received: by 10.50.138.11 with SMTP id qm11mr4249863igb.77.1443713046657;
	Thu, 01 Oct 2015 08:24:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 08:23:37 -0700 (PDT)
In-Reply-To: <560D4B55.3090007@igalia.com>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
	<560D4B55.3090007@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 08:23:37 -0700
Message-ID: <CAMKF1srshqOaFAXfM3xjZ3kDDVXPerpQ1X4jBdm0L9-7M_aq8A@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 15:24:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 8:03 AM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> On 01/10/15 16:28, Khem Raj wrote:
>> I would also suggest to not use codenames in branches
>> but rather the numbered release. If we want to use codenames for
>> branches then lets drop the numbered release names.
>>
>
> I suggest using both (codename+release_number).
>

It would be good to have simple and revealing names like release-X.Y
or branch-point-X.Y for tags etc.
And this would also then benefit rest of projects under YP umbrella if
they were to use same release numbering.
OE is a bit unique then other distribution frameworks in regards that
the user has to interact with sources since
its source based unlike other distro's like fedora and debian-like
which are binary feed based for most of users
and a small subset deals with the build metadata repositories. So it
would help the community at large if there
was simple naming conventions.

> Ex: jethro-2.0 or 2.0-jethro
>
> (probably the later one is better as it can be sorted by release number
> easily)
>
> That way everyone has clear which release number and which codename is,
> without having to fire a browser to
> https://wiki.yoctoproject.org/wiki/Releases
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

