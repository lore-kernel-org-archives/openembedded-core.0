Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 18FDD78914
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:45:35 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id m83so11969141ioi.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 10:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=izLidWpscdiyn56qKVLF/4XtE7dZSPFLoEviG1rZQVE=;
	b=TcYh6+UX+q1lCO+ivd1YfqKkZNMnAQ18DanFEeR/smoOJcy6aiGaRfKzv4SEH3yk5j
	u8anmMyDwaG1lX09S5zxcTF3cwSQRBX57n1seDr4YWn6q2li2hVOD6KCqWBBWxx8cuKJ
	/WmvLG+CyNsl6/a4AsIgmqOizzOvpD2JJeJmsqUg5gLbTibuuyRpLY+KfAcfwPTkB3I1
	R36bqg3Jqllu5y56+sa52nCgYAsHzu3Fn5GjJERWLb5oIpYuMgwNDJMHhGvtAVuqEuk2
	ZlnzD5FFJYfsYoW2j0kOg5ywq1VHXw34kaQkiget21Zk+ITIVQ3T/23NWeGWwZsaZ9Sy
	UN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=izLidWpscdiyn56qKVLF/4XtE7dZSPFLoEviG1rZQVE=;
	b=TrLZ//WeMVxGxkxGliOsojulXfZ9M8xKqumvYfppSHRmi4OgbhZmE20CdLp5caTIZe
	xJPodcYvlmTwvCjzhJI0DoZrUMpAI0axbNuHDwT1SqJIu1vPEIGUV8bwSFQbS4JJjrVz
	QC0TFEYB4mdp0RIUDUVnrYKzl2rOxCcYIg3hHVw7baR/3lCGPzIkblW44wR4uRR07QiT
	zfXLVR9ovbPl69+B9s3JZhYYl9CxORU/ByUtDwPqmOEhvB+jRnnOcjML241h5P7nA/bl
	ewRpmnBafX0kc4ixeiNdOViUnpCiG/glfs8W2zPcax8rBbusmyKFbLDPSfayWyf8+xcW
	Kj9A==
X-Gm-Message-State: AElRT7GTmqb+17kEP2J5W2MR9yDETjYKoiWI5CB7oFIIbUQ6PkY7djFD
	TiBx7e0ZkcweRcTD8p+N42kdvIS4DoG9ZvN6fszd2w==
X-Google-Smtp-Source: AIpwx48faU/Cj7YI7CHHRPeS7nmjKGTRFpS3wNVUktJ86FAQ1ePdQ/rqJe4btzGLeyybDQ8yqhkvx8QWfDTdFPtpL9w=
X-Received: by 10.107.201.135 with SMTP id z129mr3739760iof.20.1521740737190; 
	Thu, 22 Mar 2018 10:45:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 22 Mar 2018 10:45:16 -0700 (PDT)
In-Reply-To: <CAPGMVzG_jPgtvsG8jrBGK2sTsf2aKk5rgqq5krk4m6g8UM1sxw@mail.gmail.com>
References: <CAPGMVzEZYNtpjPS3HWy9Q2vOo85X_y1Lb6ZvNpnJLCgvSiQ0bw@mail.gmail.com>
	<CAJTo0LZZwXSNJ2S7Z9zVFJoLkAUUVQ5AGadqR8-u1xcookQcXA@mail.gmail.com>
	<CAPGMVzG_jPgtvsG8jrBGK2sTsf2aKk5rgqq5krk4m6g8UM1sxw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Mar 2018 17:45:16 +0000
Message-ID: <CAJTo0LZxonCG47kdW3u+SJAPVj7e93vXPR8A-xK5L4Fpu9a6Bg@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-chicken]
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
X-List-Received-Date: Thu, 22 Mar 2018 17:45:36 -0000
Content-Type: text/plain; charset="UTF-8"

It contains a CSV module for the Scheme language, it isn't anything
for the user to use.

CSV files are plain text so any text editor will do.  oe-core has a
vi-clone as part of busybox, or l3afpad if you want something
graphical.  meta-oe has the usual Linux editors: vim, nano, joe.

Ross

On 22 March 2018 at 17:41, Rajath C S <rajathcs.1996@gmail.com> wrote:
> Thanks for the tip! But meta-chicken contains a CSV formatter since I need a
> CSV editor to my image I thought of using meta-chicken.
> Do you know of any other recipes that has the features of CSV editor?
> Thanks
>
> On Thu, 22 Mar 2018, 23:09 Burton, Ross, <ross.burton@intel.com> wrote:
>>
>> That's a failure in meta-chicken, which isn't part of oe-core.
>>
>> If you need to use meta-chicken then please contact the maintainers of
>> meta-chicken directly.  I do have to wonder if you actually need
>> meta-chicken though.
>>
>> Ross
>>
>> On 22 March 2018 at 17:34, Rajath C S <rajathcs.1996@gmail.com> wrote:
>> > I was including a csv-editor and this error popped up, any solutions?
>> >
>> > WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-matchable-cross-3.7-r0 do_prepare_recipe_sysroot:
>> > Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> > ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function failed:
>> > do_install (log file is located at
>> >
>> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
>> > ERROR: Logfile of failure stored in:
>> >
>> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926
>> > Log data follows:
>> > | DEBUG: Executing shell function do_install
>> > |
>> >
>> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
>> > 113:
>> >
>> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
>> > i586-poky-linux-chicken-install: not found
>> > | WARNING: exit code 127 from a shell command.
>> > | ERROR: Function failed: do_install (log file is located at
>> >
>> > /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
>> > ERROR: Task
>> >
>> > (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:do_install)
>> > failed with exit code '1'
>> > WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest
>> >
>> > /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
>> > not found?
>> >
>> >
>> >
>> > Thanks

