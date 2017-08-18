Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EF1FA783AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 15:17:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7IFHGmN020429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 18 Aug 2017 16:17:17 +0100
Message-ID: <1503069436.32591.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Aug 2017 16:17:16 +0100
In-Reply-To: <CAMKF1sqGPrBZ8ods47N3Vkt8jBECbhKEQpfeEDQh80L7MtLMyQ@mail.gmail.com>
References: <20170816033330.43146-1-raj.khem@gmail.com>
	<1503049974.32591.6.camel@linuxfoundation.org>
	<CAMKF1sqGPrBZ8ods47N3Vkt8jBECbhKEQpfeEDQh80L7MtLMyQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 18 Aug 2017 16:17:17 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: Add --tag parameter to libtool invocation
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
X-List-Received-Date: Fri, 18 Aug 2017 15:17:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-08-18 at 07:29 -0700, Khem Raj wrote:
> On Fri, Aug 18, 2017 at 2:52 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Tue, 2017-08-15 at 20:33 -0700, Khem Raj wrote:
> > > 
> > > Fixes errors like
> > > libtool: compile: unable to infer tagged configuration
> > > libtool: compile: specify a tag with `--tag'
> > The patch seems to do a bit more than this?
> > 
> Yes, now it can regenerate configure files like OE does normally.
> This
> change is needed
> for --tag param to work properly with libtool since it uses the cross
> libtool that is copies over from OE by do_configure in normal cases.

Can you update the commit message to mention that please?

I tend to get worried when patches do things in the commit which aren't
mentioned at all in the commit message!

Cheers,

Richard

