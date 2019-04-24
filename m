Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 90D337D557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:40:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j13so3263709wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 00:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=B0NNyqikn0s0bxrDR30MOohzIJBxtSriUoFefc4O9Nw=;
	b=ddmYElikDAie7hPHa/HYw6e2KjEYJxtXTvrz/u+sm8VOvVLCFGbNXVSrcRpBjroj+3
	LBduNgXehMMUCOqQIJfL1PGSQLN/6wqYZm1+p3jjVhl7b5gruZ5gbUapQalO+0blAXqy
	j97wXOsmdZexobbEYcb1TFOFlSS0fX5Ew+VV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=B0NNyqikn0s0bxrDR30MOohzIJBxtSriUoFefc4O9Nw=;
	b=pN8YgAcr+hwtQqbpVWFSSdW+xBXRbCWZ7qnrAjWZtfKqG/rR66qCwdWV4sJddTmL4O
	ujl/u8h9yaak9009BLbpzvAMh6XNkIc2yZ4vXfJprNiN4jy6UQdiunQKVP2+rKvf3bwM
	NigXjcXJkblwFkAOppzn//CRRakaMqWywIySOQN3j9sWap1jkplc93YADGDdaKCQcJpB
	1TSgPjKTw7B/2lyBHpJXR0wrjdSt/7JM6nlcZ6RUrKKCMqetDJoSPYjGw485QJIu/YN6
	6r82vp6M1c+vcg1pU7qPNQo/c6isAN6PjtTyAqSOazd2bxkalqnVmjS78YEmI0bIf/DH
	q2xw==
X-Gm-Message-State: APjAAAXLIgRzRirizV4c4owDyV9mpsci2RkjUsWnIJqqb14L9FRGHF/Y
	R0thC9r6y3h0rU3t7tzSnZbaiw==
X-Google-Smtp-Source: APXvYqwtGa65VQZ9P930+m9QWWLuhXwO+oCQByUZShXLz+CAVwqpmLe6qjxGHjJixM/ESbI/7S+WQQ==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr5638284wmk.9.1556091604267;
	Wed, 24 Apr 2019 00:40:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v1sm17787145wrd.47.2019.04.24.00.40.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Apr 2019 00:40:03 -0700 (PDT)
Message-ID: <f0092d0d82b7fe8fda61bb0baee724926264820f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Tom Rini <trini@konsulko.com>
Date: Wed, 24 Apr 2019 08:40:01 +0100
In-Reply-To: <20190424011742.GE30419@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
	<e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
	<20190424011742.GE30419@bill-the-cat>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Wed, 24 Apr 2019 07:40:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-23 at 21:17 -0400, Tom Rini wrote:
> On Tue, Apr 23, 2019 at 11:22:14PM +0100, 
> richard.purdie@linuxfoundation.org wrote:
> > On Tue, 2019-04-23 at 18:01 -0400, Tom Rini wrote:
> > > On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:
> > > > On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> > > > > This brings us to the current version of vim.
> > > > > 
> > > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > > ---
> > > > >  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-
> > > > > tiny_8.1.1198.bb} | 0
> > > > >  meta/recipes-support/vim/{vim_8.1.1017.bb =>
> > > > > vim_8.1.1198.bb}           | 2 +-
> > > > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > > > >  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =>
> > > > > vim-
> > > > > tiny_8.1.1198.bb} (100%)
> > > > >  rename meta/recipes-support/vim/{vim_8.1.1017.bb =>
> > > > > vim_8.1.1198.bb}
> > > > > (98%)
> > > > 
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527
> > > 
> > > Does the current version even work in this case?  Digging down
> > > into
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527/steps/7/logs/step1b
> > > there's a certain level of "how does that even work today then?"
> > > that
> > > springs to mind.
> > > 
> > > I need a few more details to know how to reproduce this locally
> > > as I
> > > don't see whatever must be in site.conf/etc to turn regular poky
> > > into
> > > no-x11.  The errors are also around iconv stuff so maybe nls is
> > > also
> > > removed here?  Thanks!
> > 
> > perhaps simpler, qemux86-world also failed:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/515
> > 
> > with:
> > 
> > > /home/pokybuild/yocto-worker/qemux86-
> > > world/build/build/tmp/work/i586-
> > poky-linux/vim/8.1.1198-r0/recipe-sysroot-native/usr/bin/msgfmt:
> > Cannot
> > convert from "ISO-8859-2" to "UTF-8". msgfmt relies on iconv(), and
> > iconv() does not support this conversion.
> > > make[2]: *** [gvim.desktop] Error 1
> > 
> > So perhaps there is host contamination and this works one some
> > build
> > machine setups but not more minimal ones?
> > 
> > The build configuration hasn't changed, just the new version
> > upgrade
> > and the other patch. I suppose its possible it depends which of our
> > workers its built upon but that seems unlikely for two world
> > failures
> > (no-x11 is also a world failure).
> 
> Current poky master-next + my patches (and bitbake -k'ing around
> gobject-introspection-native failing to configure over passing
> -Ddocs=false) and vim builds on a FC29 "Cloud" image + documented
> additional packages off of
> https://www.openembedded.org/wiki/Getting_started

Something odd is going on as I tried this on my local build system and
that failed the same way as the autobuilder. That is an ubuntu 18.04
system, nothing special. I guess this means I should try and figure out
why it breaks. I still suspect something about the native locales
installed...

The gobject-introspection-native issue was dropped from -next fwiw.

What does "locale -a" show for you?

Cheers,

Richard


