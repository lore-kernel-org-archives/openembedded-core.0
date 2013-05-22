Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 346C36099F;
	Wed, 22 May 2013 08:31:16 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id oz10so1251703veb.10
	for <multiple recipients>; Wed, 22 May 2013 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OacJgMfRaXrhJ9cSoVoGY8GSMrh0BReDDcJx8SP7FbM=;
	b=0pejd1FAGbVa7kMA86F6h0zViTwAQ0KeMRDe0zdJ9JaL7vNU+d3b9oOXfBdkwQRGqh
	TzbB1mjT8fxSZ+j0vmpUyFPRlROkHYzQiRp2Ja/lIdWQlq0paHgfhlK1ZYAckMKDN/M5
	2wGwXBvWc0n0FrYeYJOKfwiexHvz3Z4B5ZoPMog5854c65xryz4Od41rmaAXmfEBR8mE
	ULSqAUu9xXcD4Wn04wTjR6eM71u7EugTp0FIqh8YkNgkpTfy5NiQronBD8IbY1i3xKX6
	cH31YM5OpZKhmhTR5B8pjXp/IguR8dcBQPSSdd5CBKW8eSkZOcUgzD6ggPJygFmTey+p
	o3vg==
MIME-Version: 1.0
X-Received: by 10.220.111.133 with SMTP id s5mr2412104vcp.63.1369211476618;
	Wed, 22 May 2013 01:31:16 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Wed, 22 May 2013 01:31:16 -0700 (PDT)
In-Reply-To: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
Date: Wed, 22 May 2013 10:31:16 +0200
Message-ID: <CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Cc: tsc <tsc@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 08:31:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 21, 2013 at 9:36 PM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
> OpenEmbedded Technical Steering Committee
> 7 May 2013
>
> Attendees:
>   Koen (koen)
>   Khem (khem)
>   Fray (fray)
>   Paul (bluelightning)
>   Richard (RP)
> Apologies:
>
> Notes: Jefro
>
> Agenda at a glance:
>
> 1. pick a chair
> 2. new issues
> 3. lingering issues
> a. systemd merge unhappiness
> 4. projects in progress - status
> a. oe-classic recipe migration status
> b. oe-core release
> c. systemd into master
> d. meta-oe appends/overlayed recipes RFC
> e. 1.5 planning
> 5. infrastructure
> a. mailing list moving to YP server, in progress
> b. oe.org flooded
> 6. projects deferred
> a. raise awareness of "janitor" list, QA "bugs"
> b. document whitespace changes to the shell
> c. raise ntp with the Yocto Project [RP]
>
There are three issues I would like to comment on:

1. systemd migration:

From what I see the only major step left over is to bury meta-systemd.
The only appends found there are those for oe-core. I asked for this
long time ago [1] and support was offered but...

2. indention:
Reading between the lines there is some unhappiness on meta-oe using
four spaces for shell and python code. I personally agree with Martin
here because I have not seen a technical reason for shell requiring
tabs so far. To me this looks like a style decision which increases
the burden to submit for low-skilled people like me. Could somebody
please enlighten me: For what technical reason do we need tabs in
shell code?

3. xserver-nodm-init oe-core vs. meta-oe
This is a long lasting issue and Martin commented on why there is a
different approach in meta-oe [2]. One blocker for progress is xinput
calibrator rework. Short story: I have a solution working here which
is capable of starting calibrator by udev/systemd and can be invoked
by an unprivileged user at any time. Unfortunately this solution has
still too many issues to be submitted and from what I see now I won't
find the time to fix them in the next future. So if anybody wants to
unify xserver-nodm-init - feel free. Users can add xserver.common to
images manually (and xinput calibrator is not really working anyway).

If I could I would add an additional item on the agenda:

gtk3-migration:
In meta-gnome we are working with terribly old gnome recipes. These
needed much backporting efforts to survive glib-2.36 / gcc 4.8 updates
- and I don't think this increases code quality in any way - so it is
more or less a useless effort which we will continue.

* Are there plans for a step-by step migration? A good starter would
be to solve libnotify 2/3 API issue. Is anybody else working on this /
thinking about?
* Are there plans to update gtk3 to 3.8.x to have wayland support?

Cheers

Andreas

[1] http://lists.openembedded.org/pipermail/openembedded-core/2013-January/073596.html
[2] http://lists.openembedded.org/pipermail/openembedded-core/2013-February/075336.html

