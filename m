Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A09F7E34F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 20:49:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c6so1680580wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=DvVfcjiCTgjHbMxooCC3tytviuj/QW0Lwhp5ulWASBg=;
	b=L2DENTUl8GsEgK3TgAK6wXUVWm35071ZUqtBZxIsgGw1tFLI0c63qJdW731KrO1lWw
	vxnD5f9P08gcdfi9x2svFiTVS10kSdMmOwDf/Ix6diQ9N43lZOsK5atS3VkHsLdrekSe
	Fs8/WTrSbAxKv+vy8WmBeBmR5XDD8JOUaZDnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DvVfcjiCTgjHbMxooCC3tytviuj/QW0Lwhp5ulWASBg=;
	b=Rjmpiz3MNzT7C9u4IgW0ufPkO2CRiLZRyLLQM++0qYQpMKUd+08Y//KjMHqZioX12o
	kpUlDxyHxPLzB8Dirt8z2gx7+aQ+RtRkAvuL+YvFY4lEre2GWna9tffR6HlzLwLSo7/a
	KsYW3LDi/21S/ZIhJd1WLNIdKfxZNnJdxkRIR8n9zSEafY/FM/TtoBazu2RdBb0PJN9o
	2PDY0zY/kz44Pe7PQBSgSg+VYuD5XXJdXAzuNKbI+Pp1ztQ7ZjCGxxXW9efggbrvPWGW
	6BVnlMsZX4xyVscxo15aw+QxyGi7S1z/nV8NT9HKDJUHWmoidMWliMVG4svc8Pwu74Uo
	waFQ==
X-Gm-Message-State: APjAAAXolccpUsZYvYsuRyJgFe0a9BdPZeftp+Ek3lXt8+FNsr+33/rv
	l2H4UMv05rK2UQNs0dXw38HUfA==
X-Google-Smtp-Source: APXvYqz6/6TUuZ9dviRG3SismsPvDLdYjHSZMqukXpziue5aEwdK74RWaxT8BYP4aKvwn1+l35aXMg==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr3500677wmh.68.1559249363729;
	Thu, 30 May 2019 13:49:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w10sm5670965wrr.67.2019.05.30.13.49.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 13:49:22 -0700 (PDT)
Message-ID: <2464053a8ff6ebd77a312cbc70b7ffda2c559345.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 21:49:21 +0100
In-Reply-To: <1559196696-70652-1-git-send-email-mingli.yu@windriver.com>
References: <ba81c9ea11db351bde7fec1c40c2f57495c3fdec.camel@linuxfoundation.org>
	<1559196696-70652-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v4] elfutils: fix ptest failures
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
X-List-Received-Date: Thu, 30 May 2019 20:49:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 14:11 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> * Add missing files which needed by ptest test
>   to fix the ptest failures such as:
>   | sh: ../src/elflint: No such file or directory
>   | FAIL: asm-tst4
> 
> * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
>   to skip the tests which depend on gcc
> 
> * Define INHIBIT_PACKAGE_STRIP_FILES for elfutils to
>   avoid stripping some generated binaries otherwise
>   some of the tests such as test-nlist, run-strip-reloc.sh,
>   run-strip-strmerge.sh and so on will fail
> 
> Before:
> --------------------------------------------
> Recipe   | Passed    | Failed   | Skipped
> --------------------------------------------
> elfutils | 176       | 23       | 4
> --------------------------------------------
> 
> After:
> --------------------------------------------
> Recipe   | Passed    | Failed   | Skipped
> --------------------------------------------
> elfutils | 199       | 0       | 4
> --------------------------------------------

Thanks, this is better again. We do still have a musl issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/648

Error: 
 Problem: package packagegroup-core-full-cmdline-extended-1.0-r6.0.noarch requires iproute2, but none of the providers can be installed
  - package packagegroup-core-full-cmdline-1.0-r6.0.noarch requires packagegroup-core-full-cmdline-extended, but none of the providers can be installed
  - package iproute2-5.1.0-r0.0.core2_32 requires elfutils-ptest >= 0.176, but none of the providers can be installed
  - conflicting requests
  - nothing provides elfutils-binutils needed by elfutils-ptest-0.176-r0.0.core2_32
(try to add '--skip-broken' to skip uninstallable packages or '--nobest' to use not only best candidate packages)

Cheers,

Richard


