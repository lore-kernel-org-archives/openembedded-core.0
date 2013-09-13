Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB9F6B6BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 17:32:06 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id o20so1433431oag.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=3q3rAL3zNUCwKfS+dHQNo4cgOHKI2vSim4SWLBewJaU=;
	b=pTkkppNd6PPeA/v+5uU8FKC4Qh6kvlfNHlxdD0UBb5drj7FXGTI9CWCuhClMcuUthF
	1s2DU8CA6X0WG84B+b8Y6sICQ1Hja/XfrMQ0qkeWw3OCImIFOVW8+7NM32O8FFWfBHJ+
	k4KLFlguw9MLovUY7ZWirKxt79lparaoL/YVMTZdPAVFhn/eZPMGbRyCrNkb8PiykOMw
	vGYM1KSpLsyWydUV40vQ52yXGpr+iO/Ll+GC92AahcvrwBJmcEn6ncw0JhPSn2OwlyO/
	gfHLhlf4Il/f4hK9eLcIpYP5BCewZQNpLm7OfNcTCszaI61uUh3gjEJjOr2DvYpf8BtN
	4yMw==
MIME-Version: 1.0
X-Received: by 10.60.140.168 with SMTP id rh8mr2523379oeb.76.1379093527946;
	Fri, 13 Sep 2013 10:32:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 13 Sep 2013 10:32:07 -0700 (PDT)
In-Reply-To: <20130913075635.GA3573@ad.chargestorm.se>
References: <20130913075635.GA3573@ad.chargestorm.se>
Date: Fri, 13 Sep 2013 14:32:07 -0300
X-Google-Sender-Auth: IXaxXOGZoh1dQ_7KJlfHd9KBcEo
Message-ID: <CAP9ODKqcm79GME3fKMDQqWvE-h2cB++mFOC9vcr3JjE3B+ywYw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: u-boot-fw-utils -> u-boot-fw-utils-cross
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
X-List-Received-Date: Fri, 13 Sep 2013 17:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 4:56 AM, Anders Darander <anders@chargestorm.se> wrote:
> As I've started to bring our internal distro and machines up to the
> lates oe-core, I've got some issues with the u-boot-fw-utils to
> u-boot-fw-utils-cross transition.

Right.

> In my old branch, I used u-boot-fw-utils_2011.06. This used to compile
> and package fw_printenv(setenv) just fine.
>
> In the new, u-boot-fw-utils-cross_2013.07.bb, fw_printenv is now built
> using HOSTCC instead of the cross-compiler. The old recipe used to
> include:
> EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> as u-boot defaults to build everything under tools/ using HOSTC.

Yes; this is intended to be used in the host. I can add support for
use in target as well (or help you to do it).

> What's the reason for this change? Currently fw_printenv is being built
> for my host system, and not the target...

Yes; the way to proper package it for target is from u-boot itself,
not on this recipe.

> Further more, fw_printenv does not get packaged. I can see that
> fw_printenv is installed in ${WORKDIR}/image, but never moved to
> ${WORKDIR}/package. I guess that this is caused by inheriting
> cross.bbclass?
>
> Am I missing something in my distro config, or have I overlooked
> something else? fw_printenv doesn't really make sense for me to run on
> the host, and is (in my case) rather essential on the target.
>
> I guess that I'm doing something wrong; can anyone give me some hint on
> where to look? Or do we have an issue with the u-boot-fw-utils-cross
> recipe?

No, you are right. I can help you to solve it (or solve it and send
you the solution) if you want.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

