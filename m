Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20150.1589136376356926035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 11:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B7D0E40C14;
	Sun, 10 May 2020 18:46:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xCm_Tb-FS7u; Sun, 10 May 2020 18:46:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7AE6F403F2;
	Sun, 10 May 2020 18:46:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2B9D71730FC; Sun, 10 May 2020 14:46:11 -0400 (EDT)
Date: Sun, 10 May 2020 14:46:11 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Tim Orling <ticotimo@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Steve Sakoman <steve@sakoman.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] pypi.bbclass: mind package suffix on version check
Message-ID: <20200510184611.GG11927@denix.org>
References: <AM7PR05MB68810C07AC538B986CE47C92A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <160D7887899C970D.32017@lists.openembedded.org>
 <CANx9H-CiaTE9ahgRUZO3dU43RBn4AmOKoJ_0Nwk6ph=Be3J0kw@mail.gmail.com>
 <20200510184055.GF11927@denix.org>
 <CANx9H-DDTDXZQcw0A8JkVNS-4Hdsniybgss77_M+20DW4cXtjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-DDTDXZQcw0A8JkVNS-4Hdsniybgss77_M+20DW4cXtjQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 10, 2020 at 11:43:59AM -0700, Tim Orling wrote:
> On Sun, May 10, 2020 at 11:41 AM Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > On Sat, May 09, 2020 at 02:29:09PM -0700, Tim Orling wrote:
> > > This is a candidate for backport to stable once it lands in master.
> >
> > How so?
> >
> 
> It fixes a bug in upgrade check. For users that are on stable releases, who
> might be maintaining their own python packages, they will be affected by
> this.

Ok, that makes sense, thanks.


> > > On Sat, May 9, 2020 at 2:12 PM Tim Orling via lists.openembedded.org
> > > <ticotimo=gmail.com@lists.openembedded.org> wrote:
> > >
> > > > This version looks good.
> > > >
> > > > On Sat, May 9, 2020 at 1:33 PM Konrad Weihmann <kweihmann@outlook.com>
> > > > wrote:
> > > >
> > > >> Some pypi packages do have suffixes like dev, or a0 or b1.
> > > >> When doing a version check on these, the version will get falsely
> > > >> identified as major release versions.
> > > >> Add a terminating slash to rule out those false positives
> > > >>
> > > >> Changes v2:
> > > >>
> > > >> - ignore suffix versions instead of reporting them
> > > >>
> > > >> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> > > >>
> > > >
> > > > Reviewed-by: Tim Orling <ticotimo@gmail.com>
> > > >
> > > > ---
> > > >>  meta/classes/pypi.bbclass | 2 +-
> > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> > > >> index e5d7ab3ce1..ffa8aa3ff4 100644
> > > >> --- a/meta/classes/pypi.bbclass
> > > >> +++ b/meta/classes/pypi.bbclass
> > > >> @@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
> > > >>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
> > > >>
> > > >>  UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/
> > "
> > > >> -UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
> > > >> +UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
> > > >> --
> > > >> 2.20.1
> > > >>
> > > >>
> > > >>
> > > >
> >
> > > 
> >
> >

> 

