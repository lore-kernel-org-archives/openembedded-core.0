Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHHXc-0008Oz-7t
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 18:01:52 +0200
Received: by ywf9 with SMTP id 9so1503524ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vB39eL1XbaIfQxcK5kMNcuDolDFHPte/krj+s7/HsCE=;
	b=hClQItpswRfi6vfhcK9CAXUWxIRsp/9Syvqi/CQ8hRZeBGpbjqNFgGOPysz0JmeLJF
	AoK6lY7AmJVtiqCbj8uNDn9+vJrRVUNr/IX7Z/1FzDb4gMidCOQpL9BN10QjfCE4tI5w
	CCrwXmTE3aOdCKxH7WtF3c/96i1lX97WsZcKs=
Received: by 10.68.71.234 with SMTP id y10mr28482063pbu.132.1319212558048;
	Fri, 21 Oct 2011 08:55:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 21 Oct 2011 08:55:28 -0700 (PDT)
In-Reply-To: <CA+chaQdAQm1jLLJxC1dSUSu+kgo-JqMffVDur=JNxpe-HGczMg@mail.gmail.com>
References: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
	<1318675132-9265-1-git-send-email-Martin.Jansa@gmail.com>
	<1318698176.2342.77.camel@ted>
	<CA+chaQdAQm1jLLJxC1dSUSu+kgo-JqMffVDur=JNxpe-HGczMg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2011 08:55:28 -0700
Message-ID: <CAMKF1srPu8RedacUh0kO5ideB=TwqqCP7Z9Cdstnu6e5SVcY8A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Fri, 21 Oct 2011 16:01:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 21, 2011 at 12:34 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> So I've to change it to
> DRIDRIVERS_append_arm
> or is it TRANSLATED_TARGET_ARCH fault?
>

Yes I think that's what changed it. I think it makes sense to have arm
subfamily in overrides from oe-core


