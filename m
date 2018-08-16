Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 581FC79246
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5BFA820C46;
	Thu, 16 Aug 2018 02:13:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uf9dqU5g9uPH; Thu, 16 Aug 2018 02:13:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3476920567;
	Thu, 16 Aug 2018 02:13:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C1D2216358D; Wed, 15 Aug 2018 22:13:32 -0400 (EDT)
Date: Wed, 15 Aug 2018 22:13:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mohamed Dawod <mhm.dawod@gmail.com>
Message-ID: <20180816021332.GY19965@denix.org>
References: <CAGCTLNQnjVfwZi71npxavTHPLbxRi04DsLB-SK+kNr5ovEYe_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGCTLNQnjVfwZi71npxavTHPLbxRi04DsLB-SK+kNr5ovEYe_A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: running qt5 apps on wayland image without x11
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
X-List-Received-Date: Thu, 16 Aug 2018 02:13:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 15, 2018 at 05:20:01PM +0200, Mohamed Dawod wrote:
> Hi,
> 
> I am trying to run qt5 application "Qt5-cinematicexperience" on my custom
> image
> I faced the following error :
> ----------
> This application failed to start because it couldnt find or load the
> Qt pltform plugin "xcb".
> Available platform plugins are : eglfs, minimal, minimalegl, offscreen.
> ----------
> I removed x11 from the image and added wayland & weston instead.
> I found that "xcb" is one of the features that should be added to
> PACKAGESCONFIG in case of using x11.
> so the Error is logical but how I makes qt5 app work with wayland ?

DISTRO_FEATURES_remove = "x11"
DISTRO_FEATURES_append = " wayland"


> 
> Thank you,
> -- 
> 
> Mohamed Dawod
> Computer Engineering Department
> Faculty of Engineering
> Cairo University

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


