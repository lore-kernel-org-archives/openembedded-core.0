Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1UJKRZ-0006BO-Ne
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 10:08:57 +0100
Received: by mail-ee0-f42.google.com with SMTP id b47so2509247eek.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=bc7bHLdCPqW/DjhDXzb/eGLPz7yMXe8bzj5PVlSYGYo=;
	b=gBFiNrH/+BZNBq6a2uexja6OKQu6JzRTUxfA/5KpL2FsxmVEnMKQTc4SSviIe81DV+
	gA2ekFjvCo7weLRnK7XlFJiuLArlFrl3yq7xQgiizjoSY/AFFYZxnA8Ef43FLKVJH6to
	+7KBSeMF+YVZPiLbLS+W0C7kg9eWEhrDf54wO7FymfiEG3jqWJnsoqRKBJWLEc02Ucv+
	4tLEBkdQy9D5oA8RqTD59IIIO0H26A1CtdZEazoDWYSo9LJFYIsDlK94TanN2I2UTL95
	C+s5pbhbbckdMgbJQB1hoT31NINMY3DJDxgpEolvtfZ+J08jZakZhvkRm66YG0nPNKMf
	7HSQ==
X-Received: by 10.14.200.137 with SMTP id z9mr12724347een.20.1364028718737;
	Sat, 23 Mar 2013 01:51:58 -0700 (PDT)
Received: from [46.206.74.172] (046206074172.atmpu0019.highway.a1.net.
	[46.206.74.172])
	by mx.google.com with ESMTPS id 44sm7317080eek.5.2013.03.23.01.51.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 23 Mar 2013 01:51:57 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 23 Mar 2013 09:54:37 +0100
Message-ID: <13d9674dbda.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <20130322130648.GT3219@jama>
References: <1363792150-24988-1-git-send-email-Martin.Jansa@gmail.com>
	<13d91230233.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<20130322091549.GC3219@jama>
	<CAC1BbcRfxRkSDfs5g5eWRoHOQYApR0hhuS=rvW_Ryghv0wO50A@mail.gmail.com>
	<20130322130648.GT3219@jama>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.2.20 (build:
	2100226)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Use u-a for getopt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Mar 2013 09:09:03 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 22 March 2013 14:06:48 Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Mar 22, 2013 at 12:51:42PM +0100, Bernhard Reutner-Fischer wrote:
> > On 22 March 2013 10:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > On Fri, Mar 22, 2013 at 09:08:34AM +0100, Bernhard Reutner-Fischer wrote:
> > >> On 20 March 2013 16:09:10 Martin Jansa <martin.jansa@gmail.com> wrote:
> > >> > * when enable busybox installs getopt to ${base_bindir} and
> > >> >   util-linux to ${bindir}, so there is no file conflict, but
> > >> >   because busybox implementation does not support --long used
> > >>
> > >> Do you mean that Busybox' getopt does not support long options?
> > >> If so, enable FEATURE_GETOPT_LONG in busybox instead of this patch?
> > >
> > > Having lsb working correctly even when someone has bad busybox defconfig
> > > is right thing to do, isn't it?
> >
> > Probably. That aside, --long being rejected smells like a bug.
> > >
> > > busybox's getopt supports --longoptions, but util-linux's also supports
> > > --long alias for that and that's what lsb is using
> > >
> > > $ getopt --longoptions
> > > getopt: option '--longoptions' requires an argument
> > > Try `getopt --help' for more information.
> > > $ getopt --long
> > > getopt: option '--longoptions' requires an argument
> > > Try `getopt --help' for more information.
> > >
> > > busybox (IIRC even with FEATURE_GETOPT_LONG enabled) reports
> > > getopt: unrecognized option '--long'
> > > BusyBox v1.20.2 (2013-03-16 17:45:30 PDT) multi-call binary.
> >
> > That's odd, it seems to work for me?
> > $ grep GETOPT .config
> > CONFIG_GETOPT=y
> > CONFIG_FEATURE_GETOPT_LONG=y
> > CONFIG_ASH_GETOPTS=y
> > $ ./busybox getopt --long 2>&1 | head -n2
> > getopt: option '--longoptions' requires an argument
> > BusyBox v1.22.0.git (2013-03-22 11:20:17 CET) multi-call binary.
>
> FWIW I have older version (from danny), but the same problem about not
> using u-a is with master.
>
> > > lsb already RDEPENDS on util-linux, changing lsb to use --longoptions
> > > would be good, but having /bin/getopt and /usr/bin/getopt without u-a
> > > to select preferred one is bad, that's why I used this solution instead.
> >
> > Yes, i see what you mean. Still,
> > a) it should not be required for lsb to RDEPEND on util-linux since
> >    busybox supposedly should work fine too, iff configured correctly, 
> of course.
>
> Yes but I'm not changing that in this commit :) All I want is to make

Yep, OK. :)

> getopt provider deterministic in image. default busybox defconfig does

It should be deterministic, agree.

> not have GETOPT enabled at all:
> meta/recipes-core/busybox/busybox-1.20.2/defconfig:# CONFIG_GETOPT is not set
> meta/recipes-core/busybox/busybox-1.20.2/defconfig:# 
> CONFIG_FEATURE_GETOPT_LONG is not set


>
> so if someone wants to remove util-linux from lsb RDEPENDS, then he
> should also update default config.
>
> > b) busybox's getopt --lo (or other substrings of the
> > -l,--longoptions=LOPT[,...] opt)
> >    should work correctly.
> >
> > I'd like to know why you trip b) above.
> > Do you have CONFIG_FEATURE_GETOPT_LONG set?
>
> I've rechecked and CONFIG_FEATURE_GETOPT_LONG is not set, only
> CONFIG_GETOPT is. But this commit is still valid, I want to use getopt

Given how "fat" any OE distro (except micro) is,  I would strongly 
suggest to turn on FEATURE_GETOPT_LONG anyway.

That is of course not relevant for this very patch of yours, just a 
general remark.
Cheers,

> from util-linux when util-linux is installed.
>
> > If so, what libc are you using?
>
> private external
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


Sent with AquaMail for Android
http://www.aqua-mail.com




