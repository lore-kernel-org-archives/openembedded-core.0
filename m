Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7332360842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 12:48:06 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g12so3339688oah.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=pkrpgZfWch28sPIyqN1nnAAG3PMmVp3YhfBpzduHAxU=;
	b=f12SvMLIuSM1Tdbpbh4sFgoHd0uVeHuL6MGKW1bM8mdgusgiEz+OHbVMXaTkFLRX9K
	0Zu2QPBY18qHnESrgtB2Y4xrLxLXYVMGVnOC7YHS6Rdh2d/4ZqpQZ9K63gk+vju9BNBI
	At8qgfRvc/BOncGa67jKvQUojETLABFuFlW7kXKavn8qbQV0jUSFF+TXFDBzQ19h9pGc
	xsrU4hlvZzZn2aPAswfHKFvH6sywbUduovpgtQrtiAPO7IM9JGPSTd5+4NKf9bvWUxy3
	kFzKXL3GxdvAEFvtup7V5Tx6QJdZ9vKnPwo7DMYp7ffsoK4nX0TTc3ijDc5Q7RFSz7hq
	gHCg==
MIME-Version: 1.0
X-Received: by 10.60.96.131 with SMTP id ds3mr13972200oeb.50.1377175686571;
	Thu, 22 Aug 2013 05:48:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 22 Aug 2013 05:48:06 -0700 (PDT)
In-Reply-To: <1377166846.428.50.camel@ted>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<6560539.TdGG90GaLI@helios> <1377166846.428.50.camel@ted>
Date: Thu, 22 Aug 2013 09:48:06 -0300
X-Google-Sender-Auth: ytHK0_OK1AgIPBV_2JEfIv4KdsQ
Message-ID: <CAP9ODKqV9uh5wxy7iZ0fBi3EGznqemZyBvPLumvWBiqb1CunDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 22 Aug 2013 12:48:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 7:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-08-22 at 10:07 +0100, Paul Eggleton wrote:
>> On Wednesday 21 August 2013 22:58:55 Saul Wold wrote:
>> > Marko Lindqvist (3):
>> >   texinfo: correct dont-depend-on-help2man.patch
>> >   SDL2: add recipe
>> >   boost: fix build when PARALLEL_MAKE is not set
>> >
>> > Otavio Salvador (1):
>> >   distro_features_check.bbclass: Allow checking of required/conflicting
>> >     features
>>
>> I should have asked this earlier - why does this need to be a separate
>> bbclass? The code doesn't do anything if the variables aren't set, so it can't
>> be because it could have an impact on existing setups that don't set them.
>
> FWIW I do have a worry about the shear weight of the core these days as
> we're building up piles of anonymous python for example. In many ways I
> therefore like the idea of having more classes which get included when
> they're needed.

That's why I splitted it in a class. I agree with your concern about
base growing ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

