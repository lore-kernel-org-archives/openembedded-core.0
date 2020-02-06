Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id C3CA560D18
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 20:33:29 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r18so7411001edl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rL3X4nWIGnWc6SLMku1d2lyPTaPnou1AEr/rxznhhVY=;
	b=qjtPzSLgIjz0DpJWO/IZAuCld1ch6rVpIc5x/oXOduIMj9PN12jTXsRIGbRNT4IJJc
	/eN6HcDLpbGZ+S3y1sKlblarcxkpnu9i4oWU4IYke6F4CEFu1iboHHdaE/HXvqzuyHTG
	yCv8l+r5zCUtNuaB0GxCInlb0VIZCwiKZIv9C/v8knq+aMVcowUWxolm8JfAhPJ5VqlJ
	bx4WWmk/9aiCWAO6cIOY8GvJ2U/fWK61WW+7dAtJmv3zLfmbVatgA+INE/xBe3334jfl
	d/nD3TdY35dMDAXTMdTzdrPbxK1eF5F3KYsmCkU7nInKMAMdmo9V3W2ugXebJiqkCjgl
	zukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rL3X4nWIGnWc6SLMku1d2lyPTaPnou1AEr/rxznhhVY=;
	b=e0cK2RnAqxOkS+i8OaCZWLt+U3w09hhrmk6SDa+KqluCnBHLwoVNQzrDowkMFq0pIh
	8sVZk7qE81AhC4taTxcToORzlekKNwoul0mxsuZu3rTcQ4UOy/Q0HZRUTl99wFfidLt1
	1QUZxHZIrRZsRz6i6UxdEftkpwB5VSjS0SMtomAG8u5ouRCtNXysw5cpYxYPbiKE57v/
	zYn289zLgD1MdOmBWtiwFSxue28DFZ55PNfD6WsrdpUIIEDvFkGNhopoQNSm36DQhqza
	pcaBjYKWNTe+SsMRqJT7MgooG2MVhY1X8GBCOng0TW78jFH/yqjz71QDSUEA14FqOs/k
	a4OA==
X-Gm-Message-State: APjAAAX2hYpWFbdpdPZXRuXn9etf2ghaKjy1hYdEHOA8v4AF2GAn9ZAO
	c9ntlhGXGsh4D74+x1UP2kdjay8uJs8XOa9VmSNOqKHl
X-Google-Smtp-Source: APXvYqyHSikO1mrlAqdLHoWWFYVlWn1P4OL92pfc2GKaQZO/tRaZgZoKEK8IwMgcgU59K/QwdUBXlRFSnFfgsVUuYB8=
X-Received: by 2002:a17:906:717:: with SMTP id
	y23mr4578284ejb.339.1581021210317; 
	Thu, 06 Feb 2020 12:33:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
	<CADkTA4PZ4=V2vquGXV7=xPL5GWaPP6PMbg+bBgswCaY0tDDhQg@mail.gmail.com>
In-Reply-To: <CADkTA4PZ4=V2vquGXV7=xPL5GWaPP6PMbg+bBgswCaY0tDDhQg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Feb 2020 15:33:19 -0500
Message-ID: <CADkTA4PKB5+cGq9_y=WyNvYzT9xTnsWC_RX5=toNn=MWkXRdrQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10][v2] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 06 Feb 2020 20:33:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 6, 2020 at 2:12 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Feb 6, 2020 at 12:35 PM <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > v2 adds a 10th patch to the series to fixup a config issue seen
> > with qemuarm64. The other patches are unchanged.
>
> Hold on queuing this quite yet.
>
> On a clean build/test on a second machine, I saw the error pop back
> up. I'll follow up shortly, once I've had a chance to look at that and
> see if I missed something.

There were some missing directories during the builds that showed
errors, but I've since removed tmp and things are building through the
kernel now.

As such, I don't have an updated patch and this series should be good
.. but I'll be waiting to see if the AB runs into what I saw.

Bruce

>
> Bruce
>
> >
> > The original pull request text follows:
> >
> > ---------
> >
> > Hi all,
> >
> > I've kept the v5.4 content changes, as well as the kernel version default
> > changes out of this series and instead focused it on the collection of
> > kernel-yocto and kern-tools tweaks that I've gethered over the past few
> > weeks.
> >
> > I have Martin's gold linker fixes included, as well as the re-org'ing of
> > the linux-yocto tasks that Paul Barker did to make it usable as a single
> > inherit of the bbclass.
> >
> > I also have a defconfig detection fix included that was sent to the list.
> >
> > I was able to confirm that my configuration was the same with this series
> > enabled, and I was able to boot.
> >
> > That being said, I'll keep my eye out for any AB fallout and will continue
> > some more build locally .. but I wanted to get this out today as promised.
> >
> > Cheers,
> >
> > Bruce
> >
> > The following changes since commit 3c6978c8db59f152693f9fae65dbab13ecfcaad4:
> >
> >   kernel-yocto.bbclass: export LD in the environment used by kconf_check (2020-02-04 15:56:29 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.pokylinux.org/poky-contrib zedd/kernel
> >   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> >
> > Bruce Ashfield (3):
> >   kern-tools: tweak symbol_why to be python safe
> >   kern-tools: integrate merge_config fix for gold linker
> >   kern-tools: fix merge_config when LD contains parameters
> >
> > Gavin Li (1):
> >   kernel-yocto: fix defconfig detection in find_sccs()
> >
> > Martin Jansa (3):
> >   kern-tools-native: use more common S value and oe_runmake
> >   kernel-yocto.bbclass: set KERNEL_LD also for merge_config.sh
> >   kernel-yocto.bbclass: do_kernel_configme: don't use +errexit,
> >     merge_config_build.log and fail when /.config wasn't created
> >
> > Paul Barker (3):
> >   kernel-yocto: Move defaults and tasks from linux-yocto.inc into
> >     bbclass
> >   kernel-yocto: Drop setting of unused variables in do_kernel_metadata
> >   kernel-yocto: Only override CONFIG_LOCALVERSION if
> >     LINUX_VERSION_EXTENSION is set
> >
> >  meta/classes/kernel-yocto.bbclass             | 49 +++++++++++++------
> >  .../kern-tools/kern-tools-native_git.bb       | 13 +++--
> >  meta/recipes-kernel/linux/linux-yocto.inc     | 21 --------
> >  3 files changed, 42 insertions(+), 41 deletions(-)
> >
> > --
> > 2.19.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

