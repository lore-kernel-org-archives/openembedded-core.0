Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5264B730B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 10:18:27 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id j56so475554uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 02:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=parj+FdBEMV2VGZ/X9s6aV6LUhTHIgDW/K2+Kws13qk=;
	b=lWAVCFV11hZr/jniFhAnX75p4WpXHxFBFPpDhB1xSD4J7sI5VA+46FgFlqmz7N+8y7
	NfD5epUiDPpoMppHLV9SUH+mfqY007VBRBrzVpteF5ntaG3GjuSi99o7PZhC30YnPuyU
	EZnsnUbchvdHvJ11rMijyo/TmPOK4gjBDNf83hzJGMgXOSbmExKdvXDsGsg4n29tIR5W
	kj2VzJa5WR/vYl1g5uPN/pDXXBLVcRyDMM3f8Uq47cHzV7+U+HxroMnIfItDACyNLebF
	SOHYbT2ODxKnz8wqTKL6P4Z8YN6AARsHBtbDZsdvMesrf7iOWG5ev3CpBuYtDcSwVQvj
	fxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=parj+FdBEMV2VGZ/X9s6aV6LUhTHIgDW/K2+Kws13qk=;
	b=LbeiGmVL6ZMVBg+PC61GMg7kwAYSScgQYC+0auJozygPc+hoR9rNK06ynhAM8xlx71
	t3hDZms3h120Via5PaPiq9xF4pBqijd8S1V8SOmXEw4cMvq9lJ8n6cZxFgEXuLwDPR6J
	8xfSM7NgYuOVRUbOWOGdp0KBNd9VHUNF8zLBwzT9j6tAdQNUUnrsleS2Zemar30Oijws
	Vy1iOqAu6G+1WOxddGAmuWTS5rsaqdZxxV6YPUMr82t3N7q5k3gRkC2jcvVNkKm7I4VH
	NWhLCfndta3U92eIx1oh2/04aRMDUs7mLsm4O2JynGsWbjTnFox40B64vTUyXLow5AJG
	VE3A==
X-Gm-Message-State: AMke39n55RJ584nLtdWC35WsZOxV7JpLAQ9DqoVN25fbgT20E0Q2uIX6a6EIhzTXTJNbHEWxtvBzol2hWr8exw==
X-Received: by 10.176.1.167 with SMTP id 36mr12870409ual.44.1487758709032;
	Wed, 22 Feb 2017 02:18:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Wed, 22 Feb 2017 02:18:28 -0800 (PST)
In-Reply-To: <CAJTo0LZ8aGGuo1nz-U9gXJ+_BFvgohvfgVw3g53DFUtV=FE5Tw@mail.gmail.com>
References: <CALbNGRQCTBqEUiByii0LFY7=Kw07KbBNn1fy+64zuF24+g-y-A@mail.gmail.com>
	<CAJTo0LZ8aGGuo1nz-U9gXJ+_BFvgohvfgVw3g53DFUtV=FE5Tw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 22 Feb 2017 11:18:28 +0100
Message-ID: <CALbNGRTotE7H35qmGcWyP6FkKRZWMpsbgCg++j_VuZrx6QawyA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Task sequence question
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
X-List-Received-Date: Wed, 22 Feb 2017 10:18:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 11:01 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 21 February 2017 at 23:20, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> after some fixing in meta-oe it seems I am able to build some
>> xfce-image again. Watching the tasks go by I noticed that do_rootfs is
>> running already while many recipes still do their do_package_qa. This
>> looks a bit odd to me. Not that I am happy about an early do_rootfs
>> but what would happen if do_package_qa fails? Isn't that a kind of
>> prerequisite for an image that do_package_qa passes for all packages
>> within this image?
>
>
> If there are any failures in do_package_qa then the build will fail, so t=
his
> is basically optimistically running the rootfs whilst doing QA in paralle=
l.
>
> Ross
OK & thanks

Andreas

