Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id D47CE6E3EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 18:38:24 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id u14so8692511lbd.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 10:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lU3F3+yAPVuTr3Dn4u7oqRAi2SsFIezKwmFIyzGL8hk=;
	b=bwmFisE0jc3Iafoqc/jZO4e22RmgmQ1j7uczz/niKXKA0qO0fZYc8EZGlVioTZuMXE
	mVAmLal/VODqaXdPq6B7sVSnFrZk6h/HXBOy+/NcuyhCKeu/aM04VvoJhUrvIJeG5u8/
	MCNRmXJidMQBROsU8ABTtNRvu81K4RhKedI5KRJPIR3uGcWYsA3iOCtZkzUvkpt0kgvF
	gCWmqVlAVImnf3Hmv8BZPTodwYwyWCcPzzJv24XMFSLkhUPz2Lk/4qjUhtPHnIIJWQQv
	wd984bhhH7dceJrMmEx1gYdHgoaOaG7g4uWwddTd8eEtRaC96FJjZFVXTRzqq9dU5FV9
	1/5g==
MIME-Version: 1.0
X-Received: by 10.112.155.202 with SMTP id vy10mr1876727lbb.31.1392316704587; 
	Thu, 13 Feb 2014 10:38:24 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Thu, 13 Feb 2014 10:38:24 -0800 (PST)
In-Reply-To: <CF224B47.46363%Sanjay_Dorairaj@cable.comcast.com>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
	<CF224B47.46363%Sanjay_Dorairaj@cable.comcast.com>
Date: Thu, 13 Feb 2014 13:38:24 -0500
Message-ID: <CADkTA4OuOY2bXBmzKUNEO6qc2Rpccv9A-1Ns3bdN5dMsMDo1og@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Thu, 13 Feb 2014 18:38:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 13, 2014 at 1:22 PM, Dorairaj, Sanjay
<Sanjay_Dorairaj@cable.comcast.com> wrote:
> Hi Folks,
>
> Can someone let me know the current state of OE support for LXC containers?
> Is the current implementation of LXC support stable enough to be used in a
> fielded product? Has anyone implemented this in their products and if so,
> are there any lessons-learnt or case studies that could be shared?

Everything you need to created, deploy and manage LXC containers is part
of oe-core + meta-virt (and dependencies).

After that, it really depends on what you want to do with the containers .. but
yes, they've been used and deployed on top of a yocto base.

Cheers,

Bruce

>
> I see that there are recipes in place for this -
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/lxc/lxc_0.9.0.bb?h=master
>
> Appreciate the help!
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

