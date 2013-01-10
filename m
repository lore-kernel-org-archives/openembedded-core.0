Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TtOxQ-00018c-F8
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 21:42:36 +0100
Received: from mail-vb0-f70.google.com ([209.85.212.70])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 10 Jan 2013 12:27:21 -0800
Received: by mail-vb0-f70.google.com with SMTP id ff1so638756vbb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 12:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=j1F6VEOW/EzJhmMdrKKOWsQBkOuaXGHadDBQvUWXomo=;
	b=T5Msczdj2b8RZPVwJmteozwmqqJRcxDZmk9A0eEQfjYXoyDX+C79okLHImAdlibjJw
	d7J1iRjAxeefAIPEjDSKELuYn72/yFGKViIhmMA/o9YcSWGaFQWJIfGnaT5pG/Bdexz7
	u/Ihul00Pwrlyb2mS19sJCMcO8JWoBge9pVBFhUtdnqCFlAR6h3Nu4AbzpzoFRLpQsu4
	5ZRhw9RAo/rmKK2bo+Xql7yAKk0Y7N06SCr+txDo+9YOThKuZQ1nhIQ9fXLXERVADCxZ
	PbgA2aH3YlwoY7zGYJ34OBhSHwZr1kNgyz152xTvZV0IIm0k+kP5Ij4V+Y8dZ5ijEM9W
	Bvag==
X-Received: by 10.52.31.197 with SMTP id c5mr80240236vdi.65.1357849635570;
	Thu, 10 Jan 2013 12:27:15 -0800 (PST)
Received: by 10.52.31.197 with SMTP id c5mr80240231vdi.65.1357849635505; Thu,
	10 Jan 2013 12:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Thu, 10 Jan 2013 12:26:55 -0800 (PST)
In-Reply-To: <1357843361-18125-1-git-send-email-cristian.iorga@intel.com>
References: <1357843361-18125-1-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jan 2013 20:26:55 +0000
Message-ID: <CAJTo0LaWTPXh9Ph+LFMK+44t3T+TN-uZXXEwJg7yoOmcUZCL1A@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQn1o9o0b/hk3scL2q5qETc2y3gQsbe7cDP278WUQnbYlzxqmSrNtiDK6wyy7a8LG8670LYQWVr+rdYyKPysuM378W9Iq/83OPA8P2ubugQam6eO/hkOAVG0C5tYAgt0l2dKZmVTedVDgSwgf5BLrSx3TY/c14aq2sEFmLslf8q+g3KfpCm7wPxwUP9BTyZd5iVzZ65S
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] connman: upgrade to 1.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 20:42:36 -0000
Content-Type: text/plain; charset=UTF-8

On 10 January 2013 18:42, Cristian Iorga <cristian.iorga@intel.com> wrote:
> 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
>     - adapted to the new version
>
> 0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
>     - patch removed (it is included in the new version)
>
> inet-fix-ip-cleanup-functions.patch: added
>     - fix for ip cleanup functions
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>

Also document the point of connman-conf.

> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index 5d59a7f..41fe552 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -10,6 +10,8 @@ XSERVER ?= "xserver-xorg \
>
>  MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
>
> +MACHINEOVERRIDES .= ":qemu"
> +

Please submit this as a separate patch, it's effectively unrelated to connman.

Ross


