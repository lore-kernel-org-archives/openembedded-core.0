Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id A8B346EAE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 05:46:15 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id k19so257595igc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 21:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ugEAYwETvnOeuiU7rgeowNBPzdsQYWOwPS7Inf+78/E=;
	b=PPouhnYIoO/AtzlWGklbyRKO836IvtnePMEvjFGlaN2cCiDM2K8Of27KEhPVl3mZ2J
	lMUla0n31VbvBIhXtVYPAzRqAPL1WP/QmabS9Bh1dVm/ufpXwAajmSmeBDXXi3FYp2Ot
	KtSwY+syrkaA0DsjybyFXv8AnfIGxKLZmcr6bnjznCf6n0AHNaUkV5/T+sm6nH7xE+I5
	/aGHK64b5kuYxjgKIL1WIHFwDfTutW6db72h7YJZiE75Yv+8a4u4zfHw2ihw2TLksOQ8
	5bADHU4KYv4bDlIVkjq/taqQ0Jd7z3JJlIYXKdeaCKADw+bg8rbADPqNJIb25Nhuz3sQ
	eV5Q==
X-Received: by 10.42.232.206 with SMTP id jv14mr105765icb.52.1392356776090;
	Thu, 13 Feb 2014 21:46:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Thu, 13 Feb 2014 21:45:46 -0800 (PST)
In-Reply-To: <CF224B47.46363%Sanjay_Dorairaj@cable.comcast.com>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
	<CF224B47.46363%Sanjay_Dorairaj@cable.comcast.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2014 21:45:46 -0800
Message-ID: <CAMKF1soewX7=PUH1Wn=D__TqhgDrPYjOVwuhWvsUC2e2BT8_nw@mail.gmail.com>
To: "Dorairaj, Sanjay" <Sanjay_Dorairaj@cable.comcast.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: LXC - linux container support in OE
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
X-List-Received-Date: Fri, 14 Feb 2014 05:46:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi Sanjay

On Thu, Feb 13, 2014 at 10:22 AM, Dorairaj, Sanjay
<Sanjay_Dorairaj@cable.comcast.com> wrote:
> Hi Folks,
>
> Can someone let me know the current state of OE support for LXC containers?
> Is the current implementation of LXC support stable enough to be used in a
> fielded product? Has anyone implemented this in their products and if so,
> are there any lessons-learnt or case studies that could be shared?
>
> I see that there are recipes in place for this -
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/lxc/lxc_0.9.0.bb?h=master
>
> Appreciate the help!

I have deployed containers from yocto however it was using a different
kernel version. We ran into issues when number of containers grew to
be
large, e.g. file sytem accesses on base kernel took the CPU, we also
experienced severe degradation in network traffic when containers grew
larger
than 1000, we were using 1Gig link and there were plans to use 10Gig interfaces.

We experimented first with containers made out of ubuntu system which
were quite large in size and the problems  with file systems showed
very easly
however the yocto containers were very small in size approx 20M in
size compared to 300M ubuntu containers, and we could launch 1000
containers
so the size of the container seemed to matter.

The base system running the container was ubuntu system so we do not
know if systemd could have helped us with resource allocation.

The box underneath was with 16G of RAM with Haswell CPU.



>
> Regards,
>
> Sanjay Dorairaj
> Comcast
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

