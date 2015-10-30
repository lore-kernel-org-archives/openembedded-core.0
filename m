Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 993E7759B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 00:45:30 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so1045330igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=t/R6l7Hh9Tx+328HF0bD6OphaaxzWqQZvnevB2SDX+k=;
	b=g/8HI09WLjYw1Hln5hTuYQC47dq3PyI7DTkqGFcEss0JogJDReO1yYoBlIDKRypMks
	YQ4scM8r/Ai8b7jKaFPxhmCbdHkyiTirs6r+b3Ra185h0j6cw+q1vRye4nlxE/RnVb1P
	IyH/me4g5g7b9+mLY0VbTzubbLOh175QazA4RdfFoj08pYEZR9VJD4bYmZSvNi8E/spE
	+zYln5Mz+CxmgazTEueZhG4EC7YXhnOz53p17HHlqh8TQ+1rGSyDFFkwrhG3BNzGGzPF
	tMz3Fqwz14i991VvrWJHF/crmItjRbeVlu0mLuFUxgGVaE1akqiDgmI2IcaGF0GpohfO
	rFtw==
X-Received: by 10.50.20.67 with SMTP id l3mr124548ige.75.1446165931146; Thu,
	29 Oct 2015 17:45:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Thu, 29 Oct 2015 17:45:01 -0700 (PDT)
In-Reply-To: <CAH=96PEUtXUaqskW86+bexfU6weUV7NxLsG=vsNitU8E2vkmUw@mail.gmail.com>
References: <CAH=96PEUtXUaqskW86+bexfU6weUV7NxLsG=vsNitU8E2vkmUw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Oct 2015 17:45:01 -0700
Message-ID: <CAMKF1so8xvvEYkOhgcgepnN06uSRDAjcCwwj=HyAvrVvSK0m5A@mail.gmail.com>
To: Logan Buchy <logan.buchy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building firmware recipe with different toolchain
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
X-List-Received-Date: Fri, 30 Oct 2015 00:45:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 3:19 PM, Logan Buchy <logan.buchy@gmail.com> wrote:
> Hi guys,
>
> I have a board which has both a Cortex-A9 and a Cortex-m0+,  The Cortex-A9
> is running the main application with the Linux kernel while the cortex-m0+
> is present to handle some real-time control tasks.
>
> Currently, I am building the cortex-m0+ firmware separately and saving the
> artifacts to an ftp server.  A bb recipe grabs the correct binary from the
> server and incorporates it into the rootfs of the cortex-a9 image.
>
> This works for now, however it makes it a bit more difficult to do
> development on the cortex-m0+ firmware.  I am looking at augmenting the
> recipe so that it will pull the source and build the firmware.  The
> complication is that since it is a completely different architecture, I will
> need to use a different toolchain, CFLAGS and complier options.  I am not
> even sure if this is possible or where to start.
>
> Anyone have any ideas?
>

look into baremetal toolchain in latest OE may be that can help.

> Thanks
> Logan
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

