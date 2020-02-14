Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2957610AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:31:30 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d18so7059125qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GVIyC8ejpcvfY0NR3T3yHcfOLq/AJsuLa2qLgC9ju6I=;
	b=Vp2+zcPTdClIUylE0moZjv49OnUp+0j2yUSrVX5Ltv1Z5xN/eU8f677+05ZHKPlTnq
	Zk9BUZuZm7he0/xKPIVCaYOXfgzttUCfmt78YAYtxft5qcXsxfmZQ/WIc6CcEQycvMny
	guDw7szjpaOWNwlCpLDM4Q8Nu57rvx9SUZpt101/4uRUzXdhsQRKUN7fLsNewMyl2c4a
	o0LZYOmaUO6WQNSBzW3/1IU0AyeN41OkZu/PB0VHNkPMnIyAiKtK4Hh1PqExM278pbR/
	ybcJXIzVGt7NJWbqkkL0lzZsHk8C1cAWiPA901R+GAqGTCjsOjKt2YJQz494JvL1NSCy
	oBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GVIyC8ejpcvfY0NR3T3yHcfOLq/AJsuLa2qLgC9ju6I=;
	b=D6pAQqOz+kkJZwZoxnzierEXV3LrYOkVckzaWqilFz3KfP97m2CJv3FvD4xFFg3yM1
	lLqWEU6FUUBciy9mGCF63H4fZmYw22Mb2HCPkLji02t+mfxIOMTjuwq4D3OsjiOp1Mgo
	pQQlMd2bXoImNtsgNXmlZMbk1+dekcgw+9RATjFPgV+mV3nVTLM4UgFaJageOZWYRK3Y
	A7weHFNMHDSOmyCgj1//XhWmZLmCXylqN2/NvxVOrEb+acHJ2CG86gU3RLqB23UufbOv
	+uT4wQKkUyTO7FVHNhuZRe0ENkDIinzKk8UM5kqwwSJmVp/OBjXFCRwRCBXb2XFd692W
	mTpg==
X-Gm-Message-State: APjAAAUk68peWsaZC+ZcV1Kz1lXcfdmjZbBRfzulmhLma5dj4NvqkPuZ
	RoX3mM5td8OgUoTc7/f439NWHoevzTr28WXVSK4=
X-Google-Smtp-Source: APXvYqw5c/C2kUHAxbL6K0ifAdKyl12+TBDPbc7vEEZVE3dvciMTP+xjS3GWmy1DGaW6VbcbB15+PsHv0+JTvAKc7Vc=
X-Received: by 2002:ac8:145:: with SMTP id f5mr2729424qtg.194.1581690691218;
	Fri, 14 Feb 2020 06:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
	<20200212031435.792802-4-JPEWhacker@gmail.com>
	<CAMKF1srqz+B9YEHCvMcsZRiWa5AvjD7H-ef7pQjd8baWsHWNAQ@mail.gmail.com>
	<CAJdd5Gb565Y-9GhHSb9JJZgPijd_zBCbAgBNSRHQ3U=YsX65eA@mail.gmail.com>
	<15849ef67fdb2877d200a39259d9503664244d7b.camel@linuxfoundation.org>
In-Reply-To: <15849ef67fdb2877d200a39259d9503664244d7b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 06:31:04 -0800
Message-ID: <CAMKF1sqDfefbTvjhr_VYqb=6ErD_zz9gmbnbWfo+0tJ-uvdmpQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] recipes-support: Add diffoscope recipe
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
X-List-Received-Date: Fri, 14 Feb 2020 14:31:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 6:18 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-02-14 at 07:15 -0600, Joshua Watt wrote:
> >
> >
> > On Fri, Feb 14, 2020, 12:34 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > Hi Joshua
> > >
> > > I think it needs to be ignored on musl
> > >
> > > 15:37:23 ERROR: Nothing RPROVIDES 'squashfs-tools' (but
> > > /mnt/jenkins/workspace/Yocto-world-musl/sources/openembedded-
> > > core/meta/recipes-support/diffoscope/diffoscope_136.bb
> > > RDEPENDS on or otherwise requires it)
> > > 15:37:23 squashfs-tools was skipped: incompatible with host
> > > aarch64-yoe-linux-musl (not in COMPATIBLE_HOST
> >
> > Would an RRECOMMENDS fix it?
>
> I merged your patch and one of mine to follow it adding a
> COMPATIBLE_HOST entry.
>
> I see Khem is fixing some other software so we may end up not needing
> it but we can remove later.
>

right, we were unnecessarily masking squashfs-tools for musl

> Cheers,
>
> Richard
>

