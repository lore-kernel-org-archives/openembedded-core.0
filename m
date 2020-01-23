Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0097FD53
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:50:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q6so5111981wro.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=QCmaRCuudVW9U+VVjTl7LXg/6CjnfBC7zP3PFZdwwoA=;
	b=SXnFPj+aOcOcj5EkhdRdfPbpmOA9ynXWamXoymcLj+nMUZAiLhO3pSOaI/46piMfVz
	MzxDkBilYW/Zn2T83l6pyictRNrBR7YzUGi0ndCR7Z3LT2SmbKUuSG0U9DhOn1LQwcxr
	35PNWJ7Ef5qqRqtkquDglOGA3ThtHIMLQV1Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QCmaRCuudVW9U+VVjTl7LXg/6CjnfBC7zP3PFZdwwoA=;
	b=SfGMjcqPaH1jN6qb5KAp8ajpf3WdlUVJvWKJPNjmFzPngY4y93kpjRNQuA7YvxkyBa
	TwTtQnhQMI8iD6FaMnB0qipMIIkMhDArMRqTVUnhcL942hgR3PZcQQnupVc+uzYU+Ait
	d7Y8N8GwfypYLZ1GaeLt1sr016gSXtjvTqIIFZMbARfDBrR5GOjw87ZCa6T4p8/HfkXL
	M8fF8HhsFqUAcTFlQp4jgz/hXOoryfliG52NlSmhF6VQdiQZZcV76WfxRHqOC+t42nMM
	MTkqS1IrN30huRJyG4VmfxkwfBtVbOP8vGGFAxZOFZvbAQ9G/Ezfa0lv8T/mpMHfw8rw
	Jq5g==
X-Gm-Message-State: APjAAAV/iIzooHA5HRtKznulZyQoZ4DNFO5Xu7ptDB3a8hrB5QDUwgSX
	Byf2tmFhYfah7uOo4XSbeeLqV6XZHCA=
X-Google-Smtp-Source: APXvYqwaQkoRAfsrGJZ6bLswrbkPmwp/8edGthvo0HGrW5z28ybBSCUb25Rf+TR99dmKUsKPV4kMhw==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr334411wru.181.1579819846457; 
	Thu, 23 Jan 2020 14:50:46 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 11sm589280wmb.14.2020.01.23.14.50.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 14:50:45 -0800 (PST)
Message-ID: <397a7a14e3efb6d3b72ed67b96bfb196b2ff711a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, Denys Dmytriyenko <denis@denix.org>, Jon Mason
	<jdmason@gmail.com>
Date: Thu, 23 Jan 2020 22:50:44 +0000
In-Reply-To: <6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 22:50:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-23 at 22:17 +0000, Ross Burton wrote:
> On 23/01/2020 21:43, Bruce Ashfield wrote:
> > On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > Many BSPs require ARM Trusted Firmware (also known as Trusted
> > > Firmware-A).
> > > To avoid duplicating efforts of adding very similar recipes to
> > > BSP layers,
> > > add an upstream reference implementation to openembedded-core,
> > > which can be
> > > customized by BSPs, if needed.
> > 
> > Isn't this one of the things that Jon Mason is trying to
> > standardize/support in meta-arm ?
> > 
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> > 
> > What's the delta between the two ?
> 
> That was precisely my thought too.  meta-arm isn't exactly well known 
> right now, but ideally it should be a central place for common pieces 
> that are specific to ARM hardware (unlike anything that is needed for 
> qemuarm itself).

If its needed by many platforms, I'm not adverse to it being in core so
I have an open mind on core vs. meta-arm. I'm waiting to see what Jon's
thoughts are on that.

Cheers,

Richard


