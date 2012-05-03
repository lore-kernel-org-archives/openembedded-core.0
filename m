Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPxWQ-00078X-NW
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 17:00:46 +0200
Received: by laai10 with SMTP id i10so588166laa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=9VgKzCn1YUSrqtyAG3dTJwq34jPegW3dZB+u/SvGHGk=;
	b=YAIFwigVyF5CXg/MXswgyPKMGVGadtzHV+KFvfsTLGHg98QZUKcbsnusPmEZdcpD9k
	JCa2AK5JuLUqDRQ+f/gReMuype2FjqEyMvjai4SKZUT96aiB6ux7sbBdDW/hDtFdijlF
	TZYAysQxO5nzOySH+M7Y5XeTbICj5h8CMlOxcCmRC4qI/IFeYYPH8avuYQfSs+Xp8hk5
	rFLNsIek2U55sBRKm8GxwdO/q3wqNVg57cbSXFuPpixvUwLumuZkkP8nec0Yb269MYjD
	ud9BPElb7KP0J7q9LGlGiaLFKL1ZkX5HRgR1OFYxSzt85yU/QhZY24It1aZ4jvYpcA/L
	SgNA==
Received: by 10.112.103.8 with SMTP id fs8mr1225063lbb.29.1336056661134; Thu,
	03 May 2012 07:51:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 07:50:30 -0700 (PDT)
In-Reply-To: <20120503144157.GB14648@jama.jama.net>
References: <eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
	<CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
	<20120503054649.GD4658@jama.jama.net> <1336035344.30113.51.camel@ted>
	<20120503092955.GE4658@jama.jama.net> <1336051765.30113.107.camel@ted>
	<1336052808.30113.116.camel@ted> <20120503144157.GB14648@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 07:50:30 -0700
Message-ID: <CAMKF1sr0jbwNYM8LbZyGJz2Uu=cD5=QV=ehvQkQHnEYBFOeuFA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 15:00:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 3, 2012 at 7:41 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>
> So that's why I felt a bit insulted too when it's my fault that I wasn't
> testing all this also on e.g. mips.
>
> And FWIW as soon as I've discovered there is problem with other archs
> I've replied to this patch (saying that other archs need similar patch)
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/021774.html
> and submited site changes for x86/x86-64 where I was able to test it
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/021779.html
>
> So if that's not enough to report there is known problem with such patch
> I cannot do more and I'll rather go out for a walk in such nice weather.

Yes thats a good. Thing.  I think this kind of work might need coordination
where you stage it and others can chime in with respective machine details
I will try to test your patch on arm,mips,ppc and add appropriate
bits. Its better to
discuss the downsides early on.


