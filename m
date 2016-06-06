Return-Path: <koen.kooi@linaro.org>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id A3F7A771B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 06:16:25 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id b73so87659418lfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 23:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FEUp2APDbCOVVRssiApLofekPotF1vzAa5S7DCNgY/Q=;
	b=euja9z0JTPZio56H1wCdiwtCGrcmDH94RyizlRHfZd9nHyBu9rTdbH1KuozOM70df+
	5pIHtEBZWfqyfUJiLI3ssV3bk/KNoFSyjB73HpuiRU3FJbxMtrf0qiLv8O5Hlzv9LIza
	Vy9xLv0E/pBdFbRdYE02y4CdrpVKwP+W7YCRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FEUp2APDbCOVVRssiApLofekPotF1vzAa5S7DCNgY/Q=;
	b=dWuFi8YUTYM3QPwf5nOQpGrVN3dn9IaPb/IJwBe5Mf4BEEFBXMPInp+hIlX1wJPdT9
	8jhv7gOL1r8ngyBKIGJw+BIGFLlk/3pfiUeFZ9Doeg0eOxNjd5cbHeZAsFQepz/GgH4K
	nR4lH0Qgs8QVSn+Xz7Ca6wssyHwdwF9zo7XqUZ9+ZTuFzrYojT4RSBgyx84on/RvlgRu
	KcBJcIrY3mwHh+Wj+ZcvYHLRkZzfuAVJdbYOLed0+IpD332bgd/ZQnIKncRh7FoTT1Io
	sE1Ls+FM1CM5LywJ58j3K5HWE7nzGHk8VM9PqTnfVNEbjj8SvWHTTqnxDacyhOPf9tVs
	bJRA==
X-Gm-Message-State: ALyK8tIx7eCSaYQKSgxYH7VjblHBUQK99wmQuwoRXxNesp124m+8BzA5sdOkCFivZNXZstvBOH6qY57C/BftPNcO
X-Received: by 10.25.17.92 with SMTP id g89mr571547lfi.119.1465193785077; Sun,
	05 Jun 2016 23:16:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.30.137 with HTTP; Sun, 5 Jun 2016 23:16:24 -0700 (PDT)
In-Reply-To: <1465045799.13979.33.camel@linuxfoundation.org>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
	<0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
	<32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
	<1465045799.13979.33.camel@linuxfoundation.org>
From: Koen Kooi <koen.kooi@linaro.org>
Date: Mon, 6 Jun 2016 08:16:24 +0200
Message-ID: <CAP0W-RkN1xM94XFb8c-paj3WE+dU+oc1NPgUCwv2UH-Rmx4tEw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
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
X-List-Received-Date: Mon, 06 Jun 2016 06:16:27 -0000
Content-Type: text/plain; charset=UTF-8

On 4 June 2016 at 15:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2016-06-04 at 10:41 +0200, Koen Kooi wrote:
>> ping 2
>
> It would be helpful if you'd cc'd the person who's patch you were
> suggesting we revert. I added Sasha to cc.

Sorry about that, I had expected 'git revert' to automatically add the
original sign-off somewhere.

> I've seen multiple different conflicting patches regarding the image
> types code and I've not had a chance to try and figure out what the
> real set of problems are

Disclaimer: it's all incomprehensible python to me.

The problem I'm running into is that I want a something.gz inside
something-else.gz, the patch that I reverted seems to say "Hey, gz is
mentioned twice, let's optimize that out". Patricks patches seem to
solve the same thing but not break things.

> and which of the various proposed patches make
> things worse or better.
>
> Until someone can explain clearly to me what the problems are and how
> we move forward

I'm not sure what problems the compression patches are trying to fix,
just that this single patches breaks an oe-core class and reverts
cleanly.

>, or I find time to dig into it myself, we're a bit
> stuck :/. I just mention this since I expect you're getting frustrated
> hearing nothing. This has been flagged in my inbox, I'm just lacking
> the time to do everything I'd like :(

Sure, thanks for the heads-up, a response makes the bean counters at
work happy :)

regards,

Koen

>
> Cheers,
>
> Richard
>
>> > Op 30 mei 2016, om 13:28 heeft Koen Kooi <
>> > koen@dominion.thruhere.net> het volgende geschreven:
>> >
>> > ping
>> >
>> > > Op 23 mei 2016, om 19:50 heeft Koen Kooi <koen.kooi@linaro.org>
>> > > het volgende geschreven:
>> > >
>> > > The commit breaks image_types_uboot.bbclass:
>> > >
>> > > ERROR: Logfile of failure stored in:
>> > > /build/linaro/build/build/tmp-glibc/work/genericarmv8-oe
>> > > -linux/linaro-image-minimal-initramfs/1.0
>> > > -r0/temp/log.do_image_cpio.16506
>> > > Log data follows:
>> > > > DEBUG: Executing python function set_image_size
>> > > > DEBUG: Python function set_image_size finished
>> > > > DEBUG: Executing shell function do_image_cpio
>> > > > 31373 blocks
>> > > > Image Name:   linaro-image-minimal-initramfs-g
>> > > > Created:      Mon May 23 19:38:56 2016
>> > > > Image Type:   ARM Linux RAMDisk Image (gzip compressed)
>> > > > Data Size:    7326620 Bytes = 7154.90 kB = 6.99 MB
>> > > > Load Address: 00000000
>> > > > Entry Point:  00000000
>> > > > mkimage: Can't open /build/linaro/build/build/tmp
>> > > > -glibc/deploy/images/genericarmv8/linaro-image-minimal
>> > > > -initramfs-genericarmv8-20160523173835.rootfs.cpio.gz: No such
>> > > > file or directory
>> > >
>> > > This reverts commit 94f61c2682e5cfd819ac84535650c3e0a654415a.
>> > >
>> > > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> > > ---
>> > > meta/classes/image.bbclass | 8 ++------
>> > > 1 file changed, 2 insertions(+), 6 deletions(-)
>> > >
>> > > diff --git a/meta/classes/image.bbclass
>> > > b/meta/classes/image.bbclass
>> > > index 9f4c83f..df3bd3a 100644
>> > > --- a/meta/classes/image.bbclass
>> > > +++ b/meta/classes/image.bbclass
>> > > @@ -410,13 +410,9 @@ python () {
>> > >                    # Create input image first.
>> > >                    gen_conversion_cmds(type)
>> > >                    localdata.setVar('type', type)
>> > > -                    cmd = "\t" +
>> > > localdata.getVar("COMPRESS_CMD_" + ctype, True)
>> > > -                    if cmd not in cmds:
>> > > -                        cmds.append(cmd)
>> > > +                    cmds.append("\t" +
>> > > localdata.getVar("COMPRESS_CMD_" + ctype, True))
>> > >                    vardeps.add('COMPRESS_CMD_' + ctype)
>> > > -                    subimage = type + "." + ctype
>> > > -                    if subimage not in subimages:
>> > > -                        subimages.append(subimage)
>> > > +                    subimages.append(type + "." + ctype)
>> > >                    if type not in alltypes:
>> > >
>> > >  rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SU
>> > > FFIX}.${type}"))
>> > >
>> > > --
>> > > 2.4.3
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-core mailing list
>> > > Openembedded-core@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> > >
>> >
>>



-- 
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

