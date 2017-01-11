Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 44A046010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 16:21:53 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d5so48421270uag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eJI5VF3fsYjlsqdyNu3ZnVEltLtcfhitRwG+AZ1yJJM=;
	b=rbR1eCmmznF1GDcNsUahfWvvNiLPQhpn0x2SMaV1HMbrNwzykr1MHwsiMdRUAqU51k
	n43SpilNv69M6vbUAcD35fgh5KTzSxAj9Fn2HxGvO9iQIiofVZ6RHfbM8xUKeBQ2KY2v
	mxUZY2/LO3wPxP364gt9m8pQ1fH3PTBGoa+JcghCyeCubgcRFpl/4r13MZZx1nqhhato
	0chKpKddw3oq5/Zkfha2w39KCwqHCw14YZcp2XsBFtY/8y5/N9n+4kld0gO8JaMP4rIv
	vZ8lKfBNWfS0CHeeeXbPCBHhItcU4vBJy5Ib5py/4A9u5DMiDAQdNIGVyRBpbmxW211d
	Lung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eJI5VF3fsYjlsqdyNu3ZnVEltLtcfhitRwG+AZ1yJJM=;
	b=NWzlf8G5oH3ps1otnTI+R6A1Sw8cFpGiSrvJCy8ULjpGewQcdazGTSNC1ztbHTDzV1
	9aT+q0riW5dTzJ6RZv4uxAICwbSC3o+bl3EGCRrDtr51tX3UD0WmHmn9/RULfYGDXxSm
	gf/hokkhAaBTGeV1VXh4J2eUSaiVKWciUZLTDcESoNTN8iDuT5SfzurJMC94Td2JGswR
	Df2irHZSDFq4H/FVIq4UvO8Z4JNRPSiVjo7zDu37R9SFG8lUql2ZIz2g1bJDOH//Wd2A
	0BB/3ypDnksaI5og9h/zbdE33vUxu2vUkOQFMOSG6tFhMkfNjsseSTJ1KU9aQtxOG+uk
	HftA==
X-Gm-Message-State: AIkVDXLl1MZbH2fgULbGAX5pzznbT9UAwcCMrPqWtiN4uyvdNCIqZz89Ye2D0R9o1wNXCJDdLqwAYUAJnOaKcw==
X-Received: by 10.176.76.43 with SMTP id l43mr1425156uaf.29.1484151714164;
	Wed, 11 Jan 2017 08:21:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Wed, 11 Jan 2017 08:21:23 -0800 (PST)
In-Reply-To: <1484150216.3966.19.camel@pbcl.net>
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
	<CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
	<1484150216.3966.19.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2017 08:21:23 -0800
Message-ID: <CAMKF1sqSWZzs=-q2FZh4az1vNcwV_CZx1iQktQV8fRR5s14qfw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Wed, 11 Jan 2017 16:21:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 7:56 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2017-01-11 at 12:19 +0000, Burton, Ross wrote:
>
>
> On 11 January 2017 at 03:51, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> This fails when building gdk-pixbuf for x86-64 with gobject-introspection
> enabled:
>
> |
> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/gdk-pixbuf/2.36.1-r0/build/gdk-pixbuf/tmp-introspectylz98kc7/.libs/GdkPixbuf-2.0:
> Relink
> `/data/poky-master/tmp-glibc/sysroots/intel-corei7-64//usr/lib/libpng16.so.16'
> with
> `/data/poky-master/tmp-glibc/sysroots/intel-corei7-64//lib/libpthread.so.0'
> for IFUNC symbol `longjmp'
>
>
> The gdk-pixbuf link does use -lpthread, is this saying that libpng should be
> linked against pthread too?  I can replicate on demand if you have any
> suggestions.
>
>
> That's what it's saying, and this was introduced by the fix for:
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=20019
>
> But I think this new behaviour is in itself a bug.  It isn't reasonable to
> expect any library that calls longjmp() to link -lpthread just in case it
> might end up coexisting with another library that does.  (The fact that
> libpthread defines longjmp is arguably a bug in itself, but one that we are
> stuck with.)

This is showing when executing target binaries in qemu here I believe. One
workaround we could try is to use LD_PRELOAD of libpthread.so.0, that
might get us over this error, but the issue still may manifest on target apps
using libpng16 with other library pulling in libpthread

>
> p.
>

