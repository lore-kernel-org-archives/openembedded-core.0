Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C70E571A52
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 13:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DEAFD20901;
	Thu, 20 Oct 2016 13:24:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GmHceJwxA7hq; Thu, 20 Oct 2016 13:24:43 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7DAA208EE;
	Thu, 20 Oct 2016 13:24:41 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id CDE22162176; Thu, 20 Oct 2016 09:24:40 -0400 (EDT)
Date: Thu, 20 Oct 2016 09:24:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20161020132440.GW2494@denix.org>
References: <58072ca7.c70f420a.fed0f.74b1SMTPIN_ADDED_BROKEN@mx.google.com>
	<432953B0-59CB-4E94-A670-C4BD4A12C88A@gmail.com>
MIME-Version: 1.0
In-Reply-To: <432953B0-59CB-4E94-A670-C4BD4A12C88A@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain and meta-toolchain-qt for specific image
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
X-List-Received-Date: Thu, 20 Oct 2016 13:24:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 19, 2016 at 08:00:12PM -0700, Khem Raj wrote:
> 
> > On Oct 19, 2016, at 1:19 AM, thilo.cestonaro@ts.fujitsu.com wrote:
> > 
> > Hey!
> > 
> > I want to create such a nice toolchain installation package for my image recipe.
> > The problem I currently hit is, that I need to do populate_sdk and populate_sdk_qt5 to have qt5 toolchain too.
> > 
> > Now I had an idea to create a recipe for the SDK like:
> > 
> > ----------
> > SUMMARY = "Meta package for building an installable toolchain"
> > LICENSE = "MIT"
> > 
> > PR = "r0"
> > 
> > inherit populate_sdk populate_sdk_qt5
> > —————
> 
> 
> what is the advantage of such a recipe?

I guess the question is more generic...

The advantages of a separate meta-toolchain* recipe:
* a lot of flexibility
* not tied to a specific image
* can carry a lot of SDK customizations


> > But how can I tell the recipe to additionally install all the "*-dev" packages which my original image recipe installs.
> > When I require the image recipe, the toolchain recipe does a do_rootfs task (which is not needed, as it is done by building the image).
> > 
> > I read something about TOOLCHAIN_TARGET_TASK and adding all the "*-dev" packages I want to this. But that doesn't work.
> > 
> > Any hints?
> > 
> > cheers,
> > Thilo--
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 



> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


