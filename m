Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 35A9177AA5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 20:19:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a84so544186wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 12:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sd2dWxfk7g0Mq7izNxiP0zI5cQH/XIvueCBkPXkQN14=;
	b=RWPh3TFxyKROruy1V7MwbLhs30vUcZM8rMuqH5hrtsnK9CWxuE2CZfxt0NyDAICC2a
	+xSc+efTYbXbsNpTmp+btgZy93Mkx2OCfIzN0CynnzkYQvRhuqwQttibly5gftNv4e2a
	BTivqyvacngtXRYfrpUMra7ThsbSVFTO+6f06sSwU/nkRrZa7+wR3Db5j8q4KzTxjcii
	tWwzSNj7Oi1zUx2AsX0B0TkQRb++5F+4RsDXAUddyQ9u8qxLFcZjtwwcb5bFK5LJ4LeV
	Ea9B0IZUTafcKQxPcSCsShVRIkS5kGXt1xi+1XYKMMQ0jQ70tNVT2GQac2GHugzFSZJe
	O+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sd2dWxfk7g0Mq7izNxiP0zI5cQH/XIvueCBkPXkQN14=;
	b=c6sayXX5Tnl+e9OQiegur4sBriZSyKmICk5slE1htIOzSWJsCNj4Q5WKGVh0ssXoIs
	YXDWEsfzpVnQCEKSZeaFfKQezPyYx4kmp1xKYU1AFr0emmptC60UuQOTqQvFTFpfgvrB
	jFp4ml3et8g9C2fLRpFKPOxWgNObfyJanhqfwrzl42SKJsLfVN9mPcdyuC95fvXE1fSL
	KpklN+moa+fcMR9F7n6zIbLBGHBiyfglG3mF83PO7Tjc4G67soS9by3eQdoUKe/9N66P
	Civo5PSYesz23m/FNqG9ItQ9Ey9q+W4zws2PvJQHQkv+sDUdDnYYYHlPgp+yyv1X7tkU
	wzdg==
X-Gm-Message-State: APf1xPBTSDsKaPGTtF63wYPFKZbC/QGR7X+rXq4M22iLs/33n0h8Ksda
	UhcPW1BBCg9IONazhljYyoPfSxQOGbMUsZ7djkc=
X-Google-Smtp-Source: AH8x226pCU0hR8+qeH9c3K/9/UikCquH7J2LshIA3B8rGXUexQ4ekS0gDpFnDIQZ17Yd5JxsX8kY9YwM0yRURYHfcUw=
X-Received: by 10.28.145.21 with SMTP id t21mr5232254wmd.136.1518466743692;
	Mon, 12 Feb 2018 12:19:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.193 with HTTP; Mon, 12 Feb 2018 12:19:03 -0800 (PST)
In-Reply-To: <CAMKF1srb4Zm1sBXdqGbKmOvttQRdfSoyGiTuYrXyCtLFjr0PhA@mail.gmail.com>
References: <20180212094117.4534-1-sean.nyekjaer@prevas.dk>
	<CAMKF1srb4Zm1sBXdqGbKmOvttQRdfSoyGiTuYrXyCtLFjr0PhA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 12 Feb 2018 12:19:03 -0800
Message-ID: <CAJ86T=XauMY=uCi1MvhB=wSNikQnX26ORyO47xTH3TQM7qhkrw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] site/common-linux: coreutils: get the uptime program to work
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
X-List-Received-Date: Mon, 12 Feb 2018 20:19:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 12, 2018 at 12:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Feb 12, 2018 at 1:41 AM, Sean Nyekjaer <sean.nyekjaer@prevas.dk> wrote:
>> coreutils configure script needs to know whether /proc/uptime is
>> available, but this is not possible in a cross-compilation
>> context. This leads to an uptime program that fails to work on the
>> target, as it has been compiled without /proc/uptime reading support.
>>
>> This commit fixes that by telling coreutils at configure time that
>> /proc/uptime will be available on the target (which seems to be a
>> reasonable assumption on Linux systems).
>>
>> This commit is made with great inspiration from Thomas Petazzoni's
>> patch to buildroot to fix the same issue.
>>
>
> is there a knob in kernel to disable /proc/uptime ?

No, it's unconditional:

  https://github.com/torvalds/linux/blob/master/fs/proc/Makefile#L23

