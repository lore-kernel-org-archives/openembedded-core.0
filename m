Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 773497F278
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 18:59:52 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id s145so60945857qke.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 11:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8THmp3waLqTRuN8LEWl6JSY3mw8e7O/EHjl3fSakU4Q=;
	b=JBPvhLfH+ASgV+jE0zmLaiuaH1XJVbBdk5xEpQFdDexp0eZn9N8GodVgyW7cfl1OUY
	xk1usbLscKFO085DnaZvp5Ex1810hVRq3aBZUqn6m4XXo67VfS4bbnxCxIK23VPTe7At
	aNHksOli/4ruIpnBvn/JStlLipPwM+2W9JfolFuSRzaOuC70E1hYpILM1sWWA/yJkKFc
	bCWfIGk6gv+4X8IOi4ApiH8cvcJl6V7SCE2Km+75H7s3a/aHTFovkHxrrfbxkKwjAFvt
	wEPpEh9D/p/C+4NZ4VcT1w79Ws9N2/4kojdNNyNbHPuWkm5Qv80mBfXfz4Fl827O3zEH
	AcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8THmp3waLqTRuN8LEWl6JSY3mw8e7O/EHjl3fSakU4Q=;
	b=sUWXrWz4i1gRISx++n0z0nIa+wz/wTYXZD+ZS6HMqLZF/WRDGRzClpeTBbtGbtkH1r
	M7mBGhffP+NIF4sf6KTA5GC9diaDrFQFFvdb5O6WcE3l4i9c6JabfQDKJjkH3Ob1XfJ4
	0mx+iNtTc7413AoL3PgMRY4F38sKaM6IjFK5se1urCpCguozIVZF6kSufDJ8q66ppCtB
	23Er1d6tN5djLd8u/X5rjZYCtsiZNxQW0rYMe+pzRpP/VZc5Z0tIFkiQ6c6U+xuDqkGh
	8x1kjplMBCbYDfo+6CB3cnnw84LnTuhjRyK0FI6JJtMyZaKhTClZmeD7Kt7SLLwApmmC
	UMXw==
X-Gm-Message-State: APjAAAVPICZTbEN2uGzf6BwhBeppaSUp67LfmknkB908Rhuka8C1/QyX
	GUvZjp65gZUNknrPq56pC1VEhwBJSv5nzgzSaZrk5wZz
X-Google-Smtp-Source: APXvYqySf4n0ZEP010ulHjfgUAY8W08tMGg6KpxDGrk7HBT5RL5rJQSLKf6RNW5iSz6JyyS61Tq8gYh+qKOx6ONbqrI=
X-Received: by 2002:a37:ef14:: with SMTP id j20mr35729qkk.474.1565031592767;
	Mon, 05 Aug 2019 11:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190802203719.20437-1-ross.burton@intel.com>
	<20190802203719.20437-5-ross.burton@intel.com>
	<CAMKF1soKtwNUY6SchZLPH8oHbbUiLabEir+JJD1_FdhHqGfhEw@mail.gmail.com>
	<919ee9f0-c746-018e-3b88-c3c8ea1fd8dd@intel.com>
	<a2ae7b01-3719-cae5-fc4b-956dbbaf9c0b@intel.com>
In-Reply-To: <a2ae7b01-3719-cae5-fc4b-956dbbaf9c0b@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Aug 2019 11:59:35 -0700
Message-ID: <CAMKF1spKJkMKGLDpBXs3Ab=dmx1QnXt2ttB=SPfuDLeXtGbP1A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] libxx86dga: remove obsolete client libary
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
X-List-Received-Date: Mon, 05 Aug 2019 18:59:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 5, 2019 at 4:03 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 05/08/2019 10:19, Ross Burton wrote:
> > On 04/08/2019 01:49, Khem Raj wrote:
> >> Ross
> >>
> >> I am seeing
> >>
> >> https://errors.yoctoproject.org/Errors/Details/257733/
> >> https://errors.yoctoproject.org/Errors/Details/257734/
> >>
> >> I wonder if they are related to this series
> >
> > I thought I solved this, maybe a patch I meant to drop had sneaked back
> > in.  I'll look and fix.
>
> I'm guessing your distro is overriding xserver-xorg PACKAGECONFIG?
> Ensure 'dga' is enabled.
>

indeed thats what turned out to be the issue.

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

