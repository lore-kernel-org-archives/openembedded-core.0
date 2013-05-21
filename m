Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id C2F276213E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 02:19:17 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id eg20so106819lab.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 19:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CzB6YoY/qEGYlnSOWFrOOisR3xGNb/kaDrCkqspU8+8=;
	b=0nKnKM3+jOg4M1ya78F34MhgKBqmALGfnhTn1n/AKrhfiZbg2fybfge0oiSIfelJwv
	ul0nYXCyqCau4wjHL5d7wwmKDx3pzR9IkNdHtnAbKDKPRMabUkIab2OoNECYThw81b4l
	rnN/1XZTDRpUOBjXi+cEXuSGZYXM91lNGbWdnhMRVvWddVFLSkwn5Kwh0IBFZfBPF2JR
	H2OFaQiAdGR1qma5WF44oPmXquJaPx3HMVh0jurX6kBT9FuuVEsDnqFWO33qRYCwSblt
	qmNUjDE3gnbNubiS1d4DFDzsP61MAalqGZx9iHth6Rz3w/uXNXYZmeijA0K/6rTJGx4c
	GDHQ==
MIME-Version: 1.0
X-Received: by 10.112.147.170 with SMTP id tl10mr348804lbb.100.1369102757311; 
	Mon, 20 May 2013 19:19:17 -0700 (PDT)
Received: by 10.112.162.136 with HTTP; Mon, 20 May 2013 19:19:17 -0700 (PDT)
In-Reply-To: <519A9B1A.2050505@linux.intel.com>
References: <519A9B1A.2050505@linux.intel.com>
Date: Mon, 20 May 2013 22:19:17 -0400
Message-ID: <CADkTA4Py-fhmpWnd43cHwfTCzksJjHNbyXDzGOgXH8dnw85YPw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC-4.8 and Arm Kernel
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
X-List-Received-Date: Tue, 21 May 2013 02:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 20, 2013 at 5:52 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Folks,
>
> We want to move forward to the GCC-4.8 Compiler, what's holding us back
> right now is a kernel update for ARM.  My understanding is there is a patch
> out there, but it needs to be backported and tested. I have checked with
> Bruce A. about this and he has limited availability, but will take a patch
> to the kernel tree if a well tested patch is provide.

And as a clarification follow up, I'm around, but just won't have enough time
at my keyboard to locate, boot and properly test this myself on the 3.4, 3.8
and -dev kernels.

There are plenty of reports and traffic on lkml about gcc 4.8 and the kernel,
and either I missed the silver bullet fix (unlikely) or series of commits that
address the issue we are seeing (more than likely).

Cheers,

Bruce

>
> Thanks
>
> --
>     Sau!
>
> Saul Wold
> Yocto Component Wrangler @ Intel
> Yocto Project / Poky Build System
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

