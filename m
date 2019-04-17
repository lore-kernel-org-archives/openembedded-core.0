Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id C30BC6D147
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:23:38 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id e5so20002275oii.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 06:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tu0Rk/GnsouehbphmmBEnyUQw511HSs8XOhrmbRFVlg=;
	b=rlPIfaTu0TwI7i+JUaf1catf0Zi6V45U3l+ZioK0RpkW+TrRSEbGphizSsgTIgNSW1
	+0fuE/rXBZ/hxYQhjpt9D1D4idw8svntZIFU7VPx+xNUdXuFOd8HBitSLYqqDnHfFH1r
	9rgVAO8AvWSKu+r0Pw7Ei/9OIcS4dq/6HBAg7JSSUoVheT3E6rQXYqOE29U3/fnvUAJT
	FLWSKDFXqBQ4KLqMD8NGXx60Ko/i0c2jN7GidgY4CG583mL6vwKKihhLcwFcG7/szaTx
	+sRcGTN76N0+qsZSnoPTbmnZWv1L9Jv8Hqolcw7zR+r1gAYwoWu+y3Q/YwO8Etm9DiKn
	iZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tu0Rk/GnsouehbphmmBEnyUQw511HSs8XOhrmbRFVlg=;
	b=L93ihg3V5bw9GLZEuFWO09M+LkzK9e4TbnINi5DOqDB+Kc/fDtEURJc3bO2VqZGgwO
	AT+LTIXnAT6pVTUwguQJumbY9KmugR14A92Gs4xH2wMqhsGAyz88+4J6Sx5HJrCeTZRJ
	7OL7xDF0BaZEiR/aO9Js8YDdLnxJbKKLHJgFtI5WDKENrNh75CR0LMGerrqG91W718+t
	7zA6VSxvn5QAh1I4tn6ymYqrdQTIF1liykQ08QgKPPooeno7yVmLeXkpIXecaj1J+tnS
	rWV6GSSlFY9z9s0bLETfW6b/IdVl0BrkLu72xExUkaZZTo2a11d9y7emOHbz6uE/lsn7
	O8og==
X-Gm-Message-State: APjAAAWT28v7DvpFa+Fg4nsus9hFujszx0gH3VKNd30nwBeE5Xg7GgAJ
	Ws2f6tZbJLE1fozpVAPqnQEdzUp6KKym/+ED9mh1vA==
X-Google-Smtp-Source: APXvYqzGhPyVWSzwfrGBPPAEz3GKvuuOJtOgezzrL5C61r2Hb3PAEQCC2/SC86gXuI6qpe7qR2fiMkSIztvttgSXy5o=
X-Received: by 2002:aca:ed88:: with SMTP id l130mr25452942oih.70.1555507419592;
	Wed, 17 Apr 2019 06:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190417063944.65623440004@auh.yoctoproject.org>
	<20190417131842.GA4664@bill-the-cat>
In-Reply-To: <20190417131842.GA4664@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Apr 2019 15:23:23 +0200
Message-ID: <CANNYZj9dFvhw8jRw305ugGxtHfHJtjdMQZqbKCbP-LNX-GnEXw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] vim: upgrading to 8.1.1174 FAILED
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
X-List-Received-Date: Wed, 17 Apr 2019 13:23:39 -0000
Content-Type: text/plain; charset="UTF-8"

I think this is actually a devtool issue, where it won't expand the
LICENSE path properly if there is a .. in it.
Try 'devtool upgrade vim' and you should see the same error.

Alex

On Wed, 17 Apr 2019 at 15:19, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Apr 16, 2019 at 11:39:44PM -0700, auh@auh.yoctoproject.org wrote:
>
> > Hello,
> >
> > You are receiving this email because you are the maintainer
> > of *vim* recipe and this is to let you know that the automatic attempt
> > to upgrade the recipe to *8.1.1174* has Failed (devtool error).
> >
> > Detailed error information:
> >
> > The following devtool command failed:  upgrade vim -V 8.1.1174 -S 8dc4c7292364d31cfb8afa8a67984b78b657b192
> > NOTE: Starting bitbake server...
> > NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
> > WARNING: Layer workspacelayer should set LAYERSERIES_COMPAT_workspacelayer in its conf/layer.conf file to list the core layer names it is compatible with.
> > Loading cache...done.
> > INFO: Extracting current version source...
> > Loaded 1303 entries from dependency cache.
> >
> > Summary: There was 1 WARNING message shown.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           = "1.43.0"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "i586-poky-linux"
> > MACHINE              = "qemux86"
> > DISTRO               = "poky"
> > DISTRO_VERSION       = "2.7+snapshot-20190417"
> > TUNE_FEATURES        = "m32 i586"
> > TARGET_FPU           = ""
> > meta
> > meta-poky
> > meta-yocto-bsp       = "tmp-auh-upgrades:d8076ffc00fad478a50510b864fc59e77d95217b"
> > workspace            = "<unknown>:<unknown>"
> >
> > Initialising tasks...done.
> > NOTE: Executing RunQueue Tasks
> > NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
> > NOTE: Writing buildhistory
> > Traceback (most recent call last):
> >   File "/home/auh/poky/scripts/devtool", line 344, in <module>
> >     ret = main()
> >   File "/home/auh/poky/scripts/devtool", line 331, in main
> >     ret = args.func(args, config, basepath, workspace)
> >   File "/home/auh/poky/scripts/lib/devtool/upgrade.py", line 555, in upgrade
> >     old_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
> >   File "/home/auh/poky/scripts/lib/devtool/upgrade.py", line 470, in _extract_licenses
> >     with open(os.path.join(srcpath, path), 'rb') as f:
> > FileNotFoundError: [Errno 2] No such file or directory: '/home/auh/build/workspace/sources/vim/../runtime/doc/uganda.txt'
> >
> >
> >
> > Please review the attached files for further information and build/update failures.
> > Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> If I want to trying to debug the AUH, are there any pointers?  It really
> ought to be able to handle vim... Thanks!
>
> --
> Tom
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

