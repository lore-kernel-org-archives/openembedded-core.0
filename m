Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 95FBC78294
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:46:29 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id w126so32874432wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M6KjTmDL2o7bQP9wPxPHTgr1BL6S0Emc0mG4KUvY30c=;
	b=th5qwv8XZba/TC1qIyGxYIe4KbhksZ+gPbkLl8uXOsOKeEqSfjARdbO41rUvhdgx4f
	EA2wlFdJ34p8Hn+pr3KwXhTrEofqCFpiG8DPvVFb7t+t66HdQoJNXhUymLLocnhmsWXE
	MOPIH57ZJC26E5fwDIEvj4VhTUPE+hdsA4bn1YycOKUygCyTauvRv4vD1R9uGdV/iKy2
	Hm/M6FEdzyThFMlltULMtsLpb2VGEQSekA05NA4qLn40rYx54OZQn4yxz6sUdghp3k4i
	G6ua2s4wjrewETeVWhENrNhBTL2FXLhALhtA78NTreOUSd1mhqABXaUdT9ThX/o7whpx
	loUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M6KjTmDL2o7bQP9wPxPHTgr1BL6S0Emc0mG4KUvY30c=;
	b=mLI08Ro/dmz5dkr+i+OSkO9NMbPnwnsCev9044aPibnnTvYdL3NINejH0qP13ermpa
	AjFJgvD5wh+oRDlUDBAwyGLe9GScEycCCDX0oiuU1yiV27DAAmC1XfGBLD+BWbcQorx5
	m4D9+b7O7BUH/6Wf1Kor59lf1eQg9WRSBVpzBwAX5KRrNnQz27eBpu5jP3l7wC5DJMXU
	L2Q6/4z2yif3NFRON46/JQWu4btmiYZ0VAE24a1RugSvbqZng150RlzAlELqRMX1vvP2
	zxKefIak/mEJv8QxbgE67TLZjn4hucxWlyKsYdEyE30Hy+VEHHYUxJxChlmRbu2o0xIV
	Iq8g==
X-Gm-Message-State: AIVw112rvFRyeiSpQtIQti7WMucscKCSdeA0CLe2oH0mQ8XF70ZLX/S3
	6qMzaX1IkoaiqoEe0ZbfXWW+uaQ++g==
X-Received: by 10.80.147.197 with SMTP id o63mr3957153eda.194.1500579990367;
	Thu, 20 Jul 2017 12:46:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 12:46:00 -0700 (PDT)
In-Reply-To: <CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
	<CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
	<CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 15:46:00 -0400
Message-ID: <CAMKF1spheC7ODGgJ3FeBUiUfDDLH=K1SFJ1=Vr8odT55Q4WTuQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Thu, 20 Jul 2017 19:46:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 3:22 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 July 2017 at 16:37, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> This fails to build on ppc:
>>
>> | checking for libdrm >= 2.4.75 libdrm_intel >= 2.4.75... no
>
>
> Same on arm and mips now.  Basically everything that isn't x86, so I'm
> wondering what the difference between your build environment and the
> autobuilder

may be pkgconfig is installed on working system.

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

