Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4938977E76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:19:40 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id u18so3597770pgo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OyAV2Bg0XYl4zLG2gzOlPX8xMT14GidIeKEyN60ivsk=;
	b=gjGAAV79OinX0sWW2yQivJbuKHcK4GhRdF9EKmUHLh5MyYWk9fzA0QzkWfbvsq7dpP
	rotS1WIwLaP9fovmdP9aHDKmk9IOOe4E8VNoUh45bT5UXVa6ZVd5WDwJzwFzVG2IvHWq
	80QmONOGBXZndKbixPRqJhsuxQSeOCUZJD2UDHffzS9Gimm/WDlOnWO8N9JRVmN5ju1h
	oC9kALx4hKz6OLPsJQtLBQ/d/zHFI45VkKlU4UiTVTlxGVy16cXNNIBhviI3Ls++knJN
	vhh2+uPMgEwHVit+opBy6qYVvx95EP6+JBqkeGjJOhQhm+onAe7JDAUBR6GNcB8+zAps
	zgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OyAV2Bg0XYl4zLG2gzOlPX8xMT14GidIeKEyN60ivsk=;
	b=Y2yNpHWWteuHQXzvK3Mrhnm+k9n5rvSOpFQ6yNexij5vXrwsGHrb3iUxj7V+eMuJF/
	FtuWKvjy4SQdwYctPgtrU/21wOA8mXzvX+fwj3OpYws+VuD5uwkfNnS/EwKPx4Lp6zxX
	iw7X53czqNSmdKxNXwO9R2rdtHORc+K6r0zLQL7AH5MC1dQ30IWNIkHDDkgAUetPu628
	7AtdCtuhfrSCCwhDhFFkcLP/B9cHd0IlfRXe0JMf5+51ZRFCcsSQ/Asgq2GPNEiFn+qi
	2MAynA/QGkm3T2kq5qAJmMAflr+ceqnoaYGhIlqm3Xs999FPpm6+jKTwxulPYOf0BaVl
	zKKQ==
X-Gm-Message-State: AHPjjUjVsu1JS73BBz7mICdSbQAMQ0kdxs7VnBiWZnsgARo3QLyP8cdF
	8xq7xqdxoTTfWLmQ5PrweG+xxlk2CCBVMwGbCys=
X-Google-Smtp-Source: AOwi7QDbPBEr3tKSEJg9f8QJ9enVo+4ciX9SW3b5pzkmeUBVYptKY8CCwIYJe+RXvKbBNGHSkSgwpp1sXazUQHZfqvU=
X-Received: by 10.84.240.137 with SMTP id z9mr5709674plk.114.1506003582286;
	Thu, 21 Sep 2017 07:19:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Thu, 21 Sep 2017 07:19:11 -0700 (PDT)
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Sep 2017 07:19:11 -0700
Message-ID: <CAMKF1src=fX9LRauodhyBtWOBgpYSRYKukFN2x9t5srkPxAsrA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] gstreamer1.0: upgrade to 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 14:19:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 2:21 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> A boring upgrade from 1.12.2 to 1.12.3. This is a bugfixes only release,
> a couple of patches removed as they made it upstream in the mean time.
>
> Nicolas Dechesne (10):
>   gstreamer1.0: upgrade to version 1.12.3
>   gstreamer1.0-plugins-base: upgrade to version 1.12.3
>   gstreamer1.0-plugins-good: upgrade to version 1.12.3
>   gstreamer1.0-plugins-bad: upgrade to version 1.12.3
>   gstreamer1.0-plugins-ugly: upgrade to version 1.12.3
>   gstreamer1.0-rtsp-server: upgrade to version 1.12.3
>   gstreamer1.0-omx: upgrade to version 1.12.3
>   gstreamer1.0-libav: upgrade to version 1.12.3
>   gstreamer1.0-vaapi: upgrade to version 1.12.3
>   gstreamer1.0-python: upgrade to version 1.12.3
>


this series seems good to me,


>  ...ibav_1.12.2.bb => gstreamer1.0-libav_1.12.3.bb} |  4 +-
>  ....0-omx_1.12.2.bb => gstreamer1.0-omx_1.12.3.bb} |  4 +-
>  ....12.2.bb => gstreamer1.0-plugins-bad_1.12.3.bb} |  4 +-
>  ...12.2.bb => gstreamer1.0-plugins-base_1.12.3.bb} |  4 +-
>  .../0001-v4l2-Fix-4K-colorimetry.patch             | 48 ---------------
>  ...12.2.bb => gstreamer1.0-plugins-good_1.12.3.bb} |  5 +-
>  ...12.2.bb => gstreamer1.0-plugins-ugly_1.12.3.bb} |  4 +-
>  .../gstreamer/gstreamer1.0-python.inc              |  2 -
>  ...hon_1.12.2.bb => gstreamer1.0-python_1.12.3.bb} |  4 +-
>  .../gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb   |  6 --
>  .../gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb   |  6 ++
>  .../gstreamer/gstreamer1.0-vaapi_1.12.2.bb         |  5 --
>  .../gstreamer/gstreamer1.0-vaapi_1.12.3.bb         |  5 ++
>  ...dd-switches-for-enabling-disabling-libdw-.patch | 70 ----------------------
>  ...treamer1.0_1.12.2.bb => gstreamer1.0_1.12.3.bb} |  5 +-
>  15 files changed, 27 insertions(+), 149 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.12.2.bb => gstreamer1.0-libav_1.12.3.bb} (88%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.12.2.bb => gstreamer1.0-omx_1.12.3.bb} (69%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.2.bb => gstreamer1.0-plugins-bad_1.12.3.bb} (88%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.12.2.bb => gstreamer1.0-plugins-base_1.12.3.bb} (84%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.2.bb => gstreamer1.0-plugins-good_1.12.3.bb} (82%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.12.2.bb => gstreamer1.0-plugins-ugly_1.12.3.bb} (76%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.12.2.bb => gstreamer1.0-python_1.12.3.bb} (57%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.12.2.bb => gstreamer1.0_1.12.3.bb} (59%)
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

