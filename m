Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7B571B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 15:56:58 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id a124so30958980ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=TO7t35ynANiGWHC4GzvCljxpe07nvdEFeGrnqZoUW7M=;
	b=imLa7xTm0dQikWGLFdRKo2x04dOmw1+U5h9093hHH7P5CuYth4SMTPFjvncrP30WNd
	SZYDWTvJ4a1VlIJXVzUDbg6RRj4QpJ7NM+4l5Lyp0Xg8/6Zn1dnyEVoC/JOo1OhI/1rS
	GUnf7Gaq3RjPfZXTpGAilTfmlk5xey75UBDyRafZ9cAtxEWmKvx99IhNOqySRPQsLDaq
	5+Xgo00+Fn4AGUJKUXkzmjiN5b8ZlgnPCgjaOhVSFYPIIsxD1QHWOUQqku+pQEPu2ckm
	r3hNKAwnLAoHo0Kq0HexvHJ5o7SK2dpWrERtwKuM9fUeN0P0uFiyJnOmbAxQhw7xrEqn
	9Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=TO7t35ynANiGWHC4GzvCljxpe07nvdEFeGrnqZoUW7M=;
	b=XeEcVSfNZcB0T3WhIeu49OMUMoeZld5s9bC2nj9gutNw20jBGQ+q3laNpitu4sbGPh
	v2GelWR3q6w+cE5Hn6vkrRGd+20WD77CqWFs6gL1chGqN4EyxSmgT8Z4TUl7N6VujsFc
	JuPTCsX3Quct040xL648L2Wnc6zAHdG9XdDdEwp9AsqiwwRa0mAIB+H3+T90nMfHZRlp
	L2RV6LVv0SWodquOMuOtRcXbOJXwox/VxUOIDRDvypq9A9VxBi5DLNxpmEBabXhu/ojj
	bWSPh6ytKzHJw4fp6u8dvsd4Et9k0PP4VFdTP1saOwZIxUdjDziXU6m8zwXe9/xf54gD
	Ln6Q==
X-Gm-Message-State: AKaTC00Q0vCoexCa9M7IPfVC0m1S+dCFLq5EiYsa4YvA+YcsivzpxvT/Qlh+utIlwk93sFCv
X-Received: by 10.36.28.2 with SMTP id c2mr3606152itc.105.1479916620013;
	Wed, 23 Nov 2016 07:57:00 -0800 (PST)
Received: from pohly-mobl1 (p57A56BE1.dip0.t-ipconnect.de. [87.165.107.225])
	by smtp.gmail.com with ESMTPSA id
	j201sm1040385ita.2.2016.11.23.07.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 07:56:58 -0800 (PST)
Message-ID: <1479916616.31880.48.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Wed, 23 Nov 2016 16:56:56 +0100
In-Reply-To: <20161123132229.GA13863@linux.intel.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Eduard Bartosh <eduard.bartosh@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Wed, 23 Nov 2016 15:56:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-11-23 at 15:22 +0200, Ed Bartosh wrote:
> On Wed, Nov 23, 2016 at 02:08:28PM +0100, Kristian Amlie wrote:
> > On 23/11/16 13:08, Ed Bartosh wrote:
> > > On Tue, Nov 22, 2016 at 12:54:52PM +0100, Kristian Amlie wrote:
> > >> On 22/11/16 12:10, Patrick Ohly wrote:
> > >>>> ...
> > >>>
> > >>> All of these introduce some special mechanism. Let me propose something
> > >>> that might integrate better with the existing tooling:
> > >>>
> > >>> The "rootfs" directory gets redefined as representing the entire virtual
> > >>> file system. When creating a disk image, it gets split up into different
> > >>> partitions based on the image configuration.
> > >>>
> > >>> For example, the /home or /data directories in the rootfs could hold the
> > >>> content that in some image configurations goes into separate partitions.
> > >>>
> > >>> The advantage of this approach is that the tooling for staging content
> > >>> for image creation does not need to be changed. The same staged content
> > >>> then can be used to create different images, potentially even using
> > >>> different partition layouts.
> > >>
> > >> That's a very good idea. I think it beats all of my suggestions!
> > >>
> > >>> To implement this approach with wic, wic needs to be taught how to
> > >>> exclude directories from the main rootfs. Ideally, the mkfs.* tools
> > >>> should also support that without having to make an intermediate copy of
> > >>> the files for a certain partition, but initially wic could create
> > >>> temporary directory trees.
> > >>
> > >> Yes, some work would be needed here, but ultimately it would be contained within wic and related tools, which is a good thing.
> > >>
> > > 
> > > I support the idea. Let's discuss the details of implementation and
> > > create a bug in bugzilla to track the development 
> > 
> > Do you want me to create the ticket? (it'll be my first, so apologies in
> > advance if I omit something important)
> > 
> > > This can be done by extending existing rootfs plugin. It should be able
> > > to do 2 things:
> > > 
> > > - populate content of one rootfs directory to the partition. We can
> > >   extend syntax of --rootfs-dir parameter to specify optional directory path to use
> > > 
> > > - exclude rootfs directories when populating partitions. I'd propose to
> > >   introduce --exclude-dirs wks parser option to handle this.
> > > 
> > > Example of wks file with proposed new options:
> > > part /     --source rootfs --rootfs-dir=core-image-minimal       --ondisk sda --fstype=ext4 --label root --align 1024 --exclude-dirs data --exclude-dirs home
> > > part /data --source rootfs --rootfs-dir=core-image-minimal:/home --ondisk sda --fstype=ext4 --label data --align 1024
> > > part /home --source rootfs --rootfs-dir=core-image-minimal:/data --ondisk sda --fstype=ext4 --label data --align 1024
> > > 
> > > Does this make sense?
> > 
> > Looks good. The only thing I would question is that, in the interest of
> > reducing redundancy, maybe we should omit --exclude-dirs and have wic
> > figure this out by combining all the entries, since "--exclude-dirs
> > <dir>" and the corresponding "part <dir>" will almost always come in
> > pairs. Possibly we could mark the "/" partition with one single
> > --no-overlapping-dirs to force wic to make this consideration. Or do you
> > think that's too magical?
> >
> Tt's quite implicit from my point of view. However, if people like it we
> can implement it this way.

I prefer the explicit --exclude-dirs. It's less surprising and perhaps
there are usages for having the same content in different partitions
(redundancy, factory reset, etc.).

Excluding only the directory content but not the actual directory is
indeed a good point. I'm a bit undecided. When excluding only the
directory content, there's no way of building a rootfs without that
mount point, if that's desired. OTOH, when excluding also the directory,
the data would have to be staged under a different path in the rootfs
and the mount point would have to be a separate, empty directory.

I'm leaning towards excluding the directory content and keeping the
directory.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




