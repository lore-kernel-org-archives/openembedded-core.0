Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 861046F4D2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 01:54:22 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gf5so3198627lab.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 17:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WubZFprGTqqDgzenb4XLJbILgpF9cBpZO4ACH8vrTO8=;
	b=gDR0f1watNfwmPt5Wx4sFb+YEAtJgWtG/db4x/IXAWiWWIAbtwANmVBpzaK8SNCzHH
	oWayJniRCqBK4PKs/aQamO2T1SAUBpR7aF9wh89lvRVZxnBMOfrNkY+Hc5tg2Ak1uVeb
	OupFou/27yI7cKfVWm2kRc/KrJaE0iGBCIjeq3eVX/VJVygtdsZiBMH7vA+OPQT7EOfv
	BoQN+K0zQJomCQRrsomAMKG2c/GlEgHTrXbDeDoXTsVAWTNR3Yc/Y5i6nKLkdCNfhwDR
	50Aldy6B9f0e5NkfXN/OvLQo4hhWUH0ExRnDRNRlfq53hhA0OL7+NOM2Ve1k7kqrUU+B
	domA==
MIME-Version: 1.0
X-Received: by 10.152.219.132 with SMTP id po4mr9074411lac.41.1393638862524;
	Fri, 28 Feb 2014 17:54:22 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Fri, 28 Feb 2014 17:54:22 -0800 (PST)
In-Reply-To: <1393627333.20876.2.camel@ted>
References: <1393597694-5843-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OEvrDPDPq3-cKsX+_gN_qgR_dEVJKPWvkM2bV1TW0NHQ@mail.gmail.com>
	<1393627333.20876.2.camel@ted>
Date: Fri, 28 Feb 2014 20:54:22 -0500
Message-ID: <CADkTA4M-GiLi15gyUyD-fdsFf=NV0Q4SjWjnHbQRFjxPQ-PSuw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-dev: bump to v3.14-rc4
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
X-List-Received-Date: Sat, 01 Mar 2014 01:54:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 28, 2014 at 5:42 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2014-02-28 at 13:41 -0500, Bruce Ashfield wrote:
>> FYI: Some extended testing with my image-core-kernel-dev image type
>> has shown that lttng and perf have some build issues, so we are
>> finding the issues that we wanted to with this -dev kernel :)
>
> Yes, the autobuilder has shown up a raft of issues in that area.
>
> http://autobuilder.yoctoproject.org/main/tgrid
>
> the line starting 7a30f308b07... is pretty much all kernel related from
> the dev kernel.

Yep, I consider the kernel available to BSp writers at the moment, the rest of
the failures need to be addressed by updating and fixing the packages.

That being said, I can never make heads or tails of those autobuilder
summaries .. what exactly would I click on to see if my builds and the
autobuilder have the same packages causing problems ?

Bruce

>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

