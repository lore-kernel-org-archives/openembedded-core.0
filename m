Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 63B716B66D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:51:52 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo10so4213176obc.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=mjZ5ZaWtDOypMcfZJ8LIF2NMYx9OHjzspHJcpOYQbaY=;
	b=QsjjJLfGhmef412TQpblBy/cQeAO1zCephjUfDaCHoRaGJBVqY5/FYBq4XEcUcybCq
	L5KsvCigqNcP0iHb3+RouqA/McL3QZ6xWkSVJpFnFMtXMUQBzWQ30Q/IbQzPXD5E4btN
	FpOuFE9tVK4Ch3r5fFbG28qA8RcPomDWcvfC3Ky/vP/9RSljne5IcTG+qqu1f9Vvs2tM
	YR0A0nONmfnR7shz2DWTGlSLpFAY4Lq6xUJm+iDUlwWYTH61/EVngd6QZkkojHpTVk6Q
	JBIA6OZ7X3HEYM/G1sRHUxM2fKY36De2vUuN5FS/BC9xJ9XtCr7EQ+NaKIl1XgA/46TX
	RAZQ==
MIME-Version: 1.0
X-Received: by 10.60.144.133 with SMTP id sm5mr1735005oeb.103.1377193912325;
	Thu, 22 Aug 2013 10:51:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 22 Aug 2013 10:51:52 -0700 (PDT)
In-Reply-To: <1466146.RJNtyhCQ4g@helios>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<6560539.TdGG90GaLI@helios> <1377166846.428.50.camel@ted>
	<1466146.RJNtyhCQ4g@helios>
Date: Thu, 22 Aug 2013 14:51:52 -0300
X-Google-Sender-Auth: sF1Qw3tMvc5HA4POpLAuK7AK85A
Message-ID: <CAP9ODKo2PA7ZbSS8dhLvhUVZwhUpi+LpBDHU4f1PBd7207XD2w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 17:51:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 9:51 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 22 August 2013 11:20:46 Richard Purdie wrote:
>> On Thu, 2013-08-22 at 10:07 +0100, Paul Eggleton wrote:
>> > On Wednesday 21 August 2013 22:58:55 Saul Wold wrote:
>> > > Marko Lindqvist (3):
>> > >   texinfo: correct dont-depend-on-help2man.patch
>> > >   SDL2: add recipe
>> > >   boost: fix build when PARALLEL_MAKE is not set
>> > >
>> > > Otavio Salvador (1):
>> > >   distro_features_check.bbclass: Allow checking of required/conflicting
>> > >
>> > >     features
>> >
>> > I should have asked this earlier - why does this need to be a separate
>> > bbclass? The code doesn't do anything if the variables aren't set, so it
>> > can't be because it could have an impact on existing setups that don't
>> > set them.
>>
>> FWIW I do have a worry about the shear weight of the core these days as
>> we're building up piles of anonymous python for example. In many ways I
>> therefore like the idea of having more classes which get included when
>> they're needed.
>
> For something like this though it just increases complexity for users - unlike
> other optional class-supported functionality it's not even clear from the
> variable name that you'll need to inherit the class before they can be used.

Both ways works for me. So do the choice and I update the patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

