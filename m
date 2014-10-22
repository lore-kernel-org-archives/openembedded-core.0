Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 942FE601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 21:50:11 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jNQNf2FvGz3hjPd;
	Wed, 22 Oct 2014 23:50:10 +0200 (CEST)
X-Auth-Info: UdUg0UOWpa4PlaTFwwTcUgsPRpVFx5qRvvAaYljfBMc=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3jNQNd5CM2zvdWR; 
	Wed, 22 Oct 2014 23:50:09 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 22 Oct 2014 22:39:16 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<201410192313.41430.marex@denx.de>
	<CAP9ODKqJKR6DUCYw5=+28hZr51OUf3di96g5GbzZDKMHHJwYQw@mail.gmail.com>
In-Reply-To: <CAP9ODKqJKR6DUCYw5=+28hZr51OUf3di96g5GbzZDKMHHJwYQw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201410222239.17111.marex@denx.de>
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
X-List-Received-Date: Wed, 22 Oct 2014 21:50:20 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sunday, October 19, 2014 at 11:26:32 PM, Otavio Salvador wrote:
> On Sun, Oct 19, 2014 at 7:13 PM, Marek Vasut <marex@denx.de> wrote:
> > On Sunday, October 19, 2014 at 09:25:36 PM, Otavio Salvador wrote:
> >> On Sun, Oct 19, 2014 at 5:15 PM, Marek Vasut <marex@denx.de> wrote:
> >> > Remove the lambda function setting KERNEL_IMAGETYPE_FOR_MAKE and
> >> > instead set it in the anonymous python function. This also allows us
> >> > to handle image types which are not supported directly by kernel, but
> >> > require some other kernel target to be built. This is the case for
> >> > example with the fitImage, which is the uImage successor.
> >> > 
> >> > There is no functional change.
> >> 
> >> This is not really what the code shows; your regexp is more permissive
> >> than the previous lambda.
> > 
> > Do you happen to have a suggestion how to improve the patch please ? I'm
> > not really a python guru so any help is welcome ...
> 
> I like the code, just the commit log needs improvement as you did
> change the functionality here.

So what do you suggest, just zap the following line from the commit message?
"
There is no functional change.
"

Best regards,
Marek Vasut

