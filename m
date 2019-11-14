Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60DA571BB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 10:57:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i10so5920383wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 02:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ow2IghwbvfvXNas8YAysXWMJaSD9eSWsobAIlM1q1mc=;
	b=KBab0xgW8Iw9tL3gt4puydOe5QYBgPl/JzWS1CJeMJfOI3F+tI7xdMIdg7V44nnp6G
	TwfpD2rJf53bfm/jnXyq68eIyfuOckAgambv4u+koiszasDuIZvNnMsDEmzPjToYS04l
	eAtmZSo+BKLzH9OwyD0rxacl1y2KYwqekPOr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ow2IghwbvfvXNas8YAysXWMJaSD9eSWsobAIlM1q1mc=;
	b=Ha+Z+3vE5mE5cNjLEaeMtbiKy/GRmuS+Cj6PkmbX7DsYRYMYKGTHYWlu7KdJ3GFOg1
	O2oQ5Ah+8JFuHMBjr4gtBSGq3CaP4s+OfzKf4NhNGM/JvHLv5ywjKszQaiqmGc1LQkqf
	52ZTFUMn2VKjkB/9fLvmdOiYIhrwCuhguXuUEqPJmOr8zD0Wy0GohcmBsV74fn3wUr4F
	vU5uBWWFP+C9KPFf6uH8q0ndAR3xu3RK76FvGLGJDrAGBuyY9SKkQuwXeT2fGNqnWePe
	dU+RlGYoD8Tw1XkbSIjEp5tl2caTegQbmjl22TC+O/uP0VU/K9SHqw7FDePds98RGld/
	Sj2A==
X-Gm-Message-State: APjAAAVXDbHr5yGVKTFV6epOlGN8mUTYINRgNT5/gpUxDGIpHpfBUGHe
	GSug4ocoypPQWFuDrmIFcHbOkA==
X-Google-Smtp-Source: APXvYqyL5hPY1lgNTbEvwvHNRqYYaWxbshpBOeHVpB0imCZrZR9+RGJQ9N3HninwpXyRX+brJXtlhw==
X-Received: by 2002:a05:6000:14a:: with SMTP id
	r10mr7321323wrx.310.1573729040949; 
	Thu, 14 Nov 2019 02:57:20 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p15sm5144168wmb.10.2019.11.14.02.57.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 02:57:20 -0800 (PST)
Message-ID: <03f3a6da02f47ec98111b7899612858737a33760.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 14 Nov 2019 10:57:18 +0000
In-Reply-To: <CAJ86T=VvV9C_WFhKzQ0JedNyKUggpUjhg0LQngGsW0dV3=rZkQ@mail.gmail.com>
References: <CAJ86T=W=wDNw7PPH5w5Vo0WEtdfZj41J036o3bAb=D4hiV9cVA@mail.gmail.com>
	<f53835dc2b5b9b2188d5e946ac1198c969821322.camel@linuxfoundation.org>
	<202eb2c6008a6eef16ed1a644e304607eb576999.camel@linuxfoundation.org>
	<CAJ86T=VvV9C_WFhKzQ0JedNyKUggpUjhg0LQngGsW0dV3=rZkQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: fetcher uses wrong SRCREV for class-native
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
X-List-Received-Date: Thu, 14 Nov 2019 10:57:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-13 at 08:40 -0800, Andre McCurdy wrote:
> On Wed, Nov 13, 2019 at 8:23 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2019-11-13 at 16:21 +0000, Richard Purdie wrote:
> > > I tried this with master and didn't see it reproduce. Do you
> > > have:
> > > 
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d427f58977a46f2bda4b7f30cf83793373e401d3
> > > 
> > > applied when your build sees this?
> > 
> > I just reverted that and retested. I started seeing a lot of
> > basehash
> > errors which tends to confirm my suspicion that the above patch is
> > the
> > same issue and fixes this. It does raise the idea we may be able to
> > make a testcase out of this though...
> 
> I tested with 2.7 and 3.0 but not latest master, so didn't have this
> fix.
> 
> Cherry-picking that one change does seem to fix the issue (tested
> with 2.7).

I've backported this to older bitbake branches.

Cheers,

Richard


