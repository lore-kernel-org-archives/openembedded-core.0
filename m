Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTdaX-0006AG-C3
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 18:59:58 +0100
Received: by iahk25 with SMTP id k25so3304712iah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 09:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p/Z4vuM6KYdkG5ONcVxOhwkgRyuTPjftfyWte6CIHbw=;
	b=r00m2xlgNZ0oIYJXHyHc57g0gfpR8ywsyU9RlJmRUwTRIVIOIUQ4gXLQEs3caC0zOz
	ktJQcM4zMTnOhsAU1EEr199mQJc30t4b+kEfcJlg6zewHDd3Y+acT2UD69nMqV6PCjYn
	oWQkTA6B2FPUzVNfU+HGAiepyeFj2QsMy3iY8=
Received: by 10.43.131.196 with SMTP id hr4mr8446490icc.55.1322157203649;
	Thu, 24 Nov 2011 09:53:23 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id eh34sm89818015ibb.5.2011.11.24.09.53.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 09:53:22 -0800 (PST)
Date: Thu, 24 Nov 2011 10:00:08 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111124180008.GC28767@sakrah.homelinux.org>
References: <4ECBE307.1080600@linaro.org>
 <4ECE77F9.5090703@balister.org>
MIME-Version: 1.0
In-Reply-To: <4ECE77F9.5090703@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Getting started on creating a layer for OE-Core
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
X-List-Received-Date: Thu, 24 Nov 2011 17:59:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/11/11 11:59), Philip Balister wrote:
> On 11/22/2011 12:59 PM, Ken Werner wrote:
> > Hi,
> > 
> > I'm currently reading the OpenEmbedded User Manual and wondering what's
> > the best way to add a layer for the Linaro toolchain components (Linaro
> > GCC, Linaro GDB). This is my first time with OE. I just setup the
> > environment and started to build an image that targets qemuarm (bitbake
> > is still building). Any suggestions or general help is much appreciated.
> 
> Can you comment on what you expect to get out of the Linaro toolchain layer?
> 
> As had been noted here, OE already has some of the Linaro work in the
> toolchains. However, we have had issues with some patches so we can't
> run a "complete Linaro toolchain". (Toolchain guys, correct me if I am
> wrong)


thats correct more often some patches whcih work on arm dont work on
other architectures so the patcheses we cherry pick usually exclude such
regressing patches and its a bit of work to identify them
but on positive side the patches we take get tested on wider
architectures. Also we only take gcc patches no other components

> 
> From my perspective, the Linaro work is great (I primarily use Cortex-A8
> devices), but my understanding is that due to Linaro's focus on advanced
> ARM processors, regressions for other architectures and older arms can
> occur.
> 
> So I see the point of a dedicated Linaro tool layer being an excellent
> vehicle for testing Linaro's work on a diverse set of machines to make
> life easier for people using Linaro's work on other architectures.

linaro layer would be a good idea although I think from distro point of
view they would want a single toolchain doing all architectures and
still would want advantages of linaro work so if this layer takes care
of fixing toolchain for non arm architectures it will be a lot of value
to distros using OE

but as such having layer would be a good thing as well.

> 
> Philip
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


