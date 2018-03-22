Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8310371B32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 19:19:11 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id j137-v6so12734292ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lD9LpbGsHVBmKdF7yrrsAwV8jZ7NNEtAurqL5O3I1Io=;
	b=dBh/cBNuQJ1Nqxchxh/mPe3I0MTLXxCEgW3aI1QNlIrkb8BP2R2r9dAkm5xbH+ddCc
	GrBt411ItA91IzLBqxNKx8eD/gKl5CSZRlJNW7o9cjuc8pfklTVlkbfGe3uUx1HDel/S
	G4HqLXZvtNOO8h1M90yfUNaAlolZ/3pBSeXAGIwJ9zFPnS8qZiw+K3rH6lqBMqV6Zvc+
	mg4FyeE8tEZ4J0Tf/RmVuAPTHob1R3y/V4nIkM6tVn/gzBBpqzBYjNhMupqYog9jqBHw
	W+mjbKRx3nQLQk2YimY49PwUfYPi0psY4mGSYE+6IPJ9nTCUOg8ylDJHctQXvMrODi/Y
	gdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lD9LpbGsHVBmKdF7yrrsAwV8jZ7NNEtAurqL5O3I1Io=;
	b=JZnNdJUnxfKSY1KL9r51DrkkQiVjw8WCfQsm+OJGULFOmES3UckOHSAHrdBKd2rlIi
	D4u84D+3cFd2m8mVT5alHBTklj/syHe1HJKOb7CUOaE3DGFDYMp9DxT2VK2lz/nMKQn/
	cOUaUWkDxjQ5kIZyS5Nzqjxgq5q72cM1LEwsi/rm1zqedEG6OGof1XNlC0JG5u1l8OAI
	XmTYrYsxjHghlMayYP9N9ypWpNy9/sTc312GVI0hncEiNHqe10cjQmnVaTG8v/4WIlhK
	LUAB3maVvJIb42/fBbQZzUJQX0Pt9gb2cobWN9shqDIFfpfyot/qgBw52SL9Qf9Hnvav
	/cCg==
X-Gm-Message-State: AElRT7Erj7JdMX1N6h6XnBzmPDZEcBVVeE+FDghhZBhIqzhwr0zQ6LpW
	1quSWMVXFuGhetOIu6yj5q3SctrvN1ais5fwCgeHtQ==
X-Google-Smtp-Source: AIpwx483LmWKW4thw+tVupLnf+X1MhrGXeQzuPNKYoSkpepjTRxhx6S3g6TmU1i1mlgBrjjZDUZ+Im+kgrk8xeAvDF0=
X-Received: by 2002:a24:4c0e:: with SMTP id
	a14-v6mr10207724itb.34.1521746352465; 
	Thu, 22 Mar 2018 12:19:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 22 Mar 2018 12:18:52 -0700 (PDT)
In-Reply-To: <CAPGMVzH-rzxfbLnV4BP5zGW_8EJ8bj4W_uu7dNs4UGW-UfW-5Q@mail.gmail.com>
References: <CAPGMVzH-rzxfbLnV4BP5zGW_8EJ8bj4W_uu7dNs4UGW-UfW-5Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Mar 2018 19:18:52 +0000
Message-ID: <CAJTo0LYXoowKcTwW+1TLFUfSsag7u5WwtJZtn3DbqAtsHEF_Lw@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-chicken] networking
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
X-List-Received-Date: Thu, 22 Mar 2018 19:19:11 -0000
Content-Type: text/plain; charset="UTF-8"

As I said yesterday, core-image-sato ships with connman already.  If
the networking UI doesn't have a big [ ] Turn Wifi On button then the
problem is that your kernel doesn't support the wifi hardware.

Ross

On 22 March 2018 at 17:50, Rajath C S <rajathcs.1996@gmail.com> wrote:
> Can you help me setup WiFi connection to poky?
> Im highly struggling with this, I have placed connman in local.conf file ,
> what next is the procedure such that my poky on qemu can detect the WiFi?
> Thanks
>
> On Thu, 22 Mar 2018, 23:18 Rajath C S, <rajathcs.1996@gmail.com> wrote:
>>
>> Cool, thanks!
>>
>> On Thu, 22 Mar 2018, 23:15 Burton, Ross, <ross.burton@intel.com> wrote:
>>>
>>> It contains a CSV module for the Scheme language, it isn't anything
>>> for the user to use.
>>>
>>> CSV files are plain text so any text editor will do.  oe-core has a
>>> vi-clone as part of busybox, or l3afpad if you want something
>>> graphical.  meta-oe has the usual Linux editors: vim, nano, joe.
>>>
>>> Ross
>>>
>>> On 22 March 2018 at 17:41, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>> > Thanks for the tip! But meta-chicken contains a CSV formatter since I
>>> > need a
>>> > CSV editor to my image I thought of using meta-chicken.
>>> > Do you know of any other recipes that has the features of CSV editor?
>>> > Thanks
>>> >
>>> > On Thu, 22 Mar 2018, 23:09 Burton, Ross, <ross.burton@intel.com> wrote:
>>> >>
>>> >> That's a failure in meta-chicken, which isn't part of oe-core.
>>> >>
>>> >> If you need to use meta-chicken then please contact the maintainers of
>>> >> meta-chicken directly.  I do have to wonder if you actually need
>>> >> meta-chicken though.
>>> >>
>>> >> Ross
>>> >>
>>> >> On 22 March 2018 at 17:34, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>> >> > I was including a csv-editor and this error popped up, any
>>> >> > solutions?
>>> >> >
>>> >> > WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-matchable-cross-3.7-r0
>>> >> > do_prepare_recipe_sysroot:
>>> >> > Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> > ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function
>>> >> > failed:
>>> >> > do_install (log file is located at
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
>>> >> > ERROR: Logfile of failure stored in:
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926
>>> >> > Log data follows:
>>> >> > | DEBUG: Executing shell function do_install
>>> >> > |
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
>>> >> > 113:
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
>>> >> > i586-poky-linux-chicken-install: not found
>>> >> > | WARNING: exit code 127 from a shell command.
>>> >> > | ERROR: Function failed: do_install (log file is located at
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
>>> >> > ERROR: Task
>>> >> >
>>> >> >
>>> >> > (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:do_install)
>>> >> > failed with exit code '1'
>>> >> > WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest
>>> >> >
>>> >> >
>>> >> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>>> >> > not found?
>>> >> >
>>> >> >
>>> >> >
>>> >> > Thanks

