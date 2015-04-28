Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0E272277
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 02:48:05 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbRzf3qYYz3hhsx;
	Tue, 28 Apr 2015 04:40:46 +0200 (CEST)
X-Auth-Info: MzgCQzRKQyqGtcIMpI1SgyHfi/8LmAPIj0AcWx4h9TQ=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3lbRzf1M04zvhTZ; 
	Tue, 28 Apr 2015 04:40:46 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 28 Apr 2015 03:32:30 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<CAP9ODKoAJsQM77j_NFpM3B3R9MzuBrX5a51ZSpeuQPkphpLyxA@mail.gmail.com>
In-Reply-To: <CAP9ODKoAJsQM77j_NFpM3B3R9MzuBrX5a51ZSpeuQPkphpLyxA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201504280332.30589.marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Add basic fitImage support
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
X-List-Received-Date: Tue, 28 Apr 2015 02:48:07 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sunday, October 19, 2014 at 09:32:11 PM, Otavio Salvador wrote:
> On Sun, Oct 19, 2014 at 5:15 PM, Marek Vasut <marex@denx.de> wrote:
> > This series cleans up the code in kernel.bbclass and
> > separates out the uImage generation. The last patch
> > in this series then adds support for generation of the
> > advanced successor of the uImage, the fitImage.
> > 
> > This series adds only very rudimentary support for
> > generation of fitImage. The advanced features might
> > be added in subsequent patches.
> > 
> > I would also like to thank Richard for explaining to
> > me how to properly do the implementation and I hope
> > this series is at least close to that.
> 
> I really liked the series and I will start testing it; the only remark
> I had is the first patch which says it has no functional change but
> uses a more permissive regexp.

Fixed.

Best regards,
Marek Vasut

