Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E940362135
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 00:02:16 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id v190so21016867pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 16:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bx659KBZhGs5viowJoTP8jubyuD0ZWtahJ3SKxMv9vg=;
	b=VJaLlOo7XF3tqJbwGjazfhKK+kSGtINRAThthRqBkFzfEIaoAE3hUpJnXVrzmL4vZJ
	BGVHdzKr8V+aUO337nFXejSMa2flmDKbf2UV54do2rnIAeGQUQ/uSLOgLHsn8GHelT6Y
	xK7CDgNcFAGVy/WWKVEwOKnImzrqw6rzHrY6kbX0+wnn0cseoNU/a7XJqWNskkt+3M/Q
	59YkN2n9QgyMw6Nc5z4JQcJfUsy+SWWf+BRwVQG0mKI+RCcYqiCigIiUYjWbZH9pv2jl
	D7oWAG9M7L+UIRtsh0gAlw1ZhYHiinJ6g8sIjbSN+WVrb6g/XedzZCGt5Du9UnGH//uJ
	jiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bx659KBZhGs5viowJoTP8jubyuD0ZWtahJ3SKxMv9vg=;
	b=ufQMlPGM9Pu5VApYeqtMkOyn1cZt57oFiOhLoaWS2XJ6z0NjmmrXd3FVmAPLYTQjN9
	rtGMn2mJxlQarm9dDCQbd5MZnAyBa03v3JeIa9mlIi7J7HTQo7qzlAVG5rL8lTy4I8tg
	wWHWit6BiaGVeu2cpC++CKA8Pi00HTCBt59b9jFXnE4HlxNLq1QTKZOLz89fdNwR+bF/
	IX5WZ43R/+cYB2+DaCJIdgWzJZbnAz+tqxfGlHh3Wdzw30/olExMUOuOe6Miep62E+si
	BmD5wHGpXZliYWLKU2zJzxBkPUwK3SWgzC2pYprdCsvXM+K9QWEoz0GsXFFri7PTDltJ
	yCkA==
X-Gm-Message-State: AMke39mwjA5aJPnQ8gSG2+1XDl3u+FgsZiqQJxzalyyIuoUE2sJP9GP2jq8tej79/yiVpw==
X-Received: by 10.84.129.67 with SMTP id 61mr12690042plb.16.1489017737860;
	Wed, 08 Mar 2017 16:02:17 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	z68sm8307400pgz.11.2017.03.08.16.02.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 16:02:17 -0800 (PST)
Date: Wed, 8 Mar 2017 16:02:15 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Message-ID: <20170309000212.GB24752@haswell>
References: <8f9c4dbb-10b7-25b9-1f38-704645a2eab2@xevo.com>
	<20170308214636.GA17756@haswell>
	<c239faec-410b-99ff-9f0e-8b4c350b460a@xevo.com>
	<20170308222333.GA2920@haswell>
	<97826fa5-1236-5811-1438-59cae184ba1e@xevo.com>
MIME-Version: 1.0
In-Reply-To: <97826fa5-1236-5811-1438-59cae184ba1e@xevo.com>
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
X-List-Received-Date: Thu, 09 Mar 2017 00:02:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 17-03-08 15:44:52, Martin Kelly wrote:
> On 03/08/2017 02:23 PM, Khem Raj wrote:
> > On 17-03-08 13:56:12, Martin Kelly wrote:
> > > On 03/08/2017 01:46 PM, Khem Raj wrote:
> > > 
> > > I agree we should not need them. Of course I can run a sed line to remove
> > > the rpaths from LLVM_LDFLAGS from tools/llvm-config/BuildVariables.inc (and
> > > this works just fine). However, I think there's a deeper issue here: All the
> > > build-time flags that llvm-config spits out (--cppflags, --cflags,
> > > --cxxflags) probably need to be replaced with target versions of those
> > > variables.
> > 
> > Its fine to sed it out, we are trying to use llvm-confing in a cross env
> > and this seems to be less treaded path for it, it assumes you would use
> > it for building packages natively generally.
> > 
> > > 
> > > Do you agree with replacing all of those, or do you think we should replace
> > > only the rpaths?
> > 
> > yes please
> > 
> 
> Sorry, just to clarify, do you mean "yes, replace all of them", or "yes,
> replace only the rpaths" ? :).

Infact we should not use any part of BUILD_CFLAGS in determining target CFLAGS
intead may be you can replace it with content of TARGET_CFLAGS 

