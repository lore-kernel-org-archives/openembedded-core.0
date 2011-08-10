Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QrIIZ-0002EF-UL
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 01:34:56 +0200
Received: by ewy5 with SMTP id 5so742117ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 16:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=U/laoWJsN7FYsAPItfq0pIyftQ2fdFm2mEBIl3bRw+o=;
	b=CzyqpljvQo/DNOMkLE/SJFRwA+0xSE/zAE9CoqyN4Ny0B7LhNP42qgZBepFhVVoznK
	TWuPUtH1ZblngeBYiJv9eYx3NDx+t/dah+QdNAfiRTjufZuAhD3BwrpbdkVI21YYoq3E
	78HoLjHRDqo8DzmjnooaciH4P7035kpcUOolI=
MIME-Version: 1.0
Received: by 10.213.26.219 with SMTP id f27mr378518ebc.76.1313019024781; Wed,
	10 Aug 2011 16:30:24 -0700 (PDT)
Received: by 10.213.14.1 with HTTP; Wed, 10 Aug 2011 16:30:24 -0700 (PDT)
In-Reply-To: <0E977A74-2104-48C7-BE76-E8D5101A794F@dominion.thruhere.net>
References: <1312659111-22327-1-git-send-email-agnel.joel@gmail.com>
	<CAD=GYpZGj1DriKV7hO--fb15_5+yrPts-2dx1LtpHG6FE8NpuQ@mail.gmail.com>
	<0E977A74-2104-48C7-BE76-E8D5101A794F@dominion.thruhere.net>
Date: Wed, 10 Aug 2011 18:30:24 -0500
Message-ID: <CAD=GYpYknoYpBDO2ZAmnCnGwiMaEeHVGLSAiHA9Bx0YZGFbKvw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>
Subject: Re: [PATCH] ti-codec-engine: Use latest CE and update all dependencies
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
X-List-Received-Date: Wed, 10 Aug 2011 23:34:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 10, 2011 at 12:29 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>
> Op 10 aug. 2011 om 17:54 heeft Joel A Fernandes <agnel.joel@gmail.com> het volgende geschreven:
>
>> On Sat, Aug 6, 2011 at 2:31 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
>>> Switch to the latest CE 2.26.02.11 [1] and update all dependencies according to the
>>> release notes [2]. This makes ti-codec-engine to build without any compilation errors
>>>
>>
>> Can this patch be merged in? It is in sync with the ongoing effort of
>> the gstreamer-ti import
>
> but not with master

Hi Koen, the patch applies fine to master. Anything else you're referring to?


