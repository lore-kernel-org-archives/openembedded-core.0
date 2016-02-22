Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 005487316B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 02:08:59 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id y89so101947522qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 18:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YVfpmR5sSPzLJplxw8YEDYAqheawXioY5+FHiCJW4Og=;
	b=lWz9YR9P7w4sPIIAhplS8wXaQ71eRmFGzt/TzkyOlOGuzUcFgUq9bt+5gsMMOONeog
	9nKswW5k+yz8Ct9WPCMeCrz+rDfoDQXP7Xb/gWzFMk8E2vZpCisc09Oj73AGbYWfa5x8
	8bDbH7hwyqd0Md1s0TFy164Oc6Vvt0iCAYGM+xplocer5dyx6ewFgo2M0ofs/iE4B4Kj
	4ucz82Sv83pCvMXeQVieBWMoykPEcM+TG+KfVjCIunsyB8cLaijQFUUk27Hdn96EZJhL
	MBmgTWCARoE5EMnLwzX2qdKj1qYOI72vfwdRvXl7rC/vYeDWJhmzj/JUV00DHKfM7xOo
	AvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YVfpmR5sSPzLJplxw8YEDYAqheawXioY5+FHiCJW4Og=;
	b=AviHzqMUG/yA4kdjYsyDzy6MCMAPJmxppwlCz9DAYI9pNcEWJ7QsDknMJm5zayg2UB
	YKWzaFv9VXOQyU2i+31ZQNGCLo1bDvAPYIzz8TAXzrXtIysH3/0A9Mmm/9timtrE7GjN
	x6tXhN+CCAPMlTrMoKi0B0JD87FYrHZ9HQeZn1gkGXoiArGUfd7FQebUHueiz3lRU4lx
	9BNK0MIvC/WT1qh1y87YYOPVjVBXbwgxlfdjFi97KLgRUlnwNcp5TInK2WFauHjTKPSk
	xNtjuIzSjwelSHWpnDABzm4xxvDjvG+Z0swxFPsmA9nHzrRnpbliRp12PQp7IKC1naZA
	eSlQ==
X-Gm-Message-State: AG10YORCaNiw/8mxUoCQjJFY5h0kJzv2TXbNpgy+9Aa3n2mPK46Mq9Io48fiau+0P3zN+UokTuQGx6Wq6Wk4MA==
X-Received: by 10.140.254.9 with SMTP id z9mr32884585qhc.5.1456106940143; Sun,
	21 Feb 2016 18:09:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 21 Feb 2016 18:08:30 -0800 (PST)
In-Reply-To: <5174C2003D56485DACF46FA90CEFE553@RD3>
References: <5174C2003D56485DACF46FA90CEFE553@RD3>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Feb 2016 18:08:30 -0800
Message-ID: <CAMKF1srxScqs8C6xDyKSiU06WN00g_BJuijOz3SA3ugqNE1i_A@mail.gmail.com>
To: winiston@futuraautomation.com
Cc: OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: Error building core-image-sato
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
X-List-Received-Date: Mon, 22 Feb 2016 02:09:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 17, 2016 at 9:02 PM,  <winiston@futuraautomation.com> wrote:
> Dear,
>
> I tried to build core-image-sato. It spits out the following error.
>
> winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-sato
> Parsing recipes: 100% |###############################| ETA:  00:00:00
> Parsing of 1060 .bb files complete (0 cached, 1060 parsed). 1496 targets,
> 138 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'xf86-input-tslib' (but
> /home/winiston/poky/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'xf86-input-tslib' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['xf86-input-tslib']
> NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['packagegroup-core-x11-xserver', 'xf86-input-tslib']
> NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base',
> 'packagegroup-core-x11-xserver', 'xf86-input-tslib']
> ERROR: Required build target 'core-image-sato' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-sato',
> 'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver',
> 'xf86-input-tslib']
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> winiston@winiston-VirtualBox:~/poky/build$
>
> How do I resolve this error?

whats the content of your bblayers.conf, do you have some
modifications to default configuration ?

>
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

