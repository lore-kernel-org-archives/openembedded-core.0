Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB2677BEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 15:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 13A8820BEB;
	Tue,  5 Jun 2018 15:47:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gj-37rZupntO; Tue,  5 Jun 2018 15:47:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E1FC72085B;
	Tue,  5 Jun 2018 15:47:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 73DE5163483; Tue,  5 Jun 2018 11:47:33 -0400 (EDT)
Date: Tue, 5 Jun 2018 11:47:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chris Patterson <cjp256@gmail.com>
Message-ID: <20180605154733.GA19965@denix.org>
References: <1526063923-32176-1-git-send-email-cjp256@gmail.com>
	<CABZSBQeejuzPgb1LjjtqSvObDdC59nsHaB3FMsFmpQFoO+bvtA@mail.gmail.com>
	<CABZSBQfe_Enb6Vnn_O0+mr5QiVq6LnLwo1BevQSu7dNa=xwDEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABZSBQfe_Enb6Vnn_O0+mr5QiVq6LnLwo1BevQSu7dNa=xwDEA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] strongswan: package up sbin debug files
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
X-List-Received-Date: Tue, 05 Jun 2018 15:47:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 05, 2018 at 10:39:36AM -0400, Chris Patterson wrote:
> (after looking at it again, I realize I misfired on the prefix tag and
> maintainer CC - will resend)

Actually, wrong list - http://lists.openembedded.org/mailman/listinfo/openembedded-devel


> On Tue, Jun 5, 2018 at 10:35 AM, Chris Patterson <cjp256@gmail.com> wrote:
> > ping :)
> >
> > On Fri, May 11, 2018 at 2:38 PM, Chris Patterson <cjp256@gmail.com> wrote:
> >> From: Chris Patterson <pattersonc@ainfosec.com>
> >>
> >> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> >> ---
> >>  meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
> >> index f2fe1f1..5cae6ac 100644
> >> --- a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
> >> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
> >> @@ -46,7 +46,7 @@ inherit autotools systemd pkgconfig
> >>  RRECOMMENDS_${PN} = "kernel-module-ipsec"
> >>
> >>  FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
> >> -FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
> >> +FILES_${PN}-dbg += "${bindir}/.debug ${sbindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
> >>  FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
> >>  FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
> >>
> >> --
> >> 2.1.4
> >>
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

