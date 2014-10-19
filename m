Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0620260600
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 21:13:42 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jLYjy4BKfz3hjMJ;
	Sun, 19 Oct 2014 23:13:42 +0200 (CEST)
X-Auth-Info: o3PiohUsr4kribjeH9nm02uFFbHeTH9GprUg08v0aYE=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3jLYjy0828zvdWR; 
	Sun, 19 Oct 2014 23:13:41 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sun, 19 Oct 2014 23:13:41 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-2-git-send-email-marex@denx.de>
	<CAP9ODKqaBcGWTh3e2-TQzqdr7SRFfSRc91R9_ZX=YALOnFhRzw@mail.gmail.com>
In-Reply-To: <CAP9ODKqaBcGWTh3e2-TQzqdr7SRFfSRc91R9_ZX=YALOnFhRzw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201410192313.41430.marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Sun, 19 Oct 2014 21:13:48 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sunday, October 19, 2014 at 09:25:36 PM, Otavio Salvador wrote:
> On Sun, Oct 19, 2014 at 5:15 PM, Marek Vasut <marex@denx.de> wrote:
> > Remove the lambda function setting KERNEL_IMAGETYPE_FOR_MAKE and instead
> > set it in the anonymous python function. This also allows us to handle
> > image types which are not supported directly by kernel, but require some
> > other kernel target to be built. This is the case for example with the
> > fitImage, which is the uImage successor.
> > 
> > There is no functional change.
> 
> This is not really what the code shows; your regexp is more permissive
> than the previous lambda.

Do you happen to have a suggestion how to improve the patch please ? I'm
not really a python guru so any help is welcome ...

Best regards,
Marek Vasut

