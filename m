Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 24E046D2D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:37:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9O7amMK013260; Thu, 24 Oct 2013 08:36:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q8vQP8xIH6dB; Thu, 24 Oct 2013 08:36:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9O7apBW013258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 24 Oct 2013 08:36:53 +0100
Message-ID: <1382600205.2744.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Riku Voipio <riku.voipio@linaro.org>
Date: Thu, 24 Oct 2013 08:36:45 +0100
In-Reply-To: <CAAqcGHmA8JKz-LEZvN76HzViMwA1P0FtYWLgt0z4oztet0C6fA@mail.gmail.com>
References: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
	<CAMKF1sqpTK+vypxO-2vrHvf34mqfDdF8AK2sgybnd62WtXvn1A@mail.gmail.com>
	<CAAqcGHmA8JKz-LEZvN76HzViMwA1P0FtYWLgt0z4oztet0C6fA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"patches@linaro.org" <patches@linaro.org>
Subject: Re: [PATCH 1/3] ltp: cleanup recipe
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
X-List-Received-Date: Thu, 24 Oct 2013 07:37:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-10-22 at 10:37 +0300, Riku Voipio wrote:
> On 22 October 2013 01:42, Khem Raj <raj.khem@gmail.com> wrote:
> > On Monday, October 21, 2013, Riku Voipio <riku.voipio@linaro.org> wrote:
> >> Cleanups for ltp:
> >>
> >> 1. Instead of using giturl like in Anders's patch use the sourceforge
> >> mirror URL.
> >
> > whats wrong with git url ?
> 
> The previous LTP version in OE used to have tarball url, so I was just
> changing it back. I guess the main functional difference is that git
> url won't have checksums for downloads? Using tarball downloads over
> git checkouts is being more kind to upstream hosting. Mostly a matter
> of taste, or does OE-core have some preferred policy?

The recipe recently changed from using tarballs to using git. There was
a reason for it although offhand, I don't remember what it was. I think
it was mentioned on the list. I just looked at the commit and sadly it
wasn't mentioned there (it should have been). It would be good to decide
which approach the recipe should be using and stick with that...

Cheers,

Richard


