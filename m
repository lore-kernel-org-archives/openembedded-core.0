Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5CF72366
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 13:01:31 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so3087049ykt.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 05:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=wn+J1qlYzUx6ppJV3v4gynhhqs9deygzF71inqJqKfM=;
	b=pRBYup/50g53+OKNsCFgFU9PY3EmVNF7Jee7cJix7/8Dm7HwqtgrnVWt89facQu6DA
	fhVQNkJTp32pX3u8lstaX0LMNX7mEQyfm7KIb/5VRS3nuTD81aUnDnKb8mAvyRq0ux/g
	ErL0z/hkS4IrY1PqrNd+w3hALejYXVxr/OHBT11VKxneRDC3BRXgI4NtfZUbHU18jwrE
	EiKPPe3vYj46A4uydBtoaADxAaYfOVOz8zhrDQBiO6BhR5aKov06MzcRQxQq1BjiDZEc
	Mz0I23YX9uMa2eLwmXXjEcpJR96TL5DmSV6rVqwhtaibKl1++txp8sPl9UONqVIG7g2P
	hZXw==
MIME-Version: 1.0
X-Received: by 10.236.39.139 with SMTP id d11mr11487183yhb.90.1418389292447;
	Fri, 12 Dec 2014 05:01:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Fri, 12 Dec 2014 05:01:32 -0800 (PST)
In-Reply-To: <1836192.Oio3XIGmkc@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<5489EDA6.1000709@linaro.org> <5489F3EC.1090206@linaro.org>
	<1836192.Oio3XIGmkc@peggleto-mobl5.ger.corp.intel.com>
Date: Fri, 12 Dec 2014 11:01:32 -0200
X-Google-Sender-Auth: H2zeEcBQQJ-KfCBATmJzI-FnY-k
Message-ID: <CAP9ODKov3sLwKdjeWoZ_UnJwVH0RdrOY=Ji1EZB8uL+g9w52pQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Fri, 12 Dec 2014 13:01:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 11, 2014 at 7:35 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 11 December 2014 14:43:40 Trevor Woerner wrote:
>> On 12/11/14 14:16, Trevor Woerner wrote:
>> > Oops! (this worked before the "git pull")
>> >
>> >     $ devtool add xannounce ~/devel/yocto/build/workflow/xannounce/
>> >     NOTE: Creating workspace layer in
>> >     /home/trevor/devel/yocto/build/workflow/build/workspace
>> >     NOTE: Recipe
>> >     /home/trevor/devel/yocto/build/workflow/build/workspace/recipes/xannou
>> >     nce/xannounce.bb has been automatically created; further editing may
>> >     be required to make it fully functional
>> >
>> >     Traceback (most recent call last):
>> >       File
>> >
>> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/devtool",
>> >     line 274, in <module>
>> >
>> >         ret = main()
>> >
>> >       File
>> >
>> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/devtool",
>> >     line 267, in main
>> >
>> >         ret = args.func(args, config, basepath, workspace)
>> >
>> >       File
>> >
>> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/lib/devtool
>> >     /standard.py", line 68, in add
>> >
>> >         _add_md5(config, args.recipename, recipefile)
>> >
>> >       File
>> >
>> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/scripts/lib/devtool
>> >     /standard.py", line 218, in _add_md5
>> >
>> >         md5 = bb.utils.md5_file(filename)
>> >
>> >       File
>> >
>> >     "/home/trevor/devel/yocto/build/workflow/meta-poky/bitbake/lib/bb/util
>> >     s.py", line 463, in md5_file
>> >
>> >         with open(filename, "rb") as f:
>> >     IOError: [Errno 2] No such file or directory:
>> >     '/home/trevor/devel/yocto/build/workflow/build/workspace/recipes/xanno
>> >     unce/xannounce.bb'>
>> > Sure enough...
>> >
>> >     $ devtool-workflow> tree workspace/
>> >     workspace/
>> >
>> >     |-- appends
>> >     |-- conf
>> >     |
>> >     |   `-- layer.conf
>> >
>> >     `-- recipes
>> >
>> >         `-- xannounce
>> >
>> >     4 directories, 1 file
>> >
>> > whereas before it was:
>> >     $ tree workspace/
>> >     workspace/
>> >
>> >     |-- appends
>> >     |
>> >     |   `-- xannounce.bbappend
>> >     |
>> >     |-- conf
>> >     |
>> >     |   `-- layer.conf
>> >
>> >     `-- recipes
>> >
>> >         `-- xannounce
>> >
>> >             `-- xannounce.bb
>> >
>> >     4 directories, 3 files
>> >
>> > For some reason my recipe and bbappends are not getting created :-(
>>
>> bisecting (manually) leads to this commit being safe:
>>
>> ea50ec527483eb3a094588858baebd5fb23f71c6 devtool: rename deploy/undeploy
>> to deploy-target/undeploy-target
>>
>> and this one introducing the problem:
>>
>> 770f203f73f358ce3c6c5ac12fe2775b812bdc6b devtool: fool bitbake into
>> thinking it's outputting to a terminal
>
> Thanks for the quick bisect - I've fixed it so that wrapper is only used when
> running bitbake through "devtool build", and now "devtool add" works properly
> again. This is why I should probably write some proper tests before trying to
> do anything further...

Agreed. I think a good unittest needs to be include sooner than later
as the more it grows, the harder will be to cover all usecases with
tests.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

