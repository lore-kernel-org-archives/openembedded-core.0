Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2743B6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 07:58:37 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z24so987462pfh.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 23:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rqR/c/5OXw8fgFnKDW3eouh/V2LE9NMwAZJSUNGLxNA=;
	b=kMd9V3XB4ajWJpG/eUnsTWx46fN2dhmchOb3rSxAn8wHZ9DA74YYPS9ml6hlKC5s/3
	o7OTH+pdsIswXjTYEJAk0/keJG13phaAgUMKmNOQqb3hKEldR91DeTnt+d0YK5BB87sI
	Af2H7mQPJd+UierrdbJkymxAtAWyGUh6vP72Yj81V4H1vL1T/cBc2BI889M5RAvFMeWK
	XDTNsOkcRkHE/olKwQipcmuS89LucJzugDTABgJHS1biAWAPL2MYYy5sD1g36YqlWcGn
	WOQRA6CB7MwBKWJvr02Iy1vKp4FqrD0GSs/h906I8YOQ/JnxdNyjuxWRk6o2ekQCS2hX
	w1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=rqR/c/5OXw8fgFnKDW3eouh/V2LE9NMwAZJSUNGLxNA=;
	b=Vs486eYX7WIaGvDKsACFJD7rNbBDsoVetbYcZyKM48ZWP64nujd3v8YmfYIwWU33a5
	e8M+4zTI13WyfZ/M/AhVaqzMUml7Ny6HqPPFOpOVqh1sVq0gXBWSa0O6o4wm0HPMfA19
	CGf6VLW8fNe4Gtjyk+9ej7efELUB4y0UOGh1/grJuLJCTNX9UWXL9y8SuGD0OrIQJrIy
	YQz9pAR+AMa9bOFwqa4GuYLs6lgfPxCjgGHFWgNjQRFKlUCIv1+upbMVkcjsV+3USkgL
	waGq9JTNxh9OdT2GrJ+iOIrvP6OxaiG5P/oTPz4Kv+Zb9GOTbdyBBexXdbJV7VjIt/tf
	GktA==
X-Gm-Message-State: APf1xPC4gjObnxnTzkdlHCguMH04lhfTXLPnkxam67SFRclilb3SLDRl
	XDcCU2BWzQvwcmetfQoUngRiP77b
X-Google-Smtp-Source: AH8x226N1e6miJA7YiGHdQ0Ky1HTDhZlXjszqIfcWptJr6qBxrs2/00WbwgJJU3/WgwHpFPB4aMmSA==
X-Received: by 10.99.122.70 with SMTP id j6mr6291903pgn.17.1518940718606;
	Sat, 17 Feb 2018 23:58:38 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:109d:7df3:e4af:3b6d])
	by smtp.gmail.com with ESMTPSA id
	63sm46509629pgi.71.2018.02.17.23.58.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Feb 2018 23:58:37 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
	<CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
	<CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
Date: Sat, 17 Feb 2018 23:58:36 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Sun, 18 Feb 2018 07:58:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Wanted to send update on this issue

I got to bottom of this issue and Ross you should have known it :)

https://patchwork.openembedded.org/patch/127105/

introduced an optimization into nativesdk glibc to let it ride on 
localedate from SDK host. This has now broken in glibc with

https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272bbd7ba5fe62dc41be54

it is recommended for static programs to be relinked if using glibc 2.27
our case is also similar mismatch of libc version and localedata just in 
opposite direction where we are trying to read old data with new glibc 
instead.

I have initiated a discussion within glibc community on it to explore 
what options we have, but be prepared to ship full localedata in worst 
case with glibc 2.27,  this might be the worst case option if no 
alternative is found.

Thank you
-Khem

On 2/15/18 4:12 AM, Burton, Ross wrote:
> Yes, that's it.
> 
> Ross
> 
> On 12 February 2018 at 07:32, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>> wrote:
>     > Getting there: https://autobuilder.yocto.io/tgrid <https://autobuilder.yocto.io/tgrid>
>     >
>     > Just two actual problems:
>     > - The non-gplv3 build failed as the make fix needs to be backported to
>     > meta-gplv2
>     > - The eSDK selftests all failed with en_US.UTF-8 problems, the new glibc
>     > shouldn't be causing a problem with uninative so this is interesting, maybe
>     > the new one is behaving slightly differently.  Should be easy to replicate.
>     > The same problem caused selftest to fail.
>     >
> 
>     is the UTF error like this one
>     https://gist.github.com/25a84d23618824f0e5e6857a960eaca4
>     <https://gist.github.com/25a84d23618824f0e5e6857a960eaca4>
> 
>      > Ross
> 
> 

