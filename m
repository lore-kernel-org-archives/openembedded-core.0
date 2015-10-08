Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id DC85776FE2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 06:29:21 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so47475365ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Oct 2015 23:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Lyd7rEKrCnnj4EdBbZi3m9/lfX+lkvcwWgslZIPJ4G0=;
	b=quKDBF9kIPil6w6LpBnNzNjMVhZecy4Kmq0APsl3DKMSZx969NwQ+WiP2fZ9rVsCix
	DcbxyhP061wKnpXhq8jKcsQL/JxxlQeS9PdSH4PtstsRoKzuDZtZCWyEEK23ytuMn0oe
	NcjUCkarOi7hocJ0MULe5NTCujkmZsT8LW4nW7yytWPTPTuHs2WuqhF98ZoA1iIhil7c
	g1NngYR3MKAb98c0b/LMzxsF0RlXG1A1Skf7jkjRAHd+iUNa5PcuRrN+U1y3DyZVAowl
	Pstp20SVq+B5dw0RCZUmD6RuuPPwAbNqStA4XmU3Hv9vwE+54INciCfzZwIIqpe39ku8
	qcIw==
MIME-Version: 1.0
X-Received: by 10.107.10.79 with SMTP id u76mr6184831ioi.99.1444285761498;
	Wed, 07 Oct 2015 23:29:21 -0700 (PDT)
Received: by 10.36.98.143 with HTTP; Wed, 7 Oct 2015 23:29:21 -0700 (PDT)
In-Reply-To: <5613BE22.7020801@linux.intel.com>
References: <5613BE22.7020801@linux.intel.com>
Date: Thu, 8 Oct 2015 08:29:21 +0200
Message-ID: <CALbNGRSS+HraVPcgV_O4gNMU9c2aTMFthgh9+1O8vQwaY5q_rQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: tomas@sleepfive.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gobject introspection to oe-core
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
X-List-Received-Date: Thu, 08 Oct 2015 06:29:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 6, 2015 at 2:27 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Hello,
>
> I'm looking into the possibility of adding gobject introspection support
> directly to oe-core for Yocto 2.1 release (Spring 2016). This work would of
> course be based on meta-gir, but with the mandatory goal of producing
> patches of sufficient quality that can be sent upstream.
>
> I know the upstream tarball is a mess that mashes together several different
> things and was never designed for cross-compiling; and meta-gir is also
> difficult to understand: autotools-based build files are patched using
> undocumented patchfiles, then again patched from the recipe using sed, with
> no comments anywhere - all that needs to be sorted.
>
> What's your take on this? Is it realistic? Would you be able to help out?
>
> Regards,
> Alexander
> --
I appreciate this very much - missing gir was a blocker many times for
me. Especially if you'd manage to turn gir to more cross friendly
state.
Regarding support: Depends on my current challenges but running tests
and reviews should be possible for me.

Andreas

