Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C22E6C0D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 17:42:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u10-v6so1229714pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 09:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vFHDG+wOv1JFHnhGRzJ9FTYcKp6f7IXraK9lM7AV/g8=;
	b=g1xwrwysM2JnVFCA590Aq05rM2yZIXL0WMknMipBcRUY+4cGvf9MOYqT/9XwSjuZXW
	wQpgAMd2jQCcT5cgRp8FXUQ7rscqZ1in6U8rITsQumWM13qajOtX2ytmhCfaxVS2ZpfQ
	3dzs0q8xNSYcDsU6dpFHMC0+Fa3zg+mkb8UCrNvxXnm25KiwsUxuRHtItqpjW0yHQ8St
	fs/EWPMjPYYtk3M7giqrouCDfn8kTWep4bU1FQjxq301fCTV2BZWRnPJkNRY8zVO4/of
	cibsnDDoJ8/qdQseRXR2h0R3PEo2tMXgW2acBlpHYe22+09Ik0Hr43v2eVkS1j51s+dE
	R3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vFHDG+wOv1JFHnhGRzJ9FTYcKp6f7IXraK9lM7AV/g8=;
	b=RSiLw7ij0r6P0DA1ZHN7rvsBddvzXmR/tDDyBnBxnX4HCPan6FlHE+qN3oBgRL9ysM
	dyj4HoMPcdGUXSB3IqVEkMALvOOfdgEG2MmlSJkSMZyBGjJa1T2tN2OQF6CDlga6n5nN
	/RVHv21lHhZazptlt7j+gnRYIBxGQpxL9M6nfRoatpl5O/MUovvexwcxfWvX9exaL6nA
	ztLHtnE4VOLUgINgE6PL5AQePkjis24YlJbuxQvqYT+gqMqD2wohweJjE5ExNRDPgIQx
	C08gk5+fP1D0b+UNUheLsvuY4UlTBN79AYJ3eNudbLrcMKdEA7MCyG5x8g1iCJDnUXgq
	y4Xg==
X-Gm-Message-State: AGRZ1gIF8Ga/X8hXaOm1EeX1AeF0quW77PVqD4kyNUzR7SvX+azfP2Q3
	/f4CsxrIjVTUu4FK0GoLou6/nZ8ekWBcqanx9w0+bw==
X-Google-Smtp-Source: AJdET5dgDImLtWrHUwqde9dcZjFMppGrv98jkvl7PWwxlWiKmVqU3bplP1Cq/7wGUY1K+VlclcBzOrqyy9ndljTZI50=
X-Received: by 2002:a63:df13:: with SMTP id u19mr8309538pgg.294.1541785338064; 
	Fri, 09 Nov 2018 09:42:18 -0800 (PST)
MIME-Version: 1.0
References: <20181107121602.13768-1-nathan@nathanrossi.com>
	<CAAQYJAt5JNxG=mASzPO0XqHLO==v7hKQjxG1-a4eTPD57hfQ3g@mail.gmail.com>
	<CA+aJhH2C6HA8aOnzshbY7DjyYmD0zGs4hh2ZkzZixQggwXNUPA@mail.gmail.com>
	<CAAQYJAu-wfVj3wNVsSdnNZ4ybeGFexaGJHN-bnV9JCWazHFmyQ@mail.gmail.com>
	<CAAQYJAvuy3XPU7h_Y52KSuwSAnNGCPb8nqHqR+FWpjG2oJJ16g@mail.gmail.com>
	<CA+aJhH1+xhJzqNBdLsS3BOUC9jmPYfynAy6Onsj=Cta12CYZhw@mail.gmail.com>
In-Reply-To: <CA+aJhH1+xhJzqNBdLsS3BOUC9jmPYfynAy6Onsj=Cta12CYZhw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 9 Nov 2018 18:42:03 +0100
Message-ID: <CAAQYJAvAAyxydLSxMjvKcpRkjJoUdhojH61tbw0t995W=dKs1g@mail.gmail.com>
To: nathan@nathanrossi.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel-initramfs.bbclass: Separate initramfs setup
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
X-List-Received-Date: Fri, 09 Nov 2018 17:42:17 -0000
Content-Type: text/plain; charset="UTF-8"

</cut>

> > > Hello,
> > >
> > > so I applied both patches and had to comment out (as expected) the
> > > INITRAMFS_TASK.
> > > I have added INITRAMFS_IMAGE_BUNDLE in my 2nd kernel recipe but last
> > > night build did fail: the initramfs.cpio.xz was not found.
> > >
> > > I did only scrub the last lines... will debug later.
> > >
> >
> > Ok, so the problem is copy_initramfs() is done too late and do_compile fails
> >
> > |   /tmp/build/tmp-musl/work-shared/spitz/kernel-source/scripts/gen_initramfs_list.sh:
> > Cannot open 'initramfs.cpio.xz'
> > | /tmp/build/tmp-musl/work-shared/spitz/kernel-source/usr/Makefile:73:
> > recipe for target 'usr/initramfs_data.cpio.xz' failed
> >
> >
> > do_compile log before
> >
> > 1 DEBUG: Executing shell function do_compile
> > 2 Copying initramfs into ./usr ...
> > 3 gzip decompressing image
> > 4 Finished copy of initramfs into ./usr
> > 5 NOTE: make -j ...
> >
> > do_compile with patch applied (build fails):
> >
> > 1 DEBUG: Executing shell function do_compile
> > 2 NOTE: make -j ...
> >
> > Please check again the task order. Thanks.
>
> So the task order is copied from the previous bundle setup (and needs
> to work that way in order to prevent recursive dependency between
> kernel do_install -> image -> initramfs_copy). When I mentioned that
> this should behave similar to your existing setup I did mean there
> were some differences. Specifically you would no longer need to
> CONFIG_INITRAMFS_SOURCE in your kernel config. But in order to get the
> initramfs kernel you would need to get the image generated from the
> bundle. This is deployed separately to the base image type binary
> (<imagetype> vs <imagetype>-initramfs-<machine>.bin). I suspect this
> might be problematic for you to change to? And as such would make it a
> pain to switch away from INITRAMFS_TASK.
>
> Just looking at the task setup again, it might be relatively straight
> forward to keep the INITRAMFS_TASK setup. Where the initramfs_copy
> task is simply set as a dep for the do_compile in only that case (but
> would break the use of BUNDLE in the same kernel). Would you prefer to
> try and keep the INITRAMFS_TASK behaviour working?
>
> Thanks,
> Nathan

Nathan,

if possible I would prefer to adapt our legacy implementation but I
think the whole bundling as intended cannot be done for the 2nd
kernel.
What we want to keep is the possibility to build a 2nd
initramfs-filled kernel living in its recipe without touching
local.conf.

Thus I'd say for the moment please keep the old INITRAMFS_TASK hook.
Thanks

Andrea

<cut>

