Return-Path: <rsalveti@rsalveti.net>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88AB674BC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 17:47:24 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id o123-v6so47096776lfe.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rsalveti-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DiuSQokjFRQm6JkZ9eHWAhZh8BuHrtggP8K6wATZkXA=;
	b=2Pksmn4KHi1Y/W00HihnsRL0gffTGWAih4/z3M6PjutQ0HkE1OPEvErg1rJrfQBWA/
	lgJKf6s/GWoFxGPCfgk6g0XRBe8U8Dma/UrH9hMu0vbqmjjrXfGxFs6a9Bh07pvQAfAf
	ORC9Efcfmb6c73eM417DIVWT16tKGxBY5h2OQBgM65Dc1+OrYLnwNiUFpl8w7t1uVpVG
	bOUP8WZiYIZxIYTfbMZOIevA5O7PDddaR/LCh3yZap17DVqpo5SK96iXhKPpo7/0h7D6
	yXBYRkhRObB8yfjL/zgUNH8FbuOs7ugxRaXQh+8Ya4vsXf0X2irmIJjwdKGAh5etlDlh
	T5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DiuSQokjFRQm6JkZ9eHWAhZh8BuHrtggP8K6wATZkXA=;
	b=F2366c5C2ID4Mk9X+amn/FYFnhL8FvyfcnSjSTNgfNhmZjUzGgZy0Op35XlWOZBto4
	MnMU4LZlFqlBKe3E5WB3XsEalke1mEQdH8noUQrKz2idQMaVl5JLiqRzKF1WLB1rVoZM
	Za8lrYUSPY62T6viVZlCqjg2w9Ym63Q+k5tER1Garj4S6m2ilE+t3FJpM/YBoGa19UOb
	16U1H/kDruD3WrItuVICO3FU2e2pgFKD88OLM4bufx0582gb7Pw2Jj960T1k2ib67wco
	sgl/9GYB7gma+UxbbCgx1DBvv0fz4HP2V6pN285NCXjmCS7EKfSgBb37YBRqc0iRj9Cx
	oysg==
X-Gm-Message-State: ALQs6tCf68gkKFcD0ryPG8H/aYmRQ3s+F917fKJsXEIJVwUYVb+ds5X3
	KiKs+zud6bc8lXdbNigSjqnU3BwVtd7Peb4LP31W5A==
X-Google-Smtp-Source: AB8JxZq3LhmoQ3F4lSS5u6wgd9MKNQzMbk1ahCiV23aeITYoafICk2Fa+ztYZUwygjGdNOLT/yK6hTiYe8SWlkbcNK0=
X-Received: by 2002:a2e:2283:: with SMTP id
	i125-v6mr29792216lji.47.1525801644592; 
	Tue, 08 May 2018 10:47:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:2581:0:0:0:0:0 with HTTP;
	Tue, 8 May 2018 10:46:43 -0700 (PDT)
In-Reply-To: <20180416130021.4428-2-koen.kooi@linaro.org>
References: <20180416130021.4428-1-koen.kooi@linaro.org>
	<20180416130021.4428-2-koen.kooi@linaro.org>
From: Ricardo Salveti <rsalveti@rsalveti.net>
Date: Tue, 8 May 2018 14:46:43 -0300
Message-ID: <CAHYQr0rKoHVVKec=Au7PX-TM=dMMPVbUdNJahvLaFzK6NAck8A@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/4] libcap: fix (base_)libdir usage
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
X-List-Received-Date: Tue, 08 May 2018 17:47:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 16, 2018 at 10:00 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> The recipe wants to install libs into base_libdir, but uses "basename $libdir" to derive that. That breaks in a multiarch setup. Use the proper variable and remove the inline python usage.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/recipes-support/libcap/libcap_2.25.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
> index d619a2e..47ecf34 100644
> --- a/meta/recipes-support/libcap/libcap_2.25.bb
> +++ b/meta/recipes-support/libcap/libcap_2.25.bb
> @@ -32,7 +32,7 @@ PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
>
>  EXTRA_OEMAKE = " \
>    INDENT=  \
> -  lib=${@os.path.basename('${libdir}')} \
> +  lib='${base_libdir}' \
>    RAISE_SETFCAP=no \
>    DYNAMIC=yes \
>    BUILD_GPERF=yes \

This creates a build failure when usrmerge is used, as libcap expects
only the lib folder name and not the lib path (and when usrmerge is
enabled base_libdir gets set to /usr/lib instead of /lib).

Since base_libdir and libdir are all based out baselib, can you
provide more details about how that broke your multiarch setup?

The failure when usrmerge is used:
WARNING: libcap-2.25-r0 do_package: QA Issue: libcap:
Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/usr/lib/libcap.so
  /usr/usr/lib/libcap.so.2
  /usr/usr/lib/libcap.so.2.25
  /usr/usr/lib/libcap.a
  /usr/usr/lib/pkgconfig
  /usr/usr/lib/pkgconfig/libcap.pc
  /usr/usr/lib/security/pam_cap.so

Thanks,
-- 
Ricardo Salveti de Araujo

