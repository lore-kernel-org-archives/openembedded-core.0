Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (unknown [209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 349D265D20
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 18:47:38 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so5035615qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 11:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eKALMzdwTdlxzitL0AXMTaJWc/sainlucUYb+ZvnRd0=;
	b=A2MxJ6KdcUF6LXZjo75+AA6einqCJciq6jsa+HQXewLTZ/gU22Vsm+WsRw39cc4YEz
	HOzJcIjZNzTpuKIY6QiCANn5CpZ/KM6M2AU/xyxB9iG9P5OMVz/JN+tFcBQ9GdYfMo8Q
	EWF2TT3nnBHAbM10j+/OZvMCyd/2mSawr3eT0+qSfFUhNyq7I4jGerSi3CNPzjD9uHAI
	pB+QukdXWgFzoWm1CbPz/Aq0su24jtDDzy1JYiBcPjSzgaJ/gqZ5KcGL1m+fwQx0yN8w
	fOxX0KpGN0XT8DTfo7ZLBrZ8kPeVudJgpZkDib9gkkUR94vQ2b/v7qffXw4YvNSkJ0bY
	5amw==
X-Gm-Message-State: ALoCoQmA0PYPiSVMjaaqffvcU2AjSVQ5gbQFqXQAaMKcF962eS42/2LA/b9/nKCM2qdGDH+034AN
X-Received: by 10.140.28.3 with SMTP id 3mr16575259qgy.71.1399661259694; Fri,
	09 May 2014 11:47:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 9 May 2014 11:47:19 -0700 (PDT)
In-Reply-To: <536CF208.3000400@gmx.de>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<CAJTo0LZ_S=mNgM6gtPSfYf=AVRxdLcJ_CO31c+emmQrib80hjw@mail.gmail.com>
	<536CF208.3000400@gmx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 May 2014 19:47:19 +0100
Message-ID: <CAJTo0Lagpg4G20WJbXr1r_L4ypOMjU+1iCOD8cRwZ86fFJGM-A@mail.gmail.com>
To: Neuer User <auslands-kv@gmx.de>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [oe] GStreamer 0.10's future
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
X-List-Received-Date: Fri, 09 May 2014 18:47:42 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2014 16:19, Neuer User <auslands-kv@gmx.de> wrote:
>> So the catch here is that Qt4 currently depends on GStreamer 0.10.
>>
> Yes, it does, as long as you need QtMultimedia. Same applies to Qt5.
> There was a discussion on the Qt mailing list about moving to
> gstreamer1.0, but this seems to be rather some time in the future was my
> impression.

Oh, even Qt5 needs 0.10?  That's disappointing.

Ross

