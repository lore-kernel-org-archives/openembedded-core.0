Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id A299A7ED81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 09:38:10 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m24so88234372ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 02:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tHJ7EMFRyRyqanvcY70r9P5z0mmIbfR8QaW/F2Z+UfA=;
	b=oZvkhGTFljpOMm1TIlQiclqXIsznkC71JKmm1jvDIor61MbdDnIJq6NyfXtfqun3eh
	/NJLhiXupEtf1GseGPPiMz5a8FOj4FtZTzyKqS5GZS3GeTIxqNadjasl1I36ruqNA4N1
	rmLJlVq8OlA4NTCVcIfRLjpL7JTmIIg2B/iFg0trXBUMoxT+i1VPSL9S7D1RkdjEOlMD
	gV0CZxlwD7JIihu/hvavRH74VLYzSKAlu39umPZIpQIFKuOZWLro5pdg36o8uKxm60di
	3q+oYylEUlAnznaURytZbbmywwoqojshsI08mnT+U9FW61Jk7J89QXiWjc7LvacDggn0
	1bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tHJ7EMFRyRyqanvcY70r9P5z0mmIbfR8QaW/F2Z+UfA=;
	b=iigEk3/eN9UWes8oDBlfetqwARNdu+L1tm+57ifO+cFznyb1j+35V6l6ERuoEqjTt9
	3h0bFVsUemRNrlNc1MkBgseX4rIKlm8AAex+fe7TYgZZaPLV5LBXQiIGJgllObsIhufp
	XQ4FNebfR/j3infr7p2h6RhMnekLu330OEt7DaZdYypLRudm8xfcoVlB+OSUNPYrA1Bx
	WDASh20Z0zGumWHHO9kUao7Gwc0pD3vR2csblY33Gbn3hwtWRxjSFLPKvM/jFJ1+TSHK
	t7vwZej/25iZxOesenOiMiUWdcX+ipO1FM6PYCLdvKE6Zb2w+fLSWCZ/neRWkG9Uetx9
	t2kg==
X-Gm-Message-State: APjAAAVsCEm+T+JhE1Gvn6uNtyZsrbU8DpaMXDrFXI9aHsoUHM1UF8rb
	IeXZ2JcYEEd4zf8tlys7Jtg1RhKETZKrKTQW4FkOmw==
X-Google-Smtp-Source: APXvYqy7aAMyauc0sMvnLmtHTgAlZq/rfZ+q0EFdI9JZu6nbRf93DEn8GttOulFReuq1s/K+J8LlNPMYlJSDae16Rdw=
X-Received: by 2002:a5e:9701:: with SMTP id w1mr77342192ioj.294.1563961091785; 
	Wed, 24 Jul 2019 02:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190724023833.13718-1-Qi.Chen@windriver.com>
In-Reply-To: <20190724023833.13718-1-Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jul 2019 10:38:00 +0100
Message-ID: <CAJTo0LYZ-hVc9VW=LuSCDo1L-0DVXpnPdKEdzqR54fVrsqMa1A@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] container-image-busybox: add a reference container image
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
X-List-Received-Date: Wed, 24 Jul 2019 09:38:10 -0000
Content-Type: text/plain; charset="UTF-8"

Are you aware of container-test-image.bb?  Curious what the point of this is.

Ross

On Wed, 24 Jul 2019 at 03:39, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Add a small busybox based container image.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/images/container-image-busybox.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta/recipes-core/images/container-image-busybox.bb
>
> diff --git a/meta/recipes-core/images/container-image-busybox.bb b/meta/recipes-core/images/container-image-busybox.bb
> new file mode 100644
> index 0000000000..a4d63b0eea
> --- /dev/null
> +++ b/meta/recipes-core/images/container-image-busybox.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "A small busybox based container image."
> +LICENSE = "MIT"
> +
> +IMAGE_INSTALL = "busybox"
> +IMAGE_LINGUAS = ""
> +IMAGE_FSTYPES = "container"
> +
> +inherit core-image
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

