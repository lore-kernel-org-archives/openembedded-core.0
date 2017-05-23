Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ABF1C77D24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 15:11:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d127so40092094wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n1WgGR7iJvdPsgCxHoD6tu1lfx2vIaBS49mteemBG48=;
	b=pQ6miKVUbLywu1MWSlar2Wuy94fho9bNkC60NPcTbiEu4Ktxt/K/AV0IWWcSXWjzn3
	PJJpm2hhA7FfuHqbH/2gcJvnZvetZSeJ47MkTlA4Y32l6896pI/DpUf/drEVZGmMaGLP
	kEsnhM4gpwfdVP+yz2UzlBkfVKVEBKTnxYP0UJbq6BtZrhBjd+82YUp3T6lis30699RS
	/Plgqv0GwwYCJwL1tZb0av2ztYoOy4y204MkTERBaocxvKBSlYAF4HnDbpLc4hSCay3j
	9HP/qv0M0+IPbz04l0UGcc2hlD06b/gZMdUQx4WaqrSc7w9mANXzHwamxhXwW3dt5MI8
	78hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n1WgGR7iJvdPsgCxHoD6tu1lfx2vIaBS49mteemBG48=;
	b=bBa31fCn6EHRLqvoR6TqxlSBGVRxcW9rI90Wrgn/tbKXG1rAJNe6MzpMPS6V21k5SC
	foYpoPvkJXxCoeOJzYEIN79UHoRQFuDU1ipNKnNSSuJrxDIUNbQTZPpQbYD43RTDwZIy
	gDKB2oD8sp+DsXSyQIjj/kti8PeWqUitZMrMrKDn3csVPBHaelvag7/MN2a/6F6M/r0w
	AuZKG2VtAg6/1LGGw+AyNx5kngsgbe7Of+clvm7geHTvd8mqZHCPsLy2ScaZaP+nkE7x
	VWZp/2xVJAALFpClK2BZMArEjTPyZoJD2QwQ5EOQCTATIWJX+qDBK/BGN/0MKa9IPKT/
	Pnsg==
X-Gm-Message-State: AODbwcDW3KcoZlmQwpOU7U8odoobI7j5V7kH4bVW7VkwP9SR8YXRKJ7L
	XkLMBHx1Ix2yc4HymheiyxDCrV0uxg==
X-Received: by 10.80.147.195 with SMTP id o61mr21194071eda.178.1495552286505; 
	Tue, 23 May 2017 08:11:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 23 May 2017 08:10:56 -0700 (PDT)
In-Reply-To: <CAJTo0LY8kj9EKXdZ5Lummhm1w=UKV4h3sfcHy+sY6+4qZFswxQ@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-10-raj.khem@gmail.com>
	<CAJTo0La8fX-H==K-R37j2uTG2s_a5ww0hmNqtLNOEox8C-EZuQ@mail.gmail.com>
	<CAMKF1sqQfmxrG+jOHoeS-kizz127zY1vDbO3Xo4qRVnqZD8cvw@mail.gmail.com>
	<CAJTo0Lbig6eUAOHX_UCLU7VM8QUG-Cj2JZoBzsfwbd7vpLKRdA@mail.gmail.com>
	<CAMKF1sp01SVCaG=g4=UKRM23OwYC1LpQSBmwde7j0GugV3R6Fg@mail.gmail.com>
	<CAJTo0LY8kj9EKXdZ5Lummhm1w=UKV4h3sfcHy+sY6+4qZFswxQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2017 08:10:56 -0700
Message-ID: <CAMKF1spWW94OytgBfdC7nCa7A+XXp1X8rw_rVSJMOJ6YY1P0fA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/15] db: Add --tag=CC to cross libtool invocation
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
X-List-Received-Date: Tue, 23 May 2017 15:11:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 8:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 23 May 2017 at 15:48, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> no its better, it reintroduced the deps and this time also on libgcc
>> which probably was latent. it worked because someone else pulled
>> libgcc into image. can you check readelf -d | grep DT_NEEDED output
>> from bins/solibs in db package. ?
>
>
> Using --tag=CC:
>
> $ readelf -d libdb.so |grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
> $ readelf -d libdb_cxx.so |grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>
> Using --tag=CXX:
>
> $ readelf -d libdb.so |grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
>  0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
> $ readelf -d libdb_cxx.so |grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
>  0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>

So I think we need to add the --tag inside the component configuration itself

> Ross

