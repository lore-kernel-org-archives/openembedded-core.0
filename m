Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 40C276BE3A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 09:53:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i12so2270368wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 01:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ihT4SppjQ/e6kupOOx3yFiAtTE4ClQDlcTxzF0+jv0Q=;
	b=OlGZ+QEO4hP6l3rSMZbYCdbEwoN4zaWUpf9yzo/GeG3XLDTMtSbp2HMDej5EIE5LpD
	j0KC12DOuIItHnjWmNNeZ0Lp4QrYODc4Oc3tjgG3BeoqdRri2nvt1r2eDhgkw0hf4i8U
	iKe0MmY2AojUp25sAEQkBVydyfvNdExfAaww0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ihT4SppjQ/e6kupOOx3yFiAtTE4ClQDlcTxzF0+jv0Q=;
	b=S6c/MRa1ls0OUfVcc96x4GsKZjF6mmyJ7hSaKn02hny/FqgHwQdxmn/TkKVyjMxlvX
	kjYzzDKOWuhBQ65veDeFufMUFOeZElZD8cmYF50vEzMnjTshavVrL6AhcnV6bCeqKbl0
	FOnF0AYgV6MUqkJj1/NdMBG0XtIlSrex2fm9ardwzFMc2Sz/6i8VtNm64+TDtWxeiQiS
	hcBHobu29q7lFSonUb+59CyL8NKEjRimhRqwK/YMHbGR+iKbJ3C9xyugq33ORKwcVaD6
	gdQjxBRaQgAmzbPGc2YyHD8txFLYKYdVAjHbD/4CBfO+J/nm5dbH9Wfwgup1mReqHCpr
	RPFg==
X-Gm-Message-State: APjAAAXd/IpHzOrVphoeJFmvS7MfsiV8N0ZwPll2yk3efNyGjrVJiUBz
	QrVdwILdFHN+Ltlp5nisW0X/nQ==
X-Google-Smtp-Source: APXvYqyix4g3e932pEUNn5LaUrhRacglT/kpsmE/iRMWshy8wn3RHDzPmUAdt/BrasSkJSgXQk9cOQ==
X-Received: by 2002:a5d:4585:: with SMTP id p5mr9816887wrq.178.1551606816468; 
	Sun, 03 Mar 2019 01:53:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i74sm3628238wmg.48.2019.03.03.01.53.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 03 Mar 2019 01:53:35 -0800 (PST)
Message-ID: <251fc9a1392c1ee156baf93ae3222ae6066e9dfc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Mar 2019 09:53:33 +0000
In-Reply-To: <20190301090350.1937-1-zangrc.fnst@cn.fujitsu.com>
References: <20190301090350.1937-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] elfutils: upgrade 0.175 -> 0.176
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
X-List-Received-Date: Sun, 03 Mar 2019 09:53:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-01 at 17:03 +0800, Zang Ruochen wrote:
> upgrade from elfutils_0.175.bb to elfutils_0.176.bb
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../elfutils/{elfutils_0.175.bb => elfutils_0.176.bb}         | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/elfutils/{elfutils_0.175.bb =>
> elfutils_0.176.bb} (95%)
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> similarity index 95%
> rename from meta/recipes-devtools/elfutils/elfutils_0.175.bb
> rename to meta/recipes-devtools/elfutils/elfutils_0.176.bb
> index b0b9ddc736..fd901c9c9e 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> @@ -30,8 +30,8 @@ SRC_URI = "
> https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>             "
>  SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-
> for-glibc-assumptions-hel.patch"
>  
> -SRC_URI[md5sum] = "9a02b0382b78cc2d515fb950275d4c02"
> -SRC_URI[sha256sum] =
> "f7ef925541ee32c6d15ae5cb27da5f119e01a5ccdbe9fe57bf836730d7b7a65b"
> +SRC_URI[md5sum] = "077e4f49320cad82bf17a997068b1db9"
> +SRC_URI[sha256sum] =
> "eb5747c371b0af0f71e86215a5ebb88728533c3a104a43d4231963f308cd1023"
>  
>  inherit autotools gettext

This lead to build warnings:

WARNING: elfutils-native-0.176-r0 do_patch: 
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch disable_werror.patch
patching file config/eu.am
Hunk #1 succeeded at 73 with fuzz 1.

Now at patch disable_werror.patch

Cheers,

Richard


