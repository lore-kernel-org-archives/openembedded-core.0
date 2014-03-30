Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id E9BD36F7EB;
	Sun, 30 Mar 2014 15:56:49 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz11so7238743veb.19
	for <multiple recipients>; Sun, 30 Mar 2014 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=pNjYIhAT3NxyhzuGoZW3zJ9UAL159AK/q0CFuqYqVRw=;
	b=ZP7r0LV1DQiVuMwFfi9kU4C19m5D8ILwnvnWkCXJkkUgXycxOtgiQd3DWJDS33YM8W
	UEyJYWwJ/GUEf3pjf6NuMWe3ZrvzA1fQdmTsSolM+2lwKMISh+dR89PgaMzHKFUMUoe4
	koV/LBrwS9fGaugKq1XJjfOjufvMOoioeB7oO/ILJP7zJ85rQA4SqADIRia41oIkb6SA
	a454N4UuONyNY4ArUcNF/s/y9td5GJkHbCw/1M8CgWzRQQYHef5Blfh0/yxWgDC4ppYx
	g5YWb6YPTOWnW3lhg+tTBWUw0rs8QA16+xBTo1XQOnE0Xcfo6N4nlYNYJinHcR1EhRSE
	OI5Q==
X-Received: by 10.220.162.6 with SMTP id t6mr19045603vcx.12.1396195010188;
	Sun, 30 Mar 2014 08:56:50 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sun, 30 Mar 2014 08:56:10 -0700 (PDT)
In-Reply-To: <20140330151403.GG2428@jama>
References: <20140330013103.GD2428@jama>
	<CANyK_8ebvHy7peb9i7ttLhn4zSOXPOi=RSPGQztJHSUb_Dk3nw@mail.gmail.com>
	<20140330151403.GG2428@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 30 Mar 2014 16:56:10 +0100
X-Google-Sender-Auth: 2g3kEoUW3-6uG_irc3tOmZvmpFU
Message-ID: <CANyK_8eqY0orn9WcOLM5mxamiEtsG2aFKSH_cLHgfAy5ZP1HNg@mail.gmail.com>
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
X-List-Received-Date: Sun, 30 Mar 2014 15:56:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 March 2014 16:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Mar 30, 2014 at 03:48:09PM +0100, Paul Barker wrote:
>> - We could create a new layer for unstable recipes which are 'use at
>> your own risk'. That may be a good place for recipes which don't work
>> on the jenkins builds but do work for some people and are in use (and
>> so probably don't belong in nonworking). This is similar to the
>> meta-broken or meta-nonworking layer idea but would take slightly more
>> recipes in.
>
> The difference between meta-broken and meta-unstable from my POV is
> that, "broken" should be just temporary place and someone should
> eventually fix it, but if we move stuff to meta-unstable and stop
> testing it, then I fear that it will became just junkyard.
>
> If some recipe works fine for someone when building for arm, but
> triggers "jenkins/world" build issues for x86* then lets restrict it
> only for arm with comment which shows the error - that's better than
> moving it to "broken" or "unstable".
>

I agree with the worry that this could turn into a junkyard. The
problem is, the junk is currently mixed in with the good recipes.

>> - It may be worth taking some aggressive action in sync with the
>> upcoming oe-core release to get us to a green build, possibly by
>> throwing things into meta-nonworking and meta-unstable layers. That
>> may break a few people's builds, but the fix for them should just be
>> to add the meta-unstable layer. If they're building against the master
>> branch that should be tolerable and it won't affect anyone building
>> from a released/stable branch until the next oe-core release in 6
>> months time. Once we have a green build it'll be much easier to QA
>> patches and reject those which break the build.
>
> you mean being aggressive before or after creating the "next-release"
> branch? I would prefer to be aggressive before to have green builds in
> release branch.

That would probably make more sense.

>
>> I don't have much time to give to fixing this myself as I'm busy with
>> other projects. I do have idle computer time though so could run an
>> automated build regularly (probably just a script and a cron job
>> rather than buildbot/jenkins/etc). I won't be able to do a world build
>> for every layer for multiple machines, but I should be able to do some
>> subset. I may also be able to commandeer a spare server over the next
>> few weeks. Is there any particular config which would be beneficial to
>> build regularly?
>
> Doing "big" builds in different setups is of course useful, but right
> now I think we already have "more logs than what we're processing".
>
> So I think that building not whole world, but those recipes which are
> regularly failing would be good start, if people cannot reproduce some
> issues which are shown in my jenkins builds we should compare the builds
> and narrow possible reasons (e.g. failing only with dash, failing only
> with some PACKAGECONFIG enabled or disabled).
>
> I'm trying to stay close to distroless config, but some tweaks are
> needed in order to have bigger test coverage (e.g. enabling some
> PACKAGECONFIGs which are disabled by default, but something requires
> them, or changing P_V to newer again because something else needs it,
> enabling gold, because it's more strict so it can catch more issues..)
>
> Jenkins builds are running almost non-stop (because it usually takes
> around 24 hours per architecture), so often when I want to debug the
> issue directly on that server in WORKDIR where it failed it's already
> gone from tmpfs and the workspace is already "blocked" by next build.
>

Having a more focussed build would help but I can't really give any
ability to debug it on the machine I run builds on and I don't really
have time to debug much myself. It would literally just be a status
and a set of logs for a different config.

I think we need to prioritise what needs fixing first. I think doing a
build of meta-oe only with no PACKAGECONFIG changes, disabling
anything that requires PACKAGECONFIG changes, for qemuarm and qemux86
(and qemux86_64 if I have time) would be a good start to see what
fails in that case. Then step out to further layers once meta-oe is
green.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

