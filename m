Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 42ECF6AB50;
	Sun, 30 Mar 2014 14:48:49 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so7394373vcb.26
	for <multiple recipients>; Sun, 30 Mar 2014 07:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ZzHumcDZqlpnZKTHQ+jNmIMVOyp9U7mfo17ipu+LG6k=;
	b=pRtRoTJ/uxQjT/A5VXJ5Xjk0Ip5g0UQ4oHjIvtfVPGbUbdoRNkliX5rlGHQQu955C1
	5ODAUIIyWEJyhvQhYrqQpcNCjoFPfBwLm+T1XNPje++rE9unAYIDjXLDTvIf60HI1cRw
	t46yHjqO8ch4xxCYO2TV8pKHp8MNJEm8WRk2sA2DU45Efwps2hwjHcDLGCd5R0cqPxTn
	MFHwalY/SKssWmqXMaMb1Irkyy9d4LucyLV3YVEQL2OzNdW70viRkDbeunYA7yoEiG92
	ob0Xkr3yNT0ABVWItC/+jNGZAaXZH7gf00YXF6l1yoEDdCSg1KKWyzErzGGQB9NTXm/z
	/Ipg==
X-Received: by 10.221.34.7 with SMTP id sq7mr18512304vcb.5.1396190930282; Sun,
	30 Mar 2014 07:48:50 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sun, 30 Mar 2014 07:48:09 -0700 (PDT)
In-Reply-To: <20140330013103.GD2428@jama>
References: <20140330013103.GD2428@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 30 Mar 2014 15:48:09 +0100
X-Google-Sender-Auth: 7sVz4UsZo4t9FzGWc8ID2PFy0NY
Message-ID: <CANyK_8ebvHy7peb9i7ttLhn4zSOXPOi=RSPGQztJHSUb_Dk3nw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Quality of meta-oe metadata
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
X-List-Received-Date: Sun, 30 Mar 2014 14:48:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 March 2014 02:31, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi, sorry for longer e-mail, this is one of topic I would like to discuss
> on OEDAM (http://openembedded.org/wiki/OEDAM), but having some feedback and
> thoughts in advance will be very useful.
>
> As people can notice from my "State of bitbake world" e-mails or
> http://www.openembedded.org/wiki/Bitbake_World_Status
> we never had "green" builds. There are always 20+ failed tasks in those
> big builds and just reading the numbers isn't good indicator of quality,
> because sooner you break something in dependency tree, fewer recipes will
> be actually tested, so fewer failed tasks often means that something
> important is broken.
>
> There are IMHO at least 3 reasons for this depressing state:
>
> 1) Nobody is paid/dedicated to fix them, there is no company behind meta-oe
>    layers, now SWAT team, not even dedicated maintainers to which I could send
>    error from latest build and ask them to fix it before the end of
>    week/month.
>
>    Kudos to people who are sometimes sending patches for such issues!
>
> 2) There are a lot of changes and component upgrades in oe-core which
>    sometimes aren't very straight-forward to adapt to and issues stay in
>    meta-oe for months.
>
>    I don't mean it's oe-core fault or that changes to oe-core should slow
>    down just because meta-oe, especially when we cannot guarantee when it
>    will be prepared for them (because of 1)).
>
>    oe-core is trying to track latest stable versions, but meta-oe often
>    contains very old versions and people upgrade to latest stable only the
>    recipes they really care about, so it's not so surprising that 2 year old
>    version of something isn't compatible with latest greatest freetype or
>    some library like that.
>
> 3) OE releases work great and don't invalidate sstate signatures so often, so my
>    feeling is that most developers and projects are just using releases and
>    less and less people do CI. People will start complaining that something
>    is broken in meta-oe only when they are upgrading their project from 1.5 to
>    1.6 when 1.6 is released and that could be too late for fixing meta-oe
>    issues.
>
> What I'm trying to do with it:
>
> a) sending those e-mails and updating wiki, so that people can easily find
>    if some build failure is common or something which happens only for them
>    (something like oestats-client.bbclass page was providing in oe-classic)
>    It also includes log of QA issues which are usually easy to fix and great
>    way for new people to learn something about OE.
> b) trying to refuse all patches which cause new world issue (or new QA
>    warn/err) - sometimes missed in logs, because it's often "hidden" by some
>    other issue and hard to compare 40 issues from previous build with 38
>    from current.
>    Also the issues are often triggered later by changes somewhere else...
> c) fixing build/qa issues in recipes I've never used or don't even have
>    hardware to test - just based on assumption that something which builds
>    is better than broken build, even when it can have some issues in runtime.
> d) contacting people who added the recipe which is now failing, often
>    without reply for months even when I try it multiple times :/
> e) moving to "nonworking" directory to mark it as "known-to-be-broken",
>    last resort for recipes where the fix is complicated and it's not known
>    if someone is actually using it (because it was broken for months and
>    nobody replied).
>    + easy to find them, because they are still in repository (instead of
>      git rm + revert when someone fixes it)
>    - layer index probably doesn't find them, because "nonworking" directory
>      level isn't in BBFILES, so maybe meta-broken or meta-nonworking would be
>      better
>    ? some recipes are "broken" just because their dependency is broken, what
>      to do with such recipe, I usually just say that in commit message when
>      I'm moving them to "nonworking" with their broken dep.
>
> What can we do better? How to motivate more people to do CI and send fixes?
> When we get to "green" state it will be easier to quickly spot new issues and
> easier to fix them, because it will be clear what's causing them.
>

Are you discussing meta-oe alone here or all layers in meta-openembedded?

I've got a few ideas thinking slightly outside the box, so these may
or may not be workable:

- It might help to try to split the layers down further and reduce the
size of meta-oe (for example, create a meta-python layer for all the
python libraries that aren't direct dependencies of something
non-python in meta-oe) and then try get new maintainers for these
sub-layers so that the workload is spread better.

- We could create a new layer for unstable recipes which are 'use at
your own risk'. That may be a good place for recipes which don't work
on the jenkins builds but do work for some people and are in use (and
so probably don't belong in nonworking). This is similar to the
meta-broken or meta-nonworking layer idea but would take slightly more
recipes in.

- It may be worth taking some aggressive action in sync with the
upcoming oe-core release to get us to a green build, possibly by
throwing things into meta-nonworking and meta-unstable layers. That
may break a few people's builds, but the fix for them should just be
to add the meta-unstable layer. If they're building against the master
branch that should be tolerable and it won't affect anyone building
from a released/stable branch until the next oe-core release in 6
months time. Once we have a green build it'll be much easier to QA
patches and reject those which break the build.

I don't have much time to give to fixing this myself as I'm busy with
other projects. I do have idle computer time though so could run an
automated build regularly (probably just a script and a cron job
rather than buildbot/jenkins/etc). I won't be able to do a world build
for every layer for multiple machines, but I should be able to do some
subset. I may also be able to commandeer a spare server over the next
few weeks. Is there any particular config which would be beneficial to
build regularly?

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

