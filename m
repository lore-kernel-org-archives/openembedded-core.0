Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD8C6D3E0;
	Fri,  8 Nov 2013 09:33:40 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id p9so1271047lbv.0
	for <multiple recipients>; Fri, 08 Nov 2013 01:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GeNki2JYkoHU8kjoEe53i4Vlg+R5LM+zxHo+paq+Zj0=;
	b=WNxEcI+xhezcZ80ye+yYwH8Tu9A1s1wg2ufVnwIPhWIcwoZfF4ZlSMO2R05PMIpSv6
	0XuQ5VK/5Z8PG7vKnmDpctPAQYG108J62BfLoN6adL3Xa/d1acOoGvDNn2ra8g6VQd4G
	hC9yx0mvekCbT1wS9SvSxIJcLDjXObpkbyxPCIq9V/awk+oYmL4mafZH6RAHdczClEgq
	ncplug3Q/WuVqjA+ZEsGJ87aYy90LMVBg29q5ndJKWtnoFglVbEe97OpLYqzkbWRx0pO
	tZ/V8g8IWTAsPRf9DaiUvtbsXU6aBRsdohcaPJB/9rOhpt39B8RJsvIUHzzhpgLv9ou6
	4jOw==
MIME-Version: 1.0
X-Received: by 10.112.210.197 with SMTP id mw5mr291883lbc.42.1383903221100;
	Fri, 08 Nov 2013 01:33:41 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Fri, 8 Nov 2013 01:33:41 -0800 (PST)
In-Reply-To: <CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
References: <1383866326.6271.286.camel@ted>
	<CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
Date: Fri, 8 Nov 2013 10:33:41 +0100
Message-ID: <CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 09:33:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 8, 2013 at 10:25 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 November 2013 23:18, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> +DISTRO ??= "nodistro"
>
> Wouldn't "oe-core" be a better name, considering that's what
> DISTROVERSION becomes if DISTRO is unset?
>
> Ross


Agreed, we already have DISTRO_VERSION = "oe-core.0"
This sounds also the right name for THE default distro.

My 2 cents

Andrea


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

