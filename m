Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1RW7U6-0000Ro-QX
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 15:19:35 +0100
Received: by ghrr13 with SMTP id r13so1842130ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0DgVmh/dcz0Q6uOtSFQxVRzCNaSGEy01vojcz7kLn6U=;
	b=pK0pffdjaW+HlDKqLZP0dfWQmqOPeWhn7J9CIQclA4Vd0u4EvFRCpRtuPe4uuHArb0
	jDOlpM1+6a0vkrPpAJtFYpBglooBad9OY03X2TbR1ndN2EDDJF1QYHSQjw8/L4ipuqQ8
	lJRIvFLm5VDogv5auAE2Myw5ss9Snz11bOOWA=
MIME-Version: 1.0
Received: by 10.236.22.164 with SMTP id t24mr11576286yht.67.1322748773122;
	Thu, 01 Dec 2011 06:12:53 -0800 (PST)
Received: by 10.236.67.33 with HTTP; Thu, 1 Dec 2011 06:12:53 -0800 (PST)
In-Reply-To: <1322743693.17484.120.camel@ted>
References: <4EC24711.2010805@eukrea.com>
	<CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>
	<1322743693.17484.120.camel@ted>
Date: Thu, 1 Dec 2011 09:12:53 -0500
Message-ID: <CAOd_LFwOiy9hR0M9FjRE5xRdN-HLwQUpMsWqiNKppr6QjvjzKw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
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
X-List-Received-Date: Thu, 01 Dec 2011 14:19:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 1, 2011 at 7:48 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> When you restart the build is the problem persistent or does it work the
> second time?

I set BB_NUMBER_THREADS  = "2" (was 4 when failing)

I tried to restart the build and cleanall just the failing package,
and it still failed.  I then ran:

bitbake -c cleanall gcc-cross gcc-cross-initial gcc-cross-intermediate
gcc-runtime

and after that, everything worked.

> Does someone have a complete console log for a build that failed with
> this they could share?

I'll restart the build and collect one.  So you just want the output
of the console for bitbake?

Thanks,
Cliff

-- 
=================
http://bec-systems.com


