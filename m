Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 432B060112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 13:54:35 +0000 (UTC)
Received: by ykfs79 with SMTP id s79so163309434ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 05:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZAbVC+gQtZqXK1cM7kfIqSRpAUKqHpUkwcVXAam90ic=;
	b=NyjKc2yP/aX/jW2XnJKmv5I5bmTnZtaJesacexZAXXotEGI04r+7yYVb2IQASdTJTp
	fL628pcK6eWDjo/yawvI9Z6X2VlKgSBjKs3huu/FgiVamMg7Z9S4CnYcHcv4a2KdD/P1
	i/md3LwXvNsKiu1mY9+onzx2wQZPjsZVgEtXPVTyopC3l8QDUPT3Xa/i/xKWdC2OZfay
	uLqcYG2v1iCdHB1jmxxxMrws74gduyJt4gTm5PyZWOEC5nh9w3qrCkvZwX1eAexixqZX
	KTc+ISWbsIfVa1XzjPVd4UymhyErXh6NAtGvB8dNgJ3aQL6iuWwNaywVnFM2LZXI5HuB
	SKlg==
MIME-Version: 1.0
X-Received: by 10.129.128.135 with SMTP id q129mr12866931ywf.325.1448027675662;
	Fri, 20 Nov 2015 05:54:35 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Fri, 20 Nov 2015 05:54:35 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1511200538050.1546@localhost>
References: <alpine.LFD.2.20.1511200538050.1546@localhost>
Date: Fri, 20 Nov 2015 08:54:35 -0500
Message-ID: <CADkTA4MC3rKR=5yZX6EvB=OD7zgp_wMwF9k1w2ESmNJYL2rjFg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can i use qemuppc to demo an example of using UIO?
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
X-List-Received-Date: Fri, 20 Nov 2015 13:54:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 20, 2015 at 5:52 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   i'm not sure i've done enough research to even ask this question
> intelligently, but can i use OE to build and demo what is described
> here?
>
>   http://nairobi-embedded.org/uio_example.html
>
> while that article uses x86_64, i would *prefer* to use qemuppc as
> that is the preferred target architecture, but i can always use x86_64
> in a pinch.
>
>   for a number of OE/embedded linux classes i'm going to be teaching
> next year, i'm trying to shift a number of exercises from needing
> actual hardware to using QEMU images, and this is something i'd dearly
> love to be able to demo using QEMU.
>
>   thoughts? i'm still digging into this, but can anyone point out any
> obvious flaws in my plan? thanks.

It should work. uio is architecture and h/w agnostic for the most part, at
a glance, I don't see anything that jumps out a red flag.

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

