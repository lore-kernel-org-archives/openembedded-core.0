Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 31B906FD28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 07:14:04 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hzmW05Blyz3hhwS;
	Fri, 19 Sep 2014 09:14:04 +0200 (CEST)
X-Auth-Info: fcrwavueEQJgCMbyQwg7GMoxcq95lfXP5aXfJvHRZ/E=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3hzmW01StmzvhTZ; 
	Fri, 19 Sep 2014 09:14:04 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 19 Sep 2014 09:06:30 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1411031735-14721-1-git-send-email-marex@denx.de>
	<1411047011.4736.0.camel@ted>
In-Reply-To: <1411047011.4736.0.camel@ted>
MIME-Version: 1.0
Message-Id: <201409190906.30763.marex@denx.de>
Cc: koen@dominion.thruhere.net, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nativesdk-packagegroup-python: buildtools-tarball: Introduce NativeSDK package group
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
X-List-Received-Date: Fri, 19 Sep 2014 07:14:11 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, September 18, 2014 at 03:30:11 PM, Richard Purdie wrote:
> On Thu, 2014-09-18 at 11:15 +0200, Marek Vasut wrote:
> > Introduce and use nativesdk-packagegroup-python , which contains all
> > necessary python components for the native SDK. Make use of this
> > package group in buildtools-tarball.bb immediatelly.
> 
> Specifically, isn't this the list of packages needed to run bitbake and
> its associated utils? "python" isn't therefore a particularly good
> description of this package?

This is really just and only python packages, nothing else.

Best regards,
Marek Vasut

