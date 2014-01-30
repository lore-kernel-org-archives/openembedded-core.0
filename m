Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 647F86E9AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 18:14:58 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so4897777qae.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 10:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=002ifbsgi0wAtkLFY+jkLv72XPvLy9WK3QDqBx02p5A=;
	b=PdwhYnGLi7Z+tlH04ehZMmFEMEGPpg1RJ7MkzfWXAaPPgjyIhZBnA9wXXaDPP2YcaL
	f22MjpW2RcxwBMEGLGXAy7Bjy/x7W+a4z129eMKPOD/yMLCR196ZspMCiFbsbvdxQFXp
	LLvZVdzxjbG8jeZ0rtDa9cEu9A74PtTmDcEo6BxXH7qK+LQ9lTV/WaN5RHqzdpLk4GfM
	rIa9JMbdNaBCp8yXkGFtGLfZy/LOR5pW0sE/Q7d4QiQHGuEzUQX/iOEABShOwaD8W/Wf
	i97HdS7Q61b3oPx4DTNOMSg9KWhbWxym497rjW2fiXTcX3t6FMaN+7OO3n1xstOFwAOH
	Onfg==
X-Gm-Message-State: ALoCoQm2VbMdfri8eyYV5ChcPB7BFZsKzxaIjSyI1euO9O7HWP1LvEEEW4hJdYMkLuKR0uvy9Uca
X-Received: by 10.140.108.74 with SMTP id i68mr22628868qgf.87.1391105698625;
	Thu, 30 Jan 2014 10:14:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 30 Jan 2014 10:14:38 -0800 (PST)
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jan 2014 18:14:38 +0000
Message-ID: <CAJTo0Laed6Huugouio4F9=vfoNQyPHaa_-SKD_vXULy8iJwkOw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Add python 3 support
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
X-List-Received-Date: Thu, 30 Jan 2014 18:14:59 -0000
Content-Type: text/plain; charset=UTF-8

On 30 January 2014 04:09, Khem Raj <raj.khem@gmail.com> wrote:
>   classes: Add distutils for python3
>   distutils3: Do build_ext as separate step during compile
>   distutils3.bbclass: Fix typo and use proper values for target sysroot
>   distutils3.bbclass: Use MACHINE for sysroot when not building for
>     build host

Please try and squash patches like this set that simply fix bugs in
previous patches.

Ross

