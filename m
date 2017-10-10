Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 61090602D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 15:04:46 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z11so18907796pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=0iYJb3XQdOzRBuV9IkEzrFFYWrF8RWpeexT75zvi57w=;
	b=hCu1fzloC0U/uOolRXl5er4EEXegQvS+wpj4zMGnJqbw1NGfX1DIosDXO0hoGLkf9f
	puEyplP5QEsSG4HdYrqHU71lvwYimQiGx7dAaNzexHlySZuBSKAcJzV3CgOXbsNACqLJ
	0RllbnnQttw6z5z1jHc4yRjm2u5+kPfY6sfoOPACmyhqVhqueqitQB84FsGgvUvnnUys
	ETdnktwIR9Djh2RDM83z9tEoONtvr+GvEkqCxHQYU6lqTJb0PGag6M3C/pJ6C8dLd3Jr
	qa+YVP67kKaFKqjJCcQVkdqD3Cg30RYcOKCCYEr9h0tRFmM2HJxiAM+S0gMxrpP1sbRh
	/eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0iYJb3XQdOzRBuV9IkEzrFFYWrF8RWpeexT75zvi57w=;
	b=TLLr1xdZzdFx4pTwhDH5l0lH1n4I9h7HpWEnwZS5lTgu+iTMCJbG1bBRb1egZvI01N
	fZ6FNpwxll7C4EBF8gW+PDTKrr7OsH3NNVMf8H31ySFCFHjsOwJcppcrFKKnJPiM5lWi
	U5PMxXfdbj0rO0EmPCHyj2Xr31XKkuF1RUESLR6jllfdy4GIF5gC9uMOF/bQwt1penWH
	UfFC1yGe/ixy9GosE7u9/v+8ev70nZU/7mEOMKXWG+grm8CwxXdC6scZEsfUwgn08SQ1
	zRnnapGqNsUJVE5+ZYesyTDw1VPwFpR9dYc0FjAeQTW26gp4F5xo0AnqZbr+ybeXoIHO
	LQbw==
X-Gm-Message-State: AMCzsaXR00oFw/BO2lCjQAAKbP8zExdUf6dGhm9UfPMQpzYXjCutOhSs
	GW0She1z0P/eoqDN1nfAis5ODA==
X-Google-Smtp-Source: AOwi7QCFWZlqKGRjVnvzGwQ4WYj6ItcNm86laCNRTha+/FbuJg1Q4MmA7EizAo4CPLwGErSGaW45ww==
X-Received: by 10.98.60.211 with SMTP id b80mr13565463pfk.4.1507647887959;
	Tue, 10 Oct 2017 08:04:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:285d:9f92:b7c0:627f?
	([2601:202:4001:9ea0:285d:9f92:b7c0:627f])
	by smtp.gmail.com with ESMTPSA id
	n18sm20395684pfg.44.2017.10.10.08.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 08:04:47 -0700 (PDT)
References: <cover.1507301999.git.akuster808@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8ce08b15-e81f-a43e-22eb-bdeabf7aded9@gmail.com>
Date: Tue, 10 Oct 2017 08:04:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1507301999.git.akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/16] Morty next pull request
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
X-List-Received-Date: Tue, 10 Oct 2017 15:04:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Do I need to rebase this request now that Morty has been updated?

- armin


On 10/06/2017 08:02 AM, Armin Kuster wrote:
> Cover letter only
>
> Please consider these changes for Morty.
> Clean build on AB
>
> The following changes since commit e2fcc721c2af8e2785a91eaceea1d81f503ea2ec:
>
>   devtool.py: update testcase Ids in morty (2017-09-25 22:21:45 +0100)
>
> are available in the git repository at:
>
>   git://push.yoctoproject.org/poky-contrib akuster/morty-next
>
> Alexander Kanavin (1):
>   v86d: take tarball from debian
>
> Armin Kuster (7):
>   linux-yocto/4.1: update to 4.1.43 plus bluetooth CVE-2017-1000251
>   linux-yocto/4.4: update to 4.4.87 plus bluetooth: CVE-2017-1000251
>   lunux-yocto/4.8: update to 4.8.25 plus bluetooth: CVE-2017-1000251
>   linux-yotoc/4.1: update to 4.1.43 plus CVE-2017-1000251
>   linux-yotoc/4.4: update to 4.4.87 plus CVE-2017-1000251
>   linux-yotoc/4.8: update to 4.8.25 plus CVE-2017-1000251
>   libpng: lsb version 1.2.56 url fix
>
> Bruce Ashfield (1):
>   linux-yocto/4.1: fix gcc7 compilation and v4.1.39
>
> Leonardo Sandoval (2):
>   selftest/cases/signing: ignore removal errors when cleaning temporary
>     gpg directory
>   sign_rpm.bbclass: force rpm serial signing
>
> Maxin B. John (1):
>   hostap-utils: use w1.fi for SRC_URI
>
> Nicolas Dechesne (1):
>   kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz
>
> Ross Burton (3):
>   bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
>   diffstat: use HTTP mirror for SRC_URI
>   libpng: use SourceForge mirror
>
>  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 20 ++++++-------
>  .../recipes-kernel/linux/linux-yocto_4.4.bbappend  | 20 ++++++-------
>  .../recipes-kernel/linux/linux-yocto_4.8.bbappend  | 20 ++++++-------
>  meta/classes/kernel.bbclass                        | 18 ++++++------
>  meta/classes/sign_rpm.bbclass                      |  6 ++++
>  meta/lib/oeqa/selftest/signing.py                  |  7 +++--
>  meta/recipes-bsp/hostap/hostap-utils.inc           |  5 ++--
>  meta/recipes-bsp/v86d/v86d_0.1.10.bb               |  6 ++--
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
>  .../bluez5/bluez5/cve-2017-1000250.patch           | 34 ++++++++++++++++++++++
>  meta/recipes-devtools/diffstat/diffstat_1.61.bb    |  2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 ++++++-------
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 ++++++-------
>  meta/recipes-kernel/linux/linux-yocto_4.8.bb       | 20 ++++++-------
>  meta/recipes-lsb4/libpng/libpng12_1.2.56.bb        |  6 ++--
>  meta/recipes-multimedia/libpng/libpng_1.6.24.bb    |  6 ++--
>  22 files changed, 145 insertions(+), 102 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
>


