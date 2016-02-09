Return-Path: <andrea.adami@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0690F6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 12:51:20 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id e6so115868795vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 04:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9uKR6fI3aA8vqXTDrzVvgUIl1ANv3tb0VzRmqT+HtiY=;
	b=dHjVIlV0zV5UI8NlaNuTSLMhPu9gFKa5543P1PVzqOf61AoaZKEIkF7Kq9Yth99k+Y
	7c4wErdRQlLp7mnZ0D0Pts+02ENNOBh8O5Pd3VF91SVc5bVoaZZI7jTOpKQJCabo1f4X
	2eqf76TrCetk003srFGOUk9TdQCXrMcA8NpxqA8kJauLwNdtpqSD96KHCPlkdjhxBOWK
	+xee3vzovnGVwUQflg5IYD9CKKekwLZ3g9ShwKiUd2mnfpzD/32GqXD90DoXLNoieIe8
	IEwZok9hvnLcBwxjtqub3K4OO0NYVDWD7NRxY0/kXeFjdA9JpSNANdyIvhBw/xYLbQGf
	i/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=9uKR6fI3aA8vqXTDrzVvgUIl1ANv3tb0VzRmqT+HtiY=;
	b=hXbjNr999EQ+b8rvQSaS3kbb5HesIS4lfQWav/EO6++QHREkAq00HVxm6n1GtUwtX9
	lz1BZ5CDyqaoMHVVw4sWe7U0K3548gKCcj0wBE69swLgNVb/IIfnNsh2KM/h5dCSOSOT
	TKCTV94qumKa0MgbuUNMhCqi1gC0SxybcwTI+5orFTMgwp72GU3o4brtML9FFyDC89pr
	nndCy99aTxZNeryFEMnqTgRl4GuCfvtkBUf0aMya+hJ1Ye1FF4WWHqv+RRpIjYpMb/0R
	8yEFp8kvM+jIYY/TXZ8lPKAckfBSUsIx/244rSPGBVA+bfeLUNos6TJvXNRLIf8C5qcu
	fxkQ==
X-Gm-Message-State: AG10YOQwJAQDBpNPoPMVYUxt02CoBwRccgojtxPmqlXuBjinmWT/nfMpazkO8JS6qfH9dKtUfQ1i1nYEBhh27g==
MIME-Version: 1.0
X-Received: by 10.31.178.146 with SMTP id b140mr24780081vkf.108.1455022280707; 
	Tue, 09 Feb 2016 04:51:20 -0800 (PST)
Received: by 10.176.1.248 with HTTP; Tue, 9 Feb 2016 04:51:20 -0800 (PST)
In-Reply-To: <20160209123026.GA22354@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202161726.GC2607@jama>
	<CA+chaQdGzUm96SViWvLW8xinxSLrjZbZxi843A282geN+T5Ffw@mail.gmail.com>
	<20160206204110.GA21969@mcrowe.com>
	<20160207220741.GA12339@mcrowe.com>
	<CA+chaQeGfQQ5r=Z+MEzuv1rX93ZLgrVDWzbwx6fXrkaftZ-w-g@mail.gmail.com>
	<CA+chaQfVbnjSV5Casif1b5_vxp4ysThnJLCShGAp89PCXd1tTw@mail.gmail.com>
	<20160209123026.GA22354@mcrowe.com>
Date: Tue, 9 Feb 2016 13:51:20 +0100
Message-ID: <CAAQYJAsYUc=eZSa7yt4-bpCVRtFOvendDYjaBr5sMGPrK5h2pQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 09 Feb 2016 12:51:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 9, 2016 at 1:30 PM, Mike Crowe <mac@mcrowe.com> wrote:
> On Tuesday 09 February 2016 at 11:39:17 +0100, Martin Jansa wrote:
>>   /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb,
>> do_compile
>
> That one builds successfully for me for qemuarm. Strange.
>
>>   /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-support/invensense/invensense_git.bb,
>> do_package_qa
>
> That one seems to be using cmake so I can't immediately see how it could be
> affected by changing EXTRA_OEMAKE.
>


It is unrelated...
About the do_package_qa, some of them like klibc and invensense come
after commit 47d38d4d86ec6a "insane: add test for -dev packaging
containing real libraries" introducing [dev-elf] fatal error.

Cheers

Andrea

>>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb,
>> do_compile
>>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb,
>> do_compile
>
> I think these failed for me even without changing EXTRA_OEMAKE but I
> need to go back and check.
>
> Thanks for testing. I shall try and reproduce them and see if adding the
> old value of EXTRA_OEMAKE to the recipes fixes them.
>
> Mike.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

