Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3FF79CC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 21:32:37 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id b22-v6so15359227qtr.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 14:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T6ZJvQ1MJZRLJKnqPdnfC2+tbln7XmR7bvvUShyfCMc=;
	b=IP55RMX2Au15h4kUhT49f/AUC75MHavvIU/AkO3R4X7Q1pHCva6CiyDsqvfc3Q9zeN
	UwnwEON2ghW+y1ig1h9bqC/WtjipqRGPyluXJxhUETdRFhHMVkXIOGErXAN8UG+bxW3q
	P3TjyZrvbvgW7Yao/lnOobA0NJda4KU8I2jANEBWNQJA42X4tcAlJBpzOeQwxjoOZ07Q
	qjq+uPnWw5uId3iWTvLs3n+tMDB336ax0cTUxuaE3TgVOzmB39fA9krHK42cYbTuhtvN
	brTuR/ofai765udVsXrhaLufMHfIvh7ux/k2zmIwiJQQr1VDtjkV0WeLPqha4OeJ0v5W
	GoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T6ZJvQ1MJZRLJKnqPdnfC2+tbln7XmR7bvvUShyfCMc=;
	b=mmVKmbwU9fStmnUb9qeQf33wWkA7+J/t2pFtTtl3BIj+aFKLZU3IIxmDFz7d2ZkiIP
	Q9r3D++sM7vbBD/gedJ/uVF6iKRXiVDlX7nCmAlX7lkdoteze6egzuqzs1uYw+jIJXF9
	/3lBqNFpnVCYRek3I31uU103PUpw/blH+7r+ZN5gO+5JyKSP8FDVBGf/+ZsU4QO7wKbh
	QvPTPI3poThBtW8pmhOOdJWMiOPcFUCVDcga08zrZoRLMA2LwfZKnE7EPu+Zp1LAce9c
	zQpAQMGOl8fhMdjJvXkeji3yNX8J4Ma2s8WUF8QUhioLdnjjjLodg1VfSBrYYFElPjrJ
	Tzow==
X-Gm-Message-State: AGRZ1gK+fGW/i1+O84BfjcurAOOEaTr6Z6KNfwOXlMbeyoN5/FMkUlsX
	bvdC+IzwxY6fBGkvtTfaEuKYe89kccM7r/IyzJU=
X-Google-Smtp-Source: AJdET5c7nQNlfWsDKYjXUVgXeZe2G80qwi8DpDEl1SJd+HU4ErhcpFUKVqqs53jNuSCrpt8qJz+LTN6/vctCXzRIy+I=
X-Received: by 2002:aed:3e94:: with SMTP id
	n20-v6mr407726qtf.196.1540935157871; 
	Tue, 30 Oct 2018 14:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20181030152208.119322-1-oleksandr.kravchuk@pelagicore.com>
In-Reply-To: <20181030152208.119322-1-oleksandr.kravchuk@pelagicore.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Oct 2018 15:32:11 -0600
Message-ID: <CAMKF1spKv8dPCTcsmBtSjWYRxNkv+AxHsFrEmSc-zOjbiGneRg@mail.gmail.com>
To: open.source@oleksandr-kravchuk.com
Cc: oleksandr.kravchuk@pelagicore.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mpfr: fix SRC_URI
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
X-List-Received-Date: Tue, 30 Oct 2018 21:32:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 30, 2018 at 9:22 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> mpfr.org is not accessible at the moment.
>

it seems to back/working ok

> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  meta/recipes-support/mpfr/mpfr_4.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/mpfr/mpfr_4.0.1.bb b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
> index 2eee76a357..6c609589ed 100644
> --- a/meta/recipes-support/mpfr/mpfr_4.0.1.bb
> +++ b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
>  DEPENDS = "gmp autoconf-archive"
>
> -SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
> +SRC_URI = "https://ftp.gnu.org/gnu/mpfr/mpfr-${PV}.tar.xz \
>             file://0001-Fix-obsolete-ARC-asm-constraints.patch"
>  SRC_URI[md5sum] = "b8dd19bd9bb1ec8831a6a582a7308073"
>  SRC_URI[sha256sum] = "67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

