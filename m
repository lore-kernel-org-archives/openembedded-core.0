Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 979BF7F817
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:43:19 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q13so2033544wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=yXmnlkeQlhY7qHY6zkeweWyvNUTY+4tflUYgE14588g=;
	b=J7xnvwWMwqsdEkJgFhzwKDet0fdXTnEry6+rHeDrWtfOmC91TSVzKK0A+OqiF067CO
	lFsYzgbf6IBiOiLb36oELx3QuAd8DL6HN++ZizzO7MG3gPHAkdLu4zfMhoOnTgxef7bt
	2t22DKLjgxKFy6tcDPQErAUSjcaS3PHqyTOQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yXmnlkeQlhY7qHY6zkeweWyvNUTY+4tflUYgE14588g=;
	b=QIVvwXzOO14HtI/Y08BDgU0tjNKCyIJTlXMpYHHDaDpcXittAIvIrSlwJ2OnPfUCVw
	hphE9Xe+Q8VF7GFBs5nA5hy+towzpbTrDuSCEAWWA+ITlaYdjjdWHsGAbniIfIg8odvU
	LTOK72sCfzoHEHpAZ/6m4F/hjtLrUkeG8qsD/Xj75b25k8po6jQ4/No1rweHv0E5yepM
	7RWwadxZfTaBgrM4nxyqE1CPEvgMyEn5pn7WyRIEo8b+oUnx5aiv6wY7oY/+3N2ljYRO
	XTrjOIYtdQGpZ01IU63OQQ3RZ665l0rWaf1+wPBS7dN7y3tpWTeg5L0932ad/PEBrU0w
	L5nA==
X-Gm-Message-State: APjAAAUgqMZo4iZ+7BJeKifcAJJ/DZpQPR882sHXT49Y7kEOWLW4YnyS
	80T4rIb8cwSUhyrkf7t/FTf3AQ==
X-Google-Smtp-Source: APXvYqzO5oaZgYQDTRjw2NsBzQvakPvSQNQykge5VTLl13FPbmducIecqSIInBZsayH44NlgKXr0IA==
X-Received: by 2002:a1c:96c9:: with SMTP id y192mr4244910wmd.8.1571910200286; 
	Thu, 24 Oct 2019 02:43:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i3sm20354616wrw.69.2019.10.24.02.43.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 02:43:19 -0700 (PDT)
Message-ID: <d849f7d53e9903f9db4b2fb257730270583d63cd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Adrian Bunk <bunk@stusta.de>
Date: Thu, 24 Oct 2019 10:43:18 +0100
In-Reply-To: <20191024093406.GA27204@localhost>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
	<CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
	<25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
	<20191024093406.GA27204@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Thu, 24 Oct 2019 09:43:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-24 at 12:34 +0300, Adrian Bunk wrote:
> On Thu, Oct 24, 2019 at 09:15:01AM +0100, 
> richard.purdie@linuxfoundation.org wrote:
> > The cmake change makes python visible from HOSTTOOLS. That isn't
> > wrong
> > as such, it is a change in behaviour. If recipes don't set python
> > enabled/disabled explicitly, there is some fallout from that. I'd
> > say
> > that is a bug in those recipes which aren't giving explicit
> > configuration to dependencies though.
> 
> The problem is not about enable/disable, it is more about not
> explicitly selecting the python version.
> 
> For the affected libiio the python2 -> python3 change of the python 
> bindings last week [1] was basically:
> 
> -inherit cmake pythonnative systemd
> +inherit cmake python3native systemd
> 
> This is very fragile, and I would consider it expected that either
> the old or the new case will break in some way when both python2 and
> python3 are available during the build.

That isn't the complete story. We changed the search path in master:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dbba06d9153ae588c9496b40e5db18b3602bfad1

which then meant libiio found the wrong python as "python" in PATH
became py2.

As you say, it doesn't specifically declare which python it wants so
things changed.

I admit I'd misread the recipes, both for the upgrade and
enable/disable, I should know better. I think this kind of proves my
point about trying to push more work onto people who are already
overworked though.

The key questions:

* is that OE-Core change is correct?
* should this recipe be more explicit about its configuration?
* are there other places this problem has been introduced?
* who is responsible for fixing any further issues?

While we remember we should document this for the 3.1 migration guide
at the very least.

Cheers,

Richard




