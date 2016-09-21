Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFB760746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 16:34:55 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b130so101074337wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aloDB8R5QGnsJKRLwRK5KIXoIapazxxXgyXfqkBO258=;
	b=l6kpGHqwzetjIw6/r8Tf4SGn8ZI0aFjDKBKRCshEP408J9vvxCd/KM4vIj7CKMGwpC
	xemaVIPyzWheZOBPbE1wVjp1QGsFKNzwCnOBSdgldlPPpvB6QUeuBzV1SHMSsic3HO/L
	xmC2AEH2JsYGi+RVxqFATiUWUGc8IWnl3H6xuxO7T2A4UvOH34SzenzvcVlkspDVeMCj
	opCtiGeBiFp2lQZgxPn4bunNNSX3ebNEAwpL4OYQa+ArwHVO2U5JwiVjOq4EeEihDizz
	iKv/lmHoJxHrhYF7jO9g6+AUP9mb28w6zFejKeEfK6jmTWRVebS2QvBWVPewpSV7mOiX
	yJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aloDB8R5QGnsJKRLwRK5KIXoIapazxxXgyXfqkBO258=;
	b=hhWg/pr+voxJQvDRLIX+JpqB8xhVFD0j7l0p7p+6S5srKUCZ+SnAhJhCsiysevbWBF
	NZjTnC1Qi1846SPi7RINN4PsQTescR8TIgSDupTQHYa6JUE0+X839g2sR1tBomdHBnos
	etAqtMzimYOg7WWJpiYJ3rn3THAukY/WfRKOTzovAbLHKwnLUYBnSrwNsbyrCDrA9YH3
	RqbTfY8uar8URsTGHaX0w4DsXWTunox/6ZRxxzWGrIXC9eTtCD3FdVJRtm36ZPZ20jyS
	ozh4XaxpUOOcEVr5SG1TRbmwdO1Aen7z5sMbrKWqFklKwbae5sHq1YzrQgxpi2ZIY6+o
	w+yA==
X-Gm-Message-State: AE9vXwNaBwfc9g2h61sgABbWXvx2X3uedtHDhK2/GPQ2wAzUdpEqpxi3tEOID6vYZVdqZhZ7d5L24bt+gEPdKg==
X-Received: by 10.28.168.9 with SMTP id r9mr3874189wme.93.1474475695936; Wed,
	21 Sep 2016 09:34:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.172.166 with HTTP; Wed, 21 Sep 2016 09:34:33 -0700 (PDT)
In-Reply-To: <1474471092-4321-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1474471092-4321-1-git-send-email-ed.bartosh@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 21 Sep 2016 18:34:33 +0200
Message-ID: <CAD4b0_KyEWXR4AQ0PEeN2zuP2VKudyM63aL9HiFymfkqgAuajw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: add beaglebone.wks
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
X-List-Received-Date: Wed, 21 Sep 2016 16:34:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 21, 2016 at 5:18 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Added wks to make an image for Beaglebone board.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/canned-wks/beaglebone.wks | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 scripts/lib/wic/canned-wks/beaglebone.wks
>
> diff --git a/scripts/lib/wic/canned-wks/beaglebone.wks b/scripts/lib/wic/canned-wks/beaglebone.wks
> new file mode 100644
> index 0000000..753418e
> --- /dev/null
> +++ b/scripts/lib/wic/canned-wks/beaglebone.wks
> @@ -0,0 +1,7 @@
> +# short-description: Create Beaglebone disk image
> +# long-description: Creates a partitioned disk image for Beaglebone board
> +# which can be directly copied to SD card.
> +
> +part /boot --ondisk mmcblk0 --label boot --fstype vfat --source bootimg-partition --align 1024 --active
> +part /     --ondisk mmcblk0 --label root --fstype ext4 --source rootfs --align 1024
> +

Should be basically the same as sdimage-bootpart.wks as I used BBB
back when I posted it along with some wic fixes. It also used to be
possible to build a usable RaspberryPI image with the same kickstart
file, though I have not tried that lately.

-- 
Maciej Borzecki
RnDity

