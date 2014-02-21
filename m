Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id BC6B26DC16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 16:33:18 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so4567146oag.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 08:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zQLV7wMt4KiJ8lB9JfQs3d7qv1ONApa6FX0EZKjg7A0=;
	b=j9QMKPm8TMOeDvcQxOzv3eqaDFO9ZVXxNr7BWAgdtO+HxdDVsUlu9ZcJDnG5fCX7uz
	u1cbrACqWew36s1loFfuMI3Itk4sI4pv/i2b7N1wPTtz05JOBD+v0O6DAT51TQcXWFRM
	mI+3Y7n0Pzz/yMnE7CYozr3Sc9hVJ2otvXXm2lFewBlcQWmaBOsSTwd/yrG29jlNDcVM
	DAsSjtHUdyzoTbf+58GL1ezVsUiFKaQ6Mgb70thXg26lEVy+r7ebuGrdUm1S6E6+ClPQ
	hQdnoErUw6HKpP7txl01YdbSULXZcLS8QGF5spjtyLPVZ/4qSKlAI5cyyzB6Za+ScJmr
	zEdw==
X-Received: by 10.43.153.68 with SMTP id kz4mr3635651icc.29.1393000399668;
	Fri, 21 Feb 2014 08:33:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Fri, 21 Feb 2014 08:32:49 -0800 (PST)
In-Reply-To: <20140221151607.GG3854@jama>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Feb 2014 08:32:49 -0800
Message-ID: <CAMKF1srH-UE7rtqDZJGorWXwoQYdGwzTvZwK8mE5u0ooTikzjg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Fri, 21 Feb 2014 16:33:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 21, 2014 at 7:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Thanks for upgrade
>
> I've noticed pulseaudio failing to build when it tries to detect old
> libsystemd-login lib:
>
> | to the PKG_CONFIG_PATH environment variable
> | No package 'libsystemd-login' found
> | configure:26263: $? = 1
> | configure:26277: result: no
> | No package 'libsystemd-login' found
> | configure:26310: error: *** Needed systemd support not found
>
> do we want to enable compat libs or update pulseaudio to use new
> libsystemd?

I think we dont have such a big legacy with systemd yet may be if its
few packages then lets fix the packages instead of enabling legacy
support if we can. in my local tree ( not yet pushed ) I was
explicitly enabling it and disabling kdbus support to see if I can fix
the logind not finding dbus issue
it seems to happen for all architectures

