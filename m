Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5168A7D00E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 11:37:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y4so73224403wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2019 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=JJxRAwoSafnplgTv/+rfJx85i0ATbpDmEl2c+rvPbPk=;
	b=HWuHcHBIQbZ9FaP/C49263B9akHQKB/EcfSoJM7joMwpYYPYoiPQU0W7k2jg8gmr2g
	WdnfrF+Zrw9JVNBJ+l0AGjULMOPX8pUD4JvM7keUHhuPiFV35Y1znbuM8WE3/3xVFU63
	jCmDC0+qaZ0rFYGK2a8/WusOUKtIdJ3bxTjJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JJxRAwoSafnplgTv/+rfJx85i0ATbpDmEl2c+rvPbPk=;
	b=cz2lOIVrPiJEDEK+D59OCxGfInJFhbS8TcBQzcV10rT+UeLggKbqxagrdOq+GTIDAu
	8JANtQutShdT1owmSX0MbSMq6hHJZwwy3L2lfhLiDsGdUaqKYPghwT+z/RDVCTJConCG
	yKUahZ6Z0baTWaEoPVTACij3M4ik9iWLmS1DPYdle7jZHmxVlest6/AB+8gPJHd2Gh9z
	CTcIYyW4mFqDYrkNUl7Qxcc3PWNHy/NhFWb6DEUDFST3AEdFHDZOvbUNfjUw7mK0UkmV
	p1jDn0lEbPM5klt+8oAA2jk1JBDxo2nL5WUeu0tgSrFqFwlFvDr2aSuaU6rleCsoxbMw
	xHjQ==
X-Gm-Message-State: APjAAAXVYaQfzK6q5rQ3LM0RdZPk7QNQQ66iMvZHBph9rYfrEaq/3nw9
	FQ1YGedhJDe7zbQ5SphOi7xuUg==
X-Google-Smtp-Source: APXvYqyQPmVm1l3ucgZ9yX2HLDI7f/FjwQeOm/gGRmvS8dqJjS+qp5tYERW4ejs6gpfG+X9hnwjUgQ==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr18945227wrv.299.1564659475980; 
	Thu, 01 Aug 2019 04:37:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g131sm52306414wmf.37.2019.08.01.04.37.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 04:37:55 -0700 (PDT)
Message-ID: <7b27b073050445e38d1a1558eeac023f030496f8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 01 Aug 2019 12:37:54 +0100
In-Reply-To: <7a8f13032f1e892d865c6bcf95c8f58f141001a3.camel@linuxfoundation.org>
References: <20190801011038.4416-1-zangrc.fnst@cn.fujitsu.com>
	<ee26bc1bf769ab46b9f6f9f503cd192f4ae0611a.camel@intel.com>
	<ac388709-9edd-3f06-ff2b-dfd0910bbcf5@intel.com>
	<7a8f13032f1e892d865c6bcf95c8f58f141001a3.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] libx11:upgrade 1.6.7 -> 1.6.8
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
X-List-Received-Date: Thu, 01 Aug 2019 11:37:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-01 at 10:22 +0100, Richard Purdie wrote:
> On Thu, 2019-08-01 at 10:03 +0100, Ross Burton wrote:
> > On 01/08/2019 02:24, Mittal, Anuj wrote:
> > > An earlier patch for the same upgrade didn't make it in and
> > > probably
> > > fell through the cracks. Can we pick those upgrades?
> > > 
> > > https://patchwork.openembedded.org/series/18658/
> > 
> > Already in MUT, I'll prod RP.
> 
> They failed in testing, see my reply on patch #1, two different
> problems.

Ross asked me to retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/888
https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1116/steps/8/logs/step2b
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/885
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/886
https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/870
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/881

(beaglebone, build-appliance, musl, musl-64, x32, pkgman-deb-non-deb)

and others are still running and likely to fail.

Cheers,

Richard


