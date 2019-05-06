Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 66BF96C4DA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 04:54:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id m20so657458lji.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 May 2019 21:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=jMdSLE5lgq3mmvxyYVsuNrSOOHQbGeX9gDraezpHXGI=;
	b=I/10gN1It/0Zks0e9xcDAyu9N3NpKLDR2oxGyqwllqiwLvYLz83J9JKH/nPpy9tvcw
	bO6hQ9SLWbdRfUvs8GLk5sIYt7doY/ZnDqz8AtvqHoxuEskUlaIN8GlXXd6ZarW+NEOf
	1fJOvqhDb44WnuDvFRRlXdPQPYr8AFeVhTlkX4iGiEOspAKffnReCwJu48VeBpTsD9lI
	J2fbtqZvg38bJoCN8tcWWIpsZhJeWVcymhima3Hz7SOHyhkXjIkEQjkU9NHFF9etcs8U
	3vHIQQYvsFE5LojQUTQRPSoSVt6hJtr6ICPQQipXmdOGIjw7O7ifQ9lywDoueG2Znsv6
	ykzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jMdSLE5lgq3mmvxyYVsuNrSOOHQbGeX9gDraezpHXGI=;
	b=YZejLcvUi3DIFeSg1BntADyVA2JD0TVVVF1v9AW4DpsdDLO7g/eGz5RQwBEyShObZC
	krBLu+Om1IgAh+S4LmaogMKjTHYXmQocwPUGD3es+cfRCFnso90uctFX5GdfttXHRjJw
	5pUv/B7+EFOZnCah0Wl1LLnDBavNE3sUZ3H4jTh70mvAsCWXOKDBLyX4S4RBlFZIEOsm
	mBzOrQE0nJvYjqqRfhKnvBbnVyL9kOBXtFf0lBfeMeCF25Vjkap471C5hg4IwjLvZ8V7
	GwWILwx0wNQdBD63RT5mDPxO9rhyQVp8lFPTa/I0RMFu2jzCNxGK9KIj7ulzfUr55BjC
	dLaw==
X-Gm-Message-State: APjAAAWBv9T7SrrtpNk2F8xZGR5iAH5Sp1JQpzmU1eXWDULjU5ndGuU6
	H6HJNDyxs4B3qGDDyzJE5M+/Z4mWLFU=
X-Google-Smtp-Source: APXvYqwmgNhln6VP6U33V0Nwrlj8S6u+hiVYqlKN6YwnRbmj+CETtHHkpv5VeNxJvYHm3Zu31LFEcQ==
X-Received: by 2002:a2e:9a17:: with SMTP id o23mr2840977lji.108.1557118469409; 
	Sun, 05 May 2019 21:54:29 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	d6sm752815lfm.20.2019.05.05.21.54.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 May 2019 21:54:28 -0700 (PDT)
To: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190503164850.130865-1-alex.kiernan@gmail.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
Date: Mon, 6 May 2019 06:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503164850.130865-1-alex.kiernan@gmail.com>
Subject: Re: [PATCH] systemd: Default to non-stateless images
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
X-List-Received-Date: Mon, 06 May 2019 04:54:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

The below is fine and looks good.  The one thing that bothers me about 
this is that "stateless" isn't really a property of the "distro", rather 
it's a property of the image/machine.  I suspect, in the same sense that 
we have readonly-rootfs, that we should probably have image features 
"stateless-rootfs" (no /etc, no /var) and "volatile-rootfs" (no /var).

Furthermore, if you want to boot with 'ro' on the command-line, I really 
think you need to build your image with the "readonly-rootfs" feature 
set.  The default should be writable+persistent /etc as that's the 
configuration used 99% of the time (currently).  "readonly-rootfs" does 
a bit more than just creating machine-id but it's all relevant to the 
'ro' case where /etc isn't writable.

Just for clarification:

i)  volatile-rootfs:  means there's no point in prepopulating /var 
because it's on a tmpfs and needs to be populated at boot time

ii)  stateless-rootfs:  means there's no point in prepopulating neither 
/etc nor /var because they are on a tmpfs and need to be populated at 
boot time

iii)  readonly-rootfs:  means that /etc is really not writable so it's 
important that: the systemd first-boot stuff needs to be done at build 
time:  machine-id, unit files set up, all tmpfiles.d snippets that touch 
/etc and /var need to be done in advance.

/Jonas


On 03/05/2019 18:48, Alex Kiernan wrote:
> When creating images, for anything other than the explicitly stateless
> case, touch /etc/machine-id so that the images can be booted without an
> initramfs and with `ro` set on the kernel command line, otherwise system
> refuses to start:
> 
>    [    7.222134] systemd[1]: No hostname configured.
>    [    7.227266] systemd[1]: Set hostname to <localhost>.
>    [    7.232622] systemd[1]: System cannot boot: Missing /etc/machine-id and /etc is mounted read-only.
>    [    7.241750] systemd[1]: Booting up is supported only when:
>    [    7.247362] systemd[1]: 1) /etc/machine-id exists and is populated.
>    [    7.253752] systemd[1]: 2) /etc/machine-id exists and is empty.
>    [    7.259757] systemd[1]: 3) /etc/machine-id is missing and /etc is writable.
> 
> If DISTRO_FEATURES includes `stateless` then systemctl-native is not run
> on the image leaving the image for population at runtime by systemd.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>   meta/classes/image.bbclass                            | 7 +++----
>   meta/recipes-core/systemd/systemd-systemctl/systemctl | 8 ++++++++
>   2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index a23403c0827a..3cb185dd2045 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -665,12 +665,11 @@ reproducible_final_image_task () {
>       fi
>   }
>   
> -IMAGE_EXTRADEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
> -
>   systemd_preset_all () {
> -	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
> +    systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
>   }
>   
> -IMAGE_PREPROCESS_COMMAND_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd_preset_all;', '', d)} reproducible_final_image_task; "
> +IMAGE_EXTRADEPENDS += "${@ 'systemd-systemctl-native' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('DISTRO_FEATURES', 'stateless', True, False, d) else ''}"
> +IMAGE_PREPROCESS_COMMAND_append = " ${@ 'systemd_preset_all;' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('DISTRO_FEATURES', 'stateless', True, False, d) else ''} reproducible_final_image_task; "
>   
>   CVE_PRODUCT = ""
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index d7d4e0d29a09..7da8f23ab893 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -241,6 +241,14 @@ def preset_all(root):
>           if state == "enable" or state is None:
>               enable(root, service, location, services)
>   
> +    # If we populate the systemd links we also create /etc/machine-id, which
> +    # allows systemd to boot with the filesystem read-only before generating
> +    # a real value and then committing it back.
> +    #
> +    # For the stateless configuration, where /etc is generated at runtime
> +    # (for example on a tmpfs), this script shouldn't run at all and we
> +    # allow systemd to completely populate /etc.
> +    (root / SYSCONFDIR / "machine-id").touch()
>   
>   def mask(root, *services):
>       systemdir = root / SYSCONFDIR / "systemd" / "system"
> 

