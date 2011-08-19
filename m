Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuUSi-0005pN-VD
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 21:10:37 +0200
Received: by pzk2 with SMTP id 2so7340003pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 12:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=xVEWuc2HmyawpiQuoFeJfRiqj2TSoS9CA+bYKacRHAM=;
	b=uCSBHyTtuXzERh70BAusetQqfwvxcBA7526FMyNR8SqCEEBeSqkT4eFqsP1YDtGcXS
	wqrfLC0osQMV7moRz04vFNmJO1WCd8cAiG5SnFcWM/j5GF6YUsN6MOOpBR45whkyPsA+
	tFOHnpaYoKjH+ZWHl3KsABtkjcy5VtPXD3nE8=
Received: by 10.142.234.5 with SMTP id g5mr33160wfh.347.1313780755083; Fri, 19
	Aug 2011 12:05:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.40.168 with HTTP; Fri, 19 Aug 2011 12:05:25 -0700 (PDT)
In-Reply-To: <1313774678.13995.123.camel@rex>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
	<e7036174cf607031e13323564f402c7b805e4572.1313730559.git.bruce.ashfield@windriver.com>
	<1313746981.6733.268.camel@phil-desktop>
	<CADkTA4MaaydRfb0YCgXOF1NGZbVcGV3Z+iEAo_qqtxSz57rdyw@mail.gmail.com>
	<1313774678.13995.123.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2011 12:05:25 -0700
Message-ID: <CAMKF1soQ1XdzfQiErfV2muV0dcmUjehmVVKAuA82yx48j_W-yA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto: restoring LINUX_VERSION ?= "3.0"
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
X-List-Received-Date: Fri, 19 Aug 2011 19:10:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 19, 2011 at 10:24 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I'm not 100% convinced that this is a good idea. I'd really prefer the
> kernel accurately reflected the version it was. Can we not do:
>
> PREFERRRED_VERSION_xxx = "3.0%"
>

yes I would prefer that too

> to get around the preferred version issues?
>
> Cheers,
>


