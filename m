Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S3L6T-0008QS-NF
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 06:32:29 +0100
Received: by pbbrp12 with SMTP id rp12so1475710pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 21:23:58 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.239.71 as permitted sender) client-ip=10.68.239.71; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.239.71 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.239.71])
	by 10.68.239.71 with SMTP id vq7mr6646927pbc.79.1330665838246 (num_hops
	= 1); Thu, 01 Mar 2012 21:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MgU6Bb29ZY5siDxMi1INGKgflxn9uUmf5kLyYI8d/cw=;
	b=N6e7TJ9oq6j/utDwUU70xJ0hzOctpRxuUrxjSH2y4prDaSgbm2HY/baxTzfbQo64D+
	IP9ehtZm/u34/f40Ej87CeJ5D/mws2XkZye7DnNFWfY+VpBUm5ICNJBeh/h+zKQSg3Ux
	bM31/6KxLPEd4CwP/gIiSDi70B5IRUc3/kKiYvE8jQfgyq0Ohcz7JBNklG9NNibHR7cO
	6PVKpgaxVB8J9kTy8hHbwT68wsdmLRxA7ZMavhFylRyb74NwzyPx++tLzFsCiI7fYFZY
	KjUTKnidIFmF6mmQo/W8thEOuavVCerd1+PcJB+UQBgTwYY1GracedZPZT24yph/yumc
	dMbA==
Received: by 10.68.239.71 with SMTP id vq7mr5390392pbc.79.1330665838100;
	Thu, 01 Mar 2012 21:23:58 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id e3sm4035662pbr.15.2012.03.01.21.23.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 21:23:56 -0800 (PST)
Date: Thu, 1 Mar 2012 21:23:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120302052348.GA15160@sakrah.homelinux.org>
References: <1330414619-21016-1-git-send-email-james@digitalmatter.com.au>
	<4F4F4A20.9060406@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF33800103@MBX21.4emm.local>
MIME-Version: 1.0
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF33800103@MBX21.4emm.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gdk-pixbuf: Pick up ${NM} from the	environment.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 05:32:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/03/12 03:07), James Limbouris wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Khem Raj
> > Sent: Thursday, 1 March 2012 6:06 PM
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] gdk-pixbuf: Pick up ${NM} from the
> > environment.
> > 
> > On 02/27/2012 11:36 PM, James Limbouris wrote:
> > > Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> > > ---
> > >  .../gdk-pixbuf-2.24.0/configure_nm.patch           |   19
> > +++++++++++++++++++
> > >  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 ++-
> > >  2 files changed, 21 insertions(+), 1 deletions(-)
> > >  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-
> > 2.24.0/configure_nm.patch
> > >
> > > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-
> > 2.24.0/configure_nm.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-
> > 2.24.0/configure_nm.patch
> > > new file mode 100644
> > > index 0000000..1697967
> > > --- /dev/null
> > > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-
> > 2.24.0/configure_nm.patch
> > > @@ -0,0 +1,19 @@
> > > +At this stage of configure, ${NM} has already been correctly set.
> > > +This AC_PATH_PROG overwrites the correct path with a host path.
> > > +
> > > +Upstream-Status: Inappropriate [configuration]
> > > +Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> > > +
> > > +Index: gdk-pixbuf-2.24.0/configure.ac
> > >
> > +=========================================================
> > ==========
> > > +diff -uNr gdk-pixbuf-2.24.0/configure.ac gdk-pixbuf-
> > 2.24.0.mod/configure.ac
> > > +--- gdk-pixbuf-2.24.0/configure.ac	2011-08-27 11:27:52.000000000 +0800
> > > ++++ gdk-pixbuf-2.24.0.mod/configure.ac	2012-02-28
> > 14:48:36.481126410 +0800
> > > +@@ -147,7 +147,6 @@
> > > + AC_SYS_LARGEFILE
> > > +
> > > + AM_PROG_AS
> > > +-AC_PATH_PROG(NM, nm, nm)
> > 
> > you could use AC_CHECK_TOOLS(NM, [$NM nm], nm)
> > here instead of deleting it
> 
> On my system at least, nm has already been found and examined by the config script at this stage.
> The AC_PATH_PROG looks for it a second time, and overwrites the already correct entry.
> So, do we need an AC_CHECK_TOOLS?

its set in environment yes but removing it in not correct
thing from the package perspective. using AC_CHECK_TOOLS makes it work well
in cross environment and native build bahavior is not changed.
More over such a patch will be a welcome in upstream of this package
as well. 

-- 
-Khem


