Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1986679093
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:17:49 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id k38-v6so15116941qtk.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=30dICSIyWs9vLPt6M3I1YfLWSJl64EhovEl/Nt6Pib4=;
	b=rsg2jDQbpxeGoEiz0GT+THY+08UR4tpPQ2salr0eEIjPYBYfBZtumYz3fRwzBv5lP0
	RZy1yKSXfCRCdFphZOO71BeXvGzb+daC1Ko2A08+4ovR19NfU2Dvq8SfGOlNqLq4T75b
	s8ML+bk33K9Yca0CU7be7OcRXd9hJ285LhFUuK7gFBNBDbr7Cwg2z22uv9Bz36O6q5CU
	b0aOtSiph50uDF0GB3Ya6vQEobATwhj776DRfMsYt49rUNvlM67sUHx5JERCA4b9WPkI
	9j1FthkXeOHWcac0tnb2AKfppMjevvQAB7ZN4hxWxOLtlRjXFDKjqr05K+uWLyChsry5
	YiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=30dICSIyWs9vLPt6M3I1YfLWSJl64EhovEl/Nt6Pib4=;
	b=nTeEe8H4SH0x2TRv/qPmY2pt8wxItHep/7YBjseXMN5wOCdXHcc8UdFmLo+h78sCup
	a64P/oXQGTEtjI4oTenlT7z0xbD99umXMM6zlJxRCbYCdfi/+P5jrDASytGVLmEkpGDw
	j151Kd7YmGGcvdfH6gzg9RlxOwMwkctCtzvVbeqUxwHlEd0V0HULTNb3cJ8q/+N4ByOU
	nVIBcFW6WRKs6wBaNmpR7rD7S+qiMk+OODPPFYx9siW6bSW9/hSPUPPTk+ADmfcTmLxd
	u36Recn4u3naT8bXR9I5MqvB7VtFnAw29QLnGS0fV1KqsfPDy/cmH9LOX4C6nCYtc2f0
	LDjw==
X-Gm-Message-State: APzg51D841cFLBF4AZ20l7zfC+tkMEMOOLf2d+z4QnKb74cK6+3a5FBq
	8KXTo+YOIa7QT3uw23IYQMFHZrtKq+SSueEJeik=
X-Google-Smtp-Source: ANB0VdbUKfJIwkWysRuEnBHZ9GcawAskwDDmomkgj0airlrr5zcZOYFZHROXDgHmMKf9kV50gUesHHvBCA2+Mf/4D20=
X-Received: by 2002:a0c:e205:: with SMTP id
	q5-v6mr15758495qvl.224.1535732270725; 
	Fri, 31 Aug 2018 09:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20180830221333.31366-1-ross.burton@intel.com>
In-Reply-To: <20180830221333.31366-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 09:17:24 -0700
Message-ID: <CAMKF1sqB66TwpFhpQtRc_UpZtdh-xizwWB93qsakpMBD-2zgEw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs: disable static libraries in libjpeg-turbo
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
X-List-Received-Date: Fri, 31 Aug 2018 16:17:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 30, 2018 at 3:13 PM Ross Burton <ross.burton@intel.com> wrote:
>
> Previously this was done with the generic autotools support, but CMake doesn't
> have a standard option so set it explicitly.
>

Not particularly relevant to this patch but another approach could be
to turn no-staticlibs into a distro feature and move these controls to
respective recipes.
may be for next release ..

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/no-static-libs.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
> index 7fd578b3ce7..cdc53916d07 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -36,6 +36,7 @@ DISABLE_STATIC_pn-libusb1-native = ""
>  EXTRA_OECONF_append = "${DISABLE_STATIC}"
>
>  EXTRA_OECMAKE_append_pn-libical = " -DSHARED_ONLY=True"
> +EXTRA_OECMAKE_append_pn-libjpeg-turbo = " -DENABLE_STATIC=False"
>
>  EXCONFIG_ARGS_append_pn-ncurses = " --without-normal"
>  EXCONFIG_ARGS_append_pn-ncurses-native = " --without-normal"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

