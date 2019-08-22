Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5A17DF23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 13:27:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b16so5414754wrq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=tVxbnlB4j6+OgV8iZMTXE2yrlHi+NbNtAb8HMSM26iU=;
	b=Ldms1YAgTBEsHYTm0Ggq9mf/AYU7R/ANwgjwhEAWQjoH5UIeHbt/+6vQjnLAH1aTP8
	PLthurc23C7NHOzSJcbpOdUZIUQg+zNQjk9HKGiAjSn/fS2nTdUAX1ypDq+Yy4Swuxsk
	cuEU7s5emeJxVE6YbgxsVPXqaK5npkZKf6BFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tVxbnlB4j6+OgV8iZMTXE2yrlHi+NbNtAb8HMSM26iU=;
	b=R1lvs1Ap47Ndl0F660t3QrqKZKW5hyuVJoKlodakBI0pNsqZBlIAzavLfw7D4gecvg
	xvV4mBlremxDOfwa+7EpwhMNNy2d8JvbMsWOT1F5Rc+cabQ/UThmE6bHymq7AECwzDwb
	dRIMj+NywKxFulxR/q2ybiCOVPIMhQe+vAUarRSuXybfwsbQfqEzf657eocXCPnSlgOG
	5k72AWBzz1RgIW0BtlGMPdZPU40KEH8osXCwn+UNnwAPzMEN/iTTngSUwy9Ju2m9vdBm
	D6sIJFTRVqvuGRqML5XdZ3CDQrOyWspVyuxBbiBCXd+5O5VusYVM0BGs2qnLH0FTjfmh
	DYpw==
X-Gm-Message-State: APjAAAU4ZourysWv+aiZNfQFgC3qT5mQuSJ+J9I2smCS/45UPLjmMRD0
	b7obu2v/iOkr1+bWplAycPWy4w==
X-Google-Smtp-Source: APXvYqxnPsftKWESnQ7npM0PqNSmV+AFtwldYt6Ief8CYsT3itfnXEKTsxdkLGGav9QZpgeZUoZb9w==
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr49204332wrs.117.1566480476349;
	Thu, 22 Aug 2019 06:27:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c8sm24307011wrn.50.2019.08.22.06.27.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 06:27:55 -0700 (PDT)
Message-ID: <c23770674c0d20493ba564fe32a4503d78571480.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Thu, 22 Aug 2019 14:27:54 +0100
In-Reply-To: <1566438018-16251-3-git-send-email-hongxu.jia@windriver.com>
References: <1566438018-16251-1-git-send-email-hongxu.jia@windriver.com>
	<1566438018-16251-3-git-send-email-hongxu.jia@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] elfutils: 0.176 -> 0.177
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
X-List-Received-Date: Thu, 22 Aug 2019 13:27:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-22 at 09:40 +0800, Hongxu Jia wrote:
> - Update Debian patches
>   
> http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
> 
> - Rebase Debian patches to 0.177
>   debian/hppa_backend.diff
>   debian/mips_backend.diff
>   debian/arm_backend.diff
>   debian/mips_readelf_w.patch
>   debian/testsuite-ignore-elflint.diff
>   debian/mips_cfi.patch
> 
> - Fix build failure while applying debian patches
>   0001-fix-compile-failure-with-debian-patches.patch
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../{elfutils_0.176.bb => elfutils_0.177.bb}       |   8 +-
>  ...ferences-between-mips-machine-identifiers.patch |  12 +-
>  ...1-fix-compile-failure-with-debian-patches.patch |  48 ++++++++
>  ...-support-for-mips64-abis-in-mips_retval.c.patch |  13 +-
>  .../0003-Add-mips-n64-relocation-format-hack.patch |  60 +++++-----
>  .../elfutils/files/debian/arm_backend.diff         |  39 +++---
>  .../elfutils/files/debian/disable_werror.patch     |  19 +--
>  .../elfutils/files/debian/hppa_backend.diff        |  57 +++++----
>  .../elfutils/files/debian/hurd_path.patch          |  17 +--
>  .../elfutils/files/debian/ignore_strmerge.diff     |  15 +--
>  .../elfutils/files/debian/kfreebsd_path.patch      |  13 +-
>  .../elfutils/files/debian/mips_backend.diff        |  42 ++++---
>  .../elfutils/files/debian/mips_cfi.patch           | 131
> +++++++++++++++++++++
>  .../elfutils/files/debian/mips_readelf_w.patch     |  22 ++--
>  .../files/debian/testsuite-ignore-elflint.diff     |  22 ++--
>  15 files changed, 340 insertions(+), 178 deletions(-)
>  rename meta/recipes-devtools/elfutils/{elfutils_0.176.bb =>
> elfutils_0.177.bb} (95%)
>  create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-
> fix-compile-failure-with-debian-patches.patch
>  create mode 100644 meta/recipes-
> devtools/elfutils/files/debian/mips_cfi.patch

I think the musl patches need refreshing as there are warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/962
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/963

Cheers,

Richard


