Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 08CDD602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 10:15:16 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id n202-v6so20467125ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o+RSXabAAStf7u73OQOiA1H/KK8+r2hE97uFFblHSZQ=;
	b=kNymEiWUTJtfVTk+tJ2xHmgA/qAkORDSmXD+Hzd9Zk6W2lfzXHOGYcZ4JsVP8QvP8C
	BD1S7tANm2e1ZLmKfcqrxfp8uS+44U1bdS13iB1348bzSbT2RouPpFdL8qznCxFw2xHh
	7xihdAh3FUVcMALoENpoyCHdwuujel5xNx2LghI2x7HIE16slgaJsVl2cxFIBjyCK1BS
	w4YKldATboXo3uf0UUOWkYVDqWl8BXtFuKABpanZCNiPhwjCQqAQAnbWKzyvIP29phPA
	6rGciOwhVNnTy4UXFOr55/jxdOHi7f+apGFMHUNGPnztJ+8O/cNZ4yQBZV0wUy6i/fRm
	N1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o+RSXabAAStf7u73OQOiA1H/KK8+r2hE97uFFblHSZQ=;
	b=dM1S5UfsCDSDcGEZMg/zZILFajzweMmEWPa6ElKY17ELmTsu9dy1+DCWmqkC8VUF2U
	BllT2YDs57iSqOq3jXy39Z8GaOgXnEw0XkzJ7K4pCuyUQgc0CBxrd7ldWM3Ozha4tREL
	kC/sNbLam6J6WAW++wLTM+C2h6Vj6xAu46/BcY5VvQW8gtvqtLAd1QNUk5GHgAufJN7u
	bVdxiJ1ijB7hzZ4OxsF9WugRhe87sVcmS6cEtGLGeT7jFtcRgg6Zd9jZyIdnFG28IDCW
	8hdzSYSi1Cl5IxCdBjhZKpVtoZEXmkeph8iZ97QcVOKXbuMqzTKz3tqWM9vvwbAWkEmX
	43kA==
X-Gm-Message-State: ALKqPweODffTbbOmmrcTYqZVFQfJOIg2mi2clEAk1/siWIAaMPfpyRtw
	vzZxrJgZ3Sbh541OImS//DYqmttkck/Fny5eFeD2Qw==
X-Google-Smtp-Source: AB8JxZqhc4y4pQf2eKP51DQ+x6Ggdq2I7rpjJIUgJ8kIy/c22e5BPayDrtFSiNeZVNyHMrXs0hbF23cJJQ8Azy+bvdc=
X-Received: by 2002:a24:496:: with SMTP id
	144-v6mr16478178itb.131.1526897717841; 
	Mon, 21 May 2018 03:15:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Mon, 21 May 2018 03:14:57 -0700 (PDT)
In-Reply-To: <CANNYZj8nv6EDkp46yJjxqBQs3jRZcTFeP19e5uKA_ye0a0JH6A@mail.gmail.com>
References: <20180520220442.16092-1-raj.khem@gmail.com>
	<20180520220442.16092-2-raj.khem@gmail.com>
	<CANNYZj8nv6EDkp46yJjxqBQs3jRZcTFeP19e5uKA_ye0a0JH6A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 May 2018 11:14:57 +0100
Message-ID: <CAJTo0LZdLBNX5p-=2YFj-pJ2m=KHO_MXRD9UVj6L8SuqgSHOdw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] webkitgtk: Upgrade to 2.20.2
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
X-List-Received-Date: Mon, 21 May 2018 10:15:17 -0000
Content-Type: text/plain; charset="UTF-8"

On 21 May 2018 at 07:07, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> 2018-05-21 1:04 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>> +Subject: [PATCH] soup: Forward declare URL class
>> +
>> +This helps getting away with compiler errors seen with clang
>> +
>> +/mnt/a/oe/workspace/sources/webkitgtk/Source/WebCore/platform/network/soup/SoupNetworkSession.h:68:62:
>> +error: unknown type name 'URL'
>> +    static std::optional<ResourceError> checkTLSErrors(const URL&,
>> +GTlsCertificate*, GTlsCertificateFlags);
>
> Thanks - gcc has the same issue. I'm not sure how upstream is able to build.

https://trac.webkit.org/changeset/231876/webkit

Ross

