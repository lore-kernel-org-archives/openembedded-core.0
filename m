Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id BAE8C77D6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:54:12 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id u12so848730pfl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S83FkpeoPYFLgdmeHwN083Ip+6nAy6rgNRzkMi8TUjo=;
	b=quXBjqVKZ1S1LEJNsJYAntdCHPYjTx1mv6e1ADNalxgfD6Ms7x1/c0Hk0MyR34miRX
	3gJONDWt9FfnpfPgfKjNSglEONDScsl7P56/y8N2fLiyVVMr2BNUq5agqObuCweMqHrK
	WhUPAqp1vOQJu7tUomRQ+vLmwqqRJZ5XfrmkioMBdBFTpcBsO70rsb8YATPadPPqMWhc
	eehC3v5Z8gReCLGxgTJ11Akqlr8/xs5715+Ll7s3F6Y1lM/D6xceCh3TYSWxVf3rw8cu
	ZsVSeBDWAZehQY1oUb5dsU15NIkc0ZB5ZBqAI0AcpWx9eL4sKkP55WkWU6Nyze+iy+YN
	Sviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S83FkpeoPYFLgdmeHwN083Ip+6nAy6rgNRzkMi8TUjo=;
	b=eZlltTSOiFKRx2N7C3sS+9GZJmu3t3ZuJiEZer/QW3kZZAQeKNWPQ+emX4ANAyRHtt
	oZYMElfqp6B43peSweHO4mmTn2IvPlnoxWzu/jZgR8SB5cb6zGeauhJsHRqMbKqj/2HK
	u2FFaTAXyEohNMOSfAwxeBmSEeumsWJYfHOt7sxeos8s55cLG3LyoyKf8htO4NPW1ZQJ
	M1XW3X7fvL+TGPMuAojFq14BIhpm7lQomwivD2GegjS+QQ6VVjrNJRsSw+0N01B4O7GB
	HJdIuxLCpLeyVrC3MmNj1WmvhzJZfU5L/6P0YwABElpq4P6EPh2Fh4vGBFsVz8iGnEQj
	CPSA==
X-Gm-Message-State: AHPjjUiKYumeKBMWocQX7kZV3EKhDUHFr97wrX7BSDk+FKiGnX/2AaUi
	UPG7sqomK2GGdchpxns8RtmmR3j4sIhqbPlFqEA=
X-Google-Smtp-Source: ADKCNb6TqdfCM/Mn9zaoP4deWnyIF64y4xOD2a1M9VWGi3CH/0j/0H/j17Q60xMmUqzMb8YbtvI8IO8kusPZFLxqcA4=
X-Received: by 10.98.32.92 with SMTP id g89mr33634885pfg.285.1505768053761;
	Mon, 18 Sep 2017 13:54:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Mon, 18 Sep 2017 13:53:43 -0700 (PDT)
In-Reply-To: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
References: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Sep 2017 13:53:43 -0700
Message-ID: <CAMKF1soGGZ6J1x0yADqOUjbB2Nm8vD=_usgz+PRf8z=8emnfug@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain / /bin/sh requirement / ldconfig backfill
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
X-List-Received-Date: Mon, 18 Sep 2017 20:54:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 12:30 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> I tried to build the meta-toolchain, toolchain SDK today and received an error.
> My system is configured to use package_rpm by default...
>
> The error I got was:
>
> Error:
>  Problem: package
>           packagegroup-core-standalone-sdk-target-1.0-r8.noarch requires
>           libstdc++6, but none of the providers can be installed
>   - conflicting requests
>   - nothing provides /bin/sh needed by libstdc++6-7.2.0-r0.i586
>
>
> The /bin/sh dependency seems kind of odd at first, but after a little research
> it turns out that by default 'ldconfig' support is now enabled.  This
> automatically adds a post-install script to any package with a library in it:
>
> #!/bin/sh
> if [ x"$D" = "x" ]; then
>         if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
> fi
>
>
> That in-turn causes the dependency of /bin/sh to occur.
>
> Because of this, there is no way (with a default configuration) to build
> meta-toolchain....
>
> Investigating further, ldconfig support moved from "USE_LDCONFIG" to a
> distribution configuration.  It does this via the "DISTRO_FEATURES_BACKFILL"
> (introduced in commit: a905df2dd8f43a2febffa64a39b6e508510326a0)
>
>
> If I add to my configuration:
>
>  DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " ldconfig"
>
> This works around the issue...  but doesn't resolve the default issue....
>
> So my question is, is this behavior (the failure case) really acceptable without
> telling the user what is happening?  Or do we need to add something to the
> system that says meta-toolchain can't be used with this DISTRO_FEATURE?  or...
>

ldconfig is not very useful with cross toolchain unless its a cross tool too
I think the particular recipe should check for distro feature before calling
it out in a post_install

