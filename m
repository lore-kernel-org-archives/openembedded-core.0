Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2F277C17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Mar 2017 10:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2PARBPa012831; Sat, 25 Mar 2017 10:27:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nHTeKsOmJlz6; Sat, 25 Mar 2017 10:27:11 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2PAR725012826
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 25 Mar 2017 10:27:08 GMT
Message-ID: <1490437627.13980.248.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Andre McCurdy
	<armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Sat, 25 Mar 2017 10:27:07 +0000
In-Reply-To: <f67e1ac46aff43cfb085fd76fe0f60c6@XBOX02.axis.com>
References: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
	<1490287404.13980.231.camel@linuxfoundation.org>
	<f67e1ac46aff43cfb085fd76fe0f60c6@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Using MACHINE_FEATURES in a native recipe
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
X-List-Received-Date: Sat, 25 Mar 2017 10:27:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-03-24 at 15:10 +0000, Peter Kjellerstedt wrote:
> Even though I agree this is a good change and that it should be done,
> I wonder if we can either hold it off until after Pyro has been
> released or make it possible to avoid it? The reason for this is that
> I know that this change will require a huge amount of development
> work for us, something that will not be possible to do in the time
> frame left until Pyro is released. Or alternatively we will have to
> copy native.bbclass to our layers and maintain a fork of it, which
> sucks...
> 
> The reason for this is that our unit test framework is based on
> building all our own packages as native, but still configured via,
> amongst others, MACHINE_FEATURES as if building for the real target.
> This will of course not work anymore if MACHINE_FEATURES is set to ""
> with no way of overriding it.

I'm afraid I only saw this after I merged it :(

I appreciate its a pain but I do think the change is the right thing to
do (maybe with a corresponding DISTRO_FEATURES one too). Hopefully we
can find a way that lets you work around it somehow...

Cheers,

Richard

