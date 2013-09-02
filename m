Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA0F6BF85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 17:08:13 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g17so3302944vbg.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 10:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jSDMKuV3GKEk+ynlVIEIl+CNJb348ISJZvJ38K2ZT90=;
	b=VlbbIqWZidcTdks3OhRPdpKL64w0Z0jHilAtwuGDNSOpTdyKL3huKlnFuChMzeMTtM
	AKdE9layhKvp+02ZxFAOE4QRSteBFmuIQLO37ZzAEqqFvdy1fy+0qo4esJfXuxvmns4/
	xSKnZix8zBUC0u+U0D3pwjDZQSwYb5URf6KPYDVah1tVSSs2bpxlX3HBAJ2q9aMwDqfx
	2g50kZ6gMlqYGzNOKa45QyHyZxhM0emkroKiGS8qspIy6tefEKkcVJRyFtj5DYtKS8j0
	hg/cZXuJl39pWHHmbpImpGe6MYuSfyXyL7jkl3g0CsemL/R2b/nYXlUjw25OHEVJrR0f
	SYjw==
X-Gm-Message-State: ALoCoQlwznxqKrcIdWckHmp6BnRptArFZAgrY/8LSagot9x26J0EavOCCQ9YSQ4rwJm9tm7UlJPY
X-Received: by 10.220.186.202 with SMTP id ct10mr24418227vcb.14.1378141693879; 
	Mon, 02 Sep 2013 10:08:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 2 Sep 2013 10:07:53 -0700 (PDT)
In-Reply-To: <f774e0b175fe470e3df929b79df3c2e669094cb8.1377792006.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<f774e0b175fe470e3df929b79df3c2e669094cb8.1377792006.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Sep 2013 18:07:53 +0100
Message-ID: <CAJTo0LZ72VaQHfJ4bNaNhgm6YpsGTWxCsRKMpD4LGLT5xbfWQg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 12/20] x11vnc: Add PACKAGECONFIG for xfixes, xinerama, xrandr and xdamage
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
X-List-Received-Date: Mon, 02 Sep 2013 17:08:13 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2013 17:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[xfixes] = "--with-xfixes,--without-xfixes,libxfixes"
> +PACKAGECONFIG[xinerama] = "--with-xinerama,--without-xinerama,libxinerama"
> +PACKAGECONFIG[xrandr] = "--with-xrandr,--without-xrandr,libxrandr"
> +PACKAGECONFIG[xdamage] = "--with-xdamage,--without-xdamage,libxdamage"

xfixes/xdamage are incredibly useful for VNC servers.  Can you make
xfixes/xrandr/xdamage dependencies, leaving just xinerama a disabled
option.

Ross

