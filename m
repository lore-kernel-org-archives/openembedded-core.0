Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7717DDF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 12:25:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y197so3028177wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=fI4+Ry6teTcgTCkok0l2wSLJi8dImnCEyOTW3vqa8fo=;
	b=SBWIQE48VlTrSyyjcp0vaEdRobA7mBtzVdHt1coAFYkCwwuvny6AOceuAlbte4JnLy
	JIXsC2J+QKrqmHa0i9VUv39yxNWtWEx+lZr3iJcKpoUX6+VZ0J3ENVRd+NkTAe64v9In
	2rMa4Va+eUmKOkhlceLOQ5RBBKJ/8uSj8dTpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fI4+Ry6teTcgTCkok0l2wSLJi8dImnCEyOTW3vqa8fo=;
	b=BtO2usS6Scy2btRB5eeJdvoAxWeEPncZVRAR+K6pODC4ixTvx6j2h2IkilIkg0anPJ
	RsEslsPwfQfmHMG2CUTMfSWjNLXkoGKB6Ew/pEcwBSZ7J+zOx3ac0lSdLLjhU/Ii0Did
	CuXQGR35JHGjCQJuABoVo8+essW/BGYinxwmKn281oc40IqJXv5wsUONGZGaTfOKJGsj
	xjFFSo2vOFwNVGcbivUnznnulZetSPU/R01Mv4jKAU4TdPfu4Q26F8GRIdDVOa6pcb3I
	f48dMEaGyGmNndTVgsK7lh+duF8dnNR6hyHiTG17OCQduLZ4caEuoo5aF3wy/w8N5pLH
	PF2A==
X-Gm-Message-State: APjAAAVfAB0HWV/mFxe0eKwMNSs5TKdMRe9j5jZydbv6RKARNiXtC7Uh
	cKxgn9Pal4LjpsvVyheUtAeqqQ==
X-Google-Smtp-Source: APXvYqxXRh+tMiq/FxL3nG7W4xT6aJXosF/kCUHtO99p2AakrbIa2RngHb1vevyagd2ZF7PA579gbA==
X-Received: by 2002:a1c:cc18:: with SMTP id h24mr2827933wmb.13.1557318344862; 
	Wed, 08 May 2019 05:25:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o16sm24640093wro.63.2019.05.08.05.25.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 08 May 2019 05:25:44 -0700 (PDT)
Message-ID: <eb9506045669eaf6dc51f56fab72195c7cdba6b3.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Burton, Ross" <ross.burton@intel.com>, Mingli Yu <mingli.yu@windriver.com>
Date: Wed, 08 May 2019 13:25:42 +0100
In-Reply-To: <CAJTo0LbWzug_9N5eZwaaWNX3w6wRfOCNx379DYkpODf=t71KbA@mail.gmail.com>
References: <5CD13414.9060408@windriver.com>
	<20190508030539.448075-1-mingli.yu@windriver.com>
	<CAJTo0LbWzug_9N5eZwaaWNX3w6wRfOCNx379DYkpODf=t71KbA@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] glib-2.0: fix ptest failures
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
X-List-Received-Date: Wed, 08 May 2019 12:25:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-08 at 12:54 +0100, Burton, Ross wrote:
> On Wed, 8 May 2019 at 04:06, <mingli.yu@windriver.com> wrote:
> > * Increase the timeout to 15 minutes as the default
> >   timeout which is 5 minutes is not enough to fix below error:
> >   | Executing: glib/actions.test
> >   | Test timed out after 300 seconds
> >   | cleaning up pid 13050
> >   | FAIL: glib/actions.test (Child process killed by signal 9)
> 
> My Debian machine runs that test in 20 seconds.
> 
> Maybe we're missing dependencies to get a working session dbus up?

That seems likely. I'd note that we see:

https://autobuilder.yocto.io/pub/non-release/20190502-12/testresults/testresult-report.txt


Recipe                       | Passed      | Failed   | Skipped   | Time(s)    
glib-2.0                     | 290         | 1        | 0         | 427

and the failing test is:

    ptestresult.glib-2.0.glib/gdatetime.test__Child_process_killed_by_signal_6_

so it would seem this is working on our autobuilder tests? That would
seem to back up Ross' comments.

Cheers,

Richard


