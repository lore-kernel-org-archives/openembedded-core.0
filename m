Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id E317E60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:45:55 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so54798124pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=u85OBr2nAyZlxreV5e3HMlUn0WdA8GCloYJfZ1hYIpw=;
	b=OklGnk0SSj1FKKUlbJXA01LIsVtcCsmrq0MJxJAnLxbebq/Qe85g16oLWViYx/6/O2
	ZdVmmsWb6XYm6AMcCtMw/W58ZP1UPDZyUW8XtV0JwUuIqMGayURMKKNTCRVARLAgUms4
	rfhv7Git8JK4vDzvjqgRUI3g+HuKWzsgp6Ejmd5fDA++lqfOHAZyWCkWI6nsVGFTzEGS
	r5hoQoPGVZu3X5V+BVH91XoywPH4FvwvmlB7i/jY88cCQyp1WVCiNfX3bbLsc0wBdXAk
	rrZ/2JSNpfmfIcwGx34XI6HPfkJnyVwqqfH7T7rR4/oDh8EvEgvBGoNi9sRp4jJdLu1o
	+7VA==
X-Gm-Message-State: ALoCoQnY8o9AG2SqGTsBI0rLfp1y+J58QeKj+XpNDpOwi3a2tZYRiDB86mzFtY2aCdRwhHtCk35a
X-Received: by 10.70.20.5 with SMTP id j5mr69902337pde.40.1438015555688;
	Mon, 27 Jul 2015 09:45:55 -0700 (PDT)
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com.
	[209.85.192.170]) by smtp.gmail.com with ESMTPSA id
	y2sm20353779pdi.80.2015.07.27.09.45.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:45:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbnt7 with SMTP id nt7so54689383pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:45:53 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.126.133 with SMTP id my5mr70573016pdb.14.1438015552996;
	Mon, 27 Jul 2015 09:45:52 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 09:45:52 -0700 (PDT)
In-Reply-To: <1437996575-29558-3-git-send-email-b54851@freescale.com>
References: <1437996575-29558-1-git-send-email-b54851@freescale.com>
	<1437996575-29558-3-git-send-email-b54851@freescale.com>
Date: Mon, 27 Jul 2015 13:45:52 -0300
Message-ID: <CAP9ODKptVRdGfTLa5eW3ebuf+PsTDLRK0YzWqAY3t0a4pvk1Wg@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 2/2] gstreamer1.0: Add basesink related patch
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
X-List-Received-Date: Mon, 27 Jul 2015 16:45:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 27, 2015 at 8:29 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> Fix QoS/lateness checking if subclass implements
> prepare/prepare_list vfuncs
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>  ...x-QoS-lateness-checking-if-subclass-imple.patch | 70 ++++++++++++++++++++++
>  .../gstreamer/gstreamer1.0_1.4.5.bb                |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
> new file mode 100644
> index 0000000..2adfadc
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
> @@ -0,0 +1,70 @@
> +From 6914566ed6a89c96973a578aa5ecd01ee68cdcfd Mon Sep 17 00:00:00 2001
> +From: Jian <Jian.Li@freescale.com>
> +Date: Thu, 14 May 2015 15:49:43 +0800
> +Subject: [PATCH] basesink: Fix QoS/lateness checking if subclass implements
> + prepare/prepare_list vfuncs
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +In basesink functions gst_base_sink_chain_unlocked(), below code is used to
> +checking if buffer is late before doing prepare call to save some effort:
> +    if (syncable && do_sync)
> +      late =
> +          gst_base_sink_is_too_late (basesink, obj, rstart, rstop,
> +          GST_CLOCK_EARLY, 0, FALSE);
> +
> +    if (G_UNLIKELY (late))
> +      goto dropped;
> +
> +But this code has problem, it should calculate jitter based on current media
> +clock, rather than just passing 0. I found it will drop all the frames when
> +rewind in slow speed, such as -2X.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=749258
> +
> +Upstream Status: Backport-GST 1.5.1

The field is:

Upstream-Status: Backport [1.5.1]

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

