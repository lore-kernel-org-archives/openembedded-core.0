Return-Path: <net147@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B41C773180
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 01:42:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 65so10102736pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 17:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=8A5P/g9GDETXmU/McuHWVUgAvkQSkmWvioc81nrL4tw=;
	b=tw+N79qfaEtRez7ep5/S+i8B06Lh2Uo7UALM777xuFRkxiy6UQRLe51AKCNXuE5Eep
	MC6BVfWY8kc2nOibbMicXKC2N/h5l/7fzTGPJ76vWKB2qH6l+h8XQlb9+4Rn1jJkn1GM
	tPIVhCvDGZkUO/nsb7JCB0wc//y6asDAxa1Fzo4irCg70rlIfm3AXOgAKVR+yarmRXWj
	wtYzJlLr8Ey8B0iEiS8i16pSnbY8eZJDle3racZeVLtCgXWbUmPyEmf7IqaHlGIP0m+3
	fhzJASn/WTygn0O8e5Iko7ULeDW+PGbh9LK+B6aPmLu3hlElCb1Zr52dQAoRli5OVTX6
	ZU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=8A5P/g9GDETXmU/McuHWVUgAvkQSkmWvioc81nrL4tw=;
	b=BsWFXd1w2AWA8QgsMEUwq44dE27OEWfwvyL46w4oeyf70Dmzw/FVee1JCWAxcYCuVq
	gzpburDdd9BQzuf5QioXas2WZoZz7kzBkdOy/yj3f/lwi6MOEySpUVpf2a0vvtNFYe8G
	GQgpUeMAA9oTmXqR0i93+HEWwb3SckJAl5J9N+7O5gbocKRCDeWaPrLgzcRdmENRSAi4
	/C06jgH1L2hwiyIKgFdAnCqb9hPNtWUHLLCH/KUXU0cdlv4BsC4VfGGBShznfgsiQfrM
	nO1SjRILNPdtEn2r/uq9k8fyanx1BuCOIu4do3RKcS1K6BWw5XWFVKUdBnIPBXNo2ouw
	1DEA==
X-Gm-Message-State: ALoCoQkryHPSM58M62fPcAgQDkg8zp+/7TB50M9oZA/+MsWvVNt12V6iwjfqju5vpVNlex4wkce3GXFXCQy1GDdtZ1DdsSvukg==
X-Received: by 10.98.70.17 with SMTP id t17mr25920382pfa.107.1452994948787;
	Sat, 16 Jan 2016 17:42:28 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	w85sm24408149pfi.13.2016.01.16.17.42.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jan 2016 17:42:27 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1452121054.7598.94.camel@linuxfoundation.org>
From: Jonathan Liu <net147@gmail.com>
Message-ID: <569AF17F.4080607@gmail.com>
Date: Sun, 17 Jan 2016 12:42:23 +1100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452121054.7598.94.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/4] image.bbclass: Separate out image generation into a new task, do_image
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
X-List-Received-Date: Sun, 17 Jan 2016 01:42:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I have issues building a core-image-minimal Raspberry Pi 2 SD image 
after this series of patches using openembedded-core master 
(b3b679d5be86f73d1a06c7230cb00872f0a407b5) and meta-raspberrypi master 
(0d8e9271855ccb9bc21bdc0743f8e0f6ff0d2d5c).

| DEBUG: Executing python function set_image_size
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_rpi-sdimg
| 
/home/build/git/pi2/build/tmp/work/raspberrypi2-custom-linux-gnueabi/core-image-minimal/1.0-r0/temp/run.do_image_rpi-sdimg.8349: 
line 108: do_image_rpi-sdimg: command not found
| WARNING: 
/home/build/git/pi2/build/tmp/work/raspberrypi2-custom-linux-gnueabi/core-image-minimal/1.0-r0/temp/run.do_image_rpi-sdimg.8349:1 
exit 127 from
|   do_image_rpi-sdimg
| ERROR: Function failed: do_image_rpi-sdimg (log file is located at 
/home/build/git/pi2/build/tmp/work/raspberrypi2-custom-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_rpi-sdimg.8349)

openembedded-core 38237b7ac53c416f85c4a70a61acafc3404c8b5f - ok
openembedded-core b3b679d5be86f73d1a06c7230cb00872f0a407b5 - fails

Any ideas?

Regards,
Jonathan

On 7/01/2016 9:57 AM, Richard Purdie wrote:
> I've heard complaints from people trying to create more interesting image
> types about how hard it is to understand the rootfs/image generation code
> and that its a pain to develop/test/debug.
>
> Having looked at it myself, the internal construction of shell functions which
> then gets passed into a multiprocessing pool is rather convoluted and it places
> rather odd constraints on when variables are expanded. Its therefore no wonder
> people find it confusing/complex.
>
> This patch starts the process of splitting this up by separating out image
> generation from the do_rootfs task into a new do_image task.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 81971fe..77a8548 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -207,7 +207,6 @@ PACKAGE_EXCLUDE[type] = "list"
>   
>   fakeroot python do_rootfs () {
>       from oe.rootfs import create_rootfs
> -    from oe.image import create_image
>       from oe.manifest import create_manifest
>   
>       # Handle package exclusions
> @@ -244,9 +243,6 @@ fakeroot python do_rootfs () {
>   
>       # Generate rootfs
>       create_rootfs(d)
> -
> -    # generate final images
> -    create_image(d)
>   }
>   do_rootfs[dirs] = "${TOPDIR}"
>   do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
> @@ -254,6 +250,16 @@ do_rootfs[cleandirs] += "${S}"
>   do_rootfs[umask] = "022"
>   addtask rootfs before do_build
>   
> +fakeroot python do_image () {
> +    from oe.image import create_image
> +
> +    # generate final images
> +    create_image(d)
> +}
> +do_image[dirs] = "${TOPDIR}"
> +do_image[umask] = "022"
> +addtask do_image after do_rootfs before do_build
> +
>   MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
>   MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
>   MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
>
>


