Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8D82C77160
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 15:10:18 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ik10so87972370igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 07:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JVaZxmWw2bDndbnPtP2R80rPEJ0e49qVYVbRYXT0osA=;
	b=KzleJI9WMkRSX5p8pcFnFhW7+RibYer5rStjWBQQtM/XxjclSF8iUPDymkbTsQt5VV
	8TdSRkZl4M3jiwSL2MvMQvZ6SP3fL7IfhIGebsZ5gRmVGKN89NQUFkVLp/d4m8aMpkkQ
	0xZK28JuNppYqdyRnnY7S9l2F2FZvAZb8oR1OkO6SLkOVIdpizhP4JHQlW6LU+btI1+0
	lZYl8QAWFSbWVzeEI5pwIyL6UCJVBmrJhUcIoOxgrw340TgAQ7UwexEM/2HBH0Eb/g6T
	z2QgQAwiOUMvVWy7mv2q4t+IsEChuIrgaeEF6c2piYFZnTasN5xi1BbCm+otvdeSGsTn
	uMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JVaZxmWw2bDndbnPtP2R80rPEJ0e49qVYVbRYXT0osA=;
	b=FtBGeZJCmXiBkFmGgJrfEHvWh3gzD+rR87UrpKuzA4zwq40HMa8lhqxwV2r5Qnaa4G
	CG0NYsviv69IzBjPDJJTf0OXggJFniCkZcMuAY6R23/ceHT20DaL5bGyAfg0qPee1iyZ
	P/rmncetkA+CSFAEsUL1OLVgUm0ztrPY2Ke5Tws16yp++GVB1yd70cmMW6rJc4czX/ul
	N1l5oz4PgZOBS52KOLrsECHtpZY4H+DWBsd4Ec4NQzylIS00dlWazLf7/HAsGBF2LCC0
	o1PQ8f1f/Nf6GQNZFTATXavzq38HqdJpZifaXQkII5cbcOegD/vPYkj4BlYvmpzCUCEE
	iKnQ==
X-Gm-Message-State: AG10YOSl0/ssB6tzQaRavW1BLD/h2lSdjdWCCKgmXgOMy4mby+OYKfbpnSBYcIyNwhxeTwoIe5fjwxp4C/1oYA==
X-Received: by 10.50.141.226 with SMTP id rr2mr21824925igb.75.1454512219674;
	Wed, 03 Feb 2016 07:10:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Wed, 3 Feb 2016 07:09:50 -0800 (PST)
In-Reply-To: <1454495755-6949-1-git-send-email-ross.burton@intel.com>
References: <1454495755-6949-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Feb 2016 07:09:50 -0800
Message-ID: <CAMKF1soKEOCBsT-eQHa_Txn6NE_zU=9YovZH2c6VmSDiJs1Ucw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] p11-kit: fix packaging warnings
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
X-List-Received-Date: Wed, 03 Feb 2016 15:10:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 3, 2016 at 2:35 AM, Ross Burton <ross.burton@intel.com> wrote:
> This recipe was ignoring the wrong test, so update INSANE_SKIP.
>

This fixes my lone world failure. see here
http://errors.yoctoproject.org/Errors/Build/12189/

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/p11-kit/p11-kit_0.22.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
> index 798ad37..a4efff1 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
> @@ -18,4 +18,4 @@ FILES_${PN} += " \
>      ${libdir}/pkcs11/*.la"
>
>  # PN contains p11-kit-proxy.so, a symlink to a loadable module
> -INSANE_SKIP_${PN} = "dev-elf"
> +INSANE_SKIP_${PN} = "dev-so"
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

