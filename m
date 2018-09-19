Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 929AA78DFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:46:33 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id b19-v6so2282835qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 20:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i7LoMvi/ROTDOFqFt/WBn7cXO8r0e4MME7WmBcchjtg=;
	b=kKy8NiGzzAbvkpwKtYPtQhTKsOsqnNZsAROcDFbzT5YFD28kxpYXhz5HgavztKrFi9
	vY1wEm5UEYfRpBSuK0oCQHp4fzg3HMtBXTDuxwlcgxLN9h4AkVtrwKp+Ci3BZnP2u9QY
	KoKdVBRzUPOqENqQJiamgG/Y41Uvr3PI2lThc2XPStjB5Gis6YbU2zLQG+RgU8dwhl/o
	qQYmyz5+J08/1uBnoIpmEsXXJoOQKJmy8NgK/cbEUoGhKeiVfUhtXC8LKRONHY84t7cG
	umeHAtvwtEeoFwjzF19Bp1utZQ3pVj+hbsO4oh/AETeGXbS6KBwMcbb9XBS2LTAxNRwe
	PqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i7LoMvi/ROTDOFqFt/WBn7cXO8r0e4MME7WmBcchjtg=;
	b=WSpjUYYLX4RfWlpWfhMRTB1OEKy5jC+rQPWo66FIzcAIgoPHKqMnVtKIPe+L8MCVki
	V7Z7KS2eAO1uY80Qbg97n58UxccJ4EpB38HYoJ0xzccD4LnIGSE39TZYYMzmu8C/2h6z
	nndH6+4WnoDaWnfnoSbp49JAdMV91V6Ol1FyjGQuATA5Cve2ZXTuL/WJVoWTJNIobv2z
	UpQ7pPkrFgNO/EnFiIFe754Vmv8xpqsBEwaDLyXkRP5Kd/w321edsuJnyrB7bq3B9Wmr
	CMfhjiRZT91NI8LrtVoQlS1IdP7IzrjrvFaJoZ+PvgeCloFXgL4oY5mIiXLG34lU9ce5
	XCYA==
X-Gm-Message-State: APzg51D6Gf4N9Xqdzgc1+fQTgzjCi86SuYUi+XsVbkevw+SWJhtjfI8+
	2doUKDkQH9FK8ff2tSXI3XdJcuYyhwMB8iz3jgkwAHAK
X-Google-Smtp-Source: ANB0VdaF3Z6JE97pYzMT95CbEjNAiKcU0jAfNYIVhXCPCZGFoVZG+39actpkLxy1vMAoBbAnytbPGVw1EpyLeh9YNPg=
X-Received: by 2002:a37:c04f:: with SMTP id
	o76-v6mr22646177qki.315.1537328794321; 
	Tue, 18 Sep 2018 20:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <1537327350-27510-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1537327350-27510-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 20:46:08 -0700
Message-ID: <CAMKF1spULQDLXWp7bkq-TAgEkKpuUDVY2HZCiqcu_UuXpUuMZw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: upgrade 7.8p1 -> 7.8p2 to support openssl 1.1.x
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
X-List-Received-Date: Wed, 19 Sep 2018 03:46:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 18, 2018 at 8:12 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> - Convert from tarball to git repository which support
>   openssl 1.1.x
>
> - There is no specific minor version that contains the
>   openssl fix (it was merged to master a few days agao),
>   but their next minor version will be p2.
>

I think we should test this patch and it would be good to get this in release

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../openssh/{openssh_7.8p1.bb => openssh_7.8p2.bb}             | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-connectivity/openssh/{openssh_7.8p1.bb => openssh_7.8p2.bb} (94%)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb b/meta/recipes-connectivity/openssh/openssh_7.8p2.bb
> similarity index 94%
> rename from meta/recipes-connectivity/openssh/openssh_7.8p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_7.8p2.bb
> index f4b295f..b74461e 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.8p2.bb
> @@ -8,11 +8,10 @@ SECTION = "console/network"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
>
> -# openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
> -DEPENDS = "zlib openssl10"
> +DEPENDS = "zlib openssl"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> -SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
> +SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
>             file://sshd_config \
>             file://ssh_config \
>             file://init \
> @@ -29,8 +28,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>
>  PAM_SRC_URI = "file://sshd"
>
> -SRC_URI[md5sum] = "ce1d090fa6239fd38eb989d5e983b074"
> -SRC_URI[sha256sum] = "1a484bb15152c183bb2514e112aa30dd34138c3cfb032eee5490a66c507144ca"
> +SRCREV = "cce8cbe0ed7d1ba3a575310e0b63c193326ae616"
> +
> +S = "${WORKDIR}/git"
>
>  inherit useradd update-rc.d update-alternatives systemd
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

