Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id B08D46C4A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 10:27:35 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id s5so9633507oth.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 02:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IaKMhelcxcy33YeSuz6H7xTFhVhaq+nNNXxM+U6HhCY=;
	b=HJiDWFOx+aqg5yWybo+cT38uqJlgDVeI29/Idu7KXAXDbQBEHrzfTtzMBC34RwfVCp
	Lz5z5Bd2qXnXErtbERCsRRL3kp7zfqDFdzJjvbadzliGrJMiwEZmh3Sr/OFG/gRUMgfP
	FhkYm5JMv50L3i00n+Wb5FXMhHRwLYdNPnOm4nFvPtnjjP47HDtLn5B82D0pvuytn6QJ
	bmh1NQ0SjFuMgs5ge0ZFsmUjsY4HAgezFNCmcXggwOAUZJTQGoiGeeGMjiS0vMSUgbQ9
	Bg/a5ScdxR02thmXMH4fmsxI5swhuOFchQ1/kdu1159nbQSgOGHDu/NfsCGbyvbG8HSz
	U84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IaKMhelcxcy33YeSuz6H7xTFhVhaq+nNNXxM+U6HhCY=;
	b=m2EKT0miWMjenquKsRS5GcLqaE8xHBK/bMzPb3ILxBUw6xmaQjqiTnmmAM4ORMFIg0
	rpuN/8rvmXzfxJ0IDDFAB+lgvHkc5HPiNPJG1Cm6/LPuXrG4poLe8Ksx25CUxxQz0rcb
	xpJj/01vVcqB68SfwStDeSA5JZUirqgL/UDsXer0VAOQa9GV32lruxaOEPdzJET9Mzai
	Rs7EEfu3BR18Yy3tACEKl3YX3gmAQZEinlYtbxwB6G0XKR2+nBznxGP0MsrjS89N4O2Q
	z2m/+Zk5361GS0trOwRNQVJKmUIKLa1POtSLtCyuUvvmFwDUkfwsu7Szpb9yk0FdYaBg
	KFMw==
X-Gm-Message-State: AHQUAubQr+BONdTELu669oIO7S5U7A1uUA/ain40NdscvWekEHUAGGu8
	y9xr0+4qhrDDzREJgcrQhV+N+lyl/Bqh7+dw7Ys=
X-Google-Smtp-Source: AHgI3IawDzRWVcywSIVGSETvrt7xlr208gFXyWoNX2H953g4tUNeg/5n9lE/Kq9BtJu4kY65M68k5Bwt6OOIjPl2s0M=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr621540otf.367.1550140056673;
	Thu, 14 Feb 2019 02:27:36 -0800 (PST)
MIME-Version: 1.0
References: <03b301d4c2ed$7497f360$5dc7da20$@gmail.com>
	<CANNYZj_PY61tmw=JjP7PPqqSVJff6kd=rsv=daNscx9eSkNWSA@mail.gmail.com>
	<1634479.1jWiZZ8UfD@localhost.localdomain>
	<6cc49be5-a9f3-bf38-2570-b12048dc4471@linuxfoundation.org>
In-Reply-To: <6cc49be5-a9f3-bf38-2570-b12048dc4471@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Feb 2019 11:27:25 +0100
Message-ID: <CANNYZj-Lb0o6fO=RYrGd=2E_5Dqh7eFcovieDc2wBJp7SuPJcA@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: Yocto Project Status WW07'19
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
X-List-Received-Date: Thu, 14 Feb 2019 10:27:35 -0000
Content-Type: text/plain; charset="UTF-8"

I think it looks right now, thanks :)

Alex

On Thu, 14 Feb 2019 at 10:13, Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
> The regular 3 hour update wasn't installed on the new server. I have
> repaired that and added the RRS updates as well..
>
> The update has been run several times in testing and I'm curious if RRS
> has caught up as expected.
>
> On 2/12/19 5:57 PM, Paul Eggleton wrote:
> > Hi Alex
> >
> > On Wednesday, 13 February 2019 6:22:23 AM NZDT Alexander Kanavin wrote:
> >> On Tue, 12 Feb 2019 at 17:10, <sjolley.yp.pm@gmail.com> wrote:
> >>> The recipe reporting system integration with the layer index is available
> >>> at: https://layers.openembedded.org/rrs/recipes/OE-Core/2.7/M3/ and the
> >>> historical data has now been imported.
> >> Sadly the new RRS still seems to be suffering from the 'outdated info'
> >> problem. For example glibc, or python3 recipes have been updated to
> >> latest versions, yet RRS still shows that they haven't been.
> > We're reliant upon the layer index updating and it appears that's not working
> > at the moment. I have asked Michael to look into it. Thanks for the report,
> > I'll reply back here when things are sorted out.
> >
> > Cheers,
> > Paul
> >
> --
> Michael Halstead
> Linux Foundation / SysAdmin
>

