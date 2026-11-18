Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4144.1795045462668872925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 15:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Qus8BUCV;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso821740f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045461; x=1795650261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUTfqROzqb/rxcjg4zwdfpEy9z4jdL+qziQRr6dp6Go=;
        b=Qus8BUCVuen91FguEaoUSgTbqDAkxHsmXEEOWKR66RY0LiPrvCMCb5R5Zy7xesCvOt
         ceaj3bAN9NyVX2xLrqUm3tiTiqkN7fjzPOVUtd/tt674SAz9TDRvvkS1TyY3HWXSr/T2
         tbpPgib8hz9cskKiXR1pPL5yJo4V3A2y1+QWt30Su4hlwNocCwYNGoeN1sKtxoKUHxjz
         UXJXb1cMBw9N/8Ek6fKhIA2XeWYbAOjNJQUI6RYh07JGWJ5MghzLFW7AFgPYVNGUI0jA
         m9YcLhIPOxChiqVTpgNmr8HEm8LazFJmgXBHTq5gPRfCXSt6d5KIYbTK90xckWbGR8O8
         77Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045461; x=1795650261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUTfqROzqb/rxcjg4zwdfpEy9z4jdL+qziQRr6dp6Go=;
        b=EQ6bbZGevo3Vz3Z28tl4+jmVKiIBsRXkA3s5EQwp9qdmU1IIitV451oyVQuZAvgX3X
         uNpi4mYDRysOyAtmuHQL/3cA6jYh9Vhnwuesu5hjsN0aCZbaNaDxsW9v+VqPoqOUEgbh
         N49UBE5clgIiwwMl0TYAmOrPCCl7xVHLqnn6K8OcjFSWFr46sWXceLA2Gk/2DCpoPaVV
         1htluilLeDRcEaHxcauAlwDENOL45Ym/mZi5I769E5/gei6hWJWvL5kaAQiNuIaLqICT
         WzI1bXFnA1UuYaWzY9+bpLd4t8R/BmaeZsGOAIN+HQoj4FqD+jCylcW6D/0JcHirYW6C
         tcqw==
X-Gm-Message-State: APuU4Z8QPMMPyoAqwisWdq2covey+xSPuuY4l9IC6dirDXq0qqSs/4XN
	nNIr9IapkN5xVvhN2SuT521Rbr3IFuNO2h6BSwnbtgbPW3/Uk9yv2wuP
X-Gm-Gg: AZFdTZepnb3vIvW9CPBgEyQiKBywCrqdIjH55Njiu45/8hBWaKIAh6gzCxlHpR86Sx/
	pWHBgXeOB1D06A70rYOPOjEeGg2TLnU6hOJJEzqziBWJyBSKoKVOZ3VVy3gbFBSasKAM/3jC0yI
	dGOJaqr1NqCXJOQUFmPelcaZFIeQT71sptZL9jW/bEhr8QaeHP4+qFeO2cKF7rrFUXRRVVYNLvP
	ELnvPZepSXuarx52TJ8u5dQhhvLMwaYexRgP7sU1UsIvtsGoaolngxKIBJqMIqEx7wFkWTxeQ/s
	9/1jQl9h5RBWiYREfCOE6Cg5m5MC8PqOvrSPeYOLTY1Mkr5pLTJCOJyFDjnS1sP4i+SxdAx3dKY
	ihfCIO4OCDkuKwVwX47yO6Cnr1jzbbeAXuMr6XI3UQpfI+ljeEt7sEEIxMyQzQgIlhs8gpXq7OJ
	nX5teob0CJr3m2JripZz+4LdS6Ir+Z/wavCNOkdEz6Bsa6wyYU6JWWvKUzYdmbM2OjQkYku9k7W
	X+3rrPldCnWFbPmjprCu5mkgsQhUAKxE34QYKArSTmeikyOlfc5U8zNYoKFGzNcAGZ6KCQRhNLU
	YZx2dqS+na4=
X-Received: by 2002:a05:6000:1606:b0:48e:6f84:2e8e with SMTP id ffacd0b85a97d-4a63e6f1a49mr5377833f8f.39.1795045460650;
        Wed, 18 Nov 2026 15:44:20 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm7219021f8f.4.2026.11.18.15.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:44:18 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	stefano.tondo.ext@siemens.com
Subject: Re: [PATCH 3/4] spdx30: Add the PURLs of the source downloads to the output packages
Date: Thu, 19 Nov 2026 00:44:17 +0100
Message-ID: <20261118234417.3681522-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <DMYFTUY2A6RH.1WI2PDCNCPOJY@bootlin.com>
References: <DMYFTUY2A6RH.1WI2PDCNCPOJY@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 23:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250599
Content-Type: text/plain; charset="utf-8"

On Wed Nov 18, 2026 at 4:22 PM CET, Mathieu Dubois-Briand wrote:
> It looks like this is using memory in a way it got killed several times
> on the autobuilder. Locally, I managed to have a do_create_spdx task
> using more than 10GB of memory, with a value continuously increasing of
> about 100MB/s.
>
> This can be reproduced with master branch + your patches, then:
> bitbake python3-uv-build-native -c do_create_spdx
[...]
> Can you have a look at the issue?

Hi Mathieu,

Thanks for the report and the reproducer, and sorry for the broken
builds.

The bug is in patch 2/4, in get_cargo_scopes(). The walk over the
cargo dependency graph did not remember which workspace members it had
already expanded. In uv, the member uv-preview is a dev dependency of
itself. So the walk never ended, and its stack grew until the OOM
killer stopped the task. I could reproduce it: the task reached a 4 GB
limit in about 90 seconds.

python3-uv-build is the only cargo recipe in OE-Core with such a
cycle. The selftests use python3-bcrypt, which has none, so they did
not show it.

v2 expands each member only once and adds unit tests for member
cycles. With v2, do_create_spdx of python3-uv-build and
python3-uv-build-native takes less than 2 seconds and about 100 MB,
with uv-build 0.13.7 on master and 0.13.8 on master-next. For the
other cargo recipes in OE-Core, the result does not change.

I will send v2 now.

Regards,
Stefano
