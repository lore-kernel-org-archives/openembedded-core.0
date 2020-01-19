Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69E127E687
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 12:15:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j42so26679401wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 04:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=sT7GfQcP5H+z6NWHrFLSpsTTYwv/kw246bJB6zd8lUU=;
	b=fjxq+7Dg7ysjX/oDk5ZjTfj1wGHINl4n7XyxONioWLXEgWYRqbxHk7ax2vGC347jo+
	ZF5sSQq7PvPhj4Mt5yCj+tNETNFDSVeA+MXhLa0kwAVtEO6Y4/Bt45ghm2MzNq8/SZnT
	PoEr4Nu2U4dvJ4vZ+DsuwH8YIeQh/3izJQnYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sT7GfQcP5H+z6NWHrFLSpsTTYwv/kw246bJB6zd8lUU=;
	b=Ey04BMKZ5NzYC/XGL1ZM9i5xh4SFnp7fDWkiRHSzTUnKNGHiSFaPXFvO8WdVdZRVVC
	YDwSm19uE7CbGieucoPm4F/VniGppjfKLAzjOfhjPH3psJNxfL5ENGod/yQhVES5t+2d
	mEdoH4faXkJ2iVp7ESLikSR1Pz4zAf4S6QLRANXtCHtl6EV/Vc1nDJQII5LWjB45v7qR
	/9IkebKz3rXGoo4nUotG5tjGA+6IEK8Zy2ImurZUR1CbFMDNEeDNsdMf3fDL/vArgiaj
	mtg+KkilWFgCmQ9Vrle9roCAbGCkqI2tJ2rMIcLpyu9sxQ4ZoKC7hnW4zuVPnCvjQnN/
	06HA==
X-Gm-Message-State: APjAAAXc5RBvVQurc61laZRXmAb5CmHDhe2szAw1u5rY8JgzIy6by6GD
	lx/e7bAYtoBdBD5Ip+69yTZ6t4DApjc=
X-Google-Smtp-Source: APXvYqycFXrYYUZLc83gfVWr96nHtTaqX1m171ka3wJITxAeziIhuQ4dWUMzKZ0y8gSUjozJ86TnkQ==
X-Received: by 2002:adf:db84:: with SMTP id u4mr13407930wri.317.1579436123848; 
	Sun, 19 Jan 2020 04:15:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h2sm45503150wrt.45.2020.01.19.04.15.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 04:15:23 -0800 (PST)
Message-ID: <26c295370010ee96d0265b0be5a716aa6bc166ce.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 12:15:21 +0000
In-Reply-To: <0f474dc25b7fb6861101254a2c4fd0301f28e167.camel@linuxfoundation.org>
References: <20200116201933.29628-1-Trevor.Gamblin@windriver.com>
	<0f474dc25b7fb6861101254a2c4fd0301f28e167.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] logrotate.py: improve oeqa test implementation
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
X-List-Received-Date: Sun, 19 Jan 2020 12:15:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-01-18 at 23:16 +0000, Richard Purdie wrote:
> On Thu, 2020-01-16 at 15:19 -0500, Trevor Gamblin wrote:
> > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> > 
> > See bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=13632
> > 
> > Autobuilder tests occasionally fail, reporting that a new logfile
> > could not be created. While this failure did occur multiple times,
> > it
> > could not be manually reproduced. However, there are issues with
> > the
> > implementation of the logrotate.py script that can be fixed. These
> > changes will help make the failures clearer, should they continue
> > to
> > occur.
> > 
> > Previously, the test_2_logrotate test would, after running the
> > logrotate tool, use "ls -al $HOME/logrotate_dir | wc -l" to count
> > the number of files in the rotation directory and determine if the
> > rotation was successful. The test to see if there are at least
> > three
> > files is problematic, because depending on the version of ls used,
> > it
> > may report the target value of 3 even when there are only hidden
> > files
> > in the directory, potentially reporting a pass for the test when it
> > should actually fail. An example with coreutils:
> > 
> > root@qemux86-64:~# ls -al emptydir/
> > total 2
> > drwxr-xr-x 2 root root 1024 Jan 14 19:50 .
> > drwx------ 3 root root 1024 Jan 14 19:50 ..
> > root@qemux86-64:~#
> > 
> > Where "total" is the number of blocks used. Compare with busybox
> > ls:
> > 
> > root@qemux86-64:~# ls -al emptydir/
> > drwxr-xr-x    2 root     root          1024 Jan 14 19:54 .
> > drwx------    3 root     root          1024 Jan 14 19:54 ..
> > root@qemux86-64:~#
> > 
> > Instead of using ls to verify that a certain number of files exists
> > in $HOME/logrotate_dir, the tests have been changed to rotate two
> > specific logs: the log for wtmp and a new logrotate_testfile
> > created
> > during the second test. Both tests check that the logs are
> > correctly
> > rotated into $HOME/logrotate_dir by using find and grep on the
> > expected filename (e.g. "wtmp" when rotated becomes "wtmp.1", so we
> > check to see that wtmp.1 is present in $HOME/logrotate_dir). In
> > addition, should the test fail, the directory listing is included
> > in
> > the log to aid debugging.
> > 
> > Finally, note that while the autobuilder failures that this patch
> > addresses were only seen during core-image-full-cmdline tests,
> > these
> > changes were successfully tested on core-image-minimal and
> > core-image-sato with the manual addition of logrotate and openssh-
> > sshd
> > to the images.
> > 
> > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> Thanks for this, I haven't looked in detail but test builds came back
> with:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1464

Also:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1467
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1471
(but there was a pass for the above target too:
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1468)
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/1464
(interesting 1c and 2c failed)
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/216
(may be related, systemd logrotate failure)

Cheers,

Richard



