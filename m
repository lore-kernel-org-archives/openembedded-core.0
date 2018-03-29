Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8A3744D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 23:36:42 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z73so6753196wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 16:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9znjV4jV98aD+FizC1deemdYv1Qsb4r7ypHp0oABsKs=;
	b=nVVUGJMdQQuB0MdtluUZQZEmKI4ZDlEFbynFI55oWJpWunYxpQphXVIQpMEINfr8Ez
	q76GX2dApnjhFRWUyp0pe5X9K6mclk9K00qirZEodlSc3Mx2m5f4MeoEyneITPxvNCRx
	J0oCjXZFzba03gmM0VD4UgZ8xG5rAjM+CjSEI/TmIRY6NOUSrHgwE8kcBBEOs8zLoaoa
	eHjHuQkMqU60VJBCTKgpE3cOttfHFdfjFir+irKAQmxXpI413sAhS2Ke61pnu0U2dNCd
	g17Ro7xwrd7NRFVwWXKG09F1M/YaVDFhq/HzkCTc1CbgJRFrEHSefvbpNDW2up9w5MXa
	OCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9znjV4jV98aD+FizC1deemdYv1Qsb4r7ypHp0oABsKs=;
	b=n/oFYtHCMa1GArXIBycZz1pm9obCsYxZb99ngA0IWbKn1zRIU/ZPqPapWac15GSwQj
	4XfI0BhmW9GgOCj9Ct7mUchxnBD5zT9zkgI+y8F3WNVdqDP353I7YXJPQYCTClsahmor
	ciifMsaKBwWitiVzxA1rUiSIIX6KsrPSRL5XeTeULtB7iGkMySXWAVTzwfin7XBv53LS
	CdSPmAUAnFcii3BVnvBXGs/rmRRfZYuJPAIxbbmJCvAkhbzwZR8y/Ku+VZnOOggrbVu/
	Xldzi1GrjeIHNY69uCAD9SffxBqpHlwJsr+RIJ+b7sJLIX//nq0Xn+m0p/3nnqKOpxEH
	GufQ==
X-Gm-Message-State: AElRT7GRodEZEhezLe7Ru6c9FrVr7WuPlU5meP2v5aguvpYL+cc65+bm
	CUtfSV3DJJr7TpR4tc+nvu4yZSL8zJ/36E5H5k8=
X-Google-Smtp-Source: AIpwx48EodMxrUIMZ0sPoUCx74c4A+2q9zCwS+ygfAY4dGxwrafc8P7/nwEHwXsp+gJPVjEeH5E8qyWod20QuDfK2to=
X-Received: by 10.223.134.47 with SMTP id 44mr7566799wrv.114.1522366602926;
	Thu, 29 Mar 2018 16:36:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Thu, 29 Mar 2018 16:36:42 -0700 (PDT)
In-Reply-To: <20180329231918.25272-1-california.l.sullivan@intel.com>
References: <20180329231918.25272-1-california.l.sullivan@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 29 Mar 2018 16:36:42 -0700
Message-ID: <CAJ86T=VbYnLPa=JZiYVC0zpr06Gzgvm0+NdCBjSMCusEF=Zhgg@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars: set default KERNEL_IMAGETYPE(S)
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
X-List-Received-Date: Thu, 29 Mar 2018 23:36:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 4:19 PM, California Sullivan
<california.l.sullivan@intel.com> wrote:
> With the change from assuming kernels will be named "vmlinuz"
> everywhere, to instead using KERNEL_IMAGETYPE, we require that
> KERNEL_IMAGETYPE is set to something. Instead of setting the default in
> multiple individual files, set it in default-distrovars.inc.
>
> Also set KERNEL_IMAGETYPES, as we will eventually be switching away from
> KERNEL_IMAGETYPE.
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> +
> +KERNEL_IMAGETYPE ??= "bzImage"

Isn't bzImage x86 specific? Setting it as the default also disagrees
with meta/conf/documentation.conf:

  KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device,
usually set by the machine configuration files and defaults to
'zImage'."

It might be nice to have an arch specific default (e.g. bzImage for
x86, vmlinux for MIPS and zImage for everything else?).

