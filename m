Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAC860089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 11:50:50 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so63044002wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 04:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zfPL9iaTOS+EPi4Vo3BR9OPb2R/YzT//iD6KJEvhYbk=;
	b=ficveE8i5ryNQWs41eg1Y8AMKsm+rdFK1HCetPtbRWUFnne36evaCla89j98SHUA+g
	IOZlVQCEl0i5qUd3xtq3x26M9NK06kyiqG08QWTKMN/HUsSawiTD8k+wYkrIEzkNoTl5
	39cPzD+g/kvt7dR7bCedEjBGsvQMmmMczm7g1t6gvb3y8bp2SAEmjxBBcY9O0HeKG362
	Np09mhfXaCFp5m912I8WSkMdd+SkEj09X6ZbJ8QltcscXDSlNjQHJBKolbeicTJtK4Ns
	Bw+6wL8ZGxt9z4akaDO0YsrwyGInY0Qzhg7Hb8qnRdiNC8kiuI0OGAdub3GrYOwn3O5C
	FrNg==
X-Gm-Message-State: ALoCoQngDesjNInZ2sntwvrt/e6AeNVsmxmP8F/PnPabPvRcDYRLSfqsHz0GXpZYxziUwPp9JQrt
X-Received: by 10.194.87.4 with SMTP id t4mr20894462wjz.84.1438775450420; Wed,
	05 Aug 2015 04:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.87.1 with HTTP; Wed, 5 Aug 2015 04:50:21 -0700 (PDT)
In-Reply-To: <946bdac08d39152d5d25795d01bdf15b227378e2.1436464186.git.raj.khem@gmail.com>
References: <cover.1436464186.git.raj.khem@gmail.com>
	<946bdac08d39152d5d25795d01bdf15b227378e2.1436464186.git.raj.khem@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 5 Aug 2015 14:50:21 +0300
Message-ID: <CAHiDW_GD-yve0xk2+20VXMmF9k0t6fGNfSy34mjZ1XQCy5SBbw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] runqemu-internal: Replace wacom-tablet with tablet for usbdevice
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
X-List-Received-Date: Wed, 05 Aug 2015 11:50:58 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 20:52, Khem Raj <raj.khem@gmail.com> wrote:
> When booting weston-core-image with latest wayland/weston/libinput
> mouse/touchpad would not work on qemux86, this fixes the issue

The gcc upgrade from the same patchset has been in master for a while
but this one is not. I think it should be included: currently mouse
does not work in weston when started with "runqemu qemux86 kvm".

In other words, "ping",
  Jussi

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  scripts/runqemu-internal | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index 6878251..67aef8d 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -119,7 +119,7 @@ ORIG_STTY=$(stty -g)
>  if [ "$SLIRP_ENABLED" = "yes" ]; then
>      KERNEL_NETWORK_CMD="ip=dhcp"
>      QEMU_TAP_CMD=""
> -    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
> +    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
>      if [ "$KVM_ACTIVE" = "yes" ]; then
>          QEMU_NETWORK_CMD=""
>          DROOT="/dev/vda"
> @@ -274,7 +274,7 @@ else
>          fi
>
>          KERNCMDLINE="mem=$QEMU_MEMORY"
> -        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
> +        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
>
>          NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
>          export NFS_INSTANCE
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

