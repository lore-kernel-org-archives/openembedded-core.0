Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 92F137297F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 03:40:02 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id z12so3267989lbi.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 19:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Fs5Ur+MQoNS4udQeCP37XVaL0DUJUeeSMKqzVIOH18k=;
	b=rHrfZh1//Lv1H8WjLy6sIBgeS/k0G8dPGiUMr8exwrQJIX76iQACC6zXh8YI1EcwVl
	MFWz2TEOMtjBWVjksJuAPhWI7IrJXs8jeSCarX/qFPbxQ6LWEsUibbU49j27W5QQu76S
	usSsnBcrBIUPZr+3wbJ4SDM6mxT4KnlO5Zvz3fZyM72c3nbxLGhhU+lmp8mXAR2CSCXo
	JGKd11rrBzNz4Rrd8+fYKAhRA5fVxho3cCVNgYnapLGL2JkmRZLLjfALG3ba6Wv4F2l0
	ZAvE+ecS1C7cZwh5PdKipQaygO/wlP9Wmz+exky7zxDxTIj6RAEvOLQABphWRIZs1ZAS
	GYiA==
MIME-Version: 1.0
X-Received: by 10.112.167.228 with SMTP id zr4mr19898541lbb.20.1419219602293; 
	Sun, 21 Dec 2014 19:40:02 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Sun, 21 Dec 2014 19:40:02 -0800 (PST)
In-Reply-To: <1419165346.13316.55.camel@linuxfoundation.org>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
	<1418994949.13316.16.camel@linuxfoundation.org>
	<1419074109.13316.31.camel@linuxfoundation.org>
	<54959211.9020504@windriver.com>
	<1419115211.13316.47.camel@linuxfoundation.org>
	<54962AAB.9040800@windriver.com>
	<1419161257.13316.49.camel@linuxfoundation.org>
	<1419165346.13316.55.camel@linuxfoundation.org>
Date: Sun, 21 Dec 2014 23:40:02 -0400
Message-ID: <CADkTA4Odqgu0UtsC6ZTg-Y+aZhi+KW_M0dO0xVEXAdQAW_8y=g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Mon, 22 Dec 2014 03:40:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 21, 2014 at 8:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2014-12-21 at 11:27 +0000, Richard Purdie wrote:
>> On Sat, 2014-12-20 at 21:04 -0500, Bruce Ashfield wrote:
>> > On 2014-12-20 5:40 PM, Richard Purdie wrote:
>> > > On Sat, 2014-12-20 at 10:13 -0500, Bruce Ashfield wrote:
>> > >> On 2014-12-20 6:15 AM, Richard Purdie wrote:
>> > >>> So where are we at?
>> > >>>
>> > >>> Thanks to some great help from Ross, we have a number of patches merged
>> > >>> and many of the issues in my last email have been addressed. I'm
>> > >>> continuing to struggle with the kernel series. The last build on the
>> > >>> autobuilder highlighted that:
>> > >>>
>> > >>> * there are problems in boot-directdisk.bbclass (have a fix)
>> > >>> * there is a do_rootfs/do_package_qa race (have a fix)
>> > >>> * the report-error.bbclass tasks could crash (have a fix)
>> > >>> * the kernelmodule sanity tests were failing (have a fix)
>> > >>> * qemumips gdb is failing to compile, probably due to new kernel
>> > >>>     headers (no fix as yet)
>> > >>> * systemd sanity QA tests continue to fail on xorg and systemd-login
>> > >>>     (no fix as yet)
>> > >>> * there are continuing problems with linux-imx from meta-fsl-arm, I
>> > >>>     thought these were addressed but clearly not :(
>> > >>>
>> > >>> Ideally I'd like to take some time off over the holidays but I can't see
>> > >>> that happening until the patch queues are under some kind of control :(.
>> > >>
>> > >> Let me know if there are one of these that you want me to take. I'm all
>> > >> for pitching in and getting everyone some down time.
>> > >
>> > > Looks like I spoke too soon:
>> > >
>> > > https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/132/steps/BuildImages_1/logs/stdio
>> >
>> > Amazing how those race conditions pop out on the builders .. I probably
>> > built this 100 times, and never managed to trigger these.
>>
>> We also have one more:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/134/steps/Running%20Sanity%20Tests/logs/stdio
>>
>> On target module building for ppc fails.
>>
>> > > which seems to be a race over the kernel source directory. I'm guessing
>> > > the file in question is a temporary build artefact of lttng-modules
>> > > which was running at the same time? Any way we can avoid temp files in
>> > > the kernel source dir?
>> >
>> > Hmm. The modules should already have their output directory set to their
>> > own source (not the kernel), so they really shouldn't be dropping down
>> > any temp files.
>> >
>> > I was only using the cpio method to copy the source since that is what
>> > was already being used .. and it is a bit faster. The stat of the
>> > files to the pipe is what is catching us here.
>> >
>> > The question is .. do we really care ? A straight copy of the files wouldn't
>> > be so sensitive to this, or we could explicitly exclude then in the
>> > existing cpio pipe. That would buy some time to track down what is
>> > touching down the tmp file in the kernel build process, and I can't see
>> > how the dual use of that staged directory will cause us a problem on
>> > the copied kernel source side (we do clean things up before packaging).
>>
>> Well, I think we need to get to the bottom of this. I made some
>> experiments. The best results were from hacking scripts/Kbuild.include
>> where these .tmp files get created, I hacked it not to remove them.
>>
>> When you do that, it becomes clear that do_make_scripts is the task
>> which is causing the problem.
>>
>> The world has changed since we last visited the scripts problem, we
>> could move that task to the main kernel build now and have the modules
>> and kernel-devsrc depend on it? The function in module.bbclass would
>> then become a placeholder?
>
> After a lot of trail and error I've sent out a couple of patches for the
> above two issues. These fix the immediate problems however I think there
> is more cleanup than needs to be done early next year.


I replied out of order. I should have read this first. :)

>
> I filed:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7095

I'll grab that.

>
> since the overlap between kernel-dev and kernel-devsrc is problematic
> and should get resolved. This may help resolve the powerpc problem in a
> nicer way if devsrc is *just* the source and dev has some artefacts like
> the build config. It may be we have a separate package for the artefacts
> too, I'm open to ideas.

It's a possibility. I'll throw together some ideas here as well.

Bruce

>
> I did start to experiment with cleaning up the scripts handling in the
> build tree:
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=760fa19a11165ff02c5df38cc89335fc503afba2
>
> I have mixed feelings about it that, we really do need to try and do
> something about it though.
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

