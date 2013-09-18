Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id C329A610F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 19:10:24 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id db12so5989483veb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=gKPvTUZD8OACNE9lQ3MWc9Km3o7mZ/a6XnhG7Ru+Yps=;
	b=x+ZrNSP6h5WGqCjKxwsMEf5rjlesukK+IygneJKejzswoZh6VltOWNtQh1Q3DrZZWQ
	elC1tZJzRcRYIj9pZ0ELl02yj1av6GG7J88JAYiIWMXk+7hiSAPkqtWEqTLumDwlUMw3
	jeoYU57jrhJz9M+qfqwS98So0soJrg1TQmzm5uo+XkHmgMMCSrRela1fBUWDRwmdsQC5
	y7YJfkrNl9V1LQXTSuVJhAKfDUz2hjaN9YqjPbClOjfUDAYLL+QdEv1Z84r2p5mcNbeY
	+eOmRLeWDrMQ0jV9M4yOp5hycR1DdUSa9nv5QLlm0XFb6OLk6D7AiiX/aZlD+IXQlncB
	zvoQ==
X-Received: by 10.58.12.39 with SMTP id v7mr14373veb.47.1379531425813; Wed, 18
	Sep 2013 12:10:25 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.109.72 with HTTP; Wed, 18 Sep 2013 12:09:45 -0700 (PDT)
In-Reply-To: <1379529853.4770.31.camel@x121e.pbcl.net>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com> <521264DA.8010404@windriver.com>
	<CANyK_8cSzYGQHDCeCCz7HM5yWm=Uq_fkpyr6gbYMJXPxuQxy-Q@mail.gmail.com>
	<1379520447.18603.30.camel@ted>
	<CANyK_8e6OSe8KPvJ3uSEBdNBPMwZT7EsrRTZvLUgUTdyD1_p0g@mail.gmail.com>
	<1379522909.18603.52.camel@ted>
	<CANyK_8fotVWZMkFO5kMJ_GFjGT2O79TsOWrCQV5Xez+rgdKbMg@mail.gmail.com>
	<1379529853.4770.31.camel@x121e.pbcl.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 18 Sep 2013 20:09:45 +0100
X-Google-Sender-Auth: fQMaaixF_CmgRFg1bwmNkcKIcLk
Message-ID: <CANyK_8ffTfJnD2xrKo+pVdHHq=HX3Vd6OX1kVEHxomdmBzojng@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.
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
X-List-Received-Date: Wed, 18 Sep 2013 19:10:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 September 2013 19:44, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2013-09-18 at 18:24 +0100, Paul Barker wrote:
>> I am planning on proposing that opkg explicitly
>> follow semantic versioning (http://semver.org/)
>
> I'm not entirely sure I understand what you're saying here.  Can you
> expand on what the practical effect of "following semantic versioning"
> would be?
>

I was responding to Richard's comment about flag days. Basically, they
should be very rare and will be announced very loudly if they must
occur. They will result in the major component of the version being
bumped (where the version is of the form "major.minor.patch"). So if
something works with v1.0 of a program, you can be guaranteed that any
v1.x release won't introduce backwards-incompatible changes and break
your script/library/whatever.

Even if opkg-utils is brought into opkg itself, it's a promise that
library functions, command line arguments, config options and control
fields won't disappear or change meaning arbitrarily. "Semantic
Versioning" is just a set of rules that clarify this so that I don't
have to write my own version numbering policy.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

