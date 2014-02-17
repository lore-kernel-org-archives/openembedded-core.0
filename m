Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0C26E7D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 18:58:33 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id y1so11647536lam.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 10:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version:content-type;
	bh=JOz/Xra5v9D0lypWWgEOuuWvFuzXrXxcQrR2+MieLt0=;
	b=D9wpOYRL4ibPPh+N6tQOEY/nXlzAscQuMXiza+DzIamxq/hKX1TVvMiPBfBVRHvGwK
	ihQXNe2k+iLX23oerCGDwbjmjV7urmfxJnZ8bW/enineorzLRgPROPTaV8f+sJIWWEXS
	uRXJ6UfX4ShtKwT0eOzayrsulPu3uxA4zqSerPksadwZIdhovQgYZAB8Hc3DGDvl8WGS
	IVv320TpVxePtEfdGSug3r2zlUnCPsu4+KS95/PbR6Za7EGvB5/FvHsNlJnrnTs67O/u
	U8TUxr/GqMa3MX9EX2ccXVKczwOWDdUImU0e5xKFd+W23wklXKJaxai9vutvfcjZSJ4C
	6tWA==
X-Received: by 10.152.4.68 with SMTP id i4mr18380420lai.8.1392663512801;
	Mon, 17 Feb 2014 10:58:32 -0800 (PST)
Received: from [192.168.0.156] (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id o10sm27199632laj.2.2014.02.17.10.58.32
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Feb 2014 10:58:32 -0800 (PST)
Date: Mon, 17 Feb 2014 19:57:07 +0100 (CET)
From: Jacob Kroon <jacob.kroon@gmail.com>
X-X-Sender: jkroon@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1sr14p-RtkTpK8FcYA3PjDExfxq_qJZfX3k0c0sKy5AzdQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1402171954550.26476@localhost.localdomain>
References: <CAMKF1sr14p-RtkTpK8FcYA3PjDExfxq_qJZfX3k0c0sKy5AzdQ@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error: The image creation script fails
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
X-List-Received-Date: Mon, 17 Feb 2014 18:58:33 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Mon, 17 Feb 2014, Khem Raj wrote:

> ERROR: Error: The image creation script
> '/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar'
> returned 1:
> ./
>
> WARNING: /home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar:1
> exit 1 from
>  bzip2 -f -k core-image-minimal-qemux86-20140217182225.rootfs.tar
>
> ....
>
> ERROR: Function failed: do_rootfs
> ERROR: Logfile of failure stored in:
> /home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/log.do_rootfs.20070
> ERROR: Task 7 (/home/kraj/oe-core/meta/recipes-core/images/core-image-minimal.bb,
> do_rootfs) failed with exit code '1'
>
>
> looking as log.do_rootfs
>
>
> DEBUG: Shell function prelink_image finished
> NOTE: Running image creation script for tar:
> /home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar
> ...
> NOTE: Running image creation script for ext3:
> /home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.ext3
> ...
> 0+0 records in
> 0+0 records out
> 0 bytes (0 B) copied, 2.7118e-05 s, 0.0 kB/s
> mke2fs 1.42.9 (28-Dec-2013)
> debugfs 1.42.9 (28-Dec-2013)
> bzip2: Can't open input file
> core-image-minimal-qemux86-20140217182225.rootfs.tar: No such file or
> directory.
> ERROR: Error: The image creation script
> '/home/kraj/oe-core/build/tmp-uclibc/work/qemux86-oe-linux-uclibc/core-image-minimal/1.0-r0/temp/create_image.tar'
> returned 1:
>
>
> I am seeing this starting today with pure oecore
>
> Build Configuration:
> BB_VERSION        = "1.21.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-12.04"
> TARGET_SYS        = "i586-oe-linux-uclibc"
> MACHINE           = "qemux86"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta              = "staging:e114cc405bd98ebbe5376e094842c9d49e7ca9b8"
>
> staging has few patches on top but they were same working few days ago
>
> any ideas ?

I saw this aswell today, temporary reverting 
9d9bca8785911e8ae06d507bbfb99d6a811f072e 
in OE-core worked for me.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

