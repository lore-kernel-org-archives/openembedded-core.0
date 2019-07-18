Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB347D2AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 11:31:53 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id g20so50827104ioc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8abdp40UONM7xS8MfGE9pcTtlDC9FMxvwqZkceWpzfs=;
	b=quOLBSkF//k0ZBfmXrmc9e2zhhEYRzaejx1F4TBK58/49HyHSnztgZgArdfENAbwwt
	Y3jxUFjwBZTBVMTdtNuCKot1g+FC9Z5H7/MmGbaPNBYprlJR4P3vdbVpTibEf9gxymCU
	gLZVtrtYINUg3Mjuk7H3lq3ua/BTJWDkHw4Lz1o7MmGU+6JjJRpKeuCSglSd7Y0hULQN
	8ORz2jBzF1ygjgvFNtAnSZq5xje1TykGxlpMvsl9rEW/5bRnvAAuS1nSX3PuqhoHiG+/
	pJGpxLxokAWKRBF1reCd6r8XAJcrfWKfBQ3/en98cr/EIddbGeI2Sak3zPUjjbpUMZzP
	Vgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8abdp40UONM7xS8MfGE9pcTtlDC9FMxvwqZkceWpzfs=;
	b=A7edhtjwuH2yh6FfBG2rvwSJIFq0DqamGGOL6hcrH4Kb3N7G83PbQEM5mNLir4whA0
	8OkdQHWH9qYBCV2OjbCaws4IZAuAO0LXblNm4mjRvZqsWJTr6BkYmK8UR0V4b67AbdOz
	aI7Aj5arFcDUrwvAsQywmtDkNSthIiLJYGeNdP+SRZ9LYHOvesemKL1GR30FZ/t0dHNQ
	vNGdAsRP+Dj7dFotR/75DyYo/VVnjK/pguVxBK0GoFsbrXZTmxqoqaGxiFC1v7pNfBkS
	Zqoi3rcfZiSntdroGWmfoihLdQ1JsmF4aucdtAtGuvznhB4cb7XxCHB+XDKWtuPl+9kx
	WKDQ==
X-Gm-Message-State: APjAAAV/e22gve/S0YGdHF/2RJYjF5oiwwT4JUg1peFkhMQ3Gcuo3h06
	tJip10ZJ6JKqbrlCVxFdfWO3EU84AH5KdhgWddvlEw==
X-Google-Smtp-Source: APXvYqzDkKL6tKeXQ9F2gy9qFLEXPNLc/nK2yKhiz1gMEvHIvQw8XKPwf33DSuDJd56x3cyfGvwBBB5MiTgxr9HdwO4=
X-Received: by 2002:a02:3093:: with SMTP id
	q141mr48084190jaq.128.1563449515054; 
	Thu, 18 Jul 2019 04:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0LaOHbSB75OGLsHJ3Vxd5eVgg9+7Cq3k0=P-BwPLpFiyjg@mail.gmail.com>
	<20190718060409.GA27459@localhost>
In-Reply-To: <20190718060409.GA27459@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2019 12:31:43 +0100
Message-ID: <CAJTo0LbDCp=Wn76R56LxkAbU7pbkeJuBmnXhVr7h=gCJd1phqA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: dropping official support for Debian 8 / Opensuse 42.3
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
X-List-Received-Date: Thu, 18 Jul 2019 11:31:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jul 2019 at 07:04, Adrian Bunk <bunk@stusta.de> wrote:
> > Now that both Debian 8 and OpenSuse 42.3 are end-of-life and no longer
> > formally supported, we think it's time to drop them from the supported
> > distribution list.
>
> Debian 8 is still LTS-supported for a year, unless there is urgency to
> drop support for it the right time for dropping would be after 2.8
> (2.9 release and Debian 8 LTS EOL will both be in Q2 2020).

I'm inclined to dropping 8 and just supporting 9 and 10.  We don't
*need* to exercise every distro.

> Should OpenSuse be dropped, or just the version upgraded to 15.1?

42.3 dropped.  15.1 should be it's replacement, yes.  This is already
being exercised on the autobuilder.

> Fedora 28 is also unsupported (but will be the basis of CentOS 8).

Good point, and we also don't have Fedora 30 in the list.  Again, this
is already being exercised on the autobuilder.

> CentOS 7 is based on Fedora 19 from 2013.
>
> This is the oldest currently supported distribution, and when to remove
> support for it (replacing it with the not yet existing CentOS 8) should
> IMHO be part of this discussion.

Centos 7 support is, I believe, already patchy - I think we mandate
the buildtools for that?  Any idea what the support plan for Centos 7
will be once 8 is released, whenever that is?

Ross

