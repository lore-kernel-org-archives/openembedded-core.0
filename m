Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE05C744F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 15:51:24 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w12-v6so786322plp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 08:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oGSn104sDtfkfwOHi+lMFd6paNRsBClp4Lv3c0IwWrs=;
	b=KB4+TR5CZmBPvt1BVdOcfhDuJaPJkSIESwXYOCVGNBFKKXPkZYczuuKSnpOYNMFk+w
	QFKelS6KTpwUaPxfOC42znTpagVMGBmb/lFMb4WPxljcmmj6j4QHWXT60Wz5zFhpS9xg
	/nRwRr0XFe3yhwwjLVjepM2rqzJAvbGk9Kw/QhUKdxqIFkQ+Xr8X0LRUjKV7vNxcn3sp
	5nTq0OPbaVKWjAYf9+a4G4dWJHJBNTGGyzSAPnLWRtUYsiRvl6uKlMPoA9taLjXNrKQ3
	X3HQMhg2Oh87KuXQNTMN9acXE7Pewv8EQW0z4Ml+85GdfldJb7weQkSkTcv+7SOhAilM
	ML0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oGSn104sDtfkfwOHi+lMFd6paNRsBClp4Lv3c0IwWrs=;
	b=aRzaPVDX9yypOzshFNHuhOwbj4Cw0wVDmnsCIuLDc3XH1XZEweMT1gT3WxIn5zRr5l
	Bl4V/BzQFVsZB3soFFUlevKCopqWSFrIrNRJHL7ZS2xB/SVqxGh6vHy3MuT+f/8cVwjl
	dfw3fFmCvlKCTg6sG+D4vSfL79qHolJwUA+ECgrA5N7CLE+UJIqgQCV6ufGEBzKq1THw
	59O2gr4L3QwdTk0y/2UMZQeI9zSSDbBr6SZNVepVSUXzfVvpybnd3VAzEtZDUyZ9koo8
	vFXwsxOojc9nq5QnmePwLN4JQEd1Lxl9gAfFmrx1Ho1IxIHqJ0qNHbhrycxinl/n32SL
	cKYw==
X-Gm-Message-State: ALQs6tAKc6jK7zYMcsFd3dwi9Q3UydH/Y/srfKw5L6NRx3Yfqh/OpaIY
	VveXWC/NA07PP+F8MXbsnFFR3F7d7+E9gojxAoc=
X-Google-Smtp-Source: AIpwx49hx1aQWEufB++ZgO1cRa1E7RPIoHi3SLCIfzNTCX0XDKIqnoADt13uHNNFW8cmY4wwHUSrWp2brZNpdAapkGo=
X-Received: by 2002:a17:902:9a0c:: with SMTP id
	v12-v6mr2739976plp.162.1523461885512; 
	Wed, 11 Apr 2018 08:51:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.187.129 with HTTP; Wed, 11 Apr 2018 08:50:55 -0700 (PDT)
In-Reply-To: <20180411143252.21109-1-otavio@ossystems.com.br>
References: <20180411143252.21109-1-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Apr 2018 08:50:55 -0700
Message-ID: <CAMKF1sri+r2BXXUcoWnb-kbqGgExkMyZKUwk3xGbE_UeSyk-qA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distro: default: Change Go default version to 1.9
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
X-List-Received-Date: Wed, 11 Apr 2018 15:51:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 11, 2018 at 7:32 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> For the time being, there is a serious bug[1] in Go 1.10 when it comes to
> use the shared runtime support which cases problems in multiple projects.
>
>  1. https://github.com/golang/go/issues/24640
>
> It is still unclear if the problem arises from a bug inside the
> compiler itself or it makes a real problem more visible. Either way,
> using 1.10 as default seems to be a risk so we are changing back to
> 1.9 for now.

agreed LGTM

>
> Refs: [YOCTO: #12631]
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/conf/distro/include/tcmode-default.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 7862edb6333..00399ae820c 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -72,7 +72,7 @@ PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>  # Setup suitable toolchain flags
>  require conf/distro/include/as-needed.inc
>
> -GOVERSION ?= "1.10%"
> +GOVERSION ?= "1.9%"
>  PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
>  PREFERRED_VERSION_go-cross-${TARGET_ARCH} ?= "${GOVERSION}"
>  PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
> --
> 2.17.0
>

