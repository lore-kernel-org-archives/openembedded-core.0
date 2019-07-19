Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD197CE4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 21:36:04 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k8so61467179iot.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 14:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Sb2Gr7vqC1OPewjeEPV8NGCIA9jDWAcxTD/nU0zc7A=;
	b=HYexsI+AXYN4liYh6VEwxdEuZIST5kSchBUBiyQrzuqgyfQj1aEm/+/JYV9BGdbAoi
	WID3ovpMhfhHfVaKH1iZ1zvhseSdVujTTQxLZHaqpc3JsvFu0oHTaWgXQgksUOMz2oPd
	C55/KDxDLOYhnYdptPIgS6/SKdYYOTR6jTzGS17wzapMRs7zL7CCxi9+55Y2312eNAGi
	rxncMntQl7kJ6H6vf+o7Kh/C7EOXDwNL17DNapxKMRbJMtG9h/sZz6ZHJ1yAW3boD26Y
	ItFTOEf4WzaB/NW3IS7sROGaqNfdEMa/qo6s8zkX6I8b2XVRd5k3HgfE2T/j3hlFHFle
	U71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Sb2Gr7vqC1OPewjeEPV8NGCIA9jDWAcxTD/nU0zc7A=;
	b=GONQCGCNehxLrgcd3gXt97ooVVhv2Xt5JzsbuOB4Oaqg5pDZWVhkOmsohuFqUTMf8Z
	g14rqNlwd2UYf8sD4qFYIUEJPyL5Maq8UKSbTXJFlbP90+a55b6C1SABe7D9xqZ6c7QT
	nB0GkZtktqswxk76yTlEYwr3Juk/5EktimZvf3BTnew4ODDITio/KMUu/fp0yibz7sho
	4Ubun6V2dBCBU+epyj5Pb4v++xZDl7QpFTfFtPbfM9jRA+a2fOKWsW2P9ejdqEgCof6X
	RKPGA9VFAkhtNvEHCCOs+BU9qHkP/3BuLyQ1YQn7d7OOawkYfIjH3obqlXbavYZJkf7j
	HoGg==
X-Gm-Message-State: APjAAAVe11RvA3F79Oi0u+2ycxovlY1vYYR/U+v0eBKyE9womINGr1v8
	UZvn4c9kJ9+vHmaP4kmuyoCvIS1oOwJS4FW+wra4eA==
X-Google-Smtp-Source: APXvYqwK8GjYN28Qyl4AMHbRxWH1Z/ZIrEcMzccKrh5QaDfZE3o5V79VHng3Q71ldBkmrz4OuaNhQ5oFQi4NBenPt6o=
X-Received: by 2002:a5e:c744:: with SMTP id g4mr49669648iop.187.1563572165949; 
	Fri, 19 Jul 2019 14:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-2-kai.kang@windriver.com>
In-Reply-To: <20190704134520.16320-2-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jul 2019 22:35:54 +0100
Message-ID: <CAJTo0LbmYp-70L=Z_T0jE4xS1mR_vLXKQE18O_EpeEwD6wdroA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Poky Project <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] defaultsetup.conf: enable select init manager
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
X-List-Received-Date: Fri, 19 Jul 2019 21:36:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jul 2019 at 15:40, <kai.kang@windriver.com> wrote:
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -0,0 +1,6 @@
> +# Use systemd for system initialization
> +DISTRO_FEATURES_append = " systemd"
> +DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"
> +VIRTUAL-RUNTIME_init_manager = "systemd"
> +VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> +VIRTUAL-RUNTIME_login_manager = "shadow-base"
> diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
> new file mode 100644
> index 0000000000..7725b30e1e
> --- /dev/null
> +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
> @@ -0,0 +1,6 @@
> +# Use sysvinit for system initialization
> +DISTRO_FEATURES_append = " sysvinit"
> +DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd"
> +VIRTUAL-RUNTIME_init_manager = "sysvinit"
> +VIRTUAL-RUNTIME_initscripts = "initscripts"
> +VIRTUAL-RUNTIME_login_manager = "busybox"

Back when I integrated systemd into oe-core one of the use cases was a
single distro that builds a main image using systemd, and a
rescue/update image using sysv/busybox.  How is this possible with
this system?

Personally, I'd prefer to see the DISTRO_FEATURE wrangling left out of
those files, and let the user ensure the right features are set.
After all, systemd will refuse to build unless the systemd feature is
enabled.

Ross

