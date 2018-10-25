Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8633C60191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 12:44:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9PCiOGC010604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 25 Oct 2018 13:44:26 +0100
Message-ID: <463dbed17206ffb20d05962af4249d64443dbe98.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, Andre McCurdy
	<armccurdy@gmail.com>
Date: Thu, 25 Oct 2018 13:44:24 +0100
In-Reply-To: <4572e29a-3b92-745d-b794-20e514b961a8@windriver.com>
References: <1540441116-366611-1-git-send-email-changqing.li@windriver.com>
	<CAJ86T=Unn7MyQ5jvuuBefA2EfbYprUbkmSVG_9BQBW4+7ej0sg@mail.gmail.com>
	<4572e29a-3b92-745d-b794-20e514b961a8@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: change make install run serially
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
X-List-Received-Date: Thu, 25 Oct 2018 12:44:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-25 at 13:10 +0800, Changqing Li wrote:
> 
> On 10/25/2018 12:59 PM, Andre McCurdy wrote:
> > On Wed, Oct 24, 2018 at 9:18 PM,  <changqing.li@windriver.com>
> > wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > openssl offcially don't supprt parallel make install, and have
> > > occasionally install fail problem for parallel build,
> > > according to upstream suggestion, just make install serially.
> > > 
> > > refer:
> > > 
https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
> > 
> > Wouldn't setting PARALLEL_MAKEINST be cleaner than patching the
> > Makefile?
> 
> You are right, I will resend the patch.

I've commented upstream and I think they're reconsidering this so I'm
going to wait and see if they do take a patch to fix things which we
could then backport.

Cheers,

Richard


