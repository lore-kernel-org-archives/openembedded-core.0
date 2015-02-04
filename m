Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA9C601DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 17:04:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2015 08:59:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,519,1418112000"; d="scan'208";a="661513985"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO
	bottazzini-ThinkPad-T430) ([10.218.99.44])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2015 09:04:21 -0800
Date: Wed, 4 Feb 2015 15:04:03 -0200
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20150204150403.6de4ae70@bottazzini-ThinkPad-T430>
In-Reply-To: <lytwz1zylo.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <bruno.bottazzini@intel.com>
	<1422987664-26903-1-git-send-email-bruno.bottazzini@intel.com>
	<1422987664-26903-2-git-send-email-bruno.bottazzini@intel.com>
	<lytwz1zylo.fsf@ensc-virt.intern.sigma-chemnitz.de>
Organization: Intel
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: update version from 216 to 218
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
X-List-Received-Date: Wed, 04 Feb 2015 17:04:28 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Feb 2015 12:48:35 +0100
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:

> Bruno Bottazzini
> <bruno.bottazzini-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
> 
> > +PACKAGES =+ "${PN}-services-ask-password"
> > +SUMMARY_${PN}-services-ask-password = "systemd's service and tool
> > to query the user for a system password"
> > +RRECOMMENDS_${PN}-services-ask-password = "${PN}-services-base"
> > +FILES_${PN}-services-ask-password = "\
> > +        ${rootprefix}/bin/systemd-ask-password \
> > +        ${rootprefix}/bin/systemd-tty-ask-password-agent \
> > +
> > ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path
> > \
> > +
> > ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path
> > \
> > +
> > ${systemd_unitdir}/system/systemd-ask-password-console.path \
> > +
> > ${systemd_unitdir}/system/systemd-ask-password-console.service \
> > +        ${systemd_unitdir}/system/systemd-ask-password-wall.path \
> > +
> > ${systemd_unitdir}/system/systemd-ask-password-wall.service \ +"
> 
> I think, enumerating services in this kind becomes a maintenance
> nightmare.  E.g. you have to check for every future systemd version
> whether service gets listed in a new .wants.  Using wildcards can
> simplify this; e.g. see systemd_elito_populate_packages() in
> 
>           https://www.cvg.de/people/ensc/systemd_216.bbappend
> 
> 
> Enrico

Enrico,

On your example, wouldn't we have to enumerate the packages too ? 
But now it is on a different place.

Where did you get this file ? I looked into master branch but I
couldn't find it.

Thanks,

Bruno Bottazzini



