Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 248CD6B46A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 12:24:43 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id f8so6308003obp.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Zp0nQDuFRVSaRLG70hAzzissJUQH0tLaj+MEVtOFpv4=;
	b=ZGb76TXmYR7fUyq9Yv90qW8P792TBqntrrdXGkgE7eXh7JyBZfCEKOrEYFvkkg6M0b
	iFKcVOS4CntOFBV0bePoECvVrI4KX/uaGA3y4iB5148bqW7k4Zds4uUWtwxc+8bnfcXL
	lyisRY0zAaH2etN8bW3HvYmu42NrsSQUgLOYO6XDgvkn9GTwnJxAHuBUd/shL2NaZKYe
	2KYacIlgy8t2nPnyiIjLmZ9MbaVVPfCatV576rxZId/lBwc5GTATk9n4wxdvAJrGJY1E
	PRRsOeVmme85J/cwku8sJ0hYwurWiHkaugIflYF0MucYawvy/hfAmYHr0MaW3XZmrnr5
	3l1A==
MIME-Version: 1.0
X-Received: by 10.182.142.104 with SMTP id rv8mr56660412obb.3.1375187083213;
	Tue, 30 Jul 2013 05:24:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.125.199 with HTTP; Tue, 30 Jul 2013 05:24:43 -0700 (PDT)
In-Reply-To: <1375186489.13247.55.camel@phil-desktop.brightsign>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
	<CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
	<1375186489.13247.55.camel@phil-desktop.brightsign>
Date: Tue, 30 Jul 2013 09:24:43 -0300
X-Google-Sender-Auth: Imxa4Eyo7bmV1qYxDULNc7CD69M
Message-ID: <CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 12:24:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 30, 2013 at 9:14 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-07-30 at 09:00 -0300, Otavio Salvador wrote:
>> To make this, we cannot reuse Poky distro for example as it
>> /unconditionally/ appends to DISTRO_FEATURES. Besides it is easier for
>> test to be able to override it using local.conf. For products I agree
>> we'll end adding a distro to make it reprodicable but for development
>> stage this trick makes life much easier.
>
> Surely for one-off tests you can just write out the whole intended value
> of DISTRO_FEATURES in your local.conf.  It doesn't seem as though this
> variable is unwieldy enough that it really needs mechanical handling.
>
> As for poky appending to DISTRO_FEATURES rather than just setting it,
> that sounds like it's arguably a bug in poky and you should perhaps take
> it up with those guys.  Of course, they might take the view that poky
> itself is meant to be determining what DISTRO_FEATURES it wants and they
> don't want to support or encourage random frobbing of flags by third
> parties, and I think that'd be an understandable position.
>
>>We call it and /finalize/ the database so it has _append/_prepend
>>resolved before mangling the list.
>
> That seems a bit unwholesome in itself.  Are you sure there are no
> potential bad consequences from calling finalize() there?

No; I am not sure. What I know is it has been being used by meta-metro
and O.S. Systems distribution without issues for a while and it solves
the problem I have.

Adding /full/ distro features list is ugly and easy to get wrong. This
seems much better for user IMO.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

