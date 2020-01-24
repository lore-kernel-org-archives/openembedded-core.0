Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id E8C0F7FD16
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:04:50 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d16so2339214wre.10
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=BtwjUY53HUY951g48dU7Gly/UNDE8+0iBki3Z3TaItw=;
	b=JUfH/Zxf0W32Ip8w2u12H72sxowpFzuEBJ6EfTXWKSxRURnFLg7KXKUHfYlIeJUD7b
	UtiVpEZ7Wbm6kZS8e2AUrnQ99n4RCBr6vYEJihY97hNT27FfQCypO7F2sDPUBCFsD2Vr
	7CNWfmNLrxIoSaxI9zstYyHilFDKIreYvpbDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BtwjUY53HUY951g48dU7Gly/UNDE8+0iBki3Z3TaItw=;
	b=iWxUtATUe4uhGidnoziv7AwHBSfnr63N1kcC1AySvVDknav6x1cSm/5aEp/+UWNokF
	AHiDcTBLR02+o4kbmPJWoASqZRZrYU+FCU8OiAiI96O4AKrI3aDXSir3M9hIYyjjzZ1l
	614emBishYWIV3bAuyCsH4AzeGNuEhsMMiHWatUtVf8Ux6BQm7FP+l7B1hFfzm7FOg35
	bGbX069+uLi/SjaZQFoFVX5l6KFD98XJht1tND2t6/vtn1Mh0NtlGKGWnvpoX+mt9EHE
	1ULiBCIQiXRlSiRTDAEDu9AGdiJLvAWbz78qN1cHSge1/QQhPfcX4BfikXXMgqUPfZrN
	hS8w==
X-Gm-Message-State: APjAAAWiA3rxvBDzFpuEGHojkUx67bRGhGNfEMOHSoxNBCeNa75n4E8A
	R9Ff+a+m8F0YpGtvc9PBL6G16A==
X-Google-Smtp-Source: APXvYqyd74VS6EKWhJkTiso2Qgp14XXm7Mkf7dm3W765WvPCOTlgpENaR2wwR+hznIGl+5LyXIkZkw==
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr4834763wrm.80.1579878291518;
	Fri, 24 Jan 2020 07:04:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 11sm3549999wmb.14.2020.01.24.07.04.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 07:04:40 -0800 (PST)
Message-ID: <e2eb64a553a0b7bf89a942cdf9a1c177c5145aaf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jan 2020 15:04:36 +0000
In-Reply-To: <CY4PR12MB165355D4A69E257FD4AB30298B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CY4PR12MB165355D4A69E257FD4AB30298B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: "dave_clouser@agilent.com" <dave_clouser@agilent.com>
Subject: Re: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
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
X-List-Received-Date: Fri, 24 Jan 2020 15:04:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-01-24 at 14:04 +0000, chris.laplante@agilent.com wrote: 
> There are two main goals of this code. First, it sets up dependencies
> between -emscripten recipes. Second, it sets ‘prefix’ to be
> ‘/usr/js/’ so that, for example, a “foo” and “foo-emscripten” recipe
> that both install development headers won’t collide. I call this the
> “sub-sysroot”.
>  
> I have a few concerns/questions:
> [a] Is the basic premise of a custom CLASSOVERRIDE supported by
> Yocto? Our situation seems a bit weird, because our emscripten
> recipes are still sort of “target” recipes, so I feel a bit funny
> completely wiping CLASSOVERRIDE.

I assume this class extension only applies for target recipes?

If so, why not append ":class-emscripten" to CLASSOVERRIDE rather than
overwrite it? We support multiple overrides.

> [b] At the very least, I know I did something wrong, because
> sometimes we get weird warnings like:
>  
> WARNING: app-emscripten-1.0+gitAUTOINC+1d1073e7c4-r0 do_compile:
> Manifest /home/user/yocto/build/tmp/sstate-control/manifest-
> x86_64_x86_64-nativesdk-library-emscripten.populate_sysroot not found
> in my_mach cortexa9t2hf-neon cortexa9t2hf-vfp cortexa9hf-neon
> cortexa9hf-vfp armv7at2hf-neon armv7ahf-neon armv7at2hf-vfp armv7ahf-
> vfp armv6thf-vfp armv6hf-vfp armv5tehf-vfp armv5ehf-vfp armv5thf-vfp
> armv5hf-vfp allarch x86_64_x86_64-nativesdk (variant '')?
>  
> ... usually followed by a build failure in “app-emscripten” because
> “library-emscripten:do_populate_sysroot” indeed didn’t run. Related
> to [a] or perhaps the stamp-extra-info lines?

I'd say the stamp-extra-info lines. Why do you think you want those?

> 
> [c] Is there a better way to do the “sub-sysroot” (/usr/js)? Would
> multilib cover this whole use case?  (2)

No, it wouldn't since multilib assumes the headers are one set with two
sets of binaries/libs. You are doing something quite similar to the
multilib class extension though.


Cheers,

Richard


