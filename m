Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 127927DBB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 13:51:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b10so870936wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=/7h5abzpE/2ab0lIFt4E8E7aNOy66VkebILlRta1JYs=;
	b=ceMob5Au7T2W1zPmpoLGd1QfZz0hCVOW+r9qmuAEcwLOSzVyP27ggciIWpWw+di6CU
	yrF7Ph2sMO9cRiJXsT91HTMY4LE05B7HizFSe8r3INIAothdq5fLh0nDXEVJnKWJmpOT
	z/d+1NDoOMEvwRl+2orvgcp9a0HmFg0aDbTkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/7h5abzpE/2ab0lIFt4E8E7aNOy66VkebILlRta1JYs=;
	b=KHglyVSyRm986LpjRKyodcXlPAVyhL6CYtWPrqJ4fj+CXGHGCK4frsmfUVaQ1JYk60
	F7TL74YHvrA9wuB+n1H+I2GqLUCw8RyVvgUNLahX+umYFf42GlnnfTz6WGQxduPq4tdU
	QGoZVhfkw546I+GwowYWeT1kLnlf4s+xrpR2AjF96humQS97PexMSGirO/tz6lzrhP80
	0IeOhLm6nWrSplt/9RoVKu4RwoMcccCpxAXAsIVNCO95a8XIZBL+84djjxectAO7As3I
	sj8YFOMlYRuu4t/rMjG81o5BTHdgJHvBWrz+HAuVOiEFzy8yTp/UWgKqtoWG+GNEaHxl
	WkUw==
X-Gm-Message-State: APjAAAV66KgVCIF+2xJQc13Q7vmXfc1M8WR3ObR9Zd4qzo4VKjFM9CFE
	kZpBw+Lnhxy2bpP41CZo76LTaA==
X-Google-Smtp-Source: APXvYqyAilzriSHI4mXCRCsiQVZyrUt4vTvGm34Cu5fZ4/n4BxNgyfip7ovSmfn1r7m0uxoNLuBYrA==
X-Received: by 2002:a1c:cc15:: with SMTP id h21mr7485284wmb.85.1556545902808; 
	Mon, 29 Apr 2019 06:51:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t18sm429731wrg.19.2019.04.29.06.51.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Apr 2019 06:51:42 -0700 (PDT)
Message-ID: <ec77d08feb85f543bbc79372d276092c10336035.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Bas
	Mevissen <abuse@basmevissen.nl>
Date: Mon, 29 Apr 2019 14:51:40 +0100
In-Reply-To: <CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 29 Apr 2019 13:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-04-29 at 15:47 +0200, Andreas Müller wrote:
> On Mon, Apr 29, 2019 at 2:21 PM Andreas Müller <
> schnitzeltony@gmail.com> wrote:
> > On Mon, Apr 29, 2019 at 12:56 PM Bas Mevissen <abuse@basmevissen.nl
> > > wrote:
> > > On 2019-04-29 11:29, Andreas Müller wrote:
> > > 
> > > (...)
> > > 
> > > > Understood - hope to find time till tomorrow for this. Need to
> > > > find an
> > > > old machine for test because otherwise further fixes might
> > > > remain
> > > > incomplete again.
> > > > 
> > > 
> > > Why not add the g++ option --std=c++11 when test building this
> > > recipe?
> > > 
> > > $cat test.cc
> > > 
> > > #include <string>
> > > 
> > > using namespace std::literals;
> > > 
> > > int main()
> > > {
> > >         return 0;
> > > }
> > > 
> > > 
> > > $ g++ --std=c++17 test.cc -o test
> > > $ g++ --std=c++11 test.cc -o test
> > > test.cc:5:22: error: ‘literals’ is not a namespace-name
> > >      5 | using namespace std::literals;
> > >        |                      ^~~~~~~~
> > > 
> > > -- Bas.
> > Did that but on CFLAGS (copy & paste from another place in recipe)
> > and
> > since issues popped up I thought it was right :(
> > 
> Looked into:
> 
> There is no easy way to get vte-native to build with c++11. Even if -
> patches possibly introduce functional changes/errors (and the result
> of oe-selftest is questionable with a massively patched vte).
> 
> So I see two ways to go:
> 
> 1. set vte-native requirements to c++14. That worked here with
> CXXFLAGS_append_class-native = " --std=c++14" but looking into logs
> of
> centos 7 there are several '--std=gnu++11'. Have no idea where they
> come from so chances are high this patch is going fail with c++14.
> 2. revert vte back to 0.52.2 and forget the idea to get recent
> gnome-terminal back in near future. That requires vte 0.56.1 and was
> the reason I sent the update here.
> 
> My preference is 2.

I'm willing to try testing a c++14 patch if that helps, we can fall
back to 2 if that fails?

Cheers,

Richard


