Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 501767F3DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 12:24:15 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id a4so5813904ljk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 05:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RY3EAjqkC7esH7L8BFDCEsBXQOELH1sO6l8DcWIsdGY=;
	b=NeLyXANLWO6MFiMblyDsy3RvsVlPsxXXGK1b0hxPqIcBuKOdSISPEExr31jly/+ZkV
	qM/aQzzjVr17ZF0T5E9JrI3dC8OZ7aCDUJLoeDGU7hX4kHp5TgkbQbLYloT7lFVzQhYT
	Ku1V25E3l1wuiGXw0XJNMc8vkieoKWabj6kqJk1klUN3OQSBN3K93z5NjsNfINu+xrtJ
	FjnGYHaml/lJskwxWF4zRLPb3sM/N88chxJZrveYI4MFCHYw9k230azmC+iAOctDeLnp
	LKNIciztmNjshQxa2WIySx912Ha2NVP6acoRrolP+GUrRVHdfhdu2JnSkMGK3RKzVUm4
	jd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RY3EAjqkC7esH7L8BFDCEsBXQOELH1sO6l8DcWIsdGY=;
	b=lwAZRHP/NISH6lWztjypi3cyTaiv+pz0BtX6xgpqrsRyiCi8a25QWwSAjayef/sRKY
	fEYWQ0wb099yNgDiy9gEAaUTSnEr7mRRD/zL34kI1wqmmIZ04iK33CpL8GanuM/jrCpy
	uc54G/utetadtGaogrWjj7H/ha0z+yaGBPvkMLebyDiaqPH901ZIe4sSlfUjCqHiBY2N
	rRa2iwHnzoy0qjRruXT5YAhsjJ8GEmPtpsWDdkyzAWBoWop2yfxvJ0rHqg2kS8n48jWw
	vxcQr8vt0N8Ir0V6nx+Nj6LeYbSpRXZruWfJTBoX/oxWtzb3551d6kSEiR4tZd/a66Bx
	c5MQ==
X-Gm-Message-State: APjAAAX4WU+I/rcP9PaZhkO5wl/Jm2A4dvoaxhXvGvLLzuJlj8VIigyT
	Ek+rIBJoucYnWMsTQ84piluku20QKaGyQmCSY6g=
X-Google-Smtp-Source: APXvYqwy9JhSysWcrCT8RTePnMTVD2/D/Khjyqi6mZaVBXB/dPaIykENhe0sg2UFiyXFcHXcUQzQ/kdAduN8qEoN6gU=
X-Received: by 2002:a2e:3c0b:: with SMTP id j11mr5574779lja.78.1567772655622; 
	Fri, 06 Sep 2019 05:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Sep 2019 08:24:04 -0400
Message-ID: <CADkTA4OFwO91cmwrvrTeHWHLF2iEz_JrxU=WODARQsiBqCSSHQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemtap: Test latest and greatest for 5.2 kernel
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
X-List-Received-Date: Fri, 06 Sep 2019 12:24:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019 at 3:24 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Systemtap has issues with the 5.2 kernel which are fixed in master, we helped
> debug and submitted some of the patches. Update to a git version which includes
> all the fixes.

And I can confirm that I can now run the stap test on all the arches with 5.2.

I'll send the rest of my 5.2 queue in a few hours (the removal of 5.0,
and setting 5.2 as default where needed). I just want to run a few
more tests before sending.

Cheers,

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index c5348b3204b..f16f851e610 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,7 +1,7 @@
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -SRCREV = "984d6d1696ed06626b07cb65ab55d6ae0ece1131"
> -PV = "4.1"
> +SRCREV = "a25199c9580b9b66424c494d3bf39c4d1b7e1f7b"
> +PV = "4.1+git${SRCPV}"
>
>  SRC_URI = "git://sourceware.org/git/systemtap.git \
>             file://configure-allow-to-disable-libvirt.patch \
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

