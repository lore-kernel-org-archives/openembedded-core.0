Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 935526CC4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 08:34:34 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id z5so1758472lbh.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 01:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=yj45czfljS1wAA0iHAvDbtlax1KnI6cBd6afFhNngfQ=;
	b=JMKMPy+rAGUCLtHI57PkCAgqvrw9wPqCKpkMKIM03wdscyQymiCzT7ih1REQu7uuU3
	P0+m20l0OBkbiuir5xXAtmEO0I6F4zQjCzVspIgZeMwriBYbbiCDbt/2jnSgrSpCxCO3
	sFfWDsqDEVpnWD5YQkGWF+su4xLWPJJwRrlLmjf11YPZbFqYR+tP8wd1d3CuCKkoBDGZ
	9FHrzWKvr5hxhI+EU0sZi0NGmriJeiBrqbKrQjBfVq3LfOZo0YBqSyezqHEb4RujcQrr
	mFbUoCnQWjOnEi1WfOqLxuPZLjU/7ePFO7C6kMNaeaF/OIEfgis8AKZZlDIyR0tfRiZG
	NxsQ==
X-Gm-Message-State: ALoCoQlgTzTc3DTWb0TgWiUdiRIWpuYPhUfdR1mBr1bF4ki5oiDQLCtSnGLFCtSaSFBve6WqZywr
MIME-Version: 1.0
X-Received: by 10.112.0.173 with SMTP id 13mr11011535lbf.8.1381394075480; Thu,
	10 Oct 2013 01:34:35 -0700 (PDT)
Received: by 10.112.173.66 with HTTP; Thu, 10 Oct 2013 01:34:35 -0700 (PDT)
In-Reply-To: <2013BC5B-3177-47F4-8914-07A9A8E00AAD@gmail.com>
References: <D14FF4AA-C9DA-40C4-B706-3953E31F1A35@dominion.thruhere.net>
	<2013BC5B-3177-47F4-8914-07A9A8E00AAD@gmail.com>
Date: Thu, 10 Oct 2013 11:34:35 +0300
Message-ID: <CAGNsrLCs1cdVKuskCub08g-XEyS-7rycugTpaoe7mFpKT3_F+w@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Architectures with underscores in their names, how to handle that?
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
X-List-Received-Date: Thu, 10 Oct 2013 08:34:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 10 October 2013 09:30, Khem Raj <raj.khem@gmail.com> wrote:
> why not suggest them to use aarch64eb is that too hard a change ?

We've done it but the counter argument is that toolchains are already
out there with an official release.
The upstream FSF GCC 4.8, Binutils 2.23, EGLIBC 2.18 releases. So
basically the community has accepted the triplet.

> it matches other known Big Endian naming conventions like mips and so on in autotools world.

