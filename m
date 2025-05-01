Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5EDC369D9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 01:58:59 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.2551.1746064736894529808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 18:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KFlBHldt;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-477282401b3so7333001cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 18:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746064735; x=1746669535; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hqx8CzX0ik/CZWtkrOz4YxqowAMWtXksSL0vaICO6Sg=;
        b=KFlBHldtgXjtbw/TFjQ1p5lITx585CtXyDN0l8F8YiM+wdIW4mhFPjktwTZ4ziFtuh
         wJSllBi/Fhmbdhp/tSvGhewhwAYhi4t0dgEgCnk4SdqLX9EoTomTg18lq/Kaz8M5fG9q
         aMux6qdcXUDJXQwkLAa45rL1ay9z5qZgtniXuozXnc2grFCbYbjrIV6O2yIJg61XmTgh
         tXjYhyidyWCggYt7lqky76RfxswKrT54v+1Yh06mdyOtYmZg3AQBZCRu4vaDKnjQxSVq
         Gq+Y9AAb4vmWyCSTQC4tms3GRaocPbvO90aY/bOX5DJ2wfUVmH0FBxQt2GbDR5J/w/Z6
         gf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746064735; x=1746669535;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hqx8CzX0ik/CZWtkrOz4YxqowAMWtXksSL0vaICO6Sg=;
        b=uZLoKhgX51n/yZdUE5wXgI7eSN7BcctNBVoG8ZRUYbVV6S0o++RXZuVaI/J9gfLyZv
         hV8JP4ecpU6ZTuI2IQLE4Z7EWf7yob4kUuqmk2IT+b9imGAkPzijwc5uY2Paia++xcfr
         qYLJfRwMO3corobzjSymIqFFugv2yDd9QCqhbdjrshl4gdYSteVnIi/ZaYLbhFEgbD5K
         FtrNYO8yUDr3nYxDAeQgLvEi5Rs3WHTyFECmBKvEkgLYLD91PdIHFvub9yHEqrO0SOw4
         0wg61y3QYcjoQwCqLVpHuJ3oyBzeQu7BTdkM6KoShB9b1gQ+0GFQNsDAHRusD4rVTbXv
         kyMw==
X-Gm-Message-State: AOJu0Yy1nzINk4Yt9Du9P5NbzxUOst9siCd4wl1EJIbjchMlcIruDiHF
	GBUQ4odVEpjZre1okDsHwflgsDVVvnopQ5txF1TKrSvgBocM0VV3MvKI5g==
X-Gm-Gg: ASbGncsv0ZnkqDRqfmUkjWhUqyWr6qW/xGPYIdk0TC8Z/ZIQr9r2GnDWBbkBBqh+WY/
	DeoDgvpaFZ+bdHIjVb8yupVl1uEPLMzSmP7PY2RUhAn2VpmOCjTThPFH2ipDbNoEgDrdHivc5Z4
	bcxV1UWQoCp8lRfYVWFspynhqKZvqV3ZdQkiAJff350Clwd7tDpPg1kd9bz6eqrE7viMMnPB6kq
	Zdc/BbMmYEduLcVm66HUxtt+/CZsc6pJSTsx5o96BFv9bTRtagQw2j7P4GuJDP/lRkqT/85i6qA
	hTlwQsnd7+CyK/Id84UBezC2+oZnRPb4NyOShh90qHayAKvJBCpvRsvVaHNL6dAt3avE
X-Google-Smtp-Source: AGHT+IFM/UlTxVdZwdiyw+F2PI+ODGSztmtgh5rbAPcY1mdhMpvEGcVhjgaG5zG3s+HsPtHbMB8BeQ==
X-Received: by 2002:a05:622a:1c06:b0:477:6ee2:18cd with SMTP id d75a77b69052e-48ae714d89emr27590361cf.5.1746064735025;
        Wed, 30 Apr 2025 18:58:55 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b0632d40fsm3719101cf.13.2025.04.30.18.58.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 18:58:54 -0700 (PDT)
Date: Wed, 30 Apr 2025 21:58:52 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] oe-selftest.wic: add native sysroot handling
Message-ID: <20250501015852.GA8447@localhost>
References: <183B42F7E49D5F97.21725@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <183B42F7E49D5F97.21725@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 01:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215759

Whoops! I didn't realize my previous patch had been applied! That patch
doesn't solve the issue, this one does, but is obviously formed wrong and
won't apply to oe-core's current HEAD.

A v3 is on the way!

On Wed 2025-04-30 @ 09:28:25 PM, Trevor Woerner via lists.openembedded.org wrote:
> The wic test_exclude_path_with_extra_space test succeeds on non-debian AB
> workers. Add native sysroot handling so parted from the wic-tools can be
> found on debian-based AB workers.
> 
> Fixes [YOCTO #15838]
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - It was previously suggested that the fix might be to copy the PATH
>   handling with a try...finally block that other tests perform; that did
>   not work on the debian workers either. The proper fix is this one
>   which is to explicitly pass the native sysroot path to wic explicitly.
>   In fact the wic help message explaining the purpose of the -n argument
>   explicitly mentions that it is for passing "the path to the native
>   sysroot containing the tools(parted and mtools) to use".
> - This was tested by moving my system /usr/sbin/parted out of the path
>   so it could not be invoked by this test. A test with parted out of the
>   way was done to demonstrate it would fail, then (with parted still out
>   of the way) this change was tested to demonstrate it working.
> ---
>  meta/lib/oeqa/selftest/cases/wic.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index d98af8713a19..267c7105c5ec 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -564,8 +564,9 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
>          bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'], 'core-image-minimal')
>          deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
>          machine = bb_vars['MACHINE']
> +        nativesysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
>          wicout = glob(os.path.join(deploy_dir, "core-image-minimal-%s.rootfs-*.wic" % machine))[0]
> -        size_of_root_partition = int(runCmd("wic ls %s" % wicout).output.split('\n')[2].split()[3])
> +        size_of_root_partition = int(runCmd("wic ls %s --native-sysroot %s" % (wicout, nativesysroot)).output.split('\n')[2].split()[3])
>          self.assertGreater(size_of_root_partition, 500000000)
>  
>      def test_include_path(self):
> -- 
> 2.44.0.501.g19981daefd7c
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215758): https://lists.openembedded.org/g/openembedded-core/message/215758
> Mute This Topic: https://lists.openembedded.org/mt/112552967/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


