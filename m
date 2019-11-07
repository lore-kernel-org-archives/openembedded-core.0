Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD6B7F897
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 16:32:37 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b11so3163627wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=yRsg6Bqv/vt75MOtMFiJLMjnLTYHed+PVzD8EGsfvtE=;
	b=XJdrY87AYi36/AudwVyP7XtQ4q8/dGlAeVvCFjMRdZOZp/CZK9sMK9CrF5f6VNAKYt
	HGoARArOAVpddOYzCvuxYFbtO2h3DZebEVaRy3zvghMcj5mWd0jt27Udzke4LAzaFMkd
	4FCKn3xevTYfdJtRzSDDrHICI7KZGmU1c8cl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yRsg6Bqv/vt75MOtMFiJLMjnLTYHed+PVzD8EGsfvtE=;
	b=B72EgXZUPVKMpctMauFoddk5cfzphvZDa2HlgC8HMmGPUoYw7JY+PsGy6Cg8gLmxc0
	d6Zpl/JlzHiSXbYEauTWPs1QArUadDe6NR9PiQQpvIK43xyQWUtqdZ1K+JSOWbI5elW6
	DKbOwcJ7Wwgxd/cdo8JFUntPZFQjTB4wQ+dSMKXWCwtcASXZSDB8SWVe4ZZNHWu7jmBZ
	7SumwnI6HbXFgyqcmwzkg766+guWcPUEbV1xaotsK6LR93vv+3k2jH9iTwIVZKw5ZOZt
	vgMH+RelycUIusB2BBc8gGhUtzd+sVRSOqq9Car80mZqMRhhavekZI+V3YR8T9lFF0WT
	XhYw==
X-Gm-Message-State: APjAAAU9t/VjRzD/j06V7DVd2yXJGSohwAkKyaEt/d5yDzV7031to6Mw
	bOst3lWfziL2/2o0kz7A4i8jwA==
X-Google-Smtp-Source: APXvYqwDA+cDLK7A4lH7j4RYe3Q3wNzLa6dKMzDoTjLu0CmHF6Tz8QwH592osAn2wiB2gl9jImaV7A==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr4097757wmj.150.1573144357930; 
	Thu, 07 Nov 2019 08:32:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm3167869wrn.48.2019.11.07.08.32.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 08:32:37 -0800 (PST)
Message-ID: <afa8eed45a5acefa38a89e82e5a833f387963a8f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Mikko Rapeli <mikko.rapeli@bmw.de>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Nov 2019 16:32:35 +0000
In-Reply-To: <be45a323-4379-8a13-71c6-21f98e3a0af4@gmail.com>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
	<717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
	<be45a323-4379-8a13-71c6-21f98e3a0af4@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Thu, 07 Nov 2019 16:32:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-07 at 07:55 -0800, akuster808 wrote:
> 
> On 11/7/19 7:03 AM, Richard Purdie wrote:
> > On Wed, 2019-11-06 at 13:46 -0800, akuster808 wrote:
> > > On 11/6/19 7:37 AM, Mikko Rapeli wrote:
> > > QA resources have been a donation from Intel and Windriver above
> > > their membership fees.  I don't fee right asking them to run QA.
> > > > patches aiming at yocto 2.5 sumo. If not, would be really nice
> > > > if
> > > > someone could collect patches into sumo-next or sumo-contrib
> > > > branch
> > > > where us
> > > > users could be in charge of all Quality Assurance.
> > > I have collected other patches for sumo and built them locally
> > > but I
> > > have no way to inform Richard they pass an AB  builds or
> > > automated
> > > testing for them to get  into mainline sumo.
> > Given the discussions around LTS and the fact we'd need to do
> > *something* with the autobuilder to help support it, I've been
> > experimenting.
> > 
> > I created a sumo-next branch with a uninative update and Mikko's
> > patches and then managed to get it to build (and pass) on the
> > autobuilder.
> > 
> > I did directly merge a bitbake fix to the 1.38 branch to avoid test
> > failures too.
> > 
> > The autobuilder successfully builds a-full for sumo-next. Compared
> > to a
> > normal build the differences are:
> > 
> > * unsupported workers are removed from the pool for sumo so it
> > only 
> >   builds on a subset of the infrastructure
> > * no buildperf tests
> > * there are no supported fedora workers left so no oe-selftest-
> > fedora
> > * no ptest image execution (we never did this with sumo)
> > * no test result output (wasn't present in sumo and never
> > backported)
> > 
> > I'm prepared to merge sumo-next on the basis of these results and
> > use
> > it as a model for how we could continue to get critical patches
> > into
> > older releases. 
> Are you taking the other patches also submitted for sumo ?

I am worried about what the bigger picture for this looks like but we
could try testing them. I think the TSC needs to discuss this.

Cheers,

Richard


