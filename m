Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 52C3E74AB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 20:12:27 +0000 (UTC)
Received: from ted ([192.168.3.30]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4TKCGbQ026811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 29 May 2018 21:12:27 +0100
Message-ID: <1527624735.16911.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 May 2018 21:12:15 +0100
In-Reply-To: <CAMKF1sqSR7chwbVcTVVSqO9Fhg_N=fCqtFK20v=LM1cRe2mO2g@mail.gmail.com>
References: <CAJ86T=VefDA6DSEEj06x5SbBvwDKW2mBfxfivPtFcM0kWPn0dA@mail.gmail.com>
	<CAMKF1sqSR7chwbVcTVVSqO9Fhg_N=fCqtFK20v=LM1cRe2mO2g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
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
X-List-Received-Date: Tue, 29 May 2018 20:12:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-29 at 12:13 -0700, Khem Raj wrote:
> On Tue, May 29, 2018 at 11:41 AM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > 
> > This change looks wrong (or at least incomplete and lacking a
> > decent
> > explanation):
> why do you think it is wrong ? I would be happy to make the
> explanation more decent
> if you have ideas please share.
> 
> > 
> > 
> >   http://git.openembedded.org/openembedded-core/commit/?h=master-ne
> > xt&id=fbec01f01fdad23d95271db063ee0a4d0ab44568
> > 
> > It was never posted to the list but seems to have made it as far as
> > master-next.

I don't know where Ross got the patches from but I've taken over and he
told me the patches in mut were ready. I didn't take this one however.

My concern is the use of "remove" which I really prefer not to use in
OE-Core. In core, its a sign that we have the overall structure wrong
as we should never need to do this.

I'd like to understand why gcc-runtime needs this special treatment and
whether there are other arm tunes which have the same issue? Should we
be tweaking the main tune files in some way instead?

Cheers,

Richard



