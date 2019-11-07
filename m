Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0317F8AD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 15:03:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h3so3335841wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 07:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=yHFRiIq+zMWuaK5D8QlZrwgEY4+ps0aNHSJeS9ZyBwo=;
	b=O/fDR0A3WDRl6Eq9ODH09pQ+8q4Q5UE+Pys+0Y5oIStN1NIZhegUvJSuUwfNk3U502
	t3ZNUI13FkscC3GL73S17FCXS9bzPlKabnYtuwjL1l6+4rCy8EVRjjNXIvKsR1YP3QS0
	lY0idH1PEgi7cEwcg2snbYo1ZW3QoMUXtOmtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yHFRiIq+zMWuaK5D8QlZrwgEY4+ps0aNHSJeS9ZyBwo=;
	b=siGwM+y4S3lotE9T3EmR4R7pKlJKCre2JggZmd6vvhm1rGYSlAAWjHh55GMAp+KYWl
	GRubhb/HgUaAqu0yBPfN3+urDlyiK+8mZEBFYB5jvZMQrszFoae4NXsHfW8cYUvFajTN
	rmqD+ZXH35wg0RmCMqliy2IUsy/1OcQYQTjXiwQODaskYhIviS8vVen0lPEt3VmfO48I
	7UhbTkzr8ylPNNmWjciZuT46kY+/lgSCDG3DpeWrfee8vd+oK2c1DPjuVDwHsyvLrBa2
	9jyAELVQ1eRCuimrLTgy8H4QgyRfzJRvAR9u3ZwuV1wQRDCdTpR5INWtOGIFozz5FqKH
	6KGA==
X-Gm-Message-State: APjAAAVHia6qw4TbayhtqX9DvB0AIB6uyysZrCDvUvsAc+4suPVZyZNs
	YRwRDSB+2jWRdxsxUegCsdjW2A==
X-Google-Smtp-Source: APXvYqz/lI8yM2HAy0+Ldj7kVHuiD7BptUkEyvr+hhJLPFgaMHDFDpL/Ut1uTLcHCGyQZzryOiHLSA==
X-Received: by 2002:a5d:634b:: with SMTP id b11mr3459651wrw.13.1573138996708; 
	Thu, 07 Nov 2019 07:03:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f19sm4518259wrf.23.2019.11.07.07.03.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 07:03:15 -0800 (PST)
Message-ID: <717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Mikko Rapeli <mikko.rapeli@bmw.de>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Nov 2019 15:03:14 +0000
In-Reply-To: <ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
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
X-List-Received-Date: Thu, 07 Nov 2019 15:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-06 at 13:46 -0800, akuster808 wrote:
> On 11/6/19 7:37 AM, Mikko Rapeli wrote:
> QA resources have been a donation from Intel and Windriver above
> their membership fees.  I don't fee right asking them to run QA.

> > patches aiming at yocto 2.5 sumo. If not, would be really nice if
> > someone could collect patches into sumo-next or sumo-contrib branch
> > where us
> > users could be in charge of all Quality Assurance.
>
> I have collected other patches for sumo and built them locally but I
> have no way to inform Richard they pass an AB  builds or automated
> testing for them to get  into mainline sumo.

Given the discussions around LTS and the fact we'd need to do
*something* with the autobuilder to help support it, I've been
experimenting.

I created a sumo-next branch with a uninative update and Mikko's
patches and then managed to get it to build (and pass) on the
autobuilder.

I did directly merge a bitbake fix to the 1.38 branch to avoid test
failures too.

The autobuilder successfully builds a-full for sumo-next. Compared to a
normal build the differences are:

* unsupported workers are removed from the pool for sumo so it only 
  builds on a subset of the infrastructure
* no buildperf tests
* there are no supported fedora workers left so no oe-selftest-fedora
* no ptest image execution (we never did this with sumo)
* no test result output (wasn't present in sumo and never backported)

I'm prepared to merge sumo-next on the basis of these results and use
it as a model for how we could continue to get critical patches into
older releases. More work would be needed to see if any older releases
could work.

At this point the TSC needs to discuss LTS and what our branch policy
may be going forward but this does add useful data to that discussion
and may help influence those discussions.

[For reference I did have to seek advice from upstream buildbot on how
to avoid a bug and its taken quite some experimenting to find the magic
to make this work. I did have to update the autobuilder-helper sumo
branch to be in sync too].

Cheers,

Richard


