Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4C088606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 14:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02F1320901;
	Fri, 21 Oct 2016 14:36:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id E2Lk2s64d3u2; Fri, 21 Oct 2016 14:36:55 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C88EF208EE;
	Fri, 21 Oct 2016 14:36:53 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 17EC0162177; Fri, 21 Oct 2016 10:36:53 -0400 (EDT)
Date: Fri, 21 Oct 2016 10:36:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20161021143653.GC2494@denix.org>
References: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
	<1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1985222.nRgBkrL9KW@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org,
	Olaf Mandel <o.mandel@menlosystems.com>
Subject: Re: [PATCH 0/1] $COREBASE/LICENSE in LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 21 Oct 2016 14:36:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 21, 2016 at 12:29:55PM +1300, Paul Eggleton wrote:
> Hi Olaf,
> 
> On Wed, 19 Oct 2016 10:05:12 Olaf Mandel wrote:
> > I ran into QA issues when inadvertently replacing OEs LICENSE with
> > Yoctos LICENSE file. Why should recipes depend on the license for
> > the complete collection of layers? At least for "normal" recipes
> > that generate target device packages, this makes no sense to me.
> > 
> > I patched out the global LICENSE file from all those recipes that
> > are short enough and where I feel reasonably confident of not
> > having actually changed the claimed license terms in any way.
> 
> Agreed, doing this cleanup makes sense to me. We should especially discourage
> others from referring to this file in their own recipes, and we start by
> showing a good example.

FWIW, we also discussed this topic at OEDEM last week...


> > There are additional recipes that reference the global LICENSE
> > file, but where I am not sure if a less blanket license declaration
> > is appropriate or not. Especially for meta-toolchain and
> > build-appliance-image, the global LICENSE is probably correct.
> > Any comments?
> 
> For images and other recipes that don't pull in anything by themselves, there
> shouldn't be a need for LIC_FILES_CHKSUM (or indeed LICENSE) to be set at all
> - in order to understand the license for the result the appropriate place to
> look is the license manifest that represents everything that goes into the
> image. In fact, in master / morty, if SRC_URI is empty then LIC_FILES_CHKSUM
> is no longer verified [1]. Thus, for such recipes we can remove the setting of
> LIC_FILES_CHKSUM (and LICENSE, if possible) altogether.
> 
> Cheers,
> Paul
> 
> [1] http://cgit.openembedded.org/openembedded-core/commit/?id=c269547ae8e90a78349f6003385137e4145e145f
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

