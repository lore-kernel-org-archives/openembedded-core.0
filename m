Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8F17C4C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 04:07:34 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id e131so3390093vkf.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 20:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=66t7r+mlIPyhBBChz3Ks0fqyDs1JZXVLNlkjjsX6qng=;
	b=ngFZEBGg6PwGeISViBAU1OHV5mA/Vv3XzOawE8KoCSgCPvwUoEaJdtIA+iov15MIIG
	/zNIXj7HJPZ1BsxRoilUMH2hc87ErHN/jiIIDzE/iGsJb49k2S7L2FRp8nd3qKCAoToF
	hpBhEeQFtmhXNvrrA3KP0ydGimP5lnaECNON11aGGMGdTpf0/MKyQ08yJ842T/G63JPF
	vjOAOP8Ysch8jwKHFtY3dQaggQcnD0n4RHISw3w1gBAxcEQauZ9mkirdoqUgiVuCWnEC
	LwXMYF54QhV/zgav/PIlN49OaUhTyKP5IplKtMS3K9depKzYsYaJ7C11V6M0igc0iI3Y
	CWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=66t7r+mlIPyhBBChz3Ks0fqyDs1JZXVLNlkjjsX6qng=;
	b=nWkMi9i0RRCZ9l8QKWEVBPAiMZgJ63/gSwYwBsAJG5n+rdWPl/zDJO+a1mAl0n8SU5
	uj1eYlcYXqjkGvLhNpMGjmFj0QbFGS2+iDz+vopTaZ9dvRMpOCIBfu691k2XutSTIdNB
	zEECJuMDnX9FsotuGDw5ewpS+Rz6JHTs+aZRZ58raFwql713kRPxLj0hqrDmbIIz3xkV
	xvgZFQlG/Lkg62utg+zIb3ZnKYfqnnLrCDQUN3j9KmGVXY2eBBYeLAqbyZr5RnoqgH/m
	EbGWK9Lu0oSnVzidSgCf6sWt1UUKExVe7mcrAYt7d+ekGhPQy5l+kvecmhh5CS6Fids7
	aOZQ==
X-Gm-Message-State: APjAAAW/kcSgxCWOt95bs4stXXpYkSUqbyAPDCiiygZ/uQrEPXb2JIHe
	qFGB7FgEspQIrRztiT0J3jK3QCvy7ir98JZ3Kc4=
X-Google-Smtp-Source: APXvYqzV0W2K5xZnsYBmJ26zMZlOs4P3QvO87yyJIiJxka07wBezSWLNus9f/dP1YwSqZ1WbbiGWIm9hGz6SXkVT9MI=
X-Received: by 2002:a1f:c00f:: with SMTP id q15mr5433864vkf.10.1551931655343; 
	Wed, 06 Mar 2019 20:07:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551929817.git.liezhi.yang@windriver.com>
	<c0f7327fe54df3dd65b7650175968e8231f712f1.1551929817.git.liezhi.yang@windriver.com>
In-Reply-To: <c0f7327fe54df3dd65b7650175968e8231f712f1.1551929817.git.liezhi.yang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 6 Mar 2019 20:07:24 -0800
Message-ID: <CAJ86T=VJugTGbTfWT8jJuh5E-vHxR-oiaurZKfbji_Y7q0ekZA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] insane.bbclass: Make INSANE_SKIP work for qa pkgconfig and la
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
X-List-Received-Date: Thu, 07 Mar 2019 04:07:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 6, 2019 at 7:22 PM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> The INSANE_SKIP = "pkgconfig" or "la" didn't work, this patch fixes the problem.
>
> [YOCTO #13087]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/insane.bbclass | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 6411884..fd9c5f0 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -570,7 +570,7 @@ python populate_lic_qa_checksum() {
>          bb.fatal("Fatal QA errors found, failing task.")
>  }
>
> -def package_qa_check_staged(path,d):
> +def qa_check_staged(path,d):
>      """
>      Check staged la and pc files for common problems like references to the work
>      directory.
> @@ -589,20 +589,31 @@ def package_qa_check_staged(path,d):
>      else:
>          pkgconfigcheck = tmpdir
>
> +    skip = (d.getVar('INSANE_SKIP') or "").split()
> +    skip_la = False
> +    if 'la' in skip:
> +        bb.note("Recipe %s skipping qa chekcing: la" % d.getVar('PN'))

Typo (copied and pasted in various other places too).

> +        skip_la = True
> +
> +    skip_pkgconfig = False
> +    if 'pkgconfig' in skip:
> +        bb.note("Recipe %s skipping qa chekcing: pkgconfig" % d.getVar('PN'))
> +        skip_pkgconfig = True
> +
>      # find all .la and .pc files
>      # read the content
>      # and check for stuff that looks wrong
>      for root, dirs, files in os.walk(path):
>          for file in files:
>              path = os.path.join(root,file)
> -            if file.endswith(".la"):
> +            if file.endswith(".la") and not skip_la:
>                  with open(path) as f:
>                      file_content = f.read()
>                      file_content = file_content.replace(recipesysroot, "")
>                      if workdir in file_content:
>                          error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
>                          sane &= package_qa_handle_error("la", error_msg, d)
> -            elif file.endswith(".pc"):
> +            elif file.endswith(".pc") and not skip_pkgconfig:
>                  with open(path) as f:
>                      file_content = f.read()
>                      file_content = file_content.replace(recipesysroot, "")
> @@ -1034,8 +1045,7 @@ addtask do_package_qa_setscene
>
>  python do_qa_staging() {
>      bb.note("QA checking staging")
> -
> -    if not package_qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d):
> +    if not qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d):
>          bb.fatal("QA staging was broken by the package built above")
>  }
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

