Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5C561BD2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 08:26:30 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v11so1360039wrm.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=RXKAp1ODdSaAhK9M7knsuOpJerqY9k7/sXIj3k5s/s8=;
	b=XQw9BPCT2NUj1Ddtbf+K8+hpxTq/wqvt97PQYene9LDorpfcoolN3zA3sZ16/FsafZ
	Ly4uA0xwjyR6s+POUzKR23LvNPwYQl/ctn1R8plIc0XZ3xGLaV+iqMX3FlCJOr/X2Tzj
	J7U1yK50cwIDrB+sEQTWNi7mXBf8qyqy8gh94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=RXKAp1ODdSaAhK9M7knsuOpJerqY9k7/sXIj3k5s/s8=;
	b=BL2FPpZ2ACbCr9Ws+pFVyzfNJvAxzLAmId4vKLA1RBISd1K0m3/pqzEeY40uHqjIei
	kiI/5s0I0+3taKkwz8a+Vyj6BhaDsCFNDFa8IaPfAIkfrby3rZE+M0xSqPkNWbOVniEC
	h4UsL8ZctIjUtR56+0bqecMuRIHWc1Ns7Tvcvs6gI/Il8LnplLIlD+gd0yhiDD8L0gI9
	Zi3CctzliOriKfC61RNMbEwvkH6uXvRsdjxiDngLk+cG2MKQkJcWZA5XA82vls2N7c4z
	Zdt3dh42JzgJYNmoO59PmwS4p/fuu9/p1agikmcFC0y4RjkjPB0V6hvSNlPzX0SViMnf
	f2HQ==
X-Gm-Message-State: ANhLgQ1/7+fxwmCYQoluJostqEkPDeJ6LPI1NKVOzrGFEr70lun61DWw
	SRPqRj1BBKP9e2Bd8mfKv/yEYg==
X-Google-Smtp-Source: ADFU+vsNJTwNAPK9LyPaDy9713+vMEpvUvKcSlutU4nrZhtFUSdcr1SQ0uK2yMIYbRXnyrzzQ6NmQg==
X-Received: by 2002:adf:f309:: with SMTP id i9mr3289283wro.0.1583915190807;
	Wed, 11 Mar 2020 01:26:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f6sm7137930wmh.29.2020.03.11.01.26.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 01:26:29 -0700 (PDT)
Message-ID: <a47daa466bf5ed0d69e0cef7900164473b6cfa9e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 08:26:28 +0000
In-Reply-To: <1583892804-385900-2-git-send-email-changqing.li@windriver.com>
References: <1583892804-385900-1-git-send-email-changqing.li@windriver.com>
	<1583892804-385900-2-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] parselogs.py: whitelist more xserver related error
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
X-List-Received-Date: Wed, 11 Mar 2020 08:26:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-11 at 10:13 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> With default config, these errors always exist for
> core-image-sato, and xserver-nodm.server start successfully,
> these errors are not critially.
> 
> If set default syslog to rsyslog, all these errors
> will go into daemon.log and user.log, then test_parselog
> will fail, so whitelist these errors
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/parselogs.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py
> b/meta/lib/oeqa/runtime/cases/parselogs.py
> index 6e22520..2a5e5c6 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> @@ -58,7 +58,15 @@ common_errors = [
>      "Failed to rename network interface",
>      "Failed to process device, ignoring: Device or resource busy",
>      "Cannot find a map file",
> -    "[rdrand]: Initialization Failed"
> +    "[rdrand]: Initialization Failed",
> +    "libGL error:",
> +    "[pulseaudio] authkey.c: Failed to open cookie file",
> +    "[pulseaudio] authkey.c: Failed to load authentication key",
> +    "FBIOPUT_VSCREENINFO failed, double buffering disabled",
> +    "xserver-nodm.service: Failed with result 'exit-code'",
> +    "xinit: server error",
> +    "matchbox-wm: X error warning",
> +    "X11 cannot support keycodes above 255"
>      ]
>  
>  video_related = [
> @@ -86,6 +94,8 @@ qemux86_common = [
>      'tsc: HPET/PMTIMER calibration failed',
>      "modeset(0): Failed to initialize the DRI2 extension",
>      "glamor initialization failed",
> +    "xf86OpenConsole: Switching VT failed",
> +    "Fatal server error:",

"Fatal server error" means the server didn't start correctly? I doubt
we want to whitelist that one.

With several of these you're right, they have been on the console for a
while and I'm worried that a) we don't see them in the logs and b) the
errors are occurring at all, we should really fix some of them, not
"hide" them.

Can we fix any of them rather than whitelisting?

If we really do want to "hide" them, I think at the very least we need
open bugs for some of them so we can track and fix the underlying
problems. We need the bugs open before any patch can merge.

Cheers,

Richard





