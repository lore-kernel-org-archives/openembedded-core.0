Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BEAB9788CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 11:15:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f206so26266900wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=bJTGnxYSzmQtL5tkb9xHviLQHRt7tHxGWxI8s3qHObo=;
	b=XbZ4+3EPihVeGyRM+PRdkjOlz3QDaTAkNwWR5u5YXOGDZpwkT24dLBLLxdefra6JUP
	gDiBwktmrqNi/z4QJl+rFi/RGTu7gx0ec/sB/Sl9ZcXJBWAeko0THLclGl8//uDBLAyp
	Ti1LEEwFLYuQ5zINzV4QDCJ7FM5yzuVGPX3xNBxxWtTDk9Wiy3YSj+NyqoujbXiMbDNE
	H0oa+oEgt7epSYtLnArvEYVOgpiz7rpmIhCitMPQK60DqAZWihxKyqU7vOQP1kYrKnCm
	aRoKO4xtZ/breYIgqcUBUbvUDxa+YesUhFpK6JpDLg4gJMq71omoqYbYAKvnNFWKbPrA
	ZVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=bJTGnxYSzmQtL5tkb9xHviLQHRt7tHxGWxI8s3qHObo=;
	b=kyjMybgOd03SsD/TQsGbCtblA6YZMIy4BwGna0PSg+JMRBayZ3tYTFkpcP9AKpWiAZ
	efE2iSxEfWuZha13JX4D217YO7PUfPPrur7xr5GPBOOeKGwwrzSu+W+0d6AXsWR6nbn9
	nrJLKdpoC4kyZGh7lrisXMnRF/b0LVZ2tVDi/kOClr4RX/76tIb5+BH0HlVfeHanfYAS
	r7WCHJ8+4rwbqTyxniy05yLU7dnaJ82vuVEvpjI1vdwCXBBUAEWrYcKTGHGLMXhJWFoK
	nXcLs4bLKtt/g/+QaiVSk1pCcnD0YQljAgeUSSS8QI6ejTM4G54syIbqk/GbE/q5zhah
	nBPw==
X-Gm-Message-State: AKGB3mKKELmf7jhzp7ocmMvANkoRkN71ISUHPHXuhuWhc+ztfzWB7eeq
	sBgRTmnI9/8AXJr/wIm6OeSh
X-Google-Smtp-Source: ACJfBovQPwCx2RGcxh11lWkbSVeTF8exoEXll9V5PxL5g1KxqhTyJDJ9zWMgorgtd96iMGUClAXymw==
X-Received: by 10.28.144.7 with SMTP id s7mr15402529wmd.89.1515582920523;
	Wed, 10 Jan 2018 03:15:20 -0800 (PST)
Received: from pohly-mobl1 (p54BD55C5.dip0.t-ipconnect.de. [84.189.85.197])
	by smtp.gmail.com with ESMTPSA id
	r9sm15974664wrg.74.2018.01.10.03.15.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Jan 2018 03:15:19 -0800 (PST)
Message-ID: <1515582919.6718.21.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>, =?ISO-8859-1?Q?Jos=E9?= Bollo
	<jobol@nonadev.net>, wenzong fan <wenzong.fan@windriver.com>
Date: Wed, 10 Jan 2018 12:15:19 +0100
In-Reply-To: <0f571a17-21c2-7d3d-96eb-cabf261af289@windriver.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
	<0f571a17-21c2-7d3d-96eb-cabf261af289@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Wed, 10 Jan 2018 11:15:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-01-09 at 11:51 -0600, Mark Hatle wrote:
> On 1/4/18 4:41 AM, Patrick Ohly wrote:
> > On Thu, 2018-01-04 at 11:18 +0100, José Bollo wrote:
> > > > Do you agree to move the patch to Smack specific layer? Such
> > > > as 
> > > > meta-security?
> > > 
> > > I agree.
> > 
> > Layers like meta-security should not modify recipes from other
> > layers,
> > at least not by default. That would violate the "Yocto Compatible
> > 2.0"
> > rules.
> 
> You can modify (bbappend) to an existing recipe.  You can't change
> the behavior
> (specifically the md5sum) of the function though, unless that new
> functionality
> is enabled.)

That's what I meant with "by default".

> 'smack' should be able to do the same thing, with a similar distro
> feature.

I'm not convinced that building core components differently depending
on such distro features is desirable, because it makes "smack" and
"selinux" mutually exclusive. I'd prefer a solution where support for
both can be enabled and then on the image itself the tools decide what
to do. Whether that's always possible of course is a different
question.

In this case I think it is, by adding the exception for
security.selinux. But I'll leave that up to you and Jose to decide.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



