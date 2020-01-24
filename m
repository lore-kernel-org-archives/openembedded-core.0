Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 95BA97FD59
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 16:03:32 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j42so2569608wrj.12
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=clAC4zaaIICjoK5FP+0Uev3xepUG6DGNVJpjadAfJp8=;
	b=iA344oVgmZ1pgLj3jCCdVF/spKQgSNwlD8LdJWxSfyJh2uCK+x6E83FOqJGUpPSY+n
	TPTtHbnQbt/30CXLTrHGpuYcGQTup0L23rR3rc5tAdMRjI39yzJk5KpOFGnHrPR5zt1b
	BD5vjEMdZlEq4k1FQKFzLA3O5eKRopu4RKs9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=clAC4zaaIICjoK5FP+0Uev3xepUG6DGNVJpjadAfJp8=;
	b=HKGMKEy5I1M8Z1xGpRpCXxFstMHqWu1qxiJn8K1ncuT349007yXcfUHJvkUzOE97cR
	mjwksViiDLoaBBE3Sq1h+iQs9A/L7RNAl7op9CEnWWI73NKBNOEc/h+53einQGjZx4ul
	KgKR21Q7S43AOiiX+n987hMnkdkEYM9sZ8y//QNpNUCCWov64QvSssURdVr+ygbJrOjj
	VXhv/Z/OeENsaa0NY5PPqYBI4K+bnve/Br4LKo6mlb2J8PLA8jJWP2ejR6hgDbDF5IMG
	C35ZlsyRuRRb8d3mMvd5+EsRHZJifFjQ2a0KJ4WvUPOLf6xQSTYMfVyp1rPab9cRG5MI
	AqSg==
X-Gm-Message-State: APjAAAXAiqHoJEbLmpmTHQo225g755+3WOy9mbOhLIawl4hVPfNvh+Lc
	IrVaNGb9nqUMGNkbos8r8Jwapw==
X-Google-Smtp-Source: APXvYqy8dbEpxhOlg9nnk5IAVXHWOaewMjSZG29/s9dVrcaY/bZgu/M8sIFcNOm3xgXeZ6SgDKl6kA==
X-Received: by 2002:adf:f308:: with SMTP id i8mr5073923wro.42.1579881813217;
	Fri, 24 Jan 2020 08:03:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r62sm8367572wma.32.2020.01.24.08.03.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 08:03:32 -0800 (PST)
Message-ID: <49070937ed7f0ea84d7a667abd88af4c3ae6b92b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jan 2020 16:03:27 +0000
In-Reply-To: <CY4PR12MB1653D3CA9B953DF531F2FD7B8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CY4PR12MB165355D4A69E257FD4AB30298B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<e2eb64a553a0b7bf89a942cdf9a1c177c5145aaf.camel@linuxfoundation.org>
	<CY4PR12MB1653D3CA9B953DF531F2FD7B8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
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
X-List-Received-Date: Fri, 24 Jan 2020 16:03:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-01-24 at 15:26 +0000, chris.laplante@agilent.com wrote:
> Hi Richard,
> 
> > > I have a few concerns/questions:
> > > [a] Is the basic premise of a custom CLASSOVERRIDE supported by
> > > Yocto? Our situation seems a bit weird, because our emscripten
> > > recipes are still sort of “target” recipes, so I feel a bit funny
> > > completely wiping CLASSOVERRIDE.
> > 
> > I assume this class extension only applies for target recipes?
> > 
> > If so, why not append ":class-emscripten" to CLASSOVERRIDE rather
> > than
> > overwrite it? We support multiple overrides.
> 
> Makes sense, I'll give it a try. 
> 
> > > [b] At the very least, I know I did something wrong, because
> > > sometimes we get weird warnings like:
> > > 
> > > WARNING: app-emscripten-1.0+gitAUTOINC+1d1073e7c4-r0 do_compile:
> > > Manifest /home/user/yocto/build/tmp/sstate-control/manifest-
> > > x86_64_x86_64-nativesdk-library-emscripten.populate_sysroot not
> > > found
> > > in my_mach cortexa9t2hf-neon cortexa9t2hf-vfp cortexa9hf-neon
> > > cortexa9hf-vfp armv7at2hf-neon armv7ahf-neon armv7at2hf-vfp
> > > armv7ahf-
> > > vfp armv6thf-vfp armv6hf-vfp armv5tehf-vfp armv5ehf-vfp armv5thf-
> > > vfp
> > > armv5hf-vfp allarch x86_64_x86_64-nativesdk (variant '')?
> > > 
> > > ... usually followed by a build failure in “app-emscripten”
> > > because
> > > “library-emscripten:do_populate_sysroot” indeed didn’t run.
> > > Related
> > > to [a] or perhaps the stamp-extra-info lines?
> > 
> > I'd say the stamp-extra-info lines. Why do you think you want
> > those?
> 
> To be honest, I'm not completely sure. I based this class off of
> native.bbclass and nativesdk.bbclass and they both do it. I have
> little idea what stamp-extra-info actually does.  

My suggestion is not to do that. native and to a lesser extent
nativesdk are "special" in ways your class (being target related)
isn't.

Basically this code is how we were able to maintain a sysroot per
machine and pkgdata per machine.

The sysroot per machine is dead with recipe specific sysroots but today
we still have pkgdata shared per machine:

meta/classes/package.bbclass:do_packagedata[stamp-extra-info] = "${MACHINE_ARCH}"

which means the packagedata task will rerun per machine.

The nativesdk stamps only need to change per SDKMACHINE target (which
changes SDK_ARCH so we're fine there).

I'll try and remember to queue a cleanup for some bits of this as there
is a tiny bit of dead but harmless code.

Its in my queue to think about making pkgdata in WORKDIR then we could
ditch this whole thing.

> > > [c] Is there a better way to do the “sub-sysroot” (/usr/js)?
> > > Would
> > > multilib cover this whole use case?  (2)
> > 
> > No, it wouldn't since multilib assumes the headers are one set with
> > two
> > sets of binaries/libs. You are doing something quite similar to the
> > multilib class extension though.
> 
> OK, so the basic strategy seems OK then? 

I think so, but don't copy native/nativesdk! :) multlib is a better
reference (and doesn't do this with the stamps afaik).

Cheers,

Richard


