Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AD01371AC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:06:39 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a193so15771195qkc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SIZOXKUrAuX2WMujs5cg7J5yJ0jSLT+cosDo46fJQ88=;
	b=b9719d36aSP31E7LbXZWDQMFgyrtNB02j44KTigiEw3oYy5QP4qbdMqEnEspH1s/tQ
	LoxT/0SqyjmDmxBjXoBw1NVJXC+RaeHDlseSfCTT0wJIlT0nNGDmXSSlRTNDibQNrH6q
	824GNRIm3u5LzIAOXw+sLgPlaIFZ6Cym5a8rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SIZOXKUrAuX2WMujs5cg7J5yJ0jSLT+cosDo46fJQ88=;
	b=E3QfqiVy5Pb8fgKeK2UDxQpgURJkqQJNrqDX/48y8mbB8LCEnEL3bk+G3xve27PLQE
	+mBaypcT1gqdedtY3fP15QfY0e8wQEz/nNoju23DugnGSYBvF2a/hXp7GdhlHnewUtU+
	Iv5FrNwHBdnd/C1JZ2621xv2bCjLUkhjmTKYcvtuqdaiSZ8B9Z/cDH93L9F/25V2X4jV
	21jJMQWjZnhfb2ceSGiqpryphOvx7jBX4Oxw/WSwC4gvGt1Gag5d0Z3wkly11AyBmQhO
	XeBRzJ/K+HcJjZhok68MnmqWWGvt8U9vRmvBn8fp8h0dD7YA1DlB+g7O9ShFI1T8Lgno
	ULAQ==
X-Gm-Message-State: AKGB3mKdNVHq3LCiOv4mFdP8P9BsIH1x/k4NLpYGVjmINXFd1y0vcGT0
	nD8OEFMy8DclAKN09wFjjcml0w==
X-Google-Smtp-Source: ACJfBoue7TUqcv3VG193OIc0SuAAdsIfDoAxj33HZA525Fovsfmf6ORsMRrh4TrOA5yBmZ7o+o8HOA==
X-Received: by 10.55.25.88 with SMTP id k85mr6609863qkh.257.1513721200503;
	Tue, 19 Dec 2017 14:06:40 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	d11sm4154185qkc.26.2017.12.19.14.06.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Dec 2017 14:06:40 -0800 (PST)
Date: Tue, 19 Dec 2017 17:06:38 -0500
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171219220638.GR14220@bill-the-cat>
References: <20171219201148.19828-1-sgw@linux.intel.com>
	<20171219205438.GN14220@bill-the-cat>
	<CAJ86T=Vkj_5FEWTheHJrH_N0nucHo9yW0MANMoevgUFwnswQ-w@mail.gmail.com>
	<20171219212050.GP14220@bill-the-cat>
	<CAJTo0LYRX7xJzvGNJoNWztCAdWZB=pKfFfjKsaPSA9J=WtfEPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYRX7xJzvGNJoNWztCAdWZB=pKfFfjKsaPSA9J=WtfEPA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: preserve rootfs if mkext234fs() fails
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
X-List-Received-Date: Tue, 19 Dec 2017 22:06:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 19, 2017 at 10:04:29PM +0000, Burton, Ross wrote:
> On 19 December 2017 at 21:20, Tom Rini <trini@konsulko.com> wrote:
> 
> > On Tue, Dec 19, 2017 at 01:19:09PM -0800, Andre McCurdy wrote:
> > > On Tue, Dec 19, 2017 at 12:54 PM, Tom Rini <trini@konsulko.com> wrote:
> > > > On Tue, Dec 19, 2017 at 12:11:48PM -0800, Saul Wold wrote:
> > > >> We have seen more failures, but have not been able to directly
> > reproduce
> > > >> it maybe svaing the rootfs and it contains some content that is
> > tripping
> > > >> up the e2fsprogs mkfs.ext4 populate_rootfs() function
> > > >>
> > > >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > > >> ---
> > > >>  meta/classes/image_types.bbclass | 7 ++++++-
> > > >>  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/meta/classes/image_types.bbclass
> > b/meta/classes/image_types.bbclass
> > > >> index 9188bed4197..6b4f39ed274 100644
> > > >> --- a/meta/classes/image_types.bbclass
> > > >> +++ b/meta/classes/image_types.bbclass
> > > >> @@ -86,9 +86,14 @@ oe_mkext234fs () {
> > > >>       bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_
> > NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
> > > >>       dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_
> > NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
> > > >>       bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
> > > >> -     bbdebug 1 "Actual Partion size: `ls -s
> > ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
> > > >> +     bbdebug 1 "Actual Partion size: `ls -l
> > ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
> > > >>       bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd
> > ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d
> > ${IMAGE_ROOTFS}"
> > > >>       mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
> > -d ${IMAGE_ROOTFS}
> > > >> +     if [ $? -ne 0 ]; then
> > > >> +             tmp_saved_rootfs=`mktemp -d -p /tmp saved_rootfs.XXXXX`
> > > >> +             cp -r ${IMAGE_ROOTFS} $tmp_saved_rootfs
> > > >> +     fi
> > > >
> > > > Wouldn't it be better to just fail on error here, rather than dump
> > stuff
> > > > to /tmp ?
> > >
> > > It already does fail with an error. Saving the state is temporary
> > > additional debug to help understand why.
> > >
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12304
> >
> > So the problem is with the autobuilder where everything else gets blown
> > away.  That's fine, this is an autobuilder specific work-around, not a
> > general purpose patch and shouldn't be in mainline, would be my point.
> 
> I suspect this will just hang in master-next and never merge into master.

That sounds good.  And I suppose at this point, it would be pretty
likely to not, too.  Maybe in the future we want a tag in the commit
message or something to make it clear it's not for merging to master
itself?

-- 
Tom

