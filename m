Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 49BE86E63E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 16:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA3G7rKh022310; Mon, 3 Nov 2014 16:07:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UzZ95x9x2d42; Mon,  3 Nov 2014 16:07:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA3G7vvu022318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 3 Nov 2014 16:07:58 GMT
Message-ID: <1415030912.5111.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Mon, 03 Nov 2014 16:08:32 +0000
In-Reply-To: <9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
	<1415016627.5111.9.camel@ted>
	<9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 16:08:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-11-03 at 16:24 +0100, Koen Kooi wrote:
> Op 3 nov. 2014, om 13:10 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Mon, 2014-11-03 at 13:06 +0100, Koen Kooi wrote:
> >>> Op 3 nov. 2014, om 12:30 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
> >>> 
> >>> 
> >>> On 3 November 2014 11:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>>> Last night I was looking at my "post-1.7" tag and the number of aarch64 patches there.   Kai, did you continue work on that staging branch for all of the aarch64 patches that were being posted?
> >>> 
> >>> What does that have to do with this patch?
> >>> 
> >>> Kai was collecting patches that were sent to oe-core, and this may have been one of them.
> >> 
> >> Is this some new requirement for OE-core patches?
> > 
> > Its someone being helpful and trying to consolidate a topic branch and
> > test things before it gets merged.
> > 
> > So its not a new requirement but it is helpful and appreciated.
> 
> It's been over a month and libpng is still broken, so I refuse to
> classify this new process as 'helpful' or as 'appreciated' at this
> point. 

Well, for the past month we've been freezing for and working toward the
release and it was agreed this batch of patches were being queued for
post release. I think that was quite clear.

As you well know, partly this is because we don't have a way to test any
of it, nor is it an officially supported target. If we get a consistent
set of code and a qemu machine that can test it, we'll be in a better
position and I believe that is something people are working towards (but
was way too late for the 1.7 cycle).

We're now in a position where we've started merging patches again, there
is a backlog being worked through and I'm sure this batch will be
presented soon. We are sticking with the stated plan which was to have a
queued branch of those patches, until such times as there is a better
plan or offer.

> If this continues can the person doing such a branch reply to patches
> intended for it saying they will or won't be queued? And please run
> the patches without such a reply through the regular process. That
> would be both helpful and appreciated.

It would be nice if the folks at Linaro would actually present things
like a branch containing theire changes and help with this work. As it
is, it seems others need to do this for them and instead they just want
to complain why we don't take patches (which often don't even seem to
build). I can understand not everyone at Linaro is going to test patches
on a couple of other arches but having someone there aggregating patches
and doing some acid tests might massively improve both their reputation
and increase the chances of patches merging in a timely fashion.

Cheers,

Richard



