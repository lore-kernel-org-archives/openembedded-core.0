Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id F408C73206
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:10:46 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id g73so135425484ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 13:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JyjujLq+zw8+q/x9fRSSFkZfO0jMgpH5N44a21x7aMM=;
	b=Xs0FqWXEAlQTKucml0wGb9NUOR+WFsxV3h9UTCjSFGuAB/klv7esV45rA8eRrw6CLG
	q2Ed5X7I+5yLat+05L2183kMlmn9fOnnl0Eu+HXWDF9u34apZQawBxYAFtpRrI8IPls9
	L7Ga9f6G7dFfB9wwdiEx+ZFQSLb4IELqXZwLsw7IRAeN231lHLDO7Z29jafzZFuH4LGb
	xlBKhW6WqHebmJdceQQqLodEnP8QwJ5Zp7po6++adfZ3DSMfgxNspXAv61CZBIMZaD6C
	PmdIDeGELDus1QmRciKxGai41iUJxLaBYbxJOiLXMeu1ehwc/gWFeTrWVu5cBI4D4WK8
	IT6A==
X-Received: by 10.107.9.224 with SMTP id 93mr106228747ioj.112.1452460247367;
	Sun, 10 Jan 2016 13:10:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sun, 10 Jan 2016 13:10:17 -0800 (PST)
In-Reply-To: <CAJTo0Laga86qGDjuxoApENiqRS_j0-8cPLNfhs5J=QSdTZWOyg@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0Laga86qGDjuxoApENiqRS_j0-8cPLNfhs5J=QSdTZWOyg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Jan 2016 13:10:17 -0800
Message-ID: <CAMKF1srdBj0iSp0ursf8=_pD-bV8Bp81haj8EkOhe8n=xvHFfQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Sun, 10 Jan 2016 21:10:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 6:56 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 10:19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This set of fixes let core-image-full-cmdline build with musl along with
>> core-image-sato
>> and core-image-weston
>
>
> The postinst intercepts that are ran at rootfs time using user-mode qemu
> don't work with musl:
>
> NOTE: Running intercept scripts:
> NOTE: > Executing update_font_cache intercept ...
> /lib/ld-musl-i386.so.1: No such file or directory
> /data/poky-master/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0-r0/rootfs/usr/bin/fc-cache:
> Invalid ELF image for this architecture
> WARNING: The postinstall intercept hook 'update_font_cache' failed (exit
> code: 255)! See log for details!
> WARNING: The postinstalls for the following packages will be postponed for
> first boot: liberation-fonts
> NOTE: > Executing update_icon_cache intercept ...
> NOTE: > Executing update_pixbuf_cache intercept ...
> /lib/ld-musl-i386.so.1: No such file or directory
> /data/poky-master/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0-r0/rootfs/usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders:
> Invalid ELF image for this architecture

I have fixed this issue as well.

https://github.com/kraj/openembedded-core/commit/1b65d8b36606167f4f04192abf4e14ada305cd8d

Its baking on my master tree, will post it along wiith phase 4 pull request.


>
> Ross

