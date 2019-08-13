Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C17EE7E7BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 19:18:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z11so6861790wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 12:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rvRJMPzVRCJ/WsNItc4ajBXdu89lYgKibsVDDtJJ7Ko=;
	b=VkebOPFKbKNo0LXOVaRTq8VmmgwsCet8GehQ6zFXcGE/DKYY36bkPAyPfTLzGc+H4+
	YQwT9izfp0BSCfv7jxRjk7pwq9lmxMn/sY1pw6JPWqwAmuzQtT5cbl92n9RRaLRJaO4a
	HkI5CsBm3SeWt9MifuR4dwTpY/PfWUJUEZzck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rvRJMPzVRCJ/WsNItc4ajBXdu89lYgKibsVDDtJJ7Ko=;
	b=sqQFl/LanJ2Tf8zaeYQPOFs2E0/KIVs4k5tdRwFj73lkz3EMydAc/9F4TleRZ/5/aF
	OSsY58mND61gHBma/zeF0AKQALRH30eN9WiUJ7K784e4xp4+oRgbCMofnQTiJJLGUqzJ
	Bo6UrEocqpWtBU6cQI9R1T9wDRT7vYnf1HXy124++VC8UOvBQgB8e0CE37mtXXG38xyo
	RJWC536TAUcBioj464rujhnqecpLvNQUbwjOIQrWfKzriOsGfM8Sa7gTqLyuhrIYUku8
	zW5h5XCGSWsUfOdjlK1fU9y1o6M4XqxjIVYMOPls5BHlYWPyiNoLbaWSdt+s29iSA+qe
	XWHg==
X-Gm-Message-State: APjAAAU04eYMTzPctpXs5RjqblFQeOkolJ3eQfqSVN8OoXPm+4X443Hd
	Pyvt9V+ZTjqccaR2uo5JRk7Rfg==
X-Google-Smtp-Source: APXvYqxGiMF0JOLg8ssXAaBDRsj59cMfNtQLHNPaaQx88Rj3HVeWYRSMwAvYjQj3y75DOGQbJSdDWg==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr19908704wrc.354.1565723923498;
	Tue, 13 Aug 2019 12:18:43 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o5sm16758479wrv.20.2019.08.13.12.18.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 12:18:42 -0700 (PDT)
Message-ID: <2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 20:18:41 +0100
In-Reply-To: <33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Tue, 13 Aug 2019 19:18:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-08-13 at 10:04 +0100, Richard Purdie wrote:
> On Mon, 2019-08-12 at 20:26 +0000, Peter Kjellerstedt wrote:
> > Comparing that build to a corresponding do-nothing build with Thud,
> > the time difference matches those three minutes where I have no
> > idea
> > what bitbake is doing now that it didn’t need to do before…
> >  
> > Hopefully these time degradations can be solved, because the
> > current
> > state of bitbake is barely usable. We also need to look into
> > possible
> > ways to improve the cooker output when it is running the setscene
> > tasks so it makes some kind of sense again.
> 
> We talked on irc and you pointed at the commit things started to go
> wrong. Just to summarise things for the benefit of the list, this is
> some quick testing I did:
> 
> "bitbake -p; time bitbake core-image-minimal -n"
> 
> 30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26
> 30.6s a0d941c787cf3ef030d190903279d311bc05d752
> 40.3s 7df31ff36892c2f9c65326b06b4c70 
> 42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e 
> 45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c 
> 76.9s master-next
> 
> So basically the original changes showed a 25% hit but the
> performance
> of -next is dire.
> 
> This is with no hash equiv server configured.
> 
> It will vary depending on the target used (numbers with -sato for the
> above would be interesting for comparision) and how much was or is in
> sstate, they type of sstate mirror configured and so on.
> 
> I really need to focus on getting the new code functioning correctly
> before we attempt to optimise but if nobody tests the new code due to
> performance problems we have a different issue. We also have a
> scaling
> problem with the hash server itself I need to fix to stop the
> autobuilder throwing weird errors. I'm therefore a bit challenged on
> where to start with it all :/.

I had a glance at the profile output from master-next and the problem
wasn't where I thought it would be, it was in the scheduler code. That
is good as those classes are effectively independent of the other
changes and hence are a separate fix.

I've put a patch in -next which takes the above test to 36s which is
close to the older bitbake.

Could be interesting to see how it looks for others and different
workloads.

Cheers,

Richard


