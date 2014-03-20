Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id DB67D6B1FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 00:45:59 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id uq10so13331978igb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 17:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Bd+cRmFjUxUAPCzZNAqWQkKk1L/53LPxPwLVSAYMKqI=;
	b=urtCYhP9PdW4z8Er8oU7+ZGBYutlvriumnuOjGfcFlr6TsX5B4a9QceAfkabW/uboH
	QpTHF+g0aH8Kb5TlVyLQIqoiSGTdbgSY/755vsVsYzBPlA6Qt2XslOtaDycZ1D7B/A6x
	UzrW4a/pz8biao3vM2uZ1j9aqbVuOfNO/CMI97EmU1X4YqG8LgOhCGMFLRHUwLY0dys0
	NLxxdZc83buAxLhhZkFpa5t8KBIthfnjPZXpcv5MwdxMxWiAImz51W/PGsWevD1cYNB/
	HV5qapjPPDWSHSWcg1lc9TNHq2dP69fRWPzH/gcfP2UcYf8YWzbHrRFg6Xeks3b91emt
	Vr2Q==
X-Received: by 10.50.49.76 with SMTP id s12mr18169973ign.2.1395276360198; Wed,
	19 Mar 2014 17:46:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Wed, 19 Mar 2014 17:45:30 -0700 (PDT)
In-Reply-To: <532A36F3.2090800@mlbassoc.com>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
	<1395147366.3808.70.camel@ted>
	<CAP9ODKqhnScZ+__098Q7OS53WrkkASfrfSxdkGt3OeozZ=2yJA@mail.gmail.com>
	<532A36F3.2090800@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2014 17:45:30 -0700
Message-ID: <CAMKF1spcWtVah6-F6AQaSs72Cmyrke-5+JrdmR5s7AA6QCuDJA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Thu, 20 Mar 2014 00:46:02 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 19, 2014 at 5:31 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>
> What are you afraid of?  Putting this in OE-core _may_ make sense
> if it serves a larger community, but having it there will not be
> destabilizing, so why not?

We should always strive towards making OE-Core leaner, therefore we
should evaluate the real common usecase. which means there must be a
good justification to add it there

