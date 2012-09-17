Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TDjHJ-0002RE-G7
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 23:54:53 +0200
Received: by eaad12 with SMTP id d12so2199949eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aRJrR1f1LbkSaN4F8PcV7eTFbnXgoCwSmdk5d7hUkfE=;
	b=Tp8uaSTS2vDblV9t3iJ7Qi39aJtFQTZL+/l8iv8fH0m1jI22RvC9tBbDdX5LT/Yst3
	VCPmFEsqHyvDVCkvvGhfqw+IjDX9Tk8hBteb8nGPs1v76WxcZQF9uJKxH6NDFWNy+8SP
	H9ylrGGbsrI6zocN48xw6yUnEzYoW6NrEKaHseBCm+7qHV/Iv46CbzuAuBL5fvPwVMAC
	XW/m2T9sI47Fdq1uhauAY0Iyu+UtLrqlKJzeK8BFXqmQj77loMi0aBDpcHEKPf07h+eH
	J/NDw57raKxA5SRrjjWFzjL7qYFHfI8LD+IzI0ODebQ5jZElDIxZg5JE2TTfKgEQCEwY
	Borw==
Received: by 10.14.202.66 with SMTP id c42mr15199646eeo.35.1347918134429; Mon,
	17 Sep 2012 14:42:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Mon, 17 Sep 2012 14:41:44 -0700 (PDT)
In-Reply-To: <bffdd81ac7ad4886f01f1046953fde45d858e16c.1347914898.git.raj.khem@gmail.com>
References: <cover.1347914898.git.raj.khem@gmail.com>
	<feb59cfcb48be1f8ad1e767a0a236f4f4fd92670.1347914898.git.raj.khem@gmail.com>
	<bffdd81ac7ad4886f01f1046953fde45d858e16c.1347914898.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Sep 2012 14:41:44 -0700
Message-ID: <CAMKF1sqGofc=vOcPCX=HtNRfVdcJgiVnfyssxgaPBpBzCHcvDA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 21:54:53 -0000
Content-Type: text/plain; charset=UTF-8

>
>  EGLIBC_BRANCH="eglibc-2_16"
> @@ -30,6 +30,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
>             file://0002-eglibc-menuconfig-hex-string-options.patch \
>             file://0003-eglibc-menuconfig-build-instructions.patch \
>             file://0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch \
> +           file://file://fsl-ppc-no-fsqrt.patch \


I have fixed this typo on the branch

>            "
>  LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>        file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
> --
> 1.7.9.5
>


