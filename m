Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD826FC4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 16:27:31 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3j00nb2MX5z3hl1R;
	Fri, 19 Sep 2014 18:27:30 +0200 (CEST)
X-Auth-Info: +hvu5oSwE03600WxBMPfmkBE33nEmCHQVTdqANAzZS0=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3j00nZ5cb1zvhTZ; 
	Fri, 19 Sep 2014 18:27:30 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Christopher Larson <clarson@kergoth.com>
Date: Fri, 19 Sep 2014 18:27:30 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1411031735-14721-1-git-send-email-marex@denx.de>
	<201409190906.30763.marex@denx.de>
	<CABcZANkxOj-8VhQvafT5cQP1TDfTmVn=MGDYygkUaxQNtwYezw@mail.gmail.com>
In-Reply-To: <CABcZANkxOj-8VhQvafT5cQP1TDfTmVn=MGDYygkUaxQNtwYezw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201409191827.30418.marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 19 Sep 2014 16:27:38 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, September 19, 2014 at 06:13:46 PM, Christopher Larson wrote:
> On Fri, Sep 19, 2014 at 12:06 AM, Marek Vasut <marex@denx.de> wrote:
> > On Thursday, September 18, 2014 at 03:30:11 PM, Richard Purdie wrote:
> > > On Thu, 2014-09-18 at 11:15 +0200, Marek Vasut wrote:
> > > > Introduce and use nativesdk-packagegroup-python , which contains all
> > > > necessary python components for the native SDK. Make use of this
> > > > package group in buildtools-tarball.bb immediatelly.
> > > 
> > > Specifically, isn't this the list of packages needed to run bitbake and
> > > its associated utils? "python" isn't therefore a particularly good
> > > description of this package?
> > 
> > This is really just and only python packages, nothing else.
> 
> The fact that it only contains python packages doesn't mean it contains all
> python packages, or is somehow generic. It's a specific subset of python
> modules used by bitbake.

OK, so uh, what would be the right solution here to make the toolchain usable? 
As I am no expert, I really don't know what to do now. Can you help please ?

Best regards,
Marek Vasut

