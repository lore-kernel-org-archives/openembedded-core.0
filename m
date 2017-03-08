Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3E20F730F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 22:23:37 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id 77so18083376pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 14:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lxcokuI14LTINFYBJIro6jOafu63D7leNAKnO07XcgU=;
	b=iaTrL5y3v+L8kCOJrWTeNovNzdQg4kXlQygUF6l4SRtLehZBWuzqCz7uHkkRROt0YF
	Z9HBBbGmyANyjiamKPvt5d/hrBPerLIHXpEztAzzQidrgIWocs0uBR5/1qQ1L+uOJ6ff
	ABfhBfWDBc8cj52QazT0NYjRTbhHvMS8hh5miQ75aaRUdEkY5PfBOV6FDva2iqxP7iYW
	zrJnThrSsdByhFDK2L+16lgw7/SriRFGLEYao5m3YKkFGYmWKDPuDIEIu6N7MUJKdsvQ
	sqQv/tlPj84Bs5ynMK+5b2apGbxCpbOk76Et2Iw44ki9zVzYiiPUPctZtDC2O4va3ieS
	Sljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lxcokuI14LTINFYBJIro6jOafu63D7leNAKnO07XcgU=;
	b=IjA8oDNs7l0Xxs4v+25piMgg1Aqy5+xtwoui+bYQJGzAUpiG7az51tBzCA4sJw9JR1
	yPBCrMQwY1+u6O5gHEiaZnUyNEdShMA3Xcz5UY8mXiooB+Uh+Rq2r0cm5nyyv0Lq4RVF
	i3wic5AoI1ppd8/a348WmOepq8oBAqezjI87mYMk7uc7b5unstMj4OvOLrNOOazlghUu
	Hq3DosQu1Ibnh0JUx2W+RUs6uYU6aWB2Ip5IeNQiLxftmUOuNLTkKQj8b/I98aRRTTkS
	C38fEDKrgzvVTEqsIry2rXeaNWeR7Z82jsSx3fy75tVSPqkyiDy69DZsJBRy2nsa088Z
	hYXg==
X-Gm-Message-State: AMke39lQZsCC14GmxJ789wS7hpeLAkQOIe2MSG/rkVU0d7dXqKbaqZ86eqbACwmrDyCa+g==
X-Received: by 10.98.84.67 with SMTP id i64mr10181020pfb.44.1489011819121;
	Wed, 08 Mar 2017 14:23:39 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	d68sm8016534pfj.92.2017.03.08.14.23.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 14:23:38 -0800 (PST)
Date: Wed, 8 Mar 2017 14:23:33 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Message-ID: <20170308222333.GA2920@haswell>
References: <8f9c4dbb-10b7-25b9-1f38-704645a2eab2@xevo.com>
	<20170308214636.GA17756@haswell>
	<c239faec-410b-99ff-9f0e-8b4c350b460a@xevo.com>
MIME-Version: 1.0
In-Reply-To: <c239faec-410b-99ff-9f0e-8b4c350b460a@xevo.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default rpaths in BUILD_LDFLAGS
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
X-List-Received-Date: Wed, 08 Mar 2017 22:23:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 17-03-08 13:56:12, Martin Kelly wrote:
> On 03/08/2017 01:46 PM, Khem Raj wrote:
> > On 17-03-07 16:43:47, Martin Kelly wrote:
> > > Hi,
> > > 
> > > While debugging an issue with a package that uses llvm-config to compile
> > > with clang, I started hitting [rpaths] QA warnings because some output
> > > executables contained absolute rpaths pointing into my build directory.
> > > After tracing through the issue, I determined the rpaths to eventually be
> > > originating from the setting of BUILD_LDFLAGS in meta/conf/bitbake.conf. The
> > > rpath part of this was added in commit 35759f97 to the poky repo.
> > 
> > thats for native packages alone.
> > 
> 
> You're right, it is for native packages only. That means this issue is
> really specific to clang or other toolchains with similar issues rather than
> being a general issue, which is good.
> 
> In this case, because llvm-config is built natively (as it needs to be run
> on the build host), and because llvm-config populates its --ldflags argument
> with the contents of BUILD_LDFLAGS, then the target build ends up inheriting
> all these flags.
> 
> > > 
> > > In case you're curious about the background of the issue, my project is
> > > using the output of llvm-config --ldflags to set its linker flags.
> > > llvm-config is populating the output --ldflags with whatever it is given for
> > > CXX_LINK_FLAGS. CXX_LINK_FLAGS is being populated by the generic cmake logic
> > > in cmake.bbclass, which is getting its flags from BUILD_LDFLAGS in
> > > meta/conf/bitbake.conf.
> > 
> > I think we shoud not need rpaths for target recipes. We should see if we
> > can just remove it atleast for /lib /usr/lib
> > 
> 
> I agree we should not need them. Of course I can run a sed line to remove
> the rpaths from LLVM_LDFLAGS from tools/llvm-config/BuildVariables.inc (and
> this works just fine). However, I think there's a deeper issue here: All the
> build-time flags that llvm-config spits out (--cppflags, --cflags,
> --cxxflags) probably need to be replaced with target versions of those
> variables.

Its fine to sed it out, we are trying to use llvm-confing in a cross env
and this seems to be less treaded path for it, it assumes you would use
it for building packages natively generally.

> 
> Do you agree with replacing all of those, or do you think we should replace
> only the rpaths?

yes please

