Return-Path: <net147@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id C77A76A34C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 23:25:40 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id ma3so4393pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 16:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=uww6KdyRTx/fjkEc3PddvxL6vTbAMLrKadcEVUHSCs8=;
	b=0nN/XmS8jTi+LKb4tInjv78R7ab5U7ezQs9nQKYLP/6axA06Ge9f4bKE3rGsfW1Kqh
	D40e34s11B3h/ggZaFwtUw8BQqi+ePXQEa47YmIy8pm7ITmVVmt226FavwwS0qdRBgTM
	qEH//Bf5SdhSjz79+pffecInwY53OCBjkft+YrsCm2RpLzc+6/ZruZEqS7Iu7wgoaVEb
	+bo5C1vI7CT3L7IHLyWP9IcPBjhvZbIGR3rGOdqnp7QJ7P1fD3fWw4adRjdliPr2t+Ao
	z9AMXDn4RNQgzp45RBvGkvvPHtSDZZ4DqIxTl/kY+DP3KKwbTmNuHD6v4k4Imtii1Rfh
	pfWA==
X-Received: by 10.66.27.99 with SMTP id s3mr346729pag.73.1369092341626;
	Mon, 20 May 2013 16:25:41 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	wt5sm25862185pbc.38.2013.05.20.16.25.39 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 May 2013 16:25:41 -0700 (PDT)
Message-ID: <519AAFD6.9050604@gmail.com>
Date: Tue, 21 May 2013 09:20:54 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369091195-5368-1-git-send-email-net147@gmail.com>
In-Reply-To: <1369091195-5368-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: update to 204
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
X-List-Received-Date: Mon, 20 May 2013 23:25:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 21/05/2013 9:06 AM, Jonathan Liu wrote:
> Removed patches integrated upstream.
> Added backport of fix for utmp not running at shutdown.
> Updated serial-getty service.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   .../systemd-serialgetty/serial-getty@.service      |  16 +-
>   ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch |  41 ---
>   ...ystemd-update-utmp-shutdown.service-into-.patch | 367 +++++++++++++++++++++
>   .../0002-readahead-chunk-on-spinning-media.patch   | 142 --------
>   .../systemd/systemd/0003-readahead-cleanups.patch  |  86 -----
>   ...ctl-Handle-missing-etc-sysctl.conf-proper.patch |  33 --
>   .../systemd/systemd/199-firmware.patch             |  98 ------
>   .../systemd/{systemd_199.bb => systemd_204.bb}     |  12 +-
>   8 files changed, 381 insertions(+), 414 deletions(-)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/199-firmware.patch
>   rename meta/recipes-core/systemd/{systemd_199.bb => systemd_204.bb} (95%)
Just a reminder this depends on the following commit:
- base-files: add /run directory from FHS 3 draft specification

Regards,
Jonathan

